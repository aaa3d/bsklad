{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppRichEd;

interface

{$I ppIfDef.pas}

uses

{$IFDEF Delphi4}
  ImgList,
{$ENDIF}

  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, ComCtrls, ClipBrd,
  ToolWin, ppForms, ppTypes, ppUtils, ppDrwCmd;

type

  { TppRTFEditor }
  TppRTFEditor = class(TppCustomRTFEditor)
    MainMenu: TMainMenu;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    FilePrintItem: TMenuItem;
    FileExitItem: TMenuItem;
    EditUndoItem: TMenuItem;
    EditCutItem: TMenuItem;
    EditCopyItem: TMenuItem;
    EditPasteItem: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    PrintDialog: TPrintDialog;
    Ruler: TPanel;
    FontDialog1: TFontDialog;
    FirstInd: TLabel;
    LeftInd: TLabel;
    RulerLine: TBevel;
    RightInd: TLabel;
    N5: TMenuItem;
    EditFontItem: TMenuItem;
    StatusBar: TStatusBar;
    ToolBar: TToolBar;
    OpenButton: TToolButton;
    SaveButton: TToolButton;
    PrintButton: TToolButton;
    ToolButton5: TToolButton;
    UndoButton: TToolButton;
    CutButton: TToolButton;
    CopyButton: TToolButton;
    PasteButton: TToolButton;
    ToolButton10: TToolButton;
    FontName: TComboBox;
    FontSize: TEdit;
    ToolButton11: TToolButton;
    UpDown1: TUpDown;
    BoldButton: TToolButton;
    ItalicButton: TToolButton;
    UnderlineButton: TToolButton;
    ToolButton16: TToolButton;
    LeftAlign: TToolButton;
    CenterAlign: TToolButton;
    RightAlign: TToolButton;
    ToolButton20: TToolButton;
    BulletsButton: TToolButton;
    ToolbarImages: TImageList;
    N3: TMenuItem;
    EditInsertFieldItem: TMenuItem;

    procedure SelectionChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ShowHint(Sender: TObject);
    procedure FileNew(Sender: TObject);
    procedure FileOpen(Sender: TObject);
    procedure FileSaveAs(Sender: TObject);
    procedure FilePrint(Sender: TObject);
    procedure FileExit(Sender: TObject);
    procedure EditUndo(Sender: TObject);
    procedure EditCut(Sender: TObject);
    procedure EditCopy(Sender: TObject);
    procedure EditPaste(Sender: TObject);
    procedure SelectFont(Sender: TObject);
    procedure RulerResize(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BoldButtonClick(Sender: TObject);
    procedure ItalicButtonClick(Sender: TObject);
    procedure FontSizeChange(Sender: TObject);
    procedure AlignButtonClick(Sender: TObject);
    procedure FontNameChange(Sender: TObject);
    procedure UnderlineButtonClick(Sender: TObject);
    procedure BulletsButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RulerItemMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RulerItemMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FirstIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure LeftIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RightIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure RichEditChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditInsertFieldItemClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    FClipboardOwner: HWnd;
    FDragOfs: Integer;
    FDragging: Boolean;
    FFieldDialog: TppCustomMailMergeDialog;
    FFileName: String;
    FStatusString: String;
    FUpdating: Boolean;
    FEditor: TCustomRichEdit;

    function CurrText: TTextAttributes;
    procedure GetFontNames;
    procedure SetFileName(const FileName: String);
    procedure CheckFileSave;
    procedure SetupRuler;
    procedure SetEditRect;
    procedure UpdateCaretPos;
    procedure ClipboardChanged;
    procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
    procedure WMChangeCBChain(var Msg: TWMChangeCBChain); message WM_CHANGECBCHAIN;
    procedure WMDrawClipboard(var Msg: TWMDrawClipboard); message WM_DRAWCLIPBOARD;
    procedure PerformFileOpen(const AFileName: string);
    procedure SetModified(Value: Boolean);
    procedure CreateEditControl;

    {merge field support}
    function GetFieldDialog: TppCustomMailMergeDialog;


    protected
      {implment GetLines method inherited from ancestor TppCustomRTFEditor}
      function  GetLines: TStrings; override;
      procedure LanguageChanged; override;

    public
      property Editor: TCustomRichEdit read FEditor;

    published

  end; {class, TppRTFEditor}

var                                      
  ppRTFEditor: TppRTFEditor;

implementation

uses RichEdit, ShellAPI, ppClass;

const
  RulerAdj = 4/3;
  GutterWid = 6;

{$R *.DFM}

{------------------------------------------------------------------------------}
{ EnumFontsProc}

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric; FontType: Integer; Data: Pointer): Integer; stdcall;
begin

  TStrings(Data).Add(LogFont.lfFaceName);

  Result := 1;

end; {procedure, EnumFontsProc}

{------------------------------------------------------------------------------}
{ TppRTFEditor.FormCreate}

procedure TppRTFEditor.FormCreate(Sender: TObject);
begin

  CreateEditControl;

  Application.OnHint := ShowHint;
  OpenDialog.InitialDir := ExtractFilePath(ParamStr(0));
  SaveDialog.InitialDir := OpenDialog.InitialDir;
  SetFileName('Untitled');
  GetFontNames;
  SetupRuler;
  SelectionChange(Self);
  FClipboardOwner := SetClipboardViewer(Handle);

  FFieldDialog := nil;

end; {procedure, FormCreate}

{------------------------------------------------------------------------------}
{ TppRTFEditor.FormDestroy}

procedure TppRTFEditor.FormDestroy(Sender: TObject);
begin

  FFieldDialog.Free;

  {unhook from show hints - NAM 08/12/97}
  Application.OnHint := nil;


  {remove ourselves from the viewer chain}
  ChangeClipboardChain(Handle, FClipboardOwner);

end; {procedure, FormDestroy}

{------------------------------------------------------------------------------}
{ TppRTFEditor.FormCloseQuery}

procedure TppRTFEditor.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  liResponse: Integer;
  lsMessage: String;

begin

  if not Editor.Modified then Exit;

   {string is 'Save changes?'}
   lsMessage := ppLoadStr(355);

   liResponse := MessageDlg(Format(lsMessage, [FFileName]), mtConfirmation, mbYesNoCancel, 0);

   {default response}
   CanClose    := True;
   ModalResult := mrIgnore;

   case liResponse of

    idYes: ModalResult := mrOK;      {close, changes will be saved }

    idNo: {nothing};                 {close without saving}

    idCancel: CanClose    := False;  {do not close}

  end;

end; {procedure, FormCloseQuery}

{------------------------------------------------------------------------------}
{ TppRTFEditor.FormClose}

procedure TppRTFEditor.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  Application.OnHint := nil;

  Action := caHide;

end; {procedure, FormClose}

{------------------------------------------------------------------------------}
{ TppRTFEditor.CreateEditControl}

procedure TppRTFEditor.CreateEditControl;
var
  lFont: TFont;
  lRichEditClass: TppCustomRichEditClass;

begin

  lRichEditClass :=  ppGetRichEditClass;

  if lRichEditClass = TppRichEdit then
    lRichEditClass := TRichEdit;

  FEditor := lRichEditClass.Create(Self);

  FEditor.Parent := Self;

  FEditor.HandleNeeded;

  FEditor.Align := alClient;

  lFont := TFont.Create;
  lFont.Name := 'Arial';
  lFont.Size := 12;

  ppSetOrdPropValue(FEditor, 'Font', Longint(lFont));

  lFont.Free;

  FEditor.TabOrder := 1;

  {note: the following events are protected}
  ppSetOrdPropValue(FEditor,    'ScrollBars', Ord(ssBoth));
  ppSetMethodPropValue(FEditor, 'OnChange', ppFindMethod(Self, 'RichEditChange'));
  ppSetMethodPropValue(FEditor, 'OnSelectionChange', ppFindMethod(Self, 'SelectionChange'));

end; {procedure, CreateEditControl}

{------------------------------------------------------------------------------}
{ TppRTFEditor.GetLines}

function TppRTFEditor.GetLines: TStrings;
begin
  Result := ppGetRichEditLines(Editor);
end; {procedure, GetLines}

{------------------------------------------------------------------------------}
{ TppRTFEditor.FormShow}

procedure TppRTFEditor.FormShow(Sender: TObject);
begin

  UpdateCaretPos;
  DragAcceptFiles(Handle, True);
  Editor.SetFocus;
  ClipboardChanged;

  Editor.Modified := False; {NAM 08/12/97}
  RichEditChange(Self);

end; {procedure, FormShow}

{------------------------------------------------------------------------------}
{ TppRTFEditor.ShowHint}

procedure TppRTFEditor.ShowHint(Sender: TObject);
begin
  if Length(Application.Hint) > 0 then
  begin
    StatusBar.SimplePanel := True;
    StatusBar.SimpleText := Application.Hint;
  end
  else StatusBar.SimplePanel := False;
end; {procedure, ShowHint}

{------------------------------------------------------------------------------}
{ TppRTFEditor.FileNew}

procedure TppRTFEditor.FileNew(Sender: TObject);
begin

  SetFileName('Untitled');

  GetLines.Clear;

  Editor.Modified := True;
  SetModified(True);

end; {procedure, FileNew}

{------------------------------------------------------------------------------}
{ TppRTFEditor.PerformFileOpen}

procedure TppRTFEditor.PerformFileOpen(const AFileName: string);
begin

  GetLines.LoadFromFile(AFileName);

  SetFileName(AFileName);

  Editor.SetFocus;

  Editor.Modified := True;
  SetModified(True);

end; {procedure, PerformFileOpen}

{------------------------------------------------------------------------------}
{ TppRTFEditor.FileOpen}

procedure TppRTFEditor.FileOpen(Sender: TObject);
var
  lbReadOnly: Boolean;
begin

  CheckFileSave;

  if OpenDialog.Execute then
    begin
      PerformFileOpen(OpenDialog.FileName);

      lbReadOnly :=  (ofReadOnly in OpenDialog.Options);

      ppSetOrdPropValue(Editor, 'ReadOnly', Ord(lbReadOnly));
    end;

end; {procedure, FileOpen}

{------------------------------------------------------------------------------}
{ TppRTFEditor.FileSaveAs}

procedure TppRTFEditor.FileSaveAs(Sender: TObject);
var
  lsMessage: String;
begin

  if SaveDialog.Execute then
    begin

      if FileExists(SaveDialog.FileName) then
        begin
          {string is 'OK to overwrite <filename>?'}
          lsMessage := ppLoadStr(356);
          lsMessage := ppSetMessageParameters(lsMessage);
          lsMessage := Format(lsMessage, [SaveDialog.FileName]);

          if MessageDlg(lsMessage, mtConfirmation, mbYesNoCancel, 0) <> idYes then Exit;
        end;

      GetLines.SaveToFile(SaveDialog.FileName);

      SetFileName(SaveDialog.FileName);
    end;

end; {procedure, FileSaveAs}

{------------------------------------------------------------------------------}
{ TppRTFEditor.CheckFileSave}

procedure TppRTFEditor.CheckFileSave;
var
  liResponse: Integer;
  lsMessage: String;
begin

  if not Editor.Modified then Exit;

  {string is 'Save changes to <filename>?'}
  lsMessage := ppLoadStr(357);
  lsMessage := ppSetMessageParameters(lsMessage);
  lsMessage := Format(lsMessage, [FFileName]);

  liResponse := MessageDlg(lsMessage, mtConfirmation, mbYesNoCancel, 0);

  case liResponse of
    idYes: FileSaveAs(Self);
    idNo: {Nothing};
    idCancel: Abort;
  end;

end; {procedure, CheckFileSave}

{------------------------------------------------------------------------------}
{ TppRTFEditor.SetFileName}

procedure TppRTFEditor.SetFileName(const FileName: String);
begin

  FFileName := FileName;

  {string is 'Rich Text Editor'}
  Caption := ppLoadStr(353) + ': ' + ExtractFileName(FileName);

end; {procedure, SetFileName}

{------------------------------------------------------------------------------}
{ TppRTFEditor.SelectionChange}

procedure TppRTFEditor.SelectionChange(Sender: TObject);
begin

  with Editor.Paragraph do
  try
    FUpdating := True;
    FirstInd.Left := Trunc(FirstIndent*RulerAdj)-4+GutterWid;
    LeftInd.Left := Trunc((LeftIndent+FirstIndent)*RulerAdj)-4+GutterWid;
    RightInd.Left := Ruler.ClientWidth-6-Trunc((RightIndent+GutterWid)*RulerAdj);
    BoldButton.Down := fsBold in Editor.SelAttributes.Style;
    ItalicButton.Down := fsItalic in Editor.SelAttributes.Style;
    UnderlineButton.Down := fsUnderline in Editor.SelAttributes.Style;
    BulletsButton.Down := Boolean(Numbering);
    FontSize.Text := IntToStr(Editor.SelAttributes.Size);
    FontName.Text := Editor.SelAttributes.Name;
    case Ord(Alignment) of
      0: LeftAlign.Down := True;
      1: RightAlign.Down := True;
      2: CenterAlign.Down := True;
    end;
    UpdateCaretPos;
  finally
    FUpdating := False;
  end;

end; {procedure, SelectionChange}

{------------------------------------------------------------------------------}
{ TppRTFEditor.CurrText}

function TppRTFEditor.CurrText: TTextAttributes;
begin
  Result := nil;

  if (Editor <> nil) then
    Result := Editor.SelAttributes;

end; {procedure, CurrText}

{------------------------------------------------------------------------------}
{ TppRTFEditor.GetFontNames}

procedure TppRTFEditor.GetFontNames;
var
  DC: HDC;
begin

  DC := GetDC(0);

  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));

  ReleaseDC(0, DC);

  FontName.Sorted := True;

