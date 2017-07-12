unit SetJouDate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit;

type
  TSet_JouDate = class(TForm)
    Label1: TLabel;
    DateEdit1: TDateEdit;
    BtnOk: TButton;
    Button2: TButton;
    procedure BtnOkClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DateEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Set_JouDate: TSet_JouDate;

implementation

{$R *.DFM}

procedure TSet_JouDate.BtnOkClick(Sender: TObject);
begin
     tag:=2;
     close;
end;

procedure TSet_JouDate.Button2Click(Sender: TObject);
begin
     close;
end;

procedure TSet_JouDate.FormShow(Sender: TObject);
begin
     tag:=0;
     DateEdit1.SetFocus;
end;

procedure TSet_JouDate.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
end;

procedure TSet_JouDate.DateEdit1KeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then begin
        key:=#0;
        BtnOk.click;
     end;
end;

end.
