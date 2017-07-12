unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBTables, DB, FR_Class, FR_DSet, FR_Desgn, FR_Cross;

type
  TForm1 = class(TForm)
    Table1: TTable;
    frReport1: TfrReport;
    Button2: TButton;
    frDesigner1: TfrDesigner;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button2Click(Sender: TObject);
begin
  frReport1.DesignReport;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Table1.DatabaseName := ExtractFilePath(Application.ExeName);
end;

end.
