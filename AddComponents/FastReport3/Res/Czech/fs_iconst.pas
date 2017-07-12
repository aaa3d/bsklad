
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
  SInvalidLanguage := 'Neplatn� definice jazyka';
  SIdRedeclared := 'Identifik�tor p�edeklarov�n: ';
  SUnknownType := 'Nezn�m� typ: ';
  SIncompatibleTypes := 'Nekompatibiln� typy';
  SIdUndeclared := 'Nedeklarovan� identifik�tor: ';
  SClassRequired := 'Po�adov�n typ t��dy';
  SIndexRequired := 'Po�adov�n index';
  SStringError := '�et�zec nem� vlastnosti, nebo metody';
  SClassError := 'T��da %s neobsahuje z�kladn� vlastnost';
  SArrayRequired := 'Po�adov�n typ pole';
  SVarRequired := 'Po�adov�na prom�nn�';
  SNotEnoughParams := 'Nedostatek aktu�ln�ch parametr�';
  STooManyParams := 'P��li� mnoho aktu�ln�ch parametr�';
  SLeftCantAssigned := 'Lev� stranu nelze p�i�adit k';
  SForError := 'Pro prom�nnou smy�ky mus� b�t ��seln� prom�nn�';
  SEventError := 'Handler ud�losti mus� b�t procedura';

end.
