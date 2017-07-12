program inet_export_2;

uses
  Forms,
  SysUtils,
  main_form in 'main_form.pas' {Form6};

{$R *.res}


var a: integer;





begin

  if ParamCount>0 then begin
    for a:=1 to ParamCount do begin

      if pos('-EXPORT_PARAM=', paramstr(a))=1 then
      begin
        str:=copy(paramstr(a), length('-EXPORT_PARAM=')+1);

        try
          export_param := strtoint(str);
        finally
        end;
    end;



    end;
  end;



  assignfile(f, 'inet_export_2.set');
  reset(f);

  while not eof(f) do
  begin
    readln(f, str);
    if pos('DB_SERVER=', str)=1 then
    begin
      db_server_string:=copy(str, length('DB_SERVER=')+1);
    end;

    if pos('FTP_SERVER=', str)=1 then
    begin
      ftp_server:=copy(str, length('FTP_SERVER=')+1);
    end;

    if pos('FTP_USER=', str)=1 then
    begin
      ftp_user:=copy(str, length('FTP_USER=')+1);
    end;

    if pos('FTP_PASS=', str)=1 then
    begin
      ftp_pass:=copy(str, length('FTP_PASS=')+1);
    end;

    if pos('OUT_FILENAME=', str)=1 then
    begin
      out_filename:=copy(str, length('OUT_FILENAME=')+1);
      out_filename:=stringreplace(out_filename, '.xml', '_'+inttostr(export_param)+'.xml', [rfReplaceAll]);
    end;

    if pos('FTP_FILENAME=', str)=1 then
    begin
      ftp_filename:=copy(str, length('FTP_FILENAME=')+1);
      ftp_filename:=stringreplace(ftp_filename, '.xml', '_'+inttostr(export_param)+'.xml', [rfReplaceAll]);
    end;

    if pos('EXPORT_CATALOG_ID=', str)=1 then
    begin
      str:=copy(str, length('EXPORT_CATALOG_ID=')+1);

      try
        export_catalog_id := strtoint(str);
      finally

      end;
    end;
  end;

  closefile(f);


  Application.Initialize;
  Application.CreateForm(TForm6, Form6);
  Form6.IBDatabase1.DatabaseName:=db_server_string;
  Form6.IBDatabase1.Open;

  Form6.Button1Click(nil);
  Form6.IBDatabase1.Close;
//  Close;
//  Application.Run;
end.
