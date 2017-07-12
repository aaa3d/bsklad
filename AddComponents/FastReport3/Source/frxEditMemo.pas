{******************************************}
{ }
{ FastReport v3.0 }
{ Memo editor }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxEditMemo;

interface

{$I frx.inc}

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ToolWin, frxClass
{$IFDEF Delphi6}
, Variants
{$ENDIF};
  

type
  TfrxMemoEditorForm = class(TForm)
    ToolBar:TToolBar;
    OkB:TToolButton;
    CancelB:TToolButton;
    Memo:TMemo;
    WordWrapB:TToolButton;
    ExprB:TToolButton;
    AggregateB:TToolButton;
    LocalFormatB:TToolButton;
    ToolButton2:TToolButton;
    procedure FormShow(Sender:TObject);
    procedure OkBClick(Sender:TObject);
    procedure CancelBClick(Sender:TObject);
    procedure WordWrapBClick(Sender:TObject);
    procedure FormHide(Sender:TObject);
    procedure MemoKeyDown(Sender:TObject; var Key:Word;
      Shift:TShiftState);
    procedure ExprBClick(Sender:TObject);
    procedure FormCreate(Sender:TObject);
    procedure AggregateBClick(Sender:TObject);
    procedure LocalFormatBClick(Sender:TObject);
  private
    FMemoView:TfrxCustomMemoView;
  public
    property MemoView:TfrxCustomMemoView read FMemoView write FMemoView;
  end;

implementation

{$R *.DFM}

uses frxEditFormat, frxEditSysMemo, IniFiles, frxDock, frxRes;

procedure TfrxMemoEditorForm.FormShow(Sender:TObject);
var
  Ini:TCustomIniFile;
begin
  Icon:= TForm(Owner).Icon;
  Toolbar.Images:= frxResources.MainButtonImages;
  Ini:= TfrxCustomDesigner(Owner).Report.GetIniFile;
  Ini.WriteBool('Form.TfrxMemoEditorForm', 'Visible', True);
  WordWrapB.Down:= Ini.ReadBool('Form.TfrxMemoEditorForm', 'WordWrap', False);
  WordWrapBClick(nil);
  frxRestoreFormPosition(Ini, Self);
  Ini.Free;

  with TfrxCustomDesigner(Owner) do
  begin
    if UseObjectFont then
    begin
      Memo.Font:= FMemoView.Font;
      Memo.Font.Color:= clBlack;
      Memo.Font.Height:= FMemoView.Font.Height;
    end
    else
    begin
      Memo.Font.Name:= MemoFontName;
      Memo.Font.Size:= MemoFontSize;
    end;
  end;

  Memo.Text:= FMemoView.Text;

  Memo.Perform(EM_SETSEL, 0, 0);
  Memo.Perform(EM_SCROLLCARET, 0, 0);
end;

procedure TfrxMemoEditorForm.FormHide(Sender:TObject);
var
  Ini:TCustomIniFile;
begin
  Ini:= TfrxCustomDesigner(Owner).Report.GetIniFile;
  frxSaveFormPosition(Ini, Self);
  Ini.WriteBool('Form.TfrxMemoEditorForm', 'WordWrap', Memo.WordWrap);
  Ini.Free;
end;

procedure TfrxMemoEditorForm.OkBClick(Sender:TObject);
begin
  ModalResult:= mrOk;
end;

procedure TfrxMemoEditorForm.CancelBClick(Sender:TObject);
begin
  ModalResult:= mrCancel;
end;

procedure TfrxMemoEditorForm.ExprBClick(Sender:TObject);
var
  s, s1, s2:String;

  function BracketCount:Integer;
  var
    i:Integer;
  begin
    Result:= 0;
    for i:= 1 to Length(s) do
      if s[i] = '<' then
        Inc(Result);
  end;

begin
  s:= TfrxCustomDesigner(Owner).InsertExpression('');
  if s<>'' then
  begin
    s1:= MemoView.ExpressionDelimiters;
    s2:= Copy(s1, Pos(',', s1)+1, 255);
    s1:= Copy(s1, 1, Pos(',', s1)-1);
    if (s[1] = '<') and (s[Length(s)] = '>') and (BracketCount = 1) then
      s:= Copy(s, 2, Length(s)-2);
    Memo.SelText:= s1+s+s2;
  end;
end;

procedure TfrxMemoEditorForm.WordWrapBClick(Sender:TObject);
begin
  Memo.WordWrap:= WordWrapB.Down;
  if Memo.WordWrap then
    Memo.ScrollBars:= ssVertical
  else
    Memo.ScrollBars:= ssBoth;
end;

procedure TfrxMemoEditorForm.MemoKeyDown(Sender:TObject; var Key:Word;
  Shift:TShiftState);
begin
  if (Key = vk_Return) and (ssCtrl in Shift) then
    ModalResult:= mrOk
  else if Key = vk_Escape then
    ModalResult:= mrCancel;
end;

procedure TfrxMemoEditorForm.FormCreate(Sender:TObject);
begin
  frxResources.LocalizeForm(Self);
end;

procedure TfrxMemoEditorForm.AggregateBClick(Sender:TObject);
begin
  with TfrxSysMemoEditorForm.Create(Owner) do
  begin
    AggregateOnly:= True;
    if ShowModal = mrOk then
      Memo.SelText:= Text;
    Free;
  end;
end;

procedure TfrxMemoEditorForm.LocalFormatBClick(Sender:TObject);
var
  s:String;
  i:Integer;
begin
  with TfrxFormatEditorForm.Create(Owner) do
  begin
    if ShowModal = mrOk then
    begin
      case Format.Kind of
        fkText:
          s:= '';

        fkNumeric:
          begin
            s:= Format.FormatStr;
            for i:= 1 to Length(s) do
              if s[i] in ['.', ',', '-'] then
                if Format.DecimalSeparator<>'' then
                  s[i]:= Format.DecimalSeparator[1] else
                  s[i]:= DecimalSeparator;
            s:= ' #n'+s;
          end;

        fkDateTime:
          s:= ' #d'+Format.FormatStr;

        fkBoolean:
          s:= ' #b'+Format.FormatStr;
      end;

      if s<>'' then
      begin
        i:= Memo.SelStart;
        if (i > 0) and (Memo.Text[i] = ']') then
          Memo.SelStart:= Memo.SelStart-1;
        Memo.SelText:= s;

      end;
    end;
    Free;
  end;
end;

end.
