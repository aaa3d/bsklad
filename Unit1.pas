unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Gauges;

type

 TSale = record
  Oper1: double;
  Oper2: double;
  Section: byte;
  TovGr: byte;
  Name:  string[16];
  end;

 TStat = record
    TItog    :array [0..15] of double;
    Tret     :array [0..15] of double;
    TSumKs   :double;
    TRetKs   :double;
    TKassir  :array [0..7] of double;
    TretKass :array [0..7] of double;
    TSumNal  :double;
    TSumBnal :double;
    TVnNal   :double;
    TSnNal   :double;
    end;

 TLine = Record
         Attr: byte;        {атрибут печати строки}
         Line: string[17];  {строка из 16 символов + $00 (delimiter)}
         end;

 TTitle = record
          pos: integer;
          lines: array [1..2] of TLine;
          end;

 TBottom= record
          pos: integer;
          lines: array [1..2] of TLine;
          end;

TSaleX = record
       Summ: double;      {сумма покупки}
       Section: byte;     {номер отдела}
       TovGr: byte;       {номер тораной группы}
       end;

TSlotCheck = record
       SlotCondition: byte;     {состояние хранения слота 0/1 -                       }
                                {слот сбойный(несовпадение КС)/слот хранится нормально}
       DocumentType: byte;      {тип выведенного документа - 0/1/2 - чек/внесенная сумма/снятая выручка}
       CheckNumber: integer;    {номер чека}
       Date: string[8];         {дата вывода}
       Time: string[5];         {время вывода}
       AddSubSumm: double;      {внесенная снятая сумма}
       Kassir: byte;            {номер кассира}
       SaleCount: byte;         {количество покупок в чеке}
       SaleArray: array [0..39] of TSaleX; {массив покупок}
       PaymentType: byte;       {вид оплаты - 0/1 - нал/безнал}
       IsPrRet: byte;           {признак возврата 0/1 - нет/есть}
       SkdNdb: byte;            {0/1 - скидка/надбавка}
       NumberSkdNdb: byte;      {номер скидки/надбавки на чек}
       IsNal: byte;             {налог на чек 0/1 - нет/есть}
       end;

TXProgressEvent = procedure(Max, Count: Integer); StdCall;
TIsStopFlag = function: integer; StdCall;



var


 Errors: array [0..73] of string = (
  'Операция завершена успешно',                                          //0
  'Неверный код поставщика',                                             //1
  'Неверный номер порта',                                                //2
  'Ошибка инициализации порта',                                          //3
  'Невозможно открыть чековый буфер',                                    //4
  'Не прошла команда выдачи чека',                                       //5
  'Невозможно добавить покупку в чековый буфер',                         //6
  'Полученная сумма покупки меньше 1 копейки',                           //7
  'Превышена разрядность суммы покупки',                                 //8
  'Количество покупок в чеке больше 40',                                 //9
  'Количество покупок в чеке меньше 1',                                  //10
  'Не прошла команда вывода X-отчета',                                   //11
  'Не прошла команда вывода Z-отчета',                                   //12
  'Номер слота базы меньше 1',                                           //13
  'Номер слота базы больше 4000',                                        //14
  'Получен некорректный номер ККМ',                                      //15
  'Не прошла команда чтения слота базы',                                 //16
  'Получены не цифровые данные из поля кода товара',                     //17
  'Получены не цифровые данные из поля цены товара',                     //18
  'Не прошла команда записи слота базы',                                 //19
  'Не прошла команда чтения учета товара',                               //20
  'Не прошла команда очистки учета товара',                              //21
  'Ошибка чтения ОЗУ',                                                   //22
  'Неверное значение атрибута печати (ширины печати)',                   //23
  'Отсутствует разделитель строки (delimiter)',                          //24
  'Полученная сумма превышает значение параметра ККМ "ОГРАНИЧЕНИЕ СУММ"',//25
  'Нет покупок для вывода Z-отчета',                                     //26
  'Неверное значение отдела',                                            //27
  'Отрицательный итог (возвращаемая сумма больше чем наличные в кассе)', //28
  'Не найден файл Code.dat с кодом поставщика',                          //29
  'Переполнение буфера контрольной ленты. Необходимо вывести КЛ.',       //30
  'С момента вывод 1-го чека прошло 24 часа. Необходимо вывести КЛ.',    //31
  'Неверный тип X-отчета',                                               //32
  'Неверное значение позиции для печати строк заголовка чека',           //33
  'Неверное значение позиции для печати строк окончания чека',           //34
  'Ошибка интерфейса с ККМ',                                             //35
  'Необходима замена версии ПО ККМ на 1.0.4',                            //36
  'Необходимо вывести Z-отчет',                                          //37
  'Нет достаточной суммы для снятия',                                    //38
  'Чек отменен',                                                         //39

  'Не найден файл Check200.DBF',                                         //40
  'Не удаеться открыть файл Check200.DBF',                               //41
  'Не найден файл Titl200.DBF',                                          //42
  'Не удаеться открыть файл Titl200.DBF',                                //43
  'Не найден файл Bott200.DBF',                                          //44
  'Не удаеться открыть файл Bott200.DBF',                                //45
  '','','','',
  'Необходимо закончить вывод чека',                                     //50
  'Необходимо закончить вывод КЛ',                                       //51
  'Необходимо закончить вывод Х-отчета',                                 //52
  'Необходимо закончить ввод наличных',                                  //53
  'Необходимо закончить снятие наличных',                                //54
  'Необходимо закончить фискальный отчет',                               //55
  'Необходимо закончить печать установок',                               //56
  'Необходимо закончить квитанцию фискализации',                         //57
  '',
  '',
  'Не достаточно внесенных наличных',                                    //60
  'Достигнут конец X-отчета',                                            //61
  'Не удается создать файл X-отчета',                                    //62
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  'Не верный номер команды',                                             //70
  'Не верное значение внесенных наличных',                               //71
  'Не верное значение назначенной скидки',                               //72
  'Библиотека находится в режиме ожидания запроса от ККМ');              //73



   procedure wdelay(interval: DWORD);
   procedure XOnProgress(Max, Count: integer); stdcall;
   function IsStopFlag: integer; stdcall;

