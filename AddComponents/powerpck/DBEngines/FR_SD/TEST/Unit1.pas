unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SDEngine, DB, StdCtrls, FR_Class, FR_SDDB, FR_Desgn, FR_DCtrl,
  frFunction, DBTables;

type
  TForm1 = class(TForm)
    SDDatabase1: TSDDatabase;
    SDQuery1: TSDQuery;
    SDStoredProc1: TSDStoredProc;
    SDSession1: TSDSession;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    frReport1: TfrReport;
    Button4: TButton;
    frAddFunctionLibrary1: TfrAddFunctionLibrary;
    frDialogControls1: TfrDialogControls;
    frDesigner1: TfrDesigner;
    Button5: TButton;
    StoredProc1: TStoredProc;
    Database1: TDatabase;
    Button6: TButton;
    frSDComponents1: TfrSDComponents;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
 SDSession1.GetStoredProcNames(SDDatabase1.DatabaseName,Memo1.Lines)
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 SDSession1.GetTableNames(SDDatabase1.DatabaseName,'',True,Memo1.Lines);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 SDSession1.GetTableFieldNames(SDDatabase1.DatabaseName,Edit1.Text,Memo1.Lines);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  oSDDataSet :TSDDataSet;

begin

  frReport1.DesignReport;


end;

procedure TForm1.Button5Click(Sender: TObject);
begin

 SDStoredProc1.StoredProcName := 'DB2AS.PROC7';
 SDStoredProc1.Prepare;
 SDStoredProc1.Open;
 SDStoredProc1.Close;
 SDStoredProc1.FieldDefs.Update;
 SDStoredProc1.ParamByName('N').AsInteger := 10;
 SDStoredProc1.Open;
 MessageDlg('q', mtWarning, [mbOK], 0);

end;

procedure TForm1.Button6Click(Sender: TObject);
begin
 StoredProc1.StoredProcName := 'DB2AS.PROC7';
 StoredProc1.Prepare;
 StoredProc1.Open;
 StoredProc1.Close;
 StoredProc1.FieldDefs.Update;
 StoredProc1.ParamByName('N').AsInteger := 10;
 StoredProc1.Open;
end;

end.
