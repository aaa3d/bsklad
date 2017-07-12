unit AdminSpis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RXSpin,B_Utils,B_DButils, Mask, ToolEdit, CurrEdit;

type
  TAdmin_SPIS = class(TForm)
    BtnOK: TButton;
    BtnClose: TButton;
    Label1: TLabel;
    CheckBox1: TCheckBox;
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
  Admin_SPIS: TAdmin_SPIS;

implementation

{$R *.DFM}

procedure TAdmin_SPIS.BtnOKClick(Sender: TObject);
begin
     tag:=2;
     close;
end;

procedure TAdmin_SPIS.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TAdmin_SPIS.FormShow(Sender: TObject);
begin
     NUM.setfocus;
end;

procedure TAdmin_SPIS.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
end;

end.
