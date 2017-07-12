{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppASCtrl;

interface

{$I ppIfDef.pas}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Buttons, Menus,
  ppClass, ppDB, ppTypes, ppUtils;

type

  TppAutoSearchPanel = class;
  TppAutoSearchPanelClass = class of TppAutoSearchPanel;

  TppCreatePanelEvent = procedure(aField: TppAutoSearchField; aPanel: TppAutoSearchPanel) of object;
  TppGetPanelClassEvent = procedure(aField: TppAutoSearchField; var aPanelClass: TppAutoSearchPanelClass) of object;

  { TppAutoSearchNotebook }
  TppAutoSearchNotebook = class(TObject)
    private
      FAutoSearchFields: TList;
      FDesigning: Boolean;
      FHeight: Integer;
      FMandatoryFieldsExist: Boolean;
      FOnCreatePanel: TppCreatePanelEvent;
      FOnGetPanelClass: TppGetPanelClassEvent;
      FPageControl: TPageControl;
      FParent: TWinControl;
      FScrollBox: TScrollBox;
      FWidth: Integer;

      procedure AddSearchField(aField: TppAutoSearchField; aPanel: TppAutoSearchPanel);
      procedure CalcDimensions;
      procedure CalcPanelDimensions(aScrollBox: TScrollBox; var aWidth, aHeight: Integer);
      procedure CreatePageControl;
      procedure CategorizeAutoSearchFields;
      function  CreatePanel(aField: TppAutoSearchField): TppAutoSearchPanel;
      procedure CreateTabSheet(aDataView: TdaDataView);
      procedure CreateTabSheets;
      function  FindTabSheet(const aCaption: String): TTabSheet;
      procedure MoveTabLeftClickEvent(Sender: TObject);
      procedure MoveTabRightClickEvent(Sender: TObject);
      procedure PopupMenuPopupEvent(Sender: TObject);
      procedure ValidateTabSheet(aSetActivePage, aValid: Boolean; aPanel: TppAutoSearchPanel);

    public
      constructor Create(aParent: TWinControl);
      destructor Destroy; override;

      procedure Init;
      procedure SetFocus;
      function  Valid: Boolean;

      property AutoSearchFields: TList read FAutoSearchFields write FAutoSearchFields;
      property Designing: Boolean read FDesigning write FDesigning;
      property Height: Integer read FHeight write FHeight;
      property MandatoryFieldsExist: Boolean read FMandatoryFieldsExist;
      property OnCreatePanel: TppCreatePanelEvent read FOnCreatePanel write FOnCreatePanel;
      property OnGetPanelClass: TppGetPanelClassEvent read FOnGetPanelClass write FOnGetPanelClass;
      property Parent: TWinControl read FParent;
      property Width: Integer read FWidth write FWidth;

  end; {class, TppAutoSearchNotebook}

  { TppAutoSearchPanel }
  TppAutoSearchPanel = class(TPanel)
    private
      FField: TppAutoSearchField;

      {controls}
      FLogicalLabel: TLabel;
      FFieldAliasLabel: TLabel;
      FOperatorLabel: TLabel;
      FErrorBullet: TShape;
      FErrorLabel: TLabel;
      FMandatoryBullet: TShape;
      FShowAllValues: TCheckBox;

      function  FirstField: Boolean;
      function  LastField: Boolean;
      procedure SetField(aField: TppAutoSearchField);
      procedure ClickEvent(Sender: TObject);

    protected
      procedure DisableControls; virtual;
      procedure EnableControls; virtual;
      function  OverEditControl(aX, aY: Integer): Boolean; virtual; abstract;
      procedure ShowAllValuesClickEvent(Sender: TObject); virtual;

      property LogicalLabel: TLabel read FLogicalLabel;
      property FieldAliasLabel: TLabel read FFieldAliasLabel;
      property OperatorLabel: TLabel read FOperatorLabel;
      property ErrorBullet: TShape read FErrorBullet;
      property ErrorLabel: TLabel read FErrorLabel;
      property MandatoryBullet: TShape read FMandatoryBullet;
      property ShowAllValues: TCheckBox read FShowAllValues;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      function  CalcHeight: Integer; virtual;
      function  CalcWidth: Integer; virtual;
      procedure Init; virtual;
      procedure Configure; virtual;
      function  Valid: Boolean; virtual;
      function  ValidateValue(const aValue: String; aDataType: TppDataType; var aErrorMessage: String): Boolean;

      property Field: TppAutoSearchField read FField write SetField;

  end; {class, TppAutoSearchPanel}

  { TppSimpleSearchPanel }
  TppSimpleSearchPanel = class(TppAutoSearchPanel)
    private
      FEditControl: TEdit;

    protected
      procedure DisableControls; override;
      procedure EnableControls; override;
      procedure EditControlKeyUpEvent(Sender: TObject; var Key: Word; Shift: TShiftState);
      function  OverEditControl(aX, aY: Integer): Boolean; override;
      procedure ShowAllValuesClickEvent(Sender: TObject); override;

      property EditControl: TEdit read FEditControl;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      {overriden from TPanel}
      procedure SetFocus; override;

      function  CalcWidth: Integer; override;
      procedure Init; override;
      function  Valid: Boolean; override;
      function  ValidateEditControl(aEdit: TEdit): Boolean;

  end; {class, TppSimpleSearchPanel}

  { TppBetweenSearchPanel }
  TppBetweenSearchPanel = class(TppSimpleSearchPanel)
    private
      FAndLabel: TLabel;
      FEditControl2: TEdit;
      FMandatoryBullet2: TShape;

    protected
      procedure DisableControls; override;
      procedure EnableControls; override;
      function  OverEditControl(aX, aY: Integer): Boolean; override;

      property AndLabel: TLabel read FAndLabel;
      property EditControl2: TEdit read FEditControl2;
      property MandatoryBullet2: TShape read FMandatoryBullet2;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      function  CalcWidth: Integer; override;
      procedure Init; override;
      function  Valid: Boolean; override;

  end; {class, TppBetweenSearchPanel}

  { TppInListSearchPanel }
  TppInListSearchPanel = class(TppSimpleSearchPanel)
    private
      FListBox: TListBox;
      FAddButton: TSpeedButton;
      FRemoveButton: TSpeedButton;

      procedure AddButtonClickEvent(Sender: TObject);
      procedure RemoveButtonClickEvent(Sender: TObject);
      function  ValidateListBoxControl(aListBox: TListBox): Boolean;

    protected
      procedure DisableControls; override;
      procedure EnableControls; override;
      function  OverEditControl(aX, aY: Integer): Boolean; override;

      property ListBox: TListBox read FListBox;
      property AddButton: TSpeedButton read FAddButton;
      property RemoveButton: TSpeedButton read FRemoveButton;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      function  CalcWidth: Integer; override;
      procedure Init; override;
      function  Valid: Boolean; override;

  end; {class, TppInListSearchPanel}

implementation

{******************************************************************************
 *
 ** A U T O   S E A R C H    N O T E B O O K
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppAutoSearchNotebook.Create}

constructor TppAutoSearchNotebook.Create(aParent: TWinControl);
begin

  inherited Create;

  FAutoSearchFields := nil;
  FHeight := 0;
  FMandatoryFieldsExist := False;
  FOnCreatePanel := nil;
  FOnGetPanelClass := nil;
  FPageControl := nil;
  FParent := aParent;
  FScrollBox := nil;
  FWidth := 0;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppAutoSearchNotebook.Destroy}

