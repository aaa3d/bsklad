
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
      'Caption=Exportar a Excel' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel�lar' + #13#10 +
      'GroupPageRange.Caption= Rang p�gina ' + #13#10 +
      'AllRB.Caption=Tot' + #13#10 +
      'CurPageRB.Caption=P�gina activa' + #13#10 +
      'PageNumbersRB.Caption=P�gines:' + #13#10 +
      'DescrL.Caption=Entre el n�mero de p�gina i/o rang de p�gines, separats per comes. Per exemple, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Opcions exportaci� ' + #13#10 +
      'StylesCB.Caption=Estils' + #13#10 +
      'PicturesCB.Caption=Imatges' + #13#10 +
      'MergeCB.Caption=Ajuntar cel�les' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'PageBreaksCB.Caption=Dividir p�gines' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Obrir Excel despr�s d''exportar' + #13#10 +
      'SaveDialog1.Filter=Fitxer Excel (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=Exportar a Excel' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel�lar' + #13#10 +
      'GroupPageRange.Caption= Rang p�gina ' + #13#10 +
      'AllRB.Caption=Tot' + #13#10 +
      'CurPageRB.Caption=P�gina activa' + #13#10 +
      'PageNumbersRB.Caption=P�gines:' + #13#10 +
      'DescrL.Caption=Entre el n�mero de p�gina i/o rang de p�gines, separats per comes. Per exemple, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Opcions exportaci� ' + #13#10 +
      'StylesCB.Caption=Estils' + #13#10 +
      'PageBreaksCB.Caption=Dividir p�gines' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Obrir Excel despr�s d''exportar' + #13#10 +
      'SaveDialog1.Filter=Fitxer XML Excel (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=Exportar a HTML' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel�lar' + #13#10 +
      'GroupPageRange.Caption= Rang p�gina ' + #13#10 +
      'AllRB.Caption=Tot' + #13#10 +
      'CurPageRB.Caption=P�gina activa' + #13#10 +
      'PageNumbersRB.Caption=P�gines:' + #13#10 +
      'DescrL.Caption=Entre el n�mero de p�gina i/o rang de p�gines, separats per comes. Per exemple, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Opcions exportaci� ' + #13#10 +
      'OpenAfterCB.Caption=Obrir despr�s d''exportar' + #13#10 +
      'StylesCB.Caption=Estils' + #13#10 +
      'PicturesCB.Caption=Imatges' + #13#10 +
      'PicsSameCB.Caption=Tot en una carpeta' + #13#10 +
      'FixWidthCB.Caption=Fixar amplada' + #13#10 +
      'NavigatorCB.Caption=P�gina de navegador' + #13#10 +
      'MultipageCB.Caption=M�ltiples p�gines' + #13#10 +
      'MozillaCB.Caption=Navegador Mozilla' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=Fitxer HTML (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Exportar a text (Impressora d''agulles)' + #13#10 +
      'OK.Caption=Acceptar' + #13#10 +
      'Cancel.Caption=Cancel�lar' + #13#10 +
      'BtnPreview.Hint=Vista Pr�via on/off' + #13#10 +
      'GroupCellProp.Caption= Propietat exportaci�  ' + #13#10 +
      'CB_PageBreaks.Caption=Dividir P�gines' + #13#10 +
      'CB_OEM.Caption=Codi de p�gina OEM' + #13#10 +
      'CB_EmptyLines.Caption=L�nies buides' + #13#10 +
      'CB_LeadSpaces.Caption=Treure espais' + #13#10 +
      'GroupPageRange.Caption= Rang p�gina  ' + #13#10 +
      'Pages.Caption=N�meros p�gina' + #13#10 +
      'Descr.Caption=Entre el n�mero de p�gina i/o rang de p�gines, separats per comes. Per exemple, 1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption= Escalat ' + #13#10 +
      'ScX.Caption=Escala X' + #13#10 +
      'ScY.Caption=Escala Y' + #13#10 +
      'GroupFramesSettings.Caption= Marcs ' + #13#10 +
      'RB_NoneFrames.Caption=Cap' + #13#10 +
      'RB_Simple.Caption=Simple' + #13#10 +
      'RB_Graph.Caption=Gr�fic' + #13#10 +
      'RB_Graph.Hint=Sols amb codis de p�gina OEM' + #13#10 +
      'CB_PrintAfter.Caption=Imprimir despr�s d''exportar' + #13#10 +
      'CB_Save.Caption=Guardar opcions' + #13#10 +
      'GroupBox1.Caption= Vista Pr�via ' + #13#10 +
      'Label1.Caption=Amplada:' + #13#10 +
      'Label3.Caption=Al�ada:' + #13#10 +
      'LBPage.Caption=P�gina' + #13#10 +
      'ToolButton1.Hint=Zoom in' + #13#10 +
      'ToolButton2.Hint=Zoom out' + #13#10 +
      'SaveDialog1.Filter=Fitxer Text (Impressora d''agulles)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Imprimir' + #13#10 +
      'OK.Caption=Acceptar' + #13#10 +
      'Cancel.Caption=Cancel�lar' + #13#10 +
      'GroupBox1.Caption=Impressora' + #13#10 +
      'Label4.Caption=Nom' + #13#10 +
      'PropButton.Caption=Configuraci�...' + #13#10 +
      'GroupBox3.Caption=C�pies' + #13#10 +
      'Label2.Caption=N�mero de c�pies' + #13#10 +
      'GroupBox2.Caption= Iniciar configuraci� impressora ' + #13#10 +
      'Label1.Caption=Tipus Impressora' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Iniciar plantilla impressora (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=Iniciar plantilla impressora (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=Exportar a RTF' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel�lar' + #13#10 +
      'GroupPageRange.Caption= Rang p�gina ' + #13#10 +
      'AllRB.Caption=Tot' + #13#10 +
      'CurPageRB.Caption=P�gina activa' + #13#10 +
      'PageNumbersRB.Caption=P�gines:' + #13#10 +
      'DescrL.Caption=Entre el n�mero de p�gina i/o rang de p�gines, separats per comes. Per exemple, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Opcions exportaci� ' + #13#10 +
      'PicturesCB.Caption=Imatges' + #13#10 +
      'PageBreaksCB.Caption=Dividir p�gines' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenCB.Caption=Obrir despr�s d''exportar' + #13#10 +
      'SaveDialog1.Filter=Fitxer RTF (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Opcions Exportaci�' + #13#10 +
      'OK.Caption=Acceptar' + #13#10 +
      'Cancel.Caption=Cancel�lar' + #13#10 +
      'GroupPageRange.Caption= Rang p�gina  ' + #13#10 +
      'AllRB.Caption=Tot' + #13#10 +
      'CurPageRB.Caption=P�gina activa' + #13#10 +
      'PageNumbersRB.Caption=P�gines:' + #13#10 +
      'DescrL.Caption=Entre el n�mero de p�gina i/o rang de p�gines, separats per comes. Per exemple, 1,3,5-12' + #13#10 +
      'GroupBox1.Caption= Opcions Imatge ' + #13#10 +
      'Label2.Caption=Qualitat JPEG' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=Retallar p�gines' + #13#10 +
      'Mono.Caption=Monocrom' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=Exportar a PDF' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel�lar' + #13#10 +
      'GroupPageRange.Caption= Rang p�gina ' + #13#10 +
      'AllRB.Caption=Tot' + #13#10 +
      'CurPageRB.Caption=P�gina activa' + #13#10 +
      'PageNumbersRB.Caption=P�gines:' + #13#10 +
      'DescrL.Caption=Entre el n�mero de p�gina i/o rang de p�gines, separats per comes. Per exemple, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Opcions exportaci� ' + #13#10 +
      'CompressedCB.Caption=Comprimir' + #13#10 +
      'EmbeddedCB.Caption=Empotrar lletres' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenCB.Caption=Obrir despr�s d''exportar' + #13#10 +
      'SaveDialog1.Filter=Fitxer Adobe PDF (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'Fitxer RTF');
    Add('BMPexport', 'Imatge BMP');
    Add('JPEGexport', 'Imatge JPEG');
    Add('TIFFexport', 'Imatge TIFF');
    Add('TextExport', 'Text (Impressora d''agulles)');
    Add('XlsOLEexport', 'Taula Excel (OLE)');
    Add('HTMLexport', 'Fitxer HTML');
    Add('XlsXMLexport', 'Taula Excel (XML)');
    Add('PDFexport', 'Fitxer PDF');

    Add('ProgressWait', 'Esperat si us plau');
    Add('ProgressRows', 'Opcions de files');
    Add('ProgressColumns', 'Opcions de columnes');
    Add('ProgressStyles', 'Opcions d''estils');
    Add('ProgressObjects', 'Exportant objectes');


    Add('TIFFexportFilter', 'Imatge Tiff (*.tif)|*.tif');
    Add('BMPexportFilter', 'Imatge BMP (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Imatge Jpeg (*.jpg)|*.jpg');

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
