unit Schema2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TFormSchema2 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormSchema2: TFormSchema2;

implementation

{$R *.DFM}

procedure TFormSchema2.Button1Click(Sender: TObject);
begin
  Close;
end;

end.

