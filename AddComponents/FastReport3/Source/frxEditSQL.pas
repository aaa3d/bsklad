{******************************************}
{ }
{ FastReport v3.0 }
{ SQL editor }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxEditSQL;

interface

{$I frx.inc}

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ToolWin, frxSynMemo
{$IFDEF Delphi6}
, Variants
{$ENDIF}
{$IFDEF QBUILDER}
, fqbClass
{$ENDIF};

type
  TfrxSQLEditorForm = class(TForm)
    ToolBar:TToolBar;
    OkB:TToolButton;
    CancelB:TToolButton;
    QBB:TToolButton;
    procedure OkBClick(Sender:TObject);
    procedure CancelBClick(Sender:TObject);
    procedure FormCreate(Sender:TObject);
    procedure MemoKeyDown(Sender:TObject; var Key:Word;
      Shift:TShiftState);
    procedure FormHide(Sender:TObject);
    procedure FormShow(Sender:TObject);
    procedure QBBClick(Sender:TObject);
  private
    { Private declarations }
    FMemo:TfrxSyntaxMemo;
    FSQLSchema:String;
  public
    { Public declarations }
{$IFDEF QBUILDER}
    QBEngine:TfqbEngine;
{$ENDIF}
    property Memo:TfrxSyntaxMemo read FMemo;
    property SQLSchema:String read FSQLSchema write FSQLSchema;
  end;

implementation

{$R *.DFM}

uses frxClass, frxRes, frxDock, IniFiles;

procedure TfrxSQLEditorForm.FormCreate(Sender:TObject);
begin
  FMemo:= TfrxSyntaxMemo.Create(Self);
  with FMemo do
  begin
    Parent:= Self;
    Align:= alClient;
    Syntax:= 'SQL';
    ShowGutter:= False;
    Color:= clWindow;
    OnKeyDown:= MemoKeyDown;
{$I frxEditSQL.inc}
  end;
  Toolbar.Images:= frxResources.MainButtonImages;
{$IFDEF QBUILDER}
  QBB.Visible:= True;
{$ENDIF}
  frxResources.LocalizeForm(Self);
end;

procedure TfrxSQLEditorForm.FormShow(Sender:TObject);
var
  Ini:TCustomIniFile;
begin
  Ini:= TfrxCustomDesigner(Owner).Report.GetIniFile;
  Ini.WriteBool('Form.TfrxSQLEditorForm', 'Visible', True);
  frxRestoreFormPosition(Ini, Self);
  Ini.Free;
end;

procedure TfrxSQLEditorForm.FormHide(Sender:TObject);
var
  Ini:TCustomIniFile;
begin
  Ini:= TfrxCustomDesigner(Owner).Report.GetIniFile;
  frxSaveFormPosition(Ini, Self);
  Ini.Free;
{$IFDEF QBUILDER}
  if QBEngine<>nil then
    QBEngine.Free;
{$ENDIF}
end;

procedure TfrxSQLEditorForm.OkBClick(Sender:TObject);
begin
  ModalResult:= mrOk;
end;

procedure TfrxSQLEditorForm.CancelBClick(Sender:TObject);
begin
  ModalResult:= mrCancel;
end;

procedure TfrxSQLEditorForm.MemoKeyDown(Sender:TObject; var Key:Word;
  Shift:TShiftState);
begin
  if (Key = vk_Return) and (ssCtrl in Shift) then
    ModalResult:= mrOk
  else if Key = vk_Escape then
    ModalResult:= mrCancel;
end;

procedure TfrxSQLEditorForm.QBBClick(Sender:TObject);
{$IFDEF QBUILDER}
var
  fqbDialog:TfqbDialog;
{$ENDIF}
begin
{$IFDEF QBUILDER}
  fqbDialog:= TfqbDialog.Create(nil);
  try
    fqbDialog.Engine:= QBEngine;
    fqbDialog.SchemaInsideSQL:= False;
    fqbDialog.SQL:= Memo.Lines.Text;
    fqbDialog.SQLSchema:= FSQLSchema;

    if fqbDialog.Execute then
    begin
      Memo.Lines.Text:= fqbDialog.SQL;
      FSQLSchema:= fqbDialog.SQLSchema;
    end;
  finally
    fqbDialog.Free;
  end;
{$ENDIF}
end;

end.
