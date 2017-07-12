program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  CustPrev in 'CustPrev.pas' {fCustomPreview};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfCustomPreview, fCustomPreview);
  Application.Run;
end.
