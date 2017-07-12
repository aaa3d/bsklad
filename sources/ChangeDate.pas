unit ChangeDate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit;

type
  TCHANGE_DATE = class(TForm)
    Label1: TLabel;
    DT: TDateEdit;
    Label2: TLabel;
    TM: TMaskEdit;
    BtnOK: TButton;
    Button2: TButton;
    procedure BtnOKClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CHANGE_DATE: TCHANGE_DATE;

implementation

{$R *.DFM}

procedure TCHANGE_DATE.BtnOKClick(Sender: TObject);
begin
     tag:=2;
     close;
end;

procedure TCHANGE_DATE.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#27 then close;
end;

procedure TCHANGE_DATE.Button2Click(Sender: TObject);
begin
     close;
end;

procedure TCHANGE_DATE.FormShow(Sender: TObject);
begin
   tag:=-1;
end;

end.
