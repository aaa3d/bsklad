unit KlnWarn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TKLN_WARN = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    ARM_INN: TEdit;
    ARM_NAME: TMemo;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    C_INN: TEdit;
    C_NAME: TMemo;
    Button1: TButton;
    Button2: TButton;
    Label4: TLabel;
    KLN_ID: TEdit;
    chhApplyToAll: TCheckBox;
    STOP_IMPORT: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure STOP_IMPORTClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KLN_WARN: TKLN_WARN;

implementation

{$R *.DFM}

procedure TKLN_WARN.Button1Click(Sender: TObject);
begin
	tag:=1;
    close;
end;

procedure TKLN_WARN.Button2Click(Sender: TObject);
begin
	tag:=2;
    close;
end;

procedure TKLN_WARN.FormShow(Sender: TObject);
begin
	tag:=0;
end;

procedure TKLN_WARN.STOP_IMPORTClick(Sender: TObject);
begin
  STOP_IMPORT.tag:=1;
  close;
end;

end.
