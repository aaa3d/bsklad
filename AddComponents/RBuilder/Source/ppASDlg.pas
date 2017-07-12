{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppASDlg;

interface

{$I ppIfDef.pas}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ppForms, ppASCtrl, ppDB, ppTypes, ppUtils, ppComm;

type

  { TppAutoSearchDialog }
  TppAutoSearchDialog = class(TppCustomAutoSearchDialog)
      pnlBottom: TPanel;
      pnlButtons: TPanel;
      btnOK: TButton;
      btnCancel: TButton;
      shpMandatory: TShape;
      lblMandatory: TLabel;
      procedure btnOKClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
      
    private
      FNotebook: TppAutoSearchNotebook;

    protected
      procedure GetPanelClassForField(aField: TppAutoSearchField; var aPanelClass: TppAutoSearchPanelClass); virtual;
      procedure LanguageChanged; override;
      procedure PanelCreated(aField: TppAutoSearchField; aPanel: TppAutoSearchPanel); virtual;

    public
      procedure Init; override;
      
  end; {class, TppAutoSearchDialog}

var
  ppAutoSearchDialog: TppAutoSearchDialog;

implementation

{$R *.DFM}

{******************************************************************************
 *
 ** A U T O   S E A R C H    D I A L O G
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppAutoSearchDialog.FormCreate }

procedure TppAutoSearchDialog.FormCreate(Sender: TObject);
begin
  FNotebook := nil;
end; {procedure, FormCreate}

{------------------------------------------------------------------------------}
{ TppAutoSearchDialog.FormDestroy }

procedure TppAutoSearchDialog.FormDestroy(Sender: TObject);
begin
  FNotebook.Free;
end; {procedure, FormDestroy}

{------------------------------------------------------------------------------}
{ TppAutoSearchDialog.FormActivate }

procedure TppAutoSearchDialog.FormActivate(Sender: TObject);
begin
  FNotebook.SetFocus;
end; {procedure, FormActivate}

{------------------------------------------------------------------------------}
{ TppAutoSearchDialog.Init }

procedure TppAutoSearchDialog.Init;
begin

  if (FNotebook = nil) then
    begin
      FNotebook := TppAutoSearchNotebook.Create(Self);

      FNotebook.OnGetPanelClass := GetPanelClassForField;
      FNotebook.OnCreatePanel := PanelCreated;
      FNotebook.AutoSearchFields := AutoSearchFields;

      if (Report <> nil) and (pppcDesigning in TppCommunicator(Report).DesignState) then
        FNotebook.Designing := True;

      FNotebook.Init;

      shpMandatory.Visible := FNotebook.MandatoryFieldsExist;
      lblMandatory.Visible := FNotebook.MandatoryFieldsExist;
    end;

  if (FNotebook.Height < (ClientHeight - pnlButtons.Height)) then
    ClientHeight := FNotebook.Height + pnlButtons.Height;

  ClientWidth := 1000;
  
  if (FNotebook.Width < ClientWidth) then
    begin
      if (FNotebook.Width <= 438) then
        ClientWidth := 438
      else
        ClientWidth := FNotebook.Width;
    end;

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TppAutoSearchDialog.btnOKClick }

procedure TppAutoSearchDialog.btnOKClick(Sender: TObject);
begin
  if FNotebook.Valid then
    ModalResult := mrOK;
end; {procedure, btnOKClick}

{------------------------------------------------------------------------------}
{ TppAutoSearchDialog.LanguageChanged }

procedure TppAutoSearchDialog.LanguageChanged;
begin

  Caption := ppLoadStr(65); {Search}

  lblMandatory.Caption := ppLoadStr(66); {indicates that this search value must be entered.}

  btnOK.Caption := ppLoadStr(ppMsgOK);
  btnCancel.Caption := ppLoadStr(ppMsgCancel);

end; {procedure, LanguageChanged}

{------------------------------------------------------------------------------}
{ TppAutoSearchDialog.PanelCreated }

procedure TppAutoSearchDialog.PanelCreated(aField: TppAutoSearchField; aPanel: TppAutoSearchPanel);
begin

end; {procedure, PanelCreated}

{------------------------------------------------------------------------------}
{ TppAutoSearchDialog.GetPanelClassForField }

procedure TppAutoSearchDialog.GetPanelClassForField(aField: TppAutoSearchField; var aPanelClass: TppAutoSearchPanelClass);
begin


end; {function, GetPanelClassForField}


{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  ppRegisterForm(TppCustomAutoSearchDialog, TppAutoSearchDialog);

finalization

  ppUnRegisterForm(TppCustomAutoSearchDialog);

end.
