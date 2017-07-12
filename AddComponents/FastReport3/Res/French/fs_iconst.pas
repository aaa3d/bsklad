
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
  SInvalidLanguage := 'Définition de langage invalide';
  SIdRedeclared := 'Identificateur redéclaré : ';
  SUnknownType := 'Type inconnu : ';
  SIncompatibleTypes := 'Types incompatibles';
  SIdUndeclared := 'Identificateur non déclaré : ';
  SClassRequired := 'Type Class requis';
  SIndexRequired := 'Index requis';
  SStringError := 'Les chaînes n''ont ni propriétés, ni méthodes';
  SClassError := 'La classe %s n''a pas de propriété par défaut';
  SArrayRequired := 'Type tableau requis';
  SVarRequired := 'Variable requise';
  SNotEnoughParams := 'Pas assez de paramètres';
  STooManyParams := 'Trop de paramètres';
  SLeftCantAssigned := 'La partie gauche ne peut pas etre assignée à';
  SForError := 'La variable d''une boucle for doit être numérique';
  SEventError := 'Un gestionnaire d''évènement doit être une procédure';

end.
