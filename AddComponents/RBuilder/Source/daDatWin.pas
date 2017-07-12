{******************************************************************************}
{                                                                              }
{                ReportBuilder Data Access Development Environment             }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit daDatWin;

interface

{$I ppIfDef.pas}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Menus,
  ppClass, ppComm, ppTypes, ppTreeVw, ppToolWn, ppUtils, ppTB97x, daDataVw;

type

  {TdaDataTreeBuilder }
  TdaDataTreeBuilder = class(TppDataTreeBuilder)
    private
      FDataView: TdaCustomDataView;

    protected

    public
      procedure BuildTree; override;

      property DataView: TdaCustomDataView read FDataView write FDataView;

  end; {class, TdaDataTreeBuilder}



  TdaDataViewToolWin = class(TForm)
    private
      FDataView: TdaCustomDataView;
      FDataExplorer: TppDataExplorer;
      FListView: TppReportListView;
      FTreeView: TppReportTreeView;
      FToolbar: TPanel;
      FOnDeleteDataView: TNotifyEvent;
      FOnEditDataView: TNotifyEvent;
      FLanguageIndex: Longint;
      FPopupMenu: TPopupMenu;
      FTreeBuilder: TdaDataTreeBuilder;

      procedure CreateControls;
      procedure CreateMenu;
      procedure CreateToolbar;
      procedure SetDataView(aDataView: TdaCustomDataView);
      procedure SetLanguageIndex(aLanguageIndex: Integer);
      procedure UpdateEditOptions;

      procedure AfterBuildTreeEvent(Sender: TObject);
      procedure MenuItemClickEvent(Sender: TObject);
      procedure ToolbarButtonClickEvent(Sender: TObject);

    protected

    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;

      procedure Delete;
      procedure Refresh;
      procedure SavePositionState;

      property DataView: TdaCustomDataView read FDataView write SetDataView;
      property LanguageIndex: Longint read FLanguageIndex write SetLanguageIndex;

      property OnDeleteDataView: TNotifyEvent read FOnDeleteDataView write FOnDeleteDataView;
      property OnEditDataView: TNotifyEvent read FOnEditDataView write FOnEditDataView;

  end; {class, TdaDataViewToolWin}

var
  daDataViewToolWin: TdaDataViewToolWin;

implementation

type
  TdaMenuOptionType = (moDelete);

const

  cDataToolResNames: array [Low(TppDataEditType)..High(TppDataEditType)] of String =
                 ('DAALL', 'DATABLES', 'DAFIELDS', 'DACALCS', 'DAGROUP', 'DASEARCH', 'DASORT', 'DATEXTONLY', 'DAPREVIEW');

  {'All', 'Tables', 'Fields', 'Calc', 'Group', 'Search', 'Sort', 'Edit SQL', 'Preview'}
  cDataToolHints: array [Low(TppDataEditType)..High(TppDataEditType)] of Integer =
                        (717, 836, 763, 735, 767, 818, 827, 829, 807);

  {'Delete'}
  cMenuOptionCaptions: array [Low(TdaMenuOptionType)..High(TdaMenuOptionType)] of Integer =
                             (750);

{$R *.DFM}


{------------------------------------------------------------------------------}
{ TdaDataTreeBuilder.BuildTree }

procedure TdaDataTreeBuilder.BuildTree;
var
  liIndex: Integer;

begin

  inherited BuildTree;

  if FDataView = nil then Exit;

  {add pipelines}
  for liIndex := 0 to FDataView.DataPipelineCount-1 do
    AddPipelineNode(FDataView.DataPipelines[liIndex]);

end; {procedure, BuildTree}


{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.Create }

constructor TdaDataViewToolWin.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FLanguageIndex := 0;

  FTreeView := nil;
  FListView := nil;

  FDataExplorer := nil;
  FToolbar      := nil;
  FPopupMenu    := nil;

  FOnEditDataView := nil;
  FOnDeleteDataView := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.Destroy }

destructor TdaDataViewToolWin.Destroy;
begin

  FTreeBuilder.Free;
  FDataExplorer.Free;

  inherited Destroy;

end;

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.CreateControls }

procedure TdaDataViewToolWin.CreateControls;
begin

  CreateToolbar;

  Height := 305;

  FDataExplorer := TppDataExplorer.Create(Self, ppeoVertical);

  FTreeView := FDataExplorer.TreeView;
  FTreeView.ShowRoot := False;

  FListView := FDataExplorer.ListView;
  FListView.MultiSelect  := False;
  FListView.AllowDrag := False;

  FTreeBuilder := TdaDataTreeBuilder.Create(FTreeView);

  FTreeView.AfterBuildTree := AfterBuildTreeEvent;

  {this needs to be last}
  CreateMenu;

  UpdateEditOptions;

end; {procedure, CreateControls}



{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.CreateToolbar }

procedure TdaDataViewToolWin.CreateToolbar;
var
  lButton: TSpeedButton;
  lEditType: TppDataEditType;
  liOffSet: Integer;
  lBevel: TBevel;

begin

  if (FToolbar <> nil) then
    FToolbar.Free;

  FToolbar := TPanel.Create(Self);
  FToolbar.Parent := Self;
  FToolbar.BevelOuter := bvNone;
  FToolbar.Height := 26;
  FToolbar.Top := 0;
  FToolbar.Align := alTop;

  liOffset := 0;

  for lEditType := Low(TppDataEditType) to High(TppDataEditType) do
    if lEditType in FDataView.EditOptions then
      begin

        if (lEditType in [ppemText, ppemPreview]) then
          begin
            lBevel := TBevel.Create(FToolbar);
            lBevel.Parent := FToolbar;
            lBevel.Shape := bsLeftLine;
            lBevel.Top := 3;
            lBevel.Left := 7 + liOffset;
            lBevel.Width := 2;
            lBevel.Height := FToolbar.Height - 6;
            liOffset := lBevel.Left + lBevel.Width + 7;
          end;

        lButton := TSpeedButton.Create(FToolbar);
        lButton.Parent := FToolbar;
        lButton.Flat := True;
        lButton.Glyph.Handle := ppBitmapFromResource(cDataToolResNames[lEditType]);
        lButton.Tag := Ord(lEditType);
        lButton.OnClick := ToolbarButtonClickEvent;

        lButton.Hint := ppLoadStr(cDataToolHints[lEditType]);

        lButton.Top  := 2;
        lButton.Left := 2 + liOffset;

     {   if lEditType = ppemPreview then
          lButton.Left := lButton.Left + 8;}

        liOffset := lButton.Left + lButton.Width;

    end;

end; {procedure, CreateToolbar}


{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.CreateMenu }

procedure TdaDataViewToolWin.CreateMenu;
var
  lEditType: TppDataEditType;
  lMenuItem: TMenuItem;
  lMenuOption: TdaMenuOptionType;

begin

  if (FPopupMenu <> nil) then
    FPopupMenu.Free;

  FPopupMenu := TPopupMenu.Create(Self);

  PopupMenu := FPopupMenu;
  FListView.PopupMenu := FPopupMenu;
  FTreeView.PopupMenu := FPopupMenu;


  for lEditType := Low(TppDataEditType) to High(TppDataEditType) do
    if lEditType in FDataView.EditOptions then
      begin

         {add a line}
         if (lEditType in [ppemText, ppemPreview]) then
          begin
             lMenuItem := TMenuItem.Create(FPopupMenu);
            lMenuItem.Caption := '-';
            FPopupMenu.Items.Add(lMenuItem);
          end;


        lMenuItem := TMenuItem.Create(FPopupMenu);
        lMenuItem.Tag     := Ord(lEditType);
        lMenuItem.OnClick := ToolbarButtonClickEvent;

        lMenuItem.Caption := ppLoadStr(cDataToolHints[lEditType]);

        FPopupMenu.Items.Add(lMenuItem);

    end;

  {add a line}
  lMenuItem := TMenuItem.Create(FPopupMenu);
  lMenuItem.Caption := '-';
  FPopupMenu.Items.Add(lMenuItem);


  {add delete + any other options option}
  for lMenuOption := Low(TdaMenuOptionType) to High(TdaMenuOptionType) do
    begin
      lMenuItem := TMenuItem.Create(FPopupMenu);
      lMenuItem.Tag := Ord(lMenuOption);
      lMenuItem.OnClick := MenuItemClickEvent;

      lMenuItem.Caption := ppLoadStr(cMenuOptionCaptions[lMenuOption]);

      FPopupMenu.Items.Add(lMenuItem);

    end;


end; {procedure, CreateMenu}


{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.ToolbarButtonClickEvent }

