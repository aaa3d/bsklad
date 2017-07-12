unit DecSumm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, CurrEdit,b_utils;

type
  TDEC_SUMM = class(TForm)
    SUMM: TRxCalcEdit;
    BtnOk: TButton;
    BtnCancel: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure BtnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DEC_SUMM: TDEC_SUMM;

implementation

{$R *.DFM}

procedure TDEC_SUMM.BtnCancelClick(Sender: TObject);
begin
   close;
end;

procedure TDEC_SUMM.FormShow(Sender: TObject);
begin
   tag:=0;
end;

procedure TDEC_SUMM.BtnOkClick(Sender: TObject);
begin
   if summ.value<=0 then messbox('�������� ����� �� ����� ���� ������� ��� �������������!','������!',16)
   else begin
     tag:=2;
     close;
   end;
end;

procedure TDEC_SUMM.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then begin
    key:=#0;
    close;
  end;
  if key=#13 then begin
    BtnOk.Setfocus;
    BtnOk.click;
  end;
end;

end.
