{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppTreeVw;

interface

{$I ppIfDef.pas}

uses
   Windows, CommCtrl, SysUtils, Controls, ComCtrls, Classes, Graphics, ExtCtrls, Menus,
   Messages,  StdCtrls, Forms,
   ppComm, ppClass, ppBands, ppCmpReg, ppTypes, ppUtils, ppSubRpt, ppReport,
   ppRegion, ppTb97x, ppMetaB, ppCtrls, ppDB, Dialogs;

const
  cMaxNode = 299;
  cMaxView = 5;

type
  TppReportListView = class;

  TppReportTreeViewClass = class of TppReportTreeView;
  TppReportListViewClass = class of TppReportListView;


  { TppBevel}   {note: adds caption property}
  TppBevel = class(TBevel)
    private
      FCaption: String;
      FFont: TFont;

      procedure SetCaption(aCaption: String);
      procedure SetFont(aFont: TFont);

    protected
      procedure Paint; override;

    public
      constructor Create(Owner: TComponent); override;
      destructor Destroy; override;

      property Caption: String read FCaption write SetCaption;
      property Font:TFont read FFont write SetFont;

    end; {class, TppBevel}


  { TppClassImageList}
  TppClassImageList = class(TImageList)
    private
      FClassNames: TStrings;

      procedure Init;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      function IndexOfClass(aClassName: String): Integer;

    end; {class, TppClassImageList}


  TppMessageEvent = procedure(Sender: TObject; aMessage: String) of object;

  TppReportViewType = (ppvtAll, ppvtBands, ppvtData, ppvtCustom);

  TppTreeStateRec = record
    Saved: Boolean;
    SelectedIndex: Integer;
    NodeStates: array [0..cMaxNode] of Boolean;
  end;

  {TppTreeStates }
  TppTreeStates = class
    FTreeStates: array [0..cMaxView] of TppTreeStateRec;
    FTreeView: TTreeView;

    public
      constructor Create(aTreeView: TTreeView); virtual;

      procedure Clear;
      procedure Save(aIndex: Integer);
      function Restore(aIndex: Integer): Boolean;

      property TreeView: TTreeView read FTreeView write FTreeView;

    end; {class, TppTreeStates}


  TppTreeBuilder = class;

  { TppReportTreeView }
  TppReportTreeView = class(TTreeView)
    private
      FAfterBuildTree: TNotifyEvent;
      FBeforeBuildTree: TNotifyEvent;
      FBuilding: Boolean;
      FCaption: String;
      FDisableUpdates: Integer;
      FImageList: TppClassImageList;
      FReport: TppCustomReport;
      FOnMessage: TppMessageEvent;
      FAllowDrag: Boolean;
      FTreeBuilder: TppTreeBuilder;
      FShowRoot: Boolean;

      procedure SetClassImages(aClassImageList: TppClassImageList);
      procedure SetShowRoot(aValue: Boolean);

    protected

      procedure DoAfterBuildTree; virtual;
      procedure DoBeforeBuildTree; virtual;
      procedure DoOnMessage(aMessage: String); virtual;
      function  GetSelectedComponent: TComponent; virtual;
      procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
      procedure SetReport(aCustomReport: TppCustomReport); virtual;
      procedure SetTreeBuilder(aTreeBuilder: TppTreeBuilder); virtual;
      procedure KeyDownEvent(Sender: TObject; var Key: Word; Shift: TShiftState); virtual;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure BuildTree; virtual;
      procedure Rebuild; virtual;
      procedure BeginUpdate;
      procedure EndUpdate;

      function FindNode(aText: String; var aTreeNode: TTreeNode): Boolean;
      function FindComponentNode(aComponent: TComponent; var aTreeNode: TTreeNode): Boolean;

      procedure AddComponent(aComponent: TComponent);
      procedure RemoveComponent(aComponent: TComponent);
      procedure UpdateComponent(aComponent: TComponent);
      procedure SelectComponent(aComponent: TComponent);
      procedure DisplayHelp;

      property TreeBuilder: TppTreeBuilder read FTreeBuilder write SetTreeBuilder;

      property AllowDrag: Boolean read FAllowDrag write FAllowDrag;
      property Building: Boolean read FBuilding;
      property Caption: String read FCaption write FCaption;
      property ClassImages: TppClassImageList read FImageList write SetClassImages;
      property Report: TppCustomReport read FReport write SetReport;
      property SelectedComponent: TComponent read GetSelectedComponent;
      property ShowRoot: Boolean read FShowRoot write SetShowRoot;

      {events}
      property BeforeBuildTree: TNotifyEvent read FBeforeBuildTree write FBeforeBuildTree;
      property AfterBuildTree: TNotifyEvent read FAfterBuildTree write FAfterBuildTree;
      property OnMessage: TppMessageEvent read FOnMessage write FOnMessage;

    end; {class, TppReportTreeView}


  {TppTreeBuilder }
  TppTreeBuilder = class
    private
      FTreeView: TppReportTreeView;
      FComponents: TList;
      FComponentNodes: TStringList;

    protected
      property Components: TList read FComponents;
      property ComponentNodes: TStringList read FComponentNodes;

    public
      constructor Create(aTreeView: TppReportTreeView); virtual;
      destructor Destroy; override;

      procedure BuildTree; virtual;

      function GetClassImageIndex(aClassName: String): Integer;
      function GetComponentForNode(aTreeNode: TTreeNode): TComponent;
      function GetHelpContext: String; virtual;
      function GetHelpFileName: String; virtual;
      function GetReport: TppBandedReport;

      function FindNode(aText: String; var aTreeNode: TTreeNode): Boolean;
      function FindComponentNode(aComponent: TComponent; var aTreeNode: TTreeNode): Boolean;

      procedure AddComponent(aComponent: TComponent);  virtual;
      procedure RemoveComponent(aComponent: TComponent); virtual;

      procedure SelectFirstNode;

      property TreeView: TppReportTreeView read FTreeView write FTreeView;

  end; {class, TppTreeBuilder}



  {TppReportObjectTreeBuilder }
  TppReportObjectTreeBuilder = class(TppTreeBuilder)
    private
      FShowGroups: Boolean;

    protected
      function AddGroupNode(aParentNode: TTreeNode; aGroup: TppGroup): TTreeNode; virtual;
      procedure AddBandNode(aParentNode: TTreeNode; aBand: TppBand); virtual;
      procedure AddObjectNode(aParentNode: TTreeNode; aObject: TppComponent); virtual;

      function GetNextSiblingNodeForBand(aBand: TppBand): TTreeNode;
      function GetPriorSiblingNodeForBand(aBand: TppBand): TTreeNode;

    public
      constructor Create(aTreeView: TppReportTreeView); override;

      procedure AddComponent(aComponent: TComponent); override;
      procedure BuildTree; override;

      property ShowGroups: Boolean read FShowGroups write FShowGroups;

  end; {class, TppReportObjectTreeBuilder}


  {TppReportBandTreeBuilder }
  TppReportBandTreeBuilder = class(TppReportObjectTreeBuilder)
    private

    protected

      procedure AddObjectNode(aParentNode: TTreeNode; aObject: TppComponent); override;

    public

  end; {class, TppReportBandTreeBuilder}


  {TppReportOutlineTreeBuilder }
  TppReportOutlineTreeBuilder = class(TppTreeBuilder)
    private
      procedure AddChildReportNode(const aCaption: String; aChildReport: TppChildReport);

    protected

    public
      procedure AddComponent(aComponent: TComponent); override;
      procedure BuildTree; override;
      function GetHelpContext: String; override;

  end; {class, TppReportOutlineTreeBuilder}



  {TppDataTreeBuilder }
  TppDataTreeBuilder = class(TppTreeBuilder)
    private
      FDataPipelineList: TppDataPipelineList;
      FDisplayFields: Boolean;

    protected
      function  AddPipelineParentNode(aDataPipeline: TppDataPipeline): TTreeNode;
      procedure AddPipelineNode(aDataPipeline: TppDataPipeline);
      procedure AddFieldNode(aField: TppField);

      procedure DataPipelineListChangeEvent(Sender: TObject);

    public
      constructor Create(aTreeView: TppReportTreeView); override;
      destructor Destroy; override;

      procedure AddComponent(aComponent: TComponent); override;
      procedure BuildTree; override;
      function GetHelpContext: String; override;

      property DisplayFields: Boolean read FDisplayFields write FDisplayFields default False;

  end; {class, TppDataTreeBuilder}




  TppReportListItemType = (ppitObjects, ppitVariables, ppitDataFields, ppitCustom);
  TppReportListItemTypes = set of TppReportListItemType;

  TppListViewFilterObjectEvent = procedure(aObject: TppCommunicator; var aAccept: Boolean) of object;
  TppListViewGetCheckedEvent   = procedure(aListItem: TListItem; var aChecked: Boolean) of object;


  TppListColumnEvent = procedure(aListView: TListView; aColumn: TListColumn) of object;

  TppDrawEnabledItemEvent = procedure(Sender: TCustomListView; aItem: TListItem; var aEnabled: Boolean) of object;


{$IFNDEF Delphi4}
  TLVDrawItemEvent = procedure(Sender: TCustomListView; Item: TListItem;
    Rect: TRect; State: TOwnerDrawState) of object;

  TLVSelectItemEvent = procedure(Sender: TObject; Item: TListItem;
    Selected: Boolean) of object;
    
{$ENDIF}

  {TppListStates }
  TppListStates = class
    FListStates: TStringList;
    FListView: TListView;

    public
      constructor Create(aListView: TListView); virtual;
      destructor Destroy; override;

      procedure Clear;
      procedure Save(aIndex: Integer);
      procedure Restore(aIndex: Integer);

      property ListView: TListView read FListView write FListView;

    end; {class, TppListStates}


  {TppListView - add the following capabilities:
          1. Custom Draw functionality
          2. OnColumnResize event
          3. Vertical and Horizontal Scrolling events}

  {TppListView}
  TppListView = class(TListView)
    private
      FDrawEnabledItems: Boolean;
      FItemBitmap: TBitmap;
      FOnDrawEnabledItem: TppDrawEnabledItemEvent;
      FOnColumnResize: TppListColumnEvent;
      FOnVerticalScroll: TNotifyEvent;
      FOnHorizontalScroll: TNotifyEvent;
      FOnScroll: TNotifyEvent;
{$IFNDEF Delphi5}
      FCustomPopup: TPopupMenu;
{$ENDIF}

{$IFNDEF Delphi4}
      FCanvas: TCanvas;
      FOwnerDraw: Boolean;
      FOnDrawItem: TLVDrawItemEvent;
      FOnSelectItem: TLVSelectItemEvent;
      FOnResize: TNotifyEvent;
{$ENDIF}

{$IFNDEF Delphi4}
      procedure SetOwnerDraw(Value: Boolean);
      procedure CNDrawItem(var Message: TWMDrawItem); message CN_DRAWITEM;
      procedure CNNotify(var Message: TWMNotify); message CN_NOTIFY;
{$ENDIF}

      procedure WMNotify(var Message: TWMNotify); message WM_NOTIFY;

      {scrolling notifiction messages}
      procedure WMVScroll(var Message: TWMHScroll); message WM_VSCROLL;
      procedure WMHScroll(var Message: TWMVScroll); message WM_HSCROLL;

      procedure SetDrawEnabledItems(aValue: Boolean);

    protected
    
{$IFNDEF Delphi5}
    {prior to D5, popup menu does not work and must be fired manually from MouseUp}
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
{$ENDIF}

{$IFNDEF Delphi4}
      procedure CreateParams(var Params: TCreateParams); override;
      procedure DrawItem(Item: TListItem; Rect: TRect; State: TOwnerDrawState); virtual;
      procedure Resize; virtual;
{$ELSE}
      procedure DrawItem(Item: TListItem; Rect: TRect; State: TOwnerDrawState); override;

{$ENDIF}

      procedure DrawEnabledItem(Item: TListItem; Rect: TRect; State: TOwnerDrawState); virtual;

      procedure DoColumnResize(aColumn: TListColumn); virtual;
      procedure DoVerticalScroll; virtual;
      procedure DoHorizontalScroll; virtual;
      procedure DoScroll; virtual;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

{$IFNDEF Delphi4}
      procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;


      property Canvas: TCanvas read FCanvas;
      property OwnerDraw: Boolean read FOwnerDraw write SetOwnerDraw default False;
      property OnDrawItem: TLVDrawItemEvent read FOnDrawItem write FOnDrawItem;
      property OnSelectItem: TLVSelectItemEvent read FOnSelectItem write FOnSelectItem;
      property OnResize: TNotifyEvent read FOnResize write FOnResize;
{$ENDIF}

{$IFNDEF Delphi5}
      {CustomPopup is needed prior to D5}
      property CustomPopup: TPopupMenu read FCustomPopup write FCustomPopup;
{$ENDIF}

      property DrawEnabledItems: Boolean read FDrawEnabledItems write SetDrawEnabledItems;
      property OnDrawEnabledItem: TppDrawEnabledItemEvent read FOnDrawEnabledItem write FOnDrawEnabledItem;

      property OnColumnResize: TppListColumnEvent read FOnColumnResize write FOnColumnResize;
      property OnVerticalScroll: TNotifyEvent read FOnVerticalScroll write FOnVerticalScroll;
      property OnHorizontalScroll: TNotifyEvent read  FOnHorizontalScroll write FOnHorizontalScroll;
      property OnScroll: TNotifyEvent read FOnScroll write FOnScroll;

  end; {class, TppListView}



  {TppGrippyBitmap }
  TppGrippyBitmap = class(TppMetaBitmap)
    protected
      procedure Draw(aCanvas: TCanvas); override;

    public
      constructor Create; override;

  end; {class, TppGrippyBitmap}


  TppListBuilder = class;

  { TppReportListView }
  TppReportListView = class(TppListView)
    private
      FAllowDrag: Boolean;
      FBuilding: Boolean;
      FImage: TBitmap;
      FItemBitmap: TBitmap;
      FCaption: String;
      FCurrentObject: TObject;
      FCurrentTreeNode: TTreeNode;
      FDisableUpdates: Integer;
      FImageList: TppClassImageList;
      FOnAfterBuildList: TNotifyEvent;
      FOnBeforeBuildList: TNotifyEvent;
      FOnMessage: TppMessageEvent;
      FListBuilder: TppListBuilder;
      
      procedure SetClassImages(aClassImageList: TppClassImageList);


   protected
      procedure DoAfterBuildList; virtual;
      procedure DoBeforeBuildList; virtual;
      procedure DoOnMessage(aMessage: String); virtual;
      function  GetSelectedComponent: TComponent;
      procedure SetCurrentObject(aCurrentObject: TObject); virtual;
      procedure SetListBuilder(aListBuilder: TppListBuilder); virtual;

      procedure DragOver(Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean); override;
      procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
      procedure DoEndDrag(Target: TObject; X, Y: Integer); override;
      procedure DefaultOwnerDraw(Item: TListItem; Rect: TRect; State: TOwnerDrawState);

      procedure DrawItem(Item: TListItem; Rect: TRect; State: TOwnerDrawState); override;
      procedure KeyDownEvent(Sender: TObject; var Key: Word; Shift: TShiftState); virtual;


    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure BuildList; virtual;
      procedure BeginUpdate;
      procedure EndUpdate;

      procedure AddComponent(aComponent: TComponent);
      procedure DisplayHelp;
      function  FindComponentItem(aObject: TObject; var aListItem: TListItem): Boolean;
      procedure RemoveComponent(aComponent: TComponent);
      procedure UpdateComponent(aComponent: TComponent);
      procedure SelectComponent(aObject: TObject);
      procedure LanguageChanged; virtual;

      property AllowDrag: Boolean read FAllowDrag write FAllowDrag;
      property Building: Boolean read FBuilding;
      property ClassImages: TppClassImageList read FImageList write SetClassImages;
      property CurrentObject: TObject read FCurrentObject write SetCurrentObject;
      property CurrentTreeNode: TTreeNode read FCurrentTreeNode write FCurrentTreeNode;
      property Caption: String read FCaption write FCaption;
      property SelectedComponent: TComponent read GetSelectedComponent;
      property ListBuilder: TppListBuilder read FListBuilder write SetListBuilder;

      {events}
      property OnAfterBuildList: TNotifyEvent read FOnAfterBuildList write FOnAfterBuildList;
      property OnBeforeBuildList: TNotifyEvent read FOnBeforeBuildList write FOnBeforeBuildList;
      property OnMessage: TppMessageEvent read FOnMessage write FOnMessage;

    end; {class, TppReportListView}


  {TppListBuilder }
  TppListBuilder = class
    private
      FListView: TppReportListView;

      function GetCurrentObject: TObject;

    protected

    public
      constructor Create(aListView: TppReportListView); virtual;
      destructor Destroy; override;

      procedure BuildList; virtual;

      function GetClassImageIndex(aClassName: String): Integer;
      function GetHelpContext: String; virtual;
      function GetHelpFileName: String; virtual;

      function  FindComponentItem(aObject: TObject; var aListItem: TListItem): Boolean;
      procedure LanguageChanged; virtual;
      procedure EndDrag(aSource, aTarget: TComponent); virtual;

      procedure AddComponent(aComponent: TComponent);  virtual;
      procedure RemoveComponent(aComponent: TComponent); virtual;

      property ListView: TppReportListView read FListView write FListView;
      property CurrentObject: TObject read GetCurrentObject;

  end; {class, TppListBuilder}



  {TppObjectListBuilder }
  TppObjectListBuilder = class(TppListBuilder)
    private

    protected
      procedure AddBand(aBand: TppBand); virtual;
      procedure AddObject(aObject: TppComponent); virtual;

    public
      constructor Create(aListView: TppReportListView); override;

      procedure AddComponent(aComponent: TComponent);  override;
      procedure BuildList; override;
      procedure EndDrag(aSource, aTarget: TComponent); override;

  end; {class, TppObjectListBuilder}



  {TppVariableListBuilder }
  TppVariableListBuilder = class(TppObjectListBuilder)
    private

    public

      procedure AddComponent(aComponent: TComponent);  override;
      procedure BuildList; override;
      procedure EndDrag(aSource, aTarget: TComponent); override;

  end; {class, TppVariableListBuilder}

  

  {TppFieldListBuilder }
  TppFieldListBuilder = class(TppListBuilder)
    private
      procedure UpdateCaption;

    public
      constructor Create(aListView: TppReportListView); override;

      procedure AddComponent(aComponent: TComponent);  override;
      procedure BuildList; override;
      function GetHelpContext: String; override;
      procedure LanguageChanged; override;

  end; {class, TppFieldListBuilder}


  TppExplorerOrientation = (ppeoHorizontal, ppeoVertical);

  {TppCustomReportExplorer}
  TppCustomReportExplorer = class
    private
      FImageList: TppClassImageList;
      FLanguageIndex: Longint;
      FParent: TWinControl;
      FReport: TppCustomReport;
      FShowTitleBar: Boolean;
      FSplitter: TSplitter;
      FListPanel: TPanel;
      FListTitleBar: TppBevel;
      FListView: TppReportListView;
      FTreePanel: TPanel;
      FTreeTitleBar: TppBevel;
      FTreeView: TppReportTreeView;
      FOnMessage: TppMessageEvent;
      FOnBeforeEdit: TNotifyEvent;
      FOnAfterEdit: TNotifyEvent;
      FOnTreeViewChange: TTVChangedEvent;
      FTreeBuilder: TppTreeBuilder;
      FListBuilder: TppListBuilder;
      FTreeStates: TppTreeStates;
      FListStates: TppListStates;

      function  GetListCaption: String;
      function  GetTreeCaption: String;
      procedure SetLanguage(aLanguageIndex: Longint);
      procedure SetListCaption(aCaption: String);
      procedure SetTreeCaption(aCaption: String);

    protected
      class function GetReportTreeViewClass: TppReportTreeViewClass; virtual;
      class function GetReportListViewClass: TppReportListViewClass; virtual;

      procedure BuildListEvent(Sender: TObject); virtual;
      procedure DoOnMessage(aMessage: String); virtual;
      procedure DoOnBeforeEdit; virtual;
      procedure DoOnAfterEdit; virtual;
      procedure SetReport(aReport: TppCustomReport); virtual;
      procedure SetShowTitlebar(aValue: Boolean);
      procedure TreeViewAfterBuildEvent(Sender: TObject); virtual;
      procedure TreeViewChangeEvent(Sender: TObject; Node: TTreeNode); virtual;
      procedure LanguageChanged; virtual;

      procedure TreeViewEditingEvent(Sender: TObject; Node: TTreeNode; var AllowEdit: Boolean); virtual;
      procedure TreeViewEditedEvent(Sender: TObject; Node: TTreeNode; var S: string); virtual;
      procedure ListViewEditingEvent(Sender: TObject; Item: TListItem; var AllowEdit: Boolean); virtual;
      procedure ListViewEditedEvent(Sender: TObject; Item: TListItem; var S: string); virtual;
      procedure ChildMessageEvent(Sender: TObject; aMessage: String);

      property TreeBuilder: TppTreeBuilder read FTreeBuilder write FTreeBuilder;
      property ListBuilder: TppListBuilder read FListBuilder write FListBuilder;

    public
      constructor Create(aParent: TWinControl; aOrientation: TppExplorerOrientation); virtual;
      destructor Destroy; override;

      procedure ClearState;
      procedure SaveState(aIndex: Integer);
      procedure RestoreState(aIndex: Integer);
      procedure Refresh;

      property ListCaption: String read GetListCaption write SetListCaption;
      property ListPanel: TPanel read FListPanel;
      property ListView: TppReportListView read FListView;
      property Report: TppCustomReport read FReport write SetReport;
      property ShowTitleBar: Boolean read FShowTitleBar write SetShowTitleBar;
      property Splitter: TSplitter read FSplitter;
      property TreeCaption: String read GetTreeCaption write SetTreeCaption;
      property TreePanel: TPanel read FTreePanel;
      property TreeView: TppReportTreeView read FTreeView;
      property TreeTitleBar: TppBevel read FTreeTitleBar;
      property ListTitleBar: TppBevel read FListTitleBar;

      {events}
      property OnMessage: TppMessageEvent read FOnMessage write FOnMessage;
      property OnAfterEdit: TNotifyEvent read FOnAfterEdit write FOnAfterEdit;
      property OnBeforeEdit: TNotifyEvent read FOnBeforeEdit write FOnBeforeEdit;

      property OnTreeViewChange: TTVChangedEvent read FOnTreeViewChange write FOnTreeViewChange;

    end;  {class, TppCustomReportExplorer}

implementation

uses ppVar;


{******************************************************************************
 *
 ** G R I P P Y   I M A G E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppGrippyBitmap.Draw(aCanvas: TCanvas) }

constructor TppGrippyBitmap.Create;
begin

  inherited Create;

  BackGroundColor := clBtnFace;

  Height := 12;
  Width  := 12;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppGrippyBitmap.Draw(aCanvas: TCanvas) }

