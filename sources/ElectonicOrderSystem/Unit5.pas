unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IBDatabase, DB, IBCustomDataSet, IBQuery;

type
  TForm4 = class(TForm)
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    Procedure ScanDir(Dir:string);
    procedure ImportOrder(filename: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}


procedure Log(msg: string);
var str: string;
  f: textfile;
begin
  str:=formatdatetime('yyyy-mm-dd hh:nn:ss', now);
  assignfile(f, 'seo-load.log');
  if FileExists('seo-load.log') then
    append(f)
  else
    rewrite(f);

  writeln(f, str+': '+msg);
  closefile(f);


end;



Procedure TForm4.ScanDir(Dir:string);
var SearchRec:TSearchRec;
begin
 if Dir<>'' then if Dir[length(Dir)]<>'\' then Dir:=Dir+'\';
 if FindFirst(Dir+'*.*', faAnyFile, SearchRec)=0 then
 repeat
 if (SearchRec.name='.') or (SearchRec.name='..') then continue;
 if (SearchRec.Attr and faDirectory)<>0 then
 ScanDir(Dir+SearchRec.name) //we found Directory: "Dir+SearchRec.name"
 else
 if ((pos('.txt', SearchRec.name )=length(SearchRec.name)-3 ) and (pos('Z', SearchRec.name )=1 ))
   then
   begin
   Memo1.Lines.Add(Dir+SearchRec.name); //we found File: "Dir+SearchRec.name"
   ImportOrder(Dir+SearchRec.name);
   end;
 until FindNext(SearchRec)<>0;
 FindClose(SearchRec);
end;

procedure TForm4.ImportOrder(filename: string);
var f: textfile;
  buf: string;

  inHeader, inGoods: boolean;
  header: string;

  t:TStringList;
  kln_id: string;
  tw_id: string;
  tw_kol, tw_money: double;
  st_id: integer;
  doc_number: integer;

begin
  //

  inHeader:=false;
  inGoods:=false;
  assignfile(f, filename);

  reset(f);


  IbQuery1.SQL.Text:='select GEN_ID(GEN_ST,1) st_id, doc_number from new_doc_number(''ST'', 0, ''now'', :frm_id, :shop_id)';
  IbQuery1.ParamByName('FRM_ID').AsInteger:=10;
  IbQuery1.ParamByName('KLN_ID').AsString:=KLN_ID;
  IbQuery1.ParamByName('SHOP_ID').AsInteger:=1;
  IbQuery1.Open;

  st_id:=IbQuery1.FieldByName('ST_ID').AsInteger;
  doc_number:=IbQuery1.FieldByName('doc_number').AsInteger;

  IbQuery1.Close;







  while not eof(f) do
  begin
    readln(f, buf);

    if pos('@заголовок', buf)=1 then
    begin
      inHeader:=true;
      readln(f, buf);
      buf:=copy(buf, 0, pos('~', buf)-1);
      kln_id:=buf;
      continue;
    end;
    if pos('@товар', buf)=1 then
    begin
      inGoods:=true;
      continue;
    end;
    if pos('@@заголовок', buf)=1 then
    begin
      inHeader:=false;

      IbQuery1.SQL.Text:='insert into ST(ST_ID, ST_NUM, st_date, SHOP_ID, ST_OSN, KLN_ID, FRM_ID, US_ID, VALUTA_ID, NDS) '+
      ' VALUES(:ST_ID, :ST_NUM,''now'', :SHOP_ID, :ST_OSN, :KLN_ID, :FRM_ID, 0, 0, 18) ';
      IbQuery1.ParamByName('FRM_ID').AsInteger:=10;
      IbQuery1.ParamByName('KLN_ID').AsString:=KLN_ID;
      IbQuery1.ParamByName('SHOP_ID').AsInteger:=1;
      IbQuery1.ParamByName('ST_ID').AsInteger:=st_id;
      IbQuery1.ParamByName('ST_NUM').AsInteger:=doc_number;
      IbQuery1.ParamByName('ST_OSN').AsString:=header;
      IbQuery1.ExecSQL;



      continue;
    end;
    if pos('@@товар', buf)=1 then
    begin
      inGoods:=false;
      continue;
    end;

    if InHeader then
    begin
     header:=header+buf;
    end
    else


    if InGoods then
    begin
    t:=TStringList.create; //создаём класс
    t.text:=stringReplace(buf,'~',#13#10,[rfReplaceAll]);//мы заменяем все пробелы на символы конца строки
  //теперь можно убедится что у вас строка разбина на элементы:
    tw_id:=t[0];
    tw_kol:=strtoint(t[4]);
    tw_money:=strtoint(t[5]);
    tw_kol:=tw_kol/1000;
    tw_money:=tw_money/100;
  //после работы надо уничтожить класс
    t.free;


    IbQuery1.SQL.Text:='insert into STS(ST_ID, TW_ID, TW_KOL, TW_MONEY) '+
      ' VALUES(:ST_ID, :TW_ID, :TW_KOL, :TW_MONEY)';
      IbQuery1.ParamByName('TW_ID').AsInteger:=10;
      IbQuery1.ParamByName('TW_KOL').AsFloat:=tw_kol;
      IbQuery1.ParamByName('TW_MONEY').AsFloat:=tw_money;
      IbQuery1.ParamByName('ST_ID').AsInteger:=st_id;
      IbQuery1.ExecSQL;



    end;


  
  end;


  IbQuery1.Transaction.Commit;
  RenameFile(filename, stringreplace(filename, '.txt', formatdatetime('yyyymmdd-hhmmss', now)+'.processed', [rfReplaceAll]));

end;

procedure TForm4.Button1Click(Sender: TObject);
var f: textfile;
    fs:TSearchRec;
    res: integer;
begin
  try

  IbDatabase1.Open;
  ScanDir('.');








  except

  on e: Exception
    do
    log(e.Message);
  end;






end;

end.
