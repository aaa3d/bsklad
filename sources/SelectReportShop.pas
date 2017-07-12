unit SelectReportShop;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TSELECT_REPORT_SHOP = class(TForm)
    Memo1: TMemo;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SELECT_REPORT_SHOP: TSELECT_REPORT_SHOP;

implementation

{$R *.DFM}

procedure TSELECT_REPORT_SHOP.FormShow(Sender: TObject);
begin
   tag:=0;
   Radiogroup1.ItemIndex:=0;
end;

procedure TSELECT_REPORT_SHOP.Button2Click(Sender: TObject);
begin
   close;
end;

procedure TSELECT_REPORT_SHOP.Button1Click(Sender: TObject);
begin
   tag:=Radiogroup1.ItemIndex+1;
   close;
end;

end.
