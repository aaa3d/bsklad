{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 1999 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit rbExpFrm;

interface

{$I ppIfDef.pas}

uses

{$IFDEF Delphi4}
  ImgList,
{$ENDIF}

  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, IniFiles, Buttons, ComCtrls,
  ppUtils, ppRptExp, ppForms;

type

  { TppReportExplorerForm }
  TrbReportExplorerForm = class(TppCustomReportExplorer)
    sbrExplorer: TStatusBar;
    pnlFolders: TPanel;
    pnlFolderTitle: TPanel;
    trvFolders: TTreeView;
    pnlReports: TPanel;
    pnlReportTitle: TPanel;
    MainMenu: TMainMenu;
    mniFile: TMenuItem;
    mniFileOpen: TMenuItem;
    mniFileNew: TMenuItem;
    miN1: TMenuItem;
    mniFileClose: TMenuItem;
    mniView: TMenuItem;
    mniViewStatusBar: TMenuItem;
    N6: TMenuItem;
    mniViewList: TMenuItem;
    mniViewDetails: TMenuItem;
    mniHelp: TMenuItem;
    mniHelpAbout: TMenuItem;
    mniViewToolbar: TMenuItem;
    mniHelpTopics: TMenuItem;
    N1: TMenuItem;
    mniFileNewFolder: TMenuItem;
    mniFileNewReport: TMenuItem;
    N2: TMenuItem;
    mniFileDelete: TMenuItem;
    mniFileRename: TMenuItem;
    N4: TMenuItem;
    mniFilePrint: TMenuItem;
    mniFilePrintPreview: TMenuItem;
    ImageList1: TImageList;
    ppmReports: TPopupMenu;
    ppmReportsView: TMenuItem;
    N8: TMenuItem;
    ppmReportsNewFolder: TMenuItem;
    ppmReportsNewReport: TMenuItem;
    ppmReportsViewList: TMenuItem;
    ppmReportsViewDetails: TMenuItem;
    ppmFolders: TPopupMenu;
    ppmFoldersExplore: TMenuItem;
    MenuItem4: TMenuItem;
    ppmFoldersNewFolder: TMenuItem;
    ppmFoldersNewReport: TMenuItem;
    ppmFoldersOpen: TMenuItem;
    N9: TMenuItem;
    ppmFoldersDelete: TMenuItem;
    ppmFoldersRename: TMenuItem;
    N10: TMenuItem;
    ppmReportsDelete: TMenuItem;
    ppmReportsRename: TMenuItem;
    N5: TMenuItem;
    ImageList2: TImageList;
    tbrExplorer: TPanel;
    spbUpOneLevel: TSpeedButton;
    spbNewFolder: TSpeedButton;
    spbNewReport: TSpeedButton;
    spbOpenReport: TSpeedButton;
    spbPrint: TSpeedButton;
    spbPrintPreview: TSpeedButton;
    spbDelete: TSpeedButton;
    spbViewList: TSpeedButton;
    spbViewDetails: TSpeedButton;
    Shape1: TShape;
    Shape2: TShape;
    splViews: TSplitter;
    procedure mniFilePrintClick(Sender: TObject);
    procedure mniFilePrintPreviewClick(Sender: TObject);
    procedure mniFileOpenClick(Sender: TObject);
    procedure mniFileNewReportClick(Sender: TObject);
    procedure mniFileDeleteClick(Sender: TObject);
    procedure mniViewListClick(Sender: TObject);
    procedure mniViewDetailsClick(Sender: TObject);
    procedure mniViewToolbarClick(Sender: TObject);
    procedure mniViewStatusBarClick(Sender: TObject);
    procedure mniFileCloseClick(Sender: TObject);
    procedure mniHelpAboutClick(Sender: TObject);
    procedure mniHelpTopicsClick(Sender: TObject);
    procedure mniFileNewFolderClick(Sender: TObject);
    procedure trvFoldersEdited(Sender: TObject; Node: TTreeNode; var S: String);
    procedure trvFoldersClick(Sender: TObject);
    procedure mniFileRenameClick(Sender: TObject);
    procedure ppmFoldersExploreClick(Sender: TObject);
    procedure trvFoldersCollapsing(Sender: TObject; Node: TTreeNode; var AllowCollapse: Boolean);
    procedure spbUpOneLevelClick(Sender: TObject);
    procedure trvFoldersDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure trvFoldersDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure trvFoldersEditing(Sender: TObject; Node: TTreeNode; var AllowEdit: Boolean);
    procedure ppmReportsPopup(Sender: TObject);
    procedure ppmFoldersPopup(Sender: TObject);
    
  protected
    procedure LanguageChanged; override;

    function  GetReportExplorer: TComponent; override;
    procedure SetReportExplorer(aComponent: TComponent); override;

  private
    FListView: TppItemList;
    FReportExplorer: TppReportExplorer;
    FAllFoldersNode: TTreeNode;
    FRecycleBinNode: TTreeNode;

    procedure EmptyRecycleBinClick(Sender: TObject);
    function  FindDataInTreeView(aTreeView: TTreeView; aData: Integer): TTreeNode;
    function  FindNearestNode(aNode: TTreeNode): TTreeNode;
    procedure FoldersSelectionChange;
    procedure ListDoubleClickEvent(Sender: TObject);
    procedure ListFolderChangeEvent(Sender: TObject);
    procedure ListRenameFolderEvent(Sender: TObject; aFolderId: Integer; const aNewName: String);
    procedure ListSelectionChangeEvent(Sender: TObject);
    procedure LoadFromIniFile;
    procedure OpenItem;
    procedure SaveToIniFile;
    procedure SelectFolder(aFolderId: Integer);
    procedure SetViewStyle(Value: Boolean);
    procedure SetViewToolbar(Value: Boolean);
    procedure SetViewStatusBar(Value: Boolean);
    procedure UpdateRecycleBin;
    procedure UpdateStatusBar;
    procedure UpdateTreeView;

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    procedure Initialize; override;
    procedure Refresh; override;

  end; {class, TppReportExplorerForm}

var
  rbReportExplorerForm: TrbReportExplorerForm;

implementation

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.Create }

