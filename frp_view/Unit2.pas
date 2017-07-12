unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FR_Desgn, FR_Class, ExtCtrls, FR_View;

type
  TForm2 = class(TForm)
    frReport1: TfrReport;
    frDesigner1: TfrDesigner;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

procedure TForm2.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
//   frReport1.FileName:=OpenDialog1.FileName;
//   frReport1.PrepareReport;
   frReport1.LoadPreparedReport(OpenDialog1.FileName);
//   frReport1.LoadFromFile(OpenDialog1.FileName);
   frReport1.ShowPreparedReport;
//   frReport1.ShowReport;

  end

end;

end.