destructor TppAutoSearchNotebook.Destroy;
var
  liIndex: Integer;
  lField: TppAutoSearchField;
begin

  for liIndex := 0 to FAutoSearchFields.Count - 1 do
    begin
      lField := TppAutoSearchField(FAutoSearchFields[liIndex]);

      lField.ParentControl := nil;
      lField.AutoSearchPanel := nil;
    end;

  FScrollBox.Free;
  FPageControl.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppAutoSearchNotebook.SetFocus }

procedure TppAutoSearchNotebook.SetFocus;
var
  lField: TppAutoSearchField;
  lPanel: TppAutoSearchPanel;
  lScrollBox: TScrollBox;
begin

  if (FAutoSearchFields.Count = 0) then Exit;

  if (FPageControl = nil) then
    begin
      lField := TppAutoSearchField(FAutoSearchFields[0]);

      lPanel := TppAutoSearchPanel(lField.AutoSearchPanel);

      lPanel.SetFocus;
    end
  else
    begin
      lScrollBox := TScrollBox(FPageControl.Pages[0].Controls[0]);

      lPanel := TppAutoSearchPanel(lScrollBox.Controls[0]);

      lPanel.SetFocus;
    end;

end; {procedure, SetFocus}

{------------------------------------------------------------------------------}
{ TppAutoSearchNotebook.Init }

procedure TppAutoSearchNotebook.Init;
var
  liIndex: Integer;
  lField: TppAutoSearchField;
  lPanel: TppAutoSearchPanel;
begin

  CategorizeAutoSearchFields;

  FMandatoryFieldsExist := False;

  for liIndex := 0 to FAutoSearchFields.Count - 1 do
    begin
      lField := TppAutoSearchField(FAutoSearchFields[liIndex]);

      lPanel := CreatePanel(lField);

      AddSearchField(lField, lPanel);
      
      if not(FMandatoryFieldsExist) and lField.Mandatory then
        FMandatoryFieldsExist := True;
    end;

  CalcDimensions;

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TppAutoSearchNotebook.Valid }

function TppAutoSearchNotebook.Valid: Boolean;
var
  liIndex: Integer;
  lField: TppAutoSearchField;
  lPanel: TppAutoSearchPanel;
  lbValid: Boolean;
begin

  Result := True;

  for liIndex := 0 to FAutoSearchFields.Count - 1 do
    begin
      lField := TppAutoSearchField(FAutoSearchFields[liIndex]);

      lPanel := TppAutoSearchPanel(lField.AutoSearchPanel);

      lbValid := lPanel.Valid;

      ValidateTabSheet(Result, lbValid, lPanel);

      if not(lbValid) and Result then
        Result := False;

    end;

end; {procedure, Valid}

{------------------------------------------------------------------------------}
{ TppAutoSearchNotebook.ValidateTabSheet}

procedure TppAutoSearchNotebook.ValidateTabSheet(aSetActivePage, aValid: Boolean; aPanel: TppAutoSearchPanel);
var
  lTabSheet: TTabSheet;
  lScrollBox: TScrollBox;
begin

  if (FPageControl = nil) then Exit;

  lScrollBox := TScrollBox(aPanel.Parent);

  lTabSheet := TTabSheet(lScrollBox.Parent);

{$IFDEF Delphi4}
  if (aPanel = lScrollBox.Controls[0]) then
    lTabSheet.ImageIndex := -1;

  if not(aValid) then
    lTabSheet.ImageIndex := 0;
{$ENDIF}

  if aSetActivePage and (FPageControl.ActivePage <> lTabSheet) then
    FPageControl.ActivePage := lTabSheet;

end; {procedure, ValidateTabSheet}

{------------------------------------------------------------------------------}
{ TppAutoSearchNotebook.AddSearchField}

procedure TppAutoSearchNotebook.AddSearchField(aField: TppAutoSearchField; aPanel: TppAutoSearchPanel);
var
  lPreviousPanel: TppAutoSearchPanel;
  lScrollBox: TScrollBox;
begin

  lScrollBox := TScrollBox(aField.ParentControl);

  aPanel.Parent := lScrollBox;
  aPanel.Field := aField;
  aPanel.Init;
  aPanel.Configure;

  if (lScrollBox.ControlCount > 1) then
    begin
      lPreviousPanel := TppAutoSearchPanel(lScrollBox.Controls[lScrollBox.ControlCount - 2]);

      aPanel.Left := 0;
      aPanel.Top := lPreviousPanel.Top + lPreviousPanel.Height;
    end;

  aPanel.Align := alTop;

end; {procedure, AddSearchField}

{------------------------------------------------------------------------------}
{ TppAutoSearchNotebook.CreateTabSheets }

procedure TppAutoSearchNotebook.CreateTabSheets;
var
  liIndex: Integer;
  lField: TppAutoSearchField;
  lDataViews: TStringList;
  lDataView: TdaDataView;
