unit Index;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Grids, DBGrids, ComCtrls;

type
  TIndexForm = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  IndexForm: TIndexForm;

implementation

uses Main;

{$R *.DFM}

procedure TIndexForm.Button2Click(Sender: TObject);
begin
  MainForm.DbfDisco.IndexName:='AUTHOR.NDX';
end;

procedure TIndexForm.Button3Click(Sender: TObject);
begin
  MainForm.DbfDisco.IndexName:='TITLE.NDX';
end;

procedure TIndexForm.Button4Click(Sender: TObject);
begin
  MainForm.DbfDisco.IndexName:='';
end;

procedure TIndexForm.Button1Click(Sender: TObject);
begin
  Close;
end;

end.

