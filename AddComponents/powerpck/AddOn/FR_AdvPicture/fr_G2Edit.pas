{******************************************}
{                                          }
{             FastReport v2.4              }
{              Picture editor              }
{                                          }
{ Copyright (c) 2001 by Stalker SoftWare   }
{ Copyright (c) 1998-2001 by Tzyganenko A. }
{                                          }
{******************************************}

unit FR_G2Edit;

interface

{$I FR.inc}

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, FR_Class, FR_Const,
  AdvPicture;

type
  TfrAdvPictureEditorForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Button3: TButton;
    Button4: TButton;
    ScrollBox1: TScrollBox;
    AdvPicture1: TAdvPicture;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Localize;
  public
    { Public declarations }
    procedure ShowEditor(oIPicture: TIPicture);
  end;


var
  frAdvPictureEditorForm: TfrAdvPictureEditorForm;

implementation

{$R *.DFM}

uses
  FR_Utils {$IFDEF OPENPICTUREDLG} , ExtDlgs {$ENDIF};

procedure TfrAdvPictureEditorForm.ShowEditor(oIPicture: TIPicture);
begin

 if not oIPicture.Empty then
   AdvPicture1.Picture.Assign(oIPicture);

 if ShowModal = mrOk then begin
   frDesigner.BeforeChange;
   if not AdvPicture1.Picture.Empty then
     oIPicture.Assign(AdvPicture1.Picture)
   else
     oIPicture.Assign(nil)
 end; { if }

end; { ShowEditor }

procedure TfrAdvPictureEditorForm.BitBtn1Click(Sender: TObject);
var
{$IFDEF OPENPICTUREDLG}
  OpenDlg: TOpenPictureDialog;
{$ELSE}
  OpenDlg: TOpenDialog;
{$ENDIF}

begin

{$IFDEF OPENPICTUREDLG}
  OpenDlg := TOpenPictureDialog.Create(nil);
{$ELSE}
  OpenDlg := TOpenDialog.Create(nil);
{$ENDIF}
  OpenDlg.Options := [ofHideReadOnly];
  OpenDlg.Filter := frLoadStr(SPictFile) +
    ' (*.bmp *.jpg *.gif *.ico *.wmf *.emf)|*.bmp;*.jpg;*.gif;*.ico;*.wmf;*.emf|' +
    frLoadStr(SAllFiles) + '|*.*';

  if OpenDlg.Execute then
    AdvPicture1.Picture.LoadFromFile(OpenDlg.FileName);

  OpenDlg.Free;

end; { BitBtn1Click }

procedure TfrAdvPictureEditorForm.Button4Click(Sender: TObject);
begin
 AdvPicture1.Picture.Assign(nil);
end; { Button4Click }

procedure TfrAdvPictureEditorForm.Localize;
begin
 Caption := frLoadStr(frRes + 460);
 Button3.Caption := frLoadStr(frRes + 462);
 Button4.Caption := frLoadStr(frRes + 463);
 Button1.Caption := frLoadStr(SOk);
 Button2.Caption := frLoadStr(SCancel);
end; { Localize }

procedure TfrAdvPictureEditorForm.FormCreate(Sender: TObject);
begin
 Localize;
end; { FormCreate }

end.