begin

  lDataViews := TStringList.Create;

  {derive list of data view from fields, identify first field for each dataview}
  for liIndex := 0 to FAutoSearchFields.Count - 1 do
    begin
      lField := TppAutoSearchField(FAutoSearchFields[liIndex]);

      lDataView := TdaDataView(lField.DataView);

      if (lDataView <> nil) and (lDataViews.IndexOf(lDataView.Description) = -1) then
        lDataViews.AddObject(lDataView.Description, lDataView);

    end;

  if (lDataViews.Count > 1) then
    begin
      {modify list to contain AutoSearchTabOrder}
      for liIndex := 0 to lDataViews.Count - 1 do
        begin
          lDataView := TdaDataView(lDataViews.Objects[liIndex]);

          lDataViews[liIndex] := Format('%8d', [lDataView.AutoSearchTabOrder]);
        end;

      {sort the list by AutoSearchTabOrder}
      lDataViews.Sort;

      {create page control}
      CreatePageControl;

      {create tab sheet for each dataview}
      for liIndex := 0 to lDataViews.Count - 1 do
        begin
          lDataView := TdaDataView(lDataViews.Objects[liIndex]);

          CreateTabSheet(lDataView);

          if (lDataView.AutoSearchTabOrder <> liIndex) then
            lDataView.AutoSearchTabOrder := liIndex;
        end;
    end;

  lDataViews.Free;

end; {procedure, CreateTabSheets}

{------------------------------------------------------------------------------}
{ TppAutoSearchNotebook.CreatePageControl }

procedure TppAutoSearchNotebook.CreatePageControl;
var
  lPopupMenu: TPopupMenu;
  lMenuItem: TMenuItem;
  lBitmap: TBitmap;
  lImageList: TImageList;
begin

  if (FPageControl <> nil) then Exit;

  FPageControl := TPageControl.Create(FParent);
  FPageControl.Parent := (FParent);
  FPageControl.Align := alClient;

  if (FDesigning) then
    begin
      lPopupMenu := TPopupMenu.Create(FPageControl);
      FPageControl.PopupMenu := lPopupMenu;

     lMenuItem := TMenuItem.Create(lPopupMenu);
     lMenuItem.Caption := ppLoadStr(1025); {'Move Tab &Left'}
     lMenuItem.OnClick := MoveTabLeftClickEvent;
     lPopupMenu.Items.Add(lMenuItem);

     lMenuItem := TMenuItem.Create(lPopupMenu);
     lMenuItem.Caption := ppLoadStr(1026); {'Move Tab &Right'}
     lMenuItem.OnClick := MoveTabRightClickEvent;
     lPopupMenu.Items.Add(lMenuItem);

     lPopupMenu.OnPopup := PopupMenuPopupEvent;

     lImageList := TImageList.Create(FPageControl);
     lImageList.Height := 5;
     lImageList.Width := 5;

     lBitmap := TBitmap.Create;
     lBitmap.Handle := ppBitmapFromResource('PPERRORBULLET');
     lImageList.AddMasked(lBitmap, clWhite);
     lBitmap.Free;

{$IFDEF Delphi4}
     FPageControl.Images := lImageList;
{$ENDIF}
  end;

end; {procedure, CreatePageControl}

{------------------------------------------------------------------------------}
{ TppAutoSearchNotebook.MoveTabLeftClickEvent }

procedure TppAutoSearchNotebook.MoveTabLeftClickEvent(Sender: TObject);
var
  lTabSheet: TTabSheet;
  lPrevTabSheet: TTabSheet;
begin
  lTabSheet := FPageControl.ActivePage;
  lPrevTabSheet := FPageControl.Pages[lTabSheet.PageIndex - 1];

  lTabSheet.PageIndex := lTabSheet.PageIndex - 1;

  TdaDataView(lTabSheet.Tag).AutoSearchTabOrder := lTabSheet.PageIndex;
  TdaDataView(lPrevTabSheet.Tag).AutoSearchTabOrder := lTabSheet.PageIndex + 1;
end; {procedure, MoveTabLeftClickEvent}

{------------------------------------------------------------------------------}
{ TppAutoSearchNotebook.MoveTabRightClickEvent }

procedure TppAutoSearchNotebook.MoveTabRightClickEvent(Sender: TObject);
var
  lTabSheet: TTabSheet;
  lNextTabSheet: TTabSheet;
begin
  lTabSheet := FPageControl.ActivePage;
  lNextTabSheet := FPageControl.Pages[lTabSheet.PageIndex + 1];

  lTabSheet.PageIndex := lTabSheet.PageIndex + 1;

  TdaDataView(lTabSheet.Tag).AutoSearchTabOrder := lTabSheet.PageIndex;
  TdaDataView(lNextTabSheet.Tag).AutoSearchTabOrder := lTabSheet.PageIndex - 1;
end; {procedure, MoveTabRightClickEvent}

{------------------------------------------------------------------------------}
{ TppAutoSearchNotebook.PopupMenuPopupEvent }

procedure TppAutoSearchNotebook.PopupMenuPopupEvent(Sender: TObject);
begin
  FPageControl.PopupMenu.Items[0].Enabled := (FPageControl.ActivePage.TabIndex <> 0); {TMO}
  FPageControl.PopupMenu.Items[1].Enabled := (FPageControl.ActivePage.TabIndex <> (FPageControl.PageCount - 1)); {TMO}
end; {procedure, PopupMenuPopupEvent}

{------------------------------------------------------------------------------}
{ TppAutoSearchNotebook.CreateTabSheet }

procedure TppAutoSearchNotebook.CreateTabSheet(aDataView: TdaDataView);
var
  lTabSheet: TTabSheet;
  lScrollBox: TScrollBox;
begin

  lTabSheet := TTabSheet.Create(FParent);
  lTabSheet.Parent := FPageControl;
  lTabSheet.PageControl := FPageControl;
  lTabSheet.Caption := aDataView.Description;
  lTabSheet.Tag := Integer(aDataView);

{$IFDEF Delphi4}
  lTabSheet.ImageIndex := -1;
{$ENDIF}

  lScrollBox := TScrollBox.Create(FParent);
  lScrollBox.Parent := lTabSheet;
  lScrollBox.Align := alClient;
  lScrollBox.BorderStyle := bsNone;

end; {procedure, CreateTabSheet}

{------------------------------------------------------------------------------}
{ TppAutoSearchNotebook.FindTabSheet }

function TppAutoSearchNotebook.FindTabSheet(const aCaption: String): TTabSheet;
var
  liIndex: Integer;
begin

  Result := nil;

  if (FPageControl = nil) then Exit;

  liIndex := 0;

  while (Result = nil) and (liIndex < FPageControl.PageCount) do
    begin

      if (CompareText(FPageControl.Pages[liIndex].Caption, aCaption) = 0) then
        Result := FPageControl.Pages[liIndex]
      else
        Inc(liIndex);
    end;

