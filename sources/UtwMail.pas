unit UtwMail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TUTW_MAIL = class(TForm)
    Button1: TButton;
    Button2: TButton;
    UTW1: TCheckBox;
    UTW2: TCheckBox;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UTW_MAIL: TUTW_MAIL;

implementation

{$R *.DFM}

procedure TUTW_MAIL.Button1Click(Sender: TObject);
begin
   tag:=2;
   close;
end;

procedure TUTW_MAIL.Button2Click(Sender: TObject);
begin
   close;
end;

procedure TUTW_MAIL.FormShow(Sender: TObject);
begin
   tag:=0;
end;

end.