end; {procedure, GetFontNames}

{------------------------------------------------------------------------------}
{ TppRTFEditor.SetupRuler}

procedure TppRTFEditor.SetupRuler;
var
  I: Integer;
  S: String;
begin

  SetLength(S, 201);

  I := 1;

  while I < 200 do
    begin
      S[I] := #9;
      S[I+1] := '|';

      Inc(I, 2);
    end;

  Ruler.Caption := S;

end; {procedure, SetupRuler}

{------------------------------------------------------------------------------}
{ TppRTFEditor.SetEditRect}

procedure TppRTFEditor.SetEditRect;
var
  R: TRect;
begin

  with Editor do
  begin
    R := Rect(GutterWid, 0, ClientWidth-GutterWid, ClientHeight);
    SendMessage(Handle, EM_SETRECT, 0, Longint(@R));
  end;

end; {procedure, SetEditRect}

{------------------------------------------------------------------------------}
{ TppRTFEditor.FilePrint}

procedure TppRTFEditor.FilePrint(Sender: TObject);
begin

  if PrintDialog.Execute then
    Editor.Print(FFileName);

end; {procedure, FilePrint}

{------------------------------------------------------------------------------}
{ TppRTFEditor.FileExit}

procedure TppRTFEditor.FileExit(Sender: TObject);
begin
  Close;
