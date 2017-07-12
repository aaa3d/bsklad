unit SetKolvo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, CurrEdit;

type
  TSet_KOLVO = class(TForm)
    Label1: TLabel;
    NAME: TEdit;
    Label2: TLabel;
    KOL: TRxCalcEdit;
    BtnOk: TButton;
    BtnClose: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure KOLKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Set_KOLVO: TSet_KOLVO;

implementation

{$R *.DFM}

procedure TSet_KOLVO.FormShow(Sender: TObject);
begin
     tag:=0;
end;

procedure TSet_KOLVO.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
end;

procedure TSet_KOLVO.KOLKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then BtnOk.click;
end;

procedure TSet_KOLVO.FormActivate(Sender: TObject);
begin
     Kol.Text:='';
     Kol.setFocus;
end;

procedure TSet_KOLVO.BtnOkClick(Sender: TObject);
begin
     if KOL.text='' then KOL.text:='0';
     tag:=2;
     close;
end;

end.
