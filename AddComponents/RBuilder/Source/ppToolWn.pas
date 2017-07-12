{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppToolWn;

interface

{$I ppIfDef.pas}

uses
   Windows, SysUtils, Controls, ComCtrls, Classes, Graphics, ExtCtrls, Menus,
   Forms, StdCtrls, IniFiles, Messages,
   ppComm, ppClass, ppCmpReg, ppTypes, ppUtils, ppSubRpt, ppReport,
   ppRegion, ppTb97x, ppCtrls, ppDB, ppRptWiz, Dialogs, ppMetaAL, ppTreeVw,
   ppClasUt;

type


  { TppAutoLayoutManager}
  TppAutoLayoutManager = class(TObject)
    private
      FBitmap: TBitmap;
      FMetaBitmap: TppAutoLayoutBitmap;
      FBevelCreate: TBevel;
      FBevelImage: TBevel;
      FBevelField: TBevel;
      FBevelLabel: TBevel;
      FCheckboxFieldGrid: TCheckbox;
      FCheckboxLabelGrid: TCheckbox;
      FImage: TImage;
      FLabelCreate: TLabel;
      FLabelLayout: TLabel;
      FLabelLabelFont: TLabel;
      FLabelFieldFont: TLabel;
      FFontButtonLabel: TppToolbarButton;
      FFontButtonField: TppToolbarButton;
      FComboLayout: TComboBox;
      FRadioFields: TRadioButton;
      FRadioLabels: TRadioButton;
      FRadioFieldsNLabels: TRadioButton;
      FLanguageIndex: Longint;
      FOnChange: TNotifyEvent;

      procedure DoOnChange;

      function GetCreateFields: Boolean;
      function GetCreateLabels: Boolean;
      function GetFieldFont: TFont;
      function GetFieldGrid: Boolean;
      function GetLabelFont: TFont;
      function GetLabelGrid: Boolean;
      function GetLayoutType: TppReportLayoutType;

      procedure SetCreateFields(aValue: Boolean);
      procedure SetCreateLabels(aValue: Boolean);
      procedure SetFieldFont(aFont: TFont);
      procedure SetFieldGrid(aValue: Boolean);
      procedure SetLabelFont(aFont: TFont);
      procedure SetLabelGrid(aValue: Boolean);
      procedure SetLanguageIndex(aLanguageIndex: Longint);
      procedure SetLayoutType(aLayoutType: TppReportLayoutType);

      procedure CheckboxLabelGridClickEvent(Sender: TObject);
      procedure CheckboxFieldGridClickEvent(Sender: TObject);
      procedure FontButtonLabelClickEvent(Sender: TObject);
      procedure FontButtonFieldClickEvent(Sender: TObject);
      procedure ComboLayoutChangeEvent(Sender: TObject);
      procedure RadioFieldsNLabelsClickEvent(Sender: TObject);
      procedure RadioLabelsClickEvent(Sender: TObject);
      procedure RadioFieldsClickEvent(Sender: TObject);
      procedure UpdateBitmap;

      procedure LabelLabelFontClickEvent(Sender: TObject);
      procedure LabelFieldFontClickEvent(Sender: TObject);

    public
      constructor Create(aOwner: TComponent; aParent: TWinControl);
      destructor Destroy; override;

      procedure EnableControls;

      property LabelFont: TFont read GetLabelFont write SetLabelFont;
      property FieldFont: TFont read GetFieldFont write SetFieldFont;
      property LayoutType: TppReportLayoutType read GetLayoutType write SetLayoutType;
      property CreateFields: Boolean read GetCreateFields write SetCreateFields;
      property CreateLabels: Boolean read GetCreateLabels write SetCreateLabels;
      property LabelGrid: Boolean read GetLabelGrid write SetLabelGrid;
      property FieldGrid: Boolean read GetFieldGrid write SetFieldGrid;
      property LanguageIndex: Longint read FLanguageIndex write SetLanguageIndex;

      property OnChange: TNotifyEvent read FOnChange write FOnChange;

    end; {class, TppAutoLayoutManager}



  {TppAutoLayout}
  TppAutoLayout = class(TObject)
    private
      FFieldComponents: TList;
      FFieldGrid: TList;
      FLabelComponents: TList;
      FLabelGrid: TList;
      FStartingPos: TPoint;
      FLabelPos: TPoint;
      FFieldPos: TPoint;

    protected
      function CalcStartingLabelPos: TPoint;  virtual; abstract;
      function CalcStartingFieldPos: TPoint;  virtual; abstract;

      function IncludeFields: Boolean;
      function IncludeLabels: Boolean;
      function IncludeFieldGrid: Boolean;
      function IncludeLabelGrid: Boolean;
      function GetComponentCount: Integer;

      property LabelPos: TPoint read FLabelPos write FLabelPos;
      property FieldPos: TPoint read FFieldPos write FFieldPos;

    public
      constructor Create;
      destructor Destroy; override;

      procedure CreateLayout; virtual; abstract;

      property FieldComponents: TList read FFieldComponents;
      property FieldGrid: TList read FFieldGrid;
      property LabelComponents: TList read FLabelComponents;
      property LabelGrid: TList read FLabelGrid;
      property StartingPos: TPoint read FStartingPos write FStartingPos;

    end; {class, TppAutoLayout}


  {TppAutoLayoutTabular}
  TppAutoLayoutTabular = class(TppAutoLayout)
    private
      FLabelBandWidth: Integer;
      FFieldBandWidth: Integer;

   protected
      function CalcStartingLabelPos: TPoint; override;
      function CalcStartingFieldPos: TPoint;  override;

       function CalcNextLabelPos(aIndex: Integer): TPoint;
       function CalcNextFieldPos(aIndex: Integer): TPoint;
       function CalcLineHeight: Integer;


    public
      procedure CreateLayout; override;

    end; {class, TppAutoLayoutTabular}


  {TppAutoLayoutVertical}
  TppAutoLayoutVertical = class(TppAutoLayout)
  private

   protected
     function CalcStartingLabelPos: TPoint; override;
     function CalcStartingFieldPos: TPoint;  override;

     function CalcNextLabelPos(aIndex: Integer): TPoint;
     function CalcNextFieldPos(aIndex: Integer): TPoint;

     function CalcFieldColWidth: Integer;
     function CalcLineHeight(aIndex: Integer): Integer;


    public
      procedure CreateLayout; override;

    end; {class, TppAutoLayoutVertical}


  { TppDataExplorer }
  TppDataExplorer = class(TppCustomReportExplorer)
    private
      FLanguageIndex: Longint;
      FSelection: TList;
      FChangeItemSelected: Boolean;

      procedure ListViewChangingEvent(Sender: TObject; Item: TListItem; Change: TItemChange; var AllowChange: Boolean);
      procedure ListViewChangeEvent(Sender: TObject; Item: TListItem; Change: TItemChange);
      procedure SetLanguageIndex(aLanguageIndex: Longint);

    public
      constructor Create(aParent: TWinControl; aOrientation: TppExplorerOrientation); override;
      destructor Destroy; override;

      procedure GetSelectedFields(aFieldList: TList);


      property LanguageIndex: Longint read FLanguageIndex write SetLanguageIndex;


  end; {class, TppDataExplorer}


  { TppDataTreeWindow }
  TppDataTreeWindow = class(TppToolWindow)
    private
      FPageControl: TPageControl;
      FLayoutManager: TppAutoLayoutManager;
      FReport: TppCustomReport;
      FTreeMenu: TPopupMenu;
      FLabelFont: TFont;
      FFieldFont: TFont;
      FLabelGrid: Boolean;
      FFieldGrid: Boolean;
      FLayoutType: TppReportLayoutType;
      FCreateFields: Boolean;
      FCreateLabels: Boolean;
      FChangeItemSelected: Boolean;
      FDockChanging: Boolean;
      FDataExplorer: TppDataExplorer;
      FListView: TppReportListView;
      FTreeView: TppReportTreeView;

      procedure BuildPopupMenu;

      procedure PageControlChangingEvent(Sender: TObject; var AllowChange: Boolean);

      procedure SetLabelFont(aFont: TFont);
      procedure SetFieldFont(aFont: TFont);
      procedure SetReport(aCustomReport: TppCustomReport);

      procedure LayoutManagerChangeEvent(Sender: TObject);

      procedure CMVisibleChanged (var Message: TMessage); message CM_VISIBLECHANGED;
      procedure TreeMenuItemClickEvent(Sender: TObject);
      procedure ListViewMouseDownEvent(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure ListViewMouseUpEvent(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    protected
      procedure SetLanguageIndex(aLanguageIndex: Longint); override;

      procedure DoOnDockChanging; override;
      procedure DoOnDockChanged; override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

{$IFDEF Delphi4}
     procedure LoadPreferences(aIniFile: TCustomIniFile); override;
     procedure SavePreferences(aIniFile: TCustomIniFile); override;
{$ELSE}
      procedure LoadPreferences(aIniFile: TIniFile); override;
      procedure SavePreferences(aIniFile: TIniFile); override;
{$ENDIF}

      procedure CreateComponentsForFields(aBand: TppBand; X, Y: Integer; var aComponents: TList);
      procedure Refresh;

      property Report: TppCustomReport read FReport write SetReport;

      property CreateFields: Boolean read FCreateFields write FCreateFields;
      property CreateLabels: Boolean read FCreateLabels write FCreateLabels;
      property LabelFont: TFont read FLabelFont write SetLabelFont;
      property LabelGrid: Boolean read FLabelGrid write FLabelGrid;
      property FieldFont: TFont read FFieldFont write SetFieldFont;
      property FieldGrid: Boolean read FFieldGrid write FFieldGrid;
      property LayoutType: TppReportLayoutType read FLayoutType write FLayoutType;

    end; {class, TppDataTreeWindow}


  { TppReportTreeWindow }
  TppReportTreeWindow = class(TppToolWindow)
  private
    FOnComponentSelected: TNotifyEvent;
    FOnReportSelected: TNotifyEvent;
    FObjectPanel: TPanel;
    FObjectTitleBar: TppBevel;
    FObjectTree: TppReportTreeView;
    FReportPanel: TPanel;
    FReportTitleBar: TppBevel;
    FReportTree: TppReportTreeView;
    FReport: TppCustomReport;
    FActive: Boolean;
    FSplitter: TSplitter;
    FTreeMenu: TPopupMenu;
    FOnMessage: TppMessageEvent;
    FShowTitlebar: Boolean;
    FReportTreeBuilder: TppReportOutlineTreeBuilder;
    FObjectTreeBuilder: TppReportObjectTreeBuilder;
    FTreeStates: TppTreeStates;

    function AllowTreeNodeEditText(aNode: TTreeNode): Boolean;
    procedure BuildPopupMenu;
    procedure SetReport(aReport: TppCustomReport);
    procedure ObjectTreeChangeEvent(Sender: TObject; Node: TTreeNode);
    procedure ReportTreeChangeEvent(Sender: TObject; Node: TTreeNode);
    procedure TreeMenuItemClickEvent(Sender: TObject);
    procedure SetTreesVisible(aReportTreeVisible, aObjectTreeVisible: Boolean);
    procedure TreeViewEditingEvent(Sender: TObject; Node: TTreeNode; var AllowEdit: Boolean);
    procedure TreeViewEditedEvent(Sender: TObject; Node: TTreeNode; var S: string);
    procedure SetShowTitlebar(aValue: Boolean);
    function  FindReportNode(aReport: TComponent; var aNode: TTreeNode): Boolean;
    procedure PopupMenuEvent(Sender: TObject);

  protected

    procedure DoOnMessage(aMessage: String);
    function GetSelectedComponent: TComponent;
    function GetSelectedReport: TComponent;
    procedure SetLanguageIndex(aLanguageIndex: Longint); override;
    procedure WindowRecreatedEvent(Sender: TObject); virtual;
    procedure WindowRecreatingEvent(Sender: TObject); virtual;

  public

    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;


{$IFDEF Delphi4}
     procedure LoadPreferences(aIniFile: TCustomIniFile); override;
     procedure SavePreferences(aIniFile: TCustomIniFile); override;
{$ELSE}
      procedure LoadPreferences(aIniFile: TIniFile); override;
      procedure SavePreferences(aIniFile: TIniFile); override;
{$ENDIF}

    procedure AddComponent(aComponent: TComponent);
    procedure RemoveComponent(aComponent: TComponent);
    procedure UpdateComponent(aComponent: TComponent);

    procedure AddChildReport(const aCaption: String; aChildReport: TComponent);
    procedure RemoveChildReport(aChildReport: TComponent);

    procedure SelectComponent(aComponent: TComponent);
    procedure SelectReport(aReport: TComponent);
    procedure Rebuild;

    property LanguageIndex;
    property Report: TppCustomReport read FReport write SetReport;

    property SelectedComponent: TComponent read GetSelectedComponent;
    property SelectedReport: TComponent read GetSelectedReport;
    property ShowTitlebar: Boolean read FShowTitlebar write SetShowTitlebar;

    property OnComponentSelected: TNotifyEvent read FOnComponentSelected write FOnComponentSelected;
    property OnMessage: TppMessageEvent read FOnMessage write FOnMessage;
    property OnReportSelected: TNotifyEvent read FOnReportSelected write FOnReportSelected;

  end; {class, TppReportTreeWindow }




implementation

uses
  ppIDE;



{******************************************************************************
 *
 ** L A Y O U T M A N A G E R
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.Create }

constructor TppAutoLayoutManager.Create(aOwner: TComponent; aParent: TWinControl);
var
  lFont: TFont;

begin

  inherited Create;

  FOnChange := nil;

  lFont := TFont.Create;
  lFont.Name := 'MS Sans Serif';
  lFont.Size := 8;


  FBitmap := TBitmap.Create;
  FMetaBitmap := TppAutoLayoutBitmap.Create;

  {create bevel frame for top half of window}
  FBevelCreate := TBevel.Create(aOwner);
  FBevelCreate.Parent := aParent;
  FBevelCreate.Shape := bsFrame;
  FBevelCreate.SetBounds(0,5,167,113);

  {create bevel line for the label section}
  FBevelLabel := TBevel.Create(aOwner);
  FBevelLabel.Parent := aParent;
  FBevelLabel.Shape := bsTopLine;
  FBevelLabel.SetBounds(2,51,163,5);

  {create bevel line for the field section}
  FBevelField := TBevel.Create(aOwner);
  FBevelField.Parent := aParent;
  FBevelField.Shape := bsTopLine;
  FBevelField.SetBounds(2,85,163,5);

  {create bevel for image at bottom half of window}
  FBevelImage := TBevel.Create(aOwner);
  FBevelImage.Parent := aParent;
  FBevelImage.Shape := bsBox;
  FBevelImage.SetBounds(1,124,167,150);

  FImage := TImage.Create(aOwner);
  FImage.Parent := aParent;
  FImage.SetBounds(4,127,161,144);
  FImage.Picture.Bitmap := FBitmap;

  FLabelCreate := TLabel.Create(aOwner);
  FLabelCreate.Parent := aParent;
  FLabelCreate.Font.Assign(lFont);
  FLabelCreate.SetBounds(10,0,32,13);
  FLabelCreate.AutoSize := True;

  FLabelLayout := TLabel.Create(aOwner);
  FLabelLayout.Parent := aParent;
  FLabelLayout.Font.Assign(lFont);
  FLabelLayout.SetBounds(84,0,32,13);
  FLabelLayout.AutoSize := True;

  FLabelLabelFont := TLabel.Create(aOwner);
  FLabelLabelFont.Parent := aParent;
  FLabelLabelFont.Font.Assign(lFont);
  FLabelLabelFont.AutoSize := True;
  FLabelLabelFont.SetBounds(112,60,21,13);
  FLabelLabelFont.OnClick := LabelLabelFontClickEvent;
  FLabelLabelFont.Alignment := taRightJustify;

  FLabelFieldFont := TLabel.Create(aOwner);
  FLabelFieldFont.Parent := aParent;
  FLabelFieldFont.Font.Assign(lFont);
  FLabelFieldFont.SetBounds(112,96,21,13);
  FLabelFieldFont.AutoSize := True;
  FLabelFieldFont.OnClick := LabelFieldFontClickEvent;
  FLabelFieldFont.Alignment := taRightJustify;

  FFontButtonLabel := TppFontButton.Create(aOwner);
  FFontButtonLabel.Parent := aParent;
  TppFontButton(FFontButtonLabel).FontAttributeType := faFontName;
  FFontButtonLabel.Left := 139;
  FFontButtonLabel.Top := 57;
  TppFontButton(FFontButtonLabel).CurrentFont.Name  := 'Times New Roman';
  TppFontButton(FFontButtonLabel).CurrentFont.Size  := 12;
  TppFontButton(FFontButtonLabel).CurrentFont.Style := [fsBold];
  FFontButtonLabel.OnClick := FontButtonLabelClickEvent;

  FFontButtonField := TppFontButton.Create(aOwner);
  FFontButtonField.Parent  := aParent;
  TppFontButton(FFontButtonField).FontAttributeType := faFontName;

 { FFontButtonField.Flat := False;}
  FFontButtonField.Left := 139;
  FFontButtonField.Top := 92;
  TppFontButton(FFontButtonLabel).CurrentFont.Name := 'Times New Roman';
  TppFontButton(FFontButtonLabel).CurrentFont.Size := 12;
  FFontButtonField.OnClick := FontButtonFieldClickEvent;

  FComboLayout := TComboBox.Create(aOwner);
  FComboLayout.Parent := aParent;
  FComboLayout.Font.Assign(lFont);
  FComboLayout.SetBounds(82,17,81,21);
  FComboLayout.OnChange := ComboLayoutChangeEvent;

  FRadioFieldsNLabels := TRadioButton.Create(aOwner);
  FRadioFieldsNLabels.Parent := aParent;
  FRadioFieldsNLabels.Font.Assign(lFont);
  FRadioFieldsNLabels.SetBounds(10,18, 55, 17);
  FRadioFieldsNLabels.Checked := True;
  FRadioFieldsNLabels.OnClick := RadioFieldsNLabelsClickEvent;

  FRadioLabels := TRadioButton.Create(aOwner);
  FRadioLabels.Parent := aParent;
  FRadioLabels.Font.Assign(lFont);
  FRadioLabels.SetBounds(10,44, 55, 17);
  FRadioLabels.OnClick := RadioLabelsClickEvent;


  FRadioFields := TRadioButton.Create(aOwner);
  FRadioFields.Parent := aParent;
  FRadioFields.Font.Assign(lFont);
  FRadioFields.SetBounds(10,78, 55, 17);
  FRadioFields.OnClick := RadioFieldsClickEvent;

  FCheckboxLabelGrid := TCheckbox.Create(aOwner);
  FCheckboxLabelGrid.Parent := aParent;
  FCheckboxLabelGrid.Font.Assign(lFont);
  FCheckboxLabelGrid.SetBounds(49,59, 50, 17);
  FCheckboxLabelGrid.OnClick := CheckboxLabelGridClickEvent;

  FCheckboxFieldGrid := TCheckbox.Create(aOwner);
  FCheckboxFieldGrid.Parent := aParent;
  FCheckboxFieldGrid.Font.Assign(lFont);
  FCheckboxFieldGrid.SetBounds(49,95, 50, 17);
  FCheckboxFieldGrid.OnClick := CheckboxFieldGridClickEvent;



  SetLanguageIndex(0);

  FComboLayout.ItemIndex := 0;
  UpdateBitmap;

  lFont.Free;


end; {constructor, Create}



{$IFDEF OLD}

{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.Create }

constructor TppAutoLayoutManager.Create(aOwner: TComponent; aParent: TWinControl);
var
  lFont: TFont;

begin

  inherited Create;

  FOnChange := nil;

  lFont := TFont.Create;
  lFont.Name := 'MS Sans Serif';
  lFont.Size := 8;


  FBitmap := TBitmap.Create;
  FMetaBitmap := TppAutoLayoutBitmap.Create;

  {create bevel frame for top half of window}
  FBevelCreate := TBevel.Create(aOwner);
  FBevelCreate.Parent := aParent;
  FBevelCreate.Shape := bsFrame;
  FBevelCreate.SetBounds(0,6,75,113);

  FBevelLayout := TBevel.Create(aOwner);
  FBevelLayout.Parent := aParent;
  FBevelLayout.Shape := bsFrame;
  FBevelLayout.SetBounds(73,6,96,113);

  {create bevel for image at bottom half of window}
  FBevelImage := TBevel.Create(aOwner);
  FBevelImage.Parent := aParent;
  FBevelImage.Shape := bsBox;
  FBevelImage.SetBounds(1,124,167,150);


  FImage := TImage.Create(aOwner);
  FImage.Parent := aParent;
  FImage.SetBounds(4,127,161,144);
  FImage.Picture.Bitmap := FBitmap;

  FLabelCreate := TLabel.Create(aOwner);
  FLabelCreate.Parent := aParent;
  FLabelCreate.Font.Assign(lFont);
  FLabelCreate.SetBounds(10,0,32,13);
  FLabelCreate.AutoSize := True;

  FLabelLayout := TLabel.Create(aOwner);
  FLabelLayout.Parent := aParent;
  FLabelLayout.Font.Assign(lFont);
  FLabelLayout.SetBounds(84,0,32,13);
  FLabelLayout.AutoSize := True;

  FLabelLabelFont := TLabel.Create(aOwner);
  FLabelLabelFont.Parent := aParent;
  FLabelLabelFont.Font.Assign(lFont);
  FLabelLabelFont.SetBounds(82,60,50,13);
  FLabelLabelFont.AutoSize := True;
  FLabelLabelFont.OnClick := LabelLabelFontClickEvent;

  FLabelFieldFont := TLabel.Create(aOwner);
  FLabelFieldFont.Parent := aParent;
  FLabelFieldFont.Font.Assign(lFont);
  FLabelFieldFont.SetBounds(82,89,46,13);
  FLabelFieldFont.AutoSize := True;
  FLabelFieldFont.OnClick := LabelFieldFontClickEvent;


  FFontButtonLabel := TppFontButton.Create(aOwner);
  FFontButtonLabel.Parent := aParent;
  TppFontButton(FFontButtonLabel).FontAttributeType := faFontName;
  {FFontButtonLabel.Flat := False;}
  FFontButtonLabel.Left := 139;
  FFontButtonLabel.Top := 56;
  TppFontButton(FFontButtonLabel).CurrentFont.Name  := 'Times New Roman';
  TppFontButton(FFontButtonLabel).CurrentFont.Size  := 12;
  TppFontButton(FFontButtonLabel).CurrentFont.Style := [fsBold];
  FFontButtonLabel.OnClick := FontButtonLabelClickEvent;

  FFontButtonField := TppFontButton.Create(aOwner);
  FFontButtonField.Parent  := aParent;
  TppFontButton(FFontButtonField).FontAttributeType := faFontName;

 { FFontButtonField.Flat := False;}
  FFontButtonField.Left := 139;
  FFontButtonField.Top := 84;
  TppFontButton(FFontButtonLabel).CurrentFont.Name := 'Times New Roman';
  TppFontButton(FFontButtonLabel).CurrentFont.Size := 12;
  FFontButtonField.OnClick := FontButtonFieldClickEvent;

  FComboLayout := TComboBox.Create(aOwner);
  FComboLayout.Parent := aParent;
  FComboLayout.Font.Assign(lFont);
  FComboLayout.SetBounds(82,23,81,21);
  FComboLayout.OnChange := ComboLayoutChangeEvent;

  FRadioFieldsNLabels := TRadioButton.Create(aOwner);
  FRadioFieldsNLabels.Parent := aParent;
  FRadioFieldsNLabels.Font.Assign(lFont);
  FRadioFieldsNLabels.SetBounds(10,26, 55, 17);
  FRadioFieldsNLabels.Checked := True;
  FRadioFieldsNLabels.OnClick := RadioFieldsNLabelsClickEvent;

  FRadioLabels := TRadioButton.Create(aOwner);
  FRadioLabels.Parent := aParent;
  FRadioLabels.Font.Assign(lFont);
  FRadioLabels.SetBounds(10,56, 55, 17);
  FRadioLabels.OnClick := RadioLabelsClickEvent;

  FRadioFields := TRadioButton.Create(aOwner);
  FRadioFields.Parent := aParent;
  FRadioFields.Font.Assign(lFont);
  FRadioFields.SetBounds(10,86, 55, 17);
  FRadioFields.OnClick := RadioFieldsClickEvent;

  SetLanguageIndex(ppGetLanguageIndex(lgDefault));

  FComboLayout.ItemIndex := 0;
  UpdateBitmap;

  lFont.Free;


end; {constructor, Create}

{$ENDIF}


{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.Destroy }

destructor TppAutoLayoutManager.Destroy;
begin

  FBitmap.Free;
  FMetaBitmap.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.DoOnChange }

procedure TppAutoLayoutManager.DoOnChange;
begin

  if Assigned(FOnChange) then FOnChange(Self);

end; {procedure, DoOnChange}

{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.GetCreateFields }

function TppAutoLayoutManager.GetCreateFields: Boolean;
begin
  Result := FRadioFieldsNLabels.Checked or FRadioFields.Checked;

end; {function, GetCreateFields}

{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.GetCreateLabels }

function TppAutoLayoutManager.GetCreateLabels: Boolean;
begin
  Result := FRadioFieldsNLabels.Checked or FRadioLabels.Checked;

end; {function, GetCreateLabels}


{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.GetLabelGrid }

function TppAutoLayoutManager.GetLabelGrid: Boolean;
begin
  Result := FCheckboxLabelGrid.Checked;
end; {function, GetLabelGrid}

{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.GetFieldGrid }

function TppAutoLayoutManager.GetFieldGrid: Boolean;
begin
  Result := FCheckboxFieldGrid.Checked;
end; {function, GetFieldGrid}


{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.GetCreateLabels }

function TppAutoLayoutManager.GetLabelFont: TFont;
begin
  Result := TppFontButton(FFontButtonLabel).CurrentFont;
end; {function, GetCreateLabels}


{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.GetFieldFont }

function TppAutoLayoutManager.GetFieldFont: TFont;
begin
  Result := TppFontButton(FFontButtonField).CurrentFont;
end; {function, GetFieldFont}

{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.GetLayoutType }

function TppAutoLayoutManager.GetLayoutType: TppReportLayoutType;
begin
  if FComboLayout.ItemIndex = 0 then
    Result := rlTabular
  else
    Result := rlVertical;

end; {function, GetLayoutType}


{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.SetCreateFields }

procedure TppAutoLayoutManager.SetCreateFields(aValue: Boolean);
var
  lbCreateLabels: Boolean;

begin

  lbCreateLabels := GetCreateLabels;

  FRadioLabels.Checked := not aValue;
  FRadioFields.Checked := aValue and not lbCreateLabels;
  FRadioFieldsNLabels.Checked := aValue and lbCreateLabels;

end; {function, SetCreateFields}

{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.SetCreateLabels }

procedure TppAutoLayoutManager.SetCreateLabels(aValue: Boolean);
var
  lbCreateFields: Boolean;

begin

  lbCreateFields := GetCreateFields;

  FRadioFields.Checked := not aValue;
  FRadioLabels.Checked := aValue and not lbCreateFields;
  FRadioFieldsNLabels.Checked := aValue and lbCreateFields;

end; {procedure, SetCreateLabels}


{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.SetLabelGrid }

procedure TppAutoLayoutManager.SetLabelGrid(aValue: Boolean);
begin
  FCheckboxLabelGrid.Checked := aValue;
end; {procedure, SetLabelGrid}

{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.SetFieldGrid }

procedure TppAutoLayoutManager.SetFieldGrid(aValue: Boolean);
begin
  FCheckboxFieldGrid.Checked := aValue;
end; {procedure, SetFieldGrid}

{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.SetLabelFont }

procedure TppAutoLayoutManager.SetLabelFont(aFont: TFont);
begin
  TppFontButton(FFontButtonLabel).CurrentFont.Assign(aFont);
end; {procedure, SetLabelFont}

{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.SetFieldFont }

procedure TppAutoLayoutManager.SetFieldFont(aFont: TFont);
begin
  TppFontButton(FFontButtonField).CurrentFont.Assign(aFont);
end; {procedure, SetFieldFont}

{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.SetLayoutType }

procedure TppAutoLayoutManager.SetLayoutType(aLayoutType: TppReportLayoutType);
begin
  if aLayoutType = rlTabular then
    FComboLayout.ItemIndex := 0
  else
    FComboLayout.ItemIndex := 1;

end; {procedure, SetLayoutType}

{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.SetLanguageIndex }

procedure TppAutoLayoutManager.SetLanguageIndex(aLanguageIndex: Longint);
begin
  FLabelCreate.Caption := ppLoadStr(633); {Create}
  FLabelLayout.Caption := ppLoadStr(634); {Style}
  FLabelLabelFont.Caption := ppLoadStr(168); {Font}
  FLabelFieldFont.Caption := ppLoadStr(168);  {Font}
  FCheckboxLabelGrid.Caption := ppLoadStr(635); {Grid}
  FCheckboxFieldGrid.Caption := ppLoadStr(635); {Grid}

  FComboLayout.Clear;
  FComboLayout.Items.Add(ppLoadStr(624)); {Tabular}
  FComboLayout.Items.Add(ppLoadStr(626)); {Vertical}
  FRadioFieldsNLabels.Caption := ppLoadStr(3) {All};
  FRadioLabels.Caption := ppLoadStr(636) {Labels};
  FRadioFields.Caption := ppLoadStr(637); {Fields}


end;  {procedure, SetLanguageIndex}


{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.CheckboxLabelGridClickEvent }

procedure TppAutoLayoutManager.CheckboxLabelGridClickEvent(Sender: TObject);
begin
  UpdateBitmap;

end; {procedure, CheckboxLabelGridClickEvent}

{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.CheckboxFieldGridClickEvent }

procedure TppAutoLayoutManager.CheckboxFieldGridClickEvent(Sender: TObject);
begin
  UpdateBitmap;

end; {procedure, CheckboxFieldGridClickEvent}



{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.FontButtonLabelClickEvent }

procedure TppAutoLayoutManager.FontButtonLabelClickEvent(Sender: TObject);
begin
  UpdateBitmap;

end; {procedure, FontButtonLabelClickEvent}

{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.LabelLabelFontClickEvent }

procedure TppAutoLayoutManager.LabelLabelFontClickEvent(Sender: TObject);
begin
  FFontButtonLabel.Click;

end;  {procedure, LabelLabelFontClickEvent}

{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.FieldFieldFontClickEvent }

procedure TppAutoLayoutManager.LabelFieldFontClickEvent(Sender: TObject);
begin
  FFontButtonField.Click;

end;  {procedure, FieldFieldFontClickEvent}


{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.FontButtonFieldClickEvent }

procedure TppAutoLayoutManager.FontButtonFieldClickEvent(Sender: TObject);
begin
  UpdateBitmap;
end; {procedure, FontButtonFieldClickEvent}


{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.ComboLayoutChangeEvent }

procedure TppAutoLayoutManager.ComboLayoutChangeEvent(Sender: TObject);
begin
  UpdateBitmap;

end; {procedure, ComboLayoutChangeEvent}

{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.RadioFieldsNLabelsClickEvent }
procedure TppAutoLayoutManager.RadioFieldsNLabelsClickEvent(Sender: TObject);
begin
  EnableControls;

end; {procedure, RadioFieldsNLabelsClickEvent}

{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.RadioLabelsClickEvent }

procedure TppAutoLayoutManager.RadioLabelsClickEvent(Sender: TObject);
begin
  EnableControls;

end; {procedure, RadioLabelsClickEvent}

{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.RadioFieldsClickEvent }

procedure TppAutoLayoutManager.RadioFieldsClickEvent(Sender: TObject);
begin
  EnableControls;

end; {procedure, RadioFieldsClickEvent}



{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.EnableControls }

procedure TppAutoLayoutManager.EnableControls;
begin

  FLabelLabelFont.Enabled := GetCreateLabels;
  FLabelFieldFont.Enabled := GetCreateFields;

  FFontButtonLabel.Enabled := FLabelLabelFont.Enabled;
  FFontButtonField.Enabled := FLabelFieldFont.Enabled;

  FCheckboxLabelGrid.Enabled  := FLabelLabelFont.Enabled;
  FCheckboxFieldGrid.Enabled  := FLabelFieldFont.Enabled;


  UpdateBitmap;


end; {procedure, EnableControls}

{------------------------------------------------------------------------------}
{ TppAutoLayoutManager.UpdateBitmap }

procedure TppAutoLayoutManager.UpdateBitmap;
begin

  FMetaBitmap.Labels := GetCreateLabels;
  FMetaBitmap.Fields := GetCreateFields;

  FMetaBitmap.LabelGrid := GetLabelGrid;
  FMetaBitmap.FieldGrid := GetFieldGrid;

  FMetaBitmap.LabelFont := TppFontButton(FFontButtonLabel).CurrentFont;
  FMetaBitmap.FieldFont := TppFontButton(FFontButtonField).CurrentFont;

  FMetaBitmap.Tabular := (FComboLayout.ItemIndex = 0);

  FMetaBitmap.RenderBitmap(FBitmap);
  FImage.Picture.Bitmap := FBitmap;

  DoOnChange;

end; {procedure, UpdateBitmap}


{******************************************************************************
 *
 **  A U T O L A Y O U T S  - U S E D   B Y   D A T A T R E E
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppAutoLayout.Create }

constructor TppAutoLayout.Create;
begin

  inherited Create;

  FFieldComponents := TList.Create;
  FLabelComponents := TList.Create;
  FFieldGrid  := TList.Create;
  FLabelGrid  := TList.Create;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppAutoLayout.Destroy }

destructor TppAutoLayout.Destroy;
begin
  FFieldComponents.Free;
  FLabelComponents.Free;
  FFieldGrid.Free;
  FLabelGrid.Free;

  inherited Destroy;

end; {destructor, Create}

{------------------------------------------------------------------------------}
{ TppAutoLayout.IncludeLabels }

function TppAutoLayout.IncludeLabels: Boolean;
begin
  Result := (FLabelComponents.Count > 0);
end; {function, IncludeLabels}

{------------------------------------------------------------------------------}
{ TppAutoLayout.IncludeFields }

function TppAutoLayout.IncludeFields: Boolean;
begin
  Result := (FFieldComponents.Count > 0);
end; {function, IncludeFields}

{------------------------------------------------------------------------------}
{ TppAutoLayout.IncludeLabelGrid }

function TppAutoLayout.IncludeLabelGrid: Boolean;
begin
  Result := (FLabelGrid.Count > 0);
end; {function, IncludeLabelGrid}


{------------------------------------------------------------------------------}
{ TppAutoLayout.IncludeFieldGrid }

function TppAutoLayout.IncludeFieldGrid: Boolean;
begin
  Result := (FFieldGrid.Count > 0);
end; {function, IncludeFieldGrid}



{------------------------------------------------------------------------------}
{ TppAutoLayout.GetComponentCount }

function TppAutoLayout.GetComponentCount: Integer;
begin
  if IncludeFields then
    Result := FFieldComponents.Count
  else
    Result := FLabelComponents.Count;

end; {function, GetComponentCount}

{------------------------------------------------------------------------------}
{ TppAutoLayoutTabular.CreateLayout }

procedure TppAutoLayoutTabular.CreateLayout;
var
  lLabel: TppLabel;
  lComponent: TppComponent;
  liComponentCount: Integer;
  liIndex: Integer;
  lFrame: TppShape;


begin

  LabelPos := CalcStartingLabelPos;
  FieldPos := CalcStartingFieldPos;

  lLabel := nil;

  if IncludeLabels then
    FLabelBandWidth := TppLabel(FLabelComponents[0]).Band.spWidth;

  if IncludeFields then
    FFieldBandWidth := TppComponent(FFieldComponents[0]).Band.spWidth;

  liComponentCount := GetComponentCount;


  for liIndex := 0 to liComponentCount-1 do
    begin

      if IncludeLabels then
        begin
          lLabel := TppLabel(FLabelComponents[liIndex]);
          lLabel.spLeft := LabelPos.X;
          lLabel.spTop  := LabelPos.Y;

          if IncludeLabelGrid then
            begin
              lFrame := TppShape(FLabelGrid[liIndex]);
              lFrame.Band     := lLabel.Band;
              lFrame.SendToBack;
              lFrame.spLeft   := LabelPos.X - 2;
              lFrame.spTop    := LabelPos.Y - 2;
              lFrame.spWidth  := lLabel.spWidth  + 4;
              lFrame.spHeight := lLabel.spHeight + 4;

            end;

          LabelPos := CalcNextLabelPos(liIndex);

       end;

      if IncludeFields then
        begin
          lComponent := TppComponent(FFieldComponents[liIndex]);
          lComponent.spLeft := FieldPos.X;
          lComponent.spTop  := FieldPos.Y;

          if IncludeFieldGrid then
            begin
              lFrame := TppShape(FFieldGrid[liIndex]);
              lFrame.Band     := lComponent.Band;
              lFrame.SendToBack;
              lFrame.spLeft   := FieldPos.X - 2;
              lFrame.spTop    := FieldPos.Y - 2;
              lFrame.spWidth  := lComponent.spWidth + 4;
              lFrame.ParentHeight := (lLabel = nil) or (lLabel.Band <> lComponent.Band);

              if not lFrame.ParentHeight then
                lFrame.spHeight := lComponent.spHeight + 4;


            end;

          FieldPos := CalcNextFieldPos(liIndex);

        end;

    end;


end; {procedure, CreateLayout}

{------------------------------------------------------------------------------}
{ TppAutoLayoutTabular.CalcStartingLabelPos }

function TppAutoLayoutTabular.CalcStartingLabelPos: TPoint;
var
  lLabel: TppLabel;
  liMaxY: Integer;
  lComponent: TppComponent;
  liIndex: Integer;

begin

  Result := StartingPos;

  if not IncludeLabels then Exit;

  lLabel := TppLabel(FLabelComponents[0]);
  liMaxY := lLabel.Band.spHeight - lLabel.spHeight;
  {liMaxY := lLabel.Band.spHeight - Abs(lLabel.Font.Height) - 3;}

  {leave additional room at bottom of band for the grid line}
  if IncludeLabelGrid then
    liMaxY := liMaxY - 2;

  if (Result.Y > liMaxY) then
    Result.Y := liMaxY;

  lLabel.spLeft := Result.X;
  lLabel.spTop  := Result.Y;

  if IncludeFields then
    for liIndex := 0 to FLabelComponents.Count-1 do
      begin
        lLabel := TppLabel(FLabelComponents[liIndex]);
        lComponent :=  TppComponent(FFieldComponents[liIndex]);

        if lLabel.spWidth < lComponent.spWidth then
          lLabel.spWidth := lComponent.spWidth
        else
          lComponent.spWidth := lLabel.spWidth;

      end;


end; {procedure, CalcStartingLabelPos}

{------------------------------------------------------------------------------}
{ TppAutoLayoutTabular.CalcStartingFieldPos }

function TppAutoLayoutTabular.CalcStartingFieldPos: TPoint;
var
  lComponent: TppComponent;
  liMaxY: Integer;
  lLabel: TppLabel;
  liLabelBottom: Integer;
  liIndex: Integer;
  lFieldBand: TppBand;
  lReport: TppCustomReport;

begin

  Result := StartingPos;

  if not IncludeFields then Exit;

  lComponent := TppComponent(FFieldComponents[0]);
  liMaxY := lComponent.Band.spHeight - Abs(lComponent.Font.Height) - 3;

  if not Includelabels then
    begin

      if (Result.Y > liMaxY) then
        Result.Y := liMaxY;

    end
  else {layout includes labels and fields }
    begin
      lLabel := TppLabel(FLabelComponents[0]);
      liLabelBottom := lLabel.spTop + lLabel.spHeight;
      lReport := lLabel.Band.Report;
      lFieldBand := lComponent.Band;

      {check whether there is room in the band for the fields}
      if (liLabelBottom > liMaxY) then
        begin
          liIndex := lReport.FindBand(lLabel.Band);
          if liIndex < lReport.BandCount-1 then
            lFieldBand := lReport.Bands[liIndex+1]
        end;

      {position fields below labels}
      if lLabel.Band = lFieldBand then
        begin
          Result.Y := liLabelBottom + 5;
          if Result.Y > lFieldBand.spHeight then
            Result.Y := lFieldBand.spHeight - 4;
        end

      else {position fields at top of next band }
        begin
          for liIndex := 0 to FFieldComponents.Count-1 do
            TppComponent(FFieldComponents[liIndex]).Band := lFieldBand;

          Result.Y := 2;
        end;


    end;

  lComponent.spLeft := Result.X;
  lComponent.spTop  := Result.Y;

end; {procedure, CalcStartingFieldPos}

{------------------------------------------------------------------------------}
{ TppAutoLayoutTabular.CalcLineHeight }

function TppAutoLayoutTabular.CalcLineHeight: Integer;
var
  liIndex: Integer;
  liHeight: Integer;

begin

  Result := 0;

  if IncludeFields then
    for liIndex := 0 to FFieldComponents.Count-1 do
      begin
        liHeight := TppComponent(FFieldComponents[liIndex]).spHeight;
        if liHeight > Result then
          Result := liHeight;
      end
  else if IncludeLabels then
    Result := TppComponent(FLabelComponents[0]).spHeight;


end; {procedure, CalcLineHeight}

{------------------------------------------------------------------------------}
{ TppAutoLayoutTabular.CalcNextLabelPos }

function TppAutoLayoutTabular.CalcNextLabelPos(aIndex: Integer): TPoint;
var
  lLabel: TppLabel;

begin

  Result := LabelPos;

  if not IncludeLabels or (aIndex > FLabelComponents.Count-2) then Exit;

  lLabel := TppLabel(FLabelComponents[aIndex]);


  Result.X := LabelPos.X + lLabel.spWidth + 4;

  if Result.X > FLabelBandWidth then
    Result.X := FLabelBandWidth - 10;


end; {procedure, CalcNextLabelPos}


{------------------------------------------------------------------------------}
{ TppAutoLayoutTabular.CalcNextFieldPos }

function TppAutoLayoutTabular.CalcNextFieldPos(aIndex: Integer): TPoint;
var
  lComponent: TppComponent;

begin

  Result := FieldPos;

  if not IncludeFields or (aIndex > FFieldComponents.Count-2) then Exit;

  lComponent :=  TppComponent(FFieldComponents[aIndex]);

  Result.X := FieldPos.X + lComponent.spWidth + 4;

  if Result.X > FFieldBandWidth then
    Result.X := FFieldBandWidth - 10;

end; {procedure, CalcNextFieldPos}


{------------------------------------------------------------------------------}
{ TppAutoLayoutVertical.CreateLayout }

procedure TppAutoLayoutVertical.CreateLayout;
var
  lLabel: TppLabel;
  lComponent: TppComponent;
  liComponentCount: Integer;
  liIndex: Integer;
  lFrame: TppShape;
  liLineHeight: Integer;
  liFieldColWidth: Integer;

begin

  LabelPos := CalcStartingLabelPos;
  FieldPos := CalcStartingFieldPos;

  liComponentCount := GetComponentCount;

  liFieldColWidth := CalcFieldColWidth;


  for liIndex := 0 to liComponentCount-1 do
    begin

      liLineHeight := CalcLineHeight(liIndex);

      if IncludeLabels then
        begin
          lLabel := TppLabel(FLabelComponents[liIndex]);
          lLabel.spLeft := LabelPos.X;
          lLabel.spTop  := LabelPos.Y;
          lLabel.Alignment := taLeftJustify;

         if IncludeLabelGrid then
            begin
              lFrame := TppShape(FLabelGrid[liIndex]);
              lFrame.Band     := lLabel.Band;
              lFrame.spLeft   := LabelPos.X - 2;
              lFrame.spWidth  := lLabel.spWidth + 4;
              lFrame.spHeight := liLineHeight + 4;
              lFrame.spTop := (LabelPos.Y + lLabel.spHeight) - lFrame.spHeight;
            end;
            
         LabelPos := CalcNextLabelPos(liIndex);

       end;

      if IncludeFields then
        begin
          lComponent := TppComponent(FFieldComponents[liIndex]);
          lComponent.spLeft := FieldPos.X;
          lComponent.spTop  := FieldPos.Y;
          lComponent.Alignment := taLeftJustify;

          if IncludeFieldGrid then
            begin
              lFrame := TppShape(FFieldGrid[liIndex]);
              lFrame.Band     := lComponent.Band;
              lFrame.spLeft   := FieldPos.X - 2;
              lFrame.spWidth  := liFieldColWidth + 4;
              lFrame.spHeight := liLineHeight + 4;
              lFrame.spTop := (FieldPos.Y + lComponent.spHeight) - lFrame.spHeight;
            end;

          FieldPos := CalcNextFieldPos(liIndex);

        end;

    end;


end; {procedure, CreateLayout}


{------------------------------------------------------------------------------}
{ TppAutoLayoutVertical.CalcStartingLabelPos }

function TppAutoLayoutVertical.CalcStartingLabelPos: TPoint;
var
  lLabel: TppLabel;
  liIndex: Integer;
  liComponentCount: Integer;
  liMaxWidth: Integer;

begin

  Result := StartingPos;

  if not IncludeLabels then Exit;


  lLabel := TppLabel(FLabelComponents[0]);

  liMaxWidth := 0;

  liComponentCount := GetComponentCount;

  {determine max label width}
  for liIndex := 0 to liComponentCount-1 do
    if liMaxWidth < TppLabel(FLabelComponents[liIndex]).spWidth then
      liMaxWidth := TppLabel(FLabelComponents[liIndex]).spWidth;

  for liIndex := 0 to liComponentCount-1 do
    TppLabel(FLabelComponents[liIndex]).spWidth := liMaxWidth;

  {adjust Y such that Field aligns with bottom of Label}
  Result.Y := StartingPos.Y + (CalcLineHeight(0) - lLabel.spHeight);

 { liMaxY := lLabel.Band.spHeight - Abs(lLabel.Font.Height) - 3;

  if (Result.Y > liMaxY) then
    Result.Y := liMaxY; }

  lLabel.spLeft := Result.X;
  lLabel.spTop  := Result.Y;

end; {procedure, CalcStartingLabelPos}

{------------------------------------------------------------------------------}
{ TppAutoLayoutVertical.CalcStartingFieldPos }

function TppAutoLayoutVertical.CalcStartingFieldPos: TPoint;
var
  lComponent: TppComponent;

begin

  Result := StartingPos;

  if not IncludeFields then Exit;

  lComponent := TppComponent(FFieldComponents[0]);

  if IncludeLabels then
    begin

      Result.X := StartingPos.X + TppLabel(FLabelComponents[0]).spWidth + 4;

      {adjust Y such that Field aligns with bottom of Label}
      Result.Y := StartingPos.Y + (CalcLineHeight(0) - lComponent.spHeight);

    end;

  lComponent.spLeft := Result.X;
  lComponent.spTop  := Result.Y;

end; {procedure, CalcStartingFieldPos}

{------------------------------------------------------------------------------}
{ TppAutoLayoutVertical.CalcNextLabelPos }

function TppAutoLayoutVertical.CalcNextLabelPos(aIndex: Integer): TPoint;
begin

  Result := LabelPos;

  if not IncludeLabels or (aIndex > FLabelComponents.Count-2) then Exit;

  {bottom of current line}
  Result.Y := LabelPos.Y + TppLabel(FLabelComponents[aIndex]).spHeight + 4;

  {adjust top to align with bottom next line}
  Result.Y := Result.Y + CalcLineHeight(aIndex+1) -
                         TppLabel(FLabelComponents[aIndex+1]).spHeight;


  {if Result.X > FLabelBandWidth then
    Result.X := FLabelBandWidth - 10;}


end; {procedure, CalcNextLabelPos}

{------------------------------------------------------------------------------}
{ TppAutoLayoutVertical.CalcNextFieldPos }

function TppAutoLayoutVertical.CalcNextFieldPos(aIndex: Integer): TPoint;
begin

  Result := FieldPos;

  if not IncludeFields or (aIndex > FFieldComponents.Count-2) then Exit;

  {bottom of current line}
  Result.Y := FieldPos.Y + TppComponent(FFieldComponents[aIndex]).spHeight + 4;

  {adjust top to align with bottom next line}
  Result.Y := Result.Y + CalcLineHeight(aIndex+1) -
                         TppComponent(FFieldComponents[aIndex+1]).spHeight;

  {if Result.X > FFieldBandWidth then
    Result.X := FFieldBandWidth - 10;}

end; {procedure, CalcNextFieldPos}

{------------------------------------------------------------------------------}
{ TppAutoLayoutVertical.CalcLineHeight }

function TppAutoLayoutVertical.CalcLineHeight(aIndex: Integer): Integer;
var
  liLabelHeight: Integer;
  liFieldHeight: Integer;

begin


  if IncludeLabels then
    liLabelHeight := TppLabel(FLabelComponents[aIndex]).spHeight
  else
    liLabelHeight := 0;

  if IncludeFields then
    liFieldHeight := TppComponent(FFieldComponents[aIndex]).spHeight
  else
    liFieldHeight := 0;

  if liLabelHeight > liFieldHeight then
    Result := liLabelHeight
  else
    Result := liFieldHeight;

end; {function, CalcLineHeight}


{------------------------------------------------------------------------------}
{ TppAutoLayoutVertical.CalcFieldColWidth }

function TppAutoLayoutVertical.CalcFieldColWidth: Integer;
var
  liIndex: Integer;
  liWidth: Integer;

begin

  Result := 0;

  if not IncludeFields then Exit;

  for liIndex := 0 to FFieldComponents.Count-1 do
    begin
      liWidth := TppComponent(FFieldComponents[liIndex]).spWidth;
      if liWidth > Result then
        Result := liWidth;
    end;

end; {procedure, CalcFieldColWidth}


{******************************************************************************
 *
 **  D A T A  E X P L O R E R
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppDataExplorer.Create }

constructor TppDataExplorer.Create(aParent: TWinControl; aOrientation: TppExplorerOrientation);
begin

  inherited Create(aParent, aOrientation);

  ShowTitlebar := False;

  ListTitleBar.Visible := True;

  TreeView.ShowRoot  := True;
  TreePanel.Height   := 71;


  TreeBuilder := TppDataTreeBuilder.Create(TreeView);

  ListView.OnChange       := ListViewChangeEvent;
  ListView.OnChanging     := ListViewChangingEvent;
{  ListView.OnAfterBuildList  := BuildFieldListEvent;}
  ListView.ReadOnly     := True;
  ListView.MultiSelect  := True;
  ListView.Height := 300;

  ListBuilder := TppFieldListBuilder.Create(ListView);

  ListView.ClassImages :=  TreeView.ClassImages;

  FSelection  := TList.Create;
  FChangeItemSelected := False;


end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDataExplorer.Destroy }

