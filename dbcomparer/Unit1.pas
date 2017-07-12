unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IBDatabase, Db, IBCustomDataSet, IBQuery;

type
  TForm1 = class(TForm)
    IBDatabase1: TIBDatabase;
    IBDatabase2: TIBDatabase;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    IBTransaction1: TIBTransaction;
    IBTransaction2: TIBTransaction;
    Button1: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
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
begin
        ibdatabase1.Connected:=true;
        ibdatabase2.Connected:=true;

        ibquery1.SQL.Text:='select tw_art, tw_brak, tw_nam, tw_id, skl_id, sum(tw_kol) tw_kol from ost, tw where tw.tw_id=ost.tw_id  group by 1,2,3,4,5 order by 1,2';
        ibquery1.Open;


        i:=0;
        while not ibquery1.Eof do
        begin
//                ibquery2.sql.Text:='select count(*) cnt  from ost where tw_id=:tw_id and skl_id=:skl_id and bg_abs(bg_abs(tw_kol)-bg_abs(:tw_kol))<0.1 and frm_id = :frm_id';
                ibquery2.sql.Text:='select tw_id, skl_id, sum(tw_kol) tw_kol from ost where tw_id=:tw_id and skl_id=:skl_id group by 1,2';
                ibquery2.ParamByName('tw_id').asInteger:=ibquery1.FieldByName('tw_id').asInteger;
                ibquery2.ParamByName('skl_id').asInteger:=ibquery1.FieldByName('skl_id').asInteger;
//                ibquery2.ParamByName('tw_kol').asfloat:=ibquery1.FieldByName('tw_kol').asfloat;
//                ibquery2.ParamByName('frm_id').asInteger:=ibquery1.FieldByName('frm_id').asInteger;


                label1.Caption:= inttostr(i);

                application.ProcessMessages;
                inc(i);
                ibquery2.open;
                if (ibquery2.Eof) then
                begin
                        if ( abs(ibquery1.FieldByName('tw_kol').asFloat) > 0.1) then
                        begin
                        memo1.Lines.Add(
                         ibquery1.FieldByName('skl_id').asString + ' '+ ibquery1.FieldByName('tw_kol').asString+' '+
                         '0000' + ' '+ '0000 '+
                         ibquery1.FieldByName('tw_id').asString+' '+
                        ibquery1.FieldByName('tw_art').asString +' '+ibquery1.FieldByName('tw_brak').asString + ' '
                        +ibquery1.FieldByName('tw_nam').asString);
                        end;
                end
                else
                if abs(ibquery2.fieldByName('tw_kol').asfloat - ibquery1.fieldByName('tw_kol').asfloat) > 0.1 then
                begin
                         memo1.Lines.Add(
                         ibquery1.FieldByName('skl_id').asString + ' '+ ibquery1.FieldByName('tw_kol').asString+' '+
                         ibquery2.FieldByName('skl_id').asString + ' '+ ibquery2.FieldByName('tw_kol').asString+' '+
                         ibquery1.FieldByName('tw_id').asString+' '+
                        ibquery1.FieldByName('tw_art').asString +' '+ibquery1.FieldByName('tw_brak').asString + ' '
                        +ibquery1.FieldByName('tw_nam').asString);
//                        memo1.Lines.Add(ibquery1.FieldByName('tw_id').asString+',');
                end;

                ibquery2.close;



                ibquery1.Next;
        end;

        ibquery1.Close;


end;

end.
