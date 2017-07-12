unit SetData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit;

type
  TSet_DATA = class(TForm)
    DT: TDateEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Set_DATA: TSet_DATA;

implementation

{$R *.DFM}

procedure TSet_DATA.FormShow(Sender: TObject);
begin
  tag:=0;
end;

procedure TSet_DATA.Button2Click(Sender: TObject);
begin
        close;
end;

procedure TSet_DATA.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then begin
    key:=#0;
    close;
  end;
end;

procedure TSet_DATA.Button1Click(Sender: TObject);
begin
   tag:=2;
   close;
end;

end.
