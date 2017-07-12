unit AboutForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TAbout_Form = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  About_Form: TAbout_Form;

implementation

{$R *.DFM}

procedure TAbout_Form.Button1Click(Sender: TObject);
begin
     close;
end;

end.
