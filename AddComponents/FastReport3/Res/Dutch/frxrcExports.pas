
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
      'Caption=Exporteren naar Excel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      'GroupPageRange.Caption= Pagina bereik ' + #13#10 +
      'AllRB.Caption=Alles' + #13#10 +
      'CurPageRB.Caption=Huidige pagina' + #13#10 +
      'PageNumbersRB.Caption=Pagina''s:' + #13#10 +
      'DescrL.Caption=Vul paginanummers en/of pagina ranges in, gescheiden door komma''s. Bijvoorbeeld: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Exporteer instellingen ' + #13#10 +
      'StylesCB.Caption=Stijlen' + #13#10 +
      'PicturesCB.Caption=Afbeeldingen' + #13#10 +
      'MergeCB.Caption=Cellen samenvoegen' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'PageBreaksCB.Caption=Page breaks' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenExcelCB.Caption=Na het exporteren Excel starten' + #13#10 +
      'SaveDialog1.Filter=Excel bestand (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=Exporteren naar Excel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      'GroupPageRange.Caption= Pagina bereik ' + #13#10 +
      'AllRB.Caption=Alles' + #13#10 +
      'CurPageRB.Caption=Huidige pagina' + #13#10 +
      'PageNumbersRB.Caption=Pagina''s:' + #13#10 +
      'DescrL.Caption=Vul paginanummers en/of pagina ranges in, gescheiden door komma''s. Bijvoorbeeld: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Exporteer instellingen ' + #13#10 +
      'StylesCB.Caption=Stijlen' + #13#10 +
      'PageBreaksCB.Caption=Page breaks' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Na het exporteren Excel starten' + #13#10 +
      'SaveDialog1.Filter=XML Excel bestand (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=Exporteren naar HTML table' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      'GroupPageRange.Caption= Pagina bereik ' + #13#10 +
      'AllRB.Caption=Alles' + #13#10 +
      'CurPageRB.Caption=Huidige pagina' + #13#10 +
      'PageNumbersRB.Caption=Pagina''s:' + #13#10 +
      'DescrL.Caption=Vul paginanummers en/of pagina ranges in, gescheiden door komma''s. Bijvoorbeeld: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Exporteer instellingen ' + #13#10 +
      'OpenAfterCB.Caption=Openen na het exporteren' + #13#10 +
      'StylesCB.Caption=Stijlen' + #13#10 +
      'PicturesCB.Caption=Afbeeldingen' + #13#10 +
      'PicsSameCB.Caption=Alles in een folder' + #13#10 +
      'FixWidthCB.Caption=Vaste breedte' + #13#10 +
      'NavigatorCB.Caption=Pagina navigator' + #13#10 +
      'MultipageCB.Caption=Meerdere pagina''s' + #13#10 +
      'MozillaCB.Caption=Mozilla browser' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=HTML bestand (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Exporteren naar text (dot-matrix printer)' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Annuleren' + #13#10 +
      'BtnPreview.Hint=Voorbeeld aan/uit' + #13#10 +
      'GroupCellProp.Caption= Export eigenschappen  ' + #13#10 +
      'CB_PageBreaks.Caption=Pagina scheidingen' + #13#10 +
      'CB_OEM.Caption=OEM codepage' + #13#10 +
      'CB_EmptyLines.Caption=Blanko regels' + #13#10 +
      'CB_LeadSpaces.Caption=Voorafgaande spaties' + #13#10 +
      'GroupPageRange.Caption= Pagina bereik  ' + #13#10 +
      'Pages.Caption=Paginanummers' + #13#10 +
      'Descr.Caption=Vul paginanummers en/of pagina ranges in, gescheiden door komma''s. Bijvoorbeeld: 1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption= Schaal ' + #13#10 +
      'ScX.Caption=X as' + #13#10 +
      'ScY.Caption=Y as' + #13#10 +
      'GroupFramesSettings.Caption= Frames ' + #13#10 +
      'RB_NoneFrames.Caption=Geen' + #13#10 +
      'RB_Simple.Caption=Eenvoudig' + #13#10 +
      'RB_Graph.Caption=Grafisch' + #13#10 +
      'RB_Graph.Hint=Uitsluitend met OEM codepage' + #13#10 +
      'CB_PrintAfter.Caption=Afdrukken na het exporteren' + #13#10 +
      'CB_Save.Caption=Instellingen opslaan' + #13#10 +
      'GroupBox1.Caption= Voorbeeld ' + #13#10 +
      'Label1.Caption=Breedte:' + #13#10 +
      'Label3.Caption=Hoogte:' + #13#10 +
      'LBPage.Caption=Pagina' + #13#10 +
      'ToolButton1.Hint=Inzoomen' + #13#10 +
      'ToolButton2.Hint=Uitzoomen' + #13#10 +
      'SaveDialog1.Filter=Tekst bestand (dot-matrix printer)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Print' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Annuleren' + #13#10 +
      'GroupBox1.Caption=Printer' + #13#10 +
      'Label4.Caption=Name' + #13#10 +
      'PropButton.Caption=Setup...' + #13#10 +
      'GroupBox3.Caption=Kopieën' + #13#10 +
      'Label2.Caption=Aantal kopieën' + #13#10 +
      'GroupBox2.Caption= Printer initialisatie setup ' + #13#10 +
      'Label1.Caption=Printer type' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Printer init template (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=Printer init template (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=Exporteren naar RTF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      'GroupPageRange.Caption= Pagina bereik ' + #13#10 +
      'AllRB.Caption=Alles' + #13#10 +
      'CurPageRB.Caption=Huidige pagina' + #13#10 +
      'PageNumbersRB.Caption=Pagina''s:' + #13#10 +
      'DescrL.Caption=Vul paginanummers en/of pagina ranges in, gescheiden door komma''s. Bijvoorbeeld: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Export instellingen ' + #13#10 +
      'PicturesCB.Caption=Afbeeldingen' + #13#10 +
      'PageBreaksCB.Caption=Pagina scheidingen' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenCB.Caption=Openen na export' + #13#10 +
      'SaveDialog1.Filter=RTF bestand (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Exporteer instellingen' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Annuleren' + #13#10 +
      'GroupPageRange.Caption= Pagina bereik  ' + #13#10 +
      'AllRB.Caption=Alles' + #13#10 +
      'CurPageRB.Caption=Huidige pagina' + #13#10 +
      'PageNumbersRB.Caption=Pagina''s:' + #13#10 +
      'DescrL.Caption=Vul paginanummers en/of pagina ranges in, gescheiden door komma''s. Bijvoorbeeld: 1,3,5-12' + #13#10 +
      'GroupBox1.Caption= Afbeeldingsinstellingen ' + #13#10 +
      'Label2.Caption=JPEG kwaliteit' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=Pagina''s bijsnijden' + #13#10 +
      'Mono.Caption=Monochrome' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=Exporteren naar PDF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      'GroupPageRange.Caption= Pagina bereik ' + #13#10 +
      'AllRB.Caption=Alles' + #13#10 +
      'CurPageRB.Caption=Huidige pagina' + #13#10 +
      'PageNumbersRB.Caption=Pagina''s:' + #13#10 +
      'DescrL.Caption=Vul paginanummers en/of pagina ranges in, gescheiden door komma''s. Bijvoorbeeld: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Exporteer instellingen ' + #13#10 +
      'CompressedCB.Caption=Gecomprimeerd' + #13#10 +
      'EmbeddedCB.Caption=Ingesloten lettertypen' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenCB.Caption=Openen na export' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'SaveDialog1.Filter=Adobe PDF bestand (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'RTF bestand');
    Add('BMPexport', 'BMP afbeelding');
    Add('JPEGexport', 'JPEG afbeelding');
    Add('TIFFexport', 'TIFF afbeelding');
    Add('TextExport', 'Text (matrix printer)');
    Add('XlsOLEexport', 'Excel tabel (OLE)');
    Add('HTMLexport', 'HTML bestand');
    Add('XlsXMLexport', 'Excel tabel (XML)');
    Add('PDFexport', 'PDF bestand');

    Add('ProgressWait', 'Wacht s.v.p.');
    Add('ProgressRows', 'Rijen worden aangemaakt');
    Add('ProgressColumns', 'Kolommen worden aangemaakt');
    Add('ProgressStyles', 'Stijlen worden aangemaakt');
    Add('ProgressObjects', 'Objecten worden geexporteerd');


    Add('TIFFexportFilter', 'Tiff afbeelding (*.tif)|*.tif');
    Add('BMPexportFilter', 'BMP afbeelding (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Jpeg afbeelding (*.jpg)|*.jpg');

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