destructor TppDataExplorer.Destroy;
begin

  {note: must set these events to nil to avoid access violations}
  ListView.OnChange    := nil;
  ListView.OnChanging  := nil;

  FSelection.Free;

  inherited Destroy;

end; {destructor, Destroy}



{------------------------------------------------------------------------------}
{ TppDataExplorer.ListViewChangeEvent }

procedure TppDataExplorer.ListViewChangingEvent(Sender: TObject; Item: TListItem;
                                                  Change: TItemChange; var AllowChange: Boolean);
begin

  {save Selected state of item that is changing - this value is checked in the Change event}
  FChangeItemSelected := Item.Selected;

end; {procedure, ListViewChangingEvent}

{------------------------------------------------------------------------------}
{ TppDataExplorer.ListViewChangeEvent }

procedure TppDataExplorer.ListViewChangeEvent(Sender: TObject; Item: TListItem; Change: TItemChange);
begin

  if not (Change = ctState) then Exit;

  if (Item.Selected = FChangeItemSelected) then Exit;

  {add/remove item from selection, as needed}
  if Item.Selected {and (FSelection.IndexOf(Item) < 0)} then
    FSelection.Add(Item)

  else if not Item.Selected then
    FSelection.Remove(Item);

end; {procedure, ListViewChangeEvent}


