unit Schema;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TFormSchema1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormSchema1: TFormSchema1;

implementation

{$R *.DFM}

procedure TFormSchema1.Button1Click(Sender: TObject);
begin
  Close;
end;

end.

