unit AdminOplata;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RXSpin,B_Utils,B_DButils, Mask, ToolEdit, CurrEdit;

type
  TAdmin_OPLATA = class(TForm)
    BtnOK: TButton;
    BtnClose: TButton;
    Label1: TLabel;
    NUM: TRxCalcEdit;
    procedure BtnOKClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Admin_OPLATA: TAdmin_OPLATA;

implementation

{$R *.DFM}

procedure TAdmin_OPLATA.BtnOKClick(Sender: TObject);
begin
     tag:=2;
     close;
end;

procedure TAdmin_OPLATA.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TAdmin_OPLATA.FormShow(Sender: TObject);
begin
     NUM.setfocus;
end;

procedure TAdmin_OPLATA.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
end;

end.
