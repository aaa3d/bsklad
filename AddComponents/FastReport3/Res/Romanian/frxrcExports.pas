
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
{    Romanian resource                     }
{    Translated by: Sorin Pohontu          }
{    www.frontline.ro                      }
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
      'Caption=Export in format Excel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      'GroupPageRange.Caption= Interval pagini ' + #13#10 +
      'AllRB.Caption=Toate' + #13#10 +
      'CurPageRB.Caption=Pagina curenta' + #13#10 +
      'PageNumbersRB.Caption=Pagini:' + #13#10 +
      'DescrL.Caption=Introduceti numarul de pagini si/sau intervalul de pagini, separate de virgula. De exemplu: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Setari export ' + #13#10 +
      'StylesCB.Caption=Stiluri' + #13#10 +
      'PicturesCB.Caption=Imagini' + #13#10 +
      'MergeCB.Caption=Unire celule' + #13#10 +
      'PageBreaksCB.Caption=Despartire pagini' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Lanseaza Excel dupa export' + #13#10 +
      'SaveDialog1.Filter=Fisiere Excel (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=Export in format Excel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      'GroupPageRange.Caption= Interval pagini ' + #13#10 +
      'AllRB.Caption=Toate' + #13#10 +
      'CurPageRB.Caption=Pagina curenta' + #13#10 +
      'PageNumbersRB.Caption=Pagini:' + #13#10 +
      'DescrL.Caption=Introduceti numarul de pagini si/sau intervalul de pagini, separate de virgula. De exemplu: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Setari export ' + #13#10 +
      'StylesCB.Caption=Stiluri' + #13#10 +
      'PageBreaksCB.Caption=Despartire pagini' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Lanseaza Excel dupa export' + #13#10 +
      'SaveDialog1.Filter=Fisiere XML Excel (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=Export in tabel HTML' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      'GroupPageRange.Caption= Interval pagini ' + #13#10 +
      'AllRB.Caption=Toate' + #13#10 +
      'CurPageRB.Caption=Pagina curenta' + #13#10 +
      'PageNumbersRB.Caption=Pagini:' + #13#10 +
      'DescrL.Caption=Introduceti numarul de pagini si/sau intervalul de pagini, separate de virgula. De exemplu: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Setari export ' + #13#10 +
      'OpenAfterCB.Caption=Deschide dupa export' + #13#10 +
      'StylesCB.Caption=Stiluri' + #13#10 +
      'PicturesCB.Caption=Imagini' + #13#10 +
      'PicsSameCB.Caption=Toate intr-un singur director' + #13#10 +
      'FixWidthCB.Caption=Latime fixa' + #13#10 +
      'NavigatorCB.Caption=Navigator pagini' + #13#10 +
      'MultipageCB.Caption=Multi-pagina' + #13#10 +
      'MozillaCB.Caption=Browser Mozilla' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=Fisier HTML (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Export in fiser text (imprimanta matriceala)' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Anuleaza' + #13#10 +
      'BtnPreview.Hint=Previzualizare da/nu' + #13#10 +
      'GroupCellProp.Caption= Setari export  ' + #13#10 +
      'CB_PageBreaks.Caption=Despartire pagini' + #13#10 +
      'CB_OEM.Caption=Pagina cod OEM' + #13#10 +
      'CB_EmptyLines.Caption=Linii goale' + #13#10 +
      'CB_LeadSpaces.Caption=Spatii de inceput' + #13#10 +
      'GroupPageRange.Caption= Interval pagini  ' + #13#10 +
      'Pages.Caption=Numar pagini' + #13#10 +
      'Descr.Caption=Introduceti numarul de pagini si/sau intervalul de pagini, separate de virgula. De exemplu: 1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption= Scalare ' + #13#10 +
      'ScX.Caption=Scala X' + #13#10 +
      'ScY.Caption=Scala Y' + #13#10 +
      'GroupFramesSettings.Caption= Cadru ' + #13#10 +
      'RB_NoneFrames.Caption=Fara' + #13#10 +
      'RB_Simple.Caption=Simplu' + #13#10 +
      'RB_Graph.Caption=Grafic' + #13#10 +
      'RB_Graph.Hint=Doar cu pagina de cod OEM' + #13#10 +
      'CB_PrintAfter.Caption=Listare dupa export' + #13#10 +
      'CB_Save.Caption=Setari salvare' + #13#10 +
      'GroupBox1.Caption= Previzualizare ' + #13#10 +
      'Label1.Caption=Latime:' + #13#10 +
      'Label3.Caption=Inaltime:' + #13#10 +
      'LBPage.Caption=Pagina' + #13#10 +
      'ToolButton1.Hint=Marire' + #13#10 +
      'ToolButton2.Hint=Micsorare' + #13#10 +
      'SaveDialog1.Filter=Fisier text (imprimanta matriceala)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Print' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Anuleaza' + #13#10 +
      'GroupBox1.Caption=Imprimanta' + #13#10 +
      'Label4.Caption=Nume' + #13#10 +
      'PropButton.Caption=Setari...' + #13#10 +
      'GroupBox3.Caption=Copii' + #13#10 +
      'Label2.Caption=Numar copii' + #13#10 +
      'GroupBox2.Caption= Initializare imprimanta ' + #13#10 +
      'Label1.Caption=Tip imprimanta' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Sablon initializare imprimanta (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=Sablon initializare imprimanta (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=Export in format RTF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      'GroupPageRange.Caption= Interval pagini ' + #13#10 +
      'AllRB.Caption=Toate' + #13#10 +
      'CurPageRB.Caption=Pagina curenta' + #13#10 +
      'PageNumbersRB.Caption=Pagini:' + #13#10 +
      'DescrL.Caption=Introduceti numarul de pagini si/sau intervalul de pagini, separate de virgula. De exemplu: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Setari export ' + #13#10 +
      'PicturesCB.Caption=Imagini' + #13#10 +
      'PageBreaksCB.Caption=Despartire pagini' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenCB.Caption=Deschide dupa export' + #13#10 +
      'SaveDialog1.Filter=Fisier RTF (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Setari export' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Anuleaza' + #13#10 +
      'GroupPageRange.Caption= Interval pagini  ' + #13#10 +
      'AllRB.Caption=Toate' + #13#10 +
      'CurPageRB.Caption=Pagina curenta' + #13#10 +
      'PageNumbersRB.Caption=Pagini:' + #13#10 +
      'DescrL.Caption=Introduceti numarul de pagini si/sau intervalul de pagini, separate de virgula. De exemplu: 1,3,5-12' + #13#10 +
      'GroupBox1.Caption= Setari imagine ' + #13#10 +
      'Label2.Caption=Calitate JPEG' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=Optimizeaza paginile' + #13#10 +
      'Mono.Caption=Monocrom' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=Export in format PDF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      'GroupPageRange.Caption= Interval pagini ' + #13#10 +
      'AllRB.Caption=Toate' + #13#10 +
      'CurPageRB.Caption=Pagina curenta' + #13#10 +
      'PageNumbersRB.Caption=Pagini:' + #13#10 +
      'DescrL.Caption=Introduceti numarul de pagini si/sau intervalul de pagini, separate de virgula. De exemplu: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Setari export ' + #13#10 +
      'CompressedCB.Caption=Compresat' + #13#10 +
      'EmbeddedCB.Caption=Include fonturi' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenCB.Caption=Deschide dupa export' + #13#10 +
      'SaveDialog1.Filter=Fisier Adobe PDF (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'Fisier RTF');
    Add('BMPexport', 'Imagine BMP');
    Add('JPEGexport', 'Imagine JPEG');
    Add('TIFFexport', 'Imagine TIFF');
    Add('TextExport', 'Text (imprimanta matriciala)');
    Add('XlsOLEexport', 'Tabel Excel (OLE)');
    Add('HTMLexport', 'Fisier HTML');
    Add('XlsXMLexport', 'Tabel Excel (XML)');
    Add('PDFexport', 'Fisier PDF');

    Add('ProgressWait', 'Va rog asteptati');
    Add('ProgressRows', 'Setare randuri');
    Add('ProgressColumns', 'Setare coloane');
    Add('ProgressStyles', 'Setare stiluri');
    Add('ProgressObjects', 'Exportare obiecte');

    Add('TIFFexportFilter', 'Imagine Tiff (*.tif)|*.tif');
    Add('BMPexportFilter', 'Imagine BMP (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Imagine Jpeg (*.jpg)|*.jpg');

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
