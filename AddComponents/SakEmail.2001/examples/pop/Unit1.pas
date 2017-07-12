unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, SakPOP3, SakMsg;

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
    ProgressBar2: TProgressBar;
    Label10: TLabel;
    SakPOP1: TSakPOP;
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
    procedure CntClick(Sender: TObject);
    procedure ButtonPriorClick(Sender: TObject);
    procedure ButtonNextClick(Sender: TObject);
    procedure showCurrentMsg;
    procedure ButtonSaveClick(Sender: TObject);
    procedure SakPOP1AfterRetrieve(Sender: TObject);
    procedure SakPOP1DecodeProgress(Sender: TObject; Percent: Word);
    procedure SakPOP1DecodeStart(Sender: TObject; FileName: String;
      BytesCount: Integer);
    procedure SakPOP1RetrieveProgress(Sender: TObject; Percent: Word);
    procedure SakPOP1Error(Sender: TObject; Error: Integer; Msg: String);
    procedure SakPOP1BeforeRetrieve(sender: TObject; id: Word);
    procedure BtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

var currentMsg: integer;

procedure TForm1.CntClick(Sender: TObject);
begin
     SakPOP1.Host := EditHost.text;
     SakPOP1.UserId := EditUserId.text;
     SakPOP1.UserPasswd := EditPasswd.text;

     StatusBar1.Panels[0].text := 'Wait a moment, please...';
     SakPOP1.connect;
     if SakPOP1.POPError then
     begin
         MessageDlg( 'Connect failed. Maybe the server is down or not responding.',
                     mtError, [mbOk], 0);
         exit;
     end;
     if not SakPOP1.login then
     begin
          ShowMessage('Unauthorized access...');
          exit;
     end;
     SakPOP1.Init;
     showMessage( 'You have ' + intToStr( SakPOP1.NewMsgsCount) + ' new msg(s) of ' +
                  intToStr( SakPOP1.MsgsCount));

     BtnCancel.Enabled := true;
     sakPOP1.retrieveAllMessages( SakMsgList1);
     BtnCancel.Enabled := false;
     SakPOP1.Disconnect;
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
          showCurrentMsg;
     end;
end;

procedure TForm1.ButtonNextClick(Sender: TObject);
begin
     if currentMsg < SakMsgList1.count-1 then
     begin
          inc( currentMsg);
          showCurrentMsg;
     end;
end;

procedure TForm1.showCurrentMsg;
var msg: TSakMsg;
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
        end
      else
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

procedure TForm1.SakPOP1AfterRetrieve(Sender: TObject);
begin
     StatusBar1.Panels[0].text := 'Retrieving... ' + intToStr( SakMsgList1.count) +
                                  ' msg(s) retrieved';
end;

procedure TForm1.SakPOP1DecodeProgress(Sender: TObject; Percent: Word);
begin
//     ProgressBar1.Position := Percent;
end;

procedure TForm1.SakPOP1DecodeStart(Sender: TObject; FileName: String;
  BytesCount: Integer);
begin
//     ProgressBar1.Position := 0;
end;


procedure TForm1.SakPOP1RetrieveProgress(Sender: TObject; Percent: Word);
begin
     ProgressBar2.Position := Percent;
end;

procedure TForm1.SakPOP1Error(Sender: TObject; Error: Integer;
  Msg: String);
begin
     ShowMessage( Msg);
end;

procedure TForm1.SakPOP1BeforeRetrieve(sender: TObject; id: Word);
begin
     ProgressBar2.Position := 0;
end;




procedure TForm1.BtnCancelClick(Sender: TObject);
begin
     SakPOP1.Cancel;
end;

end.
