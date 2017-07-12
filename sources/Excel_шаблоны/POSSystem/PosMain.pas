unit PosMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Async32, frxClass;

type
  TPOS_MAIN = class(TForm)
    Comm1: TComm;
    Memo1: TMemo;
    Button1: TButton;
    procedure Comm1RxChar(Sender: TObject; Count: Integer);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  POS_MAIN: TPOS_MAIN;

implementation

{$R *.dfm}

procedure TPOS_MAIN.Comm1RxChar(Sender: TObject; Count: Integer);
var buf: array [0..4096] of char;
  i: integer;
begin
 for i := 0 to 4095 do
  buf[i]:=chr(0);

  (sender as TComm).Read(buf, Count);

  memo1.Text:=memo1.Text+buf;

end;

procedure TPOS_MAIN.Button1Click(Sender: TObject);
begin

 Comm1.Open;
end;

end.
