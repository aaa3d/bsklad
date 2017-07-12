
{******************************************}
{                                          }
{             FastReport v3.0              }
{         Language resource file           }
{                                          }
{         Copyright (c) 1998-2005          }
{         by Alexander Tzyganenko,         }
{            Fast Reports Inc.             }
{                                          }
{******************************************}

unit frxrcClass;

interface

procedure frAddClassesRes;


implementation

uses frxRes;


procedure frAddClassesRes;
begin
  with frxResources do
  begin
    Add('TfrxPreviewForm',
      'Caption=Προεπισκόπηση' + #13#10 +
      'PrintB.Caption=Εκτύπωση' + #13#10 +
      'PrintB.Hint=Εκτύπωση' + #13#10 +
      'OpenB.Caption=Ανοιγμα' + #13#10 +
      'OpenB.Hint=Ανοιγμα' + #13#10 +
      'SaveB.Caption=Αποθήκευση' + #13#10 +
      'SaveB.Hint=Αποθήκευση' + #13#10 +
      'ExportB.Caption=Εξαγωγή' + #13#10 +
      'ExportB.Hint=Εξαγωγή' + #13#10 +
      'FindB.Caption=Αναζήτηση' + #13#10 +
      'FindB.Hint=Αναζήτηση' + #13#10 +
      'ZoomWholePageB.Caption=Ολόκληρη σελίδα' + #13#10 +
      'ZoomWholePageB.Hint=Ολόκληρη σελίδα' + #13#10 +
      'ZoomPageWidthB.Caption=Όλο το πλάτος' + #13#10 +
      'ZoomPageWidthB.Hint=Όλο το πλάτος' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=Δύο Σελίδες' + #13#10 +
      'Zoom50B.Hint=Δύο Σελίδες' + #13#10 +
      'ZoomCB.Hint=Μεγέθυνση' + #13#10 +
      'PageSettingsB.Caption=Περιθώρια' + #13#10 +
      'PageSettingsB.Hint=Περιθώρια' + #13#10 +
      'OutlineB.Caption=Περίγραμμα' + #13#10 +
      'OutlineB.Hint=Περίγραμμα' + #13#10 +
      'HandToolB.Caption=Μετακίνηση' + #13#10 +
      'HandToolB.Hint=Εργαλείο Μετακίνησης' + #13#10 +
      'ZoomToolB.Caption=Μεγέθυνση' + #13#10 +
      'ZoomToolB.Hint=Εργαλείο Μεγέθυνσης' + #13#10 +
      'NewPageB.Caption=Προσθήκη Σελίδας' + #13#10 +
      'NewPageB.Hint=Προσθήκη Σελίδας' + #13#10 +
      'DelPageB.Caption=Διαγραφή Σελίδας' + #13#10 +
      'DelPageB.Hint=Διαγραφή Σελίδας' + #13#10 +
      'DesignerB.Caption=Διόρθωση' + #13#10 +
      'DesignerB.Hint=Διόρθωση Σελίδας' + #13#10 +
      'FirstB.Caption=Πρώτη' + #13#10 +
      'FirstB.Hint=Πρώτη Σελίδα' + #13#10 +
      'PriorB.Caption=Προηγούμενη' + #13#10 +
      'PriorB.Hint=Προηγούμενη Σελίδα' + #13#10 +
      'NextB.Caption=Επόμενη' + #13#10 +
      'NextB.Hint=Επόμενη Σελίδα' + #13#10 +
      'LastB.Caption=Τελευταία' + #13#10 +
      'LastB.Hint=Τελευταία Σελίδα' + #13#10 +
      'CancelB.Caption=Κλείσιμο' + #13#10 +
      'PageE.Hint=Αριθμός Σελίδας' + #13#10 +
      '');
    Add('zmPageWidth', 'Όλο το πλάτος');
    Add('zmWholePage', 'Ολόκληρη Σελίδα');

    Add('TfrxPrintDialog',
      'Caption=Εκτύπωση' + #13#10 +
      'Label12.Caption=Εκτυπωτής   ' + #13#10 +
      'DescrL.Caption=Δώστε αριθμούς και εύρος Σελίδων, χωρισμένα με κόμα. Για παράδειγμα 1,3,5-12' + #13#10 +
      'Label1.Caption=Σελίδες   ' + #13#10 +
      'CopiesL.Caption=Αριθμός αντιγράφων' + #13#10 +
      'CollateL.Caption=Σύμπτυξη' + #13#10 +
      'Label2.Caption=Αντίγραφα   ' + #13#10 +
      'PrintL.Caption=Εκτύπωση' + #13#10 +
      'TypeL.Caption=Είδος:' + #13#10 +
      'WhereL.Caption=Τοποθεσία:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      'PropButton.Caption=Ιδιότητες...' + #13#10 +
      'AllRB.Caption=Όλες' + #13#10 +
      'CurPageRB.Caption=Τρέχουσα Σελίδα' + #13#10 +
      'PageNumbersRB.Caption=Σελίδες:' + #13#10 +
      'FileCB.Caption=Εκτύπωση σε Αρχείο' + #13#10 +
      'ReverseCB.Caption=Ανεστραμμένες σελίδες' + #13#10 +
      '');
    Add('ppAll', 'Όλες οι Σελίδες');
    Add('ppOdd', 'Μονές Σελίδες');
    Add('ppEven', 'Ζυγές Σελίδες');

    Add('TfrxSearchDialog',
      'Caption=Αναζήτηση Κειμένου' + #13#10 +
      'TextL.Caption=Κείμενο προς Αναζήτηση:' + #13#10 +
      'SearchL.Caption=Ιδιότητες Αναζήτησης   ' + #13#10 +
      'ReplaceL.Caption=Αντικατάσταση με' + #13#10 +
      'TopCB.Caption=Αναζήτηση από την αρχή' + #13#10 +
      'CaseCB.Caption=Ευαισθησία στα πεζά/κεφαλαία' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Ρυθμίσεις Σελίδας' + #13#10 +
      'WidthL.Caption=Πλάτος' + #13#10 +
      'HeightL.Caption=Ύψος' + #13#10 +
      'SizeL.Caption=Μέγεθος   ' + #13#10 +
      'OrientationL.Caption=Προσανατολισμός   ' + #13#10 +
      'LeftL.Caption=Αριστερά' + #13#10 +
      'TopL.Caption=Κορυφή' + #13#10 +
      'RightL.Caption=Δεξιά' + #13#10 +
      'BottomL.Caption=Βάση' + #13#10 +
      'MarginsL.Caption=Περιθώρια   ' + #13#10 +
      'PortraitRB.Caption=Κατακόρυφος' + #13#10 +
      'LandscapeRB.Caption=Κάθετος' + #13#10 +
      'cmL1.Caption=εκ' + #13#10 +
      'cmL2.Caption=εκ' + #13#10 +
      'cmL3.Caption=εκ' + #13#10 +
      'cmL4.Caption=εκ' + #13#10 +
      'cmL5.Caption=εκ' + #13#10 +
      'cmL6.Caption=εκ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      'OtherL.Caption=Αλλο   ' + #13#10 +
      'ApplyToCurRB.Caption=Εφαρμογή ρυθμίσεων στην τρέχουσα σελίδα' + #13#10 +
      'ApplyToAllRB.Caption=Εφαρμογή ρυθμίσεων σε όλες τις σελίδες' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Εκτύπωση' + #13#10 +
      'PrinterL.Caption=Εκτυπωτής   ' + #13#10 +
      'PagesL.Caption=Σελίδες   ' + #13#10 +
      'CopiesL.Caption=Αντίγραφα   ' + #13#10 +
      'CopiesNL.Caption=Αριθμός Αντιγράφων' + #13#10 +
      'DescrL.Caption=Δώστε αριθμούς και εύρος Σελίδων, χωρισμένα με κόμα. Για παράδειγμα 1,3,5-12' + #13#10 +
      'OptionsL.Caption=Ιδιότητες   ' + #13#10 +
      'EscL.Caption=Κωδικοί Esc   ' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Ακυρο' + #13#10 +
      'SaveToFileCB.Caption=Εκτύπωση σε Αρχείο' + #13#10 +
      'AllRB.Caption=Όλες' + #13#10 +
      'CurPageRB.Caption=Τρέχουσα Σελίδα' + #13#10 +
      'PageNumbersRB.Caption=Σελίδες:' + #13#10 +
      'PageBreaksCB.Caption=Page breaks' + #13#10 +
      'OemCB.Caption=OEM codepage' + #13#10 +
      'PseudoCB.Caption=Pseudographic' + #13#10 +
      'SaveDialog1.Filter=Αρχείο εκτύπωσης (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Ακύρωση' + #13#10 +
      '');

    Add('mbConfirm', 'Επιβεβαίωση');
    Add('mbError', 'Σφάλμα');
    Add('mbInfo', 'Πληροφορίες');
    Add('xrCantFindClass', 'Δεν μπόρεσε να βρεθεί η κλάση');
    Add('prVirtual', 'Ιδεατός');
    Add('prDefault', 'Default');
    Add('prCustom', 'Custom');
    Add('enUnconnHeader', 'Unconnected header/footer');
    Add('enUnconnGroup', 'No data band for the group');
    Add('enUnconnGFooter', 'No group header for');
    Add('enBandPos', 'Λανθασμένη θέση ζώνης:');
    Add('dbNotConn', 'DataSet %s is not connected to data');
    Add('dbFldNotFound', 'Το πεδίο δεν βρέθηκε:');
    Add('clDSNotIncl', '(dataset is not included into Report.DataSets)');
    Add('clUnknownVar', '’γνωστη μεταβλητή ή πεδίο:');
    Add('clScrError', 'Script error at %s: %s');
    Add('clDSNotExist', 'Dataset "%s" is not exists');
    Add('clErrors', 'Συνέβησαν τα ακόλουθα σφάλματα:');
    Add('clExprError', 'Error in expression');
    Add('clFP3files', 'Προετοιμασία Αναφοράς');
    Add('clSaving', 'Αποθήκευση Αρχείου...');
    Add('clCancel', '’κυρο');
    Add('clClose', 'Κλείσιμο');
    Add('clPrinting', 'Εκτύπωση Σελίδας');
    Add('clLoading', '’νοιγμα Αρχείου...');
    Add('clPageOf', 'Σελίδα %d από %d');
    Add('clFirstPass', 'Πρώτο Πέρασμα: σελίδα ');
    Add('clNoPrinters', 'Δεν υπάρχει εγκατεστημένος εκτυπωτής στο σύστημα σας');
    Add('clDecompressError', 'Stream decompress error');
    Add('crFillMx', 'Filling the cross-tab...');
    Add('crBuildMx', 'Building the cross-tab...');

    Add('prRunningFirst', 'Πρώτο Πέρασμα: σελίδα %d');
    Add('prRunning', 'Προετοιμασία Σελίδας %d');
    Add('prPrinting', 'Εκτύπωση Σελίδας %d');
    Add('prExporting', 'Εξαγωγή Σελίδας %d');
    Add('uCm', 'εκ.');
    Add('uInch', 'ιν.');
    Add('uPix', 'px');
    Add('uChar', 'χαρ.');
  end;
end;


initialization
  frAddClassesRes;

end.