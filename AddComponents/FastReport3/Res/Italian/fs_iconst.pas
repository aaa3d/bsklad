
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
  SLangNotFound := 'Lingua ''%s'' non trovata';
  SInvalidLanguage := 'Definizione della lingua errata';
  SIdRedeclared := 'Identificatore ridichiarato: ';
  SUnknownType := 'Tipo sconosciuto: ';
  SIncompatibleTypes := 'Tipi incompatibili';
  SIdUndeclared := 'Identificatore non dichiarato: ';
  SClassRequired := 'E'' richiesta una classe';
  SIndexRequired := 'E'' richiesta un indice';
  SStringError := 'Le stringhe non hanno proprietà o metodi';
  SClassError := 'Le classi %s non hanno una proprietà predefinita';
  SArrayRequired := 'E'' richiesto il tipo vettore';
  SVarRequired := 'Variabile richiesta';
  SNotEnoughParams := 'Parametri insufficienti';
  STooManyParams := 'Ci sono troppo paramentri';
  SLeftCantAssigned := 'La parte sinistra non può essere assegnata a';
  SForError := 'Le variabili dei cicli For devono essere variabili di tipo numerico';
  SEventError := 'Il gestore di evento deve essere una procedura';

end.
