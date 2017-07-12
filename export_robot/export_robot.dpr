program export_robot;

uses
  Forms,
  SysUtils,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.RES}

begin
assignfile(f, 'export_robot.set');
  reset(f);

  while not eof(f) do
  begin
    readln(f, str);
    if pos('DB_SERVER=', str)=1 then
    begin
      db_server_string:=copy(str, length('DB_SERVER=')+1, 255);
    end;

    if pos('OUT_FILENAME=', str)=1 then
    begin
      out_filename:=copy(str, length('OUT_FILENAME=')+1, 255);
//      out_filename:=stringreplace(out_filename, '.xml', '_'+inttostr(export_param)+'.xml', [rfReplaceAll]);
    end;


  end;

  closefile(f);


  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Form1.IBDatabase1.DatabaseName:=db_server_string;
  Form1.IBDatabase1.Open;

  Form1.Button1Click(nil);
  Form1.IBDatabase1.Close;

  form1.Destroy;







end.
