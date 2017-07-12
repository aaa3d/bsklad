{*******************************************}
{                                           }
{             FastReport v2.4               }
{                                           }
{ Copyright (c) 1998-2001 by Tzyganenko A.  }
{                                           }
{         Search aNd Replace Dialog         }
{       for use with TfrDesignerForm        }
{                                           }
{ Copyright (c) 2002 by Dmitry Koudryavtsev }
{        http://juliasoft.chat.ru           }
{           juliasoft@mail.ru               }
{*******************************************}
unit fr_snr;

interface

uses
  Forms, Buttons, ComCtrls, fr_Class, fr_Desgn, StdCtrls, Controls, Classes,
  FR_Ctrls, Menus;

{$I fr.inc}

type
  TSearchFunction  = function(const AText, ASubText : String) : Boolean;
  TReplaceFunction = function(const AText, AFromText, AToText: string): string;
//  TCompareFunction = function(aCnt : Integer) : Boolean;
  TActionProcedure = procedure(aCnt : Integer) of object;

  TActionThread = class;

  TfrSnrForm = class(TForm)
    CaseBox: TCheckBox;
    ScriptBox: TCheckBox;
    ReplaceCombo: TComboBox;
    SearchCombo: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    MemoBox: TCheckBox;
    SearchBtn: TBitBtn;
    StopBtn: TBitBtn;
    ReplaceBtn: TBitBtn;
    ReplAllBtn: TBitBtn;
    CloseBtn: TBitBtn;
    ListView1: TListView;
    PopupMenu1: TPopupMenu;
    Search1: TMenuItem;
    Stop1: TMenuItem;
    N1: TMenuItem;
    Replace1: TMenuItem;
    ReplaceAll1: TMenuItem;
    N2: TMenuItem;
    ClearResults1: TMenuItem;
    procedure CancelButton1Click(Sender: TObject);
    procedure SearchButton1Click(Sender: TObject);
    procedure ReplaceButton1Click(Sender: TObject);
    procedure ReplaceAllButton1Click(Sender: TObject);
    procedure StopBtnClick(Sender: TObject);
    procedure CaseBoxClick(Sender: TObject);
    procedure ClearResults1Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
  private
    { Private declarations }
    SearchThread : TActionThread;
    FDesigner : TfrDesignerForm;
    FSearcher : TSearchFunction;
    FReplacer : TReplaceFunction;
    FAction : TActionProcedure;
    FModified : Boolean;
    function GetObjCount : Integer;
    procedure OnTerminate(Sender: TObject);
    procedure SetModified(AView : TfrView);
    procedure UpdateCombos;
    procedure i18n;
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
    function Comparator(aCnt : Integer) : Boolean;
    procedure OnSearchAction(aCnt : Integer);
    procedure OnReplaceAllAction(aCnt : Integer);
//
    property ObjCount : Integer read GetObjCount;
  end;

  TActionThread = class(TThread)
    FSnr : TfrSnrForm;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended : Boolean; ASnr : TfrSnrForm);
  end;

implementation

{$R fr_snr.res}
{$R *.dfm}

Uses
  Graphics, SysUtils, Dialogs, fr_Utils, snr_const,
{$IFDEF DELPHI6}
  StrUtils,
{$ELSE}
  fr_Snr3,
{$ENDIF}
  Windows;

constructor TfrSnrForm.Create(AOwner : TComponent);
begin
  inherited;
  FDesigner := TfrDesignerForm(AOwner);
  FSearcher := AnsiContainsText;
  FReplacer := AnsiReplaceText;
  FModified := False;
  i18n;
end;

procedure TfrSnrForm.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.WndParent := TWinControl(Owner).Handle;
end;

procedure TfrSnrForm.i18n;
begin
  Caption := frLoadStr(snrCaption);

  Label1.Caption := frLoadStr(snrSearch);
  Label2.Caption := frLoadStr(snrReplace);
  CaseBox.Caption := frLoadStr(snrCaseInsensitive);
  ScriptBox.Caption := frLoadStr(snrSearchInScript);
  MemoBox.Caption := frLoadStr(snrSearchInMemo);
  SearchBtn.Caption := frLoadStr(snrSearch);
  ReplaceBtn.Caption := frLoadStr(snrReplace);
  StopBtn.Caption := frLoadStr(snrStop);
  ReplAllBtn.Caption := frLoadStr(snrReplaceAll);
  CloseBtn.Caption := frLoadStr(snrClose);

  Search1.Caption := frLoadStr(snrSearch);
  Stop1.Caption := frLoadStr(snrStop);
  Replace1.Caption := frLoadStr(snrReplace);
  ReplaceAll1.Caption := frLoadStr(snrReplaceAll);
  ClearResults1.Caption := frLoadStr(snrClear);

