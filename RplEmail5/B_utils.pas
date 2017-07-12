unit B_utils;
{ ********************************************************************
  **** Copyright 1980-1999 Britvin Sergej,                        ****
  **** Beginner(C), Yaroslavl, Russia,                            ****
  **** E-mail:  Beginner@inbox.ru                                 ****
  ****------------------------------------------------------------****
  ****  модуль, содержащий наиболее часто употребляемые функции   ****
  ********************************************************************}

interface                                 

uses Controls,SysUtils,Windows,Forms,Classes,IbQuery,Comctrls,StdCtrls,VclUtils;

const
        CR=#13+#10;
        SEKOND1=0.00069444444444;
        MESSOKR:array[1..12] of ansistring=('Января','Февраля','Марта','Апреля','Мая','Июня','Июля','Августа','Сентября','Октября','Ноября','Декабря');
        MESSOKR2:array[1..12] of ansistring=('Январь','Февраль','Март','Апрель','Май','Июнь','Июль','Август','Сентябрь','Октябрь','Ноябрь','Декабрь');

function MYCOPYF(S1,S2:ansistring;var PROGR:TProgressBar;var LAB:TLabel):boolean;
function My_NOW:Tdatetime;
procedure add_SQL(var QR:TIBQuery;S:ansistring);
procedure Open_SQL(var QR:TIBQuery;S:ansistring);
function LINES_COUNT(S:ansistring):integer;
function LINES_N(S:ansistring;N:integer):ansistring;
function DELETEFMASK(PAth,sw:ansistring):boolean;
function RENAMEF(s1,s2:ansistring):boolean;
function MOVEF(s1,s2:ansistring):boolean;
function COPYF(s1,s2:ansistring):boolean;
function DELETEF(s1:ansistring):boolean;
function Mynow:Tdatetime;


function strtoboolean(s:ansistring):boolean;
function SystemComputerName:ansistring;
function SystemUserName:ansistring;
function Memotostr(M:Tstrings):ansistring;
Function Okrug(R:double;DIG:integer):double;
function pow(a,b:double):double;
function ARGC(s:ansistring;n:integer):ansistring;
function ARGV(s:ansistring):integer;
function typVAR(a:variant):integer;
function ProperCaseFIO(s:ansistring):ansistring;
function ProperCase(s:ansistring):ansistring;
function DelCR(s:ansistring):ansistring;
function IsALPHA(c:char):boolean; {Буква ли символ}
function IsDIGIT(c:char):boolean; {цифра ли символ}
function RUB_CHAR(mn:real):ansistring;
function VALUTA_CHAR(mn:real;AUTO1,AUTO2,AUTO3,AUTO11,AUTO12,AUTO13:ansistring):ansistring;
function RUB_SOKR(mn:real):ansistring;
function MONEY_CHAR(mn:double;pol:integer):ansistring;
function OKON_CHAR(s1,s2,s3:ansistring;mn:double):ansistring;
function MESSBOX(S1,S2:ansistring;N1:INTEGER):INTEGER;
function right(s:ansistring;n:integer):ansistring;
function left(s:ansistring;n:integer):ansistring;
function DATE_SOKR(DT:Tdate):ansistring;
function DATE_SHORT(DT:Tdate):ansistring;
function SPACE(N:INTEGER):ansistring;
function DATE_YEAR(DT:tdateTime):integer;
function MYMONTH(DT:tdateTime):ansistring;
function TMPNAME:ansistring;
function SOKR_DAY(DT:Tdatetime):ansistring;
function POWT_SYM(s:ansistring;n:integer):ansistring;
function Quot(s:ansistring):ansistring;
function IntToFixedString(n:longint):ansistring;
function FixedStringToInt(s:ansistring):longint;
function DoubleToFixedString(n:double):ansistring;
function FixedStringToDouble(s:ansistring):Double;
function DateToFixedString(D:tdatetime):ansistring;
function FixedStringToDate(S:ansistring):Tdatetime;
function striptime(DT:tdatetime):tdatetime;
function formatdate(DT:tdatetime;c:string):string;
function mytimetostr(DT:tdatetime):string;

implementation

function formatdate(DT:tdatetime;c:string):string;
var
  yy,mm,dd:word;
