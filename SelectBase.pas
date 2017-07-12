unit SelectBase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls,b_Dbutils, ExtCtrls, jpeg;

type
  TSelect_BASE = class(TForm)
    Btn_OK: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    StatusBar1: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure Btn_OKClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
                                                                                         
var
  Select_BASE: TSelect_BASE;

implementation

{$R *.DFM}

procedure TSelect_BASE.FormShow(Sender: TObject);
begin
  tag:=0;
  try
  image1.Picture.LoadFromFile('bsklad.bmp');
  except
  end;
  statusbar1.Panels[0].text:=base_paths[Combobox1.Itemindex+1];
  Btn_OK.setfocus;
end;

procedure TSelect_BASE.Btn_OKClick(Sender: TObject);
begin
   tag:=2;
   close;
end;

procedure TSelect_BASE.ComboBox1Change(Sender: TObject);
begin
    if ((Combobox1.Itemindex<0) or (Combobox1.Itemindex>Combobox1.items.Count-1)) then
    Combobox1.Itemindex:=0;
    statusbar1.Panels[0].text:=base_paths[Combobox1.Itemindex+1];
end;

procedure TSelect_BASE.Button1Click(Sender: TObject);
begin
     Close;
end;

end.
