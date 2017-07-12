
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
      'Caption=Exportera till Excel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      'GroupPageRange.Caption= Sidomfattning ' + #13#10 +
      'AllRB.Caption=Alla' + #13#10 +
      'CurPageRB.Caption=Aktuell sida' + #13#10 +
      'PageNumbersRB.Caption=Sidor:' + #13#10 +
      'DescrL.Caption=Skriv in sidnummer och/eller sidintervall avgränsade med kommatecken, t.ex 1,3,5-12.' + #13#10 +
      'GroupQuality.Caption= Exportinställningar ' + #13#10 +
      'StylesCB.Caption=Stil' + #13#10 +
      'PicturesCB.Caption=Bilder' + #13#10 +
      'MergeCB.Caption=Sammafoga celler' + #13#10 +
      'PageBreaksCB.Caption=Sidbrytningar' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Öppna Excel efter export' + #13#10 +
      'SaveDialog1.Filter=Excel fil (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=Exportera till Excel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      'GroupPageRange.Caption= Sidomfattning ' + #13#10 +
      'AllRB.Caption=Alla' + #13#10 +
      'CurPageRB.Caption=Aktuell sida' + #13#10 +
      'PageNumbersRB.Caption=Sidor:' + #13#10 +
      'DescrL.Caption=Skriv in sidnummer och/eller sidintervall avgränsade med kommatecken, t.ex 1,3,5-12.' + #13#10 +
      'GroupQuality.Caption= Exportinställningar ' + #13#10 +
      'StylesCB.Caption=Stil' + #13#10 +
      'PageBreaksCB.Caption=Sidbrytningar' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Öppna Excel efter export' + #13#10 +
      'SaveDialog1.Filter=XML Excel fil (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=Exportera till HTML tabell' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      'GroupPageRange.Caption= Sidomfattning ' + #13#10 +
      'AllRB.Caption=Alla' + #13#10 +
      'CurPageRB.Caption=Aktuell sida' + #13#10 +
      'PageNumbersRB.Caption=Sidor:' + #13#10 +
      'DescrL.Caption=Skriv in sidnummer och/eller sidintervall avgränsade med kommatecken, t.ex 1,3,5-12.' + #13#10 +
      'GroupQuality.Caption= Exportinställningar ' + #13#10 +
      'OpenAfterCB.Caption=Öppna efter export' + #13#10 +
      'StylesCB.Caption=Stil' + #13#10 +
      'PicturesCB.Caption=Bilder' + #13#10 +
      'PicsSameCB.Caption=Alla i en mapp' + #13#10 +
      'FixWidthCB.Caption=Fast bredd' + #13#10 +
      'NavigatorCB.Caption=Sidnavigator' + #13#10 +
      'MultipageCB.Caption=Flera sidor' + #13#10 +
      'MozillaCB.Caption=Mozilla läsare' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=HTML fil (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Exportera till text (matris skrivare)' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Avbryt' + #13#10 +
      'BtnPreview.Hint=Förhandsgranska av/på' + #13#10 +
      'GroupCellProp.Caption= Exportinställningar ' + #13#10 +
      'CB_PageBreaks.Caption=Sidbrytning' + #13#10 +
      'CB_OEM.Caption=Kodsida' + #13#10 +
      'CB_EmptyLines.Caption=Tomma rader' + #13#10 +
      'CB_LeadSpaces.Caption=Inledande mellanslag' + #13#10 +
      'GroupPageRange.Caption= Sidomfattning  ' + #13#10 +
      'Pages.Caption=Sidnummer' + #13#10 +
      'Descr.Caption=Skriv in sidnummer och/eller sidintervall avgränsade med kommatecken, t.ex 1,3,5-12.' + #13#10 +
      'GroupScaleSettings.Caption= Skala ' + #13#10 +
      'ScX.Caption=X Skalning' + #13#10 +
      'ScY.Caption=Y Skalning' + #13#10 +
      'GroupFramesSettings.Caption= Ramar ' + #13#10 +
      'RB_NoneFrames.Caption=Inga' + #13#10 +
      'RB_Simple.Caption=Enkel' + #13#10 +
      'RB_Graph.Caption=Grafik' + #13#10 +
      'RB_Graph.Hint=Bara med kodsida' + #13#10 +
      'CB_PrintAfter.Caption=Skriv ut efter export' + #13#10 +
      'CB_Save.Caption=Spara inställningar' + #13#10 +
      'GroupBox1.Caption= Föhandsgranska ' + #13#10 +
      'Label1.Caption=Bredd:' + #13#10 +
      'Label3.Caption=Höjd:' + #13#10 +
      'LBPage.Caption=Sida' + #13#10 +
      'ToolButton1.Hint=Zooma in' + #13#10 +
      'ToolButton2.Hint=Zooma out' + #13#10 +
      'SaveDialog1.Filter=Text fil (matris skrivare)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Skriv ut' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Avbryt' + #13#10 +
      'GroupBox1.Caption=Skrivare' + #13#10 +
      'Label4.Caption=Namn' + #13#10 +
      'PropButton.Caption=Inställningar...' + #13#10 +
      'GroupBox3.Caption=Kopior' + #13#10 +
      'Label2.Caption=Antal kopior' + #13#10 +
      'GroupBox2.Caption= Skrivare förinställning ' + #13#10 +
      'Label1.Caption=Skrivartyp' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Skrivare förinställningsfil (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=Skrivare förinställningsfil (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=Exportera till RTF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      'GroupPageRange.Caption= Sidomfattning ' + #13#10 +
      'AllRB.Caption=Alla' + #13#10 +
      'CurPageRB.Caption=Aktuell sida' + #13#10 +
      'PageNumbersRB.Caption=Sidor:' + #13#10 +
      'DescrL.Caption=Skriv in sidnummer och/eller sidintervall avgränsade med kommatecken, t.ex 1,3,5-12.' + #13#10 +
      'GroupQuality.Caption= Exportinställningar ' + #13#10 +
      'PicturesCB.Caption=Bilder' + #13#10 +
      'PageBreaksCB.Caption=Sidbrytningar' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenCB.Caption=Öppna efter export' + #13#10 +
      'SaveDialog1.Filter=RTF fil (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Export Settings' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Cancel' + #13#10 +
      'GroupPageRange.Caption= Page range  ' + #13#10 +
      'AllRB.Caption=All' + #13#10 +
      'CurPageRB.Caption=Current page' + #13#10 +
      'PageNumbersRB.Caption=Pages:' + #13#10 +
      'DescrL.Caption=Enter page numbers and/or page ranges, separated by commas. For example, 1,3,5-12' + #13#10 +
      'GroupBox1.Caption= Image settings ' + #13#10 +
      'Label2.Caption=JPEG quality' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=Crop pages' + #13#10 +
      'Mono.Caption=Monochrome' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=Exportera till PDF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      'GroupPageRange.Caption= Sidomfattning ' + #13#10 +
      'AllRB.Caption=Alla' + #13#10 +
      'CurPageRB.Caption=Aktuell sida' + #13#10 +
      'PageNumbersRB.Caption=Sidor:' + #13#10 +
      'DescrL.Caption=Skriv in sidnummer och/eller sidintervall avgränsade med kommatecken, t.ex 1,3,5-12.' + #13#10 +
      'GroupQuality.Caption= Exportinställingar ' + #13#10 +
      'CompressedCB.Caption=Komprimerad' + #13#10 +
      'EmbeddedCB.Caption=Inkludera fonter' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenCB.Caption=Öppna efter export' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'SaveDialog1.Filter=Adobe PDF fil (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'RTF fil');
    Add('BMPexport', 'BMP bild');
    Add('JPEGexport', 'JPEG bild');
    Add('TIFFexport', 'TIFF bild');
    Add('TextExport', 'Text (matris skrivarer)');
    Add('XlsOLEexport', 'Excel tabell (OLE)');
    Add('HTMLexport', 'HTML fil');
    Add('XlsXMLexport', 'Excel tabell (XML)');
    Add('PDFexport', 'PDF fil');

    Add('ProgressWait', 'Var vänlig vänta');
    Add('ProgressRows', 'Sätter up rader');
    Add('ProgressColumns', 'Sätter upp kolumner');
    Add('ProgressStyles', 'Sätter upp stil');
    Add('ProgressObjects', 'Exporterar objekt');


    Add('TIFFexportFilter', 'Tiff bild (*.tif)|*.tif');
    Add('BMPexportFilter', 'BMP bild (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Jpeg bild (*.jpg)|*.jpg');

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