end; {procedure, FileExit}

{------------------------------------------------------------------------------}
{ TppRTFEditor.EditUndo}

procedure TppRTFEditor.EditUndo(Sender: TObject);
begin
  with Editor do
    if HandleAllocated then SendMessage(Handle, EM_UNDO, 0, 0);
end; {procedure, EditUndo}

{------------------------------------------------------------------------------}
{ TppRTFEditor.EditCut}

procedure TppRTFEditor.EditCut(Sender: TObject);
begin
  Editor.CutToClipboard;
end; {procedure, EditCut}

{------------------------------------------------------------------------------}
{ TppRTFEditor.EditCopy}

procedure TppRTFEditor.EditCopy(Sender: TObject);
begin
  Editor.CopyToClipboard;
end; {procedure, EditCopy}

{------------------------------------------------------------------------------}
{ TppRTFEditor.EditPaste}

procedure TppRTFEditor.EditPaste(Sender: TObject);
begin
  Editor.PasteFromClipboard;
end; {procedure, EditPaste}

{------------------------------------------------------------------------------}
{ TppRTFEditor.SelectFont}

procedure TppRTFEditor.SelectFont(Sender: TObject);
begin

  FontDialog1.Font.Assign(Editor.SelAttributes);

  if FontDialog1.Execute then
    CurrText.Assign(FontDialog1.Font);

  Editor.SetFocus;