end; {procedure, FindTabSheet}

{------------------------------------------------------------------------------}
{ TppAutoSearchNotebook.CategorizeAutoSearchFields }

procedure TppAutoSearchNotebook.CategorizeAutoSearchFields;
var
  liIndex: Integer;
  lField: TppAutoSearchField;
  lScrollBox: TScrollBox;
  lTabSheet: TTabSheet;
  lDataView: TdaDataView;
begin

  lScrollBox := nil;

  CreateTabSheets;

  {if multiple dataviews not used, then just use a single scroll box}
  if (FPageControl = nil) then
    begin
      lScrollBox := TScrollBox.Create(FParent);
      lScrollBox.Parent := FParent;
      lScrollBox.Align := alClient;
      lScrollBox.BorderStyle := bsNone;

      FScrollBox := lScrollBox;
    end;


  {assign windowed control to each field}
  for liIndex := 0 to AutoSearchFields.Count - 1 do
    begin
      lField := TppAutoSearchField(AutoSearchFields[liIndex]);

      if (FPageControl <> nil) then
        begin
          lDataView := TdaDataView(lField.DataView);

          lTabSheet := FindTabSheet(lDataView.Description);

          if (lTabSheet <> nil) then
            lScrollBox := TScrollBox(lTabSheet.Controls[0]);
        end;

      if (lScrollBox <> nil) then
        lField.ParentControl := lScrollBox;
    end;

end; {procedure, CategorizeAutoSearchFields}

{------------------------------------------------------------------------------}
{ TppAutoSearchNotebook.CreatePanel }

function TppAutoSearchNotebook.CreatePanel(aField: TppAutoSearchField): TppAutoSearchPanel;
var
  lPanelClass: TppAutoSearchPanelClass;
begin

  case aField.SearchOperator of

    soInList, soNotInList:
      lPanelClass := TppInListSearchPanel;

    soBetween, soNotBetween:
      lPanelClass := TppBetweenSearchPanel;

    else
      lPanelClass := TppSimpleSearchPanel;

  end;

  if Assigned(FOnGetPanelClass) then FOnGetPanelClass(aField, lPanelClass);

  Result := lPanelClass.Create(FParent);

  aField.AutoSearchPanel := Result;

  if Assigned(FOnCreatePanel) then FOnCreatePanel(aField, Result);

end; {function, CreatePanel}

{------------------------------------------------------------------------------}
{ TppAutoSearchNotebook.CalcPanelDimensions}

procedure TppAutoSearchNotebook.CalcPanelDimensions(aScrollBox: TScrollBox; var aWidth, aHeight: Integer);
var
  liIndex: Integer;
  lPanel: TppAutoSearchPanel;
begin

  aWidth := 0;
  aHeight := 0;

  for liIndex := 0 to (aScrollBox.ControlCount - 1) do
    begin
      lPanel := TppAutoSearchPanel(aScrollBox.Controls[liIndex]);

      if (lPanel.CalcWidth > aWidth) then
        aWidth := lPanel.CalcWidth;
        
      aHeight := aHeight + lPanel.CalcHeight;
    end;

  if (FPageControl <> nil) then
    aHeight := aHeight + 28;

end; {procedure, CalcPanelDimensions}

{------------------------------------------------------------------------------}
{ TppAutoSearchNotebook.CalcDimensions}

procedure TppAutoSearchNotebook.CalcDimensions;
var
  liIndex: Integer;
  lTabSheet: TTabSheet;
  lScrollBox: TScrollBox;
  liWidth: Integer;
  liHeight: Integer;
  liMaxWidth: Integer;
  liMaxHeight: Integer;
begin

  if (FPageControl = nil) then
    CalcPanelDimensions(FScrollBox, liMaxWidth, liMaxHeight)

  else
    begin
      liMaxWidth := 0;
      liMaxHeight := 0;

      for liIndex := 0 to (FPageControl.PageCount - 1) do
        begin
          lTabSheet := FPageControl.Pages[liIndex];

          lScrollBox := TScrollBox(lTabSheet.Controls[0]);

          CalcPanelDimensions(lScrollBox, liWidth, liHeight);

          if (liWidth > liMaxWidth) then
            liMaxWidth := liWidth;

          if (liHeight > liMaxHeight) then
            liMaxHeight := liHeight;
        end;

      FPageControl.Width := liMaxWidth + 20;
      FPageControl.Height := liMaxHeight + 20;
    end;

  FWidth := liMaxWidth;
  FHeight := liMaxHeight;

end; {function, CalcHeight}

{******************************************************************************
 *
 ** A U T O   S E A R C H   P A N E L
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppAutoSearchPanel.Create}

constructor TppAutoSearchPanel.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FField := nil;

  FLogicalLabel := nil;
  FFieldAliasLabel := nil;
  FOperatorLabel := nil;
  FErrorBullet := nil;
  FErrorLabel := nil;
  FMandatoryBullet := nil;

  OnClick := ClickEvent;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppAutoSearchPanel.Destroy}

destructor TppAutoSearchPanel.Destroy;
begin

  FLogicalLabel.Free;
  FFieldAliasLabel.Free;
  FOperatorLabel.Free;
  FErrorBullet.Free;
  FErrorLabel.Free;
  FMandatoryBullet.Free;
  FShowAllValues.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppAutoSearchPanel.ClickEvent}

procedure TppAutoSearchPanel.ClickEvent(Sender: TObject);
var
  lPoint: TPoint;
begin

  if not(FShowAllValues.Visible) or not(FShowAllValues.Checked) then Exit;

  GetCursorPos(lPoint);

  lPoint := ScreenToClient(lPoint);

  if OverEditControl(lPoint.X, lPoint.Y) then
    FShowAllValues.Checked := False;

end; {procedure, ClickEvent}

{------------------------------------------------------------------------------}
{ TppAutoSearchPanel.FirstField}

function TppAutoSearchPanel.FirstField: Boolean;
begin

  Result := False;

  if (Parent = nil) then Exit;

  Result := (Self = Parent.Controls[0]);

end; {function, FirstField}

{------------------------------------------------------------------------------}
{ TppAutoSearchPanel.LastField}

function TppAutoSearchPanel.LastField: Boolean;
begin

  Result := False;

  if (Parent = nil) then Exit;

  Result := (Self = Parent.Controls[Parent.ControlCount - 1]);

end; {function, LastField}

{------------------------------------------------------------------------------}
{ TppAutoSearchPanel.Init}

