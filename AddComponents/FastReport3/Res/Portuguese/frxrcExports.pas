
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
      'Caption=Exportar para Excel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'GroupPageRange.Caption= Intervalo ' + #13#10 +
      'AllRB.Caption=Todas as páginas' + #13#10 +
      'CurPageRB.Caption=Página actual' + #13#10 +
      'PageNumbersRB.Caption=Paginas:' + #13#10 +
      'DescrL.Caption=Digite números de página e/ou intervalos, separados por vírgulas. Por exemplo, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Opções de Exportação ' + #13#10 +
      'StylesCB.Caption=Estilos' + #13#10 +
      'PicturesCB.Caption=Figuras' + #13#10 +
      'MergeCB.Caption=Unir Células' + #13#10 +
      'PageBreaksCB.Caption=Quebras de Página' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'AsTextCB.Caption=Como texto' + #13#10 +
      'BackgrCB.Caption=Fundo' + #13#10 +
      'OpenExcelCB.Caption=Abrir o Excel após exportar' + #13#10 +
      'SaveDialog1.Filter=Ficheiro Excel (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=Exportar para Excel XML' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'GroupPageRange.Caption= Intervalo ' + #13#10 +
      'AllRB.Caption=Todas as páginas' + #13#10 +
      'CurPageRB.Caption=Página actual' + #13#10 +
      'PageNumbersRB.Caption=Páginas:' + #13#10 +
      'DescrL.Caption=Digite números de página e/ou intervalos, separados por vírgulas. Por exemplo, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Opções de Exportação ' + #13#10 +
      'StylesCB.Caption=Estilos' + #13#10 +
      'PageBreaksCB.Caption=Quebras de Página' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'BackgrCB.Caption=Fundo' + #13#10 +
      'OpenExcelCB.Caption=Abrir o Excel após exportar' + #13#10 +
      'SaveDialog1.Filter=Ficheiro Excel XML (*.xml)|*.xml' + #13#10 +
      'SaveDialog1.DefaultExt=.xml' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=Exportar para tabela HTML' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'GroupPageRange.Caption= Intervalo ' + #13#10 +
      'AllRB.Caption=Todas as páginas' + #13#10 +
      'CurPageRB.Caption=Página actual' + #13#10 +
      'PageNumbersRB.Caption=Páginas:' + #13#10 +
      'DescrL.Caption=Digite números de página e/ou intervalos, separados por vírgulas. Por exemplo, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Opções de Exportação ' + #13#10 +
      'OpenAfterCB.Caption=Abrir após exportar' + #13#10 +
      'StylesCB.Caption=Estilos' + #13#10 +
      'PicturesCB.Caption=Figuras' + #13#10 +
      'PicsSameCB.Caption=Todas numa pasta' + #13#10 +
      'FixWidthCB.Caption=Largura fixa' + #13#10 +
      'NavigatorCB.Caption=Navegador' + #13#10 +
      'MultipageCB.Caption=Multi-páginas' + #13#10 +
      'MozillaCB.Caption=Browser Mozilla' + #13#10 +
      'BackgrCB.Caption=Fundo' + #13#10 +
      'SaveDialog1.Filter=Ficheiro HTML (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Exportar para texto (impressora matricial)' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Cancelar' + #13#10 +
      'BtnPreview.Hint=Pré-visualizar on/off' + #13#10 +
      'GroupCellProp.Caption= Opções de Exportação  ' + #13#10 +
      'CB_PageBreaks.Caption=Quebras de Página' + #13#10 +
      'CB_OEM.Caption=OEM codepage' + #13#10 +
      'CB_EmptyLines.Caption=Linhas vazias' + #13#10 +
      'CB_LeadSpaces.Caption=Espaços iniciais' + #13#10 +
      'GroupPageRange.Caption= Intervalo  ' + #13#10 +
      'Pages.Caption=Páginas:' + #13#10 +
      'Descr.Caption=Digite números de página e/ou intervalos, separados por vírgulas. Por exemplo, 1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption= Escala ' + #13#10 +
      'ScX.Caption=Escala X' + #13#10 +
      'ScY.Caption=Escala Y' + #13#10 +
      'GroupFramesSettings.Caption= Limites ' + #13#10 +
      'RB_NoneFrames.Caption=Nenhum' + #13#10 +
      'RB_Simple.Caption=Simples' + #13#10 +
      'RB_Graph.Caption=Gráfico' + #13#10 +
      'RB_Graph.Hint=Apenas com OEM codepage' + #13#10 +
      'CB_PrintAfter.Caption=Imprimir após exportar' + #13#10 +
      'CB_Save.Caption=Guardar configuração' + #13#10 +
      'GroupBox1.Caption= Pré-visualizar ' + #13#10 +
      'Label1.Caption=Largura:' + #13#10 +
      'Label3.Caption=Altura:' + #13#10 +
      'LBPage.Caption=Página' + #13#10 +
      'ToolButton1.Hint=Mais Zoom' + #13#10 +
      'ToolButton2.Hint=Menos Zoom' + #13#10 +
      'SaveDialog1.Filter=Ficheiro de texto (impressora matricial)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Imprimir' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Cancelar' + #13#10 +
      'GroupBox1.Caption=Impressora' + #13#10 +
      'Label4.Caption=Nome' + #13#10 +
      'PropButton.Caption=Configuração...' + #13#10 +
      'GroupBox3.Caption=Cópias' + #13#10 +
      'Label2.Caption=Número de cópias' + #13#10 +
      'GroupBox2.Caption= Inicialização da Impressora ' + #13#10 +
      'Label1.Caption=Tipo de Impressora' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Modelo de inicialização de Impressora (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=Modelo de inicialização de Impressora (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=Exportar para RTF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'GroupPageRange.Caption= Intervalo ' + #13#10 +
      'AllRB.Caption=Todas as páginas' + #13#10 +
      'CurPageRB.Caption=Página actual' + #13#10 +
      'PageNumbersRB.Caption=Páginas:' + #13#10 +
      'DescrL.Caption=Digite números de página e/ou intervalos, separados por vírgulas. Por exemplo, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Opções de Exportação ' + #13#10 +
      'PicturesCB.Caption=Figuras' + #13#10 +
      'PageBreaksCB.Caption=Quebras de Página' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenCB.Caption=Abrir após exportar' + #13#10 +
      'SaveDialog1.Filter=Ficheiro RTF (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Exportar para Imagem' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Cancelar' + #13#10 +
      'GroupPageRange.Caption= Intervalo ' + #13#10 +
      'AllRB.Caption=Todas as páginas' + #13#10 +
      'CurPageRB.Caption=Página actual' + #13#10 +
      'PageNumbersRB.Caption=Páginas:' + #13#10 +
      'DescrL.Caption=Digite números de página e/ou intervalos, separados por vírgulas. Por exemplo, 1,3,5-12' + #13#10 +
      'GroupBox1.Caption= Opções da Imagem ' + #13#10 +
      'Label2.Caption=Qualidade JPEG' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=Reduzir página' + #13#10 +
      'Mono.Caption=Monocromática' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=Exportar para PDF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'GroupPageRange.Caption= Intervalo ' + #13#10 +
      'AllRB.Caption=Todas as páginas' + #13#10 +
      'CurPageRB.Caption=Página actual' + #13#10 +
      'PageNumbersRB.Caption=Páginas:' + #13#10 +
      'DescrL.Caption=Digite números de página e/ou intervalos, separados por vírgulas. Por exemplo, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Opções de Exportação ' + #13#10 +
      'CompressedCB.Caption=Comprimido' + #13#10 +
      'EmbeddedCB.Caption=Tipos de Letra Embutidos' + #13#10 +
      'PrintOptCB.Caption=Optimizado para impressão' + #13#10 +
      'OutlineCB.Caption=Resumo' + #13#10 +
      'BackgrCB.Caption=Fundo' + #13#10 +
      'OpenCB.Caption=Abrir após exportar' + #13#10 +
      'SaveDialog1.Filter=Ficheiro Adobe PDF (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'Ficheiro RTF');
    Add('BMPexport', 'Imagem BMP');
    Add('JPEGexport', 'Imagem JPEG');
    Add('TIFFexport', 'Imagem TIFF');
    Add('TextExport', 'Texto (impressora matricial)');
    Add('XlsOLEexport', 'Tabela Excel (OLE)');
    Add('HTMLexport', 'Ficheiro HTML');
    Add('XlsXMLexport', 'Tabela Excel (XML)');
    Add('PDFexport', 'Ficheiro PDF');

    Add('ProgressWait', 'Aguarde por favor');
    Add('ProgressRows', 'Definindo linhas');
    Add('ProgressColumns', 'Definindo colunas');
    Add('ProgressStyles', 'Definindo estilos');
    Add('ProgressObjects', 'Exportando objectos');


    Add('TIFFexportFilter', 'Imagem Tiff (*.tif)|*.tif');
    Add('BMPexportFilter', 'Imagem BMP (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Imagem Jpeg (*.jpg)|*.jpg');

    Add('HTMLNavFirst', 'Primeira');
    Add('HTMLNavPrev', 'Anterior');
    Add('HTMLNavNext', 'Próxima');
    Add('HTMLNavLast', 'Última');
    Add('HTMLNavRefresh', 'Refrescar');
    Add('HTMLNavPrint', 'Imprimir');
    Add('HTMLNavTotal', 'Total de páginas');
  end;
end;

initialization
  frAddExportsRes;

end.