end; {procedure, SelectFont}

{------------------------------------------------------------------------------}
{ TppRTFEditor.RulerResize}

procedure TppRTFEditor.RulerResize(Sender: TObject);
begin
  RulerLine.Width := Ruler.ClientWidth - (RulerLine.Left*2);
end; {procedure, RulerResize}

{------------------------------------------------------------------------------}
{ TppRTFEditor.FormResize}

procedure TppRTFEditor.FormResize(Sender: TObject);
begin

  SetEditRect;

  SelectionChange(Sender);

end; {procedure, FormResize}

{------------------------------------------------------------------------------}
{ TppRTFEditor.FormPaint}

procedure TppRTFEditor.FormPaint(Sender: TObject);
begin
  SetEditRect;
end; {procedure, FormPaint}

{------------------------------------------------------------------------------}
{ TppRTFEditor.BoldButtonClick}

procedure TppRTFEditor.BoldButtonClick(Sender: TObject);
begin

  if FUpdating then Exit;

  if BoldButton.Down then
    CurrText.Style := CurrText.Style + [fsBold]
  else
    CurrText.Style := CurrText.Style - [fsBold];

end; {procedure, BoldButtonClick}

{------------------------------------------------------------------------------}
{ TppRTFEditor.ItalicButtonClick}

