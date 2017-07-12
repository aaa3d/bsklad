
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
  SLangNotFound := 'Hittar inte språk: ''%s''.';
  SInvalidLanguage := 'Felaktig språkdefinition';
  SIdRedeclared := 'Identifiera finns redan: ';
  SUnknownType := 'Okänd typ: ';
  SIncompatibleTypes := 'Okompatibel typ';
  SIdUndeclared := 'Odeklarerad identifierare: ';
  SClassRequired := 'Klasstyp måste ange';
  SIndexRequired := 'Index måste anges';
  SStringError := 'Strängar har inte medoder eller egenskaper';
  SClassError := 'Klass %s har ingen förvald egenskap (property)';
  SArrayRequired := 'Matris typ måste anges';
  SVarRequired := 'Variabel måste anges';
  SNotEnoughParams := 'Otillräckligt antal parametrar';
  STooManyParams := 'För många parametrar';
  SLeftCantAssigned := 'Vänster sida kan inte tilldelas';
  SForError := 'Enbart numersikt värde kan tilldelas For loop';
  SEventError := 'Händelsehanterare måste vara en procedur';

end.