constructor TrbReportExplorerForm.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FReportExplorer := nil;

  if (FListView = nil) then
    begin
      FListView := TppItemList.Create(Self);
      FListView.Parent := pnlReports;
      FListView.Align := alClient;
      FListView.MultiSelect := True;
      FListView.PopupMenu := ppmReports;
      FListView.ViewStyle := vsList;

      FListView.OnDoubleClick := ListDoubleClickEvent;
      FListView.OnFolderChange := ListFolderChangeEvent;
      FListView.OnRenameFolder := ListRenameFolderEvent;
      FListView.OnSelectionChange := ListSelectionChangeEvent;
    end;

end; {procedure, Create}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.Destroy }

destructor TrbReportExplorerForm.Destroy;
begin

  SaveToIniFile;

  inherited Destroy;

end; {procedure, Destroy}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.Initialize }

procedure TrbReportExplorerForm.Initialize;
begin

  LoadFromIniFile;

  UpdateTreeView;

  SelectFolder(FListView.FolderId);

end; {procedure, Initialize}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.LanguageChanged }

procedure TrbReportExplorerForm.LanguageChanged;
begin

  ppmReportsView.Caption := ppLoadStr(155); {&View}
  ppmReportsViewList.Caption := ppLoadStr(510); {&List}
  ppmReportsViewDetails.Caption := ppLoadStr(508); {&Details}

  ppmReportsNewFolder.Caption := ppLoadStr(558); {New &Folder}
  ppmReportsNewReport.Caption := ppLoadStr(572); {New &Report}

  ppmReportsDelete.Caption := ppLoadStr(124); {&Delete}
  ppmReportsRename.Caption := ppLoadStr(542); {Re&name}

  ppmFoldersExplore.Caption := ppLoadStr(594); {&Explore}
  ppmFoldersOpen.Caption := ppLoadStr(511); {&Open}

  ppmFoldersNewFolder.Caption := ppLoadStr(558); {New &Folder}
  ppmFoldersNewReport.Caption := ppLoadStr(572); {New &Report}

  ppmFoldersDelete.Caption := ppLoadStr(124); {&Delete}
  ppmFoldersRename.Caption := ppLoadStr(542); {Rena&me}

  spbUpOneLevel.Hint := ppLoadStr(589); {Up One Level}
  spbNewFolder.Hint := ppLoadStr(545); {Create New Folder}

  spbNewReport.Hint := ppLoadStr(571); {New Report}
  spbOpenReport.Hint := ppLoadStr(574); {Open Report}

  spbPrint.Hint := ppLoadStr(575); {Print}
  spbPrintPreview.Hint := ppLoadStr(577); {Print Preview}

  spbDelete.Hint := ppLoadStr(547); {Delete}

  spbViewList.Hint := ppLoadStr(566); {List}
  spbViewDetails.Hint := ppLoadStr(549); {Details}

  pnlFolderTitle.Caption := ppLoadStr(524);  {All Folders}

  FListView.LanguageIndex := LanguageIndex;

  mniFile.Caption := ppLoadStr(131); {&File}

  mniFileOpen.Caption := ppLoadStr(511); {&Open}

  mniFileNew.Caption := ppLoadStr(133); {&New}

  mniFileNewFolder.Caption := ppLoadStr(509); {&Folder}
  mniFileNewReport.Caption := ppLoadStr(145); {&Report}

  mniFilePrint.Caption := ppLoadStr(136); {&Print}
  mniFilePrintPreview.Caption := ppLoadStr(576); {Print Pre&view}
  mniFileDelete.Caption := ppLoadStr(124); {&Delete}
  mniFileRename.Caption := ppLoadStr(512); {&Rename}
  mniFileClose.Caption := ppLoadStr(132); {&Close}

  mniView.Caption := ppLoadStr(155); {&View}

  mniViewToolbar.Caption := ppLoadStr(514); {&Toolbar}
  mniViewStatusBar.Caption := ppLoadStr(513); {&Status Bar}
  mniViewList.Caption := ppLoadStr(510); {&List}
  mniViewDetails.Caption := ppLoadStr(508); {&Details}

  mniHelp.Caption := ppLoadStr(142); {&Help}

  mniHelpTopics.Caption := ppLoadStr(144); {&Help Topics}
  mniHelpAbout.Caption := ppLoadStr(143); {&About}

end; {procedure, LanguageChanged}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.GetReportExplorer }

function  TrbReportExplorerForm.GetReportExplorer: TComponent;
begin
  Result := FReportExplorer;
end; {function, GetReportExplorer}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.SetReportExplorer }