procedure TppRTFEditor.ItalicButtonClick(Sender: TObject);
begin

  if FUpdating then Exit;

  if ItalicButton.Down then
    CurrText.Style := CurrText.Style + [fsItalic]
  else
    CurrText.Style := CurrText.Style - [fsItalic];

end; {procedure, ItalicButtonClick}

{------------------------------------------------------------------------------}
{ TppRTFEditor.FontSizeChange}

procedure TppRTFEditor.FontSizeChange(Sender: TObject);
begin

  if FUpdating then Exit;

  CurrText.Size := StrToInt(FontSize.Text);

end; {procedure, FontSizeChange}

{------------------------------------------------------------------------------}
{ TppRTFEditor.AlignButtonClick}

procedure TppRTFEditor.AlignButtonClick(Sender: TObject);
begin

  if FUpdating then Exit;

  Editor.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);

end; {procedure, AlignButtonClick}

{------------------------------------------------------------------------------}
{ TppRTFEditor.FontNameChange}

procedure TppRTFEditor.FontNameChange(Sender: TObject);
begin

  if FUpdating then Exit;

  CurrText.Name := FontName.Items[FontName.ItemIndex];

end; {procedure, FontNameChange}

{------------------------------------------------------------------------------}
{ TppRTFEditor.UnderlineButtonClick}

procedure TppRTFEditor.UnderlineButtonClick(Sender: TObject);
begin

  if FUpdating then Exit;

  if UnderlineButton.Down then
    CurrText.Style := CurrText.Style + [fsUnderline]
  else
    CurrText.Style := CurrText.Style - [fsUnderline];

end; {procedure, UnderlineButtonClick}

{------------------------------------------------------------------------------}
{ TppRTFEditor.BulletsButtonClick}

procedure TppRTFEditor.BulletsButtonClick(Sender: TObject);
begin

  if FUpdating then Exit;

  Editor.Paragraph.Numbering := TNumberingStyle(BulletsButton.Down);

end; {procedure, BulletsButtonClick}

{------------------------------------------------------------------------------}
{ TppRTFEditor.RulerItemMouseDown}

procedure TppRTFEditor.RulerItemMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  FDragOfs := (TLabel(Sender).Width div 2);

  TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs;

  FDragging := True;

end; {procedure, RulerItemMouseDown}

{------------------------------------------------------------------------------}
{ TppRTFEditor.RulerItemMouseMove}

procedure TppRTFEditor.RulerItemMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin

  if FDragging then
    TLabel(Sender).Left :=  TLabel(Sender).Left+X-FDragOfs;

end; {procedure, RulerItemMouseMove}

{------------------------------------------------------------------------------}
{ TppRTFEditor.FirstIndMouseUp}

procedure TppRTFEditor.FirstIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  FDragging := False;

  Editor.Paragraph.FirstIndent := Trunc((FirstInd.Left+FDragOfs-GutterWid) / RulerAdj);

  LeftIndMouseUp(Sender, Button, Shift, X, Y);

end; {procedure, FirstIndMouseUp}

{------------------------------------------------------------------------------}
{ TppRTFEditor.LeftIndMouseUp}

