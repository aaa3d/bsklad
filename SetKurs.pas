unit SetKurs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, CurrEdit, ExtCtrls;

type
  TSET_KURS = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    OLD_KURS: TRxCalcEdit;
    NEW_KURS: TRxCalcEdit;
    BTN_SAVE: TButton;
    Btn_Cancel: TButton;
    Label3: TLabel;
    Edit1: TEdit;
    Image3: TImage;
    procedure FormShow(Sender: TObject);
    procedure BTN_SAVEClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Btn_CancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SET_KURS: TSET_KURS;

implementation

{$R *.DFM}

procedure TSET_KURS.FormShow(Sender: TObject);
begin
     tag:=0;
     NEW_KURS.setfocus;
end;

procedure TSET_KURS.BTN_SAVEClick(Sender: TObject);
begin
     tag:=2;
     close;
end;

procedure TSET_KURS.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
     if key=#10 then begin
        Key:=#13;
        NEW_KURS.setfocus;
        BTN_SAVE.setfocus;
        BTN_SAVE.click;
     end;
end;

procedure TSET_KURS.Btn_CancelClick(Sender: TObject);
begin
     close;
end;

end.
