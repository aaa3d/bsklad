program informer;

uses
  Forms,
  mainform in 'mainform.pas' {MAIN_FORM};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMAIN_FORM, MAIN_FORM);
  Application.Run;
end.
