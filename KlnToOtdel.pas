unit KlnToOtdel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit;

type
  TKLN_TO_OTDEL = class(TForm)
    Label1: TLabel;
    OTDEL_NAME: TEdit;
    Label2: TLabel;
    DT: TDateEdit;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    DOL_NAME: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KLN_TO_OTDEL: TKLN_TO_OTDEL;

implementation

{$R *.DFM}

procedure TKLN_TO_OTDEL.Button2Click(Sender: TObject);
begin
    close;
end;

procedure TKLN_TO_OTDEL.Button1Click(Sender: TObject);
begin
    tag:=2;
    close;
end;

procedure TKLN_TO_OTDEL.FormShow(Sender: TObject);
begin
    tag:=0;
end;

end.
