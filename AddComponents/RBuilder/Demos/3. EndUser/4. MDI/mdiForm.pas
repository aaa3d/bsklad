unit mdiform;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppCtrls, ppBands, ppClass, ppEndUsr, Menus, ppTypes, Buttons, ExtCtrls,
  StdCtrls, ppForms, ppReport, ppViewr, mdiChild, ppVar;


type

  TfrmMDIParent = class(TForm)
    Panel1: TPanel;
    spbDesign: TSpeedButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    spbPreview: TSpeedButton;
    Memo1: TMemo;
    DesignerMergeMenu: TMainMenu;
    Test1: TMenuItem;
    mniHowTo: TMenuItem;
    mniMergeAMenu: TMenuItem;
    mniWhen: TMenuItem;
    mniMDIChild: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    mniMacros: TMenuItem;
    mniMacrosCreateStandardHeader: TMenuItem;
    mniMacrosCreateStandardFooter: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure spbDesignClick(Sender: TObject);
    procedure spbPreviewClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mniMacrosCreateStandardHeaderClick(Sender: TObject);
    procedure mniMacrosCreateStandardFooterClick(Sender: TObject);
    procedure mniHowToClick(Sender: TObject);

  protected

  private

    FMDIDesign: TfrmInvisible;
    FPreview: TppCustomPreviewer;
    FReport: TppReport;

    procedure ActivatePreviewerEvent(Sender: TObject);

    procedure MergeDesignerMenu;

    procedure LoadReportStreamEvent(Sender: TObject; Stream: TStream);
    procedure SaveReportStreamEvent(Sender: TObject; Stream: TStream);

  public

  end;  {class TfrmMDIParent}


{note: for WIN32, use compiler directive to declare strings as 'ShortStrings'
       this is required for record structures}

{$IFDEF WIN32}
{$H-}
{$ENDIF}


  {record structure used to store information inside report template }
  TppTemplateInfo = record
      HeaderID: Integer;
      Comments: String;
      DateTime: TDateTime;

  end; {record, TppTemplateRec}


{$IFDEF WIN32}
{$H+}
{$ENDIF}

const
  cHeaderID = 12345;

var
  frmMDIParent: TfrmMDIParent;

implementation

{$R *.DFM}


{------------------------------------------------------------------------------}
{ FormCreate }

procedure TfrmMDIParent.FormCreate(Sender: TObject);
begin

  FPreview := nil;

  {create the invisible mdi child form }
  FMDIDesign         := TfrmInvisible.Create(Self);
  FMDIDesign.Visible := False;
  MergeDesignerMenu;

  FReport := FMDIDesign.Report;


  {setup Template events }
  with FReport.Template do
    begin
      Format      := ftASCII;
      Offset      := SizeOf(TppTemplateInfo);
      OnLoadStart := LoadReportStreamEvent;
      OnSaveEnd   := SaveReportStreamEvent;
    end;

end;


{------------------------------------------------------------------------------}
{ FormDestroy }

procedure TfrmMDIParent.FormDestroy(Sender: TObject);
begin
  FPreview.Free;
  FMDIDesign.Free;

  FMDIDesign := nil;
  FPreview  := nil;

end;

{------------------------------------------------------------------------------}
{ LoadReportStreamEvent }

procedure TfrmMDIParent.LoadReportStreamEvent(Sender: TObject; Stream: TStream);
var
  lTemplateInfo: TppTemplateInfo;
  lsMessage: String;

begin

  {read string stored in template header }
  Stream.Seek(0,soFromBeginning);
  Stream.Read(lTemplateInfo, SizeOf(TppTemplateInfo) );

  {note: if not one of the templates with our header info, then set Offset to 0 }
  if lTemplateInfo.HeaderID = cHeaderID then
    begin
      lsMessage := 'Reading data from template file: ' + #13#10 + #13#10 +
                    lTemplateInfo.Comments + ' (' + DateTimeToStr(lTemplateInfo.DateTime) + ')';

      MessageDlg(lsMessage, mtInformation, [mbOK],0);
      FReport.Template.Offset := SizeOf(TppTemplateInfo);
    end
  else
    FReport.Template.Offset := 0;

