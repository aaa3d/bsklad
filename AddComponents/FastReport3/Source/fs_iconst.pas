
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
  SLangNotFound := 'Linguagem ''%s'' n�o encontrada';
  SInvalidLanguage := 'Identifica��o de linguagem inv�lida';
  SIdRedeclared := 'Identificador declarado novamente: ';
  SUnknownType := 'Tipo desconhecido: ';
  SIncompatibleTypes := 'Tipos incompat�veis';
  SIdUndeclared := 'Identificador n�o declarado: ';
  SClassRequired := 'Tipo de classe requerido';
  SIndexRequired := '�ndice requerido';
  SStringError := 'Strings n�o possuem propriedades ou m�todos';
  SClassError := 'Classe %s n�o tem uma propriedade padr�o';
  SArrayRequired := 'Tipo vetor requerido';
  SVarRequired := 'Vari�vel requerida';
  SNotEnoughParams := 'Sem par�metros suficientes';
  STooManyParams := 'Par�metros demais';
  SLeftCantAssigned := 'Lado esquerdo n�o pode ser atribu�do';
  SForError := 'Para um la�o a vari�vel deve ser num�rica';
  SEventError := 'Manipulador de evento deve ser um procedimento';

end.
