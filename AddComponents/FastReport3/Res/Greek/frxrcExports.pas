
{******************************************}
{                                          }
{             FastReport v3.0              }
{         Language resource file           }
{                                          }
{            Copyright (c) 2004            }
{          by Alexander Fediachov,         }
{             Fast Reports, Inc.           }
{                                          }
{******************************************}

unit frxrcExports;

interface

procedure frAddExportsRes;

implementation

uses frxRes;

procedure frAddExportsRes;
begin
  with frxResources do
  begin
    frxResources.Add('TfrxXLSExportDialog',
      'Caption=Εξαγωγή σε Excel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      'GroupPageRange.Caption= Εύρος Σελίδων ' + #13#10 +
      'AllRB.Caption=Όλες' + #13#10 +
      'CurPageRB.Caption=Τρέχουσα Σελίδα' + #13#10 +
      'PageNumbersRB.Caption=Σελίδες:' + #13#10 +
      'DescrL.Caption=Δώστε αριθμούς και εύρος Σελίδων, χωρισμένα με κόμα. Για παράδειγμα 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Ρυθμίσεις Εξαγωγής ' + #13#10 +
      'StylesCB.Caption=Styles' + #13#10 +
      'PicturesCB.Caption=Εικόνες' + #13#10 +
      'MergeCB.Caption=Συνένωση Κελιών' + #13#10 +
      'PageBreaksCB.Caption=Σελιδοποίηση' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Open Excel after export' + #13#10 +
      'SaveDialog1.Filter=Αρχείο Excel (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=Εξαγωγή σε Εxcel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      'GroupPageRange.Caption= Εύρος Σελίδων ' + #13#10 +
      'AllRB.Caption=Όλες' + #13#10 +
      'CurPageRB.Caption=Τρέχουσα Σελίδα' + #13#10 +
      'PageNumbersRB.Caption=Σελίδες:' + #13#10 +
      'DescrL.Caption=Δώστε αριθμούς και εύρος Σελίδων, χωρισμένα με κόμα. Για παράδειγμα 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Ρυθμίσεις Εξαγωγής ' + #13#10 +
      'StylesCB.Caption=Styles' + #13#10 +
      'PageBreaksCB.Caption=Σελιδοποίηση' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Open Excel after export' + #13#10 +
      'SaveDialog1.Filter=Αρχείο XML Excel (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=Εξαγωγή σε πίνακα HTML' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      'GroupPageRange.Caption= Εύρος Σελίδων ' + #13#10 +
      'AllRB.Caption=Όλες' + #13#10 +
      'CurPageRB.Caption=Τρέχουσα Σελίδα' + #13#10 +
      'PageNumbersRB.Caption=Σελίδες:' + #13#10 +
      'DescrL.Caption=Δώστε αριθμούς και εύρος Σελίδων, χωρισμένα με κόμα. Για παράδειγμα 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Ρυθμίσεις Εξαγωγής ' + #13#10 +
      'OpenAfterCB.Caption=’νοιγμα μετά την Εξαγωγή' + #13#10 +
      'StylesCB.Caption=Styles' + #13#10 +
      'PicturesCB.Caption=Εικόνες' + #13#10 +
      'PicsSameCB.Caption=Όλα σε ένα φάκελλο' + #13#10 +
      'FixWidthCB.Caption=ΌΛα ένα πλάτος' + #13#10 +
      'NavigatorCB.Caption=Πλοηγός Σελίδων' + #13#10 +
      'MultipageCB.Caption=Πολλαπλές Σελίδες' + #13#10 +
      'MozillaCB.Caption=Πλοηγός Mozilla' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=Αρχείο HTML (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Εξαγωγή σε Κείμενο (dot-matrix εκτυπωτή)' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=’κυρο' + #13#10 +
      'BtnPreview.Hint=Προεπισκόπηση ναι/όχι' + #13#10 +
      'GroupCellProp.Caption= Ρυθμίσεις Εξαγωγής  ' + #13#10 +
      'CB_PageBreaks.Caption=Σελιδοποίηση' + #13#10 +
      'CB_OEM.Caption=Πίνακας Συμβολοσειράς OEM' + #13#10 +
      'CB_EmptyLines.Caption=’δειες γραμμές' + #13#10 +
      'CB_LeadSpaces.Caption=Κενά Στοίχισης' + #13#10 +
      'GroupPageRange.Caption= Εύρος Σελίδων  ' + #13#10 +
      'Pages.Caption=Αριθμοί Σελίδων' + #13#10 +
      'Descr.Caption=Δώστε αριθμούς και εύρος Σελίδων, χωρισμένα με κόμα. Για παράδειγμα 1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption= Κλίμακα ' + #13#10 +
      'ScX.Caption=Κλίμακα X' + #13#10 +
      'ScY.Caption=Κλίμακα Y' + #13#10 +
      'GroupFramesSettings.Caption= Πλαίσια ' + #13#10 +
      'RB_NoneFrames.Caption=Κανένα' + #13#10 +
      'RB_Simple.Caption=Απλά' + #13#10 +
      'RB_Graph.Caption=Γραφικά' + #13#10 +
      'RB_Graph.Hint=Μόνο με πίνακα OEM' + #13#10 +
      'CB_PrintAfter.Caption=Εκτύπωση μετά την Εξαγωγή' + #13#10 +
      'CB_Save.Caption=Ρυθμίσεις Αποθήκευσης' + #13#10 +
      'GroupBox1.Caption= Προεπισκόπηση ' + #13#10 +
      'Label1.Caption=Πλάτος:' + #13#10 +
      'Label3.Caption=Ύψος:' + #13#10 +
      'LBPage.Caption=Σελίδα' + #13#10 +
      'ToolButton1.Hint=Zoom in' + #13#10 +
      'ToolButton2.Hint=Zoom out' + #13#10 +
      'SaveDialog1.Filter=Αρχείο Κειμένου (dot-matrix εκτυπωτή)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Εκτύπωση' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Ακυρο' + #13#10 +
      'GroupBox1.Caption=Εκτυπωτής' + #13#10 +
      'Label4.Caption=Όνομα' + #13#10 +
      'PropButton.Caption=Ρυθμίσεις...' + #13#10 +
      'GroupBox3.Caption=Αντίγραφα' + #13#10 +
      'Label2.Caption=Αριθμός Αντιγράφων' + #13#10 +
      'GroupBox2.Caption= Printer init setup ' + #13#10 +
      'Label1.Caption=Είδος Εκτυπωτή' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Printer init template (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=Printer init template (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=Export to RTF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      'GroupPageRange.Caption= Εύρος Σελίδων ' + #13#10 +
      'AllRB.Caption=Όλες' + #13#10 +
      'CurPageRB.Caption=Τρέχουσα Σελίδα' + #13#10 +
      'PageNumbersRB.Caption=Σελίδες:' + #13#10 +
      'DescrL.Caption=Δώστε αριθμούς και εύρος Σελίδων, χωρισμένα με κόμα. Για παράδειγμα 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Ρυθμίσεις Εξαγωγής ' + #13#10 +
      'PicturesCB.Caption=Εικόνες' + #13#10 +
      'PageBreaksCB.Caption=Σελιδοποίηση' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenCB.Caption=’νοιγμα μετά την εξαγωγή' + #13#10 +
      'SaveDialog1.Filter=Αρχείο RTF (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Ρυθμίσεις Εξαγωγής' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Ακυρο' + #13#10 +
      'GroupPageRange.Caption= Εύρος Σελίδων  ' + #13#10 +
      'AllRB.Caption=Όλες' + #13#10 +
      'CurPageRB.Caption=Τρέχουσα Σελίδα' + #13#10 +
      'PageNumbersRB.Caption=Σελίδες:' + #13#10 +
      'DescrL.Caption=Δώστε αριθμούς και εύρος Σελίδων, χωρισμένα με κόμα. Για παράδειγμα 1,3,5-12' + #13#10 +
      'GroupBox1.Caption= Ρυθμίσεις Εικόνας ' + #13#10 +
      'Label2.Caption=Ποιότητα JPEG' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=Κόψιμο περιθωρίων' + #13#10 +
      'Mono.Caption=Μονόχρωμο' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=Eξαγωγή σε PDF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Ακυρο' + #13#10 +
      'GroupPageRange.Caption= Εύρος Σελίδων ' + #13#10 +
      'AllRB.Caption=Όλες' + #13#10 +
      'CurPageRB.Caption=Τρέχουσα Σελίδα' + #13#10 +
      'PageNumbersRB.Caption=Σελίδες:' + #13#10 +
      'DescrL.Caption=Δώστε αριθμούς και εύρος Σελίδων, χωρισμένα με κόμα. Για παράδειγμα 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Ρυθμίσεις Εξαγωγής ' + #13#10 +
      'CompressedCB.Caption=Συμπίεση' + #13#10 +
      'EmbeddedCB.Caption=Συμπεριλαμβάνει γραμματοσειρές' + #13#10 +
      'PrintOptCB.Caption=Βέλτιστη Εκτύπωση' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenCB.Caption=Open after export' + #13#10 +
      'SaveDialog1.Filter=Αρχείο Adobe PDF (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'Αρχείο RTF');
    Add('BMPexport', 'Εικόνα BMP');
    Add('JPEGexport', 'Εικόνα JPEG');
    Add('TIFFexport', 'Εικόνα TIFF');
    Add('TextExport', 'Κείμενο (dotmatrix εκτυπωτή)');
    Add('XlsOLEexport', 'Πίνακας Excel (OLE)');
    Add('HTMLexport', 'Αρχείο HTML');
    Add('XlsXMLexport', 'Πίνακας Excel (XML)');
    Add('PDFexport', 'Αρχείο PDF');

    Add('ProgressWait', 'Παρακαλώ Περιμένετε');
    Add('ProgressRows', 'Επεξεργασία Γραμμών');
    Add('ProgressColumns', 'Επεξεργασία Στηλών');
    Add('ProgressStyles', 'Καθορισμός των Στυλ');
    Add('ProgressObjects', 'Εξαγωγή');


    Add('TIFFexportFilter', 'Εικόνα Tiff (*.tif)|*.tif');
    Add('BMPexportFilter', 'Εικόνα BMP (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Εικόνα Jpeg (*.jpg)|*.jpg');

    Add('HTMLNavFirst', 'First');
    Add('HTMLNavPrev', 'Prev');
    Add('HTMLNavNext', 'Next');
    Add('HTMLNavLast', 'Last');
    Add('HTMLNavRefresh', 'Refresh');
    Add('HTMLNavPrint', 'Print');
    Add('HTMLNavTotal', 'Total pages');
  end;
end;

initialization
  frAddExportsRes;

end.
