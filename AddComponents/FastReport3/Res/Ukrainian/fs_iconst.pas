
{******************************************}
{                                          }
{             FastReport v3.0              }
{         Language resource file           }
{                                          }
{         Copyright (c) 1998-2005          }
{         by Alexander Tzyganenko,         }
{            Fast Reports Inc.             }
{                                          }
{         Translated by Sergiy Sekela      }
{         Ternopil, Ukraine                }
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
  SLangNotFound := 'Мову ''%s'' не знайдено';
  SInvalidLanguage := 'Помилка в описі мови';
  SIdRedeclared := 'Ідентифікатор перевизначений: ';
  SUnknownType := 'Невідомий тип: ';
  SIncompatibleTypes := 'Несумісні типи';
  SIdUndeclared := 'Невизначений ідентифікатор: ';
  SClassRequired := 'Очікується клас';
  SIndexRequired := 'Очікується індекс';
  SStringError := 'Рядок не має властивостей або методів';
  SClassError := 'Клас %s не містить властивості за замовчуванням';
  SArrayRequired := 'Очікується масив';
  SVarRequired := 'Очікується змінна';
  SNotEnoughParams := 'Недостатньо параметрів';
  STooManyParams := 'Занадто багато параметрів';
  SLeftCantAssigned := 'Ліва частина виразу не може бути привласнена';
  SForError := 'Змінна циклу FOR повинна бути числовою';
  SEventError := 'Оброблювач події повинен бути процедурою';


end.