end;

procedure TfrSnrForm.CaseBoxClick(Sender: TObject);
begin
  if CaseBox.Checked then begin
    FSearcher := AnsiContainsText;
    FReplacer := AnsiReplaceText;
  end else begin
    FSearcher := AnsiContainsStr;
    FReplacer := AnsiReplaceStr;
  end;
end;

procedure TfrSnrForm.UpdateCombos;
begin
  if Trim(SearchCombo.Text) <> '' then
    if SearchCombo.Items.IndexOf(SearchCombo.Text) = -1 then
      SearchCombo.Items.Insert(0, SearchCombo.Text);

  if Trim(ReplaceCombo.Text) <> '' then
    if ReplaceCombo.Items.IndexOf(ReplaceCombo.Text) = -1 then
      ReplaceCombo.Items.Insert(0, ReplaceCombo.Text);
end;

function TfrSnrForm.GetObjCount : Integer;
begin
  Result := FDesigner.Page.Objects.Count;
end;

procedure TfrSnrForm.OnTerminate(Sender: TObject);
begin
  SearchBtn.Enabled := True;
  StopBtn.Enabled := False;
  ReplaceBtn.Enabled := (ListView1.Items.Count > 0);

  Search1.Enabled := True;
  Stop1.Enabled := False;
  Replace1.Enabled := (ListView1.Items.Count > 0);
  ClearResults1.Enabled := (ListView1.Items.Count > 0);

  if FModified then begin
    FModified := False;
    FDesigner.Modified := True;
    FDesigner.RedrawPage;
  end;
end;

function TfrSnrForm.Comparator(aCnt : Integer) : Boolean;
begin
  Result :=
    (
    MemoBox.Checked AND
    FSearcher(TfrView(FDesigner.Page.Objects[aCnt]).Memo.Text, SearchCombo.Text)
    ) OR (
    ScriptBox.Checked AND
    FSearcher(TfrView(FDesigner.Page.Objects[aCnt]).Script.Text, SearchCombo.Text)
    );
end;

procedure TfrSnrForm.StopBtnClick(Sender: TObject);
begin
  SearchThread.Terminate;

  SearchBtn.Enabled := True;
  StopBtn.Enabled := False;

  Search1.Enabled := True;
  Stop1.Enabled := False;
end;

procedure TfrSnrForm.CancelButton1Click(Sender: TObject);
begin
  ListView1.Items.Clear;
  if Assigned(SearchThread) then
    SearchThread.Terminate;
  Self.Close;
end;

procedure TfrSnrForm.SearchButton1Click(Sender: TObject);
begin
  UpdateCombos;

  SearchBtn.Enabled := True;
  StopBtn.Enabled := False;

  Search1.Enabled := True;
  Stop1.Enabled := False;

  FAction := OnSearchAction;
  ListView1.Items.Clear;
  SearchThread := TActionThread.Create(False, Self);
end;

procedure TfrSnrForm.ReplaceButton1Click(Sender: TObject);
Var
  ListItem : TListItem;
  AView : TfrView;
  i, rc : Integer;
  nonStop : Boolean;
begin
  if ListView1.SelCount = 0 then begin
    ShowMessage('Select item(s) to replace !');
    exit;
  end;

  FModified := False;
  nonStop := False;
  rc := 0;

  UpdateCombos;
  ListItem := ListView1.Selected;
  repeat
    AView := Nil;
    for i := 0 to ObjCount do
      if TfrView(FDesigner.Page.Objects[i]).Id = StrToInt(ListItem.SubItems[0]) then begin
        AView := TfrView(FDesigner.Page.Objects[i]);
        break;
      end;

    if AView = nil then continue;

    if NOT nonStop then
      rc := MessageDlg('Replace occurences of '#10#13'"' + SearchCombo.Text + '"'#10#13+
                       'with '#10#13'"' + ReplaceCombo.Text + '"'#10#13 +
                       'in selected item(s) ?', mtConfirmation, [mbYes, mbNo, mbCancel, mbAll], 0);
    case rc of
      mrYes : begin
        if MemoBox.Checked then begin
          AView.Memo.Text := FReplacer(AView.Memo.Text, SearchCombo.Text, ReplaceCombo.Text);
          SetModified(AView);
        end;
        if ScriptBox.Checked then begin
          AView.Script.Text := FReplacer(AView.Script.Text, SearchCombo.Text, ReplaceCombo.Text);
          SetModified(AView);
        end;
      end; // mrYes
      mrAll : begin
        nonStop := True;
        rc := mrYes;
      end; // mrAll
      mrCancel : break;
    end; // case

    ListItem := ListView1.GetNextItem(ListItem, sdAll, [isSelected]);
  until ListItem = Nil;

  if FModified then begin
    FModified := False;
    FDesigner.Modified := True;
    FDesigner.RedrawPage;
  end;
