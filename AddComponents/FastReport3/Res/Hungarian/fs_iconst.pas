
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
  SLangNotFound := 'A ''%s'' nyelv nem található';
  SInvalidLanguage := 'Hibás nyelv definíció';
  SIdRedeclared := 'Ismétel változódeklarálás: ';
  SUnknownType := 'Ismeretlen típus: ';
  SIncompatibleTypes := 'Nem kompatibilis típusok';
  SIdUndeclared := 'Ismeretlen változó: ';
  SClassRequired := 'Osztály típus szükséges';
  SIndexRequired := 'Index required';
  SStringError := 'Stringek amelyeknek nincs tulajdonsága vagy metódusa';
  SClassError := 'A %s osztály nem rendelkezik alapértelmezett tulajdonsággal';
  SArrayRequired := 'Tömb típus szükséges';
  SVarRequired := 'Változó szükséges';
  SNotEnoughParams := 'Nem elegendõ a paraméter';
  STooManyParams := 'Túl sok paraméter';
  SLeftCantAssigned := 'A bal oldallal nem tehetõ egyenlõvé';
  SForError := 'A cilkusváltozónak számnak kell lennie';
  SEventError := 'Az eseménykezelõnek eljárásnak (procedure) kell lennie.';

end.