procedure TppAutoSearchPanel.Init;
var
  lBevel: TBevel;
  lsMessage: String;

begin

  ParentFont := False;

  FShowAllValues := TCheckBox.Create(Self);
  FShowAllValues.Parent := Self;

  lsMessage := ppLoadStr(1033); {'Show all values of the <name> field.'}
  lsMessage := ppSetMessageParameters(lsMessage);
  lsMessage := Format(lsMessage, [FField.FieldAlias]);

  FShowAllValues.Caption := lsMessage;
  FShowAllValues.Left := 8;
  FShowAllValues.Top := 5;
  FShowAllValues.Width := Width;
  FShowAllValues.Visible := not(FField.Mandatory);

  if FShowAllValues.Visible then
    FShowAllValues.Checked := FField.ShowAllValues;

  FShowAllValues.OnClick := ShowAllValuesClickEvent;

  FLogicalLabel := TLabel.Create(Self);
  FLogicalLabel.Parent := Self;

  FField.FirstField := FirstField;

  if (FField.FirstField) then
    FLogicalLabel.Caption := ppLoadStr(54) {Show all data where the}
  else
    FLogicalLabel.Caption := ppLoadStr(55); {and the}

  FLogicalLabel.Left := 8;
  FLogicalLabel.Top := 29;

  FFieldAliasLabel := TLabel.Create(Self);
  FFieldAliasLabel.Parent := Self;
  FFieldAliasLabel.Font.Color := clBlue;
  FFieldAliasLabel.Caption := FField.FieldAlias;
  FFieldAliasLabel.Left := FLogicalLabel.Left + FLogicalLabel.Width + 5;
  FFieldAliasLabel.Top := 29;

  FOperatorLabel := TLabel.Create(Self);
  FOperatorLabel.Parent := Self;
  FOperatorLabel.Caption := FField.OperatorDesc;
  FOperatorLabel.Left := FFieldAliasLabel.Left + FFieldAliasLabel.Width + 5;
  FOperatorLabel.Top := 29;

  FErrorBullet := TShape.Create(Self);
  FErrorBullet.Parent := Self;
  FErrorBullet.Shape := stCircle;
  FErrorBullet.Pen.Color := clRed;
  FErrorBullet.Brush.Color := clRed;
  FErrorBullet.Visible := False;
  FErrorBullet.Width := 5;
  FErrorBullet.Height := 7;

  FErrorLabel := TLabel.Create(Self);
  FErrorLabel.Parent := Self;
  FErrorLabel.Font.Color := clRed;
  FErrorLabel.Visible := False;

  FMandatoryBullet := TShape.Create(Self);
  FMandatoryBullet.Parent := Self;
  FMandatoryBullet.Shape := stCircle;
  FMandatoryBullet.Pen.Color := clBlack;
  FMandatoryBullet.Brush.Color := clBlack;
  FMandatoryBullet.Width := 5;
  FMandatoryBullet.Height := 7;

  if (Parent <> nil) and (Parent.Parent is TTabSheet) then
    begin
      BevelOuter := bvNone;

      if not(LastField) then
        begin
          lBevel := TBevel.Create(Self);
          lBevel.Parent := Self;
          lBevel.Align := alBottom;
          lBevel.Shape := bsBottomLine;
        end;
    end;

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TppAutoSearchPanel.ShowAllValuesClickEvent}

procedure TppAutoSearchPanel.ShowAllValuesClickEvent(Sender: TObject);
begin
  Configure;
end; {procedure, ShowAllValuesClickEvent}

{------------------------------------------------------------------------------}
{ TppAutoSearchPanel.Configure}

procedure TppAutoSearchPanel.Configure;
begin

  if (FShowAllValues.Visible) and (FShowAllValues.Checked) then
    DisableControls
  else
    EnableControls;

end; {procedure, Configure}

{------------------------------------------------------------------------------}
{ TppAutoSearchPanel.DisableControls}

procedure TppAutoSearchPanel.DisableControls;
begin
  FLogicalLabel.Enabled := False;
  FFieldAliasLabel.Enabled := False;
  FOperatorLabel.Enabled := False;
end; {function, DisableControls}

{------------------------------------------------------------------------------}
{ TppAutoSearchPanel.EnableControls}

procedure TppAutoSearchPanel.EnableControls;
begin
  FLogicalLabel.Enabled := True;
  FFieldAliasLabel.Enabled := True;
  FOperatorLabel.Enabled := True;
end; {function, EnableControls}

{------------------------------------------------------------------------------}
{ TppAutoSearchPanel.CalcHeight}

function TppAutoSearchPanel.CalcHeight: Integer;
begin
  Result := Height;
end; {function, CalcHeight}

{------------------------------------------------------------------------------}
{ TppAutoSearchPanel.CalcWidth}

function TppAutoSearchPanel.CalcWidth: Integer;
begin
  Result := Width;
end; {function, CalcWidth}

{------------------------------------------------------------------------------}
{ TppAutoSearchPanel.SetField}

procedure TppAutoSearchPanel.SetField(aField: TppAutoSearchField);
begin
  FField := aField;
end; {procedure, SetField}

{------------------------------------------------------------------------------}
{ TppAutoSearchPanel.Valid}

function TppAutoSearchPanel.Valid: Boolean;
begin
  Result := True;
end; {procedure, Valid}

{------------------------------------------------------------------------------}
{ TppAutoSearchPanel.ValidateValue}

function TppAutoSearchPanel.ValidateValue(const aValue: String; aDataType: TppDataType; var aErrorMessage: String): Boolean;
var
  lsValue: String;
