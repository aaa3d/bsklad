program OrderImport;

uses
  Forms,
  Unit5 in 'Unit5.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
