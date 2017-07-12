
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
      'Caption=Eksport do Excel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'GroupPageRange.Caption= Zakres stron ' + #13#10 +
      'AllRB.Caption=Wszystkie' + #13#10 +
      'CurPageRB.Caption=Bie¿¹ca strona' + #13#10 +
      'PageNumbersRB.Caption=Strony:' + #13#10 +
      'DescrL.Caption=Podaj numer strony i/lub zakres stron, oddzielone przecinkami, np.1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Ustawienia eksportu ' + #13#10 +
      'StylesCB.Caption=Style' + #13#10 +
      'PicturesCB.Caption=Obrazy' + #13#10 +
      'MergeCB.Caption=Scalanie komórek' + #13#10 +
      'PageBreaksCB.Caption=Dzielenie na strony' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Otwórz w Excel po eksporcie' + #13#10 +
      'SaveDialog1.Filter=Dokument Excel  (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=Eksport do Excel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'GroupPageRange.Caption= Zakres stron ' + #13#10 +
      'AllRB.Caption=Wszystkie' + #13#10 +
      'CurPageRB.Caption=Bie¿¹ca strona' + #13#10 +
      'PageNumbersRB.Caption=Strony:' + #13#10 +
      'DescrL.Caption=Podaj numer strony i/lub zakres stron, oddzielone przecinkami, np.1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Ustawienia eksportu ' + #13#10 +
      'StylesCB.Caption=Style' + #13#10 +
      'PageBreaksCB.Caption=Dzielenie na strony' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Otwórz w Excel po eksporcie' + #13#10 +
      'SaveDialog1.Filter=Dokument XML Excel (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=Eksport do formatu HTML' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'GroupPageRange.Caption= Zakres stron ' + #13#10 +
      'AllRB.Caption=All' + #13#10 +
      'CurPageRB.Caption=Bie¿¹ca strona' + #13#10 +
      'PageNumbersRB.Caption=Strony:' + #13#10 +
      'DescrL.Caption=Podaj numer strony i/lub zakres stron, oddzielone przecinkami, np.1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Ustawienia eksportu ' + #13#10 +
      'OpenAfterCB.Caption=Otwórz po eksporcie' + #13#10 +
      'StylesCB.Caption=Style' + #13#10 +
      'PicturesCB.Caption=Obrazy' + #13#10 +
      'PicsSameCB.Caption=Wszystko w jednym folderze' + #13#10 +
      'FixWidthCB.Caption=Sta³a szerokoœæ' + #13#10 +
      'NavigatorCB.Caption=Nawigator stron' + #13#10 +
      'MultipageCB.Caption=Wielostronicowoœæ' + #13#10 +
      'MozillaCB.Caption=Przegl¹darka Mozilla' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=Dokument HTML (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Eksport do tekstu (drukarka ig³owa)' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Anuluj' + #13#10 +
      'BtnPreview.Hint=Podgl¹d w³/wy³' + #13#10 +
      'GroupCellProp.Caption= Ustawienia eksportu  ' + #13#10 +
      'CB_PageBreaks.Caption=Dzielenie na strony' + #13#10 +
      'CB_OEM.Caption=Strona kodowa OEM' + #13#10 +
      'CB_EmptyLines.Caption=Puste linie' + #13#10 +
      'CB_LeadSpaces.Caption=Spacje wiod¹ce' + #13#10 +
      'GroupPageRange.Caption= Zakres stron  ' + #13#10 +
      'Pages.Caption=Numery stron' + #13#10 +
      'Descr.Caption=Podaj numer strony i/lub zakres stron, oddzielone przecinkami, np.1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption= Skala ' + #13#10 +
      'ScX.Caption=Skala X' + #13#10 +
      'ScY.Caption=Skala Y' + #13#10 +
      'GroupFramesSettings.Caption= Ramki ' + #13#10 +
      'RB_NoneFrames.Caption=Brak' + #13#10 +
      'RB_Simple.Caption=Zwyk³e' + #13#10 +
      'RB_Graph.Caption=Graficzne' + #13#10 +
      'RB_Graph.Hint=Tylko ze strony kodowej OEM' + #13#10 +
      'CB_PrintAfter.Caption=Drukowanie po eksporcie' + #13#10 +
      'CB_Save.Caption=Zapisz ustawienia' + #13#10 +
      'GroupBox1.Caption= Podgl¹d ' + #13#10 +
      'Label1.Caption=Szerokoœæ:' + #13#10 +
      'Label3.Caption=Wysokoœæ:' + #13#10 +
      'LBPage.Caption=Strona' + #13#10 +
      'ToolButton1.Hint=Powiêkszenie' + #13#10 +
      'ToolButton2.Hint=Pomniejszenie' + #13#10 +
      'SaveDialog1.Filter=Dokument tekstowy (drukarka ig³owa)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Drukowanie' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Anuluj' + #13#10 +
      'GroupBox1.Caption=Drukarka' + #13#10 +
      'Label4.Caption=Nazwa' + #13#10 +
      'PropButton.Caption=Ustawienia...' + #13#10 +
      'GroupBox3.Caption=Kopie' + #13#10 +
      'Label2.Caption=Iloœæ kopii' + #13#10 +
      'GroupBox2.Caption= Ustawienia pocz¹tkowe drukarki ' + #13#10 +
      'Label1.Caption=Typ drukarki' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Przyk³adowa konfiguracja drukarki (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=Przyk³adowa konfiguracja drukarki (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=Eksport do RTF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'GroupPageRange.Caption= Zakres stron ' + #13#10 +
      'AllRB.Caption=Wszystkie' + #13#10 +
      'CurPageRB.Caption=Bie¿¹ca strona' + #13#10 +
      'PageNumbersRB.Caption=Strony:' + #13#10 +
      'DescrL.Caption=Podaj numer strony i/lub zakres stron, oddzielone przecinkami, np.1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Ustawienia eksportu ' + #13#10 +
      'PicturesCB.Caption=Obrazy' + #13#10 +
      'PageBreaksCB.Caption=Dzielenie na strony' + #13#10 +
      'WCB.Caption=tryb WYSIWYG' + #13#10 +
      'OpenCB.Caption=Otwórz po eksporcie' + #13#10 +
      'SaveDialog1.Filter=Dokument RTF (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Ustawienia eksportu' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Anuluj' + #13#10 +
      'GroupPageRange.Caption= Zakres stron  ' + #13#10 +
      'AllRB.Caption=Wszystkie' + #13#10 +
      'CurPageRB.Caption=Bie¿¹ca strona' + #13#10 +
      'PageNumbersRB.Caption=Strony:' + #13#10 +
      'DescrL.Caption=Podaj numer strony i/lub zakres stron, oddzielone przecinkami, np.1,3,5-12' + #13#10 +
      'GroupBox1.Caption= Ustawienia obrazu ' + #13#10 +
      'Label2.Caption=Jakoœæ JPEG' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=Kadrowanie strony' + #13#10 +
      'Mono.Caption=Monochromatyczny' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=Eksport do PDF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'GroupPageRange.Caption= Zakres stron ' + #13#10 +
      'AllRB.Caption=Wszystkie' + #13#10 +
      'CurPageRB.Caption=Bie¿¹ca strona' + #13#10 +
      'PageNumbersRB.Caption=Strony:' + #13#10 +
      'DescrL.Caption=Podaj numer strony i/lub zakres stron, oddzielone przecinkami, np.1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Ustawienia eksportu ' + #13#10 +
      'CompressedCB.Caption=Kompresja' + #13#10 +
      'EmbeddedCB.Caption=Osadzenie czcionek' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenCB.Caption=Otwórz po eksporcie' + #13#10 +
      'SaveDialog1.Filter=Dokument Adobe PDF (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'RTF dokument');
    Add('BMPexport', 'BMP obraz');
    Add('JPEGexport', 'JPEG obraz');
    Add('TIFFexport', 'TIFF obraz');
    Add('TextExport', 'Tekst (drukarka ig³owa)');
    Add('XlsOLEexport', 'Excel skoroszyt (OLE)');
    Add('HTMLexport', 'HTML dokument');
    Add('XlsXMLexport', 'Excel skoroszyt (XML)');
    Add('PDFexport', 'PDF dokument');

    Add('ProgressWait', 'Proszê czekaæ');
    Add('ProgressRows', 'Definiowanie wierszy');
    Add('ProgressColumns', 'Definiowanie kolumn');
    Add('ProgressStyles', 'Definiowanie styli');
    Add('ProgressObjects', 'Eksportowanie obiektów');


    Add('TIFFexportFilter', 'Tiff obraz (*.tif)|*.tif');
    Add('BMPexportFilter', 'BMP obraz (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Jpeg obraz (*.jpg)|*.jpg');

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