end;


{------------------------------------------------------------------------------}
{ SaveReportStreamEvent }

procedure TfrmMDIParent.SaveReportStreamEvent(Sender: TObject; Stream: TStream);
var
  lTemplateInfo: TppTemplateInfo;
  lsMessage: String;

begin

   with lTemplateInfo do
    begin
      HeaderID := cHeaderID;
      Comments := 'This comment is being stored inside the report template, ' + #13#10 +
                  'along with the date and time written. ';
      DateTime := Now;
    end;


  {write info to template header}
  Stream.Seek(0,soFromBeginning);
  Stream.Write(lTemplateInfo, SizeOf(TppTemplateInfo));

  lsMessage := 'Writing data to template file: ' + #13#10 + #13#10 +
                lTemplateInfo.Comments + ' (' + DateTimeToStr(lTemplateInfo.DateTime) + ')';
  MessageDlg(lsMessage, mtInformation, [mbOK],0);


end;


{------------------------------------------------------------------------------}
{ spbDesignClick }

procedure TfrmMDIParent.spbDesignClick(Sender: TObject);
begin

  if Memo1.Visible then Memo1.Visible := False;


  {show designer child window}
  if (FMDIDesign.Designer.FormStyle <> fsMDIChild) then
    FMDIDesign.Designer.FormStyle := fsMDIChild;


  {if (WindowState <> wsMaximized) then
    WindowState := wsMaximized;   }

  FMDIDesign.Designer.BringToFront;

end;

{------------------------------------------------------------------------------}
{ spbPreviewClick }

procedure TfrmMDIParent.spbPreviewClick(Sender: TObject);
var
  lFormClass: TFormClass;

begin
  if Memo1.Visible then Memo1.Visible := False;

  if (FPreview = nil) then
    begin

      lFormClass := ppGetFormClass(TppCustomPreviewer);
      FPreview :=  TppCustomPreviewer(lFormClass.Create(Self));

      FPreview.LanguageIndex := FReport.LanguageIndex;
      FPreview.OnActivate    := ActivatePreviewerEvent;

      {note: the built-in preview dialog has an OnClose event handler that
             sets CloseAction to caFree, however for an mdi child window this
             is incorrect }
      FPreview.OnClose    := nil;
      FPreview.Report     := FReport;
      FPreview.Init;
      FPreview.FormStyle  := fsMDIChild;

    end;

   {show preview child window}
  if (FPreview.WindowState <> wsMaximized) then
    FPreview.WindowState := wsMaximized; 

  FPreview.BringToFront;

end;


{------------------------------------------------------------------------------}
{ ActivatePreviewerEvent }

procedure TfrmMDIParent.ActivatePreviewerEvent(Sender: TObject);
begin

  if (FPreview = nil) and (FReport = nil) then Exit;

  {reset the viewer to request page 1 of the report}
  if not FReport.IsCached then
    TppViewer(FPreview.Viewer).Reset;

  {print the report}
  FReport.PrintToDevices;

end;


{------------------------------------------------------------------------------}
{ FormCloseQuery }

procedure TfrmMDIParent.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

  {check whether report currently printing }
  if FReport.Printing then

    begin
    
      {display message to user }
      MessageDlg('Unable to close form - ReportBuilder is currently printing.' ,mtInformation, [mbOK] ,0);

      {do not allow form to close }
      CanClose := False;

    end; {if, currently printing}

end;


{------------------------------------------------------------------------------}
{ TfrmMDIParent.MergeDesignerMenu }

procedure TfrmMDIParent.MergeDesignerMenu;

  {finds position in given MainMenu where a GroupIndex should be inserted }
  function FindGroupIndex(aGroupIndex: Integer; aMainMenu: TMainMenu): Integer;
  var
    liMenu: Integer;
    lbFound: Boolean;

  begin

    lbFound := False;
    liMenu  := 0;

    while not lbFound and (liMenu < aMainMenu.Items.Count) do
      begin
        if aMainMenu.Items[liMenu].GroupIndex >= aGroupIndex then
          lbFound := True
        else
          Inc(liMenu);

      end;

    Result := liMenu;

  end;

