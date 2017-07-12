unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frFunction, FR_Class, FR_DCtrl, StdCtrls, FR_Desgn;

type
  TForm1 = class(TForm)
    frReport1: TfrReport;
    frAddFunctionLibrary1: TfrAddFunctionLibrary;
    Button1: TButton;
    frDialogControls1: TfrDialogControls;
    frDesigner1: TfrDesigner;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
 frReport1.DesignReport;
end;

end.