procedure TrbReportExplorerForm.SetReportExplorer(aComponent: TComponent);
begin
  if not(aComponent is TppReportExplorer) then Exit;

  FReportExplorer := TppReportExplorer(aComponent);

  FListView.ReportExplorer := TppReportExplorer(aComponent);

end; {procedure, SetReportExplorer}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.LoadFromIniFile }

procedure TrbReportExplorerForm.LoadFromIniFile;
var
  lIniFile: TIniFile;
  lScreenRes: TPoint;
  liLeft: Integer;
  liTop: Integer;
  liWidth: Integer;
  liHeight: Integer;
  liWindowState: Integer;
begin

  lIniFile := TIniFile.Create('RBuilder.ini');

  liLeft := lIniFile.ReadInteger('Explorer Form Position', 'Left', -1);

  if (liLeft = -1) then
    begin
      lIniFile.Free;
      Exit;
    end;

  SetFormSettingsRemembered(True);

  {set initial size based on screen res}
  lScreenRes := ppGetScreenRes;

  {calc default screen size }

  {set size based on 1024 x 768 }
  liWidth  := 790;
  liHeight := 600;

  if lScreenRes.X <> 1024 then
    begin
      liWidth  := (liWidth  * lScreenRes.X)  div 1024;
      liHeight := (Height * lScreenRes.Y) div 768;
    end;

  {default to center of screen}
  liLeft := (Screen.Width  - liWidth)  div 2;
  liTop  := (Screen.Height - liHeight) div 2;

  liWindowState := lIniFile.ReadInteger('Explorer Form Position', 'WindowState', Ord(wsNormal));

  {load positions from ini file}
  if TWindowState(liWindowState) = wsNormal then
    begin
      liLeft   := lIniFile.ReadInteger('Explorer Form Position', 'Left',   liLeft);
      liTop    := lIniFile.ReadInteger('Explorer Form Position', 'Top',    liTop);
      liWidth  := lIniFile.ReadInteger('Explorer Form Position', 'Width',  liWidth);
      liHeight := lIniFile.ReadInteger('Explorer Form Position', 'Height', liHeight);
    end;

  SetBounds(liLeft, liTop, liWidth, liHeight);

  if TWindowState(liWindowState) <> wsMinimized then
    WindowState := TWindowState(liWindowState);

  SetViewStyle(lIniFile.ReadBool('Explorer Form State', 'ViewList', True));
  SetViewToolbar(lIniFile.ReadBool('Explorer Form State', 'ViewToolbar', True));
  SetViewStatusBar(lIniFile.ReadBool('Explorer Form State', 'ViewStatusBar', True));

  FListView.SortMode := lIniFile.ReadInteger('Explorer Form State', 'SortMode', 1);

  FListView.Columns[0].Width := lIniFile.ReadInteger('Explorer Form State', 'ListViewColumn1Width', 250);
  FListView.Columns[1].Width := lIniFile.ReadInteger('Explorer Form State', 'ListViewColumn2Width', 120);
  FListView.Columns[2].Width := lIniFile.ReadInteger('Explorer Form State', 'ListViewColumn3Width', 100);
  FListView.Columns[3].Width := lIniFile.ReadInteger('Explorer Form State', 'ListViewColumn4Width', 140);

  FListView.FolderId := lIniFile.ReadInteger('Explorer Form State', 'Selected Folder', 0);
  FListView.ItemName := lIniFile.ReadString('Explorer Form State', 'Selected Item', '');

  FReportExplorer.CurrentFolderId := FListView.FolderId;
  FReportExplorer.CurrentItemName := FListView.ItemName;

  lIniFile.Free;
  
end; {procedure, LoadFromIniFile}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.SaveToIniFile }

procedure TrbReportExplorerForm.SaveToIniFile;
var
  lIniFile: TIniFile;
begin

  lIniFile := TIniFile.Create('RBuilder.ini');

  lIniFile.WriteInteger('Explorer Form Position', 'WindowState', Ord(WindowState));

  lIniFile.WriteInteger('Explorer Form Position', 'Left',   Left);
  lIniFile.WriteInteger('Explorer Form Position', 'Top',    Top);
  lIniFile.WriteInteger('Explorer Form Position', 'Width',  Width);
  lIniFile.WriteInteger('Explorer Form Position', 'Height', Height);

  lIniFile.WriteBool('Explorer Form State', 'ViewList',  mniViewList.Checked);
  lIniFile.WriteBool('Explorer Form State', 'ViewToolbar', mniViewToolbar.Checked);
  lIniFile.WriteBool('Explorer Form State', 'ViewStatusBar', mniViewStatusBar.Checked);

  lIniFile.WriteInteger('Explorer Form State', 'SortMode', FListView.SortMode);

  lIniFile.WriteInteger('Explorer Form State', 'ListViewColumn1Width', FListView.Columns[0].Width);
  lIniFile.WriteInteger('Explorer Form State', 'ListViewColumn2Width', FListView.Columns[1].Width);
  lIniFile.WriteInteger('Explorer Form State', 'ListViewColumn3Width', FListView.Columns[2].Width);
  lIniFile.WriteInteger('Explorer Form State', 'ListViewColumn4Width', FListView.Columns[3].Width);

  lIniFile.WriteInteger('Explorer Form State', 'Selected Folder', FListView.FolderId);
  lIniFile.WriteString('Explorer Form State', 'Selected Item', FListView.ItemName);

  lIniFile.Free;