end;

procedure TfrSnrForm.ReplaceAllButton1Click(Sender: TObject);
begin
  if MessageDlg('Replace ALL occurences of '#10#13'"' + SearchCombo.Text + '"'#10#13+
                'with '#10#13'"' + ReplaceCombo.Text + '"'#10#13 +
                'in report ?', mtConfirmation, mbOkCancel, 0) = mrOk then begin
    UpdateCombos;
    FAction := OnReplaceAllAction;
    SearchThread := TActionThread.Create(False, Self);
  end;
end;

procedure TfrSnrForm.OnSearchAction(aCnt : Integer);
Var ListItem : TListItem;
begin
  with ListView1 do begin
    ListItem := ListView1.Items.Add;
    ListItem.Caption := TfrView(FDesigner.Page.Objects[aCnt]).Name;
    ListItem.SubItems.Add(IntToStr(TfrView(FDesigner.Page.Objects[aCnt]).ID));
    ListItem.SubItems.Add(TfrView(FDesigner.Page.Objects[aCnt]).Memo.Text);
    ListItem.SubItems.Add(TfrView(FDesigner.Page.Objects[aCnt]).Script.Text);
  end;
end;

procedure TfrSnrForm.OnReplaceAllAction(aCnt : Integer);
Var AView : TfrView;
begin
  AView := TfrView(FDesigner.Page.Objects[aCnt]);

  if MemoBox.Checked then begin
    AView.Memo.Text := FReplacer(AView.Memo.Text, SearchCombo.Text, ReplaceCombo.Text);
    SetModified(AView);
  end;
  if ScriptBox.Checked then begin
    AView.Script.Text := FReplacer(AView.Script.Text, SearchCombo.Text, ReplaceCombo.Text);
    SetModified(AView);
  end;
end;

procedure TfrSnrForm.SetModified(AView : TfrView);
begin
  AView.Selected := True;
  FDesigner.SelectionChanged;
  AView.Selected := False;
  FModified := True;
end;

procedure TfrSnrForm.ListView1DblClick(Sender: TObject);
Var
  AView : TfrView;
  ListItem : TListItem;
  i : Integer;
begin
  // ListView1.DblClock
  if ListView1.Items.Count > 0 then begin
    AView := Nil;
    ListItem := ListView1.ItemFocused;
    for i := 0 to ObjCount do
      if TfrView(FDesigner.Page.Objects[i]).Id = StrToInt(ListItem.SubItems[0]) then begin
        AView := TfrView(FDesigner.Page.Objects[i]);
        break;
      end;

    if AView = nil then exit;

    AView.Selected := True;
    FDesigner.ShowMemoEditor(AView);
  end;
end;

procedure TfrSnrForm.ClearResults1Click(Sender: TObject);
begin
  ListView1.Items.Clear;
end;

{--- Action Thread -------------------------------------------------------------}

constructor TActionThread.Create(CreateSuspended : Boolean; ASnr : TfrSnrForm);
begin
  inherited Create(CreateSuspended);
  FSnr := ASnr;
  FreeOnTerminate := True;
  OnTerminate := FSnr.OnTerminate;
end;

procedure TActionThread.Execute;
var oCounter : Integer;
begin
  oCounter := 0;
  while ( NOT Terminated ) AND ( oCounter < FSnr.ObjCount ) do begin
    if FSnr.Comparator(oCounter) then begin
      FSnr.FAction(oCounter);
      Sleep(0);
    end;
    Inc(oCounter);
  end; // while
end;


end.
