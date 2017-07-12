unit Search;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Grids, DBGrids, ComCtrls,db;

type
  TSearchForm = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    title_edit: TEdit;
    Button3: TButton;
    Button2: TButton;
    author_edit: TEdit;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure title_editChange(Sender: TObject);
    procedure author_editChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure title_editEnter(Sender: TObject);
    procedure author_editEnter(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  SearchForm: TSearchForm;

implementation

uses Main;

{$R *.DFM}

procedure TSearchForm.Button4Click(Sender: TObject);
begin
  MainForm.DbfDisco.IndexName:='';
end;

procedure TSearchForm.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TSearchForm.RadioButton1Click(Sender: TObject);
begin
  MainForm.DbfDisco.IndexName:='AUTHOR.NDX';
end;

procedure TSearchForm.RadioButton2Click(Sender: TObject);
begin
  MainForm.DbfDisco.IndexName:='TITLE.NDX';
end;

procedure TSearchForm.title_editChange(Sender: TObject);
begin
  MainForm.DbfDisco.Locate('TITLE',title_Edit.text,[loCaseInsensitive	,loPartialKey]);
end;

procedure TSearchForm.author_editChange(Sender: TObject);
begin
  MainForm.DbfDisco.Locate('AUTHOR',author_Edit.text,[loCaseInsensitive	,loPartialKey]);
end;

procedure TSearchForm.Button2Click(Sender: TObject);
begin
  MainForm.DbfDisco.IndexName:='AUTHOR.NDX';
end;

procedure TSearchForm.Button3Click(Sender: TObject);
begin
  MainForm.DbfDisco.IndexName:='TITLE.NDX';
end;

procedure TSearchForm.title_editEnter(Sender: TObject);
begin
  author_Edit.text:='';
end;

procedure TSearchForm.author_editEnter(Sender: TObject);
begin
  title_Edit.text:='';
end;

end.

