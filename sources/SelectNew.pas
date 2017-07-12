unit SelectNew;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TSelect_NEW = class(TForm)
    Button1: TButton;
    Button2: TButton;
    BtnCancel: TButton;
    Image1: TImage;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Select_NEW: TSelect_NEW;

implementation

{$R *.DFM}

procedure TSelect_NEW.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
     if (key=#49) and Button1.enabled then Button1.click;
     if (key=#50) and Button2.enabled then Button2.click;
//     if (key=#51) and Button2.enabled then Button3.click;
//     if (key=#52) and Button2.enabled then Button4.click;
end;

procedure TSelect_NEW.Button1Click(Sender: TObject);
begin
     tag:=1;
     close;
end;

procedure TSelect_NEW.Button2Click(Sender: TObject);
begin
     tag:=2;
     close;
end;

procedure TSelect_NEW.Button3Click(Sender: TObject);
begin
     tag:=3;
     close;
end;

procedure TSelect_NEW.Button4Click(Sender: TObject);
begin
     tag:=4;
     close;
end;

procedure TSelect_NEW.FormShow(Sender: TObject);
begin
     if Button1.Caption='' then begin
        Button1.enabled:=false;
        Button1.Visible:=false;
     end;
     if Button2.Caption='' then begin
        Button2.enabled:=false;
        Button2.Visible:=false;
     end;
{     if Button3.Caption='' then begin
        Button3.enabled:=false;
        Button3.Visible:=false;
     end;
     if Button4.Caption='' then begin
        Button4.enabled:=false;
        Button4.Visible:=false;
     end;}
     tag:=0;
end;

end.
