
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
  SLangNotFound := 'Jazyk ''%s'' nenalezen';
  SInvalidLanguage := 'Neplatná definice jazyka';
  SIdRedeclared := 'Identifikátor pøedeklarován: ';
  SUnknownType := 'Neznámý typ: ';
  SIncompatibleTypes := 'Nekompatibilní typy';
  SIdUndeclared := 'Nedeklarovaný identifikátor: ';
  SClassRequired := 'Požadován typ tøídy';
  SIndexRequired := 'Požadován index';
  SStringError := 'Øetìzec nemá vlastnosti, nebo metody';
  SClassError := 'Tøída %s neobsahuje základní vlastnost';
  SArrayRequired := 'Požadován typ pole';
  SVarRequired := 'Požadována promìnná';
  SNotEnoughParams := 'Nedostatek aktuálních parametrù';
  STooManyParams := 'Pøíliš mnoho aktuálních parametrù';
  SLeftCantAssigned := 'Levá stranu nelze pøiøadit k';
  SForError := 'Pro promìnnou smyèky musí být èíselná promìnná';
  SEventError := 'Handler události musí být procedura';

end.