end; {procedure, SaveToIniFile}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.mniFilePrintClick }

procedure TrbReportExplorerForm.mniFilePrintClick(Sender: TObject);
begin
  if (FListView.ItemName <> '') then
    FReportExplorer.Print(FListView.ItemName, FListView.ItemId);
end; {procedure, mniFilePrintClick}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.mniFilePrintPreviewClick }

procedure TrbReportExplorerForm.mniFilePrintPreviewClick(Sender: TObject);
begin
  if (FListView.ItemName <> '') then
    FReportExplorer.PrintPreview(FListView.ItemName, FListView.ItemId);
end; {procedure, mniFilePrintPreviewClick}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.mniFileOpenClick }

procedure TrbReportExplorerForm.mniFileOpenClick(Sender: TObject);
begin

  if (trvFolders.Focused) then
    begin
      if (trvFolders.Selected <> nil) and not(trvFolders.Selected.Expanded) then
        trvFolders.Selected.Expanded := True;
    end
  else
    OpenItem;

end; {procedure, mniFileOpenClick}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.OpenItem }

procedure TrbReportExplorerForm.OpenItem;
begin
  if (FListView.FolderId = itRecycleBin) then Exit;

  if (FListView.ItemType <> itReport) or (FListView.ItemName = '') then Exit;

  Cursor := crHourGlass;
  FListView.Cursor := crHourGlass;

  try
    FReportExplorer.Open(FListView.ItemName, FListView.FolderId);

  finally
    Cursor := crDefault;
    FListView.Cursor := crDefault;
  end;
  
end; {procedure, OpenItem}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.Refresh }

procedure TrbReportExplorerForm.Refresh;
begin
  UpdateTreeView;

  SelectFolder(FReportExplorer.CurrentFolderId);

  FListView.ItemName := FReportExplorer.CurrentItemName;
end; {procedure, Refresh}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.mniFileNewReportClick }

procedure TrbReportExplorerForm.mniFileNewReportClick(Sender: TObject);
var
  liFolderId: Integer;
begin

  if( trvFolders.Selected <> nil) then
    liFolderId := Integer(trvFolders.Selected.Data)
  else
    liFolderId := itAllFolders;

  FReportExplorer.New(liFolderId);

end; {procedure, mniFileNewReportClick}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.mniFileDeleteClick }

procedure TrbReportExplorerForm.mniFileDeleteClick(Sender: TObject);
var
  lNode: TTreeNode;
  lNewNode: TTreeNode;
  liFolderId: Integer;
begin

  lNode := trvFolders.Selected;

  if (lNode = nil) then Exit;

  if (trvFolders.Focused) then
    begin
      liFolderId := Integer(lNode.Data);

      if (liFolderId = itRecycleBin) then Exit;
      if (liFolderId = itAllFolders) then Exit;

      if FReportExplorer.ConfirmDeleteFolder(lNode.Text) then
        begin
          if FReportExplorer.ChangeParentFolder(liFolderId, itRecycleBin) then
            begin
              lNewNode := FindNearestNode(lNode);

              SelectFolder(Integer(lNewNode.Data));

              lNode.Free;
            end;
        end;
    end

  else
    FListView.DeleteSelection;

  UpdateRecycleBin;

end; {procedure, mniFileDeleteClick}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.mniViewListClick }

procedure TrbReportExplorerForm.mniViewListClick(Sender: TObject);
begin
  SetViewStyle(True);
end; {procedure, mniViewListClick}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.mniViewDetailsClick }

procedure TrbReportExplorerForm.mniViewDetailsClick(Sender: TObject);
begin
  SetViewStyle(False);
end; {procedure, mniViewDetailsClick}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.mniViewToolbarClick }

procedure TrbReportExplorerForm.mniViewToolbarClick(Sender: TObject);
begin
  SetViewToolbar(not(mniViewToolbar.Checked));
end; {procedure, mniViewToolbarClick}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.mniViewStatusBarClick }

procedure TrbReportExplorerForm.mniViewStatusBarClick(Sender: TObject);
begin
  SetViewStatusBar(not(mniViewStatusBar.Checked));
end; {procedure, mniViewStatusBarClick}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.mniFileCloseClick }

procedure TrbReportExplorerForm.mniFileCloseClick(Sender: TObject);
begin
  Close;
end; {procedure, mniFileCloseClick}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.mniHelpAboutClick }

procedure TrbReportExplorerForm.mniHelpAboutClick(Sender: TObject);
var
  lAboutDlg : TppCustomAboutDialog;
  lFormClass: TFormClass;
begin

  lFormClass := ppGetFormClass(TppCustomAboutDialog);

  lAboutDlg := TppCustomAboutDialog(lFormClass.Create(Self));
  lAboutDlg.ShowModal;
  lAboutDlg.Free;

end; {procedure, mniHelpAboutClick}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.mniHelpTopicsClick }

procedure TrbReportExplorerForm.mniHelpTopicsClick(Sender: TObject);
var
  lsDelphiHelpFile : String;
begin

  lsDelphiHelpFile := Application.HelpFile;
  Application.HelpFile := 'RBUILDER.HLP';

  Application.HelpCommand(HELP_FINDER, 0);
  Application.HelpFile := lsDelphiHelpFile;

end; {procedure, mniHelpTopicsClick}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.SetViewStyle }

