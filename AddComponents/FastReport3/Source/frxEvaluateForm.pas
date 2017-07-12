{******************************************}
{ }
{ FastReport v3.0 }
{ Evaluate dialog }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxEvaluateForm;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fs_iinterpreter
{$IFDEF Delphi6}
, Variants
{$ENDIF};

type
  TfrxEvaluateForm = class(TForm)
    Label1:TLabel;
    ExpressionE:TEdit;
    Label2:TLabel;
    ResultM:TMemo;
    procedure ExpressionEKeyPress(Sender:TObject; var Key:Char);
    procedure FormShow(Sender:TObject);
    procedure FormCreate(Sender:TObject);
    procedure FormKeyDown(Sender:TObject; var Key:Word;
      Shift:TShiftState);
  private
    FScript:TfsScript;
  public
    property Script:TfsScript read FScript write FScript;
  end;

implementation

{$R *.DFM}

uses frxRes;

procedure TfrxEvaluateForm.ExpressionEKeyPress(Sender:TObject; var Key:Char);
var
  v:Variant;
  s:String;
begin
  if Key = #13 then
  begin
    v:= FScript.Evaluate(ExpressionE.Text);
    s:= VarToStr(v);
    if TVarData(v).VType = varBoolean then
      if Boolean(v) = True then
        s:= 'True' else
        s:= 'False'
    else if (TVarData(v).VType = varString) or (TVarData(v).VType = varOleStr) then
      s:= ''''+v+''''
    else if v = Null then
      s:= 'Null';
    ResultM.Text:= s;
    ExpressionE.SelectAll;
  end
  else if Key = #27 then
    Close;
end;

procedure TfrxEvaluateForm.FormShow(Sender:TObject);
begin
  ExpressionE.SelectAll;
  ResultM.Text:= '';
end;

procedure TfrxEvaluateForm.FormCreate(Sender:TObject);
begin
  frxResources.LocalizeForm(Self);
end;

procedure TfrxEvaluateForm.FormKeyDown(Sender:TObject; var Key:Word;
  Shift:TShiftState);
begin
  if Key = VK_ESCAPE then
    ModalResult:= mrCancel;
end;

end.
