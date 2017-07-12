program SlimBsklad;

uses
  Forms,
  MainForm in 'MainForm.pas' {Form1},
  B_utils in '..\B_utils.pas',
  Data1 in 'Data1.pas' {DataModule1: TDataModule},
  FormDebug in '..\FormDebug.pas' {FORM_DEBUG};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Свертка базы данных Арм склад';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFORM_DEBUG, FORM_DEBUG);
  Application.Run;
end.
