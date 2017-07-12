{******************************************************************************}
{                                                                              }
{                ReportBuilder Data Access Development Environment             }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit daQFnDlg;

interface

{$I ppIfDef.pas}

uses

{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinProcs, WinTypes,
{$ENDIF}

  SysUtils, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ppTypes, ppUtils, daQClass;

type

  { TdaFunctionDialog }
  TdaFunctionDialog = class(TForm)
    lblFunction: TLabel;
    cbxFunctions: TComboBox;
    cbxAvailableFields: TComboBox;
    lblField: TLabel;
    btnOK: TButton;
    btnCancel: TButton;
    procedure btnOKClick(Sender: TObject);
    procedure cbxFunctionsChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure EnableControls;

  public

  end; {class, TdaFunctionDialog}

implementation

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TdaFunctionDialog.FormCreate }

procedure TdaFunctionDialog.FormCreate(Sender: TObject);
begin

  Caption := ppLoadStr(736); {Calculated Fields}

  btnOK.Caption := ppLoadStr(ppMsgOK); {OK}
  btnCancel.Caption := ppLoadStr(ppMsgCancel); {Cancel}

  lblFunction.Caption := ppLoadStr(766); {Function}
  lblField.Caption := ppLoadStr(799); {Numeric Field}

end; {procedure, cbFunctionChange}

{------------------------------------------------------------------------------}
{ TdaFunctionDialog.FormActivate }

procedure TdaFunctionDialog.FormActivate(Sender: TObject);
begin
  EnableControls;
end; {procedure, FormActivate}

{------------------------------------------------------------------------------}
{ TdaFunctionDialog.btnOKClick }

procedure TdaFunctionDialog.btnOKClick(Sender: TObject);
begin
  if (cbxFunctions.ItemIndex = Ord(dacaCount)) or ((cbxFunctions.ItemIndex > -1) and (cbxAvailableFields.ItemIndex > -1)) then
    ModalResult := mrOK
  else
    {message: You must select a function and a field.}
    MessageDlg(ppLoadStr(704), mtError, [mbOK],0);
end; {procedure, btnOKClick}

{------------------------------------------------------------------------------}
{ TdaFunctionDialog.cbFunctionChange }

procedure TdaFunctionDialog.cbxFunctionsChange(Sender: TObject);
begin
  EnableControls;
end; {procedure, cbFunctionChange}

{------------------------------------------------------------------------------}
{ TdaFunctionDialog.EnableControls }

procedure TdaFunctionDialog.EnableControls;
begin

  if (cbxFunctions.ItemIndex = Ord(dacaCount)) then
    begin
      cbxAvailableFields.Font.Color := clBtnFace;
      cbxAvailableFields.Enabled := False;
      lblField.Enabled := False;
    end
  else
    begin
      cbxAvailableFields.Font.Color := clBtnText;
      cbxAvailableFields.Enabled := True;
      lblField.Enabled := True;
    end;
    
end; {procedure, EnableControls}


end.
