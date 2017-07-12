unit SelectTo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls,Mainform;

type
  TSelect_TO = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    BtnOk: TButton;
    BtnClose: TButton;
    StatusBar1: TStatusBar;
    procedure ComboBox1Change(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Select_TO: TSelect_TO;

implementation

{$R *.DFM}

procedure TSelect_TO.ComboBox1Change(Sender: TObject);
begin
   if Combobox1.itemindex<0 then Combobox1.itemindex:=0;
   statusbar1.panels[0].text:=Arrshops[Combobox1.itemindex+1].addres;
end;

procedure TSelect_TO.BtnCloseClick(Sender: TObject);
begin
   close;
end;

procedure TSelect_TO.BtnOkClick(Sender: TObject);
begin
   tag:=2;
   close;
end;

procedure TSelect_TO.FormShow(Sender: TObject);
var
  a:integer;
begin
    // Наполняем справочник магазинов
    tag:=0;
    Combobox1.items.clear;
    for a:=1 to CntShops do Combobox1.items.add(ArrShops[a].name);
    Combobox1.itemindex:=0;
    ComboBox1Change(Sender);
end;

procedure TSelect_TO.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#27 then begin
      key:=#0;
      close;
   end;
end;

procedure TSelect_TO.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then begin
      key:=#0;
      BtnOk.SetFocus;
      BtnOk.click;
    end;
end;

end.

