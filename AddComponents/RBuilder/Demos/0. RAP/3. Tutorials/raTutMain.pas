{******************************************************************************}
{                                                                              }
{                             ReportBuilder Demos                              }
{                                                                              }
{             Copyright (c) 1996-2000 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}
unit raTutMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Grids, DBGrids, Tabs, Db, DBTables, ppComm,
  ppEndUsr, Mask, Menus, raIDE, daDatMan, ppTypes, raTutLevels, ppReport,
  ppUtils, inifiles, ppDsgner, daDBBDE;

type
  { TfrmRapTutorialsMain }
  TfrmRapTutorialsMain = class (TForm)
    btnAddRecord: TButton;
    btnDesign: TButton;
    btnLevels: TButton;
    btnPreview: TButton;
    dbeName: TDBEdit;
    dbMain: TDatabase;
    Design1: TMenuItem;
    dsRaTutors: TDataSource;
    grdMain: TDBGrid;
    memComment: TDBMemo;
    Panel2: TPanel;
    pnlLevelDescription: TPanel;
    ppDesigner1: TppDesigner;
    Preview1: TMenuItem;
    pupGrid: TPopupMenu;
    Splitter1: TSplitter;
    TabSet1: TTabSet;
    tblraTutors: TTable;
    procedure btnAddRecordClick(Sender: TObject);
    procedure btnDesignClick(Sender: TObject);
    procedure btnLevelsClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure TabSet1Change(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
  private
    FDefaultLanguage: TppLanguageType;
    FJustCreated: Boolean;
    FLevels: TfrmRapTutorLevelDirectory;
    FPath: string;
    FReport: TppReport;
    procedure ButtonClickEvent(Sender: TObject);
    procedure GetReportForRow;
    function GetTemplateName(aLevel: Integer): string;
    procedure PrintReport(aDesign: Boolean);
    procedure SetCursor(aCursor: TCursor);
    procedure SetRange(aStart, aEnd: Longint);
  end;

var
  frmRapTutorialsMain: TfrmRapTutorialsMain;

const
  csRaTutorFileName = 'raTutor';
  csINIFileName = 'raTutors.ini';
  csINIMainForm = 'MAINFORM';
  csINICurrRow = 'CURRENTROW';
  csINICurrTab = 'CURRENTTAB';
  csFieldNameLevel = 'level';
  csPath = 'PATH';

implementation

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TfrmRapTutorialsMain.btnAddRecordClick}
procedure TfrmRapTutorialsMain.btnAddRecordClick(Sender: TObject);
begin
  tblraTutors.Append;
  tblraTutors.Post;
end;{ procedure btnAddRecordClick() }

{------------------------------------------------------------------------------}
{ TfrmRapTutorialsMain.btnDesignClick}
procedure TfrmRapTutorialsMain.btnDesignClick(Sender: TObject);
begin
  PrintReport(True);
end;{ procedure btnDesignClick() }

{------------------------------------------------------------------------------}
{ TfrmRapTutorialsMain.btnLevelsClick}
procedure TfrmRapTutorialsMain.btnLevelsClick(Sender: TObject);
begin
  if (FLevels = nil) then
    begin
      FLevels := TfrmRapTutorLevelDirectory.Create(Self);
      FLevels.OnButtonClick := ButtonClickEvent;
    end;
  
  FLevels.Show;
end;{ procedure btnLevelsClick() }

{------------------------------------------------------------------------------}
{ TfrmRapTutorialsMain.btnPreviewClick}
procedure TfrmRapTutorialsMain.btnPreviewClick(Sender: TObject);
begin
  PrintReport(False);
end;{ procedure btnPreviewClick() }

{------------------------------------------------------------------------------}
{ TfrmRapTutorialsMain.ButtonClickEvent}
procedure TfrmRapTutorialsMain.ButtonClickEvent(Sender: TObject);
begin
  TabSet1.TabIndex := FLevels.ButtonIndex;
  
  grdMain.SetFocus;
end;{ procedure ButtonClickEvent() }

{------------------------------------------------------------------------------}
{ TfrmRapTutorialsMain.FormActivate}
procedure TfrmRapTutorialsMain.FormActivate(Sender: TObject);
var
  lIniFile: TIniFile;
begin
  
  if FJustCreated then
    begin
      FJustCreated := False;
  
      lIniFile := TIniFile.Create(FPath + csINIFileName);
      TabSet1.TabIndex := lIniFile.ReadInteger(csINIMainForm, csINICurrTab, 0);
      tblraTutors.MoveBy(lIniFile.ReadInteger(csINIMainForm, csINICurrRow, 0));
      pnlLevelDescription.Caption := FLevels.LevelDescription;
  
      lIniFile.Free;
    end;
  
end;{ procedure FormActivate() }

