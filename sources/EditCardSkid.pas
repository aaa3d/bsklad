unit EditCardSkid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, CurrEdit;

type
  TEDIT_CARDSKID = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    SUMM: TRxCalcEdit;
    PERCENT: TRxCalcEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EDIT_CARDSKID: TEDIT_CARDSKID;

implementation

{$R *.DFM}

procedure TEDIT_CARDSKID.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TEDIT_CARDSKID.Button1Click(Sender: TObject);
begin
   tag:=2;
   close;
end;

procedure TEDIT_CARDSKID.FormShow(Sender: TObject);
begin
  tag:=0;
end;

procedure TEDIT_CARDSKID.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then begin
    key:=#0;
    close;
  end;
end;

end.