begin

  Result := True;

  if (Length(aValue) = 0) then Exit;
  
  case aDataType of
    dtDate:
      try
        StrToDate(aValue);
      except on EConvertError do
        begin
          Result := False;

          aErrorMessage := aValue + ' ' + ppLoadStr(56); {is not a valid date.}
        end;
      end;

    dtTime:
      try
        StrToTime(aValue);
      except on EConvertError do
        begin
          Result := False;

          aErrorMessage := aValue + ' ' + ppLoadStr(57); {is not a valid time.}
        end;
      end;

    dtDateTime:
      try
        ppStrToDateTime(aValue);
      except on EConvertError do
        begin
          Result := False;

          aErrorMessage := aValue + ' ' + ppLoadStr(58); {is not a valid datetime.}
        end;
      end;

    dtInteger, dtLongint:
      begin
        lsValue := ppRemoveCharacter(ThousandSeparator, aValue);

        try
          StrToInt(lsValue);
        except on EConvertError do
          begin
            Result := False;
            aErrorMessage := aValue + ' ' + ppLoadStr(59); {is not a valid number.}
          end;
        end;

      end;

    dtSingle, dtDouble, dtExtended, dtCurrency:
      begin
        lsValue := ppRemoveCharacter(ThousandSeparator, aValue);

        try
          StrToFloat(lsValue);
        except on EConvertError do
          begin
            Result := False;
            aErrorMessage := aValue + ' ' + ppLoadStr(59); {is not a valid number.}
          end;
        end;
      end;

    dtBoolean:
      begin
        Result := (Length(aValue) > 0) and (UpperCase(aValue[1])[1] in ['T', 'Y', '1', 'F', 'N', '0']);

        if not(Result) then
          aErrorMessage := ppLoadStr(60); {Value must be either True or False.}
      end;

  else
    Result := True;
  end;

end; {procedure, ValidateValue}

{******************************************************************************
 *
 ** S I M P L E   S E A R C H   P A N E L
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppSimpleSearchPanel.Create}

constructor TppSimpleSearchPanel.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FEditControl := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppSimpleSearchPanel.Destroy}

destructor TppSimpleSearchPanel.Destroy;
begin

  FEditControl.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppSimpleSearchPanel.SetFocus}

procedure TppSimpleSearchPanel.SetFocus;
begin

  inherited SetFocus;

  if (FEditControl.Visible) and (FEditControl.Enabled) then
    begin
      FEditControl.SetFocus;
      FEditControl.SelectAll;
    end;

end; {function, SetFocus}

{------------------------------------------------------------------------------}
{ TppSimpleSearchPanel.Init}

procedure TppSimpleSearchPanel.Init;
begin

  inherited Init;

  FEditControl := TEdit.Create(Self);
  FEditControl.Parent := Self;
  FEditControl.Text := FField.SearchExpression;
  FEditControl.Left := FOperatorLabel.Left + FOperatorLabel.Width + 5;
  FEditControl.Top := 26;
  FEditControl.Width := 273;
  FEditControl.OnKeyUp := EditControlKeyUpEvent;

  FShowAllValues.Left := FEditControl.Left;
  FShowAllValues.Top := FEditControl.Top + FEditControl.Height + 5;
  FShowAllValues.Width := FEditControl.Width;

  if (FField.SearchOperator in [soBlank, soNotBlank]) then
    begin
      FEditControl.Visible := False;

      FOperatorLabel.Caption := FOperatorLabel.Caption + '.'
    end;

  FMandatoryBullet.Visible := Field.Mandatory;
  FMandatoryBullet.Left := FEditControl.Left + FEditControl.Width + 3;
  FMandatoryBullet.Top := FEditControl.Top;

  Height := 73;
  Width :=  FEditControl.Left + FEditControl.Width + 5;

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TppSimpleSearchPanel.OverEditControl}

function TppSimpleSearchPanel.OverEditControl(aX, aY: Integer): Boolean;
begin

  if (aX >= FEditControl.Left) and (aX <= (FEditControl.Left + FEditControl.Width)) and
     (aY >= FEditControl.Top) and (aY <= (FEditControl.Top + FEditControl.Height)) then
    Result := True
  else
    Result := False;

end; {function, OverEditControl}

{------------------------------------------------------------------------------}
{ TppSimpleSearchPanel.EditControlKeyUpEvent}

procedure TppSimpleSearchPanel.EditControlKeyUpEvent(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if FShowAllValues.Visible then
    FShowAllValues.Checked := Length(FEditControl.Text) = 0;
end; {procedure, EditControlKeyUpEvent}

{------------------------------------------------------------------------------}
{ TppSimpleSearchPanel.ShowAllValuesClickEvent}

procedure TppSimpleSearchPanel.ShowAllValuesClickEvent(Sender: TObject);
begin

  inherited ShowAllValuesClickEvent(Sender);

  if (FEditControl.Enabled) and (FEditControl.Visible) then
    begin
      FEditControl.SetFocus;
      FEditControl.SelectAll;
    end;

end; {function, ShowAllValuesClickEvent}

{------------------------------------------------------------------------------}
{ TppSimpleSearchPanel.DisableControls}

procedure TppSimpleSearchPanel.DisableControls;
begin

  inherited DisableControls;

  FEditControl.Enabled := False;
  
end; {function, DisableControls}

{------------------------------------------------------------------------------}
{ TppSimpleSearchPanel.EnableControls}

procedure TppSimpleSearchPanel.EnableControls;
begin

  inherited EnableControls;

  FEditControl.Enabled := True;

end; {function, EnableControls}

{------------------------------------------------------------------------------}
{ TppSimpleSearchPanel.CalcWidth}

function TppSimpleSearchPanel.CalcWidth: Integer;
begin
  if (FField.SearchOperator in [soBlank, soNotBlank]) then
    Result := FOperatorLabel.Left + FOperatorLabel.Width + 20
  else
    Result := FEditControl.Left + FEditControl.Width + 20;
end; {function, CalcWidth}

{------------------------------------------------------------------------------}
{ TppSimpleSearchPanel.Valid}

function TppSimpleSearchPanel.Valid: Boolean;
begin

  Result := False;

  if not(FShowAllValues.Visible) or ((FShowAllValues.Visible) and not(FShowAllValues.Checked)) then
    if not(ValidateEditControl(FEditControl)) then Exit;

  Result := True;

  FField.SearchExpression := FEditControl.Text;
  FField.ShowAllValues := (FShowAllValues.Visible) and (FShowAllValues.Checked);

end; {procedure, Valid}

{------------------------------------------------------------------------------}
{ TppSimpleSearchPanel.ValidateEditControl}

function TppSimpleSearchPanel.ValidateEditControl(aEdit: TEdit): Boolean;
var
  lsErrorMessage: String;
begin

  if FField.Mandatory and (aEdit.Text = '') then
    begin
      Result := False;

      lsErrorMessage := ppLoadStr(61); {Search value must be entered.}
    end
  else
    Result := ValidateValue(aEdit.Text, FField.DataType, lsErrorMessage);


  if Result then
    begin
      FErrorLabel.Visible := False;
      FErrorBullet.Visible := False;
    end

  else
    begin
      FErrorLabel.Caption := lsErrorMessage;

      {position error labels}
      FErrorLabel.Left := aEdit.Left;
      FErrorLabel.Top := aEdit.Top + aEdit.Height + 4;

      FErrorBullet.Top := aEdit.Top;
      FErrorBullet.Left := aEdit.Left + aEdit.Width + 3;

      {show error labels}
      FErrorLabel.Visible := True;

      FErrorBullet.BringToFront;
      FErrorBullet.Visible := True;
    end;


end; {procedure, ValidateEditControl}

{******************************************************************************
 *
 ** B E T W E E N   S E A R C H   P A N E L
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppBetweenSearchPanel.Create}

constructor TppBetweenSearchPanel.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FEditControl2 := nil;
  FAndLabel := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppBetweenSearchPanel.Destroy}

