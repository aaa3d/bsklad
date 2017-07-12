program FRP_VIEW;

uses
  Forms,
  Unit2 in 'Unit2.pas' {Form2};

{$R *.RES}
var fname: string;
begin
  Application.Initialize;



if ParamCount>0 then begin
    fname:=paramstr(1);
    Application.CreateForm(TForm2, Form2);
  Form2.frReport1.LoadPreparedReport(fName);
    Form2.frReport1.ShowPreparedReport;

    exit;
  end
  else
    Application.CreateForm(TForm2, Form2);
  Application.Run;

end.
