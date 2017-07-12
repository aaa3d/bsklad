unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBDatabase, Db, IBCustomDataSet, IBQuery, StdCtrls;

type
  TForm1 = class(TForm)
    IBDatabase1: TIBDatabase;
    QueryWork: TIBQuery;
    IBTransaction1: TIBTransaction;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
 db_server_string: string;
    ftp_server: string;
    ftp_user: string;
    ftp_pass: string;
    export_catalog_id: integer;
    out_filename: string;
    ftp_filename: string;

    f: text;
    str: string;

    export_param: integer;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var f1: textfile;
begin
     assignfile(f1, out_filename);
     rewrite(f1);
     QueryWork.sql.Text:='select out_str from EXP_ZAYS_TO_1S(:in_frm_id)';
     QueryWork.ParamByname('IN_FRM_ID').asinteger:=0;
     QueryWork.Open;
     while not QueryWork.eof do begin
       writeln(F1,QueryWork.fieldByname('out_str').asString);
       QueryWork.next;
     end;
     querywork.Close;
     closefile(f1);
end;

end.
 