{------------------------------------------------------------------------------}
{ TppDataExplorer.GetSelectedFields }

procedure TppDataExplorer.GetSelectedFields(aFieldList: TList);
var
  liItem: Integer;
  lItem: TListItem;

begin

  aFieldList.Clear;

  for liItem := 0 to FSelection.Count-1 do
    begin
      lItem := FSelection[liItem];

      {make sure the item is still selected}
      if lItem.Selected then
        aFieldList.Add(TObject(lItem.Data));
    end;

end;  {procedure, GetSelectedFields}


{------------------------------------------------------------------------------}
{ TppDataExplorer.SetLanguageIndex }

procedure TppDataExplorer.SetLanguageIndex(aLanguageIndex: Longint);
begin

  ListPanel.Caption :=  ppLoadStr(116); {Data Fields}

end; {procedure, SetLanguageIndex}






{******************************************************************************
 *
 **  D A T A  T R E E   W I N D O W
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppDataTreeWindow.Create }

constructor TppDataTreeWindow.Create(aOwner: TComponent);
var
  lDataTabSheet: TTabSheet;
  lLayoutTabSheet: TTabSheet;
begin

  inherited Create(aOwner);


  FPageControl := TPageControl.Create(Self);
  FPageControl.Parent := Self;
  FPageControl.Align := alClient;
  FPageControl.TabPosition := tpBottom;
  FPageControl.OnChanging := PageControlChangingEvent;

  lDataTabSheet := TTabSheet.Create(Self);
  lDataTabSheet.PageControl := FPageControl;
  lDataTabSheet.Caption := ppLoadStr(141); {Data}

  lLayoutTabSheet := TTabSheet.Create(Self);
  lLayoutTabSheet.PageControl := FPageControl;
  lLayoutTabSheet.Caption := ppLoadStr(612); {Layout}

  {Note: this object is created when Layout tab first accessec}
  FLayoutManager := nil;


  FDataExplorer := TppDataExplorer.Create(lDataTabSheet, ppeoVertical);

  FTreeView := FDataExplorer.TreeView;
  FListView := FDataExplorer.ListView;

  FListView.OnMouseDown    := ListViewMouseDownEvent;
  FListView.OnMouseUp      := ListViewMouseUpEvent;


  {auto layout settings}
  FLabelFont  := TFont.Create;
  FLabelFont.Name  := 'Arial';
  FLabelFont.Style := [fsBold];
  FLabelFont.Size  := 10;

  FFieldFont  := TFont.Create;
  FFieldFont.Assign(FLabelFont);
  FFieldFont.Style := [];

  FLayoutType   := rlTabular;
  FCreateFields := True;
  FCreateLabels := True;
  FLabelGrid    := False;
  FFieldGrid    := False;

  FChangeItemSelected := False;
  FDockChanging := False;

  BuildPopupMenu;

  {set default size and position}
  Left   := 3;
  Top    := 107;
  Width  := 180;
  Height := 305;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDataTreeWindow.Destroy }

