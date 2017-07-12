program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {test1Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(Ttest1Form1, test1Form1);
  Application.Run;
end.
