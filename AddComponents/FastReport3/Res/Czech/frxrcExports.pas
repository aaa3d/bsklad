
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
      'Caption=Export do Excelu' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      'GroupPageRange.Caption= Rozsah str�nek ' + #13#10 +
      'AllRB.Caption=V�e' + #13#10 +
      'CurPageRB.Caption=Aktu�ln� str�nku' + #13#10 +
      'PageNumbersRB.Caption=Str�nky:' + #13#10 +
      'DescrL.Caption=Zadejte ��sla str�nek a/nebo rozsah str�nek, odd�len�ch ��rkami. Nap�.: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Nastaven� exportu ' + #13#10 +
      'StylesCB.Caption=Styly' + #13#10 +
      'PicturesCB.Caption=Obr�zky' + #13#10 +
      'PageBreaksCB.Caption=Odd�lova�e str�nek' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'MergeCB.Caption=P�ipojit bu�ky' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Po exportu otev��t Excel' + #13#10 +
      'SaveDialog1.Filter=Soubor Excelu (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=Export do Excelu' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      'GroupPageRange.Caption= Rozsah str�nek ' + #13#10 +
      'AllRB.Caption=V�e' + #13#10 +
      'CurPageRB.Caption=Aktu�ln� str�nku' + #13#10 +
      'PageNumbersRB.Caption=Str�nky:' + #13#10 +
      'DescrL.Caption=Zadejte ��sla str�nek a/nebo rozsah str�nek, odd�len�ch ��rkami. Nap�.: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Nastaven� exportu ' + #13#10 +
      'StylesCB.Caption=Styly' + #13#10 +
      'PageBreaksCB.Caption=Odd�lova�e str�nek' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Po exportu otev��t Excel' + #13#10 +
      'SaveDialog1.Filter=XML Soubor Excelu (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=Export do HTML tabulky' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      'GroupPageRange.Caption= Rozsah str�nek ' + #13#10 +
      'AllRB.Caption=V�e' + #13#10 +
      'CurPageRB.Caption=Aktu�ln� str�nku' + #13#10 +
      'PageNumbersRB.Caption=Str�nky:' + #13#10 +
      'DescrL.Caption=Zadejte ��sla str�nek a/nebo rozsah str�nek, odd�len�ch ��rkami. Nap�.: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Nastaven� exportu ' + #13#10 +
      'OpenAfterCB.Caption=Po exportu otev��t' + #13#10 +
      'StylesCB.Caption=Styly' + #13#10 +
      'PicturesCB.Caption=Obr�zky' + #13#10 +
      'PicsSameCB.Caption=V�e v jednom adres��i' + #13#10 +
      'FixWidthCB.Caption=Pevn� ���ka' + #13#10 +
      'NavigatorCB.Caption=Navig�tor str�nky' + #13#10 +
      'MultipageCB.Caption=Multistr�nka' + #13#10 +
      'MozillaCB.Caption=Prohl�e� Mozilla' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=HTML soubor (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Export do textu (jehli�kov� tisk�rna)' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Zru�it' + #13#10 +
      'BtnPreview.Hint=P�edtisk zap/vyp' + #13#10 +
      'GroupCellProp.Caption= Vlastnosti exportu  ' + #13#10 +
      'CB_PageBreaks.Caption=Odd�lova�e str�nek' + #13#10 +
      'CB_OEM.Caption=OEM codepage' + #13#10 +
      'CB_EmptyLines.Caption=Pr�zdn� ��dky' + #13#10 +
      'CB_LeadSpaces.Caption=�vodn� mezery' + #13#10 +
      'GroupPageRange.Caption= Rozsah str�nek  ' + #13#10 +
      'Pages.Caption=Po�et str�nek' + #13#10 +
      'Descr.Caption=Zadejte ��sla str�nek a/nebo rozsah str�nek, odd�len�ch ��rkami. Nap�.: 1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption= Zv�t�en� ' + #13#10 +
      'ScX.Caption=Rozm�r X' + #13#10 +
      'ScY.Caption=Rozm�r Y' + #13#10 +
      'GroupFramesSettings.Caption= R�me�ky ' + #13#10 +
      'RB_NoneFrames.Caption=��dn�' + #13#10 +
      'RB_Simple.Caption=Jednoduch�' + #13#10 +
      'RB_Graph.Caption=Grafick�' + #13#10 +
      'RB_Graph.Hint=Pouze s OEM codepage' + #13#10 +
      'CB_PrintAfter.Caption=Po exportu vytisknout' + #13#10 +
      'CB_Save.Caption=Ulo�it nastaven�' + #13#10 +
      'GroupBox1.Caption= P�edtisk ' + #13#10 +
      'Label1.Caption=���ka:' + #13#10 +
      'Label3.Caption=V��ka:' + #13#10 +
      'LBPage.Caption=Str�nka' + #13#10 +
      'ToolButton1.Hint=Zv�t�it' + #13#10 +
      'ToolButton2.Hint=Zmen�it' + #13#10 +
      'SaveDialog1.Filter=Soubor textu (jehli�k. tisk�rna)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Print' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Zru�it' + #13#10 +
      'GroupBox1.Caption=Tisk�rna' + #13#10 +
      'Label4.Caption=Name' + #13#10 +
      'PropButton.Caption=Nastaven�...' + #13#10 +
      'GroupBox3.Caption=Kopie' + #13#10 +
      'Label2.Caption=Po�et kopi�' + #13#10 +
      'GroupBox2.Caption= Z�kl. nastaven� tisk�rny ' + #13#10 +
      'Label1.Caption=Typ tisk�rny' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=�ablona inic. tisk�rny (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=�ablona inic. tisk�rny (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=Export to RTF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      'GroupPageRange.Caption= Rozsah str�nek ' + #13#10 +
      'AllRB.Caption=V�e' + #13#10 +
      'CurPageRB.Caption=Aktu�ln� str�nku' + #13#10 +
      'PageNumbersRB.Caption=Str�nky:' + #13#10 +
      'DescrL.Caption=Zadejte ��sla str�nek a/nebo rozsah str�nek, odd�len�ch ��rkami. Nap�.: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Nastaven� exportu ' + #13#10 +
      'PicturesCB.Caption=Obr�zky' + #13#10 +
      'PageBreaksCB.Caption=Odd�lova�e str�nek' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenCB.Caption=Po exportu otev��t' + #13#10 +
      'SaveDialog1.Filter=Soubor RTF (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Nastaven� exportu' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Zru�it' + #13#10 +
      'GroupPageRange.Caption= Rozsah str�nek  ' + #13#10 +
      'AllRB.Caption=V�e' + #13#10 +
      'CurPageRB.Caption=Aktu�ln� str�nku' + #13#10 +
      'PageNumbersRB.Caption=Str�nky:' + #13#10 +
      'DescrL.Caption=Zadejte ��sla str�nek a/nebo rozsah str�nek, odd�len�ch ��rkami. Nap�.: 1,3,5-12' + #13#10 +
      'GroupBox1.Caption= Nastaven� obr�zku ' + #13#10 +
      'Label2.Caption=Kvalita JPEG' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=O��znut� str�nek' + #13#10 +
      'Mono.Caption=�ernob�le' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=Export do PDF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      'GroupPageRange.Caption= Rozsah str�nek ' + #13#10 +
      'AllRB.Caption=V�e' + #13#10 +
      'CurPageRB.Caption=Aktu�ln� str�nku' + #13#10 +
      'PageNumbersRB.Caption=Str�nky:' + #13#10 +
      'DescrL.Caption=Zadejte ��sla str�nek a/nebo rozsah str�nek, odd�len�ch ��rkami. Nap�.: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Nastaven� exportu ' + #13#10 +
      'CompressedCB.Caption=Komprimov�no' + #13#10 +
      'EmbeddedCB.Caption=Vestav�n� p�sma' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenCB.Caption=Po exportu otev��t' + #13#10 +
      'SaveDialog1.Filter=Soubor Adobe PDF (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'Soubor RTF');
    Add('BMPexport', 'Obr�zek BMP');
    Add('JPEGexport', 'Obr�zek JPEG');
    Add('TIFFexport', 'Obr�zek TIFF');
    Add('TextExport', 'Text (jehl. tisk�rna)');
    Add('XlsOLEexport', 'Tabulka Excel (OLE)');
    Add('HTMLexport', 'Soubor HTML');
    Add('XlsXMLexport', 'Tabulka Excel (XML)');
    Add('PDFexport', 'Soubor PDF');

    Add('ProgressWait', 'Pros�m �ekejte');
    Add('ProgressRows', 'Nastavov�n� ��dk�');
    Add('ProgressColumns', 'Nastavov�n� sloupc�');
    Add('ProgressStyles', 'Nastavov�n� styl�');
    Add('ProgressObjects', 'Exportov�n� objekt�');


    Add('TIFFexportFilter', 'Obr�zek Tiff (*.tif)|*.tif');
    Add('BMPexportFilter', 'Obr�zek BMP (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Obr�zek Jpeg (*.jpg)|*.jpg');

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
