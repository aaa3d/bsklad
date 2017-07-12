
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
  SLangNotFound := 'Lenguaje ''%s'' no encontrado';
  SInvalidLanguage := 'Lenguaje no v�lido';
  SIdRedeclared := 'Identificador redeclarado: ';
  SUnknownType := 'Tipo desconocido: ';
  SIncompatibleTypes := 'Tipos incompatibles';
  SIdUndeclared := 'Identificador no declarado: ';
  SClassRequired := 'Se requiere el tipo de la clase';
  SIndexRequired := 'Se requiere un �ndice';
  SStringError := 'La cadena no est� entre las propiedades o m�todos';
  SClassError := 'La clase %s no tiene propiedad por defecto';
  SArrayRequired := 'Se requiere un Array';
  SVarRequired := 'Variable requirida';
  SNotEnoughParams := 'Faltan par�metros';
  STooManyParams := 'Sobran par�metros';
  SLeftCantAssigned := 'El lado izquierdo no se puede asignar a';
  SForError := 'Los bucles For necesitan una variable num�rica';
  SEventError := 'El manejador del evento ha de ser un procedimiento';


end.
