program rbREProj;

uses
  Forms,
  rbEndUsr in 'rbEndUsr.pas' {myEndUserSolution},
  rbExpFrm in 'rbExpFrm.pas' {myReportExplorerForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TmyEndUserSolution, myEndUserSolution);
  Application.CreateForm(TmyReportExplorerForm, myReportExplorerForm);
  Application.Run;
end.