destructor TppDataTreeWindow.Destroy;
begin

  FDataExplorer.Free;

  FLabelFont.Free;
  FFieldFont.Free;

  FLayoutManager.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDataTreeWindow.CMVisibleChanged}

procedure TppDataTreeWindow.CMVisibleChanged (var Message: TMessage);
begin

  if (Message.wParam > 0) and not FDockChanging then
    Refresh;

  inherited;

end; {end, CMVisibleChanged}

{------------------------------------------------------------------------------}
{ TppDataTreeWindow.CMVisibleChanged}

procedure TppDataTreeWindow.DoOnDockChanging;
begin
  FDockChanging := True;
  inherited DoOnDockChanging;
end; {end, DoOnDockChanging}

{------------------------------------------------------------------------------}
{ TppDataTreeWindow.DoOnDockChanged}

procedure TppDataTreeWindow.DoOnDockChanged;
begin
  inherited DoOnDockChanged;
  FDockChanging := False;
end;

{------------------------------------------------------------------------------}
{ TppDataTreeWindow.BuildPopupMenu }

procedure TppDataTreeWindow.BuildPopupMenu;
var
  lMenuItem: TMenuItem;

begin

  if FTreeMenu <> nil then
    FTreeMenu.Free;


  FTreeMenu := TPopupMenu.Create(Self);

  lMenuItem := TMenuItem.Create(FTreeMenu);
  lMenuItem.Caption :=  ppLoadStr(638); {Refresh}
  lMenuItem.Name    := 'mniRefresh';
  lMenuItem.OnClick := TreeMenuItemClickEvent;

  FTreeMenu.Items.Add(lMenuItem);

 {
  lMenuItem := TMenuItem.Create(FTreeMenu);
  lMenuItem.Caption := 'Report Outline';
  lMenuItem.Name    := 'mniReportOutline';
  lMenuItem.OnClick := TreeMenuItemClickEvent;

  FTreeMenu.Items.Add(lMenuItem);

  lMenuItem := TMenuItem.Create(FTreeMenu);
  lMenuItem.Caption := 'Object Outline';
  lMenuItem.Name    := 'mniObjectOutline';
  lMenuItem.OnClick := TreeMenuItemClickEvent;

  FTreeMenu.Items.Add(lMenuItem);

  lMenuItem := TMenuItem.Create(FTreeMenu);
  lMenuItem.Caption := '-';
  lMenuItem.Name    := 'mniLine1';

  FTreeMenu.Items.Add(lMenuItem);

  lMenuItem := TMenuItem.Create(FTreeMenu);
  lMenuItem.Caption := 'Show Titles';
  lMenuItem.Name    := 'mniShowTitle';
  lMenuItem.OnClick := TreeMenuItemClickEvent;

  FTreeMenu.Items.Add(lMenuItem);

  FTreeMenu.Items[0].Checked := False;
  FTreeMenu.Items[1].Checked := True ;
  FTreeMenu.Items[3].Checked := True ;  }

  FTreeView.PopupMenu := FTreeMenu;
  FListView.PopupMenu := FTreeMenu;