procedure TppRTFEditor.LeftIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  FDragging := False;

  Editor.Paragraph.LeftIndent := Trunc((LeftInd.Left+FDragOfs-GutterWid) / RulerAdj)-Editor.Paragraph.FirstIndent;

  SelectionChange(Sender);

end; {procedure, LeftIndMouseUp}

{------------------------------------------------------------------------------}
{ TppRTFEditor.RightIndMouseUp}

procedure TppRTFEditor.RightIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  FDragging := False;

  Editor.Paragraph.RightIndent := Trunc((Ruler.ClientWidth-RightInd.Left+FDragOfs-2) / RulerAdj)-2*GutterWid;

  SelectionChange(Sender);

end; {procedure, RightIndMouseUp}

{------------------------------------------------------------------------------}
{ TppRTFEditor.UpdateCaretPos}

procedure TppRTFEditor.UpdateCaretPos;
var
  CharPos: TPoint;
begin

  CharPos.Y := SendMessage(Editor.Handle, EM_EXLINEFROMCHAR, 0, Editor.SelStart);
  CharPos.X := (Editor.SelStart - SendMessage(Editor.Handle, EM_LINEINDEX, CharPos.Y, 0));
  Inc(CharPos.Y);
  Inc(CharPos.X);
  StatusBar.Panels[0].Text := Format(FStatusString, [CharPos.Y, CharPos.X]);

  // update the status of the cut and copy command
  CopyButton.Enabled := Editor.SelLength > 0;
  EditCopyItem.Enabled := CopyButton.Enabled;
  CutButton.Enabled := CopyButton.Enabled;
  EditCutItem.Enabled := CopyButton.Enabled;

end; {procedure, UpdateCaretPos}

{------------------------------------------------------------------------------}
{ TppRTFEditor.WMDropFiles}

procedure TppRTFEditor.WMDropFiles(var Msg: TWMDropFiles);
var
  CFileName: array[0..MAX_PATH] of Char;
begin

  try

    if DragQueryFile(Msg.Drop, 0, CFileName, MAX_PATH) > 0 then
      begin
        CheckFileSave;

        PerformFileOpen(CFileName);

        Msg.Result := 0;
      end;

  finally
    DragFinish(Msg.Drop);
  end;

end; {procedure, WMDropFiles}

{------------------------------------------------------------------------------}
{ TppRTFEditor.RichEditChange}

procedure TppRTFEditor.RichEditChange(Sender: TObject);
begin

  SetModified(Editor.Modified);

  UndoButton.Enabled   := SendMessage(Editor.Handle, EM_CANUNDO, 0, 0) <> 0;

  EditUndoItem.Enabled := UndoButton.Enabled;

end; {procedure, RichEditChange}

{------------------------------------------------------------------------------}
{ TppRTFEditor.SetModified}

procedure TppRTFEditor.SetModified(Value: Boolean);
begin

  {string is 'Modified'}
  if Value then
    StatusBar.Panels[1].Text := ppLoadStr(360)
  else
    StatusBar.Panels[1].Text := '';

end; {procedure, SetModified}

{------------------------------------------------------------------------------}
{ TppRTFEditor.WMChangeCBChain}

procedure TppRTFEditor.WMChangeCBChain(var Msg: TWMChangeCBChain);
begin

  if Msg.Remove = FClipboardOwner then
    FClipboardOwner := Msg.Next
  else
    SendMessage(FClipboardOwner, WM_CHANGECBCHAIN, Msg.Remove, Msg.Next);

  Msg.Result := 0;

end; {procedure, WMChangeCBChain}

{------------------------------------------------------------------------------}
{ TppRTFEditor.ClipboardChanged}

procedure TppRTFEditor.ClipboardChanged;
var
  I: Integer;
  Format: Word;
  E: Boolean;
begin

  // check to see if we can paste what's on the clipboard
  E := False;

  for I := 0 to Clipboard.FormatCount - 1 do
    begin
      Format := Clipboard.Formats[I];
      if SendMessage(Editor.Handle, EM_CANPASTE, Format, 0) <> 0 then
        begin
          E := True;
          Break;
        end;
    end;

  PasteButton.Enabled := E;
  EditPasteItem.Enabled := E;

end; {procedure, ClipboardChanged}

{------------------------------------------------------------------------------}
{ TppRTFEditor.WMDrawClipboard}

