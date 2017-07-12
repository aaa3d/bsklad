
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
  SLangNotFound := 'Llenguatge ''%s'' no trobat';
  SInvalidLanguage := 'Definició de llenguatge erroni';
  SIdRedeclared := 'Identificador redeclarat: ';
  SUnknownType := 'Tipus no conegut: ';
  SIncompatibleTypes := 'Tipus incompatibles';
  SIdUndeclared := 'Identificador no declarat: ';
  SClassRequired := 'Tipus de classe requerida';
  SIndexRequired := 'Índex requerit';
  SStringError := 'Cadenes no tenen propietat o mètodes';
  SClassError := 'Classe %s no té una propietat per defecte';
  SArrayRequired := 'Tipus Matriu requerit';
  SVarRequired := 'Variable requerida';
  SNotEnoughParams := 'Falten paràmetres';
  STooManyParams := 'Masses paràmetres';
  SLeftCantAssigned := 'El costat esquerre no pot ser assignat';
  SForError := 'La variable per loop ha de ser numèrica';
  SEventError := 'El manejador de successos ha de ser un procedure';

end.
