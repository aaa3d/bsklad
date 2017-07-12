{******************************************************************************}
{                                                                              }
{                             ReportBuilder Demos                              }
{                                                                              }
{             Copyright (c) 1996-2000 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}
unit myUserInputForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type
  { TfrmMyUserInput }
  TfrmMyUserInput = class (TForm)
    bnCancel: TButton;
    bnOK: TButton;
    cbIncludeAddress: TCheckBox;
    ebHeading: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    lblCompanyName: TLabel;
    pgCtlMain: TPageControl;
    rgDestination: TRadioGroup;
    tabMasterRecord: TTabSheet;
    tabStartup: TTabSheet;
    procedure FormCreate(Sender: TObject);
  public
    procedure InitDialog(aStartupPage: Boolean; const aDefaultHeading, aCompanyName: String);
  end;

var
  frmMyUserInput: TfrmMyUserInput;

implementation

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TfrmMyUserInput.FormCreate}
procedure TfrmMyUserInput.FormCreate(Sender: TObject);
begin
  tabStartup.TabVisible := False;
  tabMasterRecord.TabVisible := False;
end;{ procedure FormCreate() }

{------------------------------------------------------------------------------}
{ TfrmMyUserInput.InitDialog}
procedure TfrmMyUserInput.InitDialog(aStartupPage: Boolean; const aDefaultHeading, aCompanyName: String);
begin
  
  if aStartupPage then
    pgCtlMain.ActivePage := tabStartup
  else
    pgCtlMain.ActivePage := tabMasterRecord;
  
  ebHeading.Text := aDefaultHeading;
  lblCompanyName.Caption := aCompanyName;
  
end;{ procedure InitDialog() }

end.