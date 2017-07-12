
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
  SInvalidLanguage := 'Identificação de linguagem inválida';
  SIdRedeclared := 'Identificador declarado novamente: ';
  SUnknownType := 'Tipo desconhecido: ';
  SIncompatibleTypes := 'Tipos incompatíveis';
  SIdUndeclared := 'Identificador não declarado: ';
  SClassRequired := 'Tipo de classe requerido';
  SIndexRequired := 'Índice requerido';
  SStringError := 'Strings não possuem propriedades ou métodos';
  SClassError := 'Classe %s não tem uma propriedade padrão';
  SArrayRequired := 'Tipo vetor requerido';
  SVarRequired := 'Variável requerida';
  SNotEnoughParams := 'Sem parâmetros suficientes';
  STooManyParams := 'Parâmetros demais';
  SLeftCantAssigned := 'Lado esquerdo não pode ser atribuído';
  SForError := 'Para um laço a variável deve ser numérica';
  SEventError := 'Manipulador de evento deve ser um procedimento';

end.
