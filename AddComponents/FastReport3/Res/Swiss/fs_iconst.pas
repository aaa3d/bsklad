// German translation by Wolfgang Kleinrath 2004.09.03
// Weitere Anpassungen von Robert Wismet (www.rowisoft.de) 2004.10.10
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
  SLangNotFound := 'Sprache ''%s'' nicht gefunden';
  SInvalidLanguage := 'Ungültige Sprachdefinition';
  SIdRedeclared := 'Doppelter Bezeichner: ';
  SUnknownType := 'Unbekannter Typ: ';
  SIncompatibleTypes := 'Inkompatible Typen';
  SIdUndeclared := 'Undefinierter Bezeichner: ';
  SClassRequired := 'Klassentyp erforderlich';
  SIndexRequired := 'Index erforderlich';
  SStringError := 'Zeichenketten haben keine Eigenschaften oder Methoden';
  SClassError := 'Klasse %s hat keine Standardeigenschaft';
  SArrayRequired := 'Arraytyp erforderlich';
  SVarRequired := 'Variable erforderlich';
  SNotEnoughParams := 'Nicht genügend wirkliche Parameter';
  STooManyParams := 'Zu viele wirkliche Parameter';
  SLeftCantAssigned := 'Die linke Seite kann nicht zugewiesen werden';
  SForError := 'Variable einer Forschleife muss nummerisch sein';
  SEventError := 'Event-Handler muss eine Prozedur sein';

end.
