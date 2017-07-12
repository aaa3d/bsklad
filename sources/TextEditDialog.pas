unit TextEditDialog;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TTEXT_EDIT_DIALOG = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    Memo1: TMemo;
    RadioGroup1: TRadioGroup;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TEXT_EDIT_DIALOG: TTEXT_EDIT_DIALOG;

implementation

{$R *.DFM}

procedure TTEXT_EDIT_DIALOG.FormCreate(Sender: TObject);
begin
    RadioGroup1.ItemIndex:=0;
end;

end.
