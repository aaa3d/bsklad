program RplEmail;

uses
  LFHeapMemory,
  Forms,
  windows,
  WinTypes, WinProcs, SysUtils,
  MainForm in 'MainForm.pas' {MAIN_FORM},
  SetPeriod in 'SetPeriod.pas' {Set_Period},
  Data1 in 'Data1.pas' {DataModule1: TDataModule},
  SelectTo in 'SelectTo.pas' {Select_TO},
  FormDebug in 'FormDebug.pas' {FORM_DEBUG},
  LastSyncFormUnit in 'LastSyncFormUnit.pas' {LastSyncForm},
  pass in 'pass.pas' {PassForm};

{$R *.RES}



begin


  Application.Initialize;
  Application.CreateForm(TMAIN_FORM, MAIN_FORM);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TPassForm, PassForm);
  Application.Run;

  if AtomText<>'' then
      GlobalDeleteAtom(GlobalFindAtom(pchar(AtomText)));
end.
