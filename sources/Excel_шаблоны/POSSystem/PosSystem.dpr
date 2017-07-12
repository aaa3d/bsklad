program PosSystem;

uses
  Forms,
  PosMain in 'PosMain.pas' {POS_MAIN};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPOS_MAIN, POS_MAIN);
  Application.Run;
end.
