unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, SakPOP3, SakMsg, SakIMAP;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Cnt: TButton;
    EditHost: TEdit;
    EditUserId: TEdit;
    EditPasswd: TEdit;
    ButtonNext: TButton;
    ButtonPrior: TButton;
    LabelFrom: TLabel;
    LabelTo: TLabel;
    LabelSubject: TLabel;
    SakMsgList1: TSakMsgList;
    ComboBoxAttach: TComboBox;
    Label2: TLabel;
    ButtonSave: TButton;
    SaveDialog1: TSaveDialog;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    LabelDate: TLabel;
    ProgressBar1: TProgressBar;
    Label10: TLabel;
    Label11: TLabel;
    LabelReplyTo: TLabel;
    Label12: TLabel;
    LabelInReplyTo: TLabel;
    Label14: TLabel;
    LabelMsgId: TLabel;
    BtnCancel: TButton;
    Label8: TLabel;
    LabelReturnPath: TLabel;
    Label13: TLabel;
    labelContentType: TLabel;
    Label15: TLabel;
    LabelEncoding: TLabel;
    Label16: TLabel;
    LabelSender: TLabel;
    Label17: TLabel;
    LabelCC: TLabel;
    SakIMAP1: TSakIMAP;
    procedure CntClick(Sender: TObject);
    procedure ButtonPriorClick(Sender: TObject);
    procedure ButtonNextClick(Sender: TObject);
    procedure showCurrentMsg;
    procedure ButtonSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure SakIMAP1Error(Sender: TObject; Error: Integer; Msg: String);
    procedure SakIMAP1AfterRetrieve(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

var
  currentMsg: integer;

procedure TForm1.CntClick(Sender: TObject);
begin
  SakIMAP1.Host := EditHost.text;
  SakIMAP1.UserId := EditUserId.text;
  SakIMAP1.UserPasswd := EditPasswd.text;

  StatusBar1.Panels[0].text := 'Wait a moment, please...';

  if not SakIMAP1.Connect then
  begin
    MessageDlg( 'Connect failed. Maybe the server is down or not responding.',
                mtError, [mbOk], 0);
    exit;
  end;

  if not SakIMAP1.Login then
  begin
    ShowMessage('Unauthorized access...');
    exit;
  end;

  SakIMAP1.SelectFolder('INBOX');
  showMessage( 'You have ' + intToStr( SakIMAP1.NewMsgsCount) + ' new msg(s) of ' +
               intToStr( SakIMAP1.MsgsCount));

  ProgressBar1.Max := SakIMAP1.MsgsCount;
  ProgressBar1.Position := 0;
  BtnCancel.Enabled := true;
  SakIMAP1.RetrieveAllMessages( SakMsgList1);
  BtnCancel.Enabled := false;

  SakIMAP1.Disconnect;
  if SakMsgList1.count > 0 then
  begin
    currentMsg := 0;
    showCurrentMsg;
  end;
  StatusBar1.Panels[0].text := 'Done. ' + intToStr( SakMsgList1.count) + ' msgs retrieved.';
end;


procedure TForm1.ButtonPriorClick(Sender: TObject);
begin
  if currentMsg > 0 then
  begin
    dec( currentMsg);
    ShowCurrentMsg;
  end;
end;

procedure TForm1.ButtonNextClick(Sender: TObject);
begin
  if currentMsg < SakMsgList1.count-1 then
  begin
    inc( currentMsg);
    ShowCurrentMsg;
  end;
end;

procedure TForm1.ShowCurrentMsg;
var
  msg: TSakMsg;
  i: integer;
begin
  msg := SakMsgList1.items[ currentMsg];
  labelMsgId.Caption := msg.MessageId;
  labelInReplyTo.Caption := msg.InReplyTo;
  labelFrom.caption := msg.From;
  labelTo.caption := msg.SendTo;
  labelSubject.caption := msg.Subject;
  labelDate.caption := msg.Date;
  labelReplyTo.Caption := msg.ReplyTo;
  labelReturnPath.Caption := msg.ReturnPath;
  labelContentType.Caption := msg.ContentType;
  LabelEncoding.Caption := msg.ContentTransferEncoding;
  LabelSender.Caption := msg.Sender;
  LabelCC.Caption := msg.CC;
  memo1.text := msg.Text.Text;        {msg.Text is a StringList}
  if msg.AttachedFiles.Count > 0 then
  begin
    comboBoxAttach.items.clear;
    for i := 0 to msg.AttachedFiles.Count-1 do
      comboBoxAttach.items.add( msg.AttachedFiles[ i].fileName);
    comboBoxAttach.enabled := true;
    comboBoxAttach.itemIndex := 0;
    buttonSave.enabled := true;
  end else
  begin
    comboBoxAttach.enabled := false;
    buttonSave.enabled := false;
  end;
end;

procedure TForm1.ButtonSaveClick(Sender: TObject);
begin
  saveDialog1.FileName := comboBoxAttach.text;
  if saveDialog1.execute then
    SakMsgList1[ currentMsg].AttachedFiles[ comboBoxAttach.itemIndex].saveToFile( saveDialog1.FileName);
end;

procedure TForm1.BtnCancelClick(Sender: TObject);
begin
  SakIMAP1.Cancel;
end;

procedure TForm1.SakIMAP1Error(Sender: TObject; Error: Integer;
  Msg: String);
begin
  ShowMessage( Msg);
end;

procedure TForm1.SakIMAP1AfterRetrieve(Sender: TObject);
begin
  ProgressBar1.StepIt;
  StatusBar1.Panels[0].text := 'Retrieving... ' + intToStr( SakMsgList1.count) +
                               ' msg(s) retrieved';
end;

end.