end; {procedure, BuildPopupMenu}

{------------------------------------------------------------------------------}
{ TppDataTreeWindow.LoadPreferences}

{$IFDEF Delphi4}
procedure TppDataTreeWindow.LoadPreferences(aIniFile: TCustomIniFile);
{$ELSE}
procedure TppDataTreeWindow.LoadPreferences(aIniFile: TIniFile);
{$ENDIF}

begin
  if (aIniFile = nil) then Exit;

  ppLoadFontFromIniFile(aIniFile, 'AutoLayout', 'LabelFont', FLabelFont);
  ppLoadFontFromIniFile(aIniFile, 'AutoLayout', 'FieldFont', FFieldFont);

  FLayoutType   := TppReportLayoutType(aIniFile.ReadInteger('AutoLayout', 'LayoutType', 0));
  FCreateLabels := aIniFile.ReadBool('AutoLayout', 'CreateLabels', True);
  FCreateFields := aIniFile.ReadBool('AutoLayout', 'CreateFields', True);
  FLabelGrid    := aIniFile.ReadBool('AutoLayout', 'LabelGrid', False);
  FFieldGrid    := aIniFile.ReadBool('AutoLayout', 'FieldGrid', False);

end; {procedure, LoadPreferences}


{------------------------------------------------------------------------------}
{ TppDataTreeWindow.SavePreferences}

