unit WhatsNew;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, RxRichEd;

type
  TWhats_NEW = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    RichEdit1: TRxRichEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Whats_NEW: TWhats_NEW;

implementation

{$R *.DFM}

procedure TWhats_NEW.Button1Click(Sender: TObject);
begin
   close;
end;

procedure TWhats_NEW.FormShow(Sender: TObject);
begin
  try
    RichEdit1.Lines.LoadFromFile('WhatsNew.rtf');
  except
  end;

end;

end.
