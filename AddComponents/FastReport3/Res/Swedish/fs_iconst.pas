
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
  SLangNotFound := 'Hittar inte spr�k: ''%s''.';
  SInvalidLanguage := 'Felaktig spr�kdefinition';
  SIdRedeclared := 'Identifiera finns redan: ';
  SUnknownType := 'Ok�nd typ: ';
  SIncompatibleTypes := 'Okompatibel typ';
  SIdUndeclared := 'Odeklarerad identifierare: ';
  SClassRequired := 'Klasstyp m�ste ange';
  SIndexRequired := 'Index m�ste anges';
  SStringError := 'Str�ngar har inte medoder eller egenskaper';
  SClassError := 'Klass %s har ingen f�rvald egenskap (property)';
  SArrayRequired := 'Matris typ m�ste anges';
  SVarRequired := 'Variabel m�ste anges';
  SNotEnoughParams := 'Otillr�ckligt antal parametrar';
  STooManyParams := 'F�r m�nga parametrar';
  SLeftCantAssigned := 'V�nster sida kan inte tilldelas';
  SForError := 'Enbart numersikt v�rde kan tilldelas For loop';
  SEventError := 'H�ndelsehanterare m�ste vara en procedur';

end.
