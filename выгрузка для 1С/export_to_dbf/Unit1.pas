unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBCustomDataSet, StdCtrls, IBQuery, IBDatabase, dbf, ADODB, DBTables,
  ExtCtrls ;

type
  TForm1 = class(TForm)
    IBTransaction1: TIBTransaction;
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    Button1: TButton;
    DataSource1: TDataSource;
    IBQuery1ID: TIntegerField;
    IBQuery1ART: TIBStringField;
    IBQuery1NAME: TIBStringField;
    IBQuery1FNAME: TIBStringField;
    IBQuery1PARENT: TIntegerField;
    IBQuery1EDIZM: TIBStringField;
    IBQuery1VEDIZM: TIntegerField;
    IBQuery1OEDIZM: TIntegerField;
    IBQuery1VN: TIntegerField;
    IBQuery1NDA: TIntegerField;
    IBQuery1SZ: TIntegerField;
    IBQuery1PROIZV: TIBStringField;
    IBQuery1STRANA: TIBStringField;
    IBQuery1OPIS: TIBStringField;
    IBQuery1KOMMENT: TIBStringField;
    IBQuery1PR: TIntegerField;
    IBQuery1UPAK: TIntegerField;
    IBQuery1IDS: TIntegerField;
    IBQuery1KO: TFloatField;
    IBQuery1SO: TFloatField;
    IBQuery1FILES: TIBStringField;
    Dbf1: TDbf;
    Dbf1ID: TIntegerField;
    Dbf1ART: TIBStringField;
    Dbf1NAME: TIBStringField;
    Dbf1FNAME: TIBStringField;
    Dbf1PARENT: TIntegerField;
    Dbf1EDIZM: TIBStringField;
    Dbf1VEDIZM: TIntegerField;
    Dbf1OEDIZM: TIntegerField;
    Dbf1VN: TIntegerField;
    Dbf1NDA: TIntegerField;
    Dbf1SZ: TIntegerField;
    Dbf1PROIZV: TIBStringField;
    Dbf1STRANA: TIBStringField;
    Dbf1OPIS: TIBStringField;
    Dbf1KOMMENT: TIBStringField;
    Dbf1PR: TIntegerField;
    Dbf1UPAK: TIntegerField;
    Dbf1IDS: TIntegerField;
    Dbf1KO: TFloatField;
    Dbf1SO: TFloatField;
    Dbf1FILES: TIBStringField;
    IBQuery2: TIBQuery;
    IBQuery2TC: TIBStringField;
    IBQuery2ID: TIntegerField;
    IBQuery2PRICE: TFloatField;
    Dbf2: TDbf;
    Dbf2TC: TIBStringField;
    Dbf2ID: TIntegerField;
    Dbf2PRICE: TFloatField;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var i: integer;
//        sfield_name: string;
   field: TFieldDef;
//   f: textfile;
//   line: AnsiString;
//   header: AnsiString;
//   header_filled: boolean;
//   field_string:ansistring;
begin


ibtransaction1.Active;

dbf1.CreateTable;
dbf1.Active:=true;

//dbf1.Active:=false;

//exit;


ibquery1.Open;

//assignfile(f, 'ost_gal.csv');
//rewrite(f);
//header_filled:=false;




        while not ibquery1.Eof do
        begin

//                dbf1.Insert;
                dbf1.Append;

//                line:='';
                for i:=0 to dbf1.FieldDefs.Count-1 do
                begin


                     //dbf1.FieldByName(ibquery1.FieldDefs[i].Name).asString := ibquery1.FieldByName(ibquery1.FieldDefs[i].Name).asString;

                   //  if (header_filled=false) then
//                     begin
//                             header := header+ibquery1.FieldDefs[i].Name+';';
//                     end;




                     if ibquery1.FieldDefs[i].DataType=ftFloat then
                     begin
                        dbf1.FieldByName(ibquery1.FieldDefs[i].Name).asFloat := ibquery1.FieldByName(ibquery1.FieldDefs[i].Name).asFloat;
//                        field_string:= FormatFloat('0.####', ibquery1.FieldByName(ibquery1.FieldDefs[i].Name).asFloat) +';';
                     end
                     else
                     if ibquery1.FieldDefs[i].DataType=ftInteger then
                     begin
                        dbf1.FieldByName(ibquery1.FieldDefs[i].Name).asInteger := ibquery1.FieldByName(ibquery1.FieldDefs[i].Name).asInteger;
//                        field_string:= FormatFloat('0.####', ibquery1.FieldByName(ibquery1.FieldDefs[i].Name).asFloat) +';';
                     end
                     else
                     if ibquery1.FieldDefs[i].DataType=ftString then
                     begin
                        dbf1.FieldByName(ibquery1.FieldDefs[i].Name).asString := ibquery1.FieldByName(ibquery1.FieldDefs[i].Name).asString;
//                        field_string:= ibquery1.FieldByName(ibquery1.FieldDefs[i].Name).asString +';';
                     end;

//                        field_string:=StringReplace(field_string, chr(13)+chr(10), ' ', [rfReplaceAll]);
//                        line := line + field_string;
//                        else
//                             dbf1.FieldByName(sField_name).asString := ibquery1.FieldByName(sField_name).asString;




                end;
//
//                if (header_filled = false) then
//                begin
//                        writeln(f, header);
//                        header_filled:=true;
//                end;

//                writeln(f, line);





                dbf1.Post;

                ibquery1.Next;
               
        end;

        dbf1.Active:=false;


   //     closefile(f);
        ibquery1.Close;



        ibquery2.Open;
        dbf2.CreateTable;
        dbf2.Active:=true;


        while not ibquery2.Eof do
        begin
                dbf2.Append;
                for i:=0 to dbf2.FieldDefs.Count-1 do
                begin
                     if ibquery2.FieldDefs[i].DataType=ftFloat then
                     begin
                        dbf2.FieldByName(ibquery2.FieldDefs[i].Name).asFloat := ibquery2.FieldByName(ibquery2.FieldDefs[i].Name).asFloat;
                     end
                     else
                     if ibquery2.FieldDefs[i].DataType=ftInteger then
                     begin
                        dbf2.FieldByName(ibquery2.FieldDefs[i].Name).asInteger := ibquery2.FieldByName(ibquery2.FieldDefs[i].Name).asInteger;
                     end
                     else
                     if ibquery2.FieldDefs[i].DataType=ftString then
                     begin
                        dbf2.FieldByName(ibquery2.FieldDefs[i].Name).asString := ibquery2.FieldByName(ibquery2.FieldDefs[i].Name).asString;
                     end;

                end;

                dbf2.Post;

                ibquery2.Next;

        end;

        dbf2.Active:=false;
        ibquery2.Close;


        ibtransaction1.Commit;




      




end;

procedure TForm1.FormCreate(Sender: TObject);
begin


  application.ProcessMessages;
  self.Button1Click(nil);

  timer1.Enabled:=true;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  close;
end;

end.