destructor TppBetweenSearchPanel.Destroy;
begin

  FEditControl2.Free;
  FAndLabel.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppBetweenSearchPanel.Init}

procedure TppBetweenSearchPanel.Init;
var
  lValues: TStrings;
begin

  inherited Init;

  FEditControl.Width := 150;

  FAndLabel := TLabel.Create(Self);
  FAndLabel.Parent := Self;
  FAndLabel.Caption := ppLoadStr(62); {and}
  FAndLabel.Left := FEditControl.Left + FEditControl.Width + 10;
  FAndLabel.Top := 29;

  FEditControl2 := TEdit.Create(Self);
  FEditControl2.Parent := Self;
  FEditControl2.Left := FAndLabel.Left + FAndLabel.Width + 10;
  FEditControl2.Top := 26;
  FEditControl2.Width := 150;

  lValues := TStringList.Create;

  ppParseString(FField.SearchExpression, lValues);

  if (lValues.Count > 0) then
    FEditControl.Text := lValues[0];

  if (lValues.Count > 1) then
    FEditControl2.Text := lValues[1];

  lValues.Free;

  FErrorBullet.Left := FEditControl2.Left + FEditControl2.Width + 5;

  FMandatoryBullet2 := TShape.Create(Self);
  FMandatoryBullet2.Parent := Self;
  FMandatoryBullet2.Shape := stCircle;
  FMandatoryBullet2.Pen.Color := clBlack;
  FMandatoryBullet2.Brush.Color := clBlack;
  FMandatoryBullet2.Width := 5;
  FMandatoryBullet2.Height := 7;

  FMandatoryBullet.Visible := Field.Mandatory;
  FMandatoryBullet.Left := FEditControl.Left + FEditControl.Width + 3;
  FMandatoryBullet.Top := FEditControl.Top;

  FMandatoryBullet2.Visible := Field.Mandatory;
  FMandatoryBullet2.Left := FEditControl2.Left + FEditControl2.Width + 3;
  FMandatoryBullet2.Top := FEditControl2.Top;

  Height := 73;
  Width :=  FEditControl2.Left + FEditControl2.Width + 5;

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TppBetweenSearchPanel.OverEditControl}

function TppBetweenSearchPanel.OverEditControl(aX, aY: Integer): Boolean;
begin

  Result := inherited OverEditControl(aX, aY);

  if Result then Exit;

  if (aX >= FEditControl2.Left) and (aX <= (FEditControl2.Left + FEditControl2.Width)) and
     (aY >= FEditControl2.Top) and (aY <= (FEditControl2.Top + FEditControl2.Height)) then
    Result := True;

end; {function, OverEditControl}

{------------------------------------------------------------------------------}
{ TppBetweenSearchPanel.DisableControls}

procedure TppBetweenSearchPanel.DisableControls;
begin

  inherited DisableControls;

  FAndLabel.Enabled := False;
  FEditControl2.Enabled := False;

end; {function, DisableControls}

{------------------------------------------------------------------------------}
{ TppBetweenSearchPanel.EnableControls}

procedure TppBetweenSearchPanel.EnableControls;
begin

  inherited EnableControls;

  FAndLabel.Enabled := True;
  FEditControl2.Enabled := True;

end; {function, EnableControls}

{------------------------------------------------------------------------------}
{ TppBetweenSearchPanel.CalcWidth}

function TppBetweenSearchPanel.CalcWidth: Integer;
begin
  Result := FEditControl2.Left + FEditControl2.Width + 20;
end; {function, CalcWidth}

{------------------------------------------------------------------------------}
{ TppBetweenSearchPanel.Valid}

function TppBetweenSearchPanel.Valid: Boolean;
begin

  Result := False;

  FField.ShowAllValues := FShowAllValues.Visible and FShowAllValues.Checked;

  if FField.ShowAllValues then
    begin
      Result := True;

      Exit;
    end;

  if not(ValidateEditControl(FEditControl)) then Exit;

  if not(ValidateEditControl(FEditControl2)) then Exit;

  Result := True;

  if (Length(FEditControl.Text) > 0) and (Length(FEditControl2.Text) > 0) then
    FField.SearchExpression := FEditControl.Text + ',' + FEditControl2.Text
  else
    FField.SearchExpression := '';

end; {procedure, Valid}

{******************************************************************************
 *
 ** I N L I S T   S E A R C H   P A N E L
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppInListSearchPanel.Create}

constructor TppInListSearchPanel.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FListBox := nil;
  FAddButton := nil;
  FRemoveButton := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppInListSearchPanel.Destroy}

destructor TppInListSearchPanel.Destroy;
begin

  FListBox.Free;
  FAddButton.Free;
  FRemoveButton.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppInListSearchPanel.Init}

procedure TppInListSearchPanel.Init;
var
  lValues: TStrings;
  liIndex: Integer;
  liLeft: Integer;
