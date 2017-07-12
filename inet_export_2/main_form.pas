unit main_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IBDatabase, DB, IBCustomDataSet, IBQuery, IdBaseComponent,
  IdComponent, IdUDPBase, IdUDPClient, IdTrivialFTP, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, IBSQL;

type
  TForm6 = class(TForm)
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    Button1: TButton;
    IdTrivialFTP1: TIdTrivialFTP;
    IdFTP1: TIdFTP;
    IBQuery1OUT_STR: TIBStringField;
    IBSQL1: TIBSQL;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

VAR db_server_string: string;
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



{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
var f: textfile;

begin

  assignfile(f, out_filename);
  rewrite(f);

  ibsql1.Transaction.StartTransaction;
  ibsql1.ParamByName('export_param').AsInteger:=export_param;
  ibsql1.ExecQuery;
  while not ibsql1.Eof do
  begin

    write(f, ansitoutf8(ibsql1.fieldbyname('out_str').asstring+chr(13)));




    ibsql1.Next;

  end;

  ibsql1.Close;
  ibsql1.Transaction.Commit;

  closefile(f);

  idftp1.Host:=ftp_server;
  idftp1.username:=ftp_user;
  idftp1.Password:=ftp_pass;
  idftp1.Connect;
  idftp1.Put(out_filename, ftp_filename);
  idftp1.Disconnect;
end;



end.