{------------------------------------------------------------------------------}
{ TfrmRapTutorialsMain.FormClose}
procedure TfrmRapTutorialsMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  lIniFile: TIniFile;
begin
  
  if tblraTutors.Active then
    begin
      lIniFile := TIniFile.Create(FPath + csINIFileName);
  
      lIniFile.WriteInteger(csINIMainForm, csINICurrRow, tblraTutors.FieldByName(csFieldNameLevel).AsInteger - ((TabSet1.TabIndex * 10) + 1));
      lIniFile.WriteInteger(csINIMainForm, csINICurrTab, TabSet1.TabIndex);
  
      lIniFile.Free;
    end;
  
  FReport.Free;
  
end;{ procedure FormClose() }

{------------------------------------------------------------------------------}
{ TfrmRapTutorialsMain.FormCreate}
procedure TfrmRapTutorialsMain.FormCreate(Sender: TObject);
begin
  FReport:= TppReport.Create(Self);
  
  FDefaultLanguage := ppGetSystemDefaultLanguage;
  
  FPath := ExtractFilePath(ParamStr(0));
  dbMain.Connected := False;
  dbMain.Params.Values[csPath] := FPath;
  dbMain.Connected := True;
  
  tblraTutors.Active := True;
  
  FLevels := nil;
  btnLevelsClick(Self);
  
  FJustCreated := True;
end;{ procedure FormCreate() }

{------------------------------------------------------------------------------}
{ TfrmRapTutorialsMain.GetReportForRow}
procedure TfrmRapTutorialsMain.GetReportForRow;
var
  liRow: Integer;
  lsFileName: string;
begin
  
  liRow := tblraTutors.FieldByName(csFieldNameLevel).AsInteger;
  lsFileName := FPath + GetTemplateName(liRow) + '.rtm';
  
  try
    if FileExists(lsFileName) then
      begin
        FReport.Template.FileName := lsFileName;
        FReport.Template.LoadFromFile;
      end
    else
      begin
        FReport.Template.New;
        FReport.Template.FileName := lsFileName;
      end;
  
    FReport.Template.Format := ftASCII;
    FReport.SaveAsTemplate := True;
    FReport.Template.SaveTo := stFile;
  except
    MessageDlg('Report could not be loaded.' + #13#10 + #13#10 +
           FReport.Template.FileName, mtError, [mbOK], 0);
  end;
  
end;{ procedure GetReportForRow() }

{------------------------------------------------------------------------------}
{ TfrmRapTutorialsMain.GetTemplateName}
function TfrmRapTutorialsMain.GetTemplateName(aLevel: Integer): string;
begin
  
  Result := csRaTutorFileName;
  
  if aLevel < 10 then
    Result := Result + '000' + IntToStr(aLevel)
  else if aLevel < 100 then
    Result := Result + '00' + IntToStr(aLevel)
  else if aLevel < 1000 then
    Result := Result + '0' + IntToStr(aLevel);
  
end;{ function GetTemplateName() }

{------------------------------------------------------------------------------}
{ TfrmRapTutorialsMain.PrintReport}
procedure TfrmRapTutorialsMain.PrintReport(aDesign: Boolean);
begin
  
  GetReportForRow;
  
  if FReport <> nil then
    begin
      SetCursor(crHourGlass);
      try
        ppDesigner1.Report := FReport;
  
        ppDesigner1.Notebook.ActivePage := TppDesignerWindow(ppDesigner1.Form).tshDesign;
  
        if not aDesign then
          ppDesigner1.Notebook.SelectNextPage(True);
  
      finally
        SetCursor(crDefault);
      end;
      ppDesigner1.ShowModal;
    end;
  
end;{ procedure PrintReport() }

{------------------------------------------------------------------------------}
{ TfrmRapTutorialsMain.SetCursor}
procedure TfrmRapTutorialsMain.SetCursor(aCursor: TCursor);
begin
  Screen.Cursor := aCursor;
end;{ procedure SetCursor() }

{------------------------------------------------------------------------------}
{ TfrmRapTutorialsMain.SetRange}
procedure TfrmRapTutorialsMain.SetRange(aStart, aEnd: Longint);
begin
  tblraTutors.Filtered := False;
  tblraTutors.Filter := '(Level >= ' + IntToStr(aStart) + ') AND (Level <= ' + IntToStr(aEnd) + ')';
  tblraTutors.Filtered := True;
end;{ procedure SetRange() }

{------------------------------------------------------------------------------}
{ TfrmRapTutorialsMain.TabSet1Change}
procedure TfrmRapTutorialsMain.TabSet1Change(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
begin
  SetRange((NewTab * 10) + 1, (NewTab * 10) + 10);
  pnlLevelDescription.Caption := FLevels.LevelDescription;
end;{ procedure TabSet1Change() }


end.