procedure TrbReportExplorerForm.SetViewStyle(Value: Boolean);
begin

  if Value then
    begin
      mniViewList.Checked := True;
      ppmReportsViewList.Checked := True;

      spbViewDetails.Down := False;
      spbViewList.Down := True;

      FListView.ViewStyle := vsList;
    end
  else
    begin
      mniViewDetails.Checked := True;
      ppmReportsViewDetails.Checked := True;

      spbViewList.Down := False;
      spbViewDetails.Down := True;

      FListView.ViewStyle := vsReport;
    end;

end; {procedure, SetViewStyle}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.SetViewToolbar }

procedure TrbReportExplorerForm.SetViewToolbar(Value: Boolean);
begin

  mniViewToolbar.Checked := Value;

  tbrExplorer.Visible := Value;

end; {procedure, SetViewToolbar}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.SetViewStatusBar }

procedure TrbReportExplorerForm.SetViewStatusBar(Value: Boolean);
begin

  mniViewStatusBar.Checked := Value;

  sbrExplorer.Visible := Value;

end; {procedure, SetViewStatusBar}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.mniFileNewFolderClick }

procedure TrbReportExplorerForm.mniFileNewFolderClick(Sender: TObject);
var
  lItem: TTreeNode;
  lsName: String;
  liFolderId: Integer;
begin
  lItem := trvFolders.Selected;

  if (lItem = nil) then Exit;

  if (Integer(lItem.Data) = itRecycleBin) then Exit;

  trvFolders.Items.BeginUpdate;

  lsName := FReportExplorer.GetNewFolderName(Integer(lItem.Data));

  {create the folder record}
  if (trvFolders.Selected <> nil) then
    FReportExplorer.AddFolder(Integer(trvFolders.Selected.Data), lsName, liFolderID)
  else
    FReportExplorer.AddFolder(itAllFolders, lsName, liFolderId);

  {create the folder node}
  lItem := trvFolders.Items.AddChild(trvFolders.Selected, lsName);

  lItem.Data := TObject(liFolderID);
  lItem.ImageIndex := 0;
  lItem.SelectedIndex := 2;

  {display the folder node}
  if (lItem.Parent <> nil) then
    lItem.Parent.Expand(False);

  trvFolders.Selected := lItem;

  trvFolders.Items.EndUpdate;

  {put the node in edit mode}
  trvFolders.Selected.EditText;

end; {procedure, mniFileNewFolderClick}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.trvFoldersEdited }

procedure TrbReportExplorerForm.trvFoldersEdited(Sender: TObject; Node: TTreeNode; var S: String);
begin

  if FReportExplorer.ConfirmRenameFolder(Node.Text, S, Integer(Node.Parent.Data)) then
    FReportExplorer.RenameFolder(Integer(Node.Data), S)
  else
    S := Node.Text;

end; {procedure, trvFoldersEdited}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.trvFoldersClick }

procedure TrbReportExplorerForm.trvFoldersClick(Sender: TObject);
begin
  if (trvFolders.Selected <> nil) then
    SelectFolder(Integer(trvFolders.Selected.Data));
end; {procedure, trvFoldersClick}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.mniFileRenameClick }

procedure TrbReportExplorerForm.mniFileRenameClick(Sender: TObject);
var
  lNode: TTreeNode;
begin

  if (trvFolders.Focused) then
    begin
      lNode := trvFolders.Selected;

      if (lNode <> nil) and (Integer(lNode.Data) > itAllFolders) then
        lNode.EditText;
    end
  else
    FListView.RenameItem;

end; {procedure, mniFileRenameClick}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.ppmFoldersExploreClick }

procedure TrbReportExplorerForm.ppmFoldersExploreClick(Sender: TObject);
begin
  if (trvFolders.Selected <> nil) then
    trvFolders.Selected.Expand(False);
end; {procedure, ppmFoldersExploreClick}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.trvFoldersCollapsing }

procedure TrbReportExplorerForm.trvFoldersCollapsing(Sender: TObject; Node: TTreeNode; var AllowCollapse: Boolean);
begin
  if (Integer(Node.Data) = itAllFolders) then
    AllowCollapse := False;
end; {procedure, trvFoldersCollapsing}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.ListDoubleClickEvent }

procedure TrbReportExplorerForm.ListDoubleClickEvent(Sender: TObject);
begin
  OpenItem;
end; {procedure, ListDoubleClickEvent}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.ListRenameFolderEvent }

procedure TrbReportExplorerForm.ListRenameFolderEvent(Sender: TObject; aFolderId: Integer; const aNewName: String);
var
  lTreeNode: TTreeNode;
begin
  lTreeNode := FindDataInTreeView(trvFolders, aFolderId);

  lTreeNode.Text := aNewName;
end; {procedure, ListRenameFolderEvent}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.FindDataInTreeView }

function TrbReportExplorerForm.FindDataInTreeView(aTreeView: TTreeView; aData: Integer): TTreeNode;
var
  liIndex: Integer;
  lTreeNode: TTreeNode;
begin

  Result := nil;

  if (aTreeView.Items.Count = 0) then Exit;
  
  liIndex := 0;
  lTreeNode := aTreeView.Items[liIndex];

  while (liIndex < aTreeView.Items.Count) and (Integer(lTreeNode.Data) <> aData) do
    begin
      Inc(liIndex);

      lTreeNode := aTreeView.Items[liIndex];
    end;

  Result := lTreeNode;

