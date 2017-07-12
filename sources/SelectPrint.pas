unit SelectPrint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TSelect_Print = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    BtnCancel: TButton;
    Image1: TImage;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Select_Print: TSelect_Print;

implementation

{$R *.DFM}

procedure TSelect_Print.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then begin
        key:=#27;
        close;
     end;
     if (key=#49) and Button1.enabled then Button1.click;
     if (key=#50) and Button2.enabled then Button2.click;
     if (key=#51) and Button2.enabled then Button3.click;
     if (key=#52) and Button2.enabled then Button4.click;
     if (key=#53) and Button2.enabled then Button5.click;
end;

procedure TSelect_Print.Button1Click(Sender: TObject);
begin
     tag:=1;
     close;
end;

procedure TSelect_Print.Button2Click(Sender: TObject);
begin
     tag:=2;
     close;
end;

procedure TSelect_Print.Button3Click(Sender: TObject);
begin
     tag:=3;
     close;
end;

procedure TSelect_Print.Button4Click(Sender: TObject);
begin
     tag:=4;
     close;
end;

procedure TSelect_Print.FormShow(Sender: TObject);
begin
     if Button8.Caption='' then
     begin
        Button8.enabled:=false;
        Button8.Visible:=false;
     end;
     if Button9.Caption='' then
     begin
        Button9.enabled:=false;
        Button9.Visible:=false;
     end;

     if Button10.Caption='' then
     begin
        Button10.enabled:=false;
        Button10.Visible:=false;
     end;

     if Button1.Caption='' then begin
        Button1.enabled:=false;
        Button1.Visible:=false;
     end;
     if Button2.Caption='' then begin
        Button2.enabled:=false;
        Button2.Visible:=false;
     end;
     if Button3.Caption='' then begin
        Button3.enabled:=false;
        Button3.Visible:=false;
     end;
     if Button4.Caption='' then begin
        Button4.enabled:=false;
        Button4.Visible:=false;
     end;
     if Button5.Caption='' then begin
        Button5.enabled:=false;
        Button5.Visible:=false;
     end;
     if Button6.Caption='' then begin
        Button6.enabled:=false;
        Button6.Visible:=false;
     end;
     if Button7.Caption='' then begin
        Button7.enabled:=false;
        Button7.Visible:=false;
     end;

     tag:=0;
end;

procedure TSelect_Print.Button5Click(Sender: TObject);
begin
     tag:=5;
     close;
end;

procedure TSelect_Print.BtnCancelClick(Sender: TObject);
begin
     close;
   
end;

procedure TSelect_Print.Button6Click(Sender: TObject);
begin
     tag:=6;
     close;
end;

procedure TSelect_Print.Button7Click(Sender: TObject);
begin
     tag:=7;
     close;
end;

procedure TSelect_Print.Button8Click(Sender: TObject);
begin
     tag:=8;
     close;
end;

procedure TSelect_Print.Button9Click(Sender: TObject);
begin
     tag:=9;
     close;
end;

procedure TSelect_Print.Button10Click(Sender: TObject);
begin
     tag:=10;
     close;
end;

procedure TSelect_Print.Button11Click(Sender: TObject);
begin
     tag:=11;
     close;
end;

procedure TSelect_Print.Button12Click(Sender: TObject);
begin
     tag:=12;
     close;
end;

procedure TSelect_Print.Button13Click(Sender: TObject);
begin
     tag:=13;
     close;
end;

end.