procedure TppGrippyBitmap.Draw(aCanvas: TCanvas);
var
  liX: Integer;
  liY: Integer;

begin

  liX := 1;
  liY := 2;

  while liY <= 8 do
    begin

      aCanvas.Pixels[liX, liY]     := clWhite;
      aCanvas.Pixels[liX+1, liY+1] := clBlack;

      Inc(liY, 3);

    end;

  liX := 4;
  liY := 1;

  while liY <= 7 do
    begin

      aCanvas.Pixels[liX, liY]     := clWhite;
      aCanvas.Pixels[liX+1, liY+1] := clBlack;

      Inc(liY, 3);

    end;

  liX := 7;
  liY := 2;

  while liY <= 8 do
    begin

      aCanvas.Pixels[liX, liY]     := clWhite;
      aCanvas.Pixels[liX+1, liY+1] := clBlack;

      Inc(liY, 3);

    end;

end;  {procedure, DrawImage}

{******************************************************************************
 *
 ** B E V E L  (note: adds a caption property)
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppBevel.Create }

constructor TppBevel.Create(Owner: TComponent);
begin
  inherited Create(Owner);

  FCaption := '';
  FFont := TFont.Create;
end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppBevel.Destroy }

destructor TppBevel.Destroy;
begin

  FFont.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppBevel.SetCaption }

procedure TppBevel.SetCaption(aCaption: String);
begin
  FCaption := aCaption;
  Invalidate;
end; {procedure, SetCaption}

{------------------------------------------------------------------------------}
{ TppBevel.SetFont }

procedure TppBevel.SetFont(aFont: TFont);
begin
  FFont.Assign(aFont);
  Invalidate;
end; {procedure, SetFont}


{------------------------------------------------------------------------------}
{ TppBevel.Paint }

procedure TppBevel.Paint;
var
  lClientRect: TRect;
  
begin

  Canvas.Font := FFont;
  Canvas.Brush.Color := clBtnFace;
  lClientRect := GetClientRect;

  {draw the caption}
  Canvas.TextRect(lClientRect, lClientRect.Left+4, lClientRect.Top+4, FCaption);

 inherited Paint;

end; {procedure, Paint}



{******************************************************************************
 *
 ** I M A G E L I S T
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppClassImageList.Create }

constructor TppClassImageList.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FClassNames := TStringList.Create;

  Init;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppClassImageList.Destroy }

destructor TppClassImageList.Destroy;
begin

  FClassNames.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppClassImageList.IndexOfClass }

function TppClassImageList.IndexOfClass(aClassName: String): Integer;
begin
  Result := FClassNames.IndexOf(aClassName);
end;  {function, IndexOfClass}

{------------------------------------------------------------------------------}
{ TppClassImageList.Init }

procedure TppClassImageList.Init;
var
  lBitmap: TBitmap;
  lMask: TBitmap;
  lRegComponent: TppRegComponent;
  liClass: Integer;
  lComponentClasses: TStrings;
  lsClassName: String;

begin

  Clear;

  lBitmap := TBitmap.Create;
  lMask   := TBitmap.Create;

  lBitmap.Handle :=ppBitmapFromResource(UpperCase('ppBand'));
  AddMasked(lBitmap, clWhite);
  FClassNames.Add('TppBand');

  lBitmap.Handle :=ppBitmapFromResource(UpperCase('ppGroup'));
  AddMasked(lBitmap, clTeal);
  FClassNames.Add('TppGroup');


  lComponentClasses := ppComponentClassList;

  for liClass := 0 to lComponentClasses.Count-1 do
    begin
      lsClassName :=  lComponentClasses[liClass];

      FClassNames.Add(lsClassName);

      lRegComponent := TppRegComponent(lComponentClasses.Objects[liClass]);


      if lRegComponent.HInstance = 0 then
        lRegComponent.HInstance := HInstance;

      {load bitmap}
      if lRegComponent.HInstance <> 0 then
        lBitmap.Handle := ppBitmapFromResource(UpperCase(lsClassName))
      else
        lBitmap.Handle := 0;

      if lBitmap.Handle = 0 then
        lBitmap.Handle :=ppBitmapFromResource('PPNOBITMAP');


      {load mask}
      if lRegComponent.HInstance <> 0 then
        lMask.Handle := ppBitmapFromResource(UpperCase(lsClassName+'Mask'))
      else
        lMask.Handle := 0;

      if lMask.Handle = 0 then
        lMask.Handle :=ppBitmapFromResource('PPNOBITMAPMASK');

      Add(lBitmap, lMask);

      {add bitmaps for TppReport, TppChildReport - same as TppSubReport}
      if CompareStr(lsClassName, 'TppSubReport') = 0 then
        begin
          { lBitmap.LoadFromFile('p:\bitmaps\ReportDesigner97\AdvancedComponents\SubReport.bmp');}

          FClassNames.Add('TppReport');
          Add(lBitmap, lMask);

          FClassNames.Add('TppChildReport');
          Add(lBitmap, lMask);
       end


    end;

  lBitmap.Handle :=ppBitmapFromResource(UpperCase('TppCalc'));
  lMask.Handle   :=ppBitmapFromResource(UpperCase('TppCalcMask'));

  FClassNames.Add('TppCalc');
  Add(lBitmap, lMask);

  lBitmap.Handle :=ppBitmapFromResource(UpperCase('ppGlobal'));
  AddMasked(lBitmap, clWhite);
  FClassNames.Add('Global');

  lBitmap.Handle :=ppBitmapFromResource(UpperCase('ppDeclarations'));
  AddMasked(lBitmap, clWhite);
  FClassNames.Add('Declarations');

  lBitmap.Handle :=ppBitmapFromResource(UpperCase('ppEvents'));
  AddMasked(lBitmap, clWhite);
  FClassNames.Add('Events');

  lBitmap.Handle :=ppBitmapFromResource(UpperCase('ppEventHandlers'));
  AddMasked(lBitmap, clWhite);
  FClassNames.Add('EventHandlers');

  lBitmap.Handle :=ppBitmapFromResource(UpperCase('ppPrograms'));
  AddMasked(lBitmap, clWhite);
  FClassNames.Add('Programs');

  lBitmap.Handle :=ppBitmapFromResource(UpperCase('ppContinue'));
  AddMasked(lBitmap, clWhite);
  FClassNames.Add('Continue');

  lBitmap.Handle :=ppBitmapFromResource(UpperCase('ppDataPipeline'));
  AddMasked(lBitmap, clWhite);
  FClassNames.Add('TppDataPipeline');

  lBitmap.Handle :=ppBitmapFromResource(UpperCase('ppDataView'));
  AddMasked(lBitmap, clWhite);
  FClassNames.Add('TdaDataView');

  lBitmap.Handle :=ppBitmapFromResource(UpperCase('ppField'));
  AddMasked(lBitmap, clWhite);
  FClassNames.Add('TppField');

  lBitmap.Handle :=ppBitmapFromResource(UpperCase('ppSelected'));
  AddMasked(lBitmap, clWhite);
  FClassNames.Add('ppSelected');


  lBitmap.Free;
  lMask.Free;