{$IFDEF Delphi4}
procedure TppDataTreeWindow.SavePreferences(aIniFile: TCustomIniFile);
{$ELSE}
procedure TppDataTreeWindow.SavePreferences(aIniFile: TIniFile);
{$ENDIF}

begin

  if (aIniFile = nil) then Exit;

  ppSaveFontToIniFile(aIniFile, 'AutoLayout', 'LabelFont', FLabelFont);
  ppSaveFontToIniFile(aIniFile, 'AutoLayout', 'FieldFont', FFieldFont);

  aIniFile.WriteInteger('AutoLayout', 'LayoutType', Ord(FLayoutType));
  aIniFile.WriteBool('AutoLayout', 'CreateLabels', FCreateLabels);
  aIniFile.WriteBool('AutoLayout', 'CreateFields', FCreateFields);
  aIniFile.WriteBool('AutoLayout', 'LabelGrid', FLabelGrid);
  aIniFile.WriteBool('AutoLayout', 'FieldGrid', FFieldGrid);

end; {procedure, SavePreferences}


{------------------------------------------------------------------------------}
{ TppDataTreeWindow.TreeMenuItemClickEvent }

procedure TppDataTreeWindow.SetLabelFont(aFont: TFont);
begin
  FLabelFont.Assign(aFont);
  
end; {procedure, TreeMenuItemClickEvent}


{------------------------------------------------------------------------------}
{ TppDataTreeWindow.SetFieldFont }

procedure TppDataTreeWindow.SetFieldFont(aFont: TFont);
begin
  FFieldFont.Assign(aFont);

end; {procedure, SetFieldFont}


{------------------------------------------------------------------------------}
{ TppDataTreeWindow.SetReport }

procedure TppDataTreeWindow.SetReport(aCustomReport: TppCustomReport);
begin

  FReport := aCustomReport;
  FDataExplorer.Report := aCustomReport;

end; {procedure, SetReport}


{------------------------------------------------------------------------------}
{ TppDataTreeWindow.TreeMenuItemClickEvent }

procedure TppDataTreeWindow.TreeMenuItemClickEvent(Sender: TObject);
{var
  lReportTreeVisible: Boolean;
  lObjectTreeVisible: Boolean;
 }
begin

  if (FTreeMenu.Items[0] = Sender) then
    begin
      Refresh;
    end

{  if (FTreeMenu.Items[0] = Sender) then
    begin
      {toggle report outline visibility}
 {     lReportTreeVisible := not FReportPanel.Visible;
      lObjectTreeVisible := FObjectPanel.Visible;
      SetTreesVisible(lReportTreeVisible, lObjectTreeVisible);

    end
  else if (FTreeMenu.Items[1] = Sender) then
    begin
      {toggle object outline visibility}
 {     lReportTreeVisible := FReportPanel.Visible;
      lObjectTreeVisible := not FObjectPanel.Visible;
      SetTreesVisible(lReportTreeVisible, lObjectTreeVisible);
   end
  else if (FTreeMenu.Items[3] = Sender) then
    SetShowTitlebar(not FReportTitleBar.Visible);
  }

end; {procedure, TreeMenuItemClickEvent}


{------------------------------------------------------------------------------}
{ TppDataTreeWindow.Refresh }

procedure TppDataTreeWindow.Refresh;
begin

  FListView.CurrentObject := nil;

  FTreeView.Rebuild;

  if FTreeView.Items.Count > 0 then
    begin
      FTreeView.Selected := FTreeView.Items[0];

      if (FTreeView.Selected.Data <> nil) then
        FListView.CurrentObject := TObject(FTreeView.Selected.Data);
        
    end
  else
    FListView.CurrentObject := nil;



end; {procedure, Refresh}



{------------------------------------------------------------------------------}
{ TppDataTreeWindow.PageControlChangingEvent }

procedure TppDataTreeWindow.PageControlChangingEvent(Sender: TObject; var AllowChange: Boolean);
begin
  {create LayoutManager, if needed}
  if (FLayoutManager = nil) and (FPageControl.ActivePage.PageIndex = 0) then
    begin
      FLayoutManager := TppAutoLayoutManager.Create(Self, FPageControl.Pages[1]);
      FLayoutManager.LanguageIndex := LanguageIndex;

      FLayoutManager.LabelFont    := FLabelFont;
      FLayoutManager.FieldFont    := FFieldFont;
      FLayoutManager.LayoutType   := FLayoutType;
      FlayoutManager.CreateLabels := FCreateLabels;
      FLayoutManager.CreateFields := FCreateFields;
      FLayoutManager.LabelGrid    := FLabelGrid;
      FLayoutManager.FieldGrid    := FFieldGrid;

      FLayoutManager.EnableControls;
      FLayoutManager.OnChange := LayoutManagerChangeEvent;
    end;

end; {procedure, PageControlChangingEvent}



{------------------------------------------------------------------------------}
{ TppDataTreeWindow.ListViewMouseDownEvent }

procedure TppDataTreeWindow.ListViewMouseDownEvent(Sender: TObject; Button: TMouseButton;
                                                    Shift: TShiftState; X, Y: Integer);
begin

{$IFDEF Delphi4}
 if FListView.Selected <> nil then
   BeginDrag(False, 5);
{$ELSE}
 if FListView.Selected <> nil then
   BeginDrag(False);
{$ENDIF}

end;  {procedure, ListViewMouseDownEvent}


{------------------------------------------------------------------------------}
{ TppDataTreeWindow.ListViewMouseUpEvent }

procedure TppDataTreeWindow.ListViewMouseUpEvent(Sender: TObject; Button: TMouseButton;
                                                    Shift: TShiftState; X, Y: Integer);
begin

 if FListView.Selected <> nil then
   EndDrag(True);

end;  {procedure, ListViewMouseUpEvent}


{------------------------------------------------------------------------------}
{ TppDataTreeWindow.LayoutManagerChangeEvent }

procedure TppDataTreeWindow.LayoutManagerChangeEvent(Sender: TObject);
begin

  FLabelFont.Assign(FLayoutManager.LabelFont);
  FFieldFont.Assign(FLayoutManager.FieldFont);
  FLayoutType   := FLayoutManager.LayoutType;
  FCreateLabels := FlayoutManager.CreateLabels;
  FCreateFields := FLayoutManager.CreateFields;
  FLabelGrid    := FLayoutManager.LabelGrid;
  FFieldGrid    := FLayoutManager.FieldGrid;

end; {procedure, LayoutManagerChangeEvent}

{------------------------------------------------------------------------------}
{ TppDataTreeWindow.CreateComponentsForFields }

procedure TppDataTreeWindow.CreateComponentsForFields(aBand: TppBand; X, Y: Integer; var aComponents: TList);
var
  liField: Integer;
  lFields: TList;
  lField: TppField;
  lLayout: TppAutoLayout;
  lLabel: TppLabel;
  lComponent: TppComponent;
  lFrame: TppShape;

begin

  lFields := TList.Create;

  FDataExplorer.GetSelectedFields(lFields);

  if (FLayoutType = rlVertical) then
    lLayout := TppAutoLayoutVertical.Create
  else
    lLayout := TppAutoLayoutTabular.Create;

  lLayout.StartingPos := Point(X,Y);

  {create the field and label components}
  for liField := 0 to lFields.Count-1 do
    begin
      lField := TppField(lFields[liField]);

      if FCreateLabels then
        begin
          lLabel := ppCreateLabelForField(FReport, aBand, lField, FLabelFont);
          lLayout.LabelComponents.Add(lLabel);
          aComponents.Add(lLabel);

          if FLabelGrid then
            begin
              lFrame := ppCreateFrameForComponent(FReport, lLabel);
              lLayout.LabelGrid.Add(lFrame);
              aComponents.Add(lFrame);
            end;
        end;


      if FCreateFields then
        begin
          lComponent := ppCreateComponentForField(FReport, aBand, lField, FFieldFont);
          lLayout.FieldComponents.Add(lComponent);
          aComponents.Add(lComponent);

          if FFieldGrid then
            begin
              lFrame := ppCreateFrameForComponent(FReport, lComponent);
              lLayout.FieldGrid.Add(lFrame);
              aComponents.Add(lFrame);
            end;
       end;

    end;

  lLayout.CreateLayout;

  lLayout.Free;  

  lFields.Free;

end;   {procedure, CreateComponentsForFields}


{------------------------------------------------------------------------------}
{ TppDataTreeWindow.SetLanguageIndex }

procedure TppDataTreeWindow.SetLanguageIndex(aLanguageIndex: Longint);
begin

  inherited SetLanguageIndex(aLanguageIndex);

  Caption := ppLoadStr(639); {Data Tree};

  FPageControl.Pages[0].Caption := ppLoadStr(141); {Data};
  FPageControl.Pages[1].Caption := ppLoadStr(612); {Layout};

  FDataExplorer.ListTitleBar.Caption := ppLoadStr(116); {Data Fields};

  FTreeMenu.Items[0].Caption := ppLoadStr(638); {Refresh}


  if (FLayoutManager <> nil) then
    FLayoutManager.LanguageIndex := aLanguageIndex;

end; {procedure, SetLanguageIndex}




{******************************************************************************
 *
 **  R E P O R T   T R E E   W I N D O W
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppReportTreeWindow.Create}

constructor TppReportTreeWindow.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FActive := True;
  FShowTitleBar := True;

  {create horizontal splitter}
  FSplitter := TSplitter.Create(Self);
  FSplitter.Parent  := Self;
  FSplitter.Width   := 2;
  FSplitter.Visible := False;
  FSplitter.Cursor  := crVSplit;
  FSplitter.Beveled := False;
  FSplitter.Align   := alTop;

  FReportPanel := TPanel.Create(Self);
  FReportPanel.Parent := Self;
  FReportPanel.Align  := alTop;
  FReportPanel.BevelOuter := bvNone;
  FReportPanel.Width  := 250;
  FReportPanel.Visible  := False;

  FReportTitleBar := TppBevel.Create(Self);
  FReportTitleBar.Parent := FReportPanel;
  FReportTitleBar.Align  := alTop;
  FReportTitleBar.Height := 21;
  FReportTitleBar.Caption := ppLoadStr(390); {Report Outline}

  FReportTree := TppReportTreeView.Create(Self);
  FReportTree.Parent      := FReportPanel;
  FReportTree.Height      := 71;
  FReportTree.Align       := alClient;
  FReportTree.ShowRoot    := True;
  FReportTree.OnChange    := ReportTreeChangeEvent;

  FReportTreeBuilder := TppReportOutlineTreeBuilder.Create(FReportTree);


  FObjectPanel := TPanel.Create(Self);
  FObjectPanel.Parent := Self;
  FObjectPanel.Align  := alClient;
  FObjectPanel.BevelOuter := bvNone;

  FObjectTitleBar := TppBevel.Create(Self);
  FObjectTitleBar.Parent := FObjectPanel;
  FObjectTitleBar.Align  := alTop;
  FObjectTitleBar.Height := 21;
  FObjectTitleBar.Caption := ppLoadStr(631); {Object Outline}


  FObjectTree := TppReportTreeView.Create(Self);
  FObjectTree.Parent      := FObjectPanel;
  FObjectTree.Align       := alClient;
  FObjectTree.ShowRoot    := False;
  FObjectTree.OnChange    := ObjectTreeChangeEvent;
  FObjectTree.OnEditing   := TreeViewEditingEvent;
  FObjectTree.OnEdited    := TreeViewEditedEvent;


  FObjectTree.ClassImages := TppClassImageList.Create(Self);
 { FReportTree.ClassImages := FObjectTree.ClassImages ;  }

  FObjectTreeBuilder := TppReportObjectTreeBuilder.Create(FObjectTree);


  FTreeStates := TppTreeStates.Create(nil);

  BuildPopupMenu;

  OnRecreating := WindowRecreatingEvent;
  OnRecreated  := WindowRecreatedEvent;

  {set default size and position}
  Left   := 3;
  Top    := 107;
  Width  := 180;
  Height := 305;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppReportTreeWindow.Destroy}

destructor TppReportTreeWindow.Destroy;
begin

  FTreeStates.Free;
  FReportTreeBuilder.Free;
  FObjectTreeBuilder.Free;

  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppReportTreeWindow.WindowRecreatingEvent}

