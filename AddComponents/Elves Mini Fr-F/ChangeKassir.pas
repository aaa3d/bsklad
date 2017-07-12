unit ChangeKassir;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXSpin, StdCtrls, ExtCtrls;

type
  TChange_kassir = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    password: TEdit;
    BtnOk: TButton;
    BtnCancel: TButton;
    NUM: TRxSpinEdit;
    Image1: TImage;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOkClick(Sender: TObject);
    procedure passwordKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Change_kassir: TChange_kassir;

implementation

{$R *.DFM}

procedure TChange_kassir.FormShow(Sender: TObject);
begin
   tag:=0;
   
end;

procedure TChange_kassir.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#27 then begin
      key:=#0;
      close;
   end;
   if key=#13 then begin
      key:=#0;
      BtnOk.setfocus;
      BtnOk.click;
   end;
end;

procedure TChange_kassir.BtnOkClick(Sender: TObject);
begin
  tag:=2;
  close;
end;

procedure TChange_kassir.passwordKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#9;
      BtnOk.setfocus;
      BtnOk.click;
   end;
end;

procedure TChange_kassir.BtnCancelClick(Sender: TObject);
begin
   close;
end;

end.