var
  liMergeMenu: Integer;
  lMainMenu: TMainMenu;
  lMenuItem: TMenuItem;
  liMenuIndex: Integer;

begin

  if FMDIDesign = nil then Exit;

  {merge DesignerMergeMenu with TppDesigner's menu}

  {this is used as a reference to ppDesigner1.Menu }
  lMainMenu  := FMDIDesign.Designer.Menu;

  {for each submenu }
  for liMergeMenu := DesignerMergeMenu.Items.Count-1 downto 0 do
    begin

      {get the sub-menu }
      lMenuItem := DesignerMergeMenu.Items[liMergeMenu];

      {delete the sub-menu from DesignerMergeMenu }
      DesignerMergeMenu.Items.Delete(liMergeMenu);

      {determine where to insert the sub-menu based on the GroupIndex value }
      liMenuIndex := FindGroupIndex(lMenuItem.GroupIndex, lMainMenu);

      {delete existing sub-menu, if same group item }
      if lMenuItem.GroupIndex = lMainMenu.Items[liMenuIndex].GroupIndex then
        lMainMenu.Items.Delete(liMenuIndex);

      {insert the sub-menu }
      lMainMenu.Items.Insert(liMenuIndex, lMenuItem);

    end;

end;

{******************************************************************************
 *
 ** "M A C R O"   R O U T I N E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TfrmMDIParent.CreateStandardHeader }

procedure TfrmMDIParent.mniMacrosCreateStandardHeaderClick(Sender: TObject);
var
  lLabel: TppLabel;
  lBand: TppBand;
  liComponent: Integer;
  liComponents: Integer;
begin
  lBand := FReport.GetBand(btHeader, 0);

  liComponents := lBand.ObjectCount;

  for liComponent := liComponents - 1 downto 0 do
   lBand.Objects[liComponent].Free;

  lLabel := TppLabel.Create(FMDIDesign);
  lLabel.Band := lBand;
  lLabel.Top  := 0.2;
  lLabel.Left := 0.2;
  lLabel.Caption := 'Standard Header.';
end;

{------------------------------------------------------------------------------}
{ TfrmMDIParent.CreateStandardFooter }

procedure TfrmMDIParent.mniMacrosCreateStandardFooterClick(Sender: TObject);
var
  lSysVar: TppSystemVariable;
  lLine: TppLine;
  lBand: TppBand;
  liComponent: Integer;
  liComponents: Integer;
begin
  lBand := FReport.GetBand(btFooter, 0);

  {clear all current components in footer}
  liComponents := lBand.ObjectCount;
  for liComponent := liComponents - 1 downto 0 do
   lBand.Objects[liComponent].Free;

  {create new components}
  lSysVar := TppSystemVariable.Create(FMDIDesign);
  lSysVar.Band := lBand;
  lSysVar.Top  := 0.30;
  lSysVar.Left := 0.10;
  lSysVar.Font.Name := 'Arial';
  lSysVar.Font.Size := 8;
  lSysVar.Font.Style := [fsBold, fsItalic];
  lSysVar.Font.Color := clNavy;
  lSysVar.VarType := vtPrintDateTime;
  lSysVar.Transparent := True;

  lSysVar := TppSystemVariable.Create(FMDIDesign);
  lSysVar.Band := lBand;
  lSysVar.Top  := 0.30;
  lSysVar.Left := 7.35;
  lSysVar.Font.Name := 'Arial';
  lSysVar.Font.Size := 8;
  lSysVar.Font.Style := [fsBold, fsItalic];
  lSysVar.Font.Color := clNavy;
  lSysVar.VarType := vtPageSetDesc;
  lSysVar.Transparent := True;


  lLine := TppLine.Create(FMDIDesign);
  lLine.Band := lBand;
  lLine.Position := lpBottom;
  lLine.Pen.Width := 2;
  lLine.Pen.Color := clNavy;
  lLine.Left := 0;
  lLine.Top := 0.3125;
  lLine.Width := 8;
  lLine.SendToBack;
end;



procedure TfrmMDIParent.mniHowToClick(Sender: TObject);
begin
  showMessage('Test Shortcut');
end;

end.