procedure TdaDataViewToolWin.ToolbarButtonClickEvent(Sender: TObject);
begin

  if (FDataView = nil) then Exit;

  FDataView.EditMode := TppDataEditType(TComponent(Sender).Tag);

  if Assigned(FOnEditDataView) then FOnEditDataView(Self);

  UpdateEditOptions;

end;  {procedure, ToolbarButtonClickEvent}


{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.UpdateEditOptions }

procedure TdaDataViewToolWin.UpdateEditOptions;
var
  liIndex: Integer;
  lbEnabled: Boolean;
  lToolbarButton: TppToolbarButton;
  lEditType: TppDataEditType;
  
begin

  for liIndex := 0 to FToolbar.ControlCount-1 do
   if (FToolbar.Controls[liIndex].Tag > 0) then
    begin
      lToolbarButton := TppToolbarButton(FToolbar.Controls[liIndex]);
      lEditType := TppDataEditType(lToolbarButton.Tag);

      lbEnabled := lEditType in FDataView.EnabledOptions;

      lToolbarButton.Enabled := lbEnabled;
      FPopupMenu.Items[liIndex].Enabled := lbEnabled;
    end;


end;  {procedure, UpdateEditOptions}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.MenuItemClickEvent }

procedure TdaDataViewToolWin.MenuItemClickEvent(Sender: TObject);
var
 lMenuOption: TdaMenuOptionType;
 
begin

  if (FDataView = nil) then Exit;

  lMenuOption := TdaMenuOptionType(TComponent(Sender).Tag);

  case lMenuOption of
 
    moDelete: Delete;

  end;

end;  {procedure, MenuItemClickEvent}


{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.SetDataView }

procedure TdaDataViewToolWin.SetDataView(aDataView: TdaCustomDataView);
begin
  FDataView := aDataView;

  Caption := FDataView.Description;

  CreateControls;

  FTreeBuilder.DataView := FDataView;

  FTreeView.BuildTree;
  FTreeView.FullExpand;

  {if FDataview.DataPipelineCount > 2 then
    FTreeView.Height := (FDataview.DataPipelineCount * 50);
}  

 { CreateMenu;}

  {if FDataView.DataPipelineCount = 0 then Exit;}

 { if (FTreeView.SelectedComponent <> FDataView.DataPipelines[0]) then
    FTreeView.SelectComponent(FDataView.DataPipelines[0])
  else
    Refresh;
  }

end; {procedure, SetDataView}



{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.Delete }

procedure TdaDataViewToolWin.Delete;
var
  lsMessage: String;
begin

  {'Are you sure want to delete the dataview <name>?'}
  lsMessage := ppLoadStr(724);
  lsMessage := ppSetMessageParameters(lsMessage);
  lsMessage := Format(lsMessage, [Caption]);

  if MessageDlg(lsMessage, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if Assigned(FOnDeleteDataView) then FOnDeleteDataView(Self);
    end;


end; {procedure, Delete}



{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.Refresh }

procedure TdaDataViewToolWin.Refresh;
begin
  Caption := FDataView.Description;
  FTreeView.BuildTree;
 { FListView.BuildList;}

end; {procedure, Refresh}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.AfterBuildTreeEvent }

procedure TdaDataViewToolWin.AfterBuildTreeEvent(Sender: TObject);
begin

  if FDataView.DataPipelineCount > 0 then
    FListView.CurrentObject := FDataView.DataPipelines[0];

end; {procedure, CustomBuildTreeEvent}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.SetLanguageIndex }

procedure TdaDataViewToolWin.SetLanguageIndex(aLanguageIndex: Integer);
var
  liIndex: Integer;
  lButton: TControl;
  lEditType: TppDataEditType;

begin

  FLanguageIndex := aLanguageIndex;

  if (FDataView <> nil) then
    FDataView.LanguageIndex := aLanguageIndex;

{  FTreeView.LanguageIndex := aLanguageIndex;}

  for liIndex := 0 to FToolbar.ControlCount-1 do
    if (FToolbar.Controls[liIndex].Tag > 0) then
    begin
      lButton := FToolbar.Controls[liIndex];
      lEditType := TppDataEditType(lButton.Tag);
      lButton.Hint := ppLoadStr(cDataToolHints[lEditType]);
    end;

end; {procedure, SetLanguageIndex}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.SavePositionState }

procedure TdaDataViewToolWin.SavePositionState;
begin

  FDataView.Left    := Left;
  FDataView.Top    := Top;
  FDataView.Width  := Width;
  FDataView.Height := Height;

end; {procedure, SavePositionState}

end.
