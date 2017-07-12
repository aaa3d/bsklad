unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, SakSMTP, SakMsg;

type
  TForm1 = class(TForm)
    SakMsg1: TSakMsg;
    EditHost: TEdit;
    EditFrom: TEdit;
    EditTo: TEdit;
    EditSubject: TEdit;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    ComboBoxAttachedFiles: TComboBox;
    ButtonAddAttachedFile: TButton;
    Label1: TLabel;
    ButtonSend: TButton;
    EditUserName: TEdit;
    ButtonClearAttachedFiles: TButton;
    StatusBar1: TStatusBar;
    ProgressBar1: TProgressBar;
    Label2: TLabel;
    ProgressBar2: TProgressBar;
    Label3: TLabel;
    SakSMTP1: TSakSMTP;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    BtnCancel: TButton;
    Label10: TLabel;
    EditCharSet: TEdit;
    Label11: TLabel;
    ComboBoxEncoding: TComboBox;
    procedure ButtonAddAttachedFileClick(Sender: TObject);
    procedure ButtonSendClick(Sender: TObject);
    procedure SakSMTP1Error(Sender: TObject; Error: Integer; Msg: string);
    procedure ButtonClearAttachedFilesClick(Sender: TObject);
    procedure SakSMTP1AfterSend(Sender: TObject);
    procedure SakSMTP1BeforeSend(Sender: TObject);
    procedure SakSMTP1SendProgress(Sender: TObject; Percent: Word);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}
type SMTPError = class( Exception);

procedure TForm1.ButtonAddAttachedFileClick(Sender: TObject);
begin
   if openDialog1.execute then
   begin
     SakMsg1.AttachedFiles.add( OpenDialog1.FileName);
     ComboBoxAttachedFiles.items.add( OpenDialog1.FileName);
     ComboBoxAttachedFiles.itemIndex := 0;
   end;
end;

procedure TForm1.ButtonSendClick(Sender: TObject);
begin
   screen.cursor := crHourGlass;
   StatusBar1.Panels[0].Text := 'Wait a moment, please';
   SakSMTP1.host := EditHost.text;
   SakMsg1.CharSet := EditCharSet.Text;
   if ComboBoxEncoding.ItemIndex = 0 then
   begin
     SakMsg1.TextEncoding := te8Bit;
   end else
   begin
     SakMsg1.TextEncoding := teBase64;
   end;
   SakMsg1.UserName := EditUserName.text;
   SakMsg1.From := EditFrom.text;
   SakMsg1.SendTo := EditTo.text;
   SakMsg1.Subject := EditSubject.text;
   SakMsg1.MessageType:=MtHtml;
   SakMsg1.Text.Assign( Memo1.Lines);
   SakSMTP1.connect;
   if not SakSMTP1.SMTPError then
   begin
      BtnCancel.Enabled := true;
      SakSMTP1.SendTheMessage( SakMsg1);
      BtnCancel.Enabled := false;
      SakSMTP1.Disconnect;
      StatusBar1.Panels[0].Text := SakSMTP1.ReplyString;
   end;
   screen.cursor := crDefault;
end;

procedure TForm1.SakSMTP1Error(Sender: TObject; Error: Integer;
  Msg: string);
begin
  showMessage( 'Error: ' + msg);
end;

procedure TForm1.ButtonClearAttachedFilesClick(Sender: TObject);
begin
  ComboBoxAttachedFiles.clear;
  SakMsg1.AttachedFiles.clear;
end;

procedure TForm1.SakSMTP1AfterSend(Sender: TObject);
begin
  ShowMessage( SakSMTP1.replyString);
end;

procedure TForm1.SakSMTP1BeforeSend(Sender: TObject);
begin
  ProgressBar2.Position := 0;
end;

procedure TForm1.SakSMTP1SendProgress(Sender: TObject; Percent: Word);
begin
  ProgressBar2.Position := Percent;
end;

procedure TForm1.BtnCancelClick(Sender: TObject);
begin
  SakSMTP1.Cancel;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ComboBoxEncoding.ItemIndex := 0;
end;

end.
