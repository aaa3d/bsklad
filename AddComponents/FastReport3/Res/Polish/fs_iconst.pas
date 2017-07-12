
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
  SLangNotFound := 'J�zyk ''%s'' nie zosta� znaleziony';
  SInvalidLanguage := 'B��dna definicja j�zyka';
  SIdRedeclared := 'Powt�rnie zadeklarowany identyfikator: ';
  SUnknownType := 'Nieznany typ: ';
  SIncompatibleTypes := 'Niezgodne typy';
  SIdUndeclared := 'Niezadeklarowany identyfikator: ';
  SClassRequired := 'Wymagany typ klasy';
  SIndexRequired := 'Wymagany indeks';
  SStringError := 'Ci�gi nie posiadaj� w�a�ciwo�ci lub metod';
  SClassError := 'Klasa %s nie posiada domy�lnych w�a�ciowo�ci';
  SArrayRequired := 'Wymagany typ tablicy';
  SVarRequired := 'Wymagana zmienna';
  SNotEnoughParams := 'Niewystarczaj�ca ilo�� parametr�w';
  STooManyParams := 'Zbyt du�a ilo�� parametr�w';
  SLeftCantAssigned := 'Lewa strona nie mo�e by� przyporz�dkowana do';
  SForError := 'Zmienna p�tli musi by� numeryczna';
  SEventError := 'Uchwyt zdarzenia musi by� procedur�';

end.
