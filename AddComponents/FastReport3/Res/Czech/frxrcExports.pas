
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
      'CancelB.Caption=Zrušit' + #13#10 +
      'GroupPageRange.Caption= Rozsah stránek ' + #13#10 +
      'AllRB.Caption=Vše' + #13#10 +
      'CurPageRB.Caption=Aktuální stránku' + #13#10 +
      'PageNumbersRB.Caption=Stránky:' + #13#10 +
      'DescrL.Caption=Zadejte èísla stránek a/nebo rozsah stránek, oddìlených èárkami. Napø.: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Nastavení exportu ' + #13#10 +
      'StylesCB.Caption=Styly' + #13#10 +
      'PicturesCB.Caption=Obrázky' + #13#10 +
      'PageBreaksCB.Caption=Oddìlovaèe stránek' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'MergeCB.Caption=Pøipojit buòky' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Po exportu otevøít Excel' + #13#10 +
      'SaveDialog1.Filter=Soubor Excelu (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=Export do Excelu' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      'GroupPageRange.Caption= Rozsah stránek ' + #13#10 +
      'AllRB.Caption=Vše' + #13#10 +
      'CurPageRB.Caption=Aktuální stránku' + #13#10 +
      'PageNumbersRB.Caption=Stránky:' + #13#10 +
      'DescrL.Caption=Zadejte èísla stránek a/nebo rozsah stránek, oddìlených èárkami. Napø.: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Nastavení exportu ' + #13#10 +
      'StylesCB.Caption=Styly' + #13#10 +
      'PageBreaksCB.Caption=Oddìlovaèe stránek' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Po exportu otevøít Excel' + #13#10 +
      'SaveDialog1.Filter=XML Soubor Excelu (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=Export do HTML tabulky' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      'GroupPageRange.Caption= Rozsah stránek ' + #13#10 +
      'AllRB.Caption=Vše' + #13#10 +
      'CurPageRB.Caption=Aktuální stránku' + #13#10 +
      'PageNumbersRB.Caption=Stránky:' + #13#10 +
      'DescrL.Caption=Zadejte èísla stránek a/nebo rozsah stránek, oddìlených èárkami. Napø.: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Nastavení exportu ' + #13#10 +
      'OpenAfterCB.Caption=Po exportu otevøít' + #13#10 +
      'StylesCB.Caption=Styly' + #13#10 +
      'PicturesCB.Caption=Obrázky' + #13#10 +
      'PicsSameCB.Caption=Vše v jednom adresáøi' + #13#10 +
      'FixWidthCB.Caption=Pevná šíøka' + #13#10 +
      'NavigatorCB.Caption=Navigátor stránky' + #13#10 +
      'MultipageCB.Caption=Multistránka' + #13#10 +
      'MozillaCB.Caption=Prohlížeè Mozilla' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=HTML soubor (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Export do textu (jehlièková tiskárna)' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Zrušit' + #13#10 +
      'BtnPreview.Hint=Pøedtisk zap/vyp' + #13#10 +
      'GroupCellProp.Caption= Vlastnosti exportu  ' + #13#10 +
      'CB_PageBreaks.Caption=Oddìlovaèe stránek' + #13#10 +
      'CB_OEM.Caption=OEM codepage' + #13#10 +
      'CB_EmptyLines.Caption=Prázdné øádky' + #13#10 +
      'CB_LeadSpaces.Caption=Úvodní mezery' + #13#10 +
      'GroupPageRange.Caption= Rozsah stránek  ' + #13#10 +
      'Pages.Caption=Poèet stránek' + #13#10 +
      'Descr.Caption=Zadejte èísla stránek a/nebo rozsah stránek, oddìlených èárkami. Napø.: 1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption= Zvìtšení ' + #13#10 +
      'ScX.Caption=Rozmìr X' + #13#10 +
      'ScY.Caption=Rozmìr Y' + #13#10 +
      'GroupFramesSettings.Caption= Rámeèky ' + #13#10 +
      'RB_NoneFrames.Caption=Žádný' + #13#10 +
      'RB_Simple.Caption=Jednoduchý' + #13#10 +
      'RB_Graph.Caption=Grafický' + #13#10 +
      'RB_Graph.Hint=Pouze s OEM codepage' + #13#10 +
      'CB_PrintAfter.Caption=Po exportu vytisknout' + #13#10 +
      'CB_Save.Caption=Uložit nastavení' + #13#10 +
      'GroupBox1.Caption= Pøedtisk ' + #13#10 +
      'Label1.Caption=Šíøka:' + #13#10 +
      'Label3.Caption=Výška:' + #13#10 +
      'LBPage.Caption=Stránka' + #13#10 +
      'ToolButton1.Hint=Zvìtšit' + #13#10 +
      'ToolButton2.Hint=Zmenšit' + #13#10 +
      'SaveDialog1.Filter=Soubor textu (jehlièk. tiskárna)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Print' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Zrušit' + #13#10 +
      'GroupBox1.Caption=Tiskárna' + #13#10 +
      'Label4.Caption=Name' + #13#10 +
      'PropButton.Caption=Nastavení...' + #13#10 +
      'GroupBox3.Caption=Kopie' + #13#10 +
      'Label2.Caption=Poèet kopií' + #13#10 +
      'GroupBox2.Caption= Zákl. nastavení tiskárny ' + #13#10 +
      'Label1.Caption=Typ tiskárny' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Šablona inic. tiskárny (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=Šablona inic. tiskárny (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=Export to RTF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      'GroupPageRange.Caption= Rozsah stránek ' + #13#10 +
      'AllRB.Caption=Vše' + #13#10 +
      'CurPageRB.Caption=Aktuální stránku' + #13#10 +
      'PageNumbersRB.Caption=Stránky:' + #13#10 +
      'DescrL.Caption=Zadejte èísla stránek a/nebo rozsah stránek, oddìlených èárkami. Napø.: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Nastavení exportu ' + #13#10 +
      'PicturesCB.Caption=Obrázky' + #13#10 +
      'PageBreaksCB.Caption=Oddìlovaèe stránek' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenCB.Caption=Po exportu otevøít' + #13#10 +
      'SaveDialog1.Filter=Soubor RTF (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Nastavení exportu' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Zrušit' + #13#10 +
      'GroupPageRange.Caption= Rozsah stránek  ' + #13#10 +
      'AllRB.Caption=Vše' + #13#10 +
      'CurPageRB.Caption=Aktuální stránku' + #13#10 +
      'PageNumbersRB.Caption=Stránky:' + #13#10 +
      'DescrL.Caption=Zadejte èísla stránek a/nebo rozsah stránek, oddìlených èárkami. Napø.: 1,3,5-12' + #13#10 +
      'GroupBox1.Caption= Nastavení obrázku ' + #13#10 +
      'Label2.Caption=Kvalita JPEG' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=Oøíznutí stránek' + #13#10 +
      'Mono.Caption=Èernobíle' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=Export do PDF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      'GroupPageRange.Caption= Rozsah stránek ' + #13#10 +
      'AllRB.Caption=Vše' + #13#10 +
      'CurPageRB.Caption=Aktuální stránku' + #13#10 +
      'PageNumbersRB.Caption=Stránky:' + #13#10 +
      'DescrL.Caption=Zadejte èísla stránek a/nebo rozsah stránek, oddìlených èárkami. Napø.: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Nastavení exportu ' + #13#10 +
      'CompressedCB.Caption=Komprimováno' + #13#10 +
      'EmbeddedCB.Caption=Vestavìná písma' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenCB.Caption=Po exportu otevøít' + #13#10 +
      'SaveDialog1.Filter=Soubor Adobe PDF (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'Soubor RTF');
    Add('BMPexport', 'Obrázek BMP');
    Add('JPEGexport', 'Obrázek JPEG');
    Add('TIFFexport', 'Obrázek TIFF');
    Add('TextExport', 'Text (jehl. tiskárna)');
    Add('XlsOLEexport', 'Tabulka Excel (OLE)');
    Add('HTMLexport', 'Soubor HTML');
    Add('XlsXMLexport', 'Tabulka Excel (XML)');
    Add('PDFexport', 'Soubor PDF');

    Add('ProgressWait', 'Prosím èekejte');
    Add('ProgressRows', 'Nastavování øádkù');
    Add('ProgressColumns', 'Nastavování sloupcù');
    Add('ProgressStyles', 'Nastavování stylù');
    Add('ProgressObjects', 'Exportování objektù');


    Add('TIFFexportFilter', 'Obrázek Tiff (*.tif)|*.tif');
    Add('BMPexportFilter', 'Obrázek BMP (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Obrázek Jpeg (*.jpg)|*.jpg');

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