begin
  decodedate(dt,yy,mm,dd);
  result:=b_utils.right('00'+inttostr(dd),2)+c+b_utils.right('00'+inttostr(mm),2)+c+b_utils.right('0000'+inttostr(yy),4)
end;

function striptime(DT:tdatetime):tdatetime;
var
  yy,mm,dd:word;
begin
  decodedate(dt,yy,mm,dd);
  result:=encodedate(yy,mm,dd);
end;

function DelCR(s:ansistring):ansistring;
// Функция удаляет возврат каретки
var
  s2:ansistring;
  a:integer;
begin
  s2:='';
  for a:=1 to length(s) do if (s[a]=#13) or (s[a]=#10) then s2:=s2+' ' else s2:=s2+s[a];
  result:=s2;
end;

function FixedStringToDate(S:ansistring):Tdatetime;
var
  ts:Ttimestamp;
begin
   ts.Date:=FixedStringToInt(copy(s,1,4));
   ts.time:=FixedStringToInt(copy(s,5,4));
   result:=timestamptodatetime(ts);
end;

function DateToFixedString(D:tdatetime):ansistring;
var
  ts:Ttimestamp;
begin
     ts:=DateTimeToTimeStamp(D);
     result:=inttofixedstring(ts.date)+inttofixedstring(ts.time);
end;


function IntToFixedString(n:longint):ansistring;
type
  bb=string[4];
var
  p:^bb;
  c:array[1..4] of char;
  a:integer;
begin
    getMem(P,4);
    if ((n>=0) and (n<1000)) then result:=inttostr(n) else begin
      p:=@n;
      result:='';
      for a:=1 to 4 do c[a]:=p^[a-1];
      for a:=1 to 4 do result:=result+b_utils.right('000'+inttostr(ord(c[a])),3);
    end;
end;

function FixedStringToInt(s:ansistring):longint;
type
  bb=string[4];
var
  p:^bb;
  c:array[1..4] of char;
  a:integer;
  n:longint;
  p2:^integer;
begin
    getMem(P,4);
    n:=0;
    if length(s)<4 then result:=strtoint(s) else begin
      p:=@n;
      for a:=1 to 4 do begin
         p^[a-1]:=chr(strtoint(copy(s,(a-1)*3+1,3)));
      end;
      result:=n;
    end;
end;


function DoubleToFixedString(n:double):ansistring;
type
  bb=string[8];
var
  p:^bb;
  c:array[1..8] of char;
  a:integer;
begin
    getMem(P,8);
    if n=0 then result:='0' else begin
      p:=@n;
      for a:=1 to 8 do c[a]:=p^[a-1];
      result:='';
      for a:=1 to 8 do result:=result+b_utils.right('000'+inttostr(ord(c[a])),3);
    end;
end;

function FixedStringToDouble(s:ansistring):Double;
type
  bb=string[8];
var
  p:^bb;
  c:array[1..8] of char;
  a:integer;
  n:double;
  p2:^integer;
begin
    getMem(P,8);
    n:=0;
    if s='0'then result:=0 else begin
      p:=@n;
      for a:=1 to 8 do begin
         p^[a-1]:=chr(strtoint(copy(s,(a-1)*3+1,3)));
      end;
      result:=n;
    end;
end;



function Quot(s:ansistring):ansistring;
// Функция заменяет кавычки в HTML
var
  a:integer;
begin
   result:='';
   for a:=1 to length(s) do if s[a]='"' then result:=result+'&quot;' else result:=result+s[a];
end;

function MYCOPYF(S1,S2:ansistring;var PROGR:TProgressBar;var LAB:TLabel):boolean;
const
     SizeBUF=20000;
var
   Ferr:text;
   BUF:array[1..SizeBuf] of char;
   FIL1,FIL2:file;
   Numread,Numwrite:Integer;
   ALL,b:Integer;
begin
  result:=False;
  try
     LAB.caption:='Определение размера файла...';
     PROGR.position:=0;
     delay(1);
     assignfile(Fil1,S1);
     reset(Fil1,1);
     ALL:=FileSize(Fil1);
     assignfile(fil2,S2);
     rewrite(fil2,1);
     b:=0;
     repeat
           PROGR.position:=trunc((B/ALL)*100);
           LAB.caption:='скопировано '+inttostr(B div 1024)+' из '+inttostr(ALL div 1024)+' Кбайт...';
           delay(1);
           BlockRead(Fil1,Buf,SizeOf(Buf),Numread);
           BlockWrite(Fil2,Buf,Numread,Numwrite);
           b:=b+NumRead;
     until Numread=0;
     LAB.caption:='Копирование '+inttostr(ALL div 1024)+' Кбайт завершено...';
     delay(1);
     close(Fil1);
     close(Fil2);
     Result:=true;
  Except
  End;
  try
     close(Fil1);
     close(Fil2);
  Except
  End;
end;

function POWT_SYM(s:ansistring;n:integer):ansistring;
var
   a:integer;
begin
     result:='';
     for a:=1 to n do result:=result+s;
end;

function SOKR_DAY(DT:Tdatetime):ansistring;
var
   dd,mm,yy:word;
begin
  decodedate(DT,YY,MM,DD);
  result:=B_utils.right('0000'+inttostr(YY),4)+'-'+MYMONTH(DT)+'-'+B_utils.right('0000'+inttostr(DD),2);
end;

function TMPNAME:ansistring;
var
   s1:ansistring;
   a:integer;
   c:char;
begin
     s1:=datetimetostr(date()+time());
     result:='';
     for a:=1 to length(s1) do begin
         c:=s1[a];
         case c of
              '0','1','2','3','4','5','6','7','8','9':result:=result+c;
         end;
     end;
end;

function MYMONTH(DT:tdateTime):ansistring;
var
   y,m,d:word;
begin
     decodedate(DT,y,m,d);
     case m of
          1: result:='YAN';
          2: result:='FEB';
          3: result:='MAR';
          4: result:='APR';
          5: result:='MAY';
          6: result:='YUN';
          7: result:='YUL';
          8: result:='AUG';
          9: result:='SEN';
          10: result:='OKT';
          11: result:='NOV';
          12: result:='DEC';
     end;
end;

procedure Open_SQL(var QR:TIBQuery;S:ansistring);
begin
     QR.close;
     QR.SQL.clear;
     QR.SQL.add(S);
     QR.Open;
end;

procedure add_SQL(var QR:TIBQuery;S:ansistring);
begin
     QR.close;
     QR.SQL.clear;
     QR.SQL.add(S);
end;

function LINES_COUNT(S:ansistring):integer;
var
   a:integer;
begin
     result:=1;
     for a:=1 to length(s) do if s[a]=#13 then inc(result);
     if (length(s)=0) then result:=0;
end;

function LINES_N(S:ansistring;N:integer):ansistring;
var
   a,b:integer;
begin
     result:='';
     if length(s)>0 then begin
          a:=1;
          for b:=1 to length(s) do begin
              if s[b]=#13 then inc(a)
              else if ((a=n) and (s[b]<>#10)) then result:=result+s[b];
          end;
     end;
end;

function DATE_YEAR(DT:tdateTime):integer;
var
   YY,MM,DD:Word;
begin
     DecodeDate(DT,YY,MM,DD);
     result:=YY;
end;

function SystemComputerName:ansistring;
var Size         : cardinal;
    PRes         : PChar;
    BRes         : boolean;
    lpSystemInfo : TSystemInfo;
begin
  // Имя компьютера
  result:='';
  Size := MAX_COMPUTERNAME_LENGTH + 1;
  PRes := StrAlloc(Size);
  BRes := GetComputerName(PRes, Size);
  if BRes then Result := StrPas(PRes);
end;

function SystemUserName:ansistring;
var Size         : cardinal;
    PRes         : PChar;
    BRes         : boolean;
    lpSystemInfo : TSystemInfo;
begin
  result:='';
  // Имя пользователя
  Size := MAX_COMPUTERNAME_LENGTH + 1;
  PRes := StrAlloc(Size);
  BRes := GetUserName(PRes, Size);
  if BRes then result:= StrPas(PRes);
end;

function Memotostr(M:Tstrings):ansistring;
var
   a:integer;
   s:ansistring;
begin
     s:='';
     for a:=1 to M.Count do s:=s+M[a-1]+#13+#10;
     if M.count>0 then s:=B_utils.left(s,length(s)-2);
     Memotostr:=s;
end;

function DELETEFMASK(PAth,sw:ansistring):boolean;
{Процедура удаляет по маске}
var
  SearchRec: TSearchRec;
  P1:array [0..1000] of char;
begin
  result:=true;
  if Sysutils.FindFirst(Path+sw, faAnyFile, SearchRec)=0 then
  repeat
        if not DELETEF(Path+SearchREc.NAME) then result:=false;
  until Sysutils.FINDNEXT(SearchRec)<>0;
  Sysutils.FindClose(SearchRec);
end;

function RENAMEF(s1,s2:ansistring):boolean;
{Функция переименовывает файл}
var
  P1,P2:array [0..1000] of char;
begin
     result:=false;
     try
        Strpcopy(P1,S1);
        Strpcopy(P2,S2);
        Try
           Deletefile(P2);
        Except
        end;
        result:=Renamefile(P1,P2);
     except
     end;
end;

function MOVEF(s1,s2:ansistring):boolean;
{Функция копирует файл}
var
  P1,P2:array [0..1000] of char;
begin
     result:=false;
     try
        Strpcopy(P1,S1);
        Strpcopy(P2,S2);
        Try
           Deletefile(P2);
        Except
        end;
        result:=Copyfile(P1,P2,false);
        if result then try
           Deletefile(P1);
        except
        end
     except
     end;
end;

function COPYF(s1,s2:ansistring):boolean;
{Функция копирует файл}
var
  P1,P2:array [0..1000] of char;
begin
     result:=false;
     try
        Strpcopy(P1,S1);
        Strpcopy(P2,S2);
        result:=Copyfile(P1,P2,false);
     except
     end;
end;

function DELETEF(s1:ansistring):boolean;
var
  P1:array [0..1000] of char;
begin
     result:=false;
     if fileexists(s1) then
     Try
        Strpcopy(P1,S1);
        if Deletefile(P1) then result:=true else result:=false;
     Except
     end;
end;

Function Okrug(R:double;DIG:integer):double;
var
  TempStr : string;
  Code   : integer;
begin
  if Abs(R)<0.5*Exp(-DIG*Ln(10)) then
    Result:=0
  else begin
    Str(R:0:DIG,TempStr);
    Val(TempStr,Result,Code);
  end;
end;

function pow(a,b:double):double;
{Функция степени}
begin
     if b=0 then pow:=1 else pow:=(exp(b*ln(a)));
end;

function ARGC(s:ansistring;n:integer):ansistring;
var
        a,b,c:integer;
        nac,len:array[1..300] of integer;
begin
        for a:=1 to length(s) do if s[a]=#9 then s[a]:=' ';
        b:=0;
        c:=0;
        s:=s+' ';
        for a:=1 to length(s) do begin
                if (s[a]=' ') and (c=1) then begin
                                                        c:=0;
                                                        len[b]:=a-nac[b];
                                                    end;
                if (s[a]<>' ') and (c=0) then begin
                                                        inc(b);
                                                        nac[b]:=a;
                                                        c:=1;
                                                     end;
        end;
        if n<=b then ARGC:=copy(s,nac[n],len[n])
                else ARGC:='';
end;

function ARGV(s:ansistring):integer;
var
        a,b,c:integer;
begin
        for a:=1 to length(s) do if s[a]=#9 then s[a]:=' ';
        b:=0;
        c:=0;
        s:=s+' ';
        for a:=1 to length(s) do begin
                if (copy(s,a,1)=' ') and (c=1) then begin
                                                        inc(b);
                                                        c:=0;
                                                    end;
                if (copy(s,a,1)<>' ') and (c=0) then c:=1;
        end;
        ARGV:=b;
end;

function typVAR(a:variant):integer;
{Функция возвращает тип данных}
var
   b:integer;
begin
     b:=varType(a);
     typVAR:=0; {Unknown}
     if (b=varCurrency) or (b=varSingle) or (b=varDouble) or (b=Varbyte) then typVAR:=1; {Float}
     if (b=varSmallint) or (b=varinteger) then typVAR:=2; {Integer}
     if (b=varstring) then typVAR:=3; {ansistring}
     if (b=varBoolean) then typVAR:=4; {Boolean}
     if (b=varDate) then typVAR:=5; {Date}
end;

function ProperCaseFIO(s:ansistring):ansistring;
{Функция берёт строку и делает каждое первое слово предложения заглавным.}
var
   sw1,sw2:ansistring;
   a,b:integer;
   c:char;
begin
     s:=ansilowercase(s);
     {b-статус предыдущих букв
      0 - ожидается Заглавная
      1 - ожидается строчная}
     b:=0;
     s:=s+' ';
     sw1:='';
     for a:=1 to length(s) do begin
         c:=s[a];
         {Проверяем, что за символ}
         if c in [' ','.','!','?'] then b:=0;
         sw2:=c;
         if (b=0) and (IsAlpha(c)) and (a<length(s)) and (((IsAlpha(s[a+1])) and (s[a+1]=ansiLowercase(s[a+1]))) or (not IsAlpha(s[a+1]))) then begin
            sw2:=ansiuppercase(c);
            b:=1;
         end;
         sw1:=sw1+sw2;
     end;
     ProperCaseFIO:=B_utils.left(sw1,length(sw1)-1);
end;

function ProperCase(s:ansistring):ansistring;
{Функция берёт строку и делает каждое первое слово предложения заглавным.}
var
   sw1,sw2:ansistring;
   a,b:integer;
   c:char;
begin
     s:=ansilowercase(s);
     {b-статус предыдущих букв
      0 - ожидается Заглавная
      1 - ожидается строчная}
     b:=0;
     s:=s+' ';
     sw1:='';
     for a:=1 to length(s) do begin
         c:=s[a];
         {Проверяем, что за символ}
         if c in ['.','!','?'] then b:=0;
         sw2:=c;
         if (b=0) and (IsAlpha(c)) and (a<length(s)) and (IsAlpha(s[a+1])) and (s[a+1]=ansiLowercase(s[a+1])) then begin
            sw2:=ansiuppercase(c);
            b:=1;
         end;
         sw1:=sw1+sw2;
     end;
     ProperCase:=B_utils.left(sw1,length(sw1)-1);
end;

function IsALPHA(c:char):boolean; {Буква ли символ}
begin
     Result:=false;
     if ord(c)>191 then Result:=true; {Кириллица}
     if ((ord(c)>64) and (ord(c)<91)) or ((ord(c)>96) and (ord(c)<123)) then Result:=true; {Латинский}
end;

function IsDIGIT(c:char):boolean; {цифра ли символ}
begin
     if ((ord(c)>47) and (ord(c)<58)) then IsDIGIT:=TRUE else isDIGIT:=false;
end;

function VALUTA_CHAR(mn:real;AUTO1,AUTO2,AUTO3,AUTO11,AUTO12,AUTO13:ansistring):ansistring;
var
   RUB:longint;
   kop:integer;
   sw,sw2,sw3,Sw4:ansistring;
begin
     if Mn<0 then sw4:='Минус ' else sw4:='';
     Mn:=okrug(mn,2);
     Mn:=Abs(Mn);
     RUB:=trunc(mn);
     kop:=strtoint(right(floattostrf(mn,fffixed,19,2),2));
     sw:=MONEY_CHAR(mn,1)+' '+OKON_CHAR(AUTO1,AUTO2,AUTO3,mn)+' ';
     sw2:='00'+trim(inttostr(kop));
     sw3:=copy(sw2,length(sw2)-1,2);
     sw:=sw+sw3+' '+OKON_CHAR(AUTO11,AUTO12,AUTO13,kop);
     VALUTA_CHAR:=sw4+sw;
end;


function RUB_CHAR(mn:real):ansistring;
var
   RUB:longint;
   kop:integer;
   sw,sw2,sw3,sw4:ansistring;
begin
     if Mn<0 then sw4:='Минус ' else sw4:='';
     Mn:=okrug(mn,2);
     Mn:=Abs(Mn);
     RUB:=trunc(mn);
     kop:=strtoint(right(floattostrf(mn,fffixed,19,2),2));
     sw:=MONEY_CHAR(mn,1)+' '+OKON_CHAR('рубль','рубля','рублей',mn)+' ';
     sw2:='00'+trim(inttostr(kop));
     sw3:=copy(sw2,length(sw2)-1,2);
     sw:=sw+sw3+' '+OKON_CHAR('копейка','копейки','копеек',kop);
     RUB_CHAR:=sw4+sw;
end;

function RUB_SOKR(mn:real):ansistring;
{Функция возвращает сокращённый вариант суммы}
var
   RUB:longint;
   kop:integer;
   sw2,sw3,sw4:ansistring;
begin
     if Mn<0 then sw4:='-' else sw4:='';
     Mn:=okrug(mn,2);
     Mn:=Abs(Mn);
     RUB:=trunc(mn);
     kop:=strtoint(right(floattostrf(mn,fffixed,19,2),2));
     sw2:='00'+trim(inttostr(kop));
     sw3:=copy(sw2,length(sw2)-1,2);
     RUB_SOKR:=sw4+trim(inttostr(rub))+' руб. '+sw3+' коп.';
end;

function MONEY_CHAR(mn:double;pol:integer):ansistring;
CONST
     POL1S:array[1..3] of ansistring =('один','одна','одно');
     POL2S:array[1..3] of ansistring =('два','две','два');
     STUP:array[1..5,1..3] of ansistring=(('','',''),('тысяча','тысячи','тысяч'),
                                      ('миллион','миллиона','миллионов'),
                                      ('миллиард','миллиарда','миллиардов'),
                                      ('трилион','трилиона','трилионов'));
     ONE:array[3..9] of ansistring=('три','четыре','пять','шесть','семь','восемь','девять');
     DC11:array[1..10] of ansistring=('десять','одиннадцать','двенадцать','тринадцать','четырнадцать',
                                 'пятнадцать','шестнадцать','семнадцать','восемнадцать','девятнадцать');
     DEC:array[2..9] of ansistring=('двадцать','тридцать','сорок','пятьдесят','шестьдесят','семьдесят','восемьдесят','девяносто');
     HUN:array[0..9] of ansistring=('','сто','двести','триста','четыреста','пятьсот','шестьсот','семьсот','восемьсот','девятьсот');
VAR
   kop:integer;                     {Копейки}
   RUB:longint;                     {Рубли}
   SW1,sw2,sw3,sw4,sw5,sw6:ansistring;
   n1,n2,n3:integer;
begin
     if Mn<0 then sw6:='Минус ' else sw6:='';
     Mn:=okrug(mn,2);
     Mn:=Abs(Mn);
     RUB:=trunc(mn);
{     kop:=round((mn-rub)*100);}
{     MONEY_CHAR:=inttostr(rub)+'-'+inttostr(kop);}
     {преобразуем рубли в строку}
     if rub=0 then MONEY_CHAR:='Ноль' else begin
     SW1:='0000000000000000000000000'+trim(inttostr(rub));
     {разбиваем на тройки и прооизводим преобразования}
     sw5:='';
     for n1:=1 to (length(sw1) div 3) do begin
         sw4:='';
         sw3:=copy(sw1,length(sw1)-(n1*3)+1,3);
         n3:=strtoint(sw3);
         n2:=strtoint(sw3[1]);
         sw4:=sw4+HUN[n2];
         sw2:=copy(sw3,2,2);
         n2:=strtoint(sw2);
         if n2>0 then
         if (n2>19) then begin
            n2:=strtoint(sw2[1]);
            sw4:=sw4+' '+DEC[n2];
            n2:=strtoint(sw2[2]);
            if n2>2 then begin
                 sw4:=sw4+' '+ONE[n2]
            end else case n1 of
                1: case n2 of {Проверяется превая тройка}
                       1: sw4:=sw4+' '+POL1S[pol];
                       2: sw4:=sw4+' '+POL2S[pol];
                   end;
                2: case n2 of  {Проверяются тысячи}
                       0: sw4:=sw4;
                       1: sw4:=sw4+' '+POL1S[2];
                       2: sw4:=sw4+' '+POL2S[2];
                   end;
                3,4,5: case n2 of  {Проверяются миллионы, миллиарды, трилионы}
                       0: sw4:=sw4;
                       1: sw4:=sw4+' '+POL1S[1];
                       2: sw4:=sw4+' '+POL2S[1];
                   end;
           end;
         end else begin
             {Число меньше 20}
             if n2>9 then
                {Число больше 9}
                sw4:=sw4+' '+DC11[n2-9]
             else begin
                {Число меньше 10}
                if n2>2 then sw4:=sw4+' '+ONE[n2] else case n1 of
                   1: case n2 of {Проверяется превая тройка}
                       1: sw4:=sw4+' '+POL1S[pol];
                       2: sw4:=sw4+' '+POL2S[pol];
                   end;
                2: case n2 of  {Проверяются тысячи}
                       1: sw4:=sw4+' '+POL1S[2];
                       2: sw4:=sw4+' '+POL2S[2];
                   end;
                3,4,5: case n2 of  {Проверяются миллионы, миллиарды, трилионы}
                       1: sw4:=sw4+' '+POL1S[1];
                       2: sw4:=sw4+' '+POL2S[1];
                   end;
                end;
             end;
         end;
         if sw4<>'' then sw5:=sw4+' '+okon_char(stup[n1,1],stup[n1,2],stup[n1,3],n3)+' '+sw5;
     end;
     sw5:=trim(sw5);
     MONEY_CHAR:=sw6+ansiuppercase(sw5[1])+right(sw5,length(sw5)-1);
     {Делаем первую букву заглавной}
     end;
end;

function OKON_CHAR(s1,s2,s3:ansistring;mn:double):ansistring;
var
   n1,n2:integer;
   sw1:ansistring;
begin
     Mn:=okrug(mn,2);
     mn:=abs(mn);
     n1:=trunc(mn);
     sw1:='000'+trim(inttostr(n1));
     n2:=strtoint(copy(sw1,length(sw1)-1,2));
     if ((n2>9) and (n2<21)) or (n2=0) then OKON_CHAR:=s3
     else if (n2>20) or (n2<10) then begin
         n2:=strtoint(copy(sw1,length(sw1),1));
         case n2 of
              1: OKON_CHAR:=s1;
              2,3,4: OKON_CHAR:=s2
              else OKON_CHAR:=s3;
         end;
     end;
end;

function MESSBOX(S1,S2:ansistring;N1:INTEGER):INTEGER;
VAR
   PS1,PS2:array[0..255] of char;
begin
     strpcopy(PS1,S1);
     strpcopy(PS2,S2);
     MESSBOX:=APPLICATION.MESSAGEBOX(PS1,PS2,N1);
end;

function right(s:ansistring;n:integer):ansistring;
var
   r:integer;
begin
     if length(s)<n then for r:=1 to length(s)-n do s:=' '+s;
     right:=copy(s,length(s)-n+1,n);
end;

function left(s:ansistring;n:integer):ansistring;
var
   r:integer;
begin
     if length(s)<n then for r:=1 to length(s)-n do s:=s+' ';
     left:=copy(s,1,n);
end;

function DATE_SOKR(DT:Tdate):ansistring;
{Фнкция возвращает дату в формате 00-мес-0000}
var
   Year,Month,Day:word;
begin
     DecodeDate(DT, Year, Month, Day);
     DATE_SOKR:=B_utils.left(datetostr(DT),2)+' '+MESSOKR[month]+' '+right(datetostr(DT),4)+' г.';
end;

function DATE_SHORT(DT:Tdate):ansistring;
{Фнкция возвращает дату в формате 00-мес-0000}
var
   Year,Month,Day:word;
begin
     DecodeDate(DT, Year, Month, Day);
     DATE_SHORT:=B_utils.right('00'+inttostr(Day),2)+'/'+
       B_utils.right('00'+inttostr(Month),2)+'/'+
       B_utils.right('0000'+inttostr(Year),4);
end;

function SPACE(N:INTEGER):ansistring;
var
   sw:ansistring;
   a:integer;
begin
     Sw:='';
     for a:=1 to n do sw:=sw+' ';
     SPACE:=sw;
end;

function My_NOW:Tdatetime;
begin
     result:=now();
end;

function strtoboolean(s:ansistring):boolean;
begin
     if s='1' then result:=true else result:=False;
end;

function Mynow:Tdatetime;
begin
  result:=date()+time();
end;


function mytimetostr(DT:tdatetime):string;
var
  hh,mm,ss,s1000:word;
begin
  decodetime(dt,hh,mm,ss,s1000);
  result:=b_utils.right('00'+inttostr(hh),2)+':'+
          b_utils.right('00'+inttostr(mm),2)+':'+
          b_utils.right('00'+inttostr(ss),2)+'.'+
          b_utils.right('000'+inttostr(s1000),3);
end;

end.