procedure TppReportTreeWindow.WindowRecreatingEvent(Sender: TObject);
begin

  {save state and clear the treeview items}
  {note: this occurs when window changes its DockedTo property}

  FTreeStates.TreeView := FObjectTree;
  FTreeStates.Save(0);
  FTreeStates.TreeView := FReportTree;
  FTreeStates.Save(1);

  FReportTree.Items.Clear;
  FObjectTree.Items.Clear;


end; {procedure, WindowRecreatingEvent}

{------------------------------------------------------------------------------}
{ TppReportTreeWindow.WindowRecreatEvent}

procedure TppReportTreeWindow.WindowRecreatedEvent(Sender: TObject);
begin

  FActive := False;

  {rebuild the trees}
  FReportTree.BuildTree;

  FObjectTree.BuildTree;

  FActive := True;
  FTreeStates.TreeView := FReportTree;
  FTreeStates.Restore(1);

end; {procedure, WindowRecreatedEvent}


{------------------------------------------------------------------------------}
{ TppReportTreeWindow.BuildPopupMenu }

procedure TppReportTreeWindow.BuildPopupMenu;
var
  lMenuItem: TMenuItem;

begin

  if FTreeMenu <> nil then
    FTreeMenu.Free;


  FTreeMenu := TPopupMenu.Create(Self);
  FTreeMenu.OnPopup := PopupMenuEvent;

  lMenuItem := TMenuItem.Create(FTreeMenu);
  lMenuItem.Caption := ppLoadStr(390); {Report Outline}
  lMenuItem.Name    := 'mniReportOutline';
  lMenuItem.OnClick := TreeMenuItemClickEvent;

  FTreeMenu.Items.Add(lMenuItem);

  lMenuItem := TMenuItem.Create(FTreeMenu);
  lMenuItem.Caption := ppLoadStr(631); {Object Outline}
  lMenuItem.Name    := 'mniObjectOutline';
  lMenuItem.OnClick := TreeMenuItemClickEvent;

  FTreeMenu.Items.Add(lMenuItem);

  lMenuItem := TMenuItem.Create(FTreeMenu);
  lMenuItem.Caption := '-';
  lMenuItem.Name    := 'mniLine1';

  FTreeMenu.Items.Add(lMenuItem);

  lMenuItem := TMenuItem.Create(FTreeMenu);
  lMenuItem.Caption :=  ppLoadStr(632); {Show Titles}
  lMenuItem.Name    := 'mniShowTitle';
  lMenuItem.OnClick := TreeMenuItemClickEvent;

  FTreeMenu.Items.Add(lMenuItem);

  FTreeMenu.Items[0].Checked := False;
  FTreeMenu.Items[1].Checked := True ;
  FTreeMenu.Items[3].Checked := True ;

  lMenuItem := TMenuItem.Create(FTreeMenu);
  lMenuItem.Caption := '-';
  lMenuItem.Name    := 'mniLine2';

  FTreeMenu.Items.Add(lMenuItem);

  lMenuItem := TMenuItem.Create(FTreeMenu);
  lMenuItem.Caption :=  ppLoadStr(542); {Rena&me}
  lMenuItem.Name    := 'mniRename';
  lMenuItem.OnClick := TreeMenuItemClickEvent;

  FTreeMenu.Items.Add(lMenuItem);


  FReportTree.PopupMenu := FTreeMenu;
  FObjectTree.PopupMenu := FTreeMenu;


end; {procedure, BuildPopupMenu}


{------------------------------------------------------------------------------}
{ TppReportTreeWindow.PopupMenuEvent }

procedure TppReportTreeWindow.PopupMenuEvent(Sender: TObject);
begin
  {display Rename option as needed}
  FTreeMenu.Items[5].Visible := False;


  if FObjectTree.Focused then
    FTreeMenu.Items[5].Visible :=  (FObjectTree.Selected <> nil) and
                                    AllowTreeNodeEditText(FObjectTree.Selected)
  else if FReportTree.Focused then
    FTreeMenu.Items[5].Visible :=  (FReportTree.Selected <> nil) and
                                    AllowTreeNodeEditText(FReportTree.Selected)



end; {procedure, PopupMenuEvent}

{------------------------------------------------------------------------------}
{ TppDataTreeWindow.LoadPreferences}

{$IFDEF Delphi4}
procedure TppReportTreeWindow.LoadPreferences(aIniFile: TCustomIniFile);
{$ELSE}
procedure TppReportTreeWindow.LoadPreferences(aIniFile: TIniFile);
{$ENDIF}
begin

  if (aIniFile = nil) then Exit;

  FShowTitleBar := aIniFile.ReadBool('ReportOutline', 'TitleBarVisible', True);


end; {procedure, LoadPreferences}


{------------------------------------------------------------------------------}
{ TppDataTreeWindow.SavePreferences}

{$IFDEF Delphi4}
procedure TppReportTreeWindow.SavePreferences(aIniFile: TCustomIniFile);
{$ELSE}
procedure TppReportTreeWindow.SavePreferences(aIniFile: TIniFile);
{$ENDIF}

begin

  if (aIniFile = nil) then Exit;

  aIniFile.WriteBool('ReportOutline', 'TitleBarVisible', FShowTitleBar);

end; {procedure, SavePreferences}

{------------------------------------------------------------------------------}
{ TppReportTreeWindow.TreeMenuItemClickEvent }

procedure TppReportTreeWindow.TreeMenuItemClickEvent(Sender: TObject);
var
  lReportTreeVisible: Boolean;
  lObjectTreeVisible: Boolean;

begin


  if (FTreeMenu.Items[0] = Sender) then
    begin
      {toggle report outline visibility}
      lReportTreeVisible := not FReportPanel.Visible;
      lObjectTreeVisible := FObjectPanel.Visible;
      SetTreesVisible(lReportTreeVisible, lObjectTreeVisible);

    end
  else if (FTreeMenu.Items[1] = Sender) then
    begin
      {toggle object outline visibility}
      lReportTreeVisible := FReportPanel.Visible;
      lObjectTreeVisible := not FObjectPanel.Visible;
      SetTreesVisible(lReportTreeVisible, lObjectTreeVisible);
   end
  else if (FTreeMenu.Items[3] = Sender) then
    SetShowTitlebar(not FReportTitleBar.Visible)

  else if (FTreeMenu.Items[5] = Sender) then
    begin
      if FObjectTree.Focused and (FObjectTree.Selected <> nil) then
        FObjectTree.Selected.EditText
      else if FReportTree.Focused and (FReportTree.Selected <> nil) then
        FReportTree.Selected.EditText;


    end;


end; {procedure, TreeMenuItemClickEvent}

{------------------------------------------------------------------------------}
{ TppReportTreeWindow.SetTreesVisible }

