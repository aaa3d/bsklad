unit SetPnPrint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TSet_PNPRINT = class(TForm)
    BtnCLose: TButton;
    Btn1: TButton;
    Btn2: TButton;
    procedure FormShow(Sender: TObject);
    procedure Btn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Btn2Click(Sender: TObject);
    procedure BtnCLoseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Set_PNPRINT: TSet_PNPRINT;

implementation

{$R *.DFM}

procedure TSet_PNPRINT.FormShow(Sender: TObject);
begin
     tag:=0;
end;

procedure TSet_PNPRINT.Btn1Click(Sender: TObject);
begin
     tag:=1;
     close;
end;

procedure TSet_PNPRINT.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then BtnClose.click;
end;

procedure TSet_PNPRINT.Btn2Click(Sender: TObject);
begin
     tag:=2;
     close;
end;

procedure TSet_PNPRINT.BtnCLoseClick(Sender: TObject);
begin
     close;
end;

end.
