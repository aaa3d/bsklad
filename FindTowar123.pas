unit FindTowar123;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, RXSpin;

type
  TFind_Towar_123 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Btn_Find: TButton;
    Btn_Close: TButton;
    MaskEdit1: TRxSpinEdit;
    procedure FormShow(Sender: TObject);
    procedure Btn_CloseClick(Sender: TObject);
    procedure Btn_FindClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Find_Towar_123: TFind_Towar_123;

implementation

uses DicTowar;

{$R *.DFM}

procedure TFind_Towar_123.FormShow(Sender: TObject);
begin
     tag:=0;
     Find_Towar_123.Top:=Dic_Towar.Top;
     Find_Towar_123.Left:=Dic_Towar.Left;
end;

procedure TFind_Towar_123.Btn_CloseClick(Sender: TObject);
begin
     close;
end;

procedure TFind_Towar_123.Btn_FindClick(Sender: TObject);
begin
     tag:=2;
     close;
end;

procedure TFind_Towar_123.FormActivate(Sender: TObject);
begin
     MaskEdit1.SelStart:=1;
     MaskEdit1.setfocus;
end;

procedure TFind_Towar_123.MaskEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
     if key=#13 then begin
        key:=#9;
        Btn_Find.click;
     end;
end;

procedure TFind_Towar_123.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then Btn_Close.click;
end;

end.
