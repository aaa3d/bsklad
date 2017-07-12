{$I ViewerOptions.inc}

unit UFormViewReg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormViewReg = class(TForm)
    btnOK: TButton;
    btnHelp: TButton;
    boxInfo: TGroupBox;
    edName: TEdit;
    labName: TLabel;
    labKey: TLabel;
    edKey: TEdit;
    btnPasteName: TButton;
    btnPasteKey: TButton;
    btnCancel: TButton;
    procedure btnOKClick(Sender: TObject);
    procedure btnPasteNameClick(Sender: TObject);
    procedure btnPasteKeyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edNameChange(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  {$ifdef PRO}
  {$I Pro\RegUses.inc}
  {$endif}
  ATViewerMsg, ATxMsgProc;

{$R *.dfm}


procedure TFormViewReg.btnPasteNameClick(Sender: TObject);
begin
  edName.Text:= '';
  edName.PasteFromClipboard;
end;

procedure TFormViewReg.btnPasteKeyClick(Sender: TObject);
begin
  edKey.Text:= '';
  edKey.PasteFromClipboard;
end;

procedure TFormViewReg.FormShow(Sender: TObject);
begin
  {$I Lang.FormViewReg.inc}
  edNameChange(Self);
end;

procedure TFormViewReg.btnOKClick(Sender: TObject);
begin
  {$ifdef PRO}
  if EnterRegistrationInfo(edName.Text, edKey.Text) then
    begin
    MsgInfo(MsgString(310), Handle);
    ModalResult:= mrOK;
    end
  else
    begin
    MsgWarning(MsgString(311), Handle);
    end;
  {$endif}
end;

procedure TFormViewReg.edNameChange(Sender: TObject);
begin
  btnOK.Enabled:= (edName.Text <> '') and (edKey.Text <> '');
end;

procedure TFormViewReg.btnHelpClick(Sender: TObject);
begin
  ShowHelp(Handle, 'Register.html');
end;

end.
