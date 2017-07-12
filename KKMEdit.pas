unit KKMEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,b_utils;

type
  TKKM_EDIT = class(TForm)
    Label1: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Button2: TButton;
    Label2: TLabel;
    Button1: TButton;
    procedure RadioButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KKM_EDIT: TKKM_EDIT;

implementation

{$R *.DFM}

procedure TKKM_EDIT.RadioButton2Click(Sender: TObject);
var
   W:integer;
begin
//  if Radiobutton2.checked then W:=17
//  else W:=9;
//  Edit1.MaxLength:=w;

  if (Radiobutton2.checked) then
	Edit1.text:='1'+copy(Edit1.text, 2, length(edit1.text))
  else  Edit1.text:='2'+copy(Edit1.text, 2, length(edit1.text));


end;

procedure TKKM_EDIT.Button1Click(Sender: TObject);
begin
  Edit1.text:=Edit1.text;
  tag:=2;
   close;
end;

procedure TKKM_EDIT.Button2Click(Sender: TObject);
begin
        close;
end;

procedure TKKM_EDIT.FormShow(Sender: TObject);
begin
        tag:=0;
        Radiobutton2click(Sender);
end;

end.
