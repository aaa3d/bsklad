
{******************************************}
{                                          }
{             FastScript v1.7              }
{                Resources                 }
{                                          }
{ (c) 2003, 2004 by Alexander Tzyganenko,  }
{             Fast Reports, Inc            }
{                                          }
{******************************************}
{    Romanian resource                     }
{    Translated by: Sorin Pohontu          }
{    www.frontline.ro                      }
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
  SLangNotFound := 'Limbajul ''%s'' nu a fost gasit';
  SInvalidLanguage := 'Definitie incorecta a limbajului';
  SIdRedeclared := 'Identificator redeclarat: ';
  SUnknownType := 'Tip necunoscut: ';
  SIncompatibleTypes := 'Tipuri incompatibile';
  SIdUndeclared := 'Identificator nedeclarat: ';
  SClassRequired := 'Tipul clasei este necesar';
  SIndexRequired := 'Index necesar';
  SStringError := 'String-urile nu au proprietati sau metode';
  SClassError := 'Clasa %s nu are o proprietate implicita';
  SArrayRequired := 'Tipul matricei este necesar';
  SVarRequired := 'Variabila necesara';
  SNotEnoughParams := 'Insuficienti parametri';
  STooManyParams := 'Prea multi parametri';
  SLeftCantAssigned := 'Partea din stanga nu poate fi atribuita catre';
  SForError := 'Variabila din bucla For trebuie sa fie numerica';
  SEventError := 'Descriptorul de evenimente handler trebuie sa fie o procedura';

end.
