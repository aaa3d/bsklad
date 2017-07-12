
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
  SLangNotFound := 'Δεν βρέθηκε η γλώσσα ''%s''.';
  SInvalidLanguage := 'Μη έγκυρος καθορισμός γλώσσας';
  SIdRedeclared := 'Identifier redeclared: ';
  SUnknownType := 'Αγνωστος τύπος: ';
  SIncompatibleTypes := 'Μη συμβατοί τύποι';
  SIdUndeclared := 'Undeclared identifier: ';
  SClassRequired := 'Απαιτείται Κλάση';
  SIndexRequired := 'Απαιτείται Ταξινόμηση';
  SStringError := 'Οι Συμβολοσειρές δεν έχουν ιδιότητες ή μεθόδους';
  SClassError := 'Η Κλάση %s δεν έχει προεπιλεγμένες ιδιότητες';
  SArrayRequired := 'Απαιτείται Array';
  SVarRequired := 'Απαιτείται Μεταβλητή';
  SNotEnoughParams := 'Δεν είναι αρκετές οι παράμετροι';
  STooManyParams := 'Λάθος αριθμός παραμέτρων';
  SLeftCantAssigned := 'Η αριστερή πλευρά της ισότητος δεν μπορεί να πάρει τιμή';
  SForError := 'Ο βρόγχος For πρέπει να χρησιμοποιεί αριθμητική μεταβλητή';
  SEventError := 'Ο χειριστής των Event πρέπει να είναι procedure';

end.
