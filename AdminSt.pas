unit AdminSt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RXSpin,B_Utils,B_DButils, Mask, ToolEdit, CurrEdit;

type
  TAdmin_ST = class(TForm)
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
  Admin_ST: TAdmin_ST;

implementation

{$R *.DFM}

procedure TAdmin_ST.BtnOKClick(Sender: TObject);
begin
     tag:=2;
     close;
end;

procedure TAdmin_ST.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TAdmin_ST.FormShow(Sender: TObject);
begin
     NUM.setfocus;
end;

procedure TAdmin_ST.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
end;

end.
