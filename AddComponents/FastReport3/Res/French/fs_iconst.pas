
{******************************************}
{                                          }
{             FastScript v1.7              }
{                Resources                 }
{                                          }
{ (c) 2003, 2004 by Alexander Tzyganenko,  }
{             Fast Reports, Inc            }
{                                          }
{     French Translation by Pierre Y.      }
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
  SLangNotFound := 'Langage ''%s'' introuvable';
  SInvalidLanguage := 'D�finition de langage invalide';
  SIdRedeclared := 'Identificateur red�clar� : ';
  SUnknownType := 'Type inconnu : ';
  SIncompatibleTypes := 'Types incompatibles';
  SIdUndeclared := 'Identificateur non d�clar� : ';
  SClassRequired := 'Type Class requis';
  SIndexRequired := 'Index requis';
  SStringError := 'Les cha�nes n''ont ni propri�t�s, ni m�thodes';
  SClassError := 'La classe %s n''a pas de propri�t� par d�faut';
  SArrayRequired := 'Type tableau requis';
  SVarRequired := 'Variable requise';
  SNotEnoughParams := 'Pas assez de param�tres';
  STooManyParams := 'Trop de param�tres';
  SLeftCantAssigned := 'La partie gauche ne peut pas etre assign�e �';
  SForError := 'La variable d''une boucle for doit �tre num�rique';
  SEventError := 'Un gestionnaire d''�v�nement doit �tre une proc�dure';

end.
