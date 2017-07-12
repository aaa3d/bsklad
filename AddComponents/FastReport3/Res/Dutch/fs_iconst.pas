
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
  SLangNotFound := 'Taal ''%s'' is niet gevonden';
  SInvalidLanguage := 'Ongeldigde taal definitie';
  SIdRedeclared := 'Identifier opnieuw gedeclareerd: ';
  SUnknownType := 'Onbekend type: ';
  SIncompatibleTypes := 'Incompatibele types';
  SIdUndeclared := 'Ongedeclareerde identifier: ';
  SClassRequired := 'Klasse type is vereist';
  SIndexRequired := 'Index is vereist';
  SStringError := 'Strings heeft geen eigenschappen of methodes';
  SClassError := 'Klasse %s heeft geen default eigenschap';
  SArrayRequired := 'Array type is vereist';
  SVarRequired := 'Variabele is vereist';
  SNotEnoughParams := 'Niet genoeg aangeleverde parameters';
  STooManyParams := 'Te veel aangeleverde parameters';
  SLeftCantAssigned := 'Linker zijde kan niet toegewezen worden aan';
  SForError := 'For loop variabele moet een numerieke variabele zijn';
  SEventError := 'Event handler moet een procedure zijn';

end.
