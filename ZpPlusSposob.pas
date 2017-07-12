unit ZpPlusSposob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, CurrEdit;

type
  TZP_PLUS_SPOSOB = class(TForm)
    Check_summ1: TRadioButton;
    Summ1: TRxCalcEdit;
    Check_summ2: TRadioButton;
    Summ2_1: TRxCalcEdit;
    Summ2_2: TRxCalcEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Check_tabel: TCheckBox;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Check_summ1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZP_PLUS_SPOSOB: TZP_PLUS_SPOSOB;

implementation

{$R *.DFM}

procedure TZP_PLUS_SPOSOB.Button1Click(Sender: TObject);
begin
   tag:=2;
   close;
end;

procedure TZP_PLUS_SPOSOB.FormShow(Sender: TObject);
begin
   tag:=0;
   Check_summ1.Onclick(Sender);
end;

procedure TZP_PLUS_SPOSOB.Button2Click(Sender: TObject);
begin
    close;
end;

procedure TZP_PLUS_SPOSOB.Check_summ1Click(Sender: TObject);
begin
   Summ1.enabled:=Check_summ1.checked;
   Summ2_1.enabled:=Check_summ2.checked;
   Summ2_2.enabled:=Check_summ2.checked;
end;

end.
