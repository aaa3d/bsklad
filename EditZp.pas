unit EditZp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TEDIT_ZP = class(TForm)
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BtnOk: TButton;
    BtnClose: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EDIT_ZP: TEDIT_ZP;

implementation

{$R *.DFM}

procedure TEDIT_ZP.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#27 then BtnClose.click;
    if (key=#13) and (BtnOk.enabled) then begin
       key:=#0;
       BtnOk.click;
    end;
end;

procedure TEDIT_ZP.BtnCloseClick(Sender: TObject);
begin
    close;
end;

procedure TEDIT_ZP.FormShow(Sender: TObject);
begin
    tag:=0;
end;

procedure TEDIT_ZP.BtnOkClick(Sender: TObject);
begin
   if RadioButton1.Checked then tag:=1;
   if RadioButton2.Checked then tag:=2;
   close;
end;

end.
