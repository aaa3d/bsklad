
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
  SLangNotFound := 'Sproget ''%s'' blev ikke fundet';
  SInvalidLanguage := 'Ugyldig sprogdefinition';
  SIdRedeclared := 'Identifier generklæret: ';
  SUnknownType := 'Ukendt type: ';
  SIncompatibleTypes := 'Ikke kompatible typer';
  SIdUndeclared := 'Ikke erklæret identifier: ';
  SClassRequired := 'Klasse type påkrævet';
  SIndexRequired := 'Indeks påkrævet';
  SStringError := 'Strenge har ikke properties eller metoder';
  SClassError := 'Klassen %s har ikke nogen default property';
  SArrayRequired := 'Array type påkrævet';
  SVarRequired := 'Variabel påkrævet';
  SNotEnoughParams := 'Ikke tilstrækkelige faktiske parameterer';
  STooManyParams := 'For mange faktiske parameterer';
  SLeftCantAssigned := 'Venstre side kan ikke blive knyttet til';
  SForError := 'For loop variabel skal være en numerisk variabel';
  SEventError := 'Event handler skal være en procedure';

end.
