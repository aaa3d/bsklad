
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
      'Caption=Esporta nel formato Excel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      'GroupPageRange.Caption= Pagine' + #13#10 +
      'AllRB.Caption=Tutte' + #13#10 +
      'CurPageRB.Caption=Pagina corrente' + #13#10 +
      'PageNumbersRB.Caption=Pagine:' + #13#10 +
      'DescrL.Caption=Immettere i numeri di pagine e/o l''intervallo di pagine, separate da virgole. Per esempio, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Impostazioni di esportazione ' + #13#10 +
      'StylesCB.Caption=Stili' + #13#10 +
      'PicturesCB.Caption=Immagini' + #13#10 +
      'MergeCB.Caption=Unisci celle' + #13#10 +
      'PageBreaksCB.Caption=Interruzioni di pagina' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'WCB.Caption=Anteprima' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Apri il file Excel dopo l''esportazione' + #13#10 +
      'SaveDialog1.Filter=File Excel(*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=Esporta nel formato Excel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      'GroupPageRange.Caption= Pagine' + #13#10 +
      'AllRB.Caption=Tutte' + #13#10 +
      'CurPageRB.Caption=Pagina corrente' + #13#10 +
      'PageNumbersRB.Caption=Pagine:' + #13#10 +
      'DescrL.Caption=Immettere i numeri di pagine e/o l''intervallo di pagine, separate da virgole. Per esempio, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Impostazioni di esportazione  ' + #13#10 +
      'StylesCB.Caption=Stili' + #13#10 +
      'PageBreaksCB.Caption=Interruzioni di pagina' + #13#10 +
      'WCB.Caption=Anteprima' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Apri il file Excel dopo l''esportazione' + #13#10 +
      'SaveDialog1.Filter=File XML Excel (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=Esporta in formato HTML' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      'GroupPageRange.Caption= Pagine ' + #13#10 +
      'AllRB.Caption=Tutte' + #13#10 +
      'CurPageRB.Caption=Pagina corrente' + #13#10 +
      'PageNumbersRB.Caption=Pagine:' + #13#10 +
      'DescrL.Caption=Immettere i numeri di pagine e/o l''intervallo di pagine, separate da virgole. Per esempio, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Impostazioni di esportazione ' + #13#10 +
      'OpenAfterCB.Caption=Apri dopo l''esportazione' + #13#10 +
      'StylesCB.Caption=Stili' + #13#10 +
      'PicturesCB.Caption=Immagini' + #13#10 +
      'PicsSameCB.Caption=Tutti in una sola cartella' + #13#10 +
      'FixWidthCB.Caption=Larghezza fissa' + #13#10 +
      'NavigatorCB.Caption=Pagina di navigazione' + #13#10 +
      'MultipageCB.Caption=Multipagina' + #13#10 +
      'MozillaCB.Caption=Browser Mozilla' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=File HTML (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Esporta in formato testo (file di testo a spaziatura fissa)' + #13#10 + 
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Annulla' + #13#10 +
      'BtnPreview.Hint=Anteprima sì/no' + #13#10 +
      'GroupCellProp.Caption= Proprietà di esportazione  ' + #13#10 +
      'CB_PageBreaks.Caption=Interruzioni di pagina ' + #13#10 +
      'CB_OEM.Caption=Set di caratteri OEM' + #13#10 +
      'CB_EmptyLines.Caption=Linee Vuote' + #13#10 +
      'CB_LeadSpaces.Caption=Caratteri vuoti' + #13#10 +
      'GroupPageRange.Caption= Pagine  ' + #13#10 +
      'Pages.Caption=Pagine:' + #13#10 +
      'Descr.Caption=Immettere i numeri di pagine e/o l''intervallo di pagine, separate da virgole. Per esempio, 1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption= Scalare' + #13#10 +
      'ScX.Caption=Scala orizzonatalmente' + #13#10 +
      'ScY.Caption=Scala verticalmente' + #13#10 +
      'GroupFramesSettings.Caption= Pagine ' + #13#10 +
      'RB_NoneFrames.Caption=Nessuna' + #13#10 +
      'RB_Simple.Caption=Semplice' + #13#10 +
      'RB_Graph.Caption=Grafica' + #13#10 +
      'RB_Graph.Hint=Solo con OEM codepage' + #13#10 +
      'CB_PrintAfter.Caption=Stampa dopo l''esportazione' + #13#10 +
      'CB_Save.Caption=Salva impostazioni' + #13#10 +
      'GroupBox1.Caption= Anteprima ' + #13#10 +
      'Label1.Caption=Larghezza:' + #13#10 +
      'Label3.Caption=Altezza:' + #13#10 +
      'LBPage.Caption=Pagina' + #13#10 +
      'ToolButton1.Hint=Zoom in' + #13#10 +
      'ToolButton2.Hint=Zoom out' + #13#10 +
      'SaveDialog1.Filter=File di testo PRN (file di testo a spaziatura fissa)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Stampa' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Annulla' + #13#10 +
      'GroupBox1.Caption=Stampante' + #13#10 +
      'Label4.Caption=Modello' + #13#10 +
      'PropButton.Caption=Configura...' + #13#10 +
      'GroupBox3.Caption=Copie' + #13#10 +
      'Label2.Caption=Numero di copie' + #13#10 +
      'GroupBox2.Caption= Inizializzazione stampante' + #13#10 +
      'Label1.Caption=Modello' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Modello di inizializzazione stampante(*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=Modello di inizializzazione stampante (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=Esporta in formato RTF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      'GroupPageRange.Caption= Pagine' + #13#10 +
      'AllRB.Caption=Tutte' + #13#10 +
      'CurPageRB.Caption=Pagina Corrente' + #13#10 +
      'PageNumbersRB.Caption=Pagine:' + #13#10 +
      'DescrL.Caption=Immettere i numeri di pagine e/o l''intervallo di pagine, separate da virgole. Per esempio, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Impostazioni di esportazione ' + #13#10 +
      'PicturesCB.Caption=Immagini' + #13#10 +
      'PageBreaksCB.Caption=Interruzioni di pagina' + #13#10 +
      'WCB.Caption=Anteprima' + #13#10 +
      'OpenCB.Caption=Apri dopo l''esportazione' + #13#10 +
      'SaveDialog1.Filter=RTF file (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Esporta in formato JPEG' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Annulla' + #13#10 +
      'GroupPageRange.Caption= Pagine  ' + #13#10 +
      'AllRB.Caption=Tutte' + #13#10 +
      'CurPageRB.Caption=Pagina corrente' + #13#10 +
      'PageNumbersRB.Caption=Pagine:' + #13#10 +
      'DescrL.Caption=Immettere i numeri di pagine e/o l''intervallo di pagine, separate da virgole. Per esempio, 1,3,5-12' + #13#10 +
      'GroupBox1.Caption= Impostazioni dell''immagine ' + #13#10 +
      'Label2.Caption=Qualità JPEG' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=Ricava la pagina intera' + #13#10 +
      'Mono.Caption=Monocromatico' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=Esporta in formato PDF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      'GroupPageRange.Caption= Pagine ' + #13#10 +
      'AllRB.Caption=Tutte' + #13#10 +
      'CurPageRB.Caption=Pagina Corrente' + #13#10 +
      'PageNumbersRB.Caption=Pagine:' + #13#10 +
      'DescrL.Caption=Immettere i numeri di pagine e/o l''intervallo di pagine, separate da virgole. Per esempio, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Impostazioni di esportazione' + #13#10 +
      'CompressedCB.Caption=Compresso' + #13#10 +
      'EmbeddedCB.Caption=Font inclusi' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenCB.Caption=Apri dopo l''esportazione' + #13#10 +
      'SaveDialog1.Filter=Adobe PDF file (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'File RTF');
    Add('BMPexport', 'Immagine BMP');
    Add('JPEGexport', 'Immagine JPEG');
    Add('TIFFexport', 'Immagine TIFF');
    Add('TextExport', 'Testo (stampante ad aghi)');
    Add('XlsOLEexport', 'Foglio Excel(OLE)');
    Add('HTMLexport', 'File HTML');
    Add('XlsXMLexport', 'Foglio Excel(XML)');
    Add('PDFexport', 'File PDF');

    Add('ProgressWait', 'Aspettare...');
    Add('ProgressRows', 'Imposta la distanza tra le righe');
    Add('ProgressColumns', 'Imposta la distanza tra le colonne');
    Add('ProgressStyles', 'Imposta gli stili');
    Add('ProgressObjects', 'Esporta oggetti');


    Add('TIFFexportFilter', 'Immagine Tiff (*.tif)|*.tif');
    Add('BMPexportFilter', 'Immagine BMP (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Immagine Jpeg (*.jpg)|*.jpg');

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
