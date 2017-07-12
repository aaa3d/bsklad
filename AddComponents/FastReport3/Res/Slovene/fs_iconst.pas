
{******************************************}
{                                          }
{             FastScript v1.7              }
{                Resources                 }
{                                          }
{ (c) 2003, 2004 by Alexander Tzyganenko,  }
{             Fast Reports, Inc            }
{                                          }
{         Slovene translation by:          }
{         Primoz Planinc, Planles s.p.     }
{         mail: info@planles.net           }
{         made in October, 2004            }
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
  SLangNotFound := 'Jezik ''%s'' ni najden';
  SInvalidLanguage := 'Napaèna doloèitev jezika';
  SIdRedeclared := 'Ponovna navedba identifikatorja: ';
  SUnknownType := 'Neznani tip: ';
  SIncompatibleTypes := 'Nezdružjivi tipi';
  SIdUndeclared := 'Nenaveden identifikator: ';
  SClassRequired := 'Zahtevani Class type';
  SIndexRequired := 'Zahtevani Index';
  SStringError := 'Niz nima lastnosti ali naèina';
  SClassError := 'Class %s nima privzete lastnosti';
  SArrayRequired := 'Zahtevani Array type';
  SVarRequired := 'Zahtevana spremenljivka';
  SNotEnoughParams := 'Ni dovolj aktualnih parametrov';
  STooManyParams := 'Preveè aktualnih parametrov';
  SLeftCantAssigned := 'Leva stran ne more biti dodeljena';
  SForError := 'Spremenljivka v For zanki mora biti numerièna';
  SEventError := 'Event handler mora biti procedura';

end.
