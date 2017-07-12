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
  SLangNotFound := 'Valoda ''%s'' nav atrasta';
  SInvalidLanguage := 'Valodas apraksta kluda';
  SIdRedeclared := 'Pardevets identifikators: ';
  SUnknownType := 'Neatpazits veids: ';
  SIncompatibleTypes := 'Nesavienojami veidi';
  SIdUndeclared := 'Neatpazits identifikators: ';
  SClassRequired := 'Tiek veikta klase';
  SIndexRequired := 'Tiek veikts indekss';
  SStringError := 'Rindai nav uzstadijumu vai veidu';
  SClassError := 'Klase nesatur %s pec noklusejuma';
  SArrayRequired := 'Tiek veikts masivs';
  SVarRequired := 'Tiek veiktas izmainas';
  SNotEnoughParams := 'Nepietiekami parametri';
  STooManyParams := 'Parlieku daudz parametru';
  SLeftCantAssigned := 'Nevar tikt apstiprinata kreisa izteiksmes puse';
  SForError := 'Izmainam cikla FOR jabut skaitlu izteiksme';
  SEventError := 'Izmainu apstradei janotiek saskana ar proceduru';


end.