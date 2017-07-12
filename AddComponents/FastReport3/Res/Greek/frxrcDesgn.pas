
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

unit frxrcDesgn;

interface

procedure frAddDesignerRes;


implementation

uses frxRes;


procedure frAddDesignerRes;
begin
  with frxResources do
  begin
    Add('TfrxObjectInspector',
      'Caption=Επιθεωρητής Αντικειμένων' + #13#10 +
      '');
    Add('oiProp', 'Properties');
    Add('oiEvent', 'Events');

    Add('TfrxDataTreeForm',
      'Caption=Δομή Δεδομένων' + #13#10 +
      'DataTS.Caption=Δεδομένα' + #13#10 +
      'VariablesTS.Caption=Μεταβλητές' + #13#10 +
      'FunctionsTS.Caption=Ρουτίνες' + #13#10 +
      'InsFieldCB.Caption=Δημιουργία Πεδίου' + #13#10 +
      'InsCaptionCB.Caption=Δημιουργία Τίτλου' + #13#10 +
      '');
    Add('dtNoData', 'Δεν υπάρχουν Δεδομένα');
    Add('dtData', 'Δεδομένα');
    Add('dtSysVar', 'Μεταβλητές Συστήματος');
    Add('dtVar', 'Μεταβλητές');
    Add('dtFunc', 'Ρουτίνες');

    Add('TfrxReportTreeForm',
      'Caption=Report Tree' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Ανοιγμα Αρχείου Κώδικα (Script)' + #13#10 +
      'SaveScriptB.Hint=Αποθήκευση Αρχείου Κώδικα (Script)' + #13#10 +
      'RunScriptB.Hint=Εκτέλεση Κώδικα' + #13#10 +
      'StepScriptB.Hint=Trace Into' + #13#10 +
      'StopScriptB.Hint=Διακοπή Εκτέλεσης' + #13#10 +
      'EvaluateB.Hint=Evaluate' + #13#10 +
      'LangL.Caption=Γλώσσα:' + #13#10 +
      'AlignTB.Caption=Στοίχιση' + #13#10 +
      'AlignLeftsB.Hint=Αριστερή στοίχιση' + #13#10 +
      'AlignHorzCentersB.Hint=Στοίχιση στο μέσο' + #13#10 +
      'AlignRightsB.Hint=Δεξιά στοίχιση' + #13#10 +
      'AlignTopsB.Hint=Στοίχιση στην κορυφή' + #13#10 +
      'AlignVertCentersB.Hint=Στοίχιση στο κέντρο' + #13#10 +
      'AlignBottomsB.Hint=Στοίχιση στην βάση' + #13#10 +
      'SpaceHorzB.Hint=Οριζόντιο διάστημα' + #13#10 +
      'SpaceVertB.Hint=Κάθετο διάστημα' + #13#10 +
      'CenterHorzB.Hint=Οριζόντιο κεντράρισμα στην Ζώνη' + #13#10 +
      'CenterVertB.Hint=Κάθετο κεντράρισμα στην Ζώνη' + #13#10 +
      'SameWidthB.Hint=Ίδιο πλάτος' + #13#10 +
      'SameHeightB.Hint=Ίδιο ύψος' + #13#10 +
      'TextTB.Caption=Κείμενο' + #13#10 +
      'StyleCB.Hint=Στυλ' + #13#10 +
      'FontNameCB.Hint=Όνομα γραμματοσειράς' + #13#10 +
      'FontSizeCB.Hint=Μέγεθος γραμματοσειράς' + #13#10 +
      'BoldB.Hint=Έντονα' + #13#10 +
      'ItalicB.Hint=Πλάγια' + #13#10 +
      'UnderlineB.Hint=Υπογραμμισμένα' + #13#10 +
      'FontColorB.Hint=Χρώμα γραμματοσειράς' + #13#10 +
      'HighlightB.Hint=Έντονο μαρκάρισμα' + #13#10 +
      'RotateB.Hint=Περιστροφή κειμένου' + #13#10 +
      'TextAlignLeftB.Hint=Αριστερή στοίχιση' + #13#10 +
      'TextAlignCenterB.Hint=Στοίχιση στο κέντρο' + #13#10 +
      'TextAlignRightB.Hint=Δεξιά στοίχιση' + #13#10 +
      'TextAlignBlockB.Hint=Στοίχιση πλάτους' + #13#10 +
      'TextAlignTopB.Hint=Στοίχιση στην κορυφή' + #13#10 +
      'TextAlignMiddleB.Hint=Στοίχιση στο μέσο' + #13#10 +
      'TextAlignBottomB.Hint=Στοίχιση στην βάση' + #13#10 +
      'FrameTB.Caption=Πλαίσιο' + #13#10 +
      'FrameTopB.Hint=Γραμμή επάνω' + #13#10 +
      'FrameBottomB.Hint=Γραμμή κάτω' + #13#10 +
      'FrameLeftB.Hint=Γραμμή αριστερά' + #13#10 +
      'FrameRightB.Hint=Γραμμή δεξιά' + #13#10 +
      'FrameAllB.Hint=Όλες οι γραμμές' + #13#10 +
      'FrameNoB.Hint=Όχι πλαίσιο' + #13#10 +
      'ShadowB.Hint=Σκίαση' + #13#10 +
      'FillColorB.Hint=Χρώμα φόντου' + #13#10 +
      'FrameColorB.Hint=Χρώμα πλαισίου' + #13#10 +
      'FrameStyleB.Hint=Στυλ πλαισίου' + #13#10 +
      'FrameWidthCB.Hint=Πλάτος πλαισίου' + #13#10 +
      'StandardTB.Caption=Προεπιλογή' + #13#10 +
      'NewB.Hint=Νέα Αναφορά' + #13#10 +
      'OpenB.Hint=’νοιγμα Αναφοράς' + #13#10 +
      'SaveB.Hint=Αποθήκευση Αναφοράς' + #13#10 +
      'PreviewB.Hint=Προεπισκόπηση' + #13#10 +
      'NewPageB.Hint=Νέα Σελίδα Αναφοράς' + #13#10 +
      'NewDialogB.Hint=Νέα Σελίδα Διαλόγου' + #13#10 +
      'DeletePageB.Hint=Διαγραφή Σελίδας' + #13#10 +
      'PageSettingsB.Hint=Ρυθμίσεις Σελίδας' + #13#10 +
      'VariablesB.Hint=Μεταβλητές' + #13#10 +
      'CutB.Hint=Αποκοπή' + #13#10 +
      'CopyB.Hint=Αντιγραφή' + #13#10 +
      'PasteB.Hint=Επικόλληση' + #13#10 +
      'SampleFormatB.Hint=Αντιγραφή μορφοποίησης' + #13#10 +
      'UndoB.Hint=Undo' + #13#10 +
      'RedoB.Hint=Redo' + #13#10 +
      'GroupB.Hint=Ενοποίηση Αντικειμένων' + #13#10 +
      'UngroupB.Hint=Διαχωρισμός Αντικειμένων' + #13#10 +
      'ShowGridB.Hint=Εμφάνιση Πλέγματος' + #13#10 +
      'AlignToGridB.Hint=Στοίχιση στο Πλέγμα' + #13#10 +
      'SetToGridB.Hint=Μέγεθος στο Πλέγμα' + #13#10 +
      'ScaleCB.Hint=Μεγέθυνση' + #13#10 +
      'ExtraToolsTB.Caption=Έξτρα Εργαλεία' + #13#10 +
      'ObjectSelectB.Hint=Επιλογή Εργαλείου' + #13#10 +
      'HandToolB.Hint=Εργαλείο Μετακίνησης' + #13#10 +
      'ZoomToolB.Hint=Εργαλείο Μεγέθυνσης' + #13#10 +
      'TextToolB.Hint=Εργαλείο Διόρθωσης Κειμένου' + #13#10 +
      'FormatToolB.Hint=Εργαλείο Αντιγραφής Μορφοποίησης' + #13#10 +
      'ObjectBandB.Hint=Εισαγωγή Ζώνης' + #13#10 +
      'FileMenu.Caption=&Αρχείο' + #13#10 +
      'EditMenu.Caption=&Επεξεργασία' + #13#10 +
      'FindMI.Caption=Αναζήτηση...' + #13#10 +
      'FindNextMI.Caption=Αναζήτηση Επόμενου' + #13#10 +
      'ReplaceMI.Caption=Αντικατάσταση...' + #13#10 +
      'ReportMenu.Caption=Αναφο&ρά' + #13#10 +
      'ReportDataMI.Caption=Δεδομένα...' + #13#10 +
      'ReportSettingsMI.Caption=Επιλογές...' + #13#10 +
      'ReportStylesMI.Caption=Στυλ...' + #13#10 +
      'ViewMenu.Caption=&Εμφάνιση' + #13#10 +
      'ToolbarsMI.Caption=Εργαλειοθήκες' + #13#10 +
      'StandardMI.Caption=Βασική' + #13#10 +
      'TextMI.Caption=Κείμενο' + #13#10 +
      'FrameMI.Caption=Πλαίσιο' + #13#10 +
      'AlignmentMI.Caption=Παλέτα Στοίχισης' + #13#10 +
      'ToolsMI.Caption=Έξτρα Εργαλεία' + #13#10 +
      'InspectorMI.Caption=Επιθεωρητής Αντικειμένων' + #13#10 +
      'DataTreeMI.Caption=Ανάλυση Δεδομένων' + #13#10 +
      'ReportTreeMI.Caption=Ανάλυση Αναφοράς' + #13#10 +
      'ShowRulersMI.Caption=Χάρακες' + #13#10 +
      'ShowGuidesMI.Caption=Οδηγοί' + #13#10 +
      'DeleteGuidesMI.Caption=Διαγραφή Οδηγών' + #13#10 +
      'OptionsMI.Caption=Επιλογές...' + #13#10 +
      'HelpMenu.Caption=&Βοήθεια' + #13#10 +
      'HelpContentsMI.Caption=Περιεχόμενα Βοήθειας...' + #13#10 +
      'AboutMI.Caption=Σχετικά με το FastReport...' + #13#10 +
      'TabOrderMI.Caption=Σειρά Tab...' + #13#10 +
      'UndoCmd.Caption=Undo' + #13#10 +
      'RedoCmd.Caption=Redo' + #13#10 +
      'CutCmd.Caption=Αποκοπή' + #13#10 +
      'CopyCmd.Caption=Αντιγραφή' + #13#10 +
      'PasteCmd.Caption=Επικόλληση' + #13#10 +
      'GroupCmd.Caption=Ενοποίηση Αντικειμένων' + #13#10 +
      'UngroupCmd.Caption=Διαχωρισμός Αντικειμένων' + #13#10 +
      'DeleteCmd.Caption=Διαγραφή' + #13#10 +
      'DeletePageCmd.Caption=Διαγραφή Σελίδας' + #13#10 +
      'SelectAllCmd.Caption=Επιλογή όλων' + #13#10 +
      'EditCmd.Caption=Επεξεργασία...' + #13#10 +
      'BringToFrontCmd.Caption=Μετακίνηση Μπροστά' + #13#10 +
      'SendToBackCmd.Caption=Μετακίνηση Πίσω' + #13#10 +
      'NewItemCmd.Caption=Νέα...' + #13#10 +
      'NewReportCmd.Caption=Νέα Αναφορά' + #13#10 +
      'NewPageCmd.Caption=Νέα Σελίδα' + #13#10 +
      'NewDialogCmd.Caption=Νέα Σελίδα διαλόγου' + #13#10 +
      'OpenCmd.Caption=’νοιγμα...' + #13#10 +
      'SaveCmd.Caption=Αποθήκευση' + #13#10 +
      'SaveAsCmd.Caption=Αποθήκευση ως...' + #13#10 +
      'VariablesCmd.Caption=Μεταβλητές...' + #13#10 +
      'PageSettingsCmd.Caption=Ρυθμίσεις Σελίδας...' + #13#10 +
      'PreviewCmd.Caption=Προεπισκόπηση' + #13#10 +
      'ExitCmd.Caption=Έξοδος' + #13#10 +
      'ReportTitleMI.Caption=Κεφαλίδα Αναφοράς' + #13#10 +
      'ReportSummaryMI.Caption=Υποσέλιδο Αναφοράς' + #13#10 +
      'PageHeaderMI.Caption=Κεφαλίδα Σελίδας' + #13#10 +
      'PageFooterMI.Caption=Υποσέλιδο Σελίδας' + #13#10 +
      'HeaderMI.Caption=Κεφαλίδα' + #13#10 +
      'FooterMI.Caption=Υποσέλιδο' + #13#10 +
      'MasterDataMI.Caption=Δεδομένα Master' + #13#10 +
      'DetailDataMI.Caption=Δεδομένα Detail' + #13#10 +
      'SubdetailDataMI.Caption=Δεδομένα Subdetail' + #13#10 +
      'Data4levelMI.Caption=Δεδομένα 4ου επιπέδου' + #13#10 +
      'Data5levelMI.Caption=Δεδομένα 5ου επιπέδου' + #13#10 +
      'Data6levelMI.Caption=Δεδομένα 6ου επιπέδου' + #13#10 +
      'GroupHeaderMI.Caption=Κεφαλίδα Ομάδος' + #13#10 +
      'GroupFooterMI.Caption=Υποσέλιδο Ομάδος' + #13#10 +
      'ChildMI.Caption=Child' + #13#10 +
      'ColumnHeaderMI.Caption=Κεφαλίδα Στήλης' + #13#10 +
      'ColumnFooterMI.Caption=Υποσέλιδο Στήλης' + #13#10 +
      'OverlayMI.Caption=Overlay' + #13#10 +
      'VerticalbandsMI.Caption=Κάθετες Ζώνες' + #13#10 +
      'HeaderMI1.Caption=Κεφαλίδα' + #13#10 +
      'FooterMI1.Caption=Υποσέλιδο' + #13#10 +
      'MasterDataMI1.Caption=Δεδομένα Master' + #13#10 +
      'DetailDataMI1.Caption=Δεδομένα Detail' + #13#10 +
      'SubdetailDataMI1.Caption=Δεδομένα Subdetail' + #13#10 +
      'GroupHeaderMI1.Caption=Κεφαλίδα Ομάδος' + #13#10 +
      'GroupFooterMI1.Caption=Υποσέλιδο Ομάδος' + #13#10 +
      'ChildMI1.Caption=Child' + #13#10 +
      'R0MI.Caption=0°' + #13#10 +
      'R45MI.Caption=45°' + #13#10 +
      'R90MI.Caption=90°' + #13#10 +
      'R180MI.Caption=180°' + #13#10 +
      'R270MI.Caption=270°' + #13#10 +
      'FontB.Hint=Ρυθμίσεις Γραμματοσειράς' + #13#10 +
      'BoldMI.Caption=Έντονα' + #13#10 +
      'ItalicMI.Caption=Πλάγια' + #13#10 +
      'UnderlineMI.Caption=Υπογραμμισμένα' + #13#10 +
      'SuperScriptMI.Caption=Ανωφερή' + #13#10 +
      'SubScriptMI.Caption=Κατωφερή' + #13#10 +
      'CondensedMI.Caption=Στενά' + #13#10 +
      'WideMI.Caption=Πλατιά' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'OpenDialog.Filter=Αναφορά (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=Αρχεία Pascal (*.pas)|*.pas|Αρχεία C++ (*.cpp)|*.cpp|Αρχεία JavaScript (*.js)|*.js|Αρχεία Basic (*.vb)|*.vb|Όλα τα αρχεία|*.*' + #13#10 +
      'SaveScriptDialog.Filter=Αρχεία Pascal (*.pas)|*.pas|Αρχεία C++ (*.cpp)|*.cpp|Αρχεία JavaScript (*.js)|*.js|Αρχεία Basic (*.vb)|*.vb|Όλα τα αρχεία|*.*' + #13#10 +
      '');
    Add('dsCm', 'Εκατοστά');
    Add('dsInch', 'Ίντσες');
    Add('dsPix', 'Pixel');
    Add('dsChars', 'Χαρακτήρες');
    Add('dsCode', 'Κωδικός');
    Add('dsPage', 'Σελίδα');
    Add('dsRepFilter', 'Αναφορά (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'Συμπιεσμένη Αναφορά (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', 'Να αποθηκευτούν οι αλλαγές στην Σελίδα;');
    Add('dsSaveChangesTo', 'Αποθήκευση σε ');
    Add('dsCantLoad', 'Δεν ήταν δυνατό το άνοιγμα του Αρχείου');
    Add('dsStyleFile', 'Στυλ');
    Add('dsCantFindProc', 'Δεν εντοπίστηκε η κύρια ρουτίνα');
    Add('dsClearScript', 'Όλος ο κώδικας θα σβηστεί. Να προχωρήσω;');
    Add('dsNoStyle', 'Κανένα Στυλ');
    Add('dsStyleSample', 'Δείγμα Στυλ');
    Add('dsTextNotFound', 'Το κείμενο ''%s'' δεν βρέθηκε');
    Add('dsReplace', 'Αντικατάσταση του ''%s'';');

    Add('TfrxAboutForm',
      'Caption=Σχετικά με το FastReport' + #13#10 +
      'Label4.Caption=Επισκεφθείτε την ιστοσελίδα μας :' + #13#10 +
      'Label6.Caption=Πωλήσεις:' + #13#10 +
      'Label8.Caption=Υποστήριξη:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Ρυθμίσεις Σελίδας' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      'TabSheet1.Caption=Μέγεθος χαρτιού' + #13#10 +
      'Label1.Caption=Πλάτος' + #13#10 +
      'Label2.Caption=Ύψος' + #13#10 +
      'Label11.Caption=Σχήμα   ' + #13#10 +
      'Label12.Caption=Προσανατολισμός   ' + #13#10 +
      'Label3.Caption=Αριστερά' + #13#10 +
      'Label4.Caption=Κορυφή' + #13#10 +
      'Label5.Caption=Δεξιά' + #13#10 +
      'Label6.Caption=Bάση' + #13#10 +
      'Label13.Caption=Περιθώρια   ' + #13#10 +
      'Label14.Caption=Είσοδος Χαρτιού   ' + #13#10 +
      'Label9.Caption=Πρώτη Σελίδα' + #13#10 +
      'Label10.Caption=Υπόλοιπες Σελίδες' + #13#10 +
      'PortraitRB.Caption=Κατακόρυφος' + #13#10 +
      'LandscapeRB.Caption=Κάθετος' + #13#10 +
      'TabSheet3.Caption=Λοιπές Ρυθμίσεις' + #13#10 +
      'Label7.Caption=Στήλες   ' + #13#10 +
      'Label8.Caption=Αριθμός' + #13#10 +
      'Label15.Caption=Πλάτος' + #13#10 +
      'Label16.Caption=Θέσεις' + #13#10 +
      'Label17.Caption=’λλες   ' + #13#10 +
      'Label18.Caption=Duplex' + #13#10 +
      'PrintOnPrevCB.Caption=Εκτύπωση στην προηγούμενη σελίδα' + #13#10 +
      'MirrorMarginsCB.Caption=Καθρέπτισμα περιθωρίων' + #13#10 +
      'LargeHeightCB.Caption=Μεγάλο ύψος στον σχεδιασμό' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Επιλογή Dataset Αναφοράς' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=’κυρο' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Επεξεργασία Μεταβλητών' + #13#10 +
      'NewCategoryB.Caption=Κατηγορία' + #13#10 +
      'NewVarB.Caption=Μεταβλητή' + #13#10 +
      'EditB.Caption=Eπεξεργασία' + #13#10 +
      'DeleteB.Caption=Διαγραφή' + #13#10 +
      'EditListB.Caption=Λίστα' + #13#10 +
      'LoadB.Caption=’νοιγμα' + #13#10 +
      'SaveB.Caption=Αποθήκευση' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'ExprPanel.Caption= Έκφραση:' + #13#10 +
      'OpenDialog1.Filter=Λεξικό (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Λεξικό (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(δεν έχουν καθοριστεί μεταβλητές)');
    Add('vaVar', 'Μεταβλητές');
    Add('vaDupName', 'Το ίδιο όνομα χρησιμοποιείται δύο φορές');

    Add('TfrxOptionsEditor',
      'Caption=Επιλογές Σχεδιαστή' + #13#10 +
      'Label1.Caption=Πλέγμα   ' + #13#10 +
      'Label2.Caption=Τύπος' + #13#10 +
      'Label3.Caption=Μέγεθος' + #13#10 +
      'Label4.Caption=Φόρμα Διαλόγου:' + #13#10 +
      'Label5.Caption=’λλο   ' + #13#10 +
      'Label6.Caption=Γραμματοσειρά   ' + #13#10 +
      'Label7.Caption=Παράθυρο Κώδικα' + #13#10 +
      'Label8.Caption=Επεξεργασία Κειμένου' + #13#10 +
      'Label9.Caption=Μέγεθος' + #13#10 +
      'Label10.Caption=Μέγεθος' + #13#10 +
      'Label11.Caption=Χρώματα   ' + #13#10 +
      'Label12.Caption=Διάστημα ανάμεσα στις Ζώνες:' + #13#10 +
      'Label13.Caption=εκ' + #13#10 +
      'Label14.Caption=ιν' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      'CMRB.Caption=Εκατοστά:' + #13#10 +
      'InchesRB.Caption=Ίντσες:' + #13#10 +
      'PixelsRB.Caption=Pixel:' + #13#10 +
      'ShowGridCB.Caption=Εμφάνιση Πλέγματος' + #13#10 +
      'AlignGridCB.Caption=Στοίχιση στο Πλέγμα' + #13#10 +
      'EditAfterInsCB.Caption=Επεξεργασία μετά την εισαγωγή' + #13#10 +
      'ObjectFontCB.Caption=Χρήση των ρυθμίσεων γραμματοσειρών από το αντικείεμνο' + #13#10 +
      'WorkspaceB.Caption=Workspace' + #13#10 +
      'ToolB.Caption=Παράθυρα Εργαλείων' + #13#10 +
      'LCDCB.Caption=Χρώμα πλέγματος LCD' + #13#10 +
      'FreeBandsCB.Caption=Ελεύθερη τοποθέτηση Ζωνών' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Επαναφορά ρυθμίσεων' + #13#10 +
      'BandsCaptionsCB.Caption=Εμφάνιση τίτλων στις Ζώνες' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=Επιλογή DataSet' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      '');
    Add('dbNotAssigned', '[μη ορισμένο]');
    Add('dbSingleLine', 'Μονή γραμμή');

    Add('TfrxGroupEditorForm',
      'Caption=Ομάδα' + #13#10 +
      'BreakOnL.Caption=Ομαδοποίηση ανά   ' + #13#10 +
      'OptionsL.Caption=Επιλογές   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      'DataFieldRB.Caption=Πεδίο Δεδομένων' + #13#10 +
      'ExpressionRB.Caption=Έκφραση' + #13#10 +
      'KeepGroupTogetherCB.Caption=Διατήρηση ομάδος μαζί' + #13#10 +
      'StartNewPageCB.Caption=Αρχή νέας σελίδας' + #13#10 +
      'OutlineCB.Caption=Εμφάνιση στην Δομή' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=System Memo' + #13#10 +
      'DataBandL.Caption=Ζώνη Δεδομένων' + #13#10 +
      'DataSetL.Caption=DataSet' + #13#10 +
      'DataFieldL.Caption=Πεδίιο Δεδομένων' + #13#10 +
      'FunctionL.Caption=Ρουτίνα' + #13#10 +
      'ExpressionL.Caption=Έκφραση' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      'AggregateRB.Caption=Τιμή Aggregate' + #13#10 +
      'SysVariableRB.Caption=Μεταβλητή Συστήματος' + #13#10 +
      'CountInvisibleCB.Caption=Μέτρηση μη ορατών ζωνών' + #13#10 +
      'TextRB.Caption=Κείμενο' + #13#10 +
      'RunningTotalCB.Caption=Σύνολο' + #13#10 +
      '');
    Add('agAggregate', 'Εισαγωγή Aggregate');
    Add('vt1', '[DATE]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGES#]');
    Add('vt5', '[PAGE#] of [TOTALPAGES#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=Αντικείμενο OLE' + #13#10 +
      'InsertB.Caption=Εισαγωγή...' + #13#10 +
      'EditB.Caption=Επεξεργασία...' + #13#10 +
      'CloseB.Caption=Κλείσιμο' + #13#10 +
      '');
    Add('olStretched', 'Stretched');

    Add('TfrxBarcodeEditorForm',
      'Caption=Επεξεργαστής Barcode' + #13#10 +
      'CodeLbl.Caption=Κωδικός' + #13#10 +
      'TypeLbl.Caption=Τύπος' + #13#10 +
      'ZoomLbl.Caption=Μεγέθυνση:' + #13#10 +
      'OptionsLbl.Caption=Επιλογές   ' + #13#10 +
      'RotationLbl.Caption=Περιστροφή   ' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CalcCheckSumCB.Caption=Υπολογ. Checksum ' + #13#10 +
      'ViewTextCB.Caption=Κείμενο' + #13#10 +
      'Rotation0RB.Caption=0°' + #13#10 +
      'Rotation90RB.Caption=90°' + #13#10 +
      'Rotation180RB.Caption=180°' + #13#10 +
      'Rotation270RB.Caption=270°' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Υπολογ. CheckSum');
    Add('bcShowText', 'Εμφάνιση Κειμένου');

    Add('TfrxAliasesEditorForm',
      'Caption=Επεξεργασία Ψευδώνυμων' + #13#10 +
      'HintL.Caption=Πατήστε Enter για επεξεργασία' + #13#10 +
      'DSAliasL.Caption=Ψευδώνυμο Dataset' + #13#10 +
      'FieldAliasesL.Caption=Ψευδώνυμο Πεδίου' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      'ResetB.Caption=Επαναφορά' + #13#10 +
      'UpdateB.Caption=Ενημέρωση' + #13#10 +
      '');
    Add('alUserName', 'Όνομα χρήστη');
    Add('alOriginal', 'Πρωτότυπο όνομα');

    Add('TfrxParamsEditorForm',
      'Caption=Parameters Editor' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      '');
    Add('qpName', 'Όνομα');
    Add('qpDataType', 'Τύπος Δεδομένων');
    Add('qpValue', 'Τιμή');

    Add('TfrxMDEditorForm',
      'Caption=Σχέση Master-Detail' + #13#10 +
      'Label1.Caption=Πεδία Detail' + #13#10 +
      'Label2.Caption=Πεδία Master' + #13#10 +
      'Label3.Caption=Συνδεδεμένα πεδία' + #13#10 +
      'AddB.Caption=Προσθήκη' + #13#10 +
      'ClearB.Caption=Καθαρισμός' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=Memo' + #13#10 +
      'ExprB.Hint=Εισαγωγή έκφρασης' + #13#10 +
      'AggregateB.Hint=Εισαγωγή Aggregate' + #13#10 +
      'LocalFormatB.Hint=Εισαγωγή μορφοποίησης' + #13#10 +
      'WordWrapB.Hint=Αναδίπλωση Κειμένου' + #13#10 +
      'CancelB.Hint=Ακυρο' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=Εικόνα' + #13#10 +
      'LoadB.Hint=Ανοιγμα' + #13#10 +
      'CopyB.Hint=Αντιγραφή' + #13#10 +
      'PasteB.Hint=Επικόλληση' + #13#10 +
      'ClearB.Hint=Καθαρισμός' + #13#10 +
      'CancelB.Hint=Ακύρωση' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('piEmpty', 'Κενό');

    Add('TfrxChartEditorForm',
      'Caption=Επεξεργαστής Γραφήματος' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'AddB.Hint=Προσθήκη σειράς δεδομένων' + #13#10 +
      'DeleteB.Hint=Διαγραφή σειράς δεδομένων' + #13#10 +
      'DBSourceRB.Caption=Δεδομένα από Βάση' + #13#10 +
      'BandSourceRB.Caption=Πηγή από ζώνη' + #13#10 +
      'FixedDataRB.Caption=Σταθερά δεδομένα' + #13#10 +
      'DatasetLbl.Caption=Dataset' + #13#10 +
      'BandLbl.Caption=Ζώνη δεδομένων' + #13#10 +
      'X1Lbl.Caption=Τιμές X' + #13#10 +
      'Y1Lbl.Caption=Τιμές Y' + #13#10 +
      'X2Lbl.Caption=Τιμές X' + #13#10 +
      'Y2Lbl.Caption=Τιμές Y' + #13#10 +
      'X3Lbl.Caption=Τιμές X (π.χ. a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Τιμές Y (π.χ. 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Λοιπές επιλογές   ' + #13#10 +
      'ShowTopLbl.Caption=Τιμές TopN' + #13#10 +
      'CaptionLbl.Caption=Τίτλος TopN' + #13#10 +
      'SortLbl.Caption=Σειρά ταξινόμησης' + #13#10 +
      'LineMI.Caption=Γραμμές' + #13#10 +
      'AreaMI.Caption=Περιοχές' + #13#10 +
      'PointMI.Caption=Σημεία' + #13#10 +
      'BarMI.Caption=Μπάρες' + #13#10 +
      'HorizBarMI.Caption=Οριζ. Μπάρες' + #13#10 +
      'PieMI.Caption=Πίττες' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Γρηγ.Γραμμές' + #13#10 +
      '');
    Add('ch3D', 'Όψη 3D');
    Add('chAxis', 'Εμφάνιση συντεταγμένων');
    Add('chsoNone', 'Καμία');
    Add('chsoAscending', 'Αύξουσα');
    Add('chsoDescending', 'Φθίνουσα');

    Add('TfrxRichEditorForm',
      'Caption=Rich Editor' + #13#10 +
      'OpenB.Hint=Ανοιγμα Αρχείου' + #13#10 +
      'SaveB.Hint=Αποθήκευση Αρχείου' + #13#10 +
      'UndoB.Hint=Undo' + #13#10 +
      'TTB.Hint=Γραμματοσειρά' + #13#10 +
      'ExprB.Hint=Εισαγωγή έκφρασης' + #13#10 +
      'CancelB.Hint=Ακυρο' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      'BoldB.Hint=Έντονα' + #13#10 +
      'ItalicB.Hint=Πλάγια' + #13#10 +
      'UnderlineB.Hint=Υπογράμμιση' + #13#10 +
      'LeftAlignB.Hint=Αριστερή στοίχιση' + #13#10 +
      'CenterAlignB.Hint=Στοίχιση στο κέντρο' + #13#10 +
      'RightAlignB.Hint=Δεξιά στοίχιση' + #13#10 +
      'BlockAlignB.Hint=Στοίχιση όλου του πλάτους' + #13#10 +
      'BulletsB.Hint=Bullets' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Επεξεργαστής Διασταυρωμένων Ζωνών' + #13#10 +
      'DatasetL.Caption=Πηγή δεδομένων   ' + #13#10 +
      'DimensionsL.Caption=Διαστάσεις   ' + #13#10 +
      'RowsL.Caption=Γραμμές' + #13#10 +
      'ColumnsL.Caption=Στήλες' + #13#10 +
      'CellsL.Caption=Κελλιά' + #13#10 +
      'StructureL.Caption=Δομή διασταύρωσης   ' + #13#10 +
      'RowHeaderCB.Caption=Κεφαλίδα Γραμμής' + #13#10 +
      'ColumnHeaderCB.Caption=Κεφαλίδα Στήλης' + #13#10 +
      'RowTotalCB.Caption=Γενικό Σύνολο Γραμμής' + #13#10 +
      'ColumnTotalCB.Caption=Γενικό Σύνολο Στήλης' + #13#10 +
      'SwapB.Hint=Αναστροφή Γραμμών/Στηλών' + #13#10 +
      'StyleCB.Hint=Στυλ διασταύρωσης' + #13#10 +
      'FontB.Hint=Ρυθμίσεις γραμματοσειράς' + #13#10 +
      'AlignLeftB.Hint=Αριστερή στοίχιση' + #13#10 +
      'AlignCenterB.Hint=Στοίχιση στο κέντρο' + #13#10 +
      'AlignRightB.Hint=Δεξιά στοίχιση' + #13#10 +
      'RotationB.Hint=Περιστροφή κειμένου' + #13#10 +
      'HighlightB.Hint=Έντονο' + #13#10 +
      'FormatB.Hint=Μορφοποίηση' + #13#10 +
      'FrameB.Hint=Ρυθμίσεις πλαισίων' + #13#10 +
      'FillColorB.Hint=Χρώμα' + #13#10 +
      'Func1MI.Caption=Κανένα' + #13#10 +
      'Func2MI.Caption=Σύνολο' + #13#10 +
      'Func3MI.Caption=Ελάχιστο' + #13#10 +
      'Func4MI.Caption=Μέγιστο' + #13#10 +
      'Func5MI.Caption=Μέσος Όρος' + #13#10 +
      'Func6MI.Caption=Καταμέτρηση' + #13#10 +
      'Sort1MI.Caption=Aύξουσα (A-Ω)' + #13#10 +
      'Sort2MI.Caption=Φθίνουσα (Ω-A)' + #13#10 +
      'Sort3MI.Caption=Χωρίς ταξινόμηση' + #13#10 +
      'BoldMI.Caption=Εντονα' + #13#10 +
      'ItalicMI.Caption=Πλάγια' + #13#10 +
      'UnderlineMI.Caption=Υπογράμμιση' + #13#10 +
      'SuperScriptMI.Caption=Ανωφερή' + #13#10 +
      'SubScriptMI.Caption=Κατωφερή' + #13#10 +
      'CondensedMI.Caption=Στενά' + #13#10 +
      'WideMI.Caption=Πλατιά' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=Ακυρο' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('crSubtotal', 'Υποσύνολα');
    Add('crNone', 'Κανένα');
    Add('crSum', 'Σύνολο');
    Add('crMin', 'Ελάχιστο');
    Add('crMax', 'Μέγιστο');
    Add('crAvg', 'Μέσος Όρος');
    Add('crCount', 'Καταμέτρηση');
    Add('crAsc', 'A-Ω');
    Add('crDesc', 'Ω-A');
    Add('crRepHdrs', 'Επανεκτύπωση Κεφαλίδων');
    Add('crBorder', 'Περιθώρια');
    Add('crDown', 'Κάτω, έπειτα οριζόντια');

    Add('TfrxExprEditorForm',
      'Caption=Επεξεργαστής Έκφρασης' + #13#10 +
      'ExprL.Caption=Έκφραση:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=Μορφοποίηση' + #13#10 +
      'CategoryL.Caption=Κατηγορία' + #13#10 +
      'FormatL.Caption=Μορφοποίηση' + #13#10 +
      'FormatStrL.Caption=Τρόπος μορφοποίησης:' + #13#10 +
      'SeparatorL.Caption=Διαχωριστής δεκαδικών:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      '');
    Add('fkText', 'Κείμενο (χωρίς μορφοποίηση)');
    Add('fkNumber', 'Αριθμοί');
    Add('fkDateTime', 'Ημερομηνία/Ώρα');
    Add('fkBoolean', 'Ναι/Όχι');
    Add('fkNumber1', '1234.5;%g');
    Add('fkNumber2', '1234.50;%2.2f');
    Add('fkNumber3', '1,234.50;%2.2n');
    Add('fkNumber4', '$1,234.50;%2.2m');
    Add('fkDateTime1', '11.28.2002;mm.dd.yyyy');
    Add('fkDateTime2', '28 nov 2002;dd mmm yyyy');
    Add('fkDateTime3', 'Νοέμβριος 28, 2005;mmmm dd, yyyy');
    Add('fkDateTime4', '02:14;hh:mm');
    Add('fkDateTime5', '02:14am;hh:mm am/pm');
    Add('fkDateTime6', '02:14:00;hh:mm:ss');
    Add('fkDateTime7', '02:14am, Νοέμβριος 28, 2005;hh:mm am/pm, mmmm dd, yyyy');
    Add('fkBoolean1', '0,1;0,1');
    Add('fkBoolean2', 'Όχι,Ναι;Όχι,Ναι');
    Add('fkBoolean3', '_,x;_,x');
    Add('fkBoolean4', 'False,True;False,True');

    Add('TfrxHighlightEditorForm',
      'Caption=Highlight' + #13#10 +
      'FontColorB.Caption=Χρώμα...' + #13#10 +
      'BackColorB.Caption=Χρώμα...' + #13#10 +
      'ConditionL.Caption=Συνθήκη   ' + #13#10 +
      'FontL.Caption=Γραμματοσειρά   ' + #13#10 +
      'BackgroundL.Caption=Φόντο   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      'BoldCB.Caption=Εντονα' + #13#10 +
      'ItalicCB.Caption=Πλάγια' + #13#10 +
      'UnderlineCB.Caption=Υπογράμμιση' + #13#10 +
      'TransparentRB.Caption=Διαφάνεια' + #13#10 +
      'OtherRB.Caption=Αλλο' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Ρυθμίσεις Αναφοράς' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακύρωση' + #13#10 +
      'GeneralTS.Caption=Γενικά' + #13#10 +
      'ReportSettingsL.Caption=Ρυθμίσεις εκτυπωτή   ' + #13#10 +
      'CopiesL.Caption=Αντίγραφα' + #13#10 +
      'GeneralL.Caption=Γενικά   ' + #13#10 +
      'PasswordL.Caption=Κωδικός ασφαλείας' + #13#10 +
      'CollateCB.Caption=Σύρραψη Αντιγράφων' + #13#10 +
      'DoublePassCB.Caption=Δύο περάσματα' + #13#10 +
      'PrintIfEmptyCB.Caption=Εκτύπωση αν είναι άδεια' + #13#10 +
      'DescriptionTS.Caption=Περιγραφή' + #13#10 +
      'NameL.Caption=Όνομα' + #13#10 +
      'Description1L.Caption=Περιγραφή' + #13#10 +
      'PictureL.Caption=Εικόνα' + #13#10 +
      'AuthorL.Caption=Author' + #13#10 +
      'MajorL.Caption=Major' + #13#10 +
      'MinorL.Caption=Minor' + #13#10 +
      'ReleaseL.Caption=Release' + #13#10 +
      'BuildL.Caption=Build' + #13#10 +
      'CreatedL.Caption=Δημιουργία' + #13#10 +
      'ModifiedL.Caption=Τροποποίηση' + #13#10 +
      'DescriptionL.Caption=Περιγραφή   ' + #13#10 +
      'VersionL.Caption=Εκδοση   ' + #13#10 +
      'PictureB.Caption=Αναζήτηση...' + #13#10 +
      '');
    Add('rePrnOnPort', 'on');

    Add('TfrxStringsEditorForm',
      'Caption=Γραμμές' + #13#10 +
      'CancelB.Hint=Ακυρο' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=Ακυρο' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=Κωδικός ασφαλείας' + #13#10 +
      'PasswordL.Caption=Εισάγετε τον κωδικό:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=Επεξεργαστής Στυλ' + #13#10 +
      'ColorB.Caption=Χρώμα...' + #13#10 +
      'FontB.Caption=Γραμματοσειρά...' + #13#10 +
      'FrameB.Caption=Πλαίσιο...' + #13#10 +
      'AddB.Hint=Προσθήκη' + #13#10 +
      'DeleteB.Hint=Διαγραφή' + #13#10 +
      'EditB.Hint=Επεξεργασία' + #13#10 +
      'LoadB.Hint=Ανοιγμα' + #13#10 +
      'SaveB.Hint=Αποθήκευση' + #13#10 +
      'CancelB.Hint=Ακύρωση' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=Επεξεργαστής Πλαισίων' + #13#10 +
      'FrameL.Caption=Πλαίσιο' + #13#10 +
      'LineL.Caption=Γραμμή πλαισίου' + #13#10 +
      'ShadowL.Caption=Σκιά' + #13#10 +
      'FrameTopB.Hint=Γραμμή Επάνω' + #13#10 +
      'FrameBottomB.Hint=Γραμμή Κάτω' + #13#10 +
      'FrameLeftB.Hint=Γραμμή Αριστερά' + #13#10 +
      'FrameRightB.Hint=Γραμμή Δεξιά' + #13#10 +
      'FrameAllB.Hint=Όλες οι γραμμές' + #13#10 +
      'FrameNoB.Hint=Χωρίς πλαίσιο' + #13#10 +
      'FrameColorB.Hint=Χρώμα πλαισίου' + #13#10 +
      'FrameStyleB.Hint=Στυλ πλαισίου' + #13#10 +
      'FrameWidthCB.Hint=Πλάτος πλαισίου' + #13#10 +
      'ShadowB.Hint=Σκιά' + #13#10 +
      'ShadowColorB.Hint=Χρώμα Σκιάς' + #13#10 +
      'ShadowWidthCB.Hint=Πλάτος Σκιάς' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=Νέο' + #13#10 +
      'ItemsTab.Caption=Items' + #13#10 +
      'TemplatesTab.Caption=Templates' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Σειρά Tab' + #13#10 +
      'Label1.Caption=Control με σειρά tab:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      'UpB.Caption=Μετακίνηση προς τα επάνω' + #13#10 +
      'DownB.Caption=Mετακίνηση προς τα κάτω' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Evaluate' + #13#10 +
      'Label1.Caption=Έκφραση' + #13#10 +
      'Label2.Caption=Αποτέλεσμα' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Wizard Αναφοράς' + #13#10 +
      'DataTab.Caption=Δεδομένα' + #13#10 +
      'GroupsTab.Caption=Ομάδες' + #13#10 +
      'LayoutTab.Caption=Διάταξη' + #13#10 +
      'StyleTab.Caption=Στυλ' + #13#10 +
      'Step1L.Caption=Βήμα 1. Επιλέξτε dataset και πεδία δεδομένων προς εμφάνιση.' + #13#10 +
      'Step2L.Caption=Βήμα 2. Δημιουργήστε Ομάδες (προαιρετικά).' + #13#10 +
      'Step3L.Caption=Βήμα 3. Καθορίστε την Σελίδα και την Διάταξη των δεδομένων.' + #13#10 +
      'Step4L.Caption=Βήμα 4. Επιλέξτε το Στυλ της Αναφοράς.' + #13#10 +
      'AddFieldB.Caption=Προσθήκη >' + #13#10 +
      'AddAllFieldsB.Caption=Προσθήκη Όλων >>' + #13#10 +
      'RemoveFieldB.Caption=< Αφαίρεση' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Αφαίρεση Όλων' + #13#10 +
      'AddGroupB.Caption=Προσθήκη >' + #13#10 +
      'RemoveGroupB.Caption=< Αφαίρεση' + #13#10 +
      'SelectedFieldsL.Caption=Επιλεγμένα πεδία:' + #13#10 +
      'AvailableFieldsL.Caption=Διαθέσιμα πεδία:' + #13#10 +
      'GroupsL.Caption=Ομάδες:' + #13#10 +
      'OrientationL.Caption=Προσανατολισμός   ' + #13#10 +
      'LayoutL.Caption=Layout   ' + #13#10 +
      'PortraitRB.Caption=Κατακόρυφος' + #13#10 +
      'LandscapeRB.Caption=Κάθετος' + #13#10 +
      'TabularRB.Caption=Tab' + #13#10 +
      'ColumnarRB.Caption=Σε κολώνες' + #13#10 +
      'FitWidthCB.Caption=Τα πεδία να χωρέσουν στο πλάτος σελίδας' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      'BackB.Caption=<< Προηγούμενο' + #13#10 +
      'NextB.Caption=Επόμενο >>' + #13#10 +
      'FinishB.Caption=ΟΚ' + #13#10 +
      '');
    Add('wzStd', 'Wizard Αναφοράς');
    Add('wzDMP', 'Wizard Dot-Matrix Αναφοράς');
    Add('wzStdEmpty', 'Αναφορά');
    Add('wzDMPEmpty', 'Αναφορά Dot-Matrix');


    Add('ftAllFiles', 'Όλα τα αρχεία');
    Add('ftPictures', 'Εικόνες');
    Add('ftDB', 'Βάσεις Δεδομένων');
    Add('ftRichFile', 'Αρχείο RichText');
    Add('ftTextFile', 'Αρχείο Κειμένου');

    Add('prNotAssigned', '(μη ορισμένη)');
    Add('prInvProp', 'Μη έγκυρη τιμή παραμέτρου');
    Add('prDupl', 'Ταυτόσημη ονομασία');
    Add('prPict', '(Εικόνα)');

    Add('mvExpr', 'Επιτρέπει εκφράσεις');
    Add('mvStretch', 'Τεντωμένο');
    Add('mvStretchToMax', 'Τεντωμένο στο μέγιστο ύψος');
    Add('mvShift', 'Μετακίνηση');
    Add('mvShiftOver', 'Μετακίνηση όταν συμπέφτουν');
    Add('mvVisible', 'Ορατό');
    Add('mvPrintable', 'Εκτυπώσιμο');
    Add('mvFont', 'Γραμματοσειρά...');
    Add('mvFormat', 'Μορφοποίηση εμφάνισης...');
    Add('mvClear', 'Καθαρισμός Περιεχομένων');
    Add('mvAutoWidth', 'Αυτόματο Πλάτος');
    Add('mvWWrap', 'Word Wrap');
    Add('mvSuppress', 'Σύμπτυξη Επαναλαμβανομένων Τιμών');
    Add('mvHideZ', 'Απόκρυωη μηδενικών');
    Add('mvHTML', 'Επιτρέπει HTML Tags');
    Add('lvDiagonal', 'Διαγώνια');
    Add('pvAutoSize', 'Αυτόματο μέγεθος');
    Add('pvCenter', 'Κέντρο');
    Add('pvAspect', 'Διατήρηση Αναλογιών');
    Add('bvSplit', 'Επιτρέπει Διαχωρισμό');
    Add('bvKeepChild', 'Διατήρηση ζώνης-Παιδί μαζί');
    Add('bvPrintChild', 'Εκτύπωση αν η ζώνη-Παιδί είναι μη ορατή');
    Add('bvStartPage', 'Αρχή νέας σελίδας');
    Add('bvPrintIfEmpty', 'Εκτύπωση αν το Detail είναι άδειο');
    Add('bvKeepDetail', 'Διατήρηση Detail μαζί');
    Add('bvKeepFooter', 'Διατήρηση Υποσέλιδου μαζί');
    Add('bvReprint', 'Επανεκτύπωση σε κάθε σελίδα');
    Add('bvOnFirst', 'Εκτύπωση στην πρώτη σελίδα');
    Add('bvOnLast', 'Εκτύπωση στην τελευταία σελίδα');
    Add('bvKeepGroup', 'Διατήρηση μαζί');
    Add('bvFooterAfterEach', 'Υποσέλιδο για κάθε γραμμή');
    Add('srParent', 'Εκτύπωση στον προηγούμενο');
    Add('bvKeepHeader', 'Διατήρηση Κεφαλίδας μαζί');

    Add('obCatDraw', 'Σχεδίαση');
    Add('obCatOther', '’λλα αντικείμενα');
    Add('obCatOtherControls', 'Αλλα controls');
    Add('obDiagLine', 'Διαγώνια Γραμμή');
    Add('obRect', 'Ορθογώνιο');
    Add('obRoundRect', 'Ορθογώνιο με στρογγυλεμένες γωνίες');
    Add('obEllipse', 'Έλλειψη');
    Add('obTrian', 'Τρίγωνο');
    Add('obDiamond', 'Διαμάντι');
    Add('obLabel', 'Τίτλος');
    Add('obEdit', 'Εισαγωγή τιμών (Edit)');
    Add('obMemoC', 'Εισαγωγή Κειμένου (Memo)');
    Add('obButton', 'Κουμπί');
    Add('obChBoxC', 'Κουμπί Πολλαπλής Επιλογής (CheckBox)');
    Add('obRButton', 'Κουμπί Μονής Επιλογής (RadioButton)');
    Add('obLBox', 'Λίστα Επιλογής (ListBox)');
    Add('obCBox', 'Λίστα Επιλογής (ComboBox)');
    Add('obDateEdit', 'Επιλογή Ημερομηνίας (DateEdit)');
    Add('obImageC', 'Χειρισμός Εικόνας (Image)');
    Add('obPanel', 'Επιφάνεια (Panel)');
    Add('obGrBox', 'Επιφάνεια Επιλογών (GroupBox)');
    Add('obBBtn', 'Κουμπί (BitBtn)');
    Add('obSBtn', 'Κουμπί (SpeedButton)');
    Add('obMEdit', 'Εισαγωγή με μάσκα (MaskEdit)');
    Add('obChLB', 'Πολλαπλή επιλογή από λίστα (CheckListBox)');
    Add('obDBLookup', 'Επιλογή από Βάση (DBLookupComboBox)');
    Add('obBevel', 'Σχήμα (Bevel)');
    Add('obShape', 'Σχήμα (Shape)');
    Add('obText', 'Κείμενο (Text)');
    Add('obSysText', 'Κείμενο Συστήματος (System text)');
    Add('obLine', 'Γραμμή (Line)');
    Add('obPicture', 'Εικόνα');
    Add('obBand', 'Ζώνη');
    Add('obDataBand', 'Ζώνη Δεδομένων');
    Add('obSubRep', 'Υποαναφορά');
    Add('obDlgPage', 'Φόρμα Διαλόγου');
    Add('obRepPage', 'Σελίδα Αναφοράς');
    Add('obReport', 'Αναφορά');
    Add('obRich', 'Εμπλουτισμένο Κείμενο (RichText)');
    Add('obOLE', 'Αντικείμενο OLE');
    Add('obChBox', 'Κουμπί Πολλαπλής Επιλογής (CheckBox)');
    Add('obChart', 'Γράφημα');
    Add('obBarC', 'Barcode');
    Add('obCross', 'Αντικείμενο Διασταύρωσης');
    Add('obDBCross', 'Αντικείμενο Διασταύρωσης σχετιζόμενο με Βάση Δεδομένων');
    Add('obGrad', 'Χρωματική διαβάθμιση (Gradient)');
    Add('obDMPText', 'Κείμενο Dot-matrix');
    Add('obDMPLine', 'Γραμμή Dot-matrix');
    Add('obBDEDB', 'BDE - Βάση Δεδομένων');
    Add('obBDETb', 'BDE - Πίνακας');
    Add('obBDEQ', 'BDE - Ερώτημα');
    Add('obBDEComps', 'BDE');
    Add('obIBXDB', 'IBX - Βάση Δεδομένων');
    Add('obIBXTb', 'IBX - Πίνακας');
    Add('obIBXQ', 'IBX - ερώτημα');
    Add('obIBXComps', 'IBX');
    Add('obADODB', 'ADO - Βάση Δεδομένων');
    Add('obADOTb', 'ADO - Πίνακας');
    Add('obADOQ', 'ADO - Ερώτημα');
    Add('obADOComps', 'ADO');
    Add('obDBXDB', 'DBX - Βάση Δεδομένων');
    Add('obDBXTb', 'DBX - Πίνακας');
    Add('obDBXQ', 'DBX - Ερώτημα');
    Add('obDBXComps', 'DBX');

    Add('ctString', 'Συμβολοσειρά (String)');
    Add('ctDate', 'Ημερομηνία/Ωρα');
    Add('ctConv', 'Μετατροπές');
    Add('ctFormat', 'Μορφοποίηση');
    Add('ctMath', 'Μαθηματικά');
    Add('ctOther', 'Αλλα');

    Add('IntToStr', 'Μετατρέπει integer σε string');
    Add('FloatToStr', 'Μετατρέπει float σε string');
    Add('DateToStr', 'Μετατρέπει την ημερομηνία σε string');
    Add('TimeToStr', 'Μετατρέπει την ώρα σε string');
    Add('DateTimeToStr', 'Μετατρέπει την συνδυασμένη ημερομηνία/ώρα σε string');
    Add('VarToStr', 'Μετατρέπει variant σε string');
    Add('StrToInt', 'Μετατρέπει string σε integer');
    Add('StrToFloat', ''Μετατρέπει string σε float');
    Add('StrToDate', ''Μετατρέπει string σε ημερομηνία');
    Add('StrToTime', ''Μετατρέπει string σε ώρα);
    Add('StrToDateTime', 'Μετατρέπει string σε συνδυασμένη ημερομηνία/ώρα');
    Add('Format', 'Επιστρέφει μορφοποιημένο string δομημένο από μια σειρά από παραμέτρους σε array');
    Add('FormatFloat', 'Μορφοποιεί μια τιμή float');
    Add('FormatDateTime', 'Μορφοποιεί μια τιμή ημερομηνίας/ώρας');
    Add('FormatMaskText', 'Επιστρέφει ένα string μορφοποιημένο με χρήση μάσκας');
    Add('EncodeDate', 'Επιστρέφει τιμή τύπου TDateTime για καθορισμένο Έτος, Μήνα και Μέρα');
    Add('DecodeDate', 'Διασπά την TDateTime σε Έτος, Μήνα και Μέρα');
    Add('EncodeTime', 'Επιστρέφει τιμή τύπου TDateTime για καθορισμένη Ώρα, Λεπτά, Δευτερόλεπτα και Χιλιοστά');
    Add('DecodeTime', 'Διασπά την TDateTime σε ώρες, λεπτά, δευτερόλεπτα και χιλιοστά');
    Add('Date', 'Επιστρέφει την τρέχουσα ημερομηνία');
    Add('Time', 'Επιστρέφει την τρέχουσα ώρα');
    Add('Now', 'Επιστρέφει την τρέχουσα ημερομηνία και ώρα');
    Add('DayOfWeek', 'Επιστρέφει την Ημέρα της Εβδομάδος για μια καθορισμένη ημερομηνία');
    Add('IsLeapYear', 'Επιστρέφει True/False για το αν ένα συγκεκριμένο έτος είναι δίσεκτο');
    Add('DaysInMonth', 'Επιστρέφει τον αριθμό των ημερών για ένα συγκεκριμένο μήνα');
    Add('Length', 'Επιστρέφει το μήκος ενός string');
    Add('Copy', 'Επιστρέφει ένα τμήμα ενός string');
    Add('Pos', 'Επιστρέφει την θέση ενός τμήματος μέσα σε ένα string');
    Add('Delete', 'Αφαιρεί ένα τμήμα από ένα string');
    Add('Insert', 'Εισάγει ένα τμήμα σε ένα string');
    Add('Uppercase', 'Μετατρέπει όλους τους χαρακτήρες ενός string σε κεφαλαία (ΑΒΓ)');
    Add('Lowercase', 'Μετατρέπει όλους τους χαρακτήρες ενός string σε πεζά (αβγ)');
    Add('Trim', 'Αφαιρεί όλα τα κενά που βρίσκονται στην αρχή και στο τέλος ενός string');
    Add('NameCase', 'Μετατρέπει το πρώτο γράμμα κάθε λέξης σε κεφαλαίο (Αβγ)');
    Add('CompareText', 'Συγκρίνει δύο string');
    Add('Chr', 'Μετατρέπει έναν integer σε char');
    Add('Ord', 'Μετατρέπει ένα char σε integer');
    Add('SetLength', 'Ορίζει το μέγεθος ενός string');
    Add('Round', 'Στρογγυλοποιεί έναν float στο πλησιέστερο ακέραιο αριθμό');
    Add('Trunc', 'Κόβει τα δεκαδικά ενός float, μετατρέποντάς τον σε integer');
    Add('Int', 'Επιστρέφει το ακέραιο μέρος ενός real');
    Add('Frac', 'Επιστρέφει το δεκαδικό μέρος ενός real');
    Add('Sqrt', 'Επιστρέφει την τετραγωνική ρίζα ενός αριθμού');
    Add('Abs', 'Επιστρέφει απόλυτη τιμή');
    Add('Sin', 'Επιστρέφει το ημίτονο μιας γωνίας (σε μοίρες)');
    Add('Cos', 'Επιστρέφει το συνημίτονο μιας γωνίας (σε μοίρες)');
    Add('ArcTan', 'Επιστρέφει το arctangent');
    Add('Tan', 'Επιστρέφει το tangent');
    Add('Exp', 'Επιστρέφει τον Εκθέτη');
    Add('Ln', 'Επιστρέφει τον λογάριθμο μιας έκφρασης τύπου real');
    Add('Pi', 'Επιστρέφει το π (3.1415926...)');
    Add('Inc', 'Αυξάνει μια τιμή');
    Add('Dec', 'Μειώνει μια τιμή');
    Add('RaiseException', 'Εμφανίζει παράθυρο σφάλματος');
    Add('ShowMessage', 'Εμφανίζει παράθυρο μηνύματος με μία επιλογή');
    Add('Randomize', 'Ξεκινά τον μηχανισμό γέννησης τυχαίων αριθμών');
    Add('Random', 'Επιστρέφει ένα τυχαίο αριθμό');
    Add('ValidInt', 'Επιστρέφει True εάν το εν λόγω string περιέχει έναν έγκυρο integer αριθμό');
    Add('ValidFloat', 'Επιστρέφει True εάν το εν λόγω string περιέχει έναν έγκυρο float αριθμό');
    Add('ValidDate', 'Επιστρέφει True εάν το εν λόγω string περιέχει μια έγκυρη ημερομηνία');
    Add('IIF', 'Επιστρέφει τιμή TrueValue εάν η έκφραση είναι αληθής, αλλιώς επιστρέφει τιμή FalseValue');
    Add('Get', 'Εσωτερική χρήση μόνο');
    Add('Set', 'Εσωτερική χρήση μόνο');
    Add('InputBox', 'Εμφανίζει παράθυρο διαλόγου στο οποίο ο χρήστης μπορεί να εισάγει ένα string');
    Add('InputQuery', 'Εμφανίζει παράθυρο διαλόγου στο οποίο ο χρήστης μπορεί να εισάγει ένα string');
    Add('MessageDlg', 'Εμφανίζει ένα παράθυρο μηνύματος με πολλαπλές επιλογές');
    Add('CreateOleObject', 'Δημιουργεί ένα αντικείμενο OLE');
    Add('VarArrayCreate', 'Δημιουργεί ένα variant array');
    Add('VarType', 'Επιστρέφει τον τύπο μιας τιμής variant');
    Add('DayOf', 'Επιστρέφει τον αριθμό της Ημέρας (1..31) μιας συγκεκριμένης Ημερομηνίας');
    Add('MonthOf', 'Επιστρέφει τον αριθμό του Μήνα (1..12) μιας συγκεκριμένης Ημερομηνίας');
    Add('YearOf', 'Επιστρέφει το Έτος μιας συγκεκριμένης Ημερομηνίας');

    Add('ctAggregate', 'Aggregate');
    Add('Sum', 'Υπολογίζει το Σύνολο της Εκφρασης για την γραμμή δεδομένων της ζώνης');
    Add('Avg', 'Υπολογίζει το Μέσο Όρο της Εκφρασης για την γραμμή δεδομένων της ζώνης');
    Add('Min', 'Υπολογίζει το Ελάχιστο της Εκφρασης για την γραμμή δεδομένων της ζώνης');
    Add('Max', 'Υπολογίζει το Μέγιστο της Εκφρασης για την γραμμή δεδομένων της ζώνης');
    Add('Count', 'Καταμετρά τον αριθμό των γραμμών δεδομένων της ζώνης');
  end;
end;


initialization
  frAddDesignerRes;

end.