end; {procedure, Init}

{******************************************************************************
 *
 ** T R E E  S T A T E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppTreeStates.Create }

constructor TppTreeStates.Create(aTreeView: TTreeView);
begin

  inherited Create;

  FTreeView := aTreeView;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppTreeStates.Clear }

procedure TppTreeStates.Clear;
var
  liIndex: Integer;

begin
  for liIndex := 0 to cMaxView do
    FTreeStates[liIndex].Saved := False;

end; {procedure, Clear}

{------------------------------------------------------------------------------}
{ TppTreeStates.Save }

procedure TppTreeStates.Save(aIndex: Integer);
var
  liNode: Integer;
  liItemsCount: Integer;

begin

   if (cMaxNode > FTreeView.Items.Count) then
     liItemsCount := FTreeView.Items.Count
   else
     liItemsCount := cMaxNode;

  FTreeStates[aIndex].Saved := True;


   for liNode := 0 to liItemsCount-1 do
    begin
      FTreeStates[aIndex].NodeStates[liNode] := FTreeView.Items[liNode].Expanded;

      if FTreeView.Items[liNode].Selected then
        FTreeStates[aIndex].SelectedIndex := liNode;

    end;

end; {procedure, Save}

{------------------------------------------------------------------------------}
{ TppTreeStates.Restore }

function TppTreeStates.Restore(aIndex: Integer): Boolean;
var
  liNode: Integer;
  liSelectedIndex: Integer;
  liItemsCount: Integer;

begin


  Result := False;

  if not FTreeStates[aIndex].Saved then Exit;

  liSelectedIndex := FTreeStates[aIndex].SelectedIndex;

  if liSelectedIndex < 0 then Exit;

  FTreeView.Items.BeginUpdate; {new 4.24}

  if (FTreeView.Items.Count < cMaxNode) then
    liItemsCount := FTreeView.Items.Count
  else
    liItemsCount := cMaxNode;

  {restore expanded state of each node}
  for liNode := 0 to liItemsCount-1 do
    FTreeView.Items[liNode].Expanded := FTreeStates[aIndex].NodeStates[liNode];

  {restore selected node}
  if (liSelectedIndex < FTreeView.Items.Count) then
    FTreeView.Selected := FTreeView.Items[liSelectedIndex];

  if FTreeView.Selected <> nil then
    FTreeView.Selected.MakeVisible;

  FTreeView.Items.EndUpdate; {new 4.24}


  Result := True;

end; {procedure, Restore}


{******************************************************************************
 *
 ** T R E E  B U I L D E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppTreeBuilder.Create }

constructor TppTreeBuilder.Create(aTreeView: TppReportTreeView);
begin

  inherited Create;

  if (aTreeView <> nil) then
    aTreeView.TreeBuilder := Self;

  FComponents     := TList.Create;
  FComponentNodes := TStringList.Create;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppTreeBuilder.Destroy }

destructor TppTreeBuilder.Destroy;
begin

  if (FTreeView <> nil) then
    FTreeView.TreeBuilder := nil;

  FComponents.Free;
  FComponentNodes.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppTreeBuilder.GetClassImageIndex }

function TppTreeBuilder.GetClassImageIndex(aClassName: String): Integer;
begin

  if FTreeView.ClassImages <> nil then
    Result := FTreeView.ClassImages.IndexOfClass(aClassName)
  else
    Result := -1;

end; {function, GetClassImageIndex}

{------------------------------------------------------------------------------}
{ TppTreeBuilder.GetHelpContext }

function TppTreeBuilder.GetHelpContext: String;
var
  lComponent: TComponent;

begin
  {default is no key word, which will display the help contents}
  Result := '';

  lComponent := GetComponentForNode(TreeView.Selected);

  if (lComponent = nil) then Exit;

  {example: TppReport_Object}
  Result := lComponent.ClassName + '_Object;'

end;  {function, GetHelpContext}

{------------------------------------------------------------------------------}
{ TppTreeBuilder.GetHelpFileName }

function TppTreeBuilder.GetHelpFileName: String;
begin
  Result := 'RBuilder.hlp';
  
end; {function, GetHelpFileName}

{------------------------------------------------------------------------------}
{ TppTreeBuilder.GetReport }

function TppTreeBuilder.GetReport: TppBandedReport;
begin

  Result := TppBandedReport(TreeView.Report);

end;  {function, GetReport}

{------------------------------------------------------------------------------}
{ TppTreeBuilder.BuildTree }

procedure TppTreeBuilder.BuildTree;
begin

  TreeView.Items.Clear;
  FComponents.Clear;
  FComponentNodes.Clear;

end;   {procedure, BuildTree}


{------------------------------------------------------------------------------}
{ TppTreeBuilder.AddComponent }

procedure TppTreeBuilder.AddComponent(aComponent: TComponent);
var
  lParentNode: TTreeNode;
  lObjectNode: TTreeNode;
  lsText: String;

begin

  FindComponentNode(aComponent.GetParentComponent, lParentNode);


  if (aComponent is TppCommunicator) then
    lsText := TppCommunicator(aComponent).UserName
  else
    lsText := aComponent.Name;

  lObjectNode := TreeView.Items.AddChildObject(lParentNode, lsText, aComponent);

  lObjectNode.ImageIndex := GetClassImageIndex(aComponent.ClassName);
  lObjectNode.SelectedIndex := lObjectNode.ImageIndex;

  {update internal component list and node list}
  FComponents.Add(aComponent);
  FComponentNodes.AddObject(lObjectNode.Text, lObjectNode);


end; {procedure, AddComponent}

{------------------------------------------------------------------------------}
{ TppTreeBuilder.FindComponentNode }

function TppTreeBuilder.FindComponentNode(aComponent: TComponent; var aTreeNode: TTreeNode): Boolean;
var
  liIndex: Integer;

begin

  liIndex := FComponents.IndexOf(aComponent);

  if liIndex >= 0 then
    begin
      Result := True;
      aTreeNode := TTreeNode(FComponentNodes.Objects[liIndex]);
    end
  else
    begin
      Result := False;
      aTreeNode := nil;
    end;


end; {function, FindComponentNode}

{------------------------------------------------------------------------------}
{ TppTreeBuilder.GetComponentForNode }

function TppTreeBuilder.GetComponentForNode(aTreeNode: TTreeNode): TComponent;
var
  lObject: TObject;

begin

  Result := nil;

  if (aTreeNode = nil) or (aTreeNode.Data = nil) then Exit;

  lObject := aTreeNode.Data;

  try
    if (lObject is TComponent) then
      Result := TComponent(lObject);
  except
    Result := nil;
  end;

end; {function, GetComponentForNode}

{------------------------------------------------------------------------------}
{ TppTreeBuilder.FindNode }

function TppTreeBuilder.FindNode(aText: String; var aTreeNode: TTreeNode): Boolean;
var
  liIndex: Integer;

begin
  Result := False;
  aTreeNode := nil;

  liIndex := FComponentNodes.IndexOf(aText);

  if liIndex >= 0 then
    begin
      Result := True;
      aTreeNode := TTreeNode(FComponentNodes.Objects[liIndex]);
    end
  else

    for liIndex := 0 to TreeView.Items.Count-1 do
      if CompareText(TreeView.Items[liIndex].Text, aText) = 0 then
        begin
          aTreeNode := TreeView.Items[liIndex];
          Result := True;
          Exit;
        end;

end; {function, FindNode}



{------------------------------------------------------------------------------}
{ TppTreeBuilder.RemoveComponent }

procedure TppTreeBuilder.RemoveComponent(aComponent: TComponent);
var
  lComponentNode: TTreeNode;
  lChildNode: TTreeNode;
  liIndex: Integer;

begin

  if not TreeView.FindComponentNode(aComponent, lComponentNode) then Exit;

  {remove child node component}
  for liIndex := lComponentNode.Count-1 downto 0 do
    begin
      lChildNode := lComponentNode.Item[liIndex];

      if (TObject(lChildNode.Data) is TComponent) then
        TreeView.RemoveComponent(TComponent(lChildNode.Data));
    end;

  {update internal component lists}
  liIndex := FComponents.Remove(aComponent);

  if liIndex >= 0 then
    FComponentNodes.Delete(liIndex);

  {delete the node from the tree}
  TreeView.Items.Delete(lComponentNode);


end; {procedure, RemoveComponent}


{------------------------------------------------------------------------------}
{ TppTreeBuilder.SelectFirstNode }

procedure TppTreeBuilder.SelectFirstNode;
begin

  if TreeView = nil then Exit;

  {select first item }
  if TreeView.Items.Count > 0 then
    begin
      TreeView.Selected := TreeView.Items[0];
      TreeView.Selected.MakeVisible;
    end;

end; {procedure, SelectFirstNode}



{******************************************************************************
 *
 ** R E P O R T  O B J E C T  T R E E  B U I L D E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppReportObjectTreeBuilder.Create }

constructor TppReportObjectTreeBuilder.Create(aTreeView: TppReportTreeView);
begin

  inherited Create(aTreeView);

  FShowGroups := False;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppReportObjectTreeBuilder.BuildTree }

procedure TppReportObjectTreeBuilder.BuildTree;
var
  lReportNode: TTreeNode;
  liIndex: Integer;
  lSubReport: TppSubReport;
  lReport: TppCustomReport;

begin

  inherited BuildTree;

  lReport := TreeView.Report;

  if (lReport = nil) then Exit;

  {add root node}
  if TreeView.ShowRoot then
    begin
      if lReport is TppChildReport then
        begin
          lSubReport  := TppSubReport(TppChildReport(lReport).Parent);
          lReportNode := TreeView.Items.AddObject(nil, lSubReport.UserName, lSubReport);
          lReportNode.ImageIndex    := GetClassImageIndex('Continue');
          lReportNode.SelectedIndex := lReportNode.ImageIndex;
          lReportNode := TreeView.Items.AddChildObject(lReportNode, 'Report', lReport);

        end
      else
        lReportNode := TreeView.Items.AddObject(nil, 'Report', lReport);

      lReportNode.ImageIndex    := GetClassImageIndex(lReport.ClassName);
      lReportNode.SelectedIndex := lReportNode.ImageIndex;

      {update internal component list and node list}
      Components.Add(lReport);
      ComponentNodes.AddObject('Report', lReportNode);

    end
  else
    lReportNode := nil;

  {add group nodes}
  if ShowGroups then
    for liIndex := 0 to lReport.GroupCount-1 do
      AddGroupNode(lReportNode, lReport.Groups[liIndex]);

  {add band nodes}
  for liIndex := 0 to lReport.BandCount-1 do
    if not ShowGroups or not (lReport.Bands[liIndex] is TppGroupBand) then
      AddBandNode(lReportNode, lReport.Bands[liIndex]);


  SelectFirstNode;

end;   {procedure, BuildTree}


{------------------------------------------------------------------------------}
{ TppReportObjectTreeBuilder.AddComponent }

procedure TppReportObjectTreeBuilder.AddComponent(aComponent: TComponent);
var
  lParentNode: TTreeNode;

begin

  {get parent node}
  TreeView.FindComponentNode(aComponent.GetParentComponent, lParentNode);

  if (aComponent is TppGroup) then
     AddGroupNode(lParentNode, TppGroup(aComponent))

  else if (aComponent is TppBand) then
     AddBandNode(lParentNode, TppBand(aComponent))

  else if (aComponent is TppComponent) then
    AddObjectNode(lParentNode, TppComponent(aComponent));

end; {class procedure, AddComponent}


{------------------------------------------------------------------------------}
{ TppReportObjectTreeBuilder.AddGroupNode }

function TppReportObjectTreeBuilder.AddGroupNode(aParentNode: TTreeNode; aGroup: TppGroup): TTreeNode;
var
  lGroupNode: TTreeNode;
  lDestNode: TTreeNode;
  lsCaption: String;
{  liObject: Integer;}

begin

  Result := nil;
  
  if (aGroup.Report = nil) then Exit;

  {do not localize}
  lsCaption := 'Groups[' + IntToStr(aGroup.GroupNo) + ']';

  {add group node to tree view}
  if (aParentNode = nil) then
    lGroupNode := TreeView.Items.AddObject(nil, lsCaption, aGroup)
  else
    lGroupNode := TreeView.Items.AddChildObject(aParentNode, lsCaption, aGroup);

  {update internal component list and node list}
  Components.Add(aGroup);
  ComponentNodes.AddObject(lGroupNode.Text, lGroupNode);


  {set the image index}
  lGroupNode.ImageIndex    := GetClassImageIndex('TppGroup');
  lGroupNode.SelectedIndex := lGroupNode.ImageIndex ;

  {position the group in the list}
  if (aGroup.Index  < aGroup.Report.GroupCount-1) and
     (aGroup.Index <> lGroupNode.Index) then

      {try to insert this group, just before the next group}
      if TreeView.FindComponentNode(aGroup.Report.Groups[aGroup.Index+1], lDestNode) then
        lGroupNode.MoveTo(lDestNode, naInsert)

      else if (aGroup.Index > 0) and TreeView.FindComponentNode(aGroup.Report.Groups[aGroup.Index-1], lDestNode) then
        begin

          {try to insert this group, just after the previous group}
          lDestNode := lDestNode.GetNextSibling;
          if lDestNode <> nil then
            lGroupNode.MoveTo(lDestNode, naInsert);

        end;

  {add band nodes for groupheader and groupfooter}
  AddBandNode(lGroupNode, aGroup.HeaderBand);
  AddBandNode(lGroupNode, aGroup.FooterBand);

  lGroupNode.Expanded := True;

  Result := lGroupNode;


end; {procedure, AddGroupNode}


{------------------------------------------------------------------------------}
{ TppReportObjectTreeBuilder.AddBandNode }

procedure TppReportObjectTreeBuilder.AddBandNode(aParentNode: TTreeNode; aBand: TppBand);
var
  lBandNode: TTreeNode;
  lDestNode: TTreeNode;
  liObject: Integer;
  lsDescription: String;
  lPriorNode: TTreeNode;
  lNextNode: TTreeNode;

begin

  if (aBand.Report = nil) then Exit;

  lsDescription := aBand.UserName;

  if ShowGroups then
    if aBand is TppGroupHeaderBand then
      lsDescription := 'Header'
    else if aBand is TppGroupFooterBand then
      lsDescription := 'Footer';

  {add band node to tree view}
  if (aParentNode = nil) then
    lBandNode := TreeView.Items.AddObject(nil, lsDescription, aBand)
  else
    lBandNode := TreeView.Items.AddChildObject(aParentNode, lsDescription, aBand);

  {update internal component list and node list}
  Components.Add(aBand);
  ComponentNodes.AddObject(lBandNode.Text, lBandNode);

  {set the image index}
  lBandNode.ImageIndex    := GetClassImageIndex('TppBand');
  lBandNode.SelectedIndex := lBandNode.ImageIndex;

  if not ShowGroups or not (aBand is TppGroupBand) then
    begin

      lPriorNode := GetPriorSiblingNodeForBand(aBand);

      {if no prior sibling node, add band node as first child}
      if lPriorNode = nil then
        begin
          if (aParentNode <> nil) then
            lDestNode := aParentNode
          else
            TreeView.FindComponentNode(aBand.Report, lDestNode);
          lBandNode.MoveTo(lDestNode, naAddChildFirst);
        end
      else
        begin
          {insert prior to next sibling node}
          lNextNode := GetNextSiblingNodeForBand(aBand);

          if (lNextNode <> nil) then
            lBandNode.MoveTo(lNextNode, naInsert)

        end;

    end;

  {add child objects}
  for liObject := 0 to aBand.ObjectCount-1 do

    if aBand.Objects[liObject].Parent = aBand then
      AddObjectNode(lBandNode, aBand.Objects[liObject]);

  lBandNode.Expanded := True;

end; {procedure, AddBandNode}

{------------------------------------------------------------------------------}
{ TppReportObjectTreeBuilder.AddObjectNode }

procedure TppReportObjectTreeBuilder.AddObjectNode(aParentNode: TTreeNode; aObject: TppComponent);
var
  lObjectNode: TTreeNode;
  lSiblingNode: TTreeNode;
  liObject: Integer;
  lRegion: TppCustomRegion;

begin

  if aParentNode = nil then Exit;

  if TreeView.FindComponentNode(aObject.NextSibling, lSiblingNode) then
    lObjectNode := TreeView.Items.InsertObject(lSiblingNode, aObject.UserName, aObject)
  else
    lObjectNode := TreeView.Items.AddChildObject(aParentNode, aObject.UserName, aObject);

  {update internal component list and node list}
  Components.Add(aObject);
  ComponentNodes.AddObject(lObjectNode.Text, lObjectNode);

  lObjectNode.ImageIndex    := GetClassImageIndex(aObject.ClassName);
  lObjectNode.SelectedIndex := lObjectNode.ImageIndex;


  if aObject is TppCustomRegion then
    begin
      lRegion := TppCustomRegion(aObject);

      for liObject := 0 to lRegion.ObjectCount-1 do
        AddObjectNode(lObjectNode, lRegion.Objects[liObject]);

      lObjectNode.Expanded := True;
    end;

end; {procedure, AddObjectNode}

{------------------------------------------------------------------------------}
{ TppReportObjectTreeBuilder.GetNextSiblingNodeForBand }

function TppReportObjectTreeBuilder.GetNextSiblingNodeForBand(aBand: TppBand): TTreeNode;
var
  lNextSibling: TComponent;
  lReport: TppBandedReport;
begin

  Result := nil;

  lReport := GetReport;

  if (lReport = nil) then Exit;

  if (aBand.Index >= lReport.BandCount-2) then Exit;

  {default next sibling}
  lNextSibling := lReport.Bands[aBand.Index+1];

  if ShowGroups and (lReport.GroupCount > 0) then
    begin
      if (aBand is TppDetailBand) then
          begin
            {next sibling will be columnfooter, footer, or summary}
            if lReport.ColumnFooterBand <> nil then
              lNextSibling := lReport.ColumnFooterBand
            else if lReport.FooterBand <> nil then
              lNextSibling := lReport.FooterBand
            else
              lNextSibling := lReport.SummaryBand;

          end

       else if (aBand is TppHeaderBand) and (lReport.ColumnHeaderBand = nil) then
         lNextSibling := lReport.Groups[0]

       else if (aBand is TppColumnHeaderBand) then
         lNextSibling := lReport.Groups[0];

    end;

  TreeView.FindComponentNode(lNextSibling, Result);

end; {function, GetNextSiblingNodeForBand}


{------------------------------------------------------------------------------}
{ TppReportObjectTreeBuilder.GetPriorSiblingNodeForBand }

function TppReportObjectTreeBuilder.GetPriorSiblingNodeForBand(aBand: TppBand): TTreeNode;
var
  lPriorSibling: TComponent;
  lReport: TppBandedReport;

begin

  Result := nil;

  lReport := GetReport;

  if (lReport = nil) or (aBand.Index = 0) then Exit;

  {default prior sibling}
  lPriorSibling := lReport.Bands[aBand.Index-1];

  if ShowGroups and (aBand is TppDetailBand) and (lReport.GroupCount > 0) then
    begin
      {prior sibling will be the last group}
      lPriorSibling := lReport.Groups[lReport.GroupCount-1];
    end;


  TreeView.FindComponentNode(lPriorSibling, Result);


end; {function, GetPriorSiblingNodeForBand}


{******************************************************************************
 *
 ** R E P O R T  B A N D  T R E E  B U I L D E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppReportBandTreeBuilder.AddObjectNode }

procedure TppReportBandTreeBuilder.AddObjectNode(aParentNode: TTreeNode; aObject: TppComponent);
begin

 {do nothing}

end; {procedure, AddObjectNode}



{******************************************************************************
 *
 ** R E P O R T  O U T L I N E  T R E E  B U I L D E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppReportOutlineTreeBuilder.BuildTree }

procedure TppReportOutlineTreeBuilder.BuildTree;
var
  lSubReports: TStringList;
  lParentNode: TTreeNode;
  liChild: Integer;

begin

  inherited BuildTree;

  if (TreeView.Report = nil) then Exit;

  {add a new parent node}
  lParentNode := TreeView.Items.AddObject(nil, 'Main', TreeView.Report);

  lParentNode.ImageIndex    := GetClassImageIndex(TreeView.Report.ClassName);
  lParentNode.SelectedIndex := lParentNode.ImageIndex;

  {update internal component list and node list}
  Components.Add(TreeView.Report);
  ComponentNodes.AddObject(lParentNode.Text, lParentNode);


  lSubReports := TStringList.Create;

  {get list of all sub-reports }
   TreeView.Report.GetSubReports(lSubReports);

  {build new outline}
  for liChild := 0 to lSubReports.Count-1 do
     AddChildReportNode(lSubReports[liChild], TppChildReport(lSubReports.Objects[liChild]));

  lSubReports.Free;

  TreeView.FullExpand;

  SelectFirstNode;

end;   {procedure, BuildTree}


{------------------------------------------------------------------------------}
{ TppReportOutlineTreeBuilder.AddComponent }

procedure TppReportOutlineTreeBuilder.AddComponent(aComponent: TComponent);
var
  lSubreport: TppSubReport;
  lTreeNode: TTreeNode;
begin

  if not (aComponent is TppChildReport) then Exit;

  lSubReport := TppSubReport(aComponent.GetParentComponent);

  if FindComponentNode(aComponent, lTreeNode) then
    lTreeNode.Text :=  lSubReport.UserName
  else
    AddChildReportNode(lSubReport.UserName, TppChildReport(aComponent));



end; {class procedure, AddComponent}


{------------------------------------------------------------------------------}
{ TppReportOutlineTreeBuilder.AddChildReportNode }

procedure TppReportOutlineTreeBuilder.AddChildReportNode(const aCaption: String; aChildReport: TppChildReport);
var
  lParentNode: TTreeNode;
  lChildNode: TTreeNode;

begin

  if not FindComponentNode(aChildReport.ParentReport, lParentNode) then Exit;

  lChildNode := TreeView.Items.AddChildObject(lParentNode, aCaption, aChildReport);

  lChildNode.ImageIndex    := GetClassImageIndex(aChildReport.ClassName);
  lChildNode.SelectedIndex := lChildNode.ImageIndex;
  lChildNode.Expanded := True;

  {update internal component list and node list}
  Components.Add(aChildReport);
  ComponentNodes.AddObject(lChildNode.Text, lChildNode);

  TreeView.FullExpand;

end; {procedure, AddChildReportNode}


{------------------------------------------------------------------------------}
{ TppReportOutlineTreeBuilder.GetHelpContext }

function TppReportOutlineTreeBuilder.GetHelpContext: String;
var
  lComponent: TComponent;

begin

  Result := '';

  lComponent := GetComponentForNode(TreeView.Selected);

  {example: TppReport_Object}
  if lComponent is TppReport then
    Result := lComponent.ClassName + '_Object;'
  else if lComponent is TppChildReport then
    Result := 'TppSubReport_Object';


end;  {function, GetHelpContext}

{******************************************************************************
 *
 ** D A T A  T R E E  B U I L D E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDataTreeBuilder.Create }

constructor TppDataTreeBuilder.Create(aTreeView: TppReportTreeView);
begin

  inherited Create(aTreeView);

  FDataPipelineList := TppDataPipelineList.Create(aTreeView.Report);
  FDataPipelineList.OnChange := DataPipelineListChangeEvent;

  FDisplayFields := False;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDataTreeBuilder.Destroy }

destructor TppDataTreeBuilder.Destroy;
begin
  FDataPipelineList.Free;

  inherited Destroy;

end; {destructor, Destroy}



{------------------------------------------------------------------------------}
{ TppDataTreeBuilder.BuildTree }

procedure TppDataTreeBuilder.BuildTree;
var
  liPipeline: Integer;

begin

  inherited BuildTree;


  if FDataPipelineList.Report <> TreeView.Report then
    FDataPipelineList.Report := TreeView.Report
  else
    FDataPipelineList.Refresh;

  {add data pipelines}
  for liPipeline := 0 to FDataPipelineList.Count-1 do
    AddPipelineNode(TppDataPipeline(FDataPipelineList.Objects[liPipeline]));

  SelectFirstNode;

end; {procedure, BuildDataTree}

{------------------------------------------------------------------------------}
{ TppDataTreeBuilder.AddComponent }

procedure TppDataTreeBuilder.AddComponent(aComponent: TComponent);
begin

  AddPipelineNode(TppDataPipeline(aComponent))

end; {class procedure, AddComponent}


{------------------------------------------------------------------------------}
{ TppDataTreeBuilder.DataPipelineListChangeEvent }

procedure TppDataTreeBuilder.DataPipelineListChangeEvent(Sender: TObject);
begin
{  if FBuilding or (csDestroying in ComponentState) then Exit;}

{  BuildTree;}

end; {procedure, DataPipelineListChangeEvent}

{------------------------------------------------------------------------------}
{ TppDataTreeBuilder.AddPipelineNode }

procedure TppDataTreeBuilder.AddPipelineNode(aDataPipeline: TppDataPipeline);
var
  liField: Integer;
  lTreeNode: TTreeNode;
  lParentNode: TTreeNode;

begin

  if FindComponentNode(aDataPipeline, lTreeNode) then Exit;

  lParentNode := AddPipelineParentNode(aDataPipeline);

  if (lParentNode = nil) and (aDataPipeline.MasterDataPipeline <> nil) then
    FindComponentNode(aDataPipeline.MasterDataPipeline, lParentNode);

  {add data pipeline node}
  if lParentNode = nil then
    lTreeNode := TreeView.Items.AddObject(nil, aDataPipeline.UserName, aDataPipeline)
  else
    lTreeNode := TreeView.Items.AddChildObject(lParentNode, aDataPipeline.UserName, aDataPipeline);
 

  {update internal component list and node list}
  Components.Add(aDataPipeline);
  ComponentNodes.AddObject(lTreeNode.Text, lTreeNode);


  lTreeNode.ImageIndex    := GetClassImageIndex('TppDataPipeline');
  lTreeNode.SelectedIndex := lTreeNode.ImageIndex;

  if FDisplayFields then
    for liField := 0 to aDataPipeline.FieldCount-1 do
      AddFieldNode(aDataPipeline.Fields[liField]);

  if (lParentNode <> nil) then
    lParentNode.Expanded := True;


end; {procedure, AddPipelineNode}

{------------------------------------------------------------------------------}
{ TppDataTreeBuilder.AddPipelineParentNode }

function TppDataTreeBuilder.AddPipelineParentNode(aDataPipeline: TppDataPipeline): TTreeNode;
var
  lsParentName: String;
  lParent: TComponent;

begin

  Result := nil;

  if (aDataPipeline.Owner <> nil) and (aDataPipeline.Owner is TDataModule) then
    begin
      lParent := aDataPipeline.Owner;
      lsParentName := lParent.Name;
    end

  else
    begin
      lParent := nil;
      lsParentName :='';
    end;


  if (lParent = nil) then
    Result := nil

  {get the parent node}
  else if not FindComponentNode(lParent, Result) then
    begin
      {add a new parent node}
      Result := TreeView.Items.AddObject(nil, lsParentName, lParent);
      Result.ImageIndex    := GetClassImageIndex('TdaDataView');
      Result.SelectedIndex := Result.ImageIndex;

      Components.Add(lParent);
      ComponentNodes.AddObject(Result.Text, Result);

    end;

end; {procedure, AddPipelineParentNode}



{------------------------------------------------------------------------------}
{ TppDataTreeBuilder.AddFieldNode }

procedure TppDataTreeBuilder.AddFieldNode(aField: TppField);

var
  lTreeNode: TTreeNode;
  lParentNode: TTreeNode;
begin

  {get the parent node}
  if not FindComponentNode(aField.DataPipeline, lParentNode) then Exit;

  {add data field node}
  lTreeNode := TreeView.Items.AddChildObject(lParentNode, aField.FieldAlias, aField);
  lTreeNode.ImageIndex    := GetClassImageIndex('TppField');
  lTreeNode.SelectedIndex := lTreeNode.ImageIndex;

  {update internal component list and node list}
  Components.Add(aField);
  ComponentNodes.AddObject(lTreeNode.Text, lTreeNode);

end; {procedure, AddFieldNode}

{------------------------------------------------------------------------------}
{ TppDataTreeBuilder.GetHelpContext }

function TppDataTreeBuilder.GetHelpContext: String;
var
  lComponent: TComponent;

begin

  Result := '';

  lComponent := GetComponentForNode(TreeView.Selected);

  if (lComponent = nil) then Exit;

  {example: TppDBPipeline_Object}
  if (Pos('Child', lComponent.ClassName) > 0) then
    Result := lComponent.ClassParent.ClassName
  else
  Result := lComponent.ClassName + '_Object;'


end;  {function, GetHelpContext}




{******************************************************************************
 *
 ** R E P O R T  T R E E  V I E W
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppReportTreeView.Create }

constructor TppReportTreeView.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FDisableUpdates := 0;

  FAllowDrag     := False;
  FBuilding      := False;
  FReport        := nil;

  FImageList     := nil;
  FTreeBuilder   := nil;
  FShowRoot      := True;

  {show selecting, even when not focused}
  HideSelection := False;

  OnKeyDown := KeyDownEvent;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppReportTreeView.Destroy }

destructor TppReportTreeView.Destroy;
begin

  SetTreeBuilder(nil);

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppReportTreeView.KeyDownEvent }

procedure TppReportTreeView.KeyDownEvent(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if not (Key = VK_F1) or (FTreeBuilder = nil) then Exit;

  DisplayHelp;

end; {procedure, KeyDownEvent}

{------------------------------------------------------------------------------}
{ TppReportTreeView.DisplayHelp }

procedure TppReportTreeView.DisplayHelp;
var
  lsDelphiPath: String;
  lsHelpContext: String;
  lsHelpFile: String;
  lsAppHelpFile: String;
  lMultiKeyHelp: TppMultiKeyHelp;
begin

  lsDelphiPath := ppGetDelphiPath;

  if (lsDelphiPath = '') then Exit;

  lsHelpContext := FTreeBuilder.GetHelpContext;
  lsHelpFile    := FTreeBuilder.GetHelpFileName;

  if (lsHelpFile = '') then Exit;

  lsAppHelpFile := Application.HelpFile;

  {show ReportBuilder help topic}
  Application.Helpfile := lsDelphiPath + '\Help\' + lsHelpFile;

  if (lsHelpContext = '') then
    Application.HelpCommand(HELP_FINDER, 0)

  else
    begin
      lMultiKeyHelp.mkSize := SizeOf(TppMultiKeyHelp);
      lMultiKeyHelp.mkKeyList := 'A';
      StrPCopy(lMultiKeyHelp.szKeyphrase, lsHelpContext);
      Application.HelpCommand(HELP_MULTIKEY, Integer(@lMultiKeyHelp));
    end;

  {restore App's help file}
  Application.Helpfile := lsAppHelpFile;

end; {procedure, DisplayHelp}

{------------------------------------------------------------------------------}
{ TppReportTreeView.SetClassImages }

procedure TppReportTreeView.SetClassImages(aClassImageList: TppClassImageList);
begin
  FImageList := aClassImageList;
  Images     := aClassImageList;

end; {procedure, SetClassImages}

{------------------------------------------------------------------------------}
{ TppReportTreeView.SetTreeBuilder }

procedure TppReportTreeView.SetTreeBuilder(aTreeBuilder: TppTreeBuilder);
begin
  if (FTreeBuilder <> nil) then
    FTreeBuilder.TreeView := nil;

  FTreeBuilder := aTreeBuilder;

  if (FTreeBuilder <> nil) then
    FTreeBuilder.TreeView := Self;

end; {procedure, SetTreeBuilder}

{------------------------------------------------------------------------------}
{ TppReportTreeView.BeginUpdate }

procedure TppReportTreeView.BeginUpdate;
begin
  Inc(FDisableUpdates,1);

end; {procedure, BeginUpdate}

{------------------------------------------------------------------------------}
{ TppReportTreeView.EndUpdate }

procedure TppReportTreeView.EndUpdate;
begin

  if FDisableUpdates = 0 then Exit;

  Dec(FDisableUpdates,1);

  if FDisableUpdates = 0 then
    BuildTree;

end; {procedure, EndUpdate}


{------------------------------------------------------------------------------}
{ TppReportTreeView.SetReport }

procedure TppReportTreeView.SetReport(aCustomReport: TppCustomReport);
begin

  FReport := aCustomReport;

  BuildTree;

end; {procedure, SetReport}

{------------------------------------------------------------------------------}
{ TppReportTreeView.SetShowRoot }

procedure TppReportTreeView.SetShowRoot(aValue: Boolean);
begin

  FShowRoot := aValue;

  BuildTree;

end; {procedure, SetShowRoot}


{------------------------------------------------------------------------------}
{ TppReportTreeView.DoBeforeBuildTree }

procedure TppReportTreeView.DoBeforeBuildTree;
begin

  if Assigned(FBeforeBuildTree) then FBeforeBuildTree(Self);

end; {procedure, DoBeforeBuildTree}

{------------------------------------------------------------------------------}
{ TppReportTreeView.DoAfterBuildTree }

procedure TppReportTreeView.DoAfterBuildTree;
begin

  if Assigned(FAfterBuildTree) then FAfterBuildTree(Self);

end; {procedure, DoAfterBuildTree}


{------------------------------------------------------------------------------}
{ TppReportTreeView.BuildTree }

procedure TppReportTreeView.BuildTree;
begin

  if (csDestroying in ComponentState) then Exit;

  if (FDisableUpdates > 0) then Exit;

  DoBeforeBuildTree;

  FBuilding := True;

  Items.BeginUpdate;

  try

    if FTreeBuilder <> nil then
      FTreeBuilder.BuildTree;

    if FShowRoot and (Items.Count > 0) and not Items[0].Expanded then
      begin
        Items[0].Expanded := True;
        if (FReport is TppChildReport) and (Items.Count > 1)  then
          Items[1].Expanded := True;
      end;

  finally
    Items.EndUpdate;

    FBuilding := False;

    DoAfterBuildTree;

  end; {try, finally}

end; {procedure, BuildTree}

{------------------------------------------------------------------------------}
{ TppReportTreeView.Rebuild }

procedure TppReportTreeView.Rebuild;
begin

  {save current tree state}
 { SaveState;}

  {call build tree - which will automatically restore the state}
  BuildTree;

end; {procedure, Rebuild}


{------------------------------------------------------------------------------}
{ TppReportTreeView.AddComponent }

procedure TppReportTreeView.AddComponent(aComponent: TComponent);
begin

  FTreeBuilder.AddComponent(aComponent);

end; {procedure, AddComponent}


{------------------------------------------------------------------------------}
{ TppReportTreeView.RemoveComponent }

procedure TppReportTreeView.RemoveComponent(aComponent: TComponent);
begin

  FTreeBuilder.RemoveComponent(aComponent);

end; {procedure, RemoveComponent}


{------------------------------------------------------------------------------}
{ TppReportTreeView.UpdateComponent }

procedure TppReportTreeView.UpdateComponent(aComponent: TComponent);
var
  lTreeNode: TTreeNode;
  lComponent: TppCommunicator;
  lSelectedComponent: TComponent;

begin

  if not FindComponentNode(aComponent, lTreeNode) then Exit;

  if aComponent is TppCommunicator then
    begin
      lComponent := TppCommunicator(lTreeNode.Data);

      if (lTreeNode.Text <> lComponent.UserName) then
        begin
         lTreeNode.Text := lComponent.UserName;
         Exit;
        end;

    end;


  lSelectedComponent := GetSelectedComponent;
  RemoveComponent(aComponent);
  AddComponent(aComponent);
  SelectComponent(lSelectedComponent);


end;  {procedure, UpdateComponent}


{------------------------------------------------------------------------------}
{ TppReportTreeView.GetSelectedComponent}

function TppReportTreeView.GetSelectedComponent: TComponent;
begin

  if (Selected = nil) then
    Result := nil
  else
    try
      Result := TComponent(Selected.Data);
    except
      Result := nil;
    end;

end; {procedure, GetSelectedComponent}

{------------------------------------------------------------------------------}
{ TppReportTreeView.SelectComponent }

procedure TppReportTreeView.SelectComponent(aComponent: TComponent);
var
  lTreeNode: TTreeNode;

begin
  if FindComponentNode(aComponent, lTreeNode) then
    Selected := lTreeNode;

end; {procedure, SelectComponent}



{------------------------------------------------------------------------------}
{ TppReportTreeView.FindComponentNode }

function TppReportTreeView.FindComponentNode(aComponent: TComponent; var aTreeNode: TTreeNode): Boolean;
begin

  Result := FTreeBuilder.FindComponentNode(aComponent, aTreeNode);

end; {function, FindComponentNode}


{------------------------------------------------------------------------------}
{ TppReportTreeView.FindNode }

function TppReportTreeView.FindNode(aText: String; var aTreeNode: TTreeNode): Boolean;
begin

  Result := FTreeBuilder.FindNode(aText, aTreeNode);

end; {function, FindNode}

{------------------------------------------------------------------------------}
{ TppReportTreeView.DoOnMessage }

procedure TppReportTreeView.DoOnMessage(aMessage: String);
begin

  if Assigned(FOnMessage) then FOnMessage(Self, aMessage);

end; {function, DoOnMessage}

{------------------------------------------------------------------------------}
{ TppReportTreeView.MouseDown }

procedure TppReportTreeView.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  lNode: TTreeNode;

begin

  inherited MouseDown(Button, Shift, X, Y);

  if not FAllowDrag then Exit;

  lNode  := GetNodeAt(X,Y);

  if (lNode <> nil) then
    BeginDrag(False);


end;  {procedure, MouseDown}


{******************************************************************************
 *
 ** L I S T  B U I L D E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppListBuilder.Create }

constructor TppListBuilder.Create(aListView: TppReportListView);
begin

  inherited Create;

  if (aListView <> nil) then
    aListView.ListBuilder := Self;


end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppListBuilder.Destroy }

destructor TppListBuilder.Destroy;
begin

  if (FListView <> nil) then
    FListView.ListBuilder := nil;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppListBuilder.GetClassImageIndex }

function TppListBuilder.GetClassImageIndex(aClassName: String): Integer;
begin

  if FListView.ClassImages <> nil then
    Result := FListView.ClassImages.IndexOfClass(aClassName)
  else
    Result := -1;

end; {function, GetClassImageIndex}

{------------------------------------------------------------------------------}
{ TppListBuilder.GetHelpContext }

function TppListBuilder.GetHelpContext: String;
begin
  {default is no key word, which will display the help contents}
  Result := '';

end; {function, GetHelpContext}

{------------------------------------------------------------------------------}
{ TppListBuilder.GetHelpFileName }

function TppListBuilder.GetHelpFileName: String;
begin
  Result := 'RBuilder.hlp';
  
end; {function, GetHelpFileName}

{------------------------------------------------------------------------------}
{ TppListBuilder.GetCurrentObject }

function TppListBuilder.GetCurrentObject: TObject;
begin

  Result := ListView.CurrentObject;

end; {function, GetCurrentObject}


{------------------------------------------------------------------------------}
{ TppListBuilder.BuildList }

procedure TppListBuilder.BuildList;
begin

  FListView.Items.Clear;

end;   {procedure, BuildList}


{------------------------------------------------------------------------------}
{ TppListBuilder.AddComponent }

procedure TppListBuilder.AddComponent(aComponent: TComponent);
var
  lListItem: TListItem;

begin

  lListItem := ListView.Items.Add;
  lListItem.Data := aComponent;
  lListItem.ImageIndex := GetClassImageIndex(aComponent.ClassName);

end; {procedure, AddComponent}

{------------------------------------------------------------------------------}
{ TppListBuilder.FindComponentItem }

function TppListBuilder.FindComponentItem(aObject: TObject; var aListItem: TListItem): Boolean;
begin

  aListItem := ListView.FindData(0, aObject, True, True);

  Result := (aListItem <> nil)

end; {function, FindComponentItem}


{------------------------------------------------------------------------------}
{ TppListBuilder.RemoveComponent }

procedure TppListBuilder.RemoveComponent(aComponent: TComponent);
var
  lListItem: TListItem;

begin

  if FindComponentItem(aComponent, lListItem) then
    lListItem.Delete;

end; {procedure, RemoveComponent}

{------------------------------------------------------------------------------}
{ TppListBuilder.LanguageChanged }

procedure TppListBuilder.LanguageChanged;
begin


end; {procedure, LanguageChanged}

{------------------------------------------------------------------------------}
{ TppListBuilder.EndDrag }

procedure TppListBuilder.EndDrag(aSource, aTarget: TComponent);
begin


end; {procedure, EndDrag}


{******************************************************************************
 *
 ** O B J E C T  L I S T  B U I L D E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppObjectListBuilder.Create }

constructor TppObjectListBuilder.Create(aListView: TppReportListView);
begin

  inherited Create(aListView);

  {define columns}
  ListView.Columns.Clear;
  ListView.Columns.Add;
  ListView.Columns[0].Width := 300;

  ListView.ShowColumnHeaders := False;
  ListView.SortType  := stNone;
  ListView.ViewStyle := vsReport;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppObjectListBuilder.BuildList }

procedure TppObjectListBuilder.BuildList;
var
  lReport: TppCustomReport;
  lBand: TppBand;
  lRegion: TppCustomRegion;
  liIndex: Integer;

begin

  inherited BuildList;

  if (ListView.CurrentObject = nil) then Exit;

  ListView.SortType := stNone;

  if ListView.CurrentObject is TppReport then
    begin
      lReport := TppReport(ListView.CurrentObject);

      {create band list items}
      for liIndex := 0 to lReport.BandCount-1 do
        AddComponent(lReport.Bands[liIndex]);

    end
  else if (ListView.CurrentObject is TppBand) then
    begin

      lBand :=  TppBand(ListView.CurrentObject);

      {create object list items}
      for liIndex := 0 to lBand.ObjectCount-1 do
        AddComponent(lBand.Objects[liIndex]);

    end

  else if (ListView.CurrentObject is TppCustomRegion) then
    begin

      lRegion :=  TppCustomRegion(ListView.CurrentObject);

      {create object list items}
      for liIndex := 0 to lRegion.ObjectCount-1 do
        AddComponent(lRegion.Objects[liIndex]);

    end;

end; {procedure, BuildList}


{------------------------------------------------------------------------------}
{ TppObjectListBuilder.AddComponent }

procedure TppObjectListBuilder.AddComponent(aComponent: TComponent);
begin

  if not (aComponent is TppComponent) then
    AddObject(TppComponent(aComponent))

  else if (aComponent is TppBand) then
    AddBand(TppBand(aComponent));

end; {procedure, AddComponent}

{------------------------------------------------------------------------------}

{ TppObjectListBuilder.AddBand }

procedure TppObjectListBuilder.AddBand(aBand: TppBand);
var
  lListItem: TListItem;

begin

  lListItem := ListView.Items.Add;
  lListItem.Caption := aBand.Caption;
  lListItem.Data := aBand;
  lListItem.ImageIndex := GetClassImageIndex(aBand.ClassName);

end; {procedure, AddBand}


{------------------------------------------------------------------------------}

{ TppObjectListBuilder.AddObject }

