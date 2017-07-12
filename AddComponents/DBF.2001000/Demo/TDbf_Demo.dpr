program tdbf_demo;

uses
  Forms,
  Calc in 'Calc.pas' {CalcForm},
  CreateTable in 'CreateTable.pas' {CreateTableForm},
  EditTopics in 'EditTopics.pas' {EditTopicsForm},
  Filter in 'Filter.pas' {FilterForm},
  Index in 'Index.pas' {IndexForm},
  Main in 'Main.pas' {MainForm},
  Schema in 'schema.pas' {FormSchema1},
  Schema2 in 'schema2.pas' {FormSchema2},
  Search in 'search.pas' {SearchForm},
  Simple in 'simple.pas' {SimpleForm},
  Db in 'C:\Program Files\Borland\Delphi3\Source\Vcl\db.pas',
  UDbfMemo in '..\Pack4\dbf_units\UDbfMemo.pas',
  UDbfEngine in '..\Pack4\dbf_units\UDbfEngine.pas',
  dbf in '..\Pack4\dbf_units\dbf.pas',
  UDbfPagedFile in '..\Pack4\dbf_units\UDbfPagedFile.pas',
  DBGrids in 'C:\Program Files\Borland\Delphi3\Source\Vcl\dbgrids.pas',
  DBCtrls in 'C:\Program Files\Borland\Delphi3\Source\Vcl\dbctrls.pas',
  DBCommon in 'C:\Program Files\Borland\Delphi3\Source\Vcl\dbcommon.pas',
  DBCGrids in 'C:\Program Files\Borland\Delphi3\Source\Vcl\dbcgrids.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TCalcForm, CalcForm);
  Application.CreateForm(TCreateTableForm, CreateTableForm);
  Application.CreateForm(TEditTopicsForm, EditTopicsForm);
  Application.CreateForm(TFilterForm, FilterForm);
  Application.CreateForm(TIndexForm, IndexForm);
  Application.CreateForm(TFormSchema1, FormSchema1);
  Application.CreateForm(TFormSchema2, FormSchema2);
  Application.CreateForm(TSearchForm, SearchForm);
  Application.CreateForm(TSimpleForm, SimpleForm);
  Application.Run;
end.