end; {procedure, FindDataInTreeView}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.ListFolderChangeEvent }

procedure TrbReportExplorerForm.ListFolderChangeEvent(Sender: TObject);
begin
  UpdateTreeView;

  SelectFolder(FListView.FolderId);
end; {procedure, ListFolderChangeEvent}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.ListSelectionChangeEvent }

procedure TrbReportExplorerForm.ListSelectionChangeEvent(Sender: TObject);
begin
  UpdateStatusBar;
end; {procedure, ListSelectionChangeEvent}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.trvFoldersEditing }

procedure TrbReportExplorerForm.trvFoldersEditing(Sender: TObject; Node: TTreeNode; var AllowEdit: Boolean);
begin
  if (Integer(Node.Data) = itAllFolders) or (Integer(Node.Data) = itRecycleBin) then
    AllowEdit := False;
end; {procedure, trvFoldersEditing}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.spbUpOneLevelClick }

procedure TrbReportExplorerForm.spbUpOneLevelClick(Sender: TObject);
var
  lItem: TTreeNode;
begin

  lItem := trvFolders.Selected;

  if (lItem.Parent <> nil) then
    SelectFolder(Integer(lItem.Parent.Data));

end; {procedure, spbUpOneLevelClick}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.trvFoldersDragOver }

procedure TrbReportExplorerForm.trvFoldersDragOver(Sender, Source: TObject; X,Y: Integer; State: TDragState; var Accept: Boolean);
var
  lItem: TTreeNode;
  lSelected: TTreeNode;
begin

  Accept := False;

  lSelected := trvFolders.Selected;

  if (lSelected = nil) then Exit;

  if (Source = trvFolders) and ((lSelected = FAllFoldersNode) or (lSelected = FRecycleBinNode)) then Exit;

  lItem := trvFolders.GetNodeAt(X, Y);

  if (Source = trvFolders) and (lItem <> nil) then
    Accept := (lItem <> lSelected) and (lItem <> lSelected.Parent)
  else
    Accept := True;

end; {procedure, trvFoldersDragOver}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.trvFoldersDragDrop }

procedure TrbReportExplorerForm.trvFoldersDragDrop(Sender, Source: TObject; X,Y: Integer);
var
  lTargetItem: TTreeNode;
  lSourceItem: TTreeNode;
  lNewNode: TTreeNode;
  liTargetFolderId: Integer;
  liSourceFolderId: Integer;
  liFolderId: Integer;
begin

  lTargetItem := trvFolders.GetNodeAt(X, Y);

  if (lTargetItem <> nil) then
    begin
      liTargetFolderId := Integer(lTargetItem.Data);

      if (Source = trvFolders) then
        begin
          lSourceItem := trvFolders.Selected;

          if (lSourceItem = nil) then Exit;

          liSourceFolderId := Integer(lSourceItem.Data);

          if FReportExplorer.ChangeParentFolder(liSourceFolderId, liTargetFolderId) then
            begin
              if (liTargetFolderId = itRecycleBin) then
                begin
                  lNewNode := FindNearestNode(lSourceItem);

                  if (lNewNode <> nil) then
                    liFolderId := Integer(lNewNode.Data)
                  else
                    liFolderId := itAllFolders;
                end
              else
                liFolderId := liSourceFolderId;

              UpdateTreeView;

              SelectFolder(liFolderId);
            end;

        end

      else if (Source = FListView) then
        begin
          FListView.MoveSelectionToFolder(liTargetFolderId);

          lSourceItem := trvFolders.Selected;

          if (lSourceItem = nil) then Exit;

          liSourceFolderId := Integer(lSourceItem.Data);

          if (liTargetFolderId = itRecycleBin) then
            UpdateRecycleBin
          else if (liSourceFolderId = itRecycleBin) then
            UpdateRecycleBin

        end;

    end;

end; {procedure, trvFoldersDragDrop}

{******************************************************************************
 *
 ** R O U T I N E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.FindNearestNode }

function TrbReportExplorerForm.FindNearestNode(aNode: TTreeNode): TTreeNode;
begin

  Result := aNode.GetNextSibling;

  if (Result <> nil) then Exit;

  Result := aNode.GetPrevSibling;

  if (Result <> nil) then Exit;

  Result := aNode.Parent;

  if (Result <> nil) then Exit;

  Result := trvFolders.Items[0];

end; {function, FindNearestNode}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.SelectFolder }

procedure TrbReportExplorerForm.SelectFolder(aFolderId: Integer);
var
  liIndex: Integer;
  lItem: TTreeNode;
  lItemFound: TTreeNode;
begin

  trvFolders.Items.BeginUpdate;

  liIndex := 0;
  lItemFound := nil;

  while (liIndex < trvFolders.Items.Count) do
    begin
      lItem := trvFolders.Items[liIndex];

      if (Integer(lItem.Data) >= itAllFolders) then
        lItem.ImageIndex := 0;

      if (lItemFound = nil) and (Integer(lItem.Data) = aFolderId) then
        lItemFound := lItem;
          
      Inc(liIndex);
    end;

  if (lItemFound <> nil) then
    begin
      trvFolders.Selected := lItemFound;

      if (Integer(lItemFound.Data) >= itAllFolders) then
        lItemFound.ImageIndex := 2;

      lItem := lItemFound.Parent;

      while (lItem <> nil) do
        begin
          if not(lItem.Expanded) then
            lItem.Expanded := True;

          lItem.ImageIndex := 2;
          
          lItem := lItem.Parent;
        end;

      FoldersSelectionChange;
    end
  else
    trvFolders.Selected := trvFolders.Items[0];

  FListView.FolderId := Integer(trvFolders.Selected.Data);

  trvFolders.Items.EndUpdate;

  UpdateStatusBar;