implementation



function SetPort(port: integer): integer;stdcall;external 'A200ChOnLine.DLL';
function ResetPort: integer;stdcall;external 'A200ChOnLine.DLL';

function OutCheck(k: pointer;l: pointer;num: integer;n: pointer; f: integer): integer;stdcall;external 'A200ChOnLine.DLL';
function ReturnP(k: pointer;l: pointer;num: integer;n: pointer; f: integer): integer;stdcall;external 'A200ChOnLine.DLL';
function OutBezNal(k: pointer;l: pointer;num: integer;n: pointer; f: integer): integer;stdcall;external 'A200ChOnLine.DLL';
function OutCheck_DBF(TitPath: PChar;CheckPath: PChar;BotPath: PChar; f: integer): integer; stdcall;external 'A200ChOnLine.DLL';
function ReturnP_DBF(TitPath: PChar;CheckPath: PChar;BotPath: PChar; f: integer): integer; stdcall;external 'A200ChOnLine.DLL';
function OutBezNal_DBF(TitPath: PChar;CheckPath: PChar;BotPath: PChar; f: integer): integer; stdcall;external 'A200ChOnLine.DLL';

function GetStatist(m: pointer): integer;stdcall;external 'A200ChOnLine.DLL';
function GetKlNumber(var KLNumber: integer): integer;stdcall;external 'A200ChOnLine.DLL';
function BlockKKM: integer;stdcall;external 'A200ChOnLine.DLL';
function UnBlockKKM: integer;stdcall;external 'A200ChOnLine.DLL';
function GetKkmError: integer;stdcall;external 'A200ChOnLine.DLL';
function GetPassword: integer; stdcall;external 'A200ChOnLine.DLL';
function GetKkmNumber(var KkmNumber: integer): integer;stdcall;external 'A200ChOnLine.DLL';
function GetCheckNumber(var KkmNumber: integer): integer;stdcall;external 'A200ChOnLine.DLL';
procedure SetVnNal(VnNal: double); stdcall;external 'A200ChOnLine.DLL';
function SetTopX: integer; stdcall;external 'A200ChOnLine.DLL';
function ReadXCheck(SlotCheck: pointer): integer; stdcall;external 'A200ChOnLine.DLL';
function ReadXtoFile(FileName: ShortString): integer; stdcall;external 'A200ChOnLine.DLL';
procedure SetXProgress(Ptr: TXProgressEvent); stdcall;external 'A200ChOnLine.DLL';
procedure SetIsStopFlag(Ptr: TIsStopFlag); stdcall;external 'A200ChOnLine.DLL';
function SetDiscount(Discount: double): integer; stdcall;external 'A200ChOnLine.DLL';









procedure wdelay(interval:DWORD);
var h:DWORD;
begin
h:=GetTickCount;
while (GetTickCount-h)<=interval do
  begin
  Application.ProcessMessages;
  end;
end;



procedure XOnProgress(Max, Count: integer);
begin
Form1.XProgress.MaxValue:=Max;
Form1.XProgress.Progress:=Count;
Application.ProcessMessages;
end;





function IsStopFlag: integer; stdcall;
begin
//при помощи CallBack функции IsStopFlag можно прервать процесс
//ожидания запроса от ККМ из пользовательской программы 
Result:=StopFlag;
end;



end.










