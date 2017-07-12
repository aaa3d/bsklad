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
         Attr: byte;        {������� ������ ������}
         Line: string[17];  {������ �� 16 �������� + $00 (delimiter)}
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
       Summ: double;      {����� �������}
       Section: byte;     {����� ������}
       TovGr: byte;       {����� ������� ������}
       end;

TSlotCheck = record
       SlotCondition: byte;     {��������� �������� ����� 0/1 -                       }
                                {���� �������(������������ ��)/���� �������� ���������}
       DocumentType: byte;      {��� ����������� ��������� - 0/1/2 - ���/��������� �����/������ �������}
       CheckNumber: integer;    {����� ����}
       Date: string[8];         {���� ������}
       Time: string[5];         {����� ������}
       AddSubSumm: double;      {��������� ������ �����}
       Kassir: byte;            {����� �������}
       SaleCount: byte;         {���������� ������� � ����}
       SaleArray: array [0..39] of TSaleX; {������ �������}
       PaymentType: byte;       {��� ������ - 0/1 - ���/������}
       IsPrRet: byte;           {������� �������� 0/1 - ���/����}
       SkdNdb: byte;            {0/1 - ������/��������}
       NumberSkdNdb: byte;      {����� ������/�������� �� ���}
       IsNal: byte;             {����� �� ��� 0/1 - ���/����}
       end;

TXProgressEvent = procedure(Max, Count: Integer); StdCall;
TIsStopFlag = function: integer; StdCall;



var


 Errors: array [0..73] of string = (
  '�������� ��������� �������',                                          //0
  '�������� ��� ����������',                                             //1
  '�������� ����� �����',                                                //2
  '������ ������������� �����',                                          //3
  '���������� ������� ������� �����',                                    //4
  '�� ������ ������� ������ ����',                                       //5
  '���������� �������� ������� � ������� �����',                         //6
  '���������� ����� ������� ������ 1 �������',                           //7
  '��������� ����������� ����� �������',                                 //8
  '���������� ������� � ���� ������ 40',                                 //9
  '���������� ������� � ���� ������ 1',                                  //10
  '�� ������ ������� ������ X-������',                                   //11
  '�� ������ ������� ������ Z-������',                                   //12
  '����� ����� ���� ������ 1',                                           //13
  '����� ����� ���� ������ 4000',                                        //14
  '������� ������������ ����� ���',                                      //15
  '�� ������ ������� ������ ����� ����',                                 //16
  '�������� �� �������� ������ �� ���� ���� ������',                     //17
  '�������� �� �������� ������ �� ���� ���� ������',                     //18
  '�� ������ ������� ������ ����� ����',                                 //19
  '�� ������ ������� ������ ����� ������',                               //20
  '�� ������ ������� ������� ����� ������',                              //21
  '������ ������ ���',                                                   //22
  '�������� �������� �������� ������ (������ ������)',                   //23
  '����������� ����������� ������ (delimiter)',                          //24
  '���������� ����� ��������� �������� ��������� ��� "����������� ����"',//25
  '��� ������� ��� ������ Z-������',                                     //26
  '�������� �������� ������',                                            //27
  '������������� ���� (������������ ����� ������ ��� �������� � �����)', //28
  '�� ������ ���� Code.dat � ����� ����������',                          //29
  '������������ ������ ����������� �����. ���������� ������� ��.',       //30
  '� ������� ����� 1-�� ���� ������ 24 ����. ���������� ������� ��.',    //31
  '�������� ��� X-������',                                               //32
  '�������� �������� ������� ��� ������ ����� ��������� ����',           //33
  '�������� �������� ������� ��� ������ ����� ��������� ����',           //34
  '������ ���������� � ���',                                             //35
  '���������� ������ ������ �� ��� �� 1.0.4',                            //36
  '���������� ������� Z-�����',                                          //37
  '��� ����������� ����� ��� ������',                                    //38
  '��� �������',                                                         //39

  '�� ������ ���� Check200.DBF',                                         //40
  '�� �������� ������� ���� Check200.DBF',                               //41
  '�� ������ ���� Titl200.DBF',                                          //42
  '�� �������� ������� ���� Titl200.DBF',                                //43
  '�� ������ ���� Bott200.DBF',                                          //44
  '�� �������� ������� ���� Bott200.DBF',                                //45
  '','','','',
  '���������� ��������� ����� ����',                                     //50
  '���������� ��������� ����� ��',                                       //51
  '���������� ��������� ����� �-������',                                 //52
  '���������� ��������� ���� ��������',                                  //53
  '���������� ��������� ������ ��������',                                //54
  '���������� ��������� ���������� �����',                               //55
  '���������� ��������� ������ ���������',                               //56
  '���������� ��������� ��������� ������������',                         //57
  '',
  '',
  '�� ���������� ��������� ��������',                                    //60
  '��������� ����� X-������',                                            //61
  '�� ������� ������� ���� X-������',                                    //62
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '�� ������ ����� �������',                                             //70
  '�� ������ �������� ��������� ��������',                               //71
  '�� ������ �������� ����������� ������',                               //72
  '���������� ��������� � ������ �������� ������� �� ���');              //73



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
//��� ������ CallBack ������� IsStopFlag ����� �������� �������
//�������� ������� �� ��� �� ���������������� ��������� 
Result:=StopFlag;
end;



end.