begin

  inherited Init;
  
  FEditControl.Width := 200;
  FEditControl.Top := 53;
  FEditControl.Left := FLogicalLabel.Left;
  FEditControl.Text := '';

  FErrorLabel.Left := FEditControl.Left;
  FErrorLabel.Top := FEditControl.Top + FEditControl.Height + 4;

  FErrorBullet.Top := FEditControl.Top;
  FErrorBullet.Left := FEditControl.Left + FEditControl.Width + 5;

  FOperatorLabel.Caption := FOperatorLabel.Caption + ':';

  FAddButton := TSpeedButton.Create(Self);
  FAddButton.Parent := Self;
  FAddButton.Caption := ppLoadStr(63); {Add to list}
  FAddButton.Left := FEditControl.Left + FEditControl.Width + 15;
  FAddButton.Top := 53;
  FAddButton.Width := 95;
  FAddButton.Height := 25;
  FAddButton.OnClick := AddButtonClickEvent;

  FRemoveButton := TSpeedButton.Create(Self);
  FRemoveButton.Parent := Self;
  FRemoveButton.Caption := ppLoadStr(64); {Remove from list}
  FRemoveButton.Left := FEditControl.Left + FEditControl.Width + 15;
  FRemoveButton.Top := 85;
  FRemoveButton.Width := 95;
  FRemoveButton.Height := 25;
  FRemoveButton.OnClick := RemoveButtonClickEvent;

  liLeft := FAddButton.Left + FAddButton.Width + 10;

  if (liLeft < (FOperatorLabel.Left + FOperatorLabel.Width + 10)) then
    liLeft := FOperatorLabel.Left + FOperatorLabel.Width + 10;
    
  FListBox := TListBox.Create(Self);
  FListBox.Parent := Self;
  FListBox.Left := liLeft;
  FListBox.Top := 26;
  FListBox.Width := 200;
  FListBox.Height := 131;

  lValues := TStringList.Create;

  ppParseString(FField.SearchExpression, lValues);

  for liIndex := 0 to lValues.Count - 1 do
    FListBox.Items.Add(lValues[liIndex]);

  lValues.Free;

  FMandatoryBullet.Visible := Field.Mandatory;
  FMandatoryBullet.Left := FListBox.Left + FListBox.Width + 3;
  FMandatoryBullet.Top := FListBox.Top;

  Height := 183;
  Width :=  FListBox.Left + FListBox.Width + 5;

  FShowAllValues.Left := FListBox.Left;
  FShowAllValues.Top := FListBox.Top + FListBox.Height + 5;
  FShowAllValues.Width := FListBox.Width;

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TppInListSearchPanel.OverEditControl}

function TppInListSearchPanel.OverEditControl(aX, aY: Integer): Boolean;
begin

  Result := inherited OverEditControl(aX, aY);

  if Result then Exit;

  if (aX >= FListBox.Left) and (aX <= (FListBox.Left + FListBox.Width)) and
     (aY >= FListBox.Top) and (aY <= (FListBox.Top + FListBox.Height)) then
    Result := True;

end; {function, OverEditControl}

{------------------------------------------------------------------------------}
{ TppInListSearchPanel.DisableControls}

procedure TppInListSearchPanel.DisableControls;
begin

  inherited DisableControls;

  FAddButton.Enabled := False;
  FRemoveButton.Enabled := False;
  FListBox.Enabled := False;

end; {function, DisableControls}

{------------------------------------------------------------------------------}
{ TppInListSearchPanel.EnableControls}

procedure TppInListSearchPanel.EnableControls;
begin

  inherited EnableControls;

  FAddButton.Enabled := True;
  FRemoveButton.Enabled := True;
  FListBox.Enabled := True;

end; {function, EnableControls}

{------------------------------------------------------------------------------}
{ TppInListSearchPanel.CalcWidth}

function TppInListSearchPanel.CalcWidth: Integer;
begin
  Result := FListBox.Left + FListBox.Width + 20;
end; {function, CalcWidth}

{------------------------------------------------------------------------------}
{ TppInListSearchPanel.Valid}

function TppInListSearchPanel.Valid: Boolean;
var
  liIndex: Integer;
begin

  Result := False;

  if not(ValidateListBoxControl(FListBox)) then Exit;

  Result := True;

  FField.SearchExpression := '';

  for liIndex := 0 to FListBox.Items.Count - 1 do
    begin
      FField.SearchExpression := FField.SearchExpression + FListBox.Items[liIndex];

      if (liIndex < (FListBox.Items.Count - 1)) then
        FField.SearchExpression := FField.SearchExpression + ',';
    end;

  FField.ShowAllValues := FShowAllValues.Visible and FShowAllValues.Checked;

  if FField.Mandatory and (FField.SearchExpression = '') and not(FField.ShowAllValues) then
    Result := False;

end; {procedure, Valid}

{------------------------------------------------------------------------------}
{ TppInListSearchPanel.AddButtonClickEvent}

procedure TppInListSearchPanel.AddButtonClickEvent(Sender: TObject);
var
  lsItem: String;
begin

  if not(ValidateEditControl(TEdit(FEditControl))) then Exit;

  lsItem := FEditControl.Text;

  if (Length(lsItem) > 0) and (FListBox.Items.IndexOf(lsItem) = -1) then
    FListBox.ItemIndex := FListBox.Items.Add(lsItem);

  FEditControl.Text := '';

  FEditControl.SetFocus;

end; {procedure, AddButtonClickEvent}

{------------------------------------------------------------------------------}
{ TppInListSearchPanel.RemoveButtonClickEvent}

procedure TppInListSearchPanel.RemoveButtonClickEvent(Sender: TObject);
var
  liIndex: Integer;
begin

  if (FListBox.ItemIndex = -1) then Exit;

  liIndex := FListBox.ItemIndex;

  FListBox.Items.Delete(FListBox.ItemIndex);

  if (liIndex >= FListBox.Items.Count) then
    FListBox.ItemIndex := FListBox.Items.Count - 1
  else
    FListBox.ItemIndex := liIndex;

  FListBox.SetFocus;

end; {procedure, RemoveButtonClickEvent}

{------------------------------------------------------------------------------}
{ TppInListSearchPanel.ValidateListBoxControl}

function TppInListSearchPanel.ValidateListBoxControl(aListBox: TListBox): Boolean;
var
  lsErrorMessage: String;
begin

  if FField.Mandatory and (aListBox.Items.Count = 0) then
    begin
      Result := False;

      lsErrorMessage := ppLoadStr(61); {Search value must be entered.}
    end
  else
    Result := True;


  if Result then
    begin
      FErrorLabel.Visible := False;
      FErrorBullet.Visible := False;
    end

  else
    begin
      FErrorLabel.Caption := lsErrorMessage;

      {position error labels}
      FErrorLabel.Left := aListBox.Left;
      FErrorLabel.Top := aListBox.Top + aListBox.Height + 4;

      FErrorBullet.Top := aListBox.Top;
      FErrorBullet.Left := aListBox.Left + aListBox.Width + 3;

      {show error labels}
      FErrorLabel.Visible := True;

      FErrorBullet.BringToFront;
      FErrorBullet.Visible := True;
    end;


end; {procedure, ValidateListBoxControl}


end.
