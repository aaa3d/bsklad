unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,  uib;

type
  TForm6 = class(TForm)
    Button1: TButton;
    JvUIBDataBase1: TUIBDataBase;
    JvUIBTransaction1: TUIBTransaction;
    JvUIBQuery1: TUIBQuery;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

function CntRecurrences(substr, str: string): integer;
var
cnt, p: integer;
begin
cnt := 0;
while str <> '' do
begin
   p := Pos(substr, str);
   if p > 0 then
     inc(cnt)
   else
     p := 1;
   Delete(str, 1, (p + Length(substr) - 1));
end;
Result := cnt;
end;

function Convert(OldName: string): string; 
var OldNameLength: integer; 
   i: integer; 
   s: string; 
begin 
OldNameLength := length(OldName); 
s:=''; 
i:=1; 
while i <= OldNameLength do begin 
 if (OldName[i] in ['A'..'Z']+['a'..'z']+['0'..'9']+ 
                 ['{']+['}']+['[']+[']']+['`']+['~']+ 
                 ['!']+['@']+['#']+['$']+['%']+['^']+ 
                 ['&']+['*']+['(']+[')']+['-']+['_']+ 
                 ['+']+['=']+['\']+['|']+[';']+[':']+ 
                 ['"']+['{']+['<']+['>']+[',']+['.']+ 
                 ['?']+['/']+['№']+['^'])
                then s:=s+OldName[i];
 if OldName[i] in ['А','Б','а','б'] then
    s:=s+chr(ord(OldName[i])-127);
 if OldName[i] in ['В','в'] then
    s:=s+chr(ord(OldName[i])-108);
 if OldName[i] in ['Г','г','Ж','ж'] then
    s:=s+chr(ord(OldName[i])-124);
 if OldName[i] in ['Д','д','Е','е'] then
    s:=s+chr(ord(OldName[i])-128);
 if OldName[i] in ['З','з'] then
    s:=s+chr(ord(OldName[i])-109);
 if OldName[i] in [' ',' '] then
    s:=s+'-';
 if OldName[i] in ['И','и','К','к','Л','л','М','м','Н','н','О','о','П','п'] then
    s:=s+chr(ord(OldName[i])-127); 
 if OldName[i] in ['Й','й'] then 
    s:=s+chr(ord(OldName[i])-128); 
 if OldName[i] in ['Р','р','С','с','Т','т','У','у'] then 
    s:=s+chr(ord(OldName[i])-126); 
 if OldName[i] in ['Ф','ф'] then 
    s:=s+chr(ord(OldName[i])-142); 
 if OldName[i] in ['Х','х'] then 
    s:=s+chr(ord(OldName[i])-141); 
 if OldName[i] in ['Ц','ц'] then 
    s:=s+chr(ord(OldName[i])-147); 
 if OldName[i] in ['Ы','ы'] then 
    s:=s+chr(ord(OldName[i])-130); 
 if OldName[i] in ['Э','э'] then 
    s:=s+chr(ord(OldName[i])-152); 
 if OldName[i] = 'Ё' then s:=s+'Yo'; 
 if OldName[i] = 'ё' then s:=s+'yo'; 
 if OldName[i] = 'Ч' then s:=s+'Ch'; 
 if OldName[i] = 'ч' then s:=s+'ch'; 
 if OldName[i] = 'Ш' then s:=s+'Sh'; 
 if OldName[i] = 'ш' then s:=s+'sh'; 
 if OldName[i] = 'Щ' then s:=s+'Sch'; 
 if OldName[i] = 'щ' then s:=s+'sch'; 
 if OldName[i] in ['Ъ','ъ','Ь','ь'] then s:=s;//+chr(39);
 if OldName[i] = 'Ю' then s:=s+'Yu'; 
 if OldName[i] = 'ю' then s:=s+'yu'; 
 if OldName[i] = 'Я' then s:=s+'Ya'; 
 if OldName[i] = 'я' then s:=s+'ya'; 
 i:=i+1; 
end;

Convert := LowerCase(s);
//Convert:=s; 
end;


function MakeImageNames(from: string): string;
var t:TStringList;
i: integer;
r: string;
begin
t:=TStringList.create; //создаём класс
t.text:=stringReplace(from,' ',#13#10,[rfReplaceAll]);//мы заменяем все пробелы на символы конца строки
//теперь можно убедится что у вас строка разбина на элементы:

r:='';

if pos('200120954', from)>0 then
begin
  r:=r+' ';
end;

for I := 0 to t.Count - 1 do
  begin
    r:=r+'enl_'+t[i]+' ';
    r:=r+'thm_'+t[i]+' ';
    r:=r+t[i]+' ';

  end;




t.free;
result:=r;
end;

procedure TForm6.Button1Click(Sender: TObject);
var f: textfile;
s, s1: string;
val: string;
n: integer;
//prevN: integer;
begin
   assignfile(f, 'catalog.csv');
   rewrite(f);

   JvUIBQuery1.SQL.Text:='select * from internet_data_export ';
   JvUIBQuery1.Open;
//   prevN:=0;


   writeln(f, 'Артикул;Наименование;ID страницы;Цена;На складе;Описание;Краткое описание;Фотография');
   while not JvUIBQuery1.Eof do
   begin
     s:='';
     s1:=stringreplace(JvUIBQuery1.Fields.ByNameAsString['TWTREE_FULL'], ';', '', [rfReplaceAll]);

     if (''<>s1) then
     begin



      n:=CntRecurrences('->', s1);

//      if (n > prevN + 1) then
//        n := prevN + 1;
//      prevN := n;

      while n > 0 do
      begin
      s1:='!'+s1;
      n := n-1;
      end;


      s1:=stringreplace(s1, '->', ' ', [rfReplaceAll]);


      writeln(f, ';'+s1+';'+Convert(s1) + '-'+JvUIBQuery1.Fields.ByNameAsString['TWTREE_ID']);
     end
      else
      begin

       val := JvUIBQuery1.Fields.ByNameAsString['TW_ART']; val := stringreplace(val, ';', '', [rfReplaceAll]); val := stringreplace(val, chr(13)+chr(10), '', [rfReplaceAll]);val := stringreplace(val, '  ', '', [rfReplaceAll]);
       s:=s+val+';';
       val := JvUIBQuery1.Fields.ByNameAsString['TW_NAM']; val := stringreplace(val, ';', '', [rfReplaceAll]); val := stringreplace(val, chr(13)+chr(10), '', [rfReplaceAll]);val := stringreplace(val, '  ', '', [rfReplaceAll]);
       s:=s+val+';';

       s:= s + Convert(val) + '-'+JvUIBQuery1.Fields.ByNameAsString['TW_ID']+';';

       val := FloatToStrF(JvUIBQuery1.Fields.ByNameAsDouble['TW_PRICE'], ffFixed, 15, 2);
       s:=s+val+';';
       val := FloatToStrF(JvUIBQuery1.Fields.ByNameAsDouble['ONSTORE'], ffFixed, 15, 4);
       s:=s+val+';';
       val := JvUIBQuery1.Fields.ByNameAsString['TW_INFO']; val := stringreplace(val, ';', '', [rfReplaceAll]); val := stringreplace(val, chr(13)+chr(10), '', [rfReplaceAll]);val := stringreplace(val, '  ', ' ', [rfReplaceAll]);
       s:=s+val+';';
       val := JvUIBQuery1.Fields.ByNameAsString['TW_DESC']; val := stringreplace(val, ';', '', [rfReplaceAll]); val := stringreplace(val, chr(13)+chr(10), '', [rfReplaceAll]);val := stringreplace(val, '  ', ' ', [rfReplaceAll]);
       s:=s+val+';';
       val := JvUIBQuery1.Fields.ByNameAsString['TW_FILES_INFO']; val := stringreplace(val, ';', '', [rfReplaceAll]);{ val := stringreplace(val, chr(13)+chr(10), '', [rfReplaceAll]);}val := stringreplace(val, '  ', ' ', [rfReplaceAll]);
       //здесь val   - строка из нескоьких файлов. разбить ее и утроить.

       val:=MakeImageNames(val);

       s:=s+val+';';

       writeln(f, s);
      end;
     JvUIBQuery1.Next;

   end;


   JvUIBQuery1.Close();

   closefile(f);
end;

end.