procedure TppRTFEditor.WMDrawClipboard(var Msg: TWMDrawClipboard);
begin

  SendMessage(FClipboardOwner, WM_DRAWCLIPBOARD, 0, 0);

  Msg.Result := 0;

  ClipboardChanged;

end; {procedure, WMDrawClipboard}

{------------------------------------------------------------------------------}
{ TppRTFEditor.LanguageChanged }

procedure TppRTFEditor.LanguageChanged;
var
  lsLine: String;
  lsCol: String;
begin

  Caption := ppLoadStr(353);

  OpenButton.Hint      := ppLoadStr(361);
  SaveButton.Hint      := ppLoadStr(362);
  PrintButton.Hint     := ppLoadStr(22); {Print}
  UndoButton.Hint      := ppLoadStr(364);
  CutButton.Hint       := ppLoadStr(365);
  CopyButton.Hint      := ppLoadStr(366);
  PasteButton.Hint     := ppLoadStr(367);

  FontName.Hint        := ppLoadStr(168);
  FontSize.Hint        := ppLoadStr(169);
  BoldButton.Hint      := ppLoadStr(160);
  ItalicButton.Hint    := ppLoadStr(171);
  UnderlineButton.Hint := ppLoadStr(179);
  LeftAlign.Hint       := ppLoadStr(173);
  CenterAlign.Hint     := ppLoadStr(163);
  RightAlign.Hint      := ppLoadStr(176);
  BulletsButton.Hint   := ppLoadStr(354);

  {file menu}
  MainMenu.Items[0].Caption := ppLoadStr(131);

  FileNewItem.Caption    := ppLoadStr(133);
  FileOpenItem.Caption   := ppLoadStr(134);
  FileSaveAsItem.Caption := ppLoadStr(139);
  FilePrintItem.Caption  := ppLoadStr(136);
  FileExitItem.Caption   := ppLoadStr(132);

  {edit menu}
  MainMenu.Items[1].Caption := ppLoadStr(120);

  EditUndoItem.Caption   := ppLoadStr(130);
  EditCutItem.Caption    := ppLoadStr(123);
  EditCopyItem.Caption   := ppLoadStr(122);
  EditPasteItem.Caption  := ppLoadStr(125);
  EditFontItem.Caption   := ppLoadStr(505);
  EditInsertFieldItem.Caption   := ppLoadStr(503);

  lsLine := ppLoadStr(358);
  lsCol := ppLoadStr(359);
  FStatusString := lsLine + ': %3d   ' + lsCol + ': %3d';

end; {procedure, LanguageChanged}

{------------------------------------------------------------------------------}
{ TppRTFEditor.GetFieldDialog}

function TppRTFEditor.GetFieldDialog: TppCustomMailMergeDialog;
var
  lFormClass: TFormClass;
  lFields: TStrings;
begin

  if (FFieldDialog = nil) then
    begin
      lFormClass := ppGetFormClass(TppCustomMailMergeDialog);
      FFieldDialog := TppCustomMailMergeDialog(lFormClass.Create(Application));

      FFieldDialog.LanguageIndex := LanguageIndex;

      lFields := TStringList.Create;

      {build list of fields from the report's datapipeline}
      if (TppCustomReport(Report).DataPipeline <> nil) then
        TppCustomReport(Report).DataPipeline.GetFieldAliases(lFields);

      FFieldDialog.FieldNames := lFields;

      lFields.Free;
    end;

  Result := FFieldDialog;

end; {function, GetFieldDialog}

{------------------------------------------------------------------------------}
{ TppRTFEditor.EditInsertFieldItemClick}

procedure TppRTFEditor.EditInsertFieldItemClick(Sender: TObject);
begin

  if (GetFieldDialog.ShowModal = mrOK) then
    Editor.SetSelTextBuf(PChar('<' + GetFieldDialog.SelectedField + '>'));

end; {procedure, EditInsertFieldItemClick}

{------------------------------------------------------------------------------}
{ TppRTFEditor.FormActivate}

procedure TppRTFEditor.FormActivate(Sender: TObject);
begin
  EditInsertFieldItem.Enabled := MailMerge;
end; {procedure, FormActivate}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  ppRegisterForm(TppCustomRTFEditor, TppRTFEditor);

finalization

  ppUnRegisterForm(TppCustomRTFEditor);

end.
 