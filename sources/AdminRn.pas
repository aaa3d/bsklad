unit AdminRn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RXSpin,B_Utils,B_DButils, Mask, ToolEdit, CurrEdit, RxLookup, Data1;

type
  TAdmin_RN = class(TForm)
    TYP: TComboBox;
    BtnOK: TButton;
    BtnClose: TButton;
    Label1: TLabel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    NUM: TRxCalcEdit;
    RVID: TRxDBLookupCombo;
    Label3: TLabel;
    RN_DOST: TCheckBox;
    DOST_DATE: TDateEdit;
    procedure BtnOKClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Admin_RN: TAdmin_RN;



implementation



{$R *.DFM}

procedure TAdmin_RN.BtnOKClick(Sender: TObject);
begin
     tag:=2;
     close;
end;

procedure TAdmin_RN.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TAdmin_RN.FormShow(Sender: TObject);
begin
     NUM.setfocus;
end;

procedure TAdmin_RN.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
end;

end.
