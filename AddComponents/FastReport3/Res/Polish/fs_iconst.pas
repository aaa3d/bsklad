
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
  SLangNotFound := 'Jêzyk ''%s'' nie zosta³ znaleziony';
  SInvalidLanguage := 'B³êdna definicja jêzyka';
  SIdRedeclared := 'Powtórnie zadeklarowany identyfikator: ';
  SUnknownType := 'Nieznany typ: ';
  SIncompatibleTypes := 'Niezgodne typy';
  SIdUndeclared := 'Niezadeklarowany identyfikator: ';
  SClassRequired := 'Wymagany typ klasy';
  SIndexRequired := 'Wymagany indeks';
  SStringError := 'Ci¹gi nie posiadaj¹ w³aœciwoœci lub metod';
  SClassError := 'Klasa %s nie posiada domyœlnych w³aœciowoœci';
  SArrayRequired := 'Wymagany typ tablicy';
  SVarRequired := 'Wymagana zmienna';
  SNotEnoughParams := 'Niewystarczaj¹ca iloœæ parametrów';
  STooManyParams := 'Zbyt du¿a iloœæ parametrów';
  SLeftCantAssigned := 'Lewa strona nie mo¿e byæ przyporz¹dkowana do';
  SForError := 'Zmienna pêtli musi byæ numeryczna';
  SEventError := 'Uchwyt zdarzenia musi byæ procedur¹';

end.
