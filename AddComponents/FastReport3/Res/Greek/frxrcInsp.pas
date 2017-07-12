
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

unit frxrcInsp;

interface

procedure frAddInspectorRes;


implementation

uses frxRes;


procedure frAddInspectorRes;
begin
  with frxResources do
  begin
    Add('propActive', 'Καθορίζει αν ένα dataset είναι ανοικτό (ενεργό) ή όχι');
    Add('propActive.TfrxHighlight', 'Καθορίζει πότε και αν η Εντονη Εμφάνιση είναι ενεργή');
    Add('propAliasName', 'Το όνομα του ψευδώνυμου BDE');
    Add('propAlign', 'Καθορίζει την στοίχιση ενός αντικειμένου σε σχέση με την Ζώνη ή την Σελίδα');
    Add('propAlignment', 'Η στοίχιση του κειμένου μέσα στο Αντικείμενο');
    Add('propAllowAllUp', 'Καθορίζει αν όλα τα Κουμπιά τύπου speedbutton σε μια ομάδα μπορούν να αποεπιλεχθούν όλα μαζί ταυτόχρονα');
    Add('propAllowEdit', 'Καθορίζει αν ο χρήστης επιτρέπεται να τροποποιήσει μια ήδη προετοιμασμένη Αναφορά');
    Add('propAllowExpressions', 'Καθορίζει αν ένα αντικείμενο κειμένου περιλαμβάνει έκφραση');
    Add('propAllowGrayed', 'Allows grayed state of the control checkboxes');
    Add('propAllowHTMLTags', 'Καθορίζει αν ένα αντικείμενο κειμένου μπορεί να περιλαμβάνει HTML tags μέσα στο κείμενο');
    Add('propAllowSplit', 'Καθορίζει αν μια ζώνη μπορεί να διαχωρίσει τα περιεχόμενά της σε περισσότερες από μία σελίδες');
    Add('propAuthor', 'Ο κατασκευαστής της Αναφοράς');
    Add('propAutoSize', 'Καθορίζει αν μια εικόνα θα έχει αυτόματα το ανάλογο μέγεθος');
    Add('propAutoWidth', 'Καθορίζει αν ένα αντικείμενο θα έχει αυτόματο πλάτος');
    Add('propBackPicture', 'Η εικόνα στο φόντο της Αναφοράς');
    Add('propBarType', 'Ο τύπος του barcode');
    Add('propBevelInner', 'Ο τύπος του εσωτερικού bevel');
    Add('propBevelOuter', 'Ο τύπος του εξωτερικού bevel');
    Add('propBevelWidth', 'Το πλάτος του bevel');
    Add('propBorder', 'Καθορίζει αν θα εμφανίζεται το εξωτερικό πλαίσιο');
    Add('propBorderStyle', 'Το Στυλ του παραθύρου');
    Add('propBottomMargin', 'Το περιθώριο σελίδας στην βάση');
    Add('propBrushStyle', 'Το Στυλ που χρησιμοποιείται για το φόντο του αντικειμένου');
    Add('propButtons', 'Τα κουμπιά που θα είναι ορατά στο παράθυρο προεπισκόπησης');
    Add('propCacheSize', 'Το μέγιστο ποσό μνήμης που θα χρησιμοποιείται από τον μηχανισμό δημιουργίας Αναφοράς. Εάν υπάρχει ανάγκη για περισσότερη μνήμη, οι προετοιμασμένες σελίδες γράφονται στον σκληρό δίσκο');
    Add('propCalcCheckSum', 'Καθορίζει αν το barcode θα υπολογίζει το check digit αυτόματα');
    Add('propCancel', 'Καθορίζει αν το κουμπί θα ενεργοποιείται με το πλήκτρο Esc');
    Add('propCaption', 'Ο τίτλος που συνοδεύει το control');
    Add('propCellFields', 'Ονόματα των πεδίων που αντιστοιχούν τα κελλιά διασταύρωσης');
    Add('propCellLevels', 'Αριθμός των επιπέδων κελλιών');
    Add('propCenter', 'Καθορίζει αν μια εικόνα θα κεντράρεται μέσα στο control');
    Add('propCharset', 'Ο πίνακας χαρακτήρων μιας γραμματοσειράς');
    Add('propCharSpacing', 'Αριθμός των pixels μεταξύ δύο χαρακτήρων');
    Add('propCheckColor', 'Το χρώμα του check mark');
    Add('propChecked', 'Ορίζει αν το control θα είναι προεπιλεγμένο');
    Add('propCheckStyle', 'Tο Στυλ του check mark');
    Add('propChild', 'Η Ζώνη-Παιδί που συνδέεται με αυτή τη Ζώνη');
    Add('propCollate', 'Προεπιλογή σύμπτυξης');
    Add('propColor.TFont', 'Tο χρώμα του κειμένου');
    Add('propColor', 'Το χρώμα του αντικειμένου');
    Add('propColor.TfrxFrame', 'Το χρώμα του πλαισίου');
    Add('propColor.TfrxHighlight', 'Καθορίζει το χρώμα ενός αντικειμένου όταν υφίσταται Εντονη Εμφάνιση');
    Add('propColumnFields', 'Ονόματα των πεδίων που αντιστοιχούν στις στήλες διασταύρωσης');
    Add('propColumnGap', 'Tο διάστημα μεταξύ Στηλών στη Ζώνη');
    Add('propColumnLevels', 'Αριθμός επιπέδων Στηλών');
    Add('propColumns', 'Αριθμός Στηλών στην Ζώνη');
    Add('propColumnWidth', 'Το πλάτος της Στήλης στην Ζώνη');
    Add('propCondition', 'Συνθήκη Ομαδοποίησης. Η ομάδα θα διασπάται εάν αλλάξει η τιμή αυτής της έκφρασης.');
    Add('propCondition', 'String Εκφρασης. Εάν η έκφραση έχει αποτέλεσμα True, ενεργοποιείται η Εντονη Εμφάνιση');
    Add('propConnected', 'Καθορίζει αν η σύνδεση με την βάση δεδομένων είναι ενεργή');
    Add('propConvertNulls', 'Καθορίζει αν οι τιμές null θα μετατρέπονται σε 0, False ή κενό string');
    Add('propCopies', 'Αριθμός Αντιγράφων');
    Add('propCursor', 'Ο δείκτης του αντικειμένου');
    Add('propDatabaseName', 'Το όνομα της Βάσης Δεδομένων');
    Add('propDataField', 'Καθορίζει το πεδίο από το οποίο το αντικείμενο θα αντλεί δεδομένα');
    Add('propDataSet', 'Links the object to the dataset that contains the field it represents');
    Add('propDate', 'Η τιμή ημερομηνίας ενός control');
    Add('propDateFormat', 'Καθορίζει την μορφοποίηση στην οποία εμφανίζεται η ημερομηνία');
    Add('propDecimalSeparator', 'Ο χαρακτήρας που διαχωρίζει τα δεκαδικά');
    Add('propDefault', 'Καθορίζει αν το κουμπί είναι το προεπιλεγμένο κουμπί');
    Add('propDefHeight', 'Το ύψος μιας Σειράς');
    Add('propDescription', 'Η περιγραφή της Αναφοράς');
    Add('propDiagonal', 'Καθορίζει αν μια γραμμή είναι διαγώνια');
    Add('propDisplayFormat', 'Η μορφοποίηση μιας εμφανιζόμενης τιμής');
    Add('propDoubleBuffered', 'Καθορίζει εάν το παράθυρο προεπισκόπησης χρησιμοποιεί διπλό buffer. Η ενεργοποίηση του διπλού buffer εμποδίζει το flickering, αλλά είναι πιο αργό σε ταχύτητα');
    Add('propDoublePass', 'Καθορίζει εάν ο μηχανισμός Αναφοράς θα εκτελέσει δεύτερο πέρασμα');
    Add('propDown', 'Καθορίζει αν ένα κουμπί τύπου speedbutton είναι πατημένο ή όχι');
    Add('propDownThenAcross', 'Καθορίζει πως ένας μεγάλος πίνακας Διασταύρωσης θα χωριστεί σε περισσότερες από μία σελίδες');
    Add('propDriverName', 'Το όνομα του οδηγού BDE');
    Add('propDropShadow', 'Καθορίζει αν ένα αντικείμενο έχει σκιά');
    Add('propDuplex', 'Καθορίζει το duplex mode για την Σελίδα');
    Add('propEditMask', 'Καθορίζει ποιο είναι έγκυρο κείμενο σύμφωνα με την μάσκα');
    Add('propEnabled', 'Καθορίζει αν το control είναι ενεργοποιημένο');
    Add('propEngineOptions', 'Επιλογές του μηχανισμού δημιουργίας της Αναφοράς');
    Add('propExpression', 'Τιμή αυτής της Εκφρασης θα εμφανίζεται στο αντικείμενο');
    Add('propExpressionDelimiters', 'Οι χαρακτήρες που θα χρησιμοποιούνται για να περικλείουν την Εκφραση μέσα στο κείμενο');
    Add('propFieldAliases', 'Το Ψευδώνυμο του Πεδίου Δεδομένων');
    Add('propFilter', 'Η Συνθήκη Φιλτραρίσματος για το dataset');
    Add('propFiltered', 'Καθορίζει αν το dataset θα φιλτράρει τις εγγραφές σύμφωνα με την Συνθήκη Φιλτραρίσματος');
    Add('propFlowTo', 'Το αντικείμενο κειμένου που θα εμφανίζει το κείμενο που περισσεύει από αυτό το αντικείμενο');
    Add('propFont', 'Τα χαρακτηριστικά της γραμματοσειράς του αντικειμένου');
    Add('propFooterAfterEach', 'Καθορίζει αν η Ζώνη Υποσέλιδο θα εμφανίζεται σε κάθε αλλαγή Σειράς');
    Add('propFormatStr', 'Το string μορφοποίησης');
    Add('propFrame', 'Τα χαρακτηριστικά του πλαισίου ενός αντικειμένου');
    Add('propGapX', 'Η αριστερή εσοχή του κειμένου');
    Add('propGapY', 'Η εσοχή του κειμένου από την κορυφή');
    Add('propGlyph', 'Το εικονίδιο του control');
    Add('propGroupIndex', 'Επιτρέπει τα κουμπιά τύπου speedbutton να δουλεύουν μαζί σαν ομάδα');
    Add('propHAlign', 'Η οριζόντια στοίχιση του κειμένου');
    Add('propHeight', 'Tο ύψος του αντικειμένου');
    Add('propHGuides', 'Οι οριζόντιοι οδηγοί της σελίδας');
    Add('propHideZeros', 'Καθορίζει αν το αντικείμενο κειμένου θα αποκρύπτει τις μηδενικές τιμές');
    Add('propHighlight', 'Η Συνθήκη για την Εντονη Εμφάνιση');
    Add('propIndexName', 'Το όνομα του index');
    Add('propInitString', 'Το string ενεργοποίησης του dot-matrix εκτυπωτή');
    Add('propItems', 'Περιεχόμενα της λίστας του αντικειμένου');
    Add('propKeepAspectRatio', 'Διατήρηση των αρχικών αναλογιών ενός αντικειμένου');
    Add('propKeepChild', 'Καθορίζει αν η Ζώνη θα εκτυπώνεται μαζί με την Ζώνη-Παιδί που την συνοδεύει');
    Add('propKeepFooter', 'Καθορίζει αν η Ζώνη θα εκτυπώνεται μαζί με την Ζώνη-Υποσέλιδο που την συνοδεύει');
    Add('propKeepHeader', 'Καθορίζει αν η Ζώνη θα εκτυπώνεται μαζί με την Ζώνη-Κεφαλίδα που την συνοδεύει');
    Add('propKeepTogether', 'Καθορίζει αν η Ζώνη θα εκτυπώνεται μαζί με όλες τις υπο-Ζώνες που την συνοδεύουν');
    Add('propKind.TfrxFormat', 'Το είδος της μορφοποίησης');
    Add('propKind', 'Το είδος του κουμπιού');
    Add('propLargeDesignHeight', 'Καθορίζει αν μια Σελίδα θα έχει μεγάλο ύψος κατά την διάρκεια της Σχεδίασης');
    Add('propLayout', 'Η διάταξη του εικονιδίου στο κουμπί');
    Add('propLeft', 'Η αριστερή συντεταγμένη του αντικειμένου');
    Add('propLeftMargin', 'Το αριστερό περιθώριο της Σελίδας');
    Add('propLines', 'Το κείμενο του αντικειμένου');
    Add('propLineSpacing', 'Το διάστημα σε pixel ανάμεσα σε δύο γραμμές κειμένου');
    Add('propLoginPrompt', 'Καθορίζει αν θα εμφανίζεται το παράθυρο login');
    Add('propMargin', 'Καθορίζει το διάστημα σε pixels ανάμεσα στην άκρη της εικόνας και την άκρη του κουμπιού');
    Add('propMaster', 'Το master dataset');
    Add('propMasterFields', 'Τα πεδία που συνδέονται για την σχέση master-detail');
    Add('propMaximized', 'Καθορίζει αν το παράθυρο προεπισκόπησης θα εμφανίζεται σε μέγιστο μέγεθος');
    Add('propMaxLength', 'Μέγιστο μήκος του κειμένου');
    Add('propMaxPages', 'Μέγιστος αριθμός Σελίδων στην προετοιμασμένη Αναφορά');
    Add('propMaxWidth', 'Mέγιστο πλάτος Στήλης');
    Add('propMDIChild', 'Καθορίζει αν το παράθυρο προεπισκόπησης θα είναι τύπου MDI child');
    Add('propMemo', 'Το κείμενο του αντικειμένου');
    Add('propMinWidth', 'Ελάχιστο πλάτος Στήλης');
    Add('propMirrorMargins', 'Καθρεπτισμός των περιθωρίων της Σελίδας στην Μονή Σελίδα');
    Add('propModal', 'Καθορίζει αν το παράθυρο προεπισκόπησης θα είναι τύπου modal');
    Add('propModalResult', 'Καθορίζει πότε και πως το κουμπί θα κλείνει το παράθυρο τύπου modal');
    Add('propName.TFont', 'Το όνομα της γραμματοσειράς');
    Add('propName.TfrxReportOptions', 'Το όνομα της Αναφοράς');
    Add('propName', 'Το όνομα του Αντικειμένου');
    Add('propNumGlyphs', 'Προσδιορίζει τον αριθμό των εικόνων που βρίσκονται στην παράμετρο Glyph');
    Add('propOpenDataSource', 'Καθορίζει αν θα ανοίγει ή όχι αυτόματα το datasource');
    Add('propOrientation', 'Ο προσανατολισμός της Σελίδας');
    Add('propOutlineText', 'Το κείμενο που θα εμφανίζεται στην Δομή της Προεπισκόπησης');
    Add('propOutlineVisible', 'Καθορίζει αν θα φαίνεται ή όχι στην Δομή της Προεπισκόπησης');
    Add('propOutlineWidth', 'Το πλάτος του παραθύρου Δομής της Προεπισκόπησης');
    Add('propPageNumbers.TfrxPrintOptions', 'Ο αριθμός των Σελίδων προς εκτύπωση');
    Add('propPaperHeight', 'Το ύψος της Σελίδας');
    Add('propPaperWidth', 'Το πλάτος της Σελίδας');
    Add('propParagraphGap', 'Η εσοχή της πρώτης γραμμής κάθε παραγράφου');
    Add('propParams.TfrxBDEDatabase', 'Οι Παράμετροι Σύνδεσης με την Βάση Δεδομένων');
    Add('propParams', 'Οι Παράμετροι του Ερωτήματος');
    Add('propParentFont', 'Καθορίζει αν το αντικείμενο θα χρησιμοποιεί την γραμματοσειρά του parent');
    Add('propPassword', 'Ο Κωδικός Ασφαλείας της Αναφοράς');
    Add('propPasswordChar', 'Καθορίζει ποιος θα είναι ο χαρακτήρας που θα εμφανίζεται ώστε να αποκρύπτει τον Κωδικό Ασφαλείας');
    Add('propPicture', 'Η Εικόνα');
    Add('propPicture.TfrxReportOptions', 'Η περιγραφή της Εικόνας στην Αναφορά');
    Add('propPosition', 'Η αρχική θέση του παράθυρου');
    Add('propPreviewOptions', 'Οι Επιλογές Προεπισκόπησης της Αναφοράς');
    Add('propPrintable', 'Καθορίζει αν ένα αντικείμενο θα εκτυπώνεται. Αντικείμενα με τιμή Printable=False θα φαίνονται στην Προεπισκόπηση αλλά δεν θα εκτυπώνονται');
    Add('propPrintChildIfInvisible', 'Καθορίζει αν μια Ζώνη-Παιδί θα εκτυπώνεται εάν η συνδεδεμένη μ'αυτό Ζώνη είναι μη ορατή');
    Add('propPrinter', 'Το όνομα του εκτυπωτή που θα επιλέγεται όταν εκτελείται ή ανοίγει μια Αναφορά');
    Add('propPrintIfDetailEmpty', 'Καθορίζει αν μια Ζώνη Δεδομένων θα εκτυπώνεται αν οι συνδεδεμένες μ'αυτό υπο-Ζώνες είναι κενές');
    Add('propPrintIfEmpty', 'Καθορίζει αν μια Σελίδα θα εκτυπώνεται αν όλα τα datasets είναι κενά');
    Add('propPrintOnFirstPage', 'Καθορίζει αν μια Ζώνη θα εκτυπώνεται στην πρώτη Σελίδα');
    Add('propPrintOnLastPage', 'Καθορίζει αν μια Ζώνη θα εκτυπώνεται στην τελευταία Σελίδα');
    Add('propPrintOnParent', 'Καθορίζει αν μια υπο-Αναφορά μπορεί να εκτυπωθεί επάνω στην Ζώνη που ανήκει');
    Add('propPrintOnPreviousPage', 'Determines whether the page can be generated on the free space of previously generated page');
    Add('propPrintOptions', 'Επιλογές εκτύπωσης της Αναφοράς');
    Add('propPrintPages', 'Καθορίζει αν θα εκτυπώνει Όλες, τις Μονές ή τις Ζυγές Σελίδες');
    Add('propRangeBegin', 'Καθορίζει το αρχικό σημείο πλοήγησης μέσα στο dataset');
    Add('propRangeEnd', 'Καθορίζει το τελικό σημείο πλοήγησης μέσα στο dataset');
    Add('propRangeEndCount', 'Καθορίζει τον αριθμό των εγγραφών του dataset εάν η παράμετρος RangeEnd έχει τιμή reCount');
    Add('propReadOnly', 'Καθορίζει αν το αντικείμενο κειμένου είναι μόνο προς ανάγνωση');
    Add('propRepeatHeaders', 'Καθορίζει αν οι επικεφαλίδες των Σειρών και των Στηλών θα εκτυπώνονται σε κάθε Σελίδα');
    Add('propReportOptions', 'Οι Επιλογές της Αναφοράς');
    Add('propReprintOnNewPage', 'Καθορίζει αν η Ζώνη θα  θα εκτυπώνεται σε κάθε Σελίδα');
    Add('propRestrictions', 'Σετ περιοριστικών flag');
    Add('propRightMargin', 'Το δεξί περιθώριο της Σελίδας');
    Add('propRotation.TfrxBarCodeView', 'Ο προσανατολισμός του barcode');
    Add('propRotation', 'Περιστροφή κειμένου');
    Add('propRowCount', 'Αριθμός ιδεατών εγγραφών στην Ζώνη Δεδομένων');
    Add('propRowFields', 'Αριθμός Πεδίων που αντιπροσωπεύουν τις Διασταυρώμενες Σειρές);
    Add('propRowLevels', 'Αριθμός των Επιπέδων Σειρών');
    Add('propRTLReading', 'Καθορίζει αν το αντικείμενο κειμένου θα εμφανίζει το κείμενο με κατεύθυνση από τα δεξιά προς τα αριστερά');
    Add('propScriptLanguage', 'Η γλώσσα Κώδικα που θα χρησιμοποιείται στην Αναφορά');
    Add('propSessionName', 'Το όνομα της BDE session');
    Add('propShadowColor', 'Το χρώμα της Σκιάς');
    Add('propShadowWidth', 'Το πλάτος της Σκιάς');
    Add('propShape', 'Το είδος της Σκιάς');
    Add('propShiftMode', 'Συμπεριφορά Shift του αντικειμένου');
    Add('propShowCaptions', 'Καθορίζει αν τα κουμπιά Προεπισκόπησης θα εμφανίζουν τους τίτλους τους');
    Add('propShowColumnHeader', 'Καθορίζει αν η Διασταύρωση θα εμφανίζει Κεφαλίδες Στηλών');
    Add('propShowColumnTotal', 'Καθορίζει αν η Διασταύρωση θα εμφανίζει Σύνολα Στηλών');
    Add('propShowRowHeader', 'Καθορίζει αν η Διασταύρωση θα εμφανίζει Κεφαλίδες Σειρών');
    Add('propShowRowTotal', 'Καθορίζει αν η Διασταύρωση θα εμφανίζει Σύνολα Σειρών');
    Add('propShowDialog', 'Καθορίζει αν θα εμφανίζεται το παράθυρο επιλογής εκτυπωτή στην Προεπισκόπηση');
    Add('propShowText', 'Καθορίζει αν το αντικείμενο τύπου barcode θα συνοδεύεται από αναγνώσιμο κείμενο');
    Add('propSize', 'Το μέγεθος της γραμματοσειράς');
    Add('propSorted', 'Καθορίζει αν τα περιεχόμενα είναι ταξινομημένα ή όχι');
    Add('propSpacing', 'Καθορίζει τον αριθμό σε pixel ανάμεσα στην εικόνα και το κείμενο');
    Add('propSQL', 'Κώδικας SQL');
    Add('propStartNewPage', 'Ξεκινά μια νέα Σελίδα πριν εκτυπώσει μία Ζώνη');
    Add('propStretch', 'Τεντώνει την εικόνα ώστε να ταιριάξει ακριβώς στο μέγεθος του αντικειμένου');
    Add('propStretched', 'Καθορίζει αν το αντικείμενο θα είναι τεντωμένο');
    Add('propStretchMode', 'Stretch behavior of the object');
    Add('propStyle.TFont', 'Το Στυλ της γραμματοσειράς');
    Add('propStyle', 'Tο Στυλ του control');
    Add('propStyle.TfrxFrame', 'Το Στυλ του Πλαισίου του αντικειμένου');
    Add('propSuppressRepeated', 'Συμπτύσει τις επαναλαμβανόμενες τιμές');
    Add('propTableName', 'Το όνομα του Πίνακα Δεδομένων');
    Add('propTag', 'Αριθμός Tag του αντικειμένου');
    Add('propTagStr', 'Tag string του αντικειμένου');
    Add('propText', 'Το κείμενο του αντικειμένου');
    Add('propTitleBeforeHeader', 'Καθορίζει αν θα εμφανίζει την Κεφαλίδα Αναφοράς πριν από την Κεφαλίδα Σελίδας');
    Add('propTop', 'Συντεταγμένες κορυφής του αντικειμένου');
    Add('propTopMargin', 'Περιθώριο κορυφής της Σελίδας');
    Add('propTyp', 'Τύπος Πλαισίου');
    Add('propUnderlines', 'Καθορίζει αν το αντικείμενο κειμένου θα εμφανίζει γραμμές πλέγματος για κάθε μία γραμμή κειμένου');
    Add('propURL', 'Τοποθεσία URL του αντικειμένου');
    Add('propUserName', 'Όνομα χρήστη για το αντικείμενο δεδομένων. Αυτό το όνομα θα εμφανίζεται στην Δομή Δεδομένων');
    Add('propVAlign', 'Η κάθετη στοίχιση του κειμένου');
    Add('propVersionBuild', 'Έκδοση (build)');
    Add('propVersionMajor', 'Έκδοση (major)');
    Add('propVersionMinor', 'Έκδοση (minor)');
    Add('propVersionRelease', 'Έκδοση (release)');
    Add('propVGuides', 'Οι κάθετοι οδηγοί της Σελίδας');
    Add('propVisible', 'Καθορίζει αν το αντικείμενο θα είναι ορατό ή μη ορατό');
    Add('propWidth', 'Πλάτος του αντικειμένου');
    Add('propWidth.TfrxFrame', 'Το πλάτος του Πλαισίου');
    Add('propWindowState', 'Αρχική κατάσταση του παράθυρου');
    Add('propWordBreak', 'Κόψιμο λέξεων');
    Add('propWordWrap', 'Καθορίζει την αναδίπλωση κειμένου');
    Add('propZoom.TfrxBarCodeView', 'Μεγεθύνει το barcode');
    Add('propZoom', 'Αρχική μεγέθυνση στο παράθυρο Προεπισκόπησης');
    Add('propZoomMode', 'Αρχικός τύπος μεγέθυνσης στο παράθυρο Προεπισκόπησης');
  end;
end;


initialization
  frAddInspectorRes;

end.