end; {procedure, SelectFolder}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.UpdateStatusBar }

procedure TrbReportExplorerForm.UpdateStatusBar;
var
  lsMessage: String;
begin

  if (trvFolders.Focused) then
    lsMessage := ppLoadStr(522) {<count> item(s)}
  else
    lsMessage := ppLoadStr(521); {<count> item(s) selected}

  lsMessage := ppSetMessageParameters(lsMessage);
  lsMessage := Format(lsMessage, [IntToStr(FListView.SelectionCount)]);

  sbrExplorer.Panels[0].Text := lsMessage;

  if (FListView.AllFolders) then
    sbrExplorer.Panels[1].Text := ''
  else if (FListView.SelectionSize = 0) then
    sbrExplorer.Panels[1].Text := '0 ' + ppLoadStr(531) {bytes}
  else
    sbrExplorer.Panels[1].Text := IntToStr(FListView.SelectionSize div 1000) + ppLOadStr(565); {KB}

end; {procedure, UpdateStatusBar}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.FoldersSelectionChange }

procedure TrbReportExplorerForm.FoldersSelectionChange;
var
  lsFolderName: String;
  lItem: TTreeNode;
  liFolderId: Integer;
  lsMessage: String;
begin

  lItem := trvFolders.Selected;

  if (lItem = nil) then Exit;

  liFolderId := Integer(lItem.Data);

  {enable Up One Level button}
  if (liFolderId = itRecycleBin) then
    begin
      spbUpOneLevel.Enabled := False;
      spbNewFolder.Enabled := False;
      spbNewReport.Enabled := False;
      spbOpenReport.Enabled := False;
      spbPrint.Enabled := False;
      spbPrintPreview.Enabled := False;

      mniFileOpen.Enabled := False;
      mniFileNewFolder.Enabled := False;
      mniFileNewReport.Enabled := False;
      mniFilePrint.Enabled := False;
      mniFilePrintPreview.Enabled := False;
      mniFileRename.Enabled := False;
    end
  else
    begin
      if (liFolderId = itAllFolders) then
        spbUpOneLevel.Enabled := False
      else
        spbUpOneLevel.Enabled := True;

      spbNewFolder.Enabled := True;
      spbNewReport.Enabled := True;
      spbOpenReport.Enabled := True;
      spbPrint.Enabled := True;
      spbPrintPreview.Enabled := True;

      mniFileOpen.Enabled := True;
      mniFileNewFolder.Enabled := True;
      mniFileNewReport.Enabled := True;
      mniFilePrint.Enabled := True;
      mniFilePrintPreview.Enabled := True;
      mniFileRename.Enabled := True;
    end;

  lsFolderName := '';

  {get folder chain}
  while (lItem <> nil) and (Integer(lItem.Data) > itAllFolders) do
    begin
      if (lsFolderName <> '') then
        lsFolderName := lItem.Text + '\'+ lsFolderName
      else
        lsFolderName := lItem.Text;

      lItem := lItem.Parent;
    end;

  if (lItem <> nil) and (lsFolderName = '') then
    lsFolderName := lItem.Text;

  {Contents of '<name>'}
  lsMessage := ppLoadStr(544);
  lsMessage := ppSetMessageParameters(lsMessage);
  lsMessage := Format(lsMessage, [lsFolderName]);

  pnlReportTitle.Caption := ' ' + lsMessage;

end; {procedure, FoldersSelectionChange}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.UpdateTreeView }

procedure TrbReportExplorerForm.UpdateTreeView;
var
  liIndex: Integer;
  lItems: TTreeNodes;
  lItem: TTreeNode;
  lFolders: TStringList;
  lFolderNodes: TStringList;
  lFolderInfo: TppFolderInfo;
  liParentIndex: Integer;
  lParentNode: TTreeNode;
begin

  lFolders := TStringList.Create;
  lFolderNodes := TStringList.Create;

  FReportExplorer.GetFolders(lFolders);

  lItems := trvFolders.Items;

  lItems.BeginUpdate;

  lItems.Clear;

  {All Folders}
  FAllFoldersNode := trvFolders.Items.AddObject(nil, ppLoadStr(524), TObject(itAllFolders));
  FAllFoldersNode.ImageIndex := 0;
  FAllFoldersNode.SelectedIndex := 2;
  lFolderNodes.AddObject(IntToStr(itAllFolders), FAllFoldersNode);

  {Recycle Bin}
  FRecycleBinNode := trvFolders.Items.AddObject(nil, ppLoadStr(578), TObject(itRecycleBin));
  lFolderNodes.AddObject(IntToStr(itRecycleBin), FRecycleBinNode);

  while (lFolders.Count > 0) do
    begin
      liIndex := 0;

      lFolderInfo := TppFolderInfo(lFolders.Objects[liIndex]);
      liParentIndex := lFolderNodes.IndexOf(IntToStr(lFolderInfo.ParentId));

      while (liParentIndex = -1) and (liIndex < lFolders.Count - 1) do
        begin
          Inc(liIndex);
          
          lFolderInfo := TppFolderInfo(lFolders.Objects[liIndex]);
          liParentIndex := lFolderNodes.IndexOf(IntToStr(lFolderInfo.ParentId));
        end;

      if (liParentIndex <> -1) then
        lParentNode := TTreeNode(lFolderNodes.Objects[liParentIndex])
      else
        lParentNode := FAllFoldersNode;

      lItem := lItems.AddChild(lParentNode, lFolderInfo.Name);
      lItem.Data := TObject(lFolderInfo.FolderId);
      lItem.ImageIndex := 0;
      lItem.SelectedIndex := 2;

      lFolderNodes.AddObject(IntToStr(lFolderInfo.FolderId), lItem);

      lFolderInfo.Free;

      lFolders.Delete(liIndex);
    end;

  trvFolders.AlphaSort;

  lItems.EndUpdate;

  UpdateRecycleBin;

  lFolders.Free;
  lFolderNodes.Free;

  FAllFoldersNode.Expanded := True;

