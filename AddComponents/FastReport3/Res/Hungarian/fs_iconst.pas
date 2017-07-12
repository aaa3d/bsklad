
{******************************************}
{                                          }
{             FastScript v1.7              }
{                Resources                 }
{                                          }
{ (c) 2003, 2004 by Alexander Tzyganenko,  }
{             Fast Reports, Inc            }
{                                          }
{******************************************}

unit fs_iconst;

interface

{$i fs.inc}

var
  SLangNotFound: String;
  SInvalidLanguage: String;
  SIdRedeclared: String;
  SUnknownType: String;
  SIncompatibleTypes: String;
  SIdUndeclared: String;
  SClassRequired: String;
  SIndexRequired: String;
  SStringError: String;
  SClassError: String;
  SArrayRequired: String;
  SVarRequired: String;
  SNotEnoughParams: String;
  STooManyParams: String;
  SLeftCantAssigned: String;
  SForError: String;
  SEventError: String;


implementation

initialization
  SLangNotFound := 'A ''%s'' nyelv nem tal�lhat�';
  SInvalidLanguage := 'Hib�s nyelv defin�ci�';
  SIdRedeclared := 'Ism�tel v�ltoz�deklar�l�s: ';
  SUnknownType := 'Ismeretlen t�pus: ';
  SIncompatibleTypes := 'Nem kompatibilis t�pusok';
  SIdUndeclared := 'Ismeretlen v�ltoz�: ';
  SClassRequired := 'Oszt�ly t�pus sz�ks�ges';
  SIndexRequired := 'Index required';
  SStringError := 'Stringek amelyeknek nincs tulajdons�ga vagy met�dusa';
  SClassError := 'A %s oszt�ly nem rendelkezik alap�rtelmezett tulajdons�ggal';
  SArrayRequired := 'T�mb t�pus sz�ks�ges';
  SVarRequired := 'V�ltoz� sz�ks�ges';
  SNotEnoughParams := 'Nem elegend� a param�ter';
  STooManyParams := 'T�l sok param�ter';
  SLeftCantAssigned := 'A bal oldallal nem tehet� egyenl�v�';
  SForError := 'A cilkusv�ltoz�nak sz�mnak kell lennie';
  SEventError := 'Az esem�nykezel�nek elj�r�snak (procedure) kell lennie.';

end.