procedure TppReportTreeWindow.SetTreesVisible(aReportTreeVisible, aObjectTreeVisible: Boolean);
begin

  if aReportTreeVisible and aObjectTreeVisible then
    begin
      FReportPanel.Align   := alNone;
      FSplitter.Visible    := True;
      FSplitter.Align      := alTop;
      FReportPanel.Visible := True;
      FReportPanel.Align   := alTop;
      FReportPanel.Height  := 71;
      FObjectPanel.Visible  := True;

    end

  else if aReportTreeVisible then
   begin
      FReportPanel.Align   := alClient;
      FReportPanel.Visible := True;
      FSplitter.Visible   := False;
      FObjectPanel.Visible := False;
    end

  else
    begin
      FObjectPanel.Visible := True;
      FSplitter.Visible   := False;
      FReportPanel.Visible := False;

    end;


  FTreeMenu.Items[0].Checked := FReportPanel.Visible;
  FTreeMenu.Items[1].Checked := FObjectPanel.Visible;

end; {procedure, SetTreesVisible}



{------------------------------------------------------------------------------}
{ TppReportTreeWindow.SetReport}

procedure TppReportTreeWindow.SetReport(aReport: TppCustomReport);
begin

  if (csDestroying in ComponentState) then Exit;

  FReport := aReport;

  {build object tree for the report}
  FObjectTree.Report := aReport;

  {initialize the report tree or select a report}
  if (aReport = nil)  or (FReportTree.Report = nil) then
    begin
      FReportTree.Report := aReport;
      if (FReportTree.Items.Count = 1) then
        SetTreesVisible(False, True)
      else
        SetTreesVisible(True, True);

    end

  else
    SelectReport(aReport);

end; {procedure, SetReport}


{------------------------------------------------------------------------------}
{ TppReportTreeWindow.SetShowTitlebar}

procedure TppReportTreeWindow.SetShowTitlebar(aValue: Boolean);
begin

  FShowTitlebar := aValue;

  FReportTitleBar.Visible := aValue;
  FObjectTitleBar.Visible := aValue;
  FTreeMenu.Items[3].Checked := FReportTitleBar.Visible;

end; {procedure, SetShowTitlebar}


{------------------------------------------------------------------------------}
{ TppReportTreeWindow.Rebuild}

procedure TppReportTreeWindow.Rebuild;
begin

  FObjectTree.BeginUpdate;
  FObjectTree.Rebuild;
  FObjectTree.EndUpdate;

end; {procedure, Rebuild}


{------------------------------------------------------------------------------}
{ TppReportTreeWindow.SelectComponent}

procedure TppReportTreeWindow.SelectComponent(aComponent: TComponent);
var
  lTreeNode: TTreeNode;
  lbNodeFound: Boolean;

begin

  {optimize}
  if (GetSelectedComponent = aComponent) then Exit;

  if not FActive then Exit;

  FActive := False;

  try

    {rebuild tree if needed}
    lbNodeFound := FObjectTree.FindComponentNode(aComponent, lTreeNode);

    {set selected node}
    if lbNodeFound then
      FObjectTree.Selected := lTreeNode
    else
      FObjectTree.Selected := nil;

  finally

    FActive := True;

  end; {tru, finally}


end; {procedure, SelectComponent}

{------------------------------------------------------------------------------}
{ TppReportTreeWindow.SelectReport}

procedure TppReportTreeWindow.SelectReport(aReport: TComponent);
var
  lTreeNode: TTreeNode;
  lbNodeFound: Boolean;

begin

  {optimize}
  if (GetSelectedReport = aReport) then Exit;

  if not FActive then Exit;

  FActive := False;

  try

  {  if aReport is TppReport then

    FObjectTitleBar.Caption := 'Objects for ' + TppCustomReport(aReport.UserName);
   }
    {rebuild tree if needed}
    lbNodeFound := FindReportNode(aReport, lTreeNode);

    if not lbNodeFound then
      begin
        FReportTree.BuildTree;
        lbNodeFound := FindReportNode(aReport, lTreeNode);
      end;

    {set selected node}
    if lbNodeFound then
      FReportTree.Selected := lTreeNode
    else
      FReportTree.Selected := nil;

  finally

    FActive := True;

  end; {tru, finally}


end; {procedure, SelectReport}


{------------------------------------------------------------------------------}
{ TppReportTreeWindow.GetSelectedComponent}

function TppReportTreeWindow.GetSelectedComponent: TComponent;
begin

  if (FObjectTree.Selected = nil) then
    Result := nil
  else
    Result := TComponent(FObjectTree.Selected.Data);

end; {procedure, GetSelectedComponent}

{------------------------------------------------------------------------------}
{ TppReportTreeWindow.FindReportNode}

function TppReportTreeWindow.FindReportNode(aReport: TComponent; var aNode: TTreeNode): Boolean;
var
  liIndex: Integer;
begin

  aNode := nil;
  liIndex := 0;

  while (liIndex < FReportTree.Items.Count) and (aNode = nil) do
    begin
      if (TComponent(FReportTree.Items[liIndex].Data) = aReport) then
        aNode := FReportTree.Items[liIndex];

      Inc(liIndex);
    end;

  Result := (aNode <> nil);

end; {procedure, FindReportNode}


{------------------------------------------------------------------------------}
{ TppReportTreeWindow.GetSelectedReport}

function TppReportTreeWindow.GetSelectedReport: TComponent;
begin

  if (FReportTree.Selected = nil) then
    Result := nil
  else
    Result := TComponent(FReportTree.Selected.Data);

end; {procedure, GetSelectedComponent}


{------------------------------------------------------------------------------}
{ TppReportTreeWindow.ObjectTreeChangeEvent }

procedure TppReportTreeWindow.ObjectTreeChangeEvent(Sender: TObject; Node: TTreeNode);
begin

  if not FActive then Exit;

  if FObjectTree.Building then Exit;

  FActive := False;

  try
    if Assigned(FOnComponentSelected) then FOnComponentSelected(Self);

  finally
    FActive := True;

  end; {try, finally}

end; {procedure, ObjectTreeChangeEvent}


{------------------------------------------------------------------------------}
{ TppReportTreeWindow.ReportTreeChangeEvent }

procedure TppReportTreeWindow.ReportTreeChangeEvent(Sender: TObject; Node: TTreeNode);
begin

  if not FActive then Exit;

  if FReportTree.Building then Exit;

  FActive := False;

  try
    if Assigned(FOnReportSelected) then FOnReportSelected(Self);

  finally
    FActive := True;

  end; {try, finally}

end; {procedure, ReportTreeChangeEvent}



{------------------------------------------------------------------------------}
{ TppReportTreeWindow.AddChildReport                                           }

procedure TppReportTreeWindow.AddChildReport(const aCaption: String; aChildReport: TComponent);
begin

  FActive := False;

  FReportTree.AddComponent(aChildReport);
  FActive := True;

  {set report tree to visible, if this is the first child report added}
  if (FReportTree.Items.Count = 2) then
    SetTreesVisible(True, True);


end; {procedure, AddChildReport}


{------------------------------------------------------------------------------}
{ TppReportTreeWindow.RemoveChildReport                                        }

procedure TppReportTreeWindow.RemoveChildReport(aChildReport: TComponent);
begin

  FActive := False;

  FReportTree.RemoveComponent(aChildReport);
  FActive := True;

  {set report tree to invisible, if only the main report is left }
  if (FReportTree.Items.Count = 1) then
    SetTreesVisible(False, True);

end; {procedure, RemoveChildReport}

{------------------------------------------------------------------------------}
{ TppReportTreeWindow.AddComponent                                             }

procedure TppReportTreeWindow.AddComponent(aComponent: TComponent);
var
  lTreeNode: TTreeNode;
  
begin

  if FObjectTree.FindComponentNode(aComponent, lTreeNode) then Exit;

  FActive := False;

  FObjectTree.AddComponent(aComponent);
  FActive := True;

end; {procedure, AddComponent}

{------------------------------------------------------------------------------}
{ TppReportTreeWindow.RemoveComponent                                          }

procedure TppReportTreeWindow.RemoveComponent(aComponent: TComponent);
begin
  FActive := False;

  FObjectTree.RemoveComponent(aComponent);
  FActive := True;

end; {procedure, RemoveComponent}


{------------------------------------------------------------------------------}
{ TppReportTreeWindow.UpdateComponent                                          }

procedure TppReportTreeWindow.UpdateComponent(aComponent: TComponent);
var
  lTreeNode: TTreeNode;
  lReport: TppCustomReport;

begin
  if aComponent is TppSubReport then
    begin
      lReport := TppSubReport(aComponent).Report;

      if (lReport <> nil) and  FindReportNode(lReport, lTreeNode) then
        lTreeNode.Text := TppSubReport(aComponent).UserName;

    end;

  FObjectTree.UpdateComponent(aComponent);

end; {procedure, RemoveComponent}


{------------------------------------------------------------------------------}
{ TppReportTreeWindow.AllowTreeNodeEditText }

function TppReportTreeWindow.AllowTreeNodeEditText(aNode: TTreeNode): Boolean;
var
  lNodeObject: TObject;

begin

  lNodeObject := TObject(aNode.Data);

  if (lNodeObject = nil) or not (lNodeObject is TppComponent) then
    Result := False
  else
    Result := True;

end; {procedure, AllowTreeNodeEditText}


{------------------------------------------------------------------------------}
{ TppReportTreeWindow.TreeViewEditingEvent }

procedure TppReportTreeWindow.TreeViewEditingEvent(Sender: TObject; Node: TTreeNode; var AllowEdit: Boolean);
begin

  AllowEdit := AllowTreeNodeEditText(Node);

end; {procedure, TreeViewEditingEvent}

{------------------------------------------------------------------------------}
{ TppReportTreeWindow.TreeViewEditedEvent }

procedure TppReportTreeWindow.TreeViewEditedEvent(Sender: TObject; Node: TTreeNode; var S: string);
var
  lNodeObject: TppComponent;
  liStringId: Integer;
  lsMessage: String;

begin

  lNodeObject := TppComponent(Node.Data);

  if (lNodeObject = nil) then Exit;

  {try to set user name}
  lNodeObject.UserName := S;

  {reassign the user name in case it was not valid}
  if lNodeObject.UserName <> S then
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
{ TppReportTreeWindow.DoOnMessage }

procedure TppReportTreeWindow.DoOnMessage(aMessage: String);
begin

  if Assigned(FOnMessage) then FOnMessage(Self, aMessage);

end; {procedure, DoOnMessage}


{------------------------------------------------------------------------------}
{ TppReportTreeWindow.SetLanguageIndex }

procedure TppReportTreeWindow.SetLanguageIndex(aLanguageIndex: Longint);
begin

  inherited SetLanguageIndex(aLanguageIndex);
  
  Caption := ppLoadStr(391); {Report Tree}
  FReportTitleBar.Caption := ppLoadStr(390); {Report Outline}
  FObjectTitleBar.Caption := ppLoadStr(631); {Object Outline}

  FTreeMenu.Items[0].Caption := ppLoadStr(390);  {Report Outline}
  FTreeMenu.Items[1].Caption := ppLoadStr(631); {Object Outline}
  FTreeMenu.Items[3].Caption := ppLoadStr(632); {Show Titles}
  FTreeMenu.Items[5].Caption := ppLoadStr(542); {Rename}


end; {procedure, SetLanguageIndex}





end.
