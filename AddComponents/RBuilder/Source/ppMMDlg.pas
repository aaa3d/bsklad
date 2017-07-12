{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppMMDlg;

interface

{$I ppIfDef.pas}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppForms, StdCtrls, ppTypes, ppUtils;

type

  {TppMailMergeDialog}
  TppMailMergeDialog = class(TppCustomMailMergeDialog)
    lbxFields: TListBox;
    btnOK: TButton;
    btnCancel: TButton;
    procedure lbxFieldsDblClick(Sender: TObject);

  protected
    function  GetSelectedField: String; override;
    function  GetFieldNames: TStrings; override;
    procedure SetFieldNames(aList: TStrings); override;

      procedure LanguageChanged; override;
      
  end; {class, TppMailMergeDialog}

var
  ppMailMergeDialog: TppMailMergeDialog;

implementation

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TppMailMergeDialog.lbxFieldsDblClick}

procedure TppMailMergeDialog.lbxFieldsDblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end; {procedure, lbxFieldsDblClick}

{------------------------------------------------------------------------------}
{ TppMailMergeDialog.GetFieldNames}

function TppMailMergeDialog.GetFieldNames: TStrings;
begin
  Result := lbxFields.Items;
end;

{------------------------------------------------------------------------------}
{ TppMailMergeDialog.GetFieldNames}

procedure TppMailMergeDialog.SetFieldNames(aList: TStrings);
begin
  lbxFields.Items.Assign(aList);
end;

{------------------------------------------------------------------------------}
{ TppMailMergeDialog.GetSelectedField}

function TppMailMergeDialog.GetSelectedField: String;
begin
  if (lbxFields.ItemIndex > -1) and (lbxFields.Items.Count > 0) then
    Result := lbxFields.Items[lbxFields.ItemIndex]
  else
    Result := '';
end; {function, GetSelectedField}

{------------------------------------------------------------------------------}
{ TppMailMergeDialog.LanguageChanged }

procedure TppMailMergeDialog.LanguageChanged;
begin
  Caption := ppLoadStr(630);  {Insert Field}

  btnOK.Caption := ppLoadStr(ppMsgOK);
  btnCancel.Caption := ppLoadStr(ppMsgCancel);
end;

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  ppRegisterForm(TppCustomMailMergeDialog, TppMailMergeDialog);

finalization

  ppUnRegisterForm(TppCustomMailMergeDialog);

end.
