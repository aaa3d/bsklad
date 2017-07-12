
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
  SInvalidLanguage := 'Defini��o inv�lida de linguagem';
  SIdRedeclared := 'Identificador redeclarado: ';
  SUnknownType := 'Tipo desconhecido: ';
  SIncompatibleTypes := 'Tipos incompat�veis';
  SIdUndeclared := 'Identificador n�o declarado: ';
  SClassRequired := 'Requerido tipo Class';
  SIndexRequired := '�ndice requerido';
  SStringError := 'Strings n�o t�m propriedades ou m�todos';
  SClassError := 'Classe %s n�o tem um valor por defeito';
  SArrayRequired := 'Tipo Array esperado';
  SVarRequired := 'Vari�vel requerida';
  SNotEnoughParams := 'Sem par�metros suficientes';
  STooManyParams := 'Demasiados par�metros';
  SLeftCantAssigned := 'N�o pode atribuir valores ao lado esquerdo';
  SForError := 'Vari�vel do ciclo "For" tem de ser num�rica';
  SEventError := 'Manipulador de eventos tem de ser um procedimento';

end.
