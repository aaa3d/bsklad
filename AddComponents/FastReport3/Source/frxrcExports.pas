
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
      'GroupPageRange.Caption= Intervalo de páginas ' + #13#10 +
      'AllRB.Caption=Todas' + #13#10 +
      'CurPageRB.Caption=Página atual' + #13#10 +
      'PageNumbersRB.Caption=Páginas:' + #13#10 +
      'DescrL.Caption=Informe os números das páginas e/ou intervalo de páginas, separados por vírgulas. Por exemplo, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Configurações de Exportação ' + #13#10 +
      'StylesCB.Caption=Estilos' + #13#10 +
      'PicturesCB.Caption=Figuras' + #13#10 +
      'MergeCB.Caption=Mesclar células' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'PageBreaksCB.Caption=Quebras de página' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Abrir o Excel depois de exportar' + #13#10 +
      'SaveDialog1.Filter=Arquivo do Excel  (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=Exportar para Excel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'GroupPageRange.Caption= Intervalo de páginas ' + #13#10 +
      'AllRB.Caption=Todas' + #13#10 +
      'CurPageRB.Caption=Página atual' + #13#10 +
      'PageNumbersRB.Caption=Páginas:' + #13#10 +
      'DescrL.Caption=Informe os números das páginas e/ou intervalo de páginas, separados por vírgulas. Por exemplo, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Configurações de exportação ' + #13#10 +
      'StylesCB.Caption=Estilos' + #13#10 +
      'PageBreaksCB.Caption=Quebras de página' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Abrir o Excel depois de exportar' + #13#10 +
      'SaveDialog1.Filter=Arquivo XML do Excel (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=Exportar para tabela HTML' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'GroupPageRange.Caption= Intervalo de páginas ' + #13#10 +
      'AllRB.Caption=Todas' + #13#10 +
      'CurPageRB.Caption=Página atual' + #13#10 +
      'PageNumbersRB.Caption=Páginas:' + #13#10 +
      'DescrL.Caption=Informe os números das páginas e/ou intervalo de páginas, separados por vírgulas. Por exemplo, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Configurações de exportação ' + #13#10 +
      'OpenAfterCB.Caption=Abrir depois de exportar' + #13#10 +
      'StylesCB.Caption=Estilos' + #13#10 +
      'PicturesCB.Caption=Figura' + #13#10 +
      'PicsSameCB.Caption=Todas em uma pasta' + #13#10 +
      'FixWidthCB.Caption=Largura fixa' + #13#10 +
      'NavigatorCB.Caption=Navegador de páginas' + #13#10 +
      'MultipageCB.Caption=Multi-página' + #13#10 +
      'MozillaCB.Caption=Navegador Mozilla' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=Arquivo HTML (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Exportar para texto (impressora matricial)' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Cancelar' + #13#10 +
      'BtnPreview.Hint=Visualizar ligado/desligado' + #13#10 +
      'GroupCellProp.Caption= Propriedades de Exportação  ' + #13#10 +
      'CB_PageBreaks.Caption=Quebras de página' + #13#10 +
      'CB_OEM.Caption=Página de Código OEM' + #13#10 +
      'CB_EmptyLines.Caption=Linhas vazias' + #13#10 +
      'CB_LeadSpaces.Caption=Espaços no início' + #13#10 +
      'GroupPageRange.Caption= Intervalo de páginas  ' + #13#10 +
      'Pages.Caption=Números de página' + #13#10 +
      'Descr.Caption=Informe os números das páginas e/ou intervalo de páginas, separados por vírgulas. Por exemplo, 1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption= Escalonamento ' + #13#10 +
      'ScX.Caption=Escala X' + #13#10 +
      'ScY.Caption=Escala Y' + #13#10 +
      'GroupFramesSettings.Caption= Bordas ' + #13#10 +
      'RB_NoneFrames.Caption=Nenhuma' + #13#10 +
      'RB_Simple.Caption=Simples' + #13#10 +
      'RB_Graph.Caption=Gráfica' + #13#10 +
      'RB_Graph.Hint=Somente com página de código OEM' + #13#10 +
      'CB_PrintAfter.Caption=Imprimir depois de exportar' + #13#10 +
      'CB_Save.Caption=Salvar configurações' + #13#10 +
      'GroupBox1.Caption= Visualizar ' + #13#10 +
      'Label1.Caption=Largura:' + #13#10 +
      'Label3.Caption=Altura:' + #13#10 +
      'LBPage.Caption=Página' + #13#10 +
      'ToolButton1.Hint=Mais Zoom' + #13#10 +
      'ToolButton2.Hint=Menos Zoom' + #13#10 +
      'SaveDialog1.Filter=Arquivo de texto (impressora matricial)(*.prn)|*.prn' + #13#10 +
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
      'GroupBox2.Caption= Configuração inicial da impressora ' + #13#10 +
      'Label1.Caption=Tipo de impressora' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Modelo inicial da impressora (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=Modelo inicial da impressora (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=Exportar para RTF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'GroupPageRange.Caption= Intervalo de páginas ' + #13#10 +
      'AllRB.Caption=Todas' + #13#10 +
      'CurPageRB.Caption=Página atual' + #13#10 +
      'PageNumbersRB.Caption=Páginas:' + #13#10 +
      'DescrL.Caption=Informe os números das páginas e/ou intervalo de páginas, separados por vírgulas. Por exemplo, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Configurações de exportação ' + #13#10 +
      'PicturesCB.Caption=Figuras' + #13#10 +
      'PageBreaksCB.Caption=Quebras de página' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenCB.Caption=Abrir depois de exportar' + #13#10 +
      'SaveDialog1.Filter=Arquivo RTF (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Configurações de Exportação' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Cancelar' + #13#10 +
      'GroupPageRange.Caption= Intervalo de páginas  ' + #13#10 +
      'AllRB.Caption=Todas' + #13#10 +
      'CurPageRB.Caption=Página atual' + #13#10 +
      'PageNumbersRB.Caption=Páginas:' + #13#10 +
      'DescrL.Caption=Informe os números das páginas e/ou intervalo de páginas, separados por vírgulas. Por exemplo, 1,3,5-12' + #13#10 +
      'GroupBox1.Caption= Configurações da Imagem ' + #13#10 +
      'Label2.Caption=Qulidade JPEG' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=Reduzir página' + #13#10 +
      'Mono.Caption=Monocromático' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=Exportar para PDF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'GroupPageRange.Caption= Intervalo de páginas ' + #13#10 +
      'AllRB.Caption=Todas' + #13#10 +
      'CurPageRB.Caption=Página atual' + #13#10 +
      'PageNumbersRB.Caption=Páginas:' + #13#10 +
      'DescrL.Caption=Informe os números das páginas e/ou intervalo de páginas, separados por vírgulas. Por exemplo, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Configurações de exportação ' + #13#10 +
      'CompressedCB.Caption=Compactado' + #13#10 +
      'EmbeddedCB.Caption=Fontes embutidas' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenCB.Caption=Abrir depois de exportar' + #13#10 +
      'SaveDialog1.Filter=Arquivo PDF Adobe (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'Arquivo RTF file');
    Add('BMPexport', 'Imagem BMP');
    Add('JPEGexport', 'Imagem JPEG');
    Add('TIFFexport', 'Imagem TIFF');
    Add('TextExport', 'Texto (impressora matricial)');
    Add('XlsOLEexport', 'Tabela Excel (OLE)');
    Add('HTMLexport', 'Arquivo HTML');
    Add('XlsXMLexport', 'Tabela Excel (XML)');
    Add('PDFexport', 'Arquivo PDF');

    Add('ProgressWait', 'Por favor, aguarde');
    Add('ProgressRows', 'Definindo linhas');
    Add('ProgressColumns', 'Definindo colunas');
    Add('ProgressStyles', 'Definindo estilos');
    Add('ProgressObjects', 'Exportando objetos');


    Add('TIFFexportFilter', 'Imagem Tiff (*.tif)|*.tif');
    Add('BMPexportFilter', 'Imagem BMP (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Imagem Jpeg (*.jpg)|*.jpg');

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
