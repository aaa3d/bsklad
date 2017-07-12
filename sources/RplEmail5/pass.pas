unit pass;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, data1, Db, IBCustomDataSet, IBQuery, IBDatabase;

type
  TPassForm = class(TForm)
    Label1: TLabel;
    password: TEdit;
    Button1: TButton;
    GroupBox1: TGroupBox;
    newPassword: TEdit;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    Button2: TButton;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PassForm: TPassForm;
  passID: integer;
  passwd: string;

implementation

{$R *.DFM}

procedure TPassForm.FormShow(Sender: TObject);
begin
   password.Text := '';
   newPassword.Text:='';
   checkbox1.Checked := false;
//   groupBox1.Enabled:=false;
   passID := -1;
   passwd := 'FIRST';
//   tag := 0;
   try

   IBQuery1.Open;
   if not IBQuery1.eof then
        begin
        passId := IBQuery1.fieldbyname('CFG_ID').asinteger;
        passwd := IBQuery1.fieldbyname('CFG_VALUE').asstring;
        end;
   ibquery1.close;

   except
   end;
end;

procedure TPassForm.CheckBox1Click(Sender: TObject);
begin
    button2.Enabled := checkbox1.Checked;
end;

procedure TPassForm.Button1Click(Sender: TObject);
begin
  if password.Text = passwd then
  begin
    groupBox1.Enabled:=true;
    groupbox1.font.Color := clRed;
    tag := 2;
  end
  else
  begin
  password.SelectAll;
  password.SetFocus;
  end;
end;

procedure TPassForm.Button2Click(Sender: TObject);
begin
        passwd := newPassword.Text;
        ibsave_clear;
        ibsave_add('cfg_name','RPL_PASSWORD');
        ibsave_add('cfg_value', passwd);
        passID:=ibsave_doc('CFG', passID);
        Datamodule1.IBTransaction2.Commit;
end;

end.
