{******************************************}
{ }
{ FastReport v3.0 }
{ Expression Editor }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxEditExpr;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, frxClass, ExtCtrls, ImgList, Buttons, frxDataTree
{$IFDEF Delphi6}
, Variants
{$ENDIF};
  

type
  TfrxExprEditorForm = class(TForm)
    ExprMemo:TMemo;
    Panel1:TPanel;
    OkB:TButton;
    CancelB:TButton;
    Splitter1:TSplitter;
    Panel2:TPanel;
    ExprL:TLabel;
    procedure FormCreate(Sender:TObject);
    procedure FormDestroy(Sender:TObject);
    procedure ExprMemoDragOver(Sender, Source:TObject; X, Y:Integer;
      State:TDragState; var Accept:Boolean);
    procedure ExprMemoDragDrop(Sender, Source:TObject; X, Y:Integer);
    procedure FormShow(Sender:TObject);
    procedure FormHide(Sender:TObject);
  private
    FDataTree:TfrxDataTreeForm;
    procedure OnDataTreeDblClick(Sender:TObject);
  public
  end;

implementation

{$R *.DFM}

uses frxDock, IniFiles, frxRes;

{ TfrxExprEditorForm }

procedure TfrxExprEditorForm.FormCreate(Sender:TObject);
begin
  frxResources.LocalizeForm(Self);
  Icon:= TForm(Owner).Icon;

  FDataTree:= TfrxDataTreeForm.Create(Owner);
  FDataTree.OnDblClick:= OnDataTreeDblClick;
  FDataTree.Tabs.Parent:= Self;
  FDataTree.Tabs.Align:= alClient;
  FDataTree.HintPanel.Height:= 60;
  FDataTree.FunctionNameL.Height:= 17;
  FDataTree.UpdateItems;
end;

procedure TfrxExprEditorForm.FormDestroy(Sender:TObject);
begin
  FDataTree.Free;
end;

procedure TfrxExprEditorForm.FormShow(Sender:TObject);
var
  Ini:TCustomIniFile;
begin
  Ini:= TfrxCustomDesigner(Owner).Report.GetIniFile;
  Ini.WriteBool('Form.TfrxExprEditorForm', 'Visible', True);
  frxRestoreFormPosition(Ini, Self);
  Ini.Free;
end;

procedure TfrxExprEditorForm.FormHide(Sender:TObject);
var
  Ini:TCustomIniFile;
begin
  Ini:= TfrxCustomDesigner(Owner).Report.GetIniFile;
  frxSaveFormPosition(Ini, Self);
  Ini.Free;
end;

procedure TfrxExprEditorForm.OnDataTreeDblClick(Sender:TObject);
begin
  ExprMemo.SelText:= FDataTree.GetFieldName;
  ExprMemo.SetFocus;
end;

procedure TfrxExprEditorForm.ExprMemoDragOver(Sender, Source:TObject; X,
  Y:Integer; State:TDragState; var Accept:Boolean);
begin
  Accept:= (Source is TTreeView) and (TControl(Source).Owner = FDataTree) and
    (FDataTree.GetFieldName<>'');
end;

procedure TfrxExprEditorForm.ExprMemoDragDrop(Sender, Source:TObject; X,
  Y:Integer);
begin
  ExprMemo.SelText:= FDataTree.GetFieldName;
  ExprMemo.SetFocus;
end;

end.