procedure TppObjectListBuilder.AddObject(aObject: TppComponent);
var
  lListItem: TListItem;
  liIndex: Integer;

begin

  liIndex := aObject.ParentIndex;

  if (liIndex < ListView.Items.Count) then
    lListItem := ListView.Items.Insert(liIndex)
  else
    lListItem := ListView.Items.Add;

  lListItem.Caption    := aObject.UserName;
  lListItem.Data       := aObject;
  lListItem.ImageIndex := GetClassImageIndex(aObject.ClassName);

end; {procedure, AddObject}



{------------------------------------------------------------------------------}
{ TppObjectListBuilder.EndDrag }

procedure TppObjectListBuilder.EndDrag(aSource, aTarget: TComponent);
begin
  if (aSource is TppComponent) and (aTarget is TppComponent) then

  TppComponent(aSource).Band.MoveObject(TppComponent(aSource).Index, TppComponent(aTarget).Index);


end; {procedure, EndDrag}


{******************************************************************************
 *
 ** V A R I A B L E  L I S T  B U I L D E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppVariableListBuilder.BuildList }

procedure TppVariableListBuilder.BuildList;
var
  lBand: TppBand;
  liVariable: Integer;

begin

  ListView.Items.Clear;

  if not (ListView.CurrentObject is TppBand) then Exit;

  lBand := TppBand(ListView.CurrentObject);

  {create object list items}
  for liVariable := 0 to lBand.VariableCount-1 do
    AddComponent(lBand.Variables[liVariable]);

end; {procedure, BuildList}


{------------------------------------------------------------------------------}
{ TppVariableListBuilder.AddComponent }

procedure TppVariableListBuilder.AddComponent(aComponent: TComponent);
var
  liIndex: Integer;
  lListItem: TListItem;
  lVariable: TppVariable;

begin

  if not (aComponent is TppVariable) then Exit;

  lVariable := TppVariable(aComponent);

  liIndex := lVariable.CalcOrder;

  if liIndex < ListView.Items.Count then
    lListItem := ListView.Items.Insert(liIndex)
  else
    lListItem := ListView.Items.Add;

  lListItem.Caption    := lVariable.UserName;
  lListItem.Data       := lVariable;
  lListItem.ImageIndex := GetClassImageIndex(lVariable.ClassName);

end; {procedure, AddComponent}


{------------------------------------------------------------------------------}
{ TppVariableListBuilder.EndDrag }

procedure TppVariableListBuilder.EndDrag(aSource, aTarget: TComponent);
begin

  TppVariable(aSource).CalcOrder := TppVariable(aTarget).CalcOrder;

end; {procedure, EndDrag}


{******************************************************************************
 *
 ** F I E L D  L I S T  B U I L D E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppFieldListBuilder.Create }

constructor TppFieldListBuilder.Create(aListView: TppReportListView);
begin

  inherited Create(aListView);

  ListView.Columns.Clear;
  ListView.Columns.Add;
  ListView.Columns.Add;
  ListView.Columns.Add;

  ListView.Columns[0].Caption := ppLoadStr(569) {Name};
  ListView.Columns[0].Width   := 130;

  ListView.Columns[1].Caption := ppLoadStr(445)  {Type};
  ListView.Columns[1].Width   := 70;

  ListView.Columns[2].Caption    := ppLoadStr(583) {Size};
  ListView.Columns[2].Width      := 35;
  ListView.Columns[2].Alignment  := taRightJustify;

  ListView.ShowColumnHeaders := True;
  ListView.ViewStyle := vsReport;
  ListView.SortType  := stText;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppFieldListBuilder.BuildList }

procedure TppFieldListBuilder.BuildList;
var
  lDataPipeline: TppDataPipeline;
  liField: Integer;

begin

  inherited BuildList;

  if not (ListView.CurrentObject is TppDataPipeline) then Exit;

  lDataPipeline := TppDataPipeline(ListView.CurrentObject);

  UpdateCaption;

 {add field info to list view}
  for liField := 0 to lDataPipeline.FieldCount-1 do
    AddComponent(lDataPipeline.Fields[liField]);

end; {procedure, BuildList}

{------------------------------------------------------------------------------}
{ TppFieldListBuilder.AddComponent }

procedure TppFieldListBuilder.AddComponent(aComponent: TComponent);
var
  lListItem: TListItem;
  lField: TppField;
  lsDataType: String;

begin

  if not (aComponent is TppField) then Exit;

  lField := TppField(aComponent);

   {create a new list item}
   lListItem := ListView.Items.Add;

   lListItem.ImageIndex :=  GetClassImageIndex(lField.ClassName);
   lListItem.Caption    := lField.FieldAlias;
   lListItem.Data       := lField;

   {add the field data type info}
   lsDataType := ppGetEnumName(TypeInfo(TppDataType), Ord(lField.DataType));
   lsDataType := Copy(lsDataType, 3, Length(lsDataType));

   lListItem.SubItems.Add(lsDataType);

   {add the field size info}
   if lField.FieldLength > 0 then
     lListItem.SubItems.Add(IntToStr(lField.FieldLength));


end; {procedure, AddComponent}


{------------------------------------------------------------------------------}
{ TppFieldListBuilder.UpdateCaption }

procedure TppFieldListBuilder.UpdateCaption;
var
  lsCaption: String;
begin

  ListView.Columns[0].Caption := ppLoadStr(569) {Name};
  ListView.Columns[1].Caption := ppLoadStr(445) {Type};
  ListView.Columns[2].Caption := ppLoadStr(583) {Size};

  if (ListView.CurrentObject is TppDataPipeline) then
    begin
      {fields for <name>}
      lsCaption := ppLoadStr(642);
      lsCaption := ppSetMessageParameters(lsCaption);

      lsCaption := Format(lsCaption, [TppDataPipeline(ListView.CurrentObject).UserName]);
    end
  else
    lsCaption := '';

  ListView.Caption := lsCaption;


end; {procedure, UpdateCaption}


{------------------------------------------------------------------------------}
{ TppFieldListBuilder.LanguageChanged }

procedure TppFieldListBuilder.LanguageChanged;
begin

  UpdateCaption;

end; {procedure, LanguageChanged}

{------------------------------------------------------------------------------}
{ TppFieldListBuilder.LanguageChanged }

function TppFieldListBuilder.GetHelpContext: String;
begin
  Result := 'TppField_Object;';
end;


{******************************************************************************
 *
 ** L I S T S T A T E S
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppListStates.Create }

constructor TppListStates.Create(aListView: TListView);
begin

  inherited Create;

  FListView  := aListView;
  FListStates := TStringList.Create;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppListStates.Destroy }

destructor TppListStates.Destroy;
begin

  FListStates.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppListStates.Clear }

procedure TppListStates.Clear;
begin
  FListStates.Clear;

end; {procedure, Clear}

{------------------------------------------------------------------------------}
{ TppListStates.Save }

procedure TppListStates.Save(aIndex: Integer);
begin

  if (FListView = nil) or (FListView.Selected = nil) then Exit;

  if (aIndex > FListStates.Count-1) then
    FListStates.Add(FListView.Selected.Caption)
  else
    FListStates[aIndex] := FListView.Selected.Caption;

end; {procedure, Save}


{------------------------------------------------------------------------------}
{ TppListStates.Restore }

procedure TppListStates.Restore(aIndex: Integer);
var
  lListItem: TListItem;
  lsSaveCaption: String;
  
begin

  if (aIndex < 0) or (aIndex >= FListStates.Count) then Exit;

  lsSaveCaption := FListStates[aIndex];

  lListItem := FListView.FindCaption(0, lsSaveCaption, False, True, False);

  if (lListItem <> nil) then
    FListView.Selected := lListItem;


end;  {procedure, Restore}





{******************************************************************************
 *
 ** L I S T V I E W
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppListView.Create }

constructor TppListView.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

{$IFDEF Delphi4}
 { DoubleBuffered := True;} {removed for 4.24}
{$ELSE}
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
{$ENDIF}

  FDrawEnabledItems := False;


end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppListView.Destroy }

destructor TppListView.Destroy;
begin

  FItemBitmap.Free;

{$IFNDEF Delphi4}
  FCanvas.Free;
{$ENDIF}

  inherited Destroy;

end; {destructor, Destroy}


{$IFNDEF Delphi4}

{------------------------------------------------------------------------------}
{ TppListView.CreateParams }

procedure TppListView.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);

  if FOwnerDraw then Params.Style := Params.Style or LVS_OWNERDRAWFIXED;

end; {procedure, CreateParams}

{------------------------------------------------------------------------------}
{ TppListView.SetBounds }

procedure TppListView.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited SetBounds(aLeft, aTop, aWidth, aHeight);

  if not (csLoading in ComponentState) then Resize;

end;  {procedure, SetBounds}


{------------------------------------------------------------------------------}
{ TppListView.Resize }

procedure TppListView.Resize;
begin

  if Assigned(FOnResize) then FOnResize(Self);

end;  {procedure, Resize}




{------------------------------------------------------------------------------}
{ TppListView.SetOwnerDraw }

procedure TppListView.SetOwnerDraw(Value: Boolean);
begin

  if FOwnerDraw <> Value then
    begin
      FOwnerDraw := Value;
      RecreateWnd;
    end;

end;  {procedure, SetOwnerDraw}


{------------------------------------------------------------------------------}
{ TppListView.CNDrawItem }

procedure TppListView.CNDrawItem(var Message: TWMDrawItem);
var
  State: TOwnerDrawState;
  SaveIndex: Integer;
begin

  with Message.DrawItemStruct^ do
    begin
      State := TOwnerDrawState(WordRec(LongRec(itemState).Lo).Lo);
      SaveIndex := SaveDC(hDC);
      FCanvas.Handle := hDC;
      FCanvas.Font := Font;
      FCanvas.Brush := Brush;
      if itemID = DWORD(-1) then
        FCanvas.FillRect(rcItem)
      else
        DrawItem(Items[itemID], rcItem, State);
      FCanvas.Handle := 0;
      RestoreDC(hDC, SaveIndex);
    end;

  Message.Result := 1;

end; {procedure, CNDrawItem}


{------------------------------------------------------------------------------}
{ TppListView.CNNotify }

procedure TppListView.CNNotify(var Message: TWMNotify);
var
  lItem: TListItem;

begin

  inherited;

  with Message do
    case NMHdr^.code of

      LVN_ITEMCHANGED:
        with PNMListView(NMHdr)^ do
          begin
            lItem := Items[iItem];
          {  Change(lItem, uChanged);}
            if Assigned(FOnSelectItem) and (uChanged = LVIF_STATE) then
            begin
              if (uOldState and LVIS_SELECTED <> 0) and
                (uNewState and LVIS_SELECTED = 0) then
                FOnSelectItem(Self, lItem, False)
              else if (uOldState and LVIS_SELECTED = 0) and
                (uNewState and LVIS_SELECTED <> 0) then
                FOnSelectItem(Self, lItem, True);
            end;
          end;
   end;


end; {procedure, CNNotify}


{------------------------------------------------------------------------------}
{ TppListView.DrawItem }

procedure TppListView.DrawItem(Item: TListItem; Rect: TRect; State: TOwnerDrawState);
begin
  if FDrawEnabledItems then
    DrawEnabledItem(Item, Rect, State)

  else if Assigned(OnDrawItem) then OnDrawItem(Self, Item, Rect, State);

end;  {procedure, DrawItem}


{$ELSE}

{------------------------------------------------------------------------------}
{ TppListView.DrawItem }

procedure TppListView.DrawItem(Item: TListItem; Rect: TRect; State: TOwnerDrawState);
begin

  if FDrawEnabledItems then
    DrawEnabledItem(Item, Rect, State)

  else if Assigned(OnDrawItem) then OnDrawItem(Self, Item, Rect, State);

end;  {procedure, DrawItem}

{$ENDIF}


{------------------------------------------------------------------------------}
{ TppListView.DrawEnabledItem }

procedure TppListView.DrawEnabledItem(Item: TListItem; Rect: TRect; State: TOwnerDrawState);
const
  cMargin = 2;
var
  lEnabled: Boolean;
  lRect: TRect;
  lCanvas: TCanvas;

begin
  lEnabled := True;

  if Assigned(FOnDrawEnabledItem) then FOnDrawEnabledItem(Self, Item, lEnabled);

  if FItemBitmap = nil then
    FItemBitmap := TBitmap.Create;

  {size the offscreen bitmap}
  FItemBitmap.Width  := Rect.Right  - Rect.Left;
  FItemBitmap.Height := Rect.Bottom - Rect.Top;

  lCanvas     := FItemBitmap.Canvas;
  lRect       := Classes.Rect(0, 0, FItemBitmap.Width, FItemBitmap.Height);
  lRect.Right := lRect.Left + lCanvas.TextWidth(Item.Caption) + (4 * cMargin);

  {draw background}
  if (odSelected in State) then
    lCanvas.Brush.Color := clHighlight
  else
    lCanvas.Brush.Color := clWindow;

  lCanvas.FillRect(lRect);

  {draw text}
  if (odSelected in State) then
    begin

      if lEnabled then
        lCanvas.Font.Color := clHighlightText
      else
        lCanvas.Font.Color := clBtnFace
    end

  else if (lEnabled) then
    lCanvas.Font.Color := clWindowText
  else
    lCanvas.Font.Color := clBtnFace;

  lCanvas.TextRect(lRect, lRect.Left + cMargin, lRect.Top + cMargin, Item.Caption);


  {copy to ListView.Canvas}
  Rect.Left  := 2;
  Rect.Right := Rect.Left + (lRect.Right - lRect.Left);

  Canvas.CopyRect(Rect, lCanvas, lRect);

  {draw focus rectanlge }
  if (odFocused in State) then
    Canvas.DrawFocusRect(Rect);

end;  {procedure, DrawItem}


{------------------------------------------------------------------------------}
{ TppListView.SetDrawEnabledItems }

procedure TppListView.SetDrawEnabledItems(aValue: Boolean);
begin
  FDrawEnabledItems := aValue;
  OwnerDraw := aValue;

end; {procedure, SetDrawEnabledItems}

{------------------------------------------------------------------------------}
{ TppListView.WMHScroll }

procedure TppListView.WMHScroll(var Message: TWMVScroll);
begin
  inherited;

  DoHorizontalScroll;
  DoScroll;

end; {procedure, WMHScroll}

{------------------------------------------------------------------------------}
{ TppListView.WMVScroll }

procedure TppListView.WMVScroll(var Message: TWMVScroll);
begin
  inherited;

  DoVerticalScroll;
  DoScroll;

end; {procedure, WMVScroll}




{------------------------------------------------------------------------------}
{ TppListView.WMNotify }

