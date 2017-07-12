
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
  SLangNotFound := 'Язык ''%s'' не найден';
  SInvalidLanguage := 'Ошибка в описании языка';
  SIdRedeclared := 'Идентификатор переопределен: ';
  SUnknownType := 'Неизвестный тип: ';
  SIncompatibleTypes := 'Несовместимые типы';
  SIdUndeclared := 'Неопределенный идентификатор: ';
  SClassRequired := 'Ожидается класс';
  SIndexRequired := 'Ожидается индекс';
  SStringError := 'Строка не имеет свойств или методов';
  SClassError := 'Класс %s не содержит свойства по умолчанию';
  SArrayRequired := 'Ожидается массив';
  SVarRequired := 'Ожидается переменная';
  SNotEnoughParams := 'Недостаточно параметров';
  STooManyParams := 'Слишком много параметров';
  SLeftCantAssigned := 'Левая часть выражения не может быть присвоена';
  SForError := 'Переменная цикла FOR должна быть числовой';
  SEventError := 'Обработчик события должен быть процедурой';


end.
