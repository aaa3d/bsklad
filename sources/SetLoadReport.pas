unit SetLoadReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TSET_LOAD_REPORT = class(TForm)
    RadioButton1: TRadioButton;
    Memo1: TMemo;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    Button1: TButton;
    Button2: TButton;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SET_LOAD_REPORT: TSET_LOAD_REPORT;

implementation

{$R *.DFM}

procedure TSET_LOAD_REPORT.FormShow(Sender: TObject);
begin
   tag:=0;
end;

procedure TSET_LOAD_REPORT.Button1Click(Sender: TObject);
begin
   if Radiobutton1.checked then Tag:=1;
   if Radiobutton2.checked then Tag:=2;
   if Radiobutton3.checked then Tag:=3;
   if Radiobutton4.checked then Tag:=4;
   if Radiobutton5.checked then Tag:=5;
   if Radiobutton6.checked then Tag:=6;
   if Radiobutton7.checked then Tag:=7;
   if Radiobutton8.checked then Tag:=8;
   if Radiobutton9.checked then Tag:=9;
   if Radiobutton10.checked then Tag:=10;
   close;
end;

end.