end; {procedure, UpdateTreeView}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.UpdateRecycleBin }

procedure TrbReportExplorerForm.UpdateRecycleBin;
var
  lItemNames: TStringList;
begin

  trvFolders.Items.BeginUpdate;

  lItemNames := TStringList.Create;

  FReportExplorer.GetItems(itRecycleBin, itAllFolders, lItemNames);

  if (lItemNames.Count > 0) then
    begin
      FRecycleBinNode.ImageIndex := 1;
      FRecycleBinNode.SelectedIndex := 1;
    end
  else
    begin
      FRecycleBinNode.ImageIndex := 3;
      FRecycleBinNode.SelectedIndex := 3;
    end;

  lItemNames.Free;

  trvFolders.Items.EndUpdate;

end; {procedure, UpdateRecycleBin}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.ppmReportsPopup }

procedure TrbReportExplorerForm.ppmReportsPopup(Sender: TObject);
var
  lNode: TTreeNode;
  liFolderId: Integer;
begin
  lNode := trvFolders.Selected;

  if (lNode = nil) then Exit;

  liFolderId := Integer(lNode.Data);

  if (liFolderId = itRecycleBin) then
    begin
      ppmReportsNewFolder.Enabled := False;
      ppmReportsNewReport.Enabled := False;
      ppmReportsRename.Enabled := False;
    end
  else
    begin
      ppmReportsNewFolder.Enabled := True;
      ppmReportsNewReport.Enabled := True;
      ppmReportsRename.Enabled := True;
    end;

end; {procedure, ppmReportsPopup}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.EmptyRecycleBinClick }

procedure TrbReportExplorerForm.EmptyRecycleBinClick(Sender: TObject);
begin

  FListView.EmptyRecycleBin;

  UpdateTreeView;

end; {procedure, EmptyRecycleBinClick}

{------------------------------------------------------------------------------}
{ TppReportExplorerForm.ppmFoldersPopup }

procedure TrbReportExplorerForm.ppmFoldersPopup(Sender: TObject);
var
  lNode: TTreeNode;
  liFolderId: Integer;
  lMenuItem: TMenuItem;
begin
  lNode := trvFolders.Selected;

  if (lNode = nil) then Exit;

  liFolderId := Integer(lNode.Data);

  if (liFolderId <> itRecycleBin) and (ppmFolders.Items[2].Tag = 595) then
    ppmFolders.Items[2].Free

  else if (liFolderId = itRecycleBin) then
    begin

      if (ppmFolders.Items[2].Tag <> 595) then
        begin
          lMenuItem := TMenuItem.Create(Self);
          lMenuItem.Tag := 595;
          lMenuItem.Caption := ppLoadStr(595); {Empty Recycle &Bin}
          lMenuItem.OnClick := EmptyRecycleBinClick;

          ppmFolders.Items.Insert(2, lMenuItem);
        end;

      ppmFolders.Items[2].Enabled := (FRecycleBinNode.ImageIndex = 1);
    end;

  if (liFolderId = itRecycleBin) then
    begin
      {insert empty recycle bin}
      ppmFoldersExplore.Enabled := False;
      ppmFoldersOpen.Enabled := False;
      ppmFoldersNewFolder.Enabled := False;
      ppmFoldersNewReport.Enabled := False;
      ppmFoldersDelete.Enabled := False;
      ppmFoldersRename.Enabled := False;
    end
  else if (liFolderId = itAllFolders) then
    begin
      ppmFoldersExplore.Enabled := False;
      ppmFoldersOpen.Enabled := False;
      ppmFoldersNewFolder.Enabled := True;
      ppmFoldersNewReport.Enabled := True;
      ppmFoldersDelete.Enabled := False;
      ppmFoldersRename.Enabled := False;
    end
  else
    begin
      ppmFoldersExplore.Enabled := True;
      ppmFoldersOpen.Enabled := True;
      ppmFoldersNewFolder.Enabled := True;
      ppmFoldersNewReport.Enabled := True;
      ppmFoldersDelete.Enabled := True;
      ppmFoldersRename.Enabled := True;
    end;

end; {procedure, ppmFoldersPopup}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  ppRegisterForm(TppCustomReportExplorer, TrbReportExplorerForm);

finalization

  ppUnRegisterForm(TppCustomReportExplorer);

end.
