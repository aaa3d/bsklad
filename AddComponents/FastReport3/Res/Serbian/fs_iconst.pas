
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
  SLangNotFound := 'Језик ''%s'' није нађен';
  SInvalidLanguage := 'Погрешна дефиниција језика';
  SIdRedeclared := 'Идентификатор редекларисан: ';
  SUnknownType := 'Непознат тип: ';
  SIncompatibleTypes := 'Некомпатибилни типови';
  SIdUndeclared := 'Недекларисан Идентификатор: ';
  SClassRequired := 'Захтеван Тип Класе';
  SIndexRequired := 'Захтеван индекс';
  SStringError := 'Стрингови немају особине и методе';
  SClassError := 'Класа %s нема подразумевану особину';
  SArrayRequired := 'Тип поље (низ) захтеван';
  SVarRequired := 'Захтевана променљива';
  SNotEnoughParams := 'Недостају параметри';
  STooManyParams := 'Превише параметара';
  SLeftCantAssigned := 'Лева страна не може бити додељена на';
  SForError := 'Кружна променљива мора бити нумеручке вредности';
  SEventError := 'Догађај мора бити процедура';


end.
