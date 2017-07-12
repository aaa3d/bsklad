
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
      'Caption=Exportar Excel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'GroupPageRange.Caption= Rango de Páginas ' + #13#10 +
      'AllRB.Caption=Todo' + #13#10 +
      'CurPageRB.Caption=Página actual' + #13#10 +
      'PageNumbersRB.Caption=Páginas:' + #13#10 +
      'DescrL.Caption=Indique los números de página y/o un rango, separado por comas. Por ejemplo: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Opciones de Exportar ' + #13#10 +
      'StylesCB.Caption=Estilos' + #13#10 +
      'PicturesCB.Caption=Imágenes' + #13#10 +
      'MergeCB.Caption=Combinar celdas' + #13#10 +
      'PageBreaksCB.Caption=Separador de página' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'WCB.Caption=Tal como lo vés' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Abrir Excel después de exportar' + #13#10 +
      'SaveDialog1.Filter=Archivo de Excel (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=Exportar a Excel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'GroupPageRange.Caption= Rango de páginas ' + #13#10 +
      'AllRB.Caption=Todo' + #13#10 +
      'CurPageRB.Caption=Página actual' + #13#10 +
      'PageNumbersRB.Caption=Páginas:' + #13#10 +
      'DescrL.Caption=Indique los números de página y/o un rango, separado por comas. Por ejemplo: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Opciones de Exportar ' + #13#10 +
      'StylesCB.Caption=Estilos' + #13#10 +
      'PageBreaksCB.Caption=Separador de página' + #13#10 +
      'WCB.Caption=Tal como lo vés' + #13#10 +
      'OpenExcelCB.Caption=Abrir Excel después de exportar' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=Archivo XML Excel (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=Exportar a HTML' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'GroupPageRange.Caption= Rango de páginas ' + #13#10 +
      'AllRB.Caption=Todo' + #13#10 +
      'CurPageRB.Caption=Página actual' + #13#10 +
      'PageNumbersRB.Caption=Páginas:' + #13#10 +
      'DescrL.Caption=Indique los números de página y/o un rango, separado por comas. Por ejemplo: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Opciones de Exportar ' + #13#10 +
      'OpenAfterCB.Caption=Abrir después de exportar' + #13#10 +
      'StylesCB.Caption=Estilos' + #13#10 +
      'PicturesCB.Caption=Imágenes' + #13#10 +
      'PicsSameCB.Caption=Todo en una misma carpeta' + #13#10 +
      'FixWidthCB.Caption=Ancho fijo' + #13#10 +
      'NavigatorCB.Caption=Navegador' + #13#10 +
      'MultipageCB.Caption=Multipágina' + #13#10 +
      'MozillaCB.Caption=Navegador Mozilla' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=Archivo HTML (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Exportar a texto (Impresoras matriciales)' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Cancelar' + #13#10 +
      'BtnPreview.Hint=Vista previa Si/No' + #13#10 +
      'GroupCellProp.Caption= Propiedades de Exportar  ' + #13#10 +
      'CB_PageBreaks.Caption=Separador de páginas' + #13#10 +
      'CB_OEM.Caption=Código de página OEM' + #13#10 +
      'CB_EmptyLines.Caption=Líneas vacías' + #13#10 +
      'CB_LeadSpaces.Caption=Lead spaces' + #13#10 +
      'GroupPageRange.Caption= Rango de páginas  ' + #13#10 +
      'Pages.Caption=Páginas:' + #13#10 +
      'Descr.Caption=Indique los números de página y/o un rango, separado por comas. Por ejemplo: 1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption= Escalado ' + #13#10 +
      'ScX.Caption=Escala X ' + #13#10 +
      'ScY.Caption=Escala Y ' + #13#10 +
      'GroupFramesSettings.Caption= Marcos ' + #13#10 +
      'RB_NoneFrames.Caption=Ninguno' + #13#10 +
      'RB_Simple.Caption=Simple' + #13#10 +
      'RB_Graph.Caption=Gráfico' + #13#10 +
      'RB_Graph.Hint=Solo códigos de página OEM' + #13#10 +
      'CB_PrintAfter.Caption=Imprimir después de exportar' + #13#10 +
      'CB_Save.Caption=Guardar opciones' + #13#10 +
      'GroupBox1.Caption= Vista previa ' + #13#10 +
      'Label1.Caption=Ancho:' + #13#10 +
      'Label3.Caption=Alto:' + #13#10 +
      'LBPage.Caption=Página' + #13#10 +
      'ToolButton1.Hint=Más Zoom' + #13#10 +
      'ToolButton2.Hint=Menos Zoom' + #13#10 +
      'SaveDialog1.Filter=Archivo de texto (Impresoras matriciales)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Imprimir' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Cancelar' + #13#10 +
      'GroupBox1.Caption=Impresora' + #13#10 +
      'Label4.Caption=Nombre' + #13#10 +
      'PropButton.Caption=Configurar...' + #13#10 +
      'GroupBox3.Caption=Copias' + #13#10 +
      'Label2.Caption=Número de copias' + #13#10 +
      'GroupBox2.Caption= Configuración ' + #13#10 +
      'Label1.Caption=Tipo de impresora' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Printer init template (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=Printer init template (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=Exportar a RTF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'GroupPageRange.Caption= Rango de páginas ' + #13#10 +
      'AllRB.Caption=Todo' + #13#10 +
      'CurPageRB.Caption=Página actual' + #13#10 +
      'PageNumbersRB.Caption=Páginas:' + #13#10 +
      'DescrL.Caption=Indique los números de página y/o un rango, separado por comas. Por ejemplo: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Opciones de Exportar ' + #13#10 +
      'PicturesCB.Caption=Imágenes' + #13#10 +
      'PageBreaksCB.Caption=Separador de páginas' + #13#10 +
      'WCB.Caption=Tal como lo vés' + #13#10 +
      'OpenCB.Caption=Abrir después de exportar' + #13#10 +
      'SaveDialog1.Filter=Archivo RTF (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Opciones de Exportar' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Cancelar' + #13#10 +
      'GroupPageRange.Caption= Rango de páginas  ' + #13#10 +
      'AllRB.Caption=Todo' + #13#10 +
      'CurPageRB.Caption=Página actual' + #13#10 +
      'PageNumbersRB.Caption=Páginas:' + #13#10 +
      'DescrL.Caption=Indique los números de página y/o un rango, separado por comas. Por ejemplo: 1,3,5-12' + #13#10 +
      'GroupBox1.Caption= Opciones de imagen ' + #13#10 +
      'Label2.Caption=Calidad JPEG' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=Crop páginas' + #13#10 +
      'Mono.Caption=Monocromo' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=Exportar a PDF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'GroupPageRange.Caption= Rango de páginas ' + #13#10 +
      'AllRB.Caption=Todo' + #13#10 +
      'CurPageRB.Caption=Página actual' + #13#10 +
      'PageNumbersRB.Caption=Páginas:' + #13#10 +
      'DescrL.Caption=Indique los números de página y/o un rango, separado por comas. Por ejemplo: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Opciones de exportar ' + #13#10 +
      'CompressedCB.Caption=Comprimir' + #13#10 +
      'EmbeddedCB.Caption=Fuentes Embebidas' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenCB.Caption=Abrir después de exportar' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'SaveDialog1.Filter=Archivos de Adobe PDF (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'Archivo RTF');
    Add('BMPexport', 'Imagen BMP');
    Add('JPEGexport', 'Imagen JPEG');
    Add('TIFFexport', 'Imagen TIFF');
    Add('TextExport', 'Texto (Impresora matricial)');
    Add('XlsOLEexport', 'Tabla Excel (OLE)');
    Add('HTMLexport', 'Archivo HTML');
    Add('XlsXMLexport', 'Tabla Excel (XML)');
    Add('PDFexport', 'Archivo PDF');

    Add('ProgressWait', 'Espere por favor');
    Add('ProgressRows', 'Opciones de filas');
    Add('ProgressColumns', 'Opciones de columnas');
    Add('ProgressStyles', 'Opciones de Estilos');
    Add('ProgressObjects', 'Exportando objetos');


    Add('TIFFexportFilter', 'Imagen Tiff (*.tif)|*.tif');
    Add('BMPexportFilter', 'Imagen BMP (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Imagen Jpeg (*.jpg)|*.jpg');

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
