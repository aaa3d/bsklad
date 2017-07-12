unit EditText;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TEDIT_TEXT = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EDIT_TEXT: TEDIT_TEXT;

implementation

{$R *.DFM}

end.