procedure TppListView.WMNotify(var Message: TWMNotify);
begin
  inherited;

  if (ViewStyle <> vsReport) then Exit;

  with Message.NMHdr^ do
    case code of
      HDN_ITEMCHANGING:
        with PHDNotify(Pointer(Message.NMHdr))^, PItem^ do
          if (Mask and HDI_WIDTH) <> 0 then
            begin
              Column[Item].Width := cxy;
              DoColumnResize(Column[Item]);
            end;

      {HDN_BEGINTRACK, HDN_ENDTRACK, HDN_TRACK:}

    end;

 end; {procedure, WMNotify}


{$IFNDEF Delphi5}

{------------------------------------------------------------------------------}
{ TppListView.MouseUp }

procedure TppListView.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  lScreenPos: TPoint;

begin
  inherited MouseUp(Button, Shift, X, Y);

  if (Button <> mbRight) or (CustomPopup = nil) then Exit;

  lScreenPos := ClientToScreen(Point(X,Y));

  CustomPopup.PopupComponent := Self;
  CustomPopup.Popup(lScreenPos.X, lScreenPos.Y);

end; {procedure, MouseUp}

{$ENDIF}




{------------------------------------------------------------------------------}
{ TppListView.DoColumnResize }

procedure TppListView.DoColumnResize(aColumn: TListColumn);
begin

  if Assigned(FOnColumnResize) then FOnColumnResize(Self, aColumn);

end; {procedure, DoColumnResize}


{------------------------------------------------------------------------------}
{ TppListView.DoVerticalScroll }

procedure TppListView.DoVerticalScroll;
begin

  if Assigned(FOnVerticalScroll) then FOnVerticalScroll(Self);

end; {procedure, DoVerticalScroll}


{------------------------------------------------------------------------------}
{ TppListView.DoHorizontalScroll }

procedure TppListView.DoHorizontalScroll;
begin

  if Assigned(FOnHorizontalScroll) then FOnHorizontalScroll(Self);

end; {procedure, DoHorizontalScroll}


{------------------------------------------------------------------------------}
{ TppListView.DoScroll }

procedure TppListView.DoScroll;
begin

  if Assigned(FOnScroll) then FOnScroll(Self);

end; {procedure, DoScroll}



{******************************************************************************
 *
 ** R E P O R T  L I S T V I E W
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppReportListView.Create }

constructor TppReportListView.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FDisableUpdates := 0;

  FAllowDrag   := False;
  FBuilding    := False;

  FCurrentObject     := nil;
  FOnAfterBuildList  := nil;
  FOnBeforeBuildList := nil;

  {show selection, even when not focused}
  HideSelection := False;

  OnKeyDown := KeyDownEvent;


end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppReportListView.Destroy }

destructor TppReportListView.Destroy;
begin

  FImage.Free;
  FItemBitmap.Free;

  SetListBuilder(nil);

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppReportListView.KeyDownEvent }

