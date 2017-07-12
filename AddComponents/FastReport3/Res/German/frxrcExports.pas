// German translation by Wolfgang Kleinrath 2004.09.03
// Weitere Anpassungen von Robert Wismet (www.rowisoft.de) 2004.10.10
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
      'Caption=Excelexport' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      'GroupPageRange.Caption= Seitenbereich ' + #13#10 +
      'AllRB.Caption=Alle' + #13#10 +
      'CurPageRB.Caption=Aktuelle Seite' + #13#10 +
      'PageNumbersRB.Caption=Seiten:' + #13#10 +
      'DescrL.Caption=Seitennummern und/oder Seitenbereiche durch Komma getrennt eingeben, z.B. 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Exporteinstellungen ' + #13#10 +
      'StylesCB.Caption=Stile' + #13#10 +
      'PicturesCB.Caption=Bilder' + #13#10 +
      'MergeCB.Caption=Zellen verbinden' + #13#10 +
      'PageBreaksCB.Caption=Seitenumbrüche' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Excel nach Export öffnen' + #13#10 +
      'SaveDialog1.Filter=Exceldatei (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=Excelexport' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      'GroupPageRange.Caption= Seitenbereich ' + #13#10 +
      'AllRB.Caption=Alle' + #13#10 +
      'CurPageRB.Caption=Aktuelle Seite' + #13#10 +
      'PageNumbersRB.Caption=Seiten:' + #13#10 +
      'DescrL.Caption=Seitennummern und/oder Seitenbereiche durch Komma getrennt eingeben, z.B. 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Exporteinstellungen ' + #13#10 +
      'StylesCB.Caption=Stile' + #13#10 +
      'PageBreaksCB.Caption=Seitenumbrüche' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Excel nach Export öffnen' + #13#10 +
      'SaveDialog1.Filter=XML Exceldatei (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=Export in HTML Tabelle' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      'GroupPageRange.Caption= Seitenbereich ' + #13#10 +
      'AllRB.Caption=Alle' + #13#10 +
      'CurPageRB.Caption=Aktuelle Seite' + #13#10 +
      'PageNumbersRB.Caption=Seiten:' + #13#10 +
      'DescrL.Caption=Seitennummern und/oder Seitenbereiche durch Komma getrennt eingeben, z.B. 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Exporteinstellungen ' + #13#10 +
      'OpenAfterCB.Caption=Nach Export öffnen' + #13#10 +
      'StylesCB.Caption=Stile' + #13#10 +
      'PicturesCB.Caption=Bilder' + #13#10 +
      'PicsSameCB.Caption=Alles in einen Ordner' + #13#10 +
      'FixWidthCB.Caption=Feste Breite' + #13#10 +
      'NavigatorCB.Caption=Seitennavigator' + #13#10 +
      'MultipageCB.Caption=Mehrfachseite' + #13#10 +
      'MozillaCB.Caption=Mozilla-Browser' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=HTML-Datei (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Textexport (dot-matrix Drucker)' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Abbruch' + #13#10 +
      'BtnPreview.Hint=Vorschau ein/aus' + #13#10 +
      'GroupCellProp.Caption= Exporteigenschaften  ' + #13#10 +
      'CB_PageBreaks.Caption=Seitenumbrüche' + #13#10 +
      'CB_OEM.Caption=OEM Zeichensatz' + #13#10 +
      'CB_EmptyLines.Caption=Leerzeilen' + #13#10 +
      'CB_LeadSpaces.Caption=Führende Leerzeichen' + #13#10 +
      'GroupPageRange.Caption= Seitenbereiche  ' + #13#10 +
      'Pages.Caption=Seitennummern' + #13#10 +
      'Descr.Caption=Seitennummern und/oder Seitenbereiche durch Komma getrennt eingeben, z.B. 1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption= Skalierung ' + #13#10 +
      'ScX.Caption=X Skalierung' + #13#10 +
      'ScY.Caption=Y Skalierung' + #13#10 +
      'GroupFramesSettings.Caption= Rahmen ' + #13#10 +
      'RB_NoneFrames.Caption=Kein' + #13#10 +
      'RB_Simple.Caption=Einfach' + #13#10 +
      'RB_Graph.Caption=Grafisch' + #13#10 +
      'RB_Graph.Hint=Nur mit OEM Zeichensatz' + #13#10 +
      'CB_PrintAfter.Caption=Nach Export drucken' + #13#10 +
      'CB_Save.Caption=Einstellungen speichern' + #13#10 +
      'GroupBox1.Caption= Vorschau ' + #13#10 +
      'Label1.Caption=Breite:' + #13#10 +
      'Label3.Caption=Höhe:' + #13#10 +
      'LBPage.Caption=Seite' + #13#10 +
      'ToolButton1.Hint=Einzoomen' + #13#10 +
      'ToolButton2.Hint=Auszoomen' + #13#10 +
      'SaveDialog1.Filter=Textdatei (dot-matrix Drucker)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Drucken' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Abbruch' + #13#10 +
      'GroupBox1.Caption=Drucker' + #13#10 +
      'Label4.Caption=Name' + #13#10 +
      'PropButton.Caption=Setup...' + #13#10 +
      'GroupBox3.Caption=Kopien' + #13#10 +
      'Label2.Caption=Anzahl der Kopien' + #13#10 +
      'GroupBox2.Caption= Druckersetup ' + #13#10 +
      'Label1.Caption=Druckertyp' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Druckerinit Vorlage (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=Druckerinit Vorlage (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=RTF-Export' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      'GroupPageRange.Caption= Seitenbereich ' + #13#10 +
      'AllRB.Caption=Alle' + #13#10 +
      'CurPageRB.Caption=Aktuelle Seite' + #13#10 +
      'PageNumbersRB.Caption=Seiten:' + #13#10 +
      'DescrL.Caption=Seitennummern und/oder Seitenbereiche durch Komma getrennt eingeben, z.B. 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Exporteinstellungen ' + #13#10 +
      'PicturesCB.Caption=Bilder' + #13#10 +
      'PageBreaksCB.Caption=Seitenumbrüche' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenCB.Caption=Nach Export öffnen' + #13#10 +
      'SaveDialog1.Filter=RTF Datei (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Exporteinstellungen' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Abbruch' + #13#10 +
      'GroupPageRange.Caption= Seitenbereich  ' + #13#10 +
      'AllRB.Caption=Alle' + #13#10 +
      'CurPageRB.Caption=Aktuelle Seite' + #13#10 +
      'PageNumbersRB.Caption=Seiten:' + #13#10 +
      'DescrL.Caption=Seitennummern und/oder Seitenbereiche durch Komma getrennt eingeben, z.B. 1,3,5-12' + #13#10 +
      'GroupBox1.Caption= Bildeinstellungen ' + #13#10 +
      'Label2.Caption=JPEG Qualität' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=Seiten beschneiden' + #13#10 +
      'Mono.Caption=Monochrome' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=PDF Export' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      'GroupPageRange.Caption= Seitenbereich ' + #13#10 +
      'AllRB.Caption=Alle' + #13#10 +
      'CurPageRB.Caption=Aktuelle Seite' + #13#10 +
      'PageNumbersRB.Caption=Seiten:' + #13#10 +
      'DescrL.Caption=Seitennummern und/oder Seitenbereiche durch Komma getrennt eingeben, z.B. 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Exporteinstellungen ' + #13#10 +
      'CompressedCB.Caption=Komprimiert' + #13#10 +
      'EmbeddedCB.Caption=Schriften einbetten' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenCB.Caption=Nach Export öffnen' + #13#10 +
      'SaveDialog1.Filter=Adobe PDFdatei (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'RTF Datei');
    Add('BMPexport', 'BMP Bild');
    Add('JPEGexport', 'JPEG Bild');
    Add('TIFFexport', 'TIFF Bild');
    Add('TextExport', 'Text (matrix Drucker)');
    Add('XlsOLEexport', 'Excel Tabelle (OLE)');
    Add('HTMLexport', 'HTML Datei');
    Add('XlsXMLexport', 'Excel Tabelle (XML)');
    Add('PDFexport', 'PDF Datei');

    Add('ProgressWait', 'Bitte warten');
    Add('ProgressRows', 'Bearbeite Zeilen');
    // Gerd Rech (www.iq-s.de)
    Add('ProgressColumns', 'Bearbeite Spalten');
    Add('ProgressStyles', 'Bearbeite Stile');
    Add('ProgressObjects', 'Exportiere Objekte');


    Add('TIFFexportFilter', 'Tiff Bild (*.tif)|*.tif');
    Add('BMPexportFilter', 'BMP Bild (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Jpeg Bild (*.jpg)|*.jpg');

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
