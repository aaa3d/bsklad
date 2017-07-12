unit WaitForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Gauges;

type
  TWait_Form = class(TForm)
    Gauge1: TGauge;
    StatusBar1: TStatusBar;
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Wait_Form: TWait_Form;

implementation

{$R *.DFM}

procedure TWait_Form.FormPaint(Sender: TObject);
begin
     Wait_Form.top:=60;
     Wait_Form.Left:=Screen.Width-Wait_Form.Width-20;
end;

end.
