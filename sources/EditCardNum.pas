unit EditCardNum;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, CurrEdit,b_utils,b_Dbutils;

type
  TEDIT_CARDNUM = class(TForm)
    Label2: TLabel;
    PERCENT: TRxCalcEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    OPIS: TEdit;
    DT1: TDateEdit;
    DT2: TDateEdit;
    TYP: TComboBox;
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
  EDIT_CARDNUM: TEDIT_CARDNUM;

implementation

{$R *.DFM}

procedure TEDIT_CARDNUM.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TEDIT_CARDNUM.Button1Click(Sender: TObject);
begin
  if trim(OPIS.text)='' then Messbox('Описание не может быть пустой строкой!',MessSystem,48) else begin
     tag:=2;
     close;
  end;
end;

procedure TEDIT_CARDNUM.FormShow(Sender: TObject);
begin
  tag:=0;
end;

procedure TEDIT_CARDNUM.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then begin
    key:=#0;
    close;
  end;
end;

end.