procedure TppReportListView.KeyDownEvent(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if not (Key = VK_F1) or (FListBuilder = nil) then Exit;

  DisplayHelp;

end; {procedure, KeyDownEvent}

{------------------------------------------------------------------------------}
{ TppReportListView.DisplayHelp }

procedure TppReportListView.DisplayHelp;
var
  lsDelphiPath: String;
  lsHelpContext: String;
  lsHelpFile: String;
  lsAppHelpFile: String;
  lMultiKeyHelp: TppMultiKeyHelp;
begin

  lsDelphiPath := ppGetDelphiPath;

  if (lsDelphiPath = '') then Exit;

  lsHelpContext := FListBuilder.GetHelpContext;
  lsHelpFile := FListBuilder.GetHelpFileName;

  if (lsHelpFile = '') then Exit;

  lsAppHelpFile := Application.HelpFile;

  {show ReportBuilder help topic}
  Application.Helpfile := lsDelphiPath + '\Help\' + lsHelpFile;

  if (lsHelpContext = '') then
    Application.HelpCommand(HELP_FINDER, 0)
  else
    begin
      lMultiKeyHelp.mkSize := SizeOf(TppMultiKeyHelp);
      lMultiKeyHelp.mkKeyList := 'A';
      StrPCopy(lMultiKeyHelp.szKeyphrase, lsHelpContext);
      Application.HelpCommand(HELP_MULTIKEY, Integer(@lMultiKeyHelp));
    end;

  {restore App's help file}
  Application.Helpfile := lsAppHelpFile;

end; {procedure, DisplayHelp}


{------------------------------------------------------------------------------}
{ TppReportListView.DrawItem }

procedure TppReportListView.DrawItem(Item: TListItem; Rect: TRect; State: TOwnerDrawState);

begin

  if Assigned(OnDrawItem) then
    OnDrawItem(Self, Item, Rect, State)
  else
    DefaultOwnerDraw(Item, Rect, State);

end;  {procedure, DrawItem}

{------------------------------------------------------------------------------}
{ TppReportListView.DefaultOwnerDraw }

procedure TppReportListView.DefaultOwnerDraw(Item: TListItem; Rect: TRect; State: TOwnerDrawState);
var
  lCanvas: TCanvas;
  liMargin: Integer;
  lTextRect: TRect;
  liCol: Integer;
  lsCaption: String;
  lButtonRect: TRect;
  lDestRect: TRect;
  lColRect: TRect;

begin

  if (FImage = nil) then
    FImage := ppGetMetaBitmap(TppGrippyBitmap);

  if (FItemBitmap = nil) then
    FItemBitmap := TBitMap.Create;

  {size the offscreen bitmap}
  FItemBitmap.Width  := Rect.Right  - Rect.Left;
  FItemBitmap.Height := Rect.Bottom - Rect.Top;

  {save the destination rect}
  lDestRect := Rect;

  {modify the rect for the offscreen bitmap coords}
  Rect := Classes.Rect(0,0, FItemBitmap.Width, FItemBitmap.Height);

  liMargin := 4;

  lCanvas := FItemBitmap.Canvas;

  {clean area}
  lCanvas.Brush.Color := clWindow;
  lCanvas.FillRect(Rect);

  {}
  if odSelected in State then
    begin
      lCanvas.Brush.Color := clHighlight;
      lCanvas.FillRect(Rect);
    end
  else
    begin
      lCanvas.Brush.Color := clBtnFace;
      lCanvas.Font.Color  := clBtnText;
    end;


  {draw button}
  lButtonRect := classes.Rect(Rect.Left+1, Rect.Top + 1, Columns[0].Width - 4,
                                                      Rect.Bottom-3);

  lCanvas.Brush.Color := clBtnFace;
  lCanvas.FillRect(lButtonRect);

  {draw border}
  ppMetaB.ppLine(lCanvas, lButtonRect.Left,  lButtonRect.Bottom, lButtonRect.Right, lButtonRect.Bottom, clBtnShadow);
  ppMetaB.ppLine(lCanvas, lButtonRect.Right, lButtonRect.Bottom, lButtonRect.Right, lButtonRect.Top-1, clBtnShadow);


  {draw image}
  lCanvas.Draw(Rect.Left+3, Rect.Top + 2, FImage);

  {set pen color used to draw grid lines}
  lCanvas.Pen.Color := clBtnFace;

  {draw text}
  lTextRect :=  Classes.Rect(Rect.Left + liMargin + FImage.Width,  Rect.Top + 1, Rect.Right-3, Rect.Bottom-1);

  lTextRect.Top := lTextRect.Top + 1;

  lCanvas.Brush.Style := bsClear;

  for liCol := 0 to Columns.Count-1 do
    begin

      if liCol = 0 then
        begin
          lCanvas.Font.Color := clBtnText;
          lTextRect.Left  :=  lTextRect.Left + 2;
          lTextRect.Right :=  Columns[liCol].Width - 4;
          lsCaption := Item.Caption;
        end
      else
        begin

          if Item.SubItems.Count >= (liCol) then
            lsCaption := Item.SubItems[liCol-1]
          else
            lsCaption := '';

          lTextRect.Right := lTextRect.Left + Columns[liCol].Width - 4;

          if odSelected in State then
            lCanvas.Font.Color := clHighlightText;

        end;

      lColRect := lTextRect;

      if (Columns[liCol].Alignment = taRightJustify) then
        if lCanvas.TextWidth(lsCaption) < (lTextRect.Right - lTextRect.Left) then
          lTextRect.Left := lTextRect.Right - lCanvas.TextWidth(lsCaption);


      {draw caption}
      if (lsCaption <> '') then
        lCanvas.TextRect(lTextRect, lTextRect.Left, lTextRect.Top, lsCaption);

      {draw grid lines}
      ppMetaB.ppLine(lCanvas,lColRect.Right+2, Rect.Top,
                             lColRect.Right+2, Rect.Bottom-1, lCanvas.Pen.Color);

      if liCol = 0 then
        ppMetaB.ppLine(lCanvas, Rect.Left, Rect.Bottom-1,
                                lColRect.Right+2, Rect.Bottom-1, lCanvas.Pen.Color)

      else
        ppMetaB.ppLine(lCanvas, lColRect.Left-2, Rect.Bottom-1,
                                         lColRect.Right+2, Rect.Bottom-1, lCanvas.Pen.Color);

      lTextRect.Left := lTextRect.Right + 4;
    end;

  Canvas.CopyRect(lDestRect, lCanvas, Rect);

end; {procedure, DefaultOwnerDrawItem}


{------------------------------------------------------------------------------}
{ TppReportListView.BeginUpdate }

procedure TppReportListView.BeginUpdate;
begin
  Inc(FDisableUpdates,1);

end; {procedure, BeginUpdate}

{------------------------------------------------------------------------------}
{ TppReportListView.EndUpdate }

procedure TppReportListView.EndUpdate;
begin

  if FDisableUpdates = 0 then Exit;

  Dec(FDisableUpdates,1);

  if FDisableUpdates = 0 then
    BuildList;

end; {procedure, EndUpdate}


{------------------------------------------------------------------------------}
{ TppReportListView.SetClassImages }

procedure TppReportListView.SetClassImages(aClassImageList: TppClassImageList);
begin
  FImageList  := aClassImageList;
  SmallImages := FImageList;

end; {procedure, SetClassImages}

{------------------------------------------------------------------------------}
{ TppReportListView.SetCurrentObject}

procedure TppReportListView.SetCurrentObject(aCurrentObject: TObject);
begin

  FCurrentObject := aCurrentObject;

  BuildList;

end; {procedure, SetCurrentObject}


{------------------------------------------------------------------------------}
{ TppReportListView.SetListBuilder }

procedure TppReportListView.SetListBuilder(aListBuilder: TppListBuilder);
begin
  if (FListBuilder <> nil) then
    FListBuilder.ListView := nil;

  FListBuilder := aListBuilder;

  if (FListBuilder <> nil) then
    FListBuilder.ListView := Self;

end; {procedure, SetListBuilder}

{------------------------------------------------------------------------------}
{ TppReportListView.LanguageChanged }

procedure TppReportListView.LanguageChanged;
begin
  if FListBuilder <> nil then
    FListBuilder.LanguageChanged;

end; {procedure, LanguageChanged}



{------------------------------------------------------------------------------}
{ TppReportListView.BuildList }

procedure TppReportListView.BuildList;
begin

  if (csDestroying in ComponentState) then Exit;

  if FDisableUpdates > 0 then Exit;

  DoBeforeBuildList;

  FBuilding := True;

{$IFDEF Delphi4}
  Items.BeginUpdate;
{$ENDIF}

  if FListBuilder <> nil then
    FListBuilder.BuildList;

  AlphaSort; {new 4.24}

  FBuilding := False;

  if (Items.Count > 0) and (Selected = nil) then
    Selected := Items[0];

{$IFDEF Delphi4}
  Items.EndUpdate;
{$ENDIF}

  DoAfterBuildList;


end; {procedure, BuildList}


{------------------------------------------------------------------------------}
{ TppReportListView.DoBeforeBuildList }

procedure TppReportListView.DoBeforeBuildList;
begin

  {if (ppitCustom in  FItemTypes) then}
  if Assigned(FOnBeforeBuildList) then FOnBeforeBuildList(Self);

end; {procedure, DoBeforeBuildList}

{------------------------------------------------------------------------------}
{ TppReportListView.DoAfterBuildList }

procedure TppReportListView.DoAfterBuildList;
begin

  {if (ppitCustom in  FItemTypes) then}
  if Assigned(FOnAfterBuildList) then FOnAfterBuildList(Self);

end; {procedure, DoAfterBuildList}

{------------------------------------------------------------------------------}
{ TppReportListView.AddComponent }

procedure TppReportListView.AddComponent(aComponent: TComponent);
begin

  FListBuilder.AddComponent(aComponent);

end; {procedure, AddComponent}

{------------------------------------------------------------------------------}
{ TppReportListView.RemoveComponent }

procedure TppReportListView.RemoveComponent(aComponent: TComponent);
var
  lListItem: TListItem;

begin

  if FListBuilder.FindComponentItem(aComponent, lListItem) then
    lListItem.Delete;

end; {procedure, RemoveComponent}


{------------------------------------------------------------------------------}
{ TppReportListView.UpdateComponent }

procedure TppReportListView.UpdateComponent(aComponent: TComponent);
var
  lListItem: TListItem;
  lComponent: TppCommunicator;
  lSelectedComponent: TComponent;

begin

  if not FListBuilder.FindComponentItem(aComponent, lListItem) then Exit;

  if aComponent is TppCommunicator then
    begin
      lComponent := TppCommunicator(lListItem.Data);

      if (lListItem.Caption <> lComponent.UserName) then
        begin
         lListItem.Caption := lComponent.UserName;
         Exit;
        end;

    end;

  lSelectedComponent := GetSelectedComponent;
  RemoveComponent(aComponent);
  AddComponent(aComponent);
  SelectComponent(lSelectedComponent);


end;  {procedure, UpdateComponent}



{------------------------------------------------------------------------------}
{ TppReportListView.FindComponentItem }

function TppReportListView.FindComponentItem(aObject: TObject; var aListItem: TListItem): Boolean;
begin

  Result := FListBuilder.FindComponentItem(aObject, aListItem);

end; {procedure, FindComponentItem}


{------------------------------------------------------------------------------}
{ TppReportListView.GetSelectedComponent}

function TppReportListView.GetSelectedComponent: TComponent;
begin

  if (Selected = nil) then
    Result := nil
  else
    try
      Result := TComponent(Selected.Data);
    except
      Result := nil;
    end;

end; {procedure, GetSelectedComponent}

{------------------------------------------------------------------------------}
{ TppReportListView.SelectComponent }

procedure TppReportListView.SelectComponent(aObject: TObject);
var
  lListItem: TListItem;

begin
  if FListBuilder.FindComponentItem(aObject, lListItem) then
    Selected := lListItem;

end; {procedure, SelectComponent}


{------------------------------------------------------------------------------}
{ TppReportListView.DoOnMessage }

procedure TppReportListView.DoOnMessage(aMessage: String);
begin

  if Assigned(FOnMessage) then FOnMessage(Self, aMessage);

end; {function, DoOnMessage}

{------------------------------------------------------------------------------}
{ TppReportListView.DragOver }

procedure TppReportListView.DragOver(Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
  lListItem: TListItem;

begin

  inherited DragOver(Source, X, Y, State, Accept);

  if not FAllowDrag then Exit;

  lListItem := GetItemAt(X,Y);

  if (lListItem = nil) then Exit;

  if (lListItem <> Selected) then
    Accept := True;


end; {procedure, DragOver}

{------------------------------------------------------------------------------}
{ TppReportListView.MouseDown }

procedure TppReportListView.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  lListItem: TListItem;

begin

  if (Button  <> mbLeft) then Exit;

  inherited MouseDown(Button, Shift, X, Y);

  if not FAllowDrag then Exit;

  lListItem  := GetItemAt(X,Y);

  if (lListItem <> nil) then
    BeginDrag(False);

end;  {procedure, MouseDown}

{------------------------------------------------------------------------------}
{ TppReportListView.DoEndDrag }

procedure TppReportListView.DoEndDrag(Target: TObject; X, Y: Integer);
var
  lListItem: TListItem;
  lSourceComponent: TppComponent;
  lTargetComponent: TppComponent;

begin

  inherited DoEndDrag(Target, X, Y);

  if not FAllowDrag then Exit;


  if (Target = nil) then Exit;

  lListItem  := GetItemAt(X,Y);

  if (lListItem = nil) then Exit;

  if not (TObject(lListItem.Data) is TppComponent) then Exit;

  {get target and source components}
  lTargetComponent := TppComponent(lListItem.Data);
  lSourceComponent := TppComponent(Selected.Data);

  FListBuilder.EndDrag(lSourceComponent, lTargetComponent);

  {rebuild the list view}
  UpdateComponent(lSourceComponent);

end;  {procedure, DoEndDrag}



{******************************************************************************
 *
 ** C U S T O M  R E P O R T  E X P L O R E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.Create }

constructor TppCustomReportExplorer.Create(aParent: TWinControl;  aOrientation: TppExplorerOrientation);
begin

  inherited Create;

  FParent := aParent;

  FLanguageIndex := 0;
  FReport := nil;
  FShowTitleBar := True;


  FImageList := TppClassImageList.Create(FParent);

  FTreePanel := TPanel.Create(FParent);
  FTreePanel.Parent := FParent;

  if aOrientation = ppeoHorizontal then
    FTreePanel.Align  := alLeft
  else
    FTreePanel.Align  := alTop;

  FTreePanel.BevelOuter := bvNone;
  FTreePanel.Height  := aParent.Height div 2;
  FTreePanel.Width   := 250;

  FTreeTitleBar := TppBevel.Create(FTreePanel);
  FTreeTitleBar.Parent := FTreePanel;
  FTreeTitleBar.Align  := alTop;
  FTreeTitleBar.Height := 21;

  FTreeView := GetReportTreeViewClass.Create(FTreePanel);
  FTreeView.Parent    := FTreePanel;
  FTreeView.Align     := alClient;
  FTreeView.OnChange  := TreeViewChangeEvent;
  FTreeView.OnEditing := TreeViewEditingEvent;
  FTreeView.OnEdited  := TreeViewEditedEvent;
  FTreeView.OnMessage := ChildMessageEvent;

  FTreeView.AfterBuildTree := TreeViewAfterBuildEvent;
  FTreeView.ClassImages := FImageList;

  FTreeBuilder := nil;
  FListBuilder := nil;

  {FTreeStates := TppTreeStates(FTreeView);}


  FSplitter := TSplitter.Create(FParent);
  FSplitter.Parent  := FParent;

  if aOrientation = ppeoHorizontal then
    begin
      FSplitter.Left    := FTreeView.Left + FTreeView.Width;
      FSplitter.Align   := alLeft;
      FSplitter.Cursor  := crHSplit;
    end
  else
    begin
      FSplitter.Top     := FTreeView.Top + FTreeView.Height;
      FSplitter.Align   := alTop;
      FSplitter.Cursor  := crVSplit;
    end;
    
  FSplitter.Width   := 2;
  FSplitter.Beveled := False;
  
  FListPanel := TPanel.Create(FParent);
  FListPanel.Parent := FParent;
  FListPanel.Align  := alClient;
  FListPanel.BevelOuter := bvNone;

  FListTitleBar := TppBevel.Create(FListPanel);
  FListTitleBar.Parent  := FListPanel;
  FListTitleBar.Align   := alTop;
  FListTitleBar.Height  := 21;

  FListView := GetReportListViewClass.Create(aParent.Owner);
  FListView.Parent := FListPanel;
  FListView.Align  := alClient;
  FListView.ClassImages := FImageList;
  FListView.OnAfterBuildList := BuildListEvent;
  FListView.OnEditing := ListViewEditingEvent;
  FListView.OnEdited  := ListViewEditedEvent;
  FListView.OnMessage := ChildMessageEvent;

  {must do these after assigning the parent}
 { FListView.GridLines := True;}
{  FListView.Columns.Add;
  FListView.Columns[0].Width := 250;}


end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.Destroy }

destructor TppCustomReportExplorer.Destroy;
begin

  FTreeBuilder.Free;
  FListBuilder.Free;

  FTreeStates.Free;
  FListStates.Free;

  {FTreeStates.Free;}

  {FTreeView.Free;
  FTreeTitleBar.Free;
  FTreePanel.Free;

  FListView.Free;
  FListTitleBar.Free;
  FListPanel.Free;

  FSplitter.Free;}

  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.GetReportTreeViewClass }

class function TppCustomReportExplorer.GetReportTreeViewClass: TppReportTreeViewClass;
begin
  Result := TppReportTreeView;
end; {class function, GetReportTreeViewClass}

{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.GetReportListViewClass }

class function TppCustomReportExplorer.GetReportListViewClass: TppReportListViewClass;
begin
  Result := TppReportListView;
end; {class function, GetReportListViewClass}


{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.GetTreeCaption }

function TppCustomReportExplorer.GetTreeCaption: String;
begin
  Result := FTreeTitleBar.Caption;
end; {procedure, GetTreeCaption}

{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.GetListCaption }

function TppCustomReportExplorer.GetListCaption: String;
begin
  Result := FListTitleBar.Caption;

end; {procedure, GetListCaption}

{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.SetTreeCaption }

procedure TppCustomReportExplorer.SetTreeCaption(aCaption: String);
begin
  FTreeTitleBar.Caption := aCaption;

end; {procedure, SetTreeCaption}

{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.SetListCaption }

procedure TppCustomReportExplorer.SetListCaption(aCaption: String);
begin
  FListTitleBar.Caption := aCaption;

end; {procedure, SetListCaption}

{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.Refresh }

procedure TppCustomReportExplorer.Refresh;
var
  lTreeStates: TppTreeStates;
  lListStates: TppListStates;

begin
  lTreeStates := TppTreeStates.Create(FTreeView);
  lListStates := TppListStates.Create(FListView);

  lTreeStates.Save(0);
  lListStates.Save(0);

  FTreeView.Rebuild;

  lTreeStates.Restore(0);
  lListStates.Restore(0);

  lTreeStates.Free;
  lListStates.Free;

end; {procedure, Refresh}

{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.SaveState }

procedure TppCustomReportExplorer.SaveState(aIndex: Integer);
begin
  if (FTreeStates = nil) then
    begin
      FTreeStates := TppTreeStates.Create(FTreeView);
      FListStates := TppListStates.Create(FListView);
    end;

  FTreeStates.Save(aIndex);
  FListStates.Save(aIndex);

end;  {procedure, SaveState}

{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.RestoreState }

procedure TppCustomReportExplorer.RestoreState(aIndex: Integer);
begin
  if FTreeStates = nil then Exit;
  
  FTreeStates.Restore(aIndex);
  FListStates.Restore(aIndex);

end;  {procedure, RestoreState}

{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.ClearState }

procedure TppCustomReportExplorer.ClearState;
begin
  if FTreeStates = nil then Exit;

  FTreeStates.Clear;
  FListStates.Clear;

end;  {procedure, ClearState}


{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.SetReport }

procedure TppCustomReportExplorer.SetReport(aReport: TppCustomReport);
begin

  FReport := aReport;

  FListView.Items.Clear;

  FTreeView.Report := aReport;

  if (aReport <> nil) then
    SetLanguage(aReport.LanguageIndex);

end; {procedure, SetReport}


{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.SetShowTitlebar}

procedure TppCustomReportExplorer.SetShowTitlebar(aValue: Boolean);
begin

  FShowTitlebar := aValue;

  FTreeTitleBar.Visible := aValue;
  FListTitleBar.Visible := aValue;

end; {procedure, SetShowTitlebar}


{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.SetLanguage }

procedure TppCustomReportExplorer.SetLanguage(aLanguageIndex: Longint);
begin

  if (FLanguageIndex = aLanguageIndex) then Exit;

  FLanguageIndex := aLanguageIndex;

  LanguageChanged;

end; {procedure, SetLanguage}

{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.LangaugeChanged }

procedure TppCustomReportExplorer.LanguageChanged;
begin
  FListView.LanguageChanged;
  ListCaption := FListView.Caption;
  
end; {procedure, LanguageChanged}

{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.BuildListEvent }

procedure TppCustomReportExplorer.BuildListEvent(Sender: TObject);
begin

  ListCaption := FListView.Caption;

end; {procedure, BuildListEvent}

{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.TreeViewChangeEvent }

procedure TppCustomReportExplorer.TreeViewChangeEvent(Sender: TObject; Node: TTreeNode);
begin

  if FTreeView.Building then Exit;

{$IFDEF Delphi4}
  FListView.Items.BeginUpdate; {new 4.24}

  FListView.Items.Clear;
{$ELSE}

  FListView.Items.Clear;

  {force a repaint}
  FListView.Refresh;

  FListView.Items.BeginUpdate;
{$ENDIF}

  FListview.CurrentTreeNode := Node;
  FListView.CurrentObject   := TObject(Node.Data);

  FListView.Items.EndUpdate;

  if Assigned(FOnTreeViewChange) then FOnTreeViewChange(Sender, Node);


end; {procedure, TreeViewChangeEvent}

{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.TreeViewAfterBuildEvent }

procedure TppCustomReportExplorer.TreeViewAfterBuildEvent(Sender: TObject);
begin

  if (FTreeView.Selected <> nil) then
    begin
      FListView.CurrentTreeNode := FTreeView.Selected;
      FListView.CurrentObject   := TObject(FTreeView.Selected.Data);
    end
   else
    begin
      FListView.CurrentTreeNode := nil;
      FListView.CurrentObject   := nil;
    end;


end; {procedure, TreeViewAfterBuildEvent}


{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.TreeViewEditingEvent }

procedure TppCustomReportExplorer.TreeViewEditingEvent(Sender: TObject; Node: TTreeNode; var AllowEdit: Boolean);
var
  lNodeObject: TObject;

begin

  lNodeObject := TObject(Node.Data);

  if (lNodeObject = nil) or not (lNodeObject is TppComponent) then
    AllowEdit := False;

end; {procedure, TreeViewAfterBuildEvent}

{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.TreeViewEditedEvent }

procedure TppCustomReportExplorer.TreeViewEditedEvent(Sender: TObject; Node: TTreeNode; var S: string);
var
  lNodeObject: TppComponent;
  liStringId: Integer;
  lsMessage: String;

begin

  lNodeObject := TppComponent(Node.Data);

  if (lNodeObject = nil) then Exit;

  DoOnBeforeEdit;

  {try to set user name}
  lNodeObject.UserName := S;

  {reassign the user name in case it was not valid}
  if lNodeObject.UserName = S then

    DoOnAfterEdit

  else
    begin
     if not IsValidIdent(S) then

       {<name> is not a valid identifier'}
       liStringId := 640
      else
       {<name> is not a unique identifier'}
        liStringId := 641;

      {format the message}
      lsMessage := ppLoadStr(liStringId);
      lsMessage := ppSetMessageParameters(lsMessage);
      lsMessage := Format(lsMessage, [S]);

      DoOnMessage(lsMessage);

      S := lNodeObject.UserName;
    end;


end; {procedure, TreeViewEditedEvent}

{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.ListViewEditingEvent }

procedure TppCustomReportExplorer.ListViewEditingEvent(Sender: TObject; Item: TListItem; var AllowEdit: Boolean);
var
  lListObject: TObject;

begin

  lListObject := TObject(Item.Data);

  if (lListObject = nil) or not (lListObject is TppComponent) then
    AllowEdit := False;


end; {procedure, ListViewEditingEvent}

{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.ListViewEditedEvent }

procedure TppCustomReportExplorer.ListViewEditedEvent(Sender: TObject; Item: TListItem; var S: string);
var
  lListObject: TppComponent;
  liStringId: Integer;
  lsMessage: String;


begin

  lListObject := TppComponent(Item.Data);

  if (lListObject = nil) then Exit;

  DoOnBeforeEdit;

  {try to set user name}
  lListObject.UserName := S;

  {reassign the user name in case it was not valid}
  if lListObject.UserName = S then

    DoOnAfterEdit

  else

    begin
      if not IsValidIdent(S) then

       {<name> is not a valid identifier'}
       liStringId := 640
      else
       {<name> is not a unique identifier'}
        liStringId := 641;

      {format the message}
      lsMessage := ppLoadStr(liStringId);
      lsMessage := ppSetMessageParameters(lsMessage);
      lsMessage := Format(lsMessage, [S]);

      DoOnMessage(lsMessage);

      S := lListObject.UserName;
    end;


end; {procedure, ListViewEditedEvent}


{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.ChildMessageEvent }

procedure TppCustomReportExplorer.ChildMessageEvent(Sender: TObject; aMessage: String);
begin

  {pass thru event}
  DoOnMessage(aMessage);

end; {procedure, ChildMessageEvent}


{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.DoOnMessage }

procedure TppCustomReportExplorer.DoOnMessage(aMessage: String);
begin

  if Assigned(FOnMessage) then FOnMessage(Self, aMessage);

end; {procedure, DoOnMessage}


{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.DoOnBeforeEdit}

procedure TppCustomReportExplorer.DoOnBeforeEdit;
begin

  if Assigned(FOnBeforeEdit) then FOnBeforeEdit(Self);

end; {procedure, DoOnBeforeEdit}

{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.DoOnAfterEdit}

procedure TppCustomReportExplorer.DoOnAfterEdit;
begin

  if Assigned(FOnAfterEdit) then FOnAfterEdit(Self);

end; {procedure, DoOnAfterEdit}

end.








