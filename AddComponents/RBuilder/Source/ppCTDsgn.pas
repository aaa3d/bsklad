{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppCTDsgn;

interface

{$I ppIfDef.pas}

uses
  Classes, StdCtrls, ExtCtrls, Menus, Controls, ComCtrls,  Graphics, Forms, Dialogs,
  ppTypes, ppUtils, ppForms, ppDB, ppIDE, ppTB97, ppTB97Ut, ppTB97x, ppPrintr,
  ppTreeVw, ppCTCtrl, ppCtMain;

type

  { TppCrossTabFormatBar }
  TppCrossTabFormatBar = class(TppCustomFormatToolbar)
    private
      FCrosstabControl: TppCrossTabControl;
      FCalcTypeComboBox: TComboBox;
      FDisplayFormatButton: TppToolbarButton;
      FSortAscButton: TppToolbarButton;
      FSortDescButton: TppToolbarButton;

      procedure CalcTypeChangeEvent(Sender: TObject);
      procedure DisplayFormatButtonClickEvent(Sender: TObject);
      procedure FontChangeEvent(Sender: TObject);
      procedure HighlightButtonClickEvent(Sender: TObject);
      procedure GetPrinterEvent(Sender: TObject; var aPrinter: TppPrinter);
      procedure AlignmentButtonClickEvent(Sender: TObject);
      procedure SortButtonClickEvent(Sender: TObject);

    protected
      procedure CreateControls; override;
      procedure SetLanguageIndex(aLanguageIndex: Longint); override;

    public
      procedure EnableFontControls(aValue: Boolean);
      procedure EnableCalcTypeControls(aValue: Boolean);
      procedure EnableDisplayFormatControls(aValue: Boolean);
      procedure EnableSortControls(aValue: Boolean);

      procedure ShowDisplayFormatDialog;
      procedure ShowColorDialog;
      procedure ShowFontDialog;

      property CrossTabControl: TppCrossTabControl read FCrosstabControl write FCrosstabControl;


  end; {class, TppCrossTabFormatBar}


  { TppCrossTabDesigner }
  TppCrossTabDesigner = class(TPanel)
    private
      FPopupMenu: TPopupMenu;
      FCrossTab: TppCrossTab;
      FDock: TppDock;
      FFormatBar: TppCrossTabFormatBar;
      FTipsPanel: TPanel;
      FImage: TImage;
      FTipsLabel1: TLabel;
      FTipsLabel2: TLabel;
      FTipsLabel3: TLabel;
      FTipsLabel4: TLabel;
      FFieldPanel: TPanel;
      FFieldHeaderPanel: TPanel;
      FFieldsLabel: TLabel;
      FSplitter: TSplitter;
      FLayoutBackgroundPanel: TPanel;
      FLayoutHeaderPanel: TPanel;
      FLayoutLabel: TLabel;
      FLayoutPanel: TPanel;
      FControl: TppCrossTabControl;
      FListView: TppReportListView;
      FImageList: TImageList;
      FStatusBar: TStatusbar;
      FDisplayTips: Boolean;

      {create and configure controls}
      procedure CreateControls;
      procedure CreateFieldPanel;
      procedure CreateLayoutPanel;
      procedure CreateListView;
      procedure CreateTipsPanel;
      procedure CrossTabToControls;

      procedure FieldsToListView;
      function GetDisplayTips: Boolean;
      function GetSelection: TppCrossTabSelection;

      {event-handlers}
      procedure DimensionChangeEvent(Sender: TObject);
      procedure FieldsDragOverEvent(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
      procedure FieldsDragDropEvent(Sender, Source: TObject; X, Y: Integer);
      procedure GetFieldEvent(Sender: TObject; var aField: TppField);
      procedure SelectionChangeEvent(Sender: TObject);
      procedure StatusChangeEvent(Sender: TObject);
      procedure SplitterMovedEvent(Sender: TObject);

      procedure SetCrossTab(aCrossTab: TppCrossTab);
      procedure SetDisplayTips(aValue: Boolean);

      procedure ShowFontDialog;
      procedure ShowDisplayFormatDialog;
      procedure ShowColorDialog;

   protected
     procedure SetParent(aParent: TWinControl); override;


    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Initialize;

      property CrossTab: TppCrossTab read FCrossTab write SetCrossTab;
      property StatusBar: TStatusbar read FStatusBar write FStatusBar;

      property DisplayTips: Boolean read GetDisplayTips write SetDisplayTips;

      property Selection: TppCrossTabSelection read GetSelection;
      property FieldPanel: TPanel read FFieldPanel;
      property Control: TppCrossTabControl read FControl;


    end; {class, TppCrossTabDesigner}


  { TppCrossTabDesignerMenu }
  TppCrossTabDesignerMenu = class(TPopupMenu)
      private
        FDesigner: TppCrossTabDesigner;

        procedure CreateMenuItems;

        procedure MenuItemClickEvent(Sender: TObject);
        procedure MenuPopupEvent(Sender: TObject);
        procedure NullOrderClickEvent(Sender: TObject);

      public
        constructor CreateMenu(aOwner: TComponent; aCrossTabDesigner: TppCrossTabDesigner); virtual;

    end; {class, TppCrossTabDesignerMenu}



implementation

uses
  ppCTDlg, ppCWzDlg, ppCTWiz;


type
    TppCrossTabMenuCommandType   = (cmTips, cmFont, cmColor, cmDisplayFormat, cmSkipNulls, cmNullOrder, cmVisible, cmGridlines);

const

  cCrossTabMenuCaptions: array[Low(TppCrossTabMenuCommandType)..High(TppCrossTabMenuCommandType)] of Integer =
    (669, {'&Tips'}
     670, {'&Font'}
     671, {'&Color'}
     672,{'&Display Format'}
     1102, {'&Skip Nulls'}
     1108, {'Null Order'}
     673, {'&Visible'}
     674); {'&Gridlines'}


{******************************************************************************
 *
 ** C R O S S T A B   D E S I G N E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.Create }

constructor TppCrossTabDesigner.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  BevelOuter := bvNone;
  ShowHint   := True;

  FCrossTab  := TppCrossTab.Create(Self);

  FPopupMenu := TppCrossTabDesignerMenu.CreateMenu(Self, Self);

  {4.11}
  {PopupMenu := FPopupMenu;}


end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.Destroy }

destructor TppCrossTabDesigner.Destroy;
begin

  FPopupMenu.Free;
  FFormatBar.Free;
  FControl.Free;
  FCrossTab.Free;

  inherited Destroy;

end;  {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.CreateControls }

procedure TppCrossTabDesigner.SetParent(aParent: TWinControl);
begin

  inherited SetParent(aParent);

  if (aParent <> nil) then
    CreateControls;

end; {procedure, SetParent}

{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.CreateControls }

procedure TppCrossTabDesigner.CreateControls;
begin

  {create tips panel and associated child panels}
  CreateTipsPanel;

  {create fields panel and associated child panels}
  CreateFieldPanel;

  {create layout background panel and associated child panels}
  CreateLayoutPanel;

  {4.11}
  FLayoutPanel.PopupMenu := FPopupMenu;

  {create top dock}
  FDock := TppDock.Create(Owner);
  FDock.Parent    := FLayoutPanel;
  FDock.Position  := ppdpTop;
  FDock.AllowDrag := False;

  {create format toolbar and dock it to top}
  FFormatBar := TppCrossTabFormatBar.Create(Owner);
  FFormatBar.DockedTo := FDock;
  FFormatBar.EnableFontControls(False);
  FFormatBar.EnableCalcTypeControls(False);
  FFormatBar.EnableDisplayFormatControls(False);
  FFormatBar.EnableSortControls(False);

end; {procedure, CreateControls}

{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.CreateTipsPanel }

procedure TppCrossTabDesigner.CreateTipsPanel;
begin

  {create tips panel and it children}
  FTipsPanel := TPanel.Create(Self);
  FTipsPanel.Parent := Self;
  FTipsPanel.Height := 83;
  FTipsPanel.Align  := alTop;

  FImage := TImage.Create(Self);
  FImage.Parent := FTipsPanel;
  FImage.Left := 6;
  FImage.Top  := 3;
  FImage.AutoSize := True;
  FImage.Picture.Bitmap.Handle := ppBitmapFromResource('PPCROSSTABTIPS');
  FImage.Transparent := True;

  FTipsLabel1 := TLabel.Create(Self);
  FTipsLabel1.Parent := FTipsPanel;
  FTipsLabel1.Left := 209;
  FTipsLabel1.Top  := 8;
  FTipsLabel1.Caption := ppLoadStr(663); {'1. Construct your crosstab by dragging fields from the field list into the shaded cells.'}

  FTipsLabel2 := TLabel.Create(Self);
  FTipsLabel2.Parent := FTipsPanel;
  FTipsLabel2.Left := 209;
  FTipsLabel2.Top  := 26;
  FTipsLabel2.Caption := ppLoadStr(664); {'2. Remove columns, rows or values by dragging from the diagram back to the field list.'}

  FTipsLabel3 := TLabel.Create(Self);
  FTipsLabel3.Parent := FTipsPanel;
  FTipsLabel3.Left := 209;
  FTipsLabel3.Top  := 44;
  FTipsLabel3.Caption := ppLoadStr(665); {'3. Reorder columns, rows or values by dragging within the diagram.'}

  FTipsLabel4 := TLabel.Create(Self);
  FTipsLabel4.Parent := FTipsPanel;
  FTipsLabel4.Left := 209;
  FTipsLabel4.Top  := 62;
  FTipsLabel4.Caption := ppLoadStr(666); {'4. Format crosstab by selecting a row, column or value and then using the toolbar or popup menu.'}

end; {procedure, CreateTipsPanel}

{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.CreateControls }

procedure TppCrossTabDesigner.CreateFieldPanel;
begin

  {create fields panel and associated child panels}
  FFieldPanel := TPanel.Create(Self);
  FFieldPanel.Parent := Self;
  FFieldPanel.Align := alLeft;
  FFieldPanel.BevelOuter := bvNone;
  FFieldPanel.Width := 164;

  FFieldHeaderPanel := TPanel.Create(Self);
  FFieldHeaderPanel.Parent := FFieldPanel;
  FFieldHeaderPanel.Align := alTop;
  FFieldHeaderPanel.BevelOuter := bvNone;
  FFieldHeaderPanel.Height := 21;

  FFieldsLabel := TLabel.Create(Self);
  FFieldsLabel.Parent  := FFieldHeaderPanel;
  FFieldsLabel.Left    := 7;
  FFieldsLabel.Top     := 3;
  FFieldsLabel.Height  := 13;
  FFieldsLabel.Caption := ppLoadStr(637); {'Fields'}

  FSplitter := TSplitter.Create(SElf);
  FSplitter.Parent := Self;
  FSplitter.Left := 164;
  FSplitter.Align := alLeft;
  FSplitter.Beveled := False;
  FSplitter.Width := 3;
  FSplitter.Cursor := crHSplit;
  FSplitter.OnMoved := SplitterMovedEvent;

end; {procedure, CreateFieldPanel}

{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.CreateLayoutPanel }

procedure TppCrossTabDesigner.CreateLayoutPanel;
begin

  {create view background panel and associated child panels}
  FLayoutBackgroundPanel := TPanel.Create(Self);
  FLayoutBackgroundPanel.Parent := Self;
  FLayoutBackgroundPanel.Left := FSplitter.Left + FSplitter.Width + 1;;
  FLayoutBackgroundPanel.Align := alClient;
  FLayoutBackgroundPanel.BevelOuter := bvNone;

  FLayoutHeaderPanel := TPanel.Create(Self);
  FLayoutHeaderPanel.Parent := FLayoutBackgroundPanel;
  FLayoutHeaderPanel.Align := alTop;
  FLayoutHeaderPanel.BevelOuter := bvNone;
  FLayoutHeaderPanel.Height := 21;

  FLayoutLabel := TLabel.Create(Self);
  FLayoutLabel.Parent  := FLayoutHeaderPanel;
  FLayoutLabel.Left    := 7;
  FLayoutLabel.Top     := 3;
  FLayoutLabel.Height  := 13;
  FLayoutLabel.Caption := ppLoadStr(612); {'Layout'}

  FLayoutPanel := TPanel.Create(Self);
  FLayoutPanel.Parent := FLayoutBackgroundPanel;
  FLayoutPanel.Top := FLayoutHeaderPanel.Top + FLayoutHeaderPanel.Height + 1;
  FLayoutPanel.Align      := alClient;
  FLayoutPanel.BevelOuter := bvNone;

end; {procedure, CreateLayoutPanel}

{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.Initialize }

procedure TppCrossTabDesigner.Initialize;
begin
  CrossTabToControls;
end; {procedure, Initialize}

{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.SetCrossTab }

procedure TppCrossTabDesigner.SetCrossTab(aCrossTab: TppCrossTab);
begin
  FCrossTab.Assign(aCrossTab);

  CrossTabToControls;
end; {procedure, SetCrossTab}

{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.GetDisplayTips }

function TppCrossTabDesigner.GetDisplayTips: Boolean;
begin
  Result := FTipsPanel.Visible;
end; {function, GetDisplayTips}

{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.SetDisplayTips }

procedure TppCrossTabDesigner.SetDisplayTips(aValue: Boolean);
begin
  FDisplayTips := aValue;
  FTipsPanel.Visible := FDisplayTips;
end; {procedure, SetDisplayTips}

{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.CrossTabToControls }

procedure TppCrossTabDesigner.CrossTabToControls;
begin

  FControl.Free;
  FListView.Free;
  FImageList.Free;

  CreateListView;

  FControl := TppCrossTabControl.CreateControl(FCrossTab, FLayoutPanel);

  FControl.FieldSource := FListView;
  FControl.OnGetField := GetFieldEvent;
  FControl.OnSelectionChange := SelectionChangeEvent;
  FControl.OnStatusChange := StatusChangeEvent;

  FListView.OnDragOver := FieldsDragOverEvent;
  FListView.OnDragDrop := FieldsDragDropEvent;

  FCrossTab.OnDimensionChange2 := DimensionChangeEvent;

  FCrossTab.InitAvailableDimensions;

  FieldsToListView;

  FControl.Visible := True;

  FFormatBar.CrossTabControl := FControl;


end; {procedure, CrossTabToControls}

{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.CreateListView }

procedure TppCrossTabDesigner.CreateListView;
var
  lColumn: TListColumn;
  lBitmap: TBitmap;
begin

  FListView := TppReportListView.Create(Self);
  FListView.Parent := FFieldPanel;
  FListView.Align := alClient;
  FListView.OwnerDraw := True;
{$IFDEF Delphi4}
  FListview.DoubleBuffered := True;
{$ENDIF}
  FListView.AllowDrag := True;
  FListView.ReadOnly := True;
  FListView.ViewStyle := vsReport;
  FListView.ColumnClick := False;
  FListView.RowSelect := True;
  FListView.SortType := stNone;
  FListView.Color := clBtnFace;
  FListView.ShowColumnHeaders := False;

  {create dummy image list to fix drawing error}
  FImageList := TImageList.Create(Self);

  lBitmap := TBitmap.Create;
  lBitmap.Handle := ppBitmapFromResource('TPPCROSSTAB');
  FImageList.AddMasked(lBitmap, clSilver);
  lBitmap.Free;

  FListView.SmallImages := FImageList;

  lColumn := FListView.Columns.Add;
  lColumn.Width := FFieldPanel.Width - 6;

end; {procedure, CreateListView}

{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.FieldsToListView }

procedure TppCrossTabDesigner.FieldsToListView;
var
  lFields: TStringList;
  liIndex: Integer;
  lItem: TListItem;
begin

  FListView.Items.BeginUpdate;

  FListView.Items.Clear;

  lFields := TStringList.Create;

  FCrossTab.CopyAvailableDimensions(lFields);

  for liIndex := 0 to lFields.Count - 1 do
    begin
      lItem := FListView.Items.Add;

      lItem.Caption := lFields[liIndex];
      lItem.Data := lFields.Objects[liIndex];
    end;

  lFields.Free;

  FListView.Columns[0].Width := FFieldPanel.Width - 20;

  FListView.Items.EndUpdate;

end; {procedure, FieldsToListView}

{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.GetSelection }

function TppCrossTabDesigner.GetSelection: TppCrossTabSelection;
begin
  if (FControl <> nil) then
    Result := FControl.Selection
  else
    Result := nil;

end; {procedure, GetSelection}

{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.DimensionChangeEvent }

procedure TppCrossTabDesigner.DimensionChangeEvent(Sender: TObject);
begin
  FieldsToListView;
end; {procedure, DimensionChangeEvent}

{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.GetFieldEvent }

procedure TppCrossTabDesigner.GetFieldEvent(Sender: TObject; var aField: TppField);
begin
  if (FListView.Selected <> nil) then
    aField := TppField(FListView.Selected.Data);
end; {procedure, GetFieldEvent}

{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.SelectionChangeEvent }

procedure TppCrossTabDesigner.SelectionChangeEvent(Sender: TObject);
begin

  FFormatBar.EnableFontControls(FControl.Selection.HasProperty('Font'));
  FFormatBar.EnableCalcTypeControls(FControl.Selection.HasProperty('CalcType'));
  FFormatBar.EnableDisplayFormatControls(FControl.Selection.HasProperty('DisplayFormat'));
  FFormatBar.EnableSortControls(FControl.Selection.HasProperty('SortType'));


end; {procedure, SelectionChangeEvent}

{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.StatusChangeEvent }

procedure TppCrossTabDesigner.StatusChangeEvent(Sender: TObject);
begin
  if (FStatusBar <> nil) then
    FStatusBar.SimpleText := FControl.Status;

end; {procedure, TppCrossTabDesigner}


{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.FieldsDragOverEvent }

procedure TppCrossTabDesigner.FieldsDragOverEvent(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin

  if (Source <> Self) then
    begin
      if FControl.Selection.ContainsDimensions then
        Accept := True
      else
        Accept := False;
    end
  else
    Accept := False;

end; {procedure, FieldsDragOverEvent}

{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.FieldsDragDropEvent }

procedure TppCrossTabDesigner.FieldsDragDropEvent(Sender, Source: TObject; X, Y: Integer);
var
  liIndex: Integer;
  lElement: TppElement;
  lDimensions: TList;
begin

  if (Source = Self) then Exit;

  if not(FControl.Selection.ContainsDimensions) then Exit;

  FControl.BeginUpdate;

  lDimensions := TList.Create;

  for liIndex := 0 to FControl.Selection.ElementCount - 1 do
    begin
      lElement := FControl.Selection.Elements[liIndex];

      if (lElement is TppDimension) or (lElement is TppValueCaptionDef) then
        lDimensions.Add(lElement);
    end;

  for liIndex := 0 to lDimensions.Count - 1 do
    begin
      lElement := TppElement(lDimensions[liIndex]);

      if (lElement is TppColumnDef) then
        FCrossTab.DeselectColumnDef(FCrossTab.IndexOfChild(lElement))

      else if (lElement is TppRowDef) then
        FCrossTab.DeselectRowDef(FCrossTab.IndexOfChild(lElement))

      else if (lElement is TppValueCaptionDef) then
        FCrossTab.DeselectValueDef(FCrossTab.IndexOfChild(TppValueDef(lElement.Parent)))

      else if (lElement is TppValueDef) then
        FCrossTab.DeselectValueDef(FCrossTab.IndexOfChild(lElement));
    end;

  lDimensions.Free;

  FControl.EndUpdate;

end; {procedure, FieldsDragDropEvent}

{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.SplitterMovedEvent }

procedure TppCrossTabDesigner.SplitterMovedEvent(Sender: TObject);
begin
  FListView.Columns[0].Width := FFieldPanel.Width - 6;
end; {procedure, SplitterMovedEvent}


{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.ShowFontDialog }

procedure TppCrossTabDesigner.ShowFontDialog;
begin

  FFormatBar.ShowFontDialog;

end; {procedure, ShowFontDialog}

{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.ShowColorDialog }

procedure TppCrossTabDesigner.ShowColorDialog;
begin

  FFormatBar.ShowColorDialog;

end; {procedure, ShowColorDialog}

{------------------------------------------------------------------------------}
{ TppCrossTabDesigner.ShowDisplayFormatDialog }

procedure TppCrossTabDesigner.ShowDisplayFormatDialog;
begin
  FFormatBar.ShowDisplayFormatDialog;

end; {procedure, ShowDisplayFormatDialog}


{******************************************************************************
 *
 ** C R O S S T A B   D E S I G N E R   M E N U
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCrossTabDesignerMenu.Create}

constructor TppCrossTabDesignerMenu.CreateMenu(aOwner: TComponent; aCrossTabDesigner: TppCrossTabDesigner);
begin

  inherited Create(Owner);

  OnPopup := MenuPopupEvent;
  FDesigner := aCrossTabDesigner;

  CreateMenuItems;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCrossTabDesignerMenu.CreateMenuItems}

procedure TppCrossTabDesignerMenu.CreateMenuItems;
var
  lMenuItem: TMenuItem;
  lChildMenuItem: TMenuItem;
  lMenuCommand: TppCrossTabMenuCommandType;

begin

  {create menu items}
  for lMenuCommand := Low(TppCrossTabMenuCommandType) to High(TppCrossTabMenuCommandType) do
    begin
      lMenuItem         := TMenuItem.Create(Self);
      lMenuItem.Tag     := Ord(lMenuCommand);
      lMenuItem.OnClick := MenuItemClickEvent;

      {add caption}
      lMenuItem.Caption := ppLoadStr(cCrossTabMenuCaptions[lMenuCommand]);

      if (lMenuCommand in [cmFont, cmDisplayFormat, cmColor]) then
        lMenuItem.Caption := lMenuItem.Caption + '...';

      if (lMenuCommand = cmNullOrder) then
        begin
          lChildMenuItem := TMenuItem.Create(Self);
          lChildMenuItem.Caption := ppLoadStr(1109); {'First'}
          lChildMenuItem.Tag := Ord(ctnoFirst);
          lChildMenuItem.OnClick := NullOrderClickEvent;

          lMenuItem.Add(lChildMenuItem);

          lChildMenuItem := TMenuItem.Create(Self);
          lChildMenuItem.Caption := ppLoadStr(1110); {'Last'}
          lChildMenuItem.Tag := Ord(ctnoLast);
          lChildMenuItem.OnClick := NullOrderClickEvent;

          lMenuItem.Add(lChildMenuItem);
        end;

      Items.Add(lMenuItem);

      {add line, if needed}
      if (lMenuCommand in [cmTips, cmVisible]) then
        begin
          lMenuItem := TMenuItem.Create(Self);
          lMenuItem.Caption  := '-';
          lMenuItem.Tag      := -1;
          Items.Add(lMenuItem);
        end;

    end;


end; {procedure, CreateMenuItems}

{------------------------------------------------------------------------------}
{ TppCrossTabDesignerMenu.MenuItemClickEvent}

procedure TppCrossTabDesignerMenu.MenuItemClickEvent(Sender: TObject);
var
  lbVisible: Boolean;
  lbSkipNulls: Boolean;

begin

  case TppCrossTabMenuCommandType(TMenuItem(Sender).Tag) of

    cmTips:           FDesigner.DisplayTips := not FDesigner.DisplayTips;
    cmFont:           FDesigner.ShowFontDialog;
    cmDisplayFormat:  FDesigner.ShowDisplayFormatDialog;
    cmColor:          FDesigner.ShowColorDialog;
    cmGridLines:
      begin

        FDesigner.CrossTab.Gridlines := not FDesigner.CrossTab.Gridlines;
        FDesigner.Control.Refresh;

      end;


    cmSkipNulls:
      begin
        lbSkipNulls := not TMenuItem(Sender).Checked;

        FDesigner.Selection.SetPropertyValue('SkipNulls', lbSkipNulls);
      end;

    cmVisible:
      begin
        lbVisible := not TMenuItem(Sender).Checked;

        FDesigner.Selection.SetPropertyValue('Visible', lbVisible);
      end;

  end;

end; {procedure, MenuItemClickEvent}


{------------------------------------------------------------------------------}
{ TppCrossTabDesignerMenu.MenuPopupEvent }

procedure TppCrossTabDesignerMenu.MenuPopupEvent(Sender: TObject);
var
  lbVisible: Boolean;
  lbSkipNulls: Boolean;
  lNullOrder: TppNullOrderType;
  lSelection: TppCrossTabSelection;
  liIndex: Integer;
begin

  lSelection := FDesigner.Selection;

  for liIndex := 0 to Items.Count-1 do
    if Items[liIndex].Tag = -1 then
      Continue
    else
      case TppCrossTabMenuCommandType(Items[liIndex].Tag) of

        cmTips: Items[liIndex].Checked      := FDesigner.DisplayTips;
        cmGridLines: Items[liIndex].Checked := FDesigner.CrossTab.GridLines;
        cmFont: Items[liIndex].Enabled      := lSelection.HasProperty('Font');
        cmColor: Items[liIndex].Enabled     := lSelection.HasProperty('Color');
        cmDisplayFormat: Items[liIndex].Enabled := lSelection.HasProperty('DisplayFormat');

        cmSkipNulls:
          begin
            Items[liIndex].Enabled := lSelection.HasProperty('SkipNulls');

            lbSkipNulls := True;

            lSelection.GetPropertyValue('SkipNulls', lbSkipNulls);

            Items[liIndex].Checked := lbSkipNulls;
          end;

        cmNullOrder:
          begin

            if lbSkipNulls then
              Items[liIndex].Enabled := False
            else
              Items[liIndex].Enabled := lSelection.HasProperty('NullOrder');

            lSelection.GetPropertyValue('NullOrder', lNullOrder);

            Items[liIndex].Items[0].Checked := (lNullOrder = ctnoFirst);
            Items[liIndex].Items[1].Checked := (lNullOrder = ctnoLast);
          end;

        cmVisible:
          begin
            Items[liIndex].Enabled := lSelection.ContainsTotals;

            lbVisible := True;

            lSelection.GetPropertyValue('Visible', lbVisible);

            Items[liIndex].Checked := lbVisible;
          end;

      end; {case}

end; {procedure, MenuPopupEvent}

{------------------------------------------------------------------------------}
{ TppCrossTabDesignerMenu.NullOrderClickEvent}

procedure TppCrossTabDesignerMenu.NullOrderClickEvent(Sender: TObject);
var
  lNullOrder: TppNullOrderType;
begin
  lNullOrder := TppNullOrderType(TMenuItem(Sender).Tag);

  FDesigner.Selection.SetPropertyValue('NullOrder', lNullOrder);
end; {procedure, NullOrderClickEvent}


{******************************************************************************
 *
 ** C R O S S T A B F O R M A T   B A R
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppCrossTabFormatBar.CreateControls }

procedure TppCrossTabFormatBar.CreateControls;
var
  lSeparator: TppToolbarSep97;

begin


  BeginUpdate;

  {create Calc Type combo box}
  FCalcTypeComboBox := TComboBox.Create(Self);
  FCalcTypeComboBox.Parent := Self;
  FCalcTypeComboBox.Width  := 80;
  FCalcTypeComboBox.Hint   := ppLoadStr(196); {'Calc Type'}

  FCalcTypeComboBox.Items.Add(ppLoadStr(1028)); {'Count'}
  FCalcTypeComboBox.Items.Add(ppLoadStr(1029)); {'Sum'}
  FCalcTypeComboBox.Items.Add(ppLoadStr(1030)); {'Minimum'}
  FCalcTypeComboBox.Items.Add(ppLoadStr(1031)); {'Maximum'}
  FCalcTypeComboBox.Items.Add(ppLoadStr(1032)); {'Average'}

  FCalcTypeComboBox.OnChange := CalcTypeChangeEvent;

  {create Display Format button}
  FDisplayFormatButton := TppToolbarButton.Create(Owner);
  FDisplayFormatButton.Parent  := Self;
  FDisplayFormatButton.Glyph.Handle := ppBitmapFromResource('PPDISPLAYFORMAT');

  FDisplayFormatButton.OnClick := DisplayFormatButtonClickEvent;
  FDisplayFormatButton.Hint := ppLoadStr(199); {'Display Format'}

  {create a separator}
  lSeparator := TppToolbarSep97.Create(Self);
  lSeparator.Parent := Self;

  FSortAscButton := TppToolbarButton.Create(Owner);
  FSortAscButton.Parent  := Self;
  FSortAscButton.GroupIndex := 5;
  FSortAscButton.Glyph.Handle := ppBitmapFromResource('PPSORTASC');
  FSortAscButton.OnClick := SortButtonClickEvent;
  FSortAscButton.Hint := ppLoadStr(667); {'Sort Asc'}
  FSortAscButton.Tag := Ord(soAscending);

  FSortDescButton := TppToolbarButton.Create(Owner);
  FSortDescButton.Parent  := Self;
  FSortDescButton.GroupIndex := 5;
  FSortDescButton.Glyph.Handle := ppBitmapFromResource('PPSORTDESC');
  FSortDescButton.OnClick := SortButtonClickEvent;
  FSortDescButton.Hint := ppLoadStr(668); {'Sort Desc'}
  FSortDescButton.Tag := Ord(soDescending);

  {create a separator}
  lSeparator := TppToolbarSep97.Create(Self);
  lSeparator.Parent := Self;

  inherited CreateControls;

  {assign event-handlers for controls}
  FontComboBox.OnGetPrinter    := GetPrinterEvent;

  FontComboBox.OnChange        := FontChangeEvent;
  FontSizeComboBox.OnChange    := FontChangeEvent;
  BoldButton.OnClick           := FontChangeEvent;
  ItalicButton.OnClick         := FontChangeEvent;
  UnderlineButton.OnClick      := FontChangeEvent;

  AlignLeftButton.OnClick      := AlignmentButtonClickEvent;
  CenterButton.OnClick         := AlignmentButtonClickEvent;
  AlignRightButton.OnClick     := AlignmentButtonClickEvent;

  FontColorButton.OnClick              := FontChangeEvent;
  FontColorButton.OnPaletteColorChange := FontChangeEvent;

  HighlightColorButton.OnClick              := HighlightButtonClickEvent;
  HighlightColorButton.OnPaletteColorChange := HighlightButtonClickEvent;

  EndUpdate;

end; {procedure, CreateControls}

{------------------------------------------------------------------------------}
{ TppCrossTabFormatBar.FontChangeEvent }

procedure TppCrossTabFormatBar.FontChangeEvent(Sender: TObject);
var
  lFont: TFont;

begin
  lFont := TFont.Create;
  lFont.Assign(Font);

  {assign the font to the selection}
  FCrossTabControl.Selection.SetPropertyValue('Font', lFont);

  lFont.Free;
end; {procedure, FontChangeEvent}


{------------------------------------------------------------------------------}
{ TppCrossTabFormatBar.SortButtonClickEvent }

procedure TppCrossTabFormatBar.SortButtonClickEvent(Sender: TObject);
var
  liSortType: Integer;
begin

  liSortType := TControl(Sender).Tag;

  {set crosstab SortType property}
  FCrossTabControl.Selection.SetPropertyValue('SortType', liSortType);

end; {procedure, SortButtonClickEvent}


{------------------------------------------------------------------------------}
{ TppCrossTabFormatBar.HighlightButtonClickEvent }

procedure TppCrossTabFormatBar.HighlightButtonClickEvent(Sender: TObject);
var
  lColor: TColor;
  lbIsClear: Boolean;

begin
  TppColorButton(Sender).GetDefaultColor(lColor, lbIsClear);

  {set crosstab color property}
  FCrossTabControl.Selection.SetPropertyValue('Color', lColor);

end; {procedure, HighlightButtonClickEvent}

{------------------------------------------------------------------------------}
{ TppCrossTabFormatBar.AlignmentButtonClickEvent }

procedure TppCrossTabFormatBar.AlignmentButtonClickEvent(Sender: TObject);
var
  lAlignment: TAlignment;
begin

  lAlignment := Alignment;

  {set crosstab alignment property}
  FCrossTabControl.Selection.SetPropertyValue('Alignment', lAlignment);

end; {procedure, AlignmentButtonClickEvent}


{------------------------------------------------------------------------------}
{ TppCrossTabFormatBar.CalcTypeChangeEvent }

procedure TppCrossTabFormatBar.CalcTypeChangeEvent(Sender: TObject);
var
  liIndex: Integer;
begin

  liIndex := FCalcTypeComboBox.ItemIndex;

  {set calctype for the selection}
  FCrossTabControl.Selection.SetPropertyValue('CalcType', liIndex);

  {disallow change if property value didn't change}
  FCrossTabControl.Selection.GetPropertyValue('CalcType', liIndex);

  {update combo box with the current selection}
  if (liIndex >= 0) and (liIndex < FCalcTypeComboBox.Items.Count-1) then
    FCalcTypeComboBox.ItemIndex := liIndex;

end; {procedure, CalcTypeChangeEvent}


{------------------------------------------------------------------------------}
{ TppCrossTabFormatBar.DisplayFormatButtonClickEvent}

procedure TppCrossTabFormatBar.DisplayFormatButtonClickEvent(Sender: TObject);
begin

  ShowDisplayFormatDialog;

end; {procedure, DisplayFormatButtonClickEvent}


{------------------------------------------------------------------------------}
{ TppCrossTabFormatBar.ShowDisplayFormatDialog}

procedure TppCrossTabFormatBar.ShowDisplayFormatDialog;
var
  lFormatDlg: TppCustomFormatDialog;
  lFormClass: TFormClass;
  lFormats: TStrings;
  lDisplayFormat: String;
  lDataType: TppDataType;
begin

  lFormClass := ppGetFormClass(TppCustomFormatDialog);

  lFormatDlg := TppCustomFormatDialog(lFormClass.Create(Application));
  lFormatDlg.LanguageIndex := LanguageIndex;
  FCrossTabControl.Selection.GetPropertyValue('DisplayFormat', lDisplayFormat);
  lFormatDlg.DisplayFormat := lDisplayFormat;

  {get standard display formats}
  lFormats := lFormatDlg.DisplayFormats;
  lFormats.Clear;
  FCrossTabControl.Selection.GetPropertyValue('DataType', lDataType);
  ppGetDisplayFormats(lDataType, lFormats);

  {set format property}
  if (lFormatDlg.ShowModal = mrOK) then
    begin
      lDisplayFormat := lFormatDlg.DisplayFormat;

      FCrossTabControl.Selection.SetPropertyValue('DisplayFormat', lDisplayFormat);
    end;

  lFormatDlg.Free;



end; {procedure, ShowDisplayFormatDialog}

{------------------------------------------------------------------------------}
{ TppCrossTabFormatBar.ShowColorDialog }

procedure TppCrossTabFormatBar.ShowColorDialog;
var
  lColorDialog: TColorDialog;
  lColor: TColor;
begin

  lColorDialog := TColorDialog.Create(Self);
  FCrossTabControl.Selection.GetPropertyValue('Color', lColor);
  lColorDialog.Color := lColor;

  if (lColorDialog.Execute) then
    begin
      lColor := lColorDialog.Color;

      FCrossTabControl.Selection.SetPropertyValue('Color', lColor);
    end;

  lColorDialog.Free;

end; {procedure, ShowColorDialog}


{------------------------------------------------------------------------------}
{ TppCrossTabFormatBar.ShowFontDialog }

procedure TppCrossTabFormatBar.ShowFontDialog;
var
  lFontDialog: TppPrinterFontDialog;
  lFont: TFont;
begin

  lFontDialog := TppPrinterFontDialog.Create(Self);
  FCrossTabControl.Selection.GetPropertyValue('Font', lFont);
  lFontDialog.Font := lFont;
  lFontDialog.Printer := ppPrinter;

  if lFontDialog.Execute then
    begin
      lFont := lFontDialog.Font;

      FCrossTabControl.Selection.SetPropertyValue('Font', lFont);
    end;

  lFontDialog.Free;

end; {procedure, ShowFontDialog}



{------------------------------------------------------------------------------}
{ TppCrossTabFormatBar.GetPrinterEvent}

procedure TppCrossTabFormatBar.GetPrinterEvent(Sender: TObject; var aPrinter: TppPrinter);
begin

  aPrinter := ppPrinter;

end; {procedure, GetPrinterEvent}


{------------------------------------------------------------------------------}
{ TppCrossTabFormatBar.EnableFontControls }

procedure TppCrossTabFormatBar.EnableFontControls(aValue: Boolean);
var
  lFont: TFont;
  lAlignment: TAlignment;
begin

  FontComboBox.Enabled := aValue;
  FontSizeComboBox.Enabled := aValue;

  BoldButton.Enabled := aValue;
  ItalicButton.Enabled := aValue;
  UnderlineButton.Enabled := aValue;

  AlignLeftButton.Enabled := aValue;
  CenterButton.Enabled := aValue;
  AlignRightButton.Enabled := aValue;

  FontColorButton.Enabled := aValue;
  HighlightColorButton.Enabled := aValue;

  FontColorButton.PaletteEnabled      := aValue;
  HighlightColorButton.PaletteEnabled := aValue;

  {update toolbar with current font and alignment}
  if aValue then
    begin
      FCrossTabControl.Selection.GetPropertyValue('Font', lFont);
      FCrossTabControl.Selection.GetPropertyValue('Alignment', lAlignment);
      Font := lFont;
      Alignment := lAlignment;

    end;


end; {procedure, EnableFontControls}

{------------------------------------------------------------------------------}
{ TppCrossTabFormatBar.EnableCalcTypeControls }

procedure TppCrossTabFormatBar.EnableCalcTypeControls(aValue: Boolean);
var
  liIndex: Integer;
begin

  FCalcTypeComboBox.Enabled := aValue;

  if not aValue then Exit;

  FCrossTabControl.Selection.GetPropertyValue('CalcType', liIndex);

  {update combo box with the current selection}
  if (liIndex >= 0) and (liIndex < FCalcTypeComboBox.Items.Count-1) then
    FCalcTypeComboBox.ItemIndex := liIndex;

end; {procedure, EnableCalcTypeControls}

{------------------------------------------------------------------------------}
{ TppCrossTabFormatBar.EnableDisplayFormatControls }

procedure TppCrossTabFormatBar.EnableDisplayFormatControls(aValue: Boolean);
begin

  FDisplayFormatButton.Enabled := aValue;

end; {procedure, EnableCalcTypeControls}

{------------------------------------------------------------------------------}
{ TppCrossTabFormatBar.EnableDisplayFormatControls }

procedure TppCrossTabFormatBar.EnableSortControls(aValue: Boolean);
var
  liSortType: Integer;
begin

  FSortAscButton.Enabled  := aValue;
  FSortDescButton.Enabled := aValue;

  if not aValue then Exit;

  FCrossTabControl.Selection.GetPropertyValue('SortType', liSortType);

  FSortAscButton.Down  := (FSortAscButton.Tag = liSortType);
  FSortDescButton.Down := (FSortDescButton.Tag = liSortType);


end; {procedure, EnableCalcTypeControls}


{------------------------------------------------------------------------------}
{ TppCrossTabFormatBar.SetLanguageIndex}

procedure TppCrossTabFormatBar.SetLanguageIndex(aLanguageIndex: Longint);
begin

  inherited SetLanguageIndex(aLanguageIndex);

  FDisplayFormatButton.Hint := ppLoadStr(230); {Display Format}
  FCalcTypeComboBox.Hint := ppLoadStr(196);  {Calc Type}

end; {procedure, SetLanguageIndex}


end.
 