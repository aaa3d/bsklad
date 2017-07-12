
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
  SLangNotFound := 'Linguagem ''%s'' não encontrada';
  SInvalidLanguage := 'Definição inválida de linguagem';
  SIdRedeclared := 'Identificador redeclarado: ';
  SUnknownType := 'Tipo desconhecido: ';
  SIncompatibleTypes := 'Tipos incompatíveis';
  SIdUndeclared := 'Identificador não declarado: ';
  SClassRequired := 'Requerido tipo Class';
  SIndexRequired := 'Índice requerido';
  SStringError := 'Strings não têm propriedades ou métodos';
  SClassError := 'Classe %s não tem um valor por defeito';
  SArrayRequired := 'Tipo Array esperado';
  SVarRequired := 'Variável requerida';
  SNotEnoughParams := 'Sem parâmetros suficientes';
  STooManyParams := 'Demasiados parâmetros';
  SLeftCantAssigned := 'Não pode atribuir valores ao lado esquerdo';
  SForError := 'Variável do ciclo "For" tem de ser numérica';
  SEventError := 'Manipulador de eventos tem de ser um procedimento';

end.
