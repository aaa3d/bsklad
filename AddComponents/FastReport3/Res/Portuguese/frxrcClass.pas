{******************************************}
{                                          }
{             FastReport v3.0              }
{         Language resource file           }
{                                          }
{         Copyright (c) 1998-2005          }
{         by Alexander Tzyganenko,         }
{            Fast Reports Inc.             }
{                                          }
{******************************************}

unit frxrcClass;

interface

procedure frAddClassesRes;


implementation

uses frxRes;


procedure frAddClassesRes;
begin
  with frxResources do
  begin
    Add('TfrxPreviewForm',
      'Caption=Pré-Visualizar' + #13#10 +
      'PrintB.Caption=Imprimir' + #13#10 +
      'PrintB.Hint=Imprimir' + #13#10 +
      'OpenB.Caption=Abrir' + #13#10 +
      'OpenB.Hint=Abrir' + #13#10 +
      'SaveB.Caption=Guardar' + #13#10 +
      'SaveB.Hint=Guardar' + #13#10 +
      'ExportB.Caption=Exportar' + #13#10 +
      'ExportB.Hint=Exportar' + #13#10 +
      'FindB.Caption=Localizar' + #13#10 +
      'FindB.Hint=Localizar' + #13#10 +
      'ZoomWholePageB.Caption=Toda a Página' + #13#10 +
      'ZoomWholePageB.Hint=Toda a Página' + #13#10 +
      'ZoomPageWidthB.Caption=Largura da Página' + #13#10 +
      'ZoomPageWidthB.Hint=Largura da Página' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=Duas Páginas' + #13#10 +
      'Zoom50B.Hint=Duas Páginas' + #13#10 +
      'ZoomCB.Hint=Zoom' + #13#10 +
      'PageSettingsB.Caption=Margens' + #13#10 +
      'PageSettingsB.Hint=Margens' + #13#10 +
      'OutlineB.Caption=Resumo' + #13#10 +
      'OutlineB.Hint=Resumo' + #13#10 +
      'HandToolB.Caption=Arrastar' + #13#10 +
      'HandToolB.Hint=Ferramenta Arrastar' + #13#10 +
      'ZoomToolB.Caption=Zoom' + #13#10 +
      'ZoomToolB.Hint=Ferramenta Zoom' + #13#10 +
      'NewPageB.Caption=Nova Página' + #13#10 +
      'NewPageB.Hint=Nova Página' + #13#10 +
      'DelPageB.Caption=Apagar' + #13#10 +
      'DelPageB.Hint=Apagar Página' + #13#10 +
      'DesignerB.Caption=Editar' + #13#10 +
      'DesignerB.Hint=Editar Página' + #13#10 +
      'FirstB.Caption=Primeira' + #13#10 +
      'FirstB.Hint=Primeira Página' + #13#10 +
      'PriorB.Caption=Anterior' + #13#10 +
      'PriorB.Hint=Página Anterior' + #13#10 +
      'NextB.Caption=Próxima' + #13#10 +
      'NextB.Hint=Próxima Página' + #13#10 +
      'LastB.Caption=Ultima' + #13#10 +
      'LastB.Hint=Ultima Página' + #13#10 +
      'CancelB.Caption=Fechar' + #13#10 +
      'PageE.Hint=Número da Página' + #13#10 +
      '');
    Add('zmPageWidth', 'Largura da Página');
    Add('zmWholePage', 'Toda a Página');

    Add('TfrxPrintDialog',
      'Caption=Imprimir' + #13#10 +
      'Label12.Caption= Impressora ' + #13#10 +
      'DescrL.Caption=Digite números de página e/ou intervalos, separados por virgulas.  Por exemplo, 1,3,5-12' + #13#10 +
      'Label1.Caption= Páginas ' + #13#10 +
      'CopiesL.Caption=Número de cópias' + #13#10 +
      'CollateL.Caption=Agrupar' + #13#10 +
      'Label2.Caption= Cópias ' + #13#10 +
      'PrintL.Caption=Imprimir' + #13#10 +
      'TypeL.Caption=Tipo:' + #13#10 +
      'WhereL.Caption=Em:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'PropButton.Caption=Propriedades...' + #13#10 +
      'AllRB.Caption=Todas' + #13#10 +
      'CurPageRB.Caption=Página actual' + #13#10 +
      'PageNumbersRB.Caption=Páginas:' + #13#10 +
      'FileCB.Caption=Imprimir para ficheiro' + #13#10 +
      'ReverseCB.Caption=Inverter páginas' + #13#10 +
      '');
    Add('ppAll', 'Todas as páginas');
    Add('ppOdd', 'Páginas ímpares');
    Add('ppEven', 'Páginas pares');

    Add('TfrxSearchDialog',
      'Caption=Localizar Texto' + #13#10 +
      'TextL.Caption=Texto a localizar:' + #13#10 +
      'SearchL.Caption= Opções de pesquisa ' + #13#10 +
      'ReplaceL.Caption=Substituir por' + #13#10 +
      'TopCB.Caption=Procurar desde o início' + #13#10 +
      'CaseCB.Caption=Diferenciar maiúsculas/minúsculas' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Configuração da Página' + #13#10 +
      'WidthL.Caption=Largura' + #13#10 +
      'HeightL.Caption=Altura' + #13#10 +
      'SizeL.Caption= Tamanho ' + #13#10 +
      'OrientationL.Caption= Orientação ' + #13#10 +
      'LeftL.Caption=Esquerda' + #13#10 +
      'TopL.Caption=Superior' + #13#10 +
      'RightL.Caption=Direita' + #13#10 +
      'BottomL.Caption=Inferior' + #13#10 +
      'MarginsL.Caption= Margens ' + #13#10 +
      'PortraitRB.Caption=Retrato' + #13#10 +
      'LandscapeRB.Caption=Paisagem' + #13#10 +
      'cmL1.Caption=cm' + #13#10 +
      'cmL2.Caption=cm' + #13#10 +
      'cmL3.Caption=cm' + #13#10 +
      'cmL4.Caption=cm' + #13#10 +
      'cmL5.Caption=cm' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'OtherL.Caption= Acção ' + #13#10 +
      'ApplyToCurRB.Caption=Aplicar à página actual' + #13#10 +
      'ApplyToAllRB.Caption=Aplicar a todas as páginas' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Imprimir' + #13#10 +
      'PrinterL.Caption= Impressora ' + #13#10 +
      'PagesL.Caption= Páginas ' + #13#10 +
      'CopiesL.Caption= Cópias ' + #13#10 +
      'CopiesNL.Caption=Número de copias' + #13#10 +
      'DescrL.Caption=Digite numeros de página e/ou intervalos, separados por virgulas. Por exemplo, 1,3,5-12' + #13#10 +
      'OptionsL.Caption= Opções ' + #13#10 +
      'EscL.Caption= Comandos "ESC" ' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Cancelar' + #13#10 +
      'SaveToFileCB.Caption=Imprimir para ficheiro' + #13#10 +
      'AllRB.Caption=Todas' + #13#10 +
      'CurPageRB.Caption=Página actual' + #13#10 +
      'PageNumbersRB.Caption=Páginas:' + #13#10 +
      'PageBreaksCB.Caption=Quebras de página' + #13#10 +
      'OemCB.Caption=OEM codepage' + #13#10 +
      'PseudoCB.Caption=Pseudographic' + #13#10 +
      'SaveDialog1.Filter=Ficheiro de impressora (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Cancelar' + #13#10 +
      '');

    Add('mbConfirm', 'Confirmar');
    Add('mbError', 'Erro');
    Add('mbInfo', 'Informação');
    Add('xrCantFindClass', 'Classe não encontrada');
    Add('prVirtual', 'Virtual');
    Add('prDefault', 'Padrão');
    Add('prCustom', 'Personalizado');
    Add('enUnconnHeader', 'Cabeçalho/Rodapé não ligados');
    Add('enUnconnGroup', 'Grupo sem banda de dados');
    Add('enUnconnGFooter', 'Não existe cabeçalho de grupo para');
    Add('enBandPos', 'Posição incorrecta da banda:');
    Add('dbNotConn', 'DataSet %s não está ligado aos dados');
    Add('dbFldNotFound', 'Campo não encontrado:');
    Add('clDSNotIncl', '(Dataset não está incluído em Report.DataSets)');
    Add('clUnknownVar', 'Variável ou campo desconhecido:');
    Add('clScrError', 'Erro no script em %s: %s');
    Add('clDSNotExist', 'Dataset "%s" não existe');
    Add('clErrors', 'Ocorreram os seguintes erros:');
    Add('clExprError', 'Erro na expressão');
    Add('clFP3files', 'Relatório preparado');
    Add('clSaving', 'Guardando ficheiro...');
    Add('clCancel', 'Cancelar');
    Add('clClose', 'Fechar');
    Add('clPrinting', 'Imprimindo página');
    Add('clLoading', 'Lendo ficheiro...');
    Add('clPageOf', 'Pág. %d de %d');
    Add('clFirstPass', 'Primeiro passo: página ');
    Add('clNoPrinters', 'Não há impressoras instaladas no sistema');
    Add('clDecompressError', 'Erro de descompressão de "Stream"');
    Add('crFillMx', 'Preenchendo a grelha...');
    Add('crBuildMx', 'Construindo a grelha...');

    Add('prRunningFirst', 'Primeiro passo: página %d');
    Add('prRunning', 'Preparando página %d');
    Add('prPrinting', 'Imprimindo página %d');
    Add('prExporting', 'Exportando página %d');
    Add('uCm', 'cm');
    Add('uInch', 'pol');
    Add('uPix', 'px');
    Add('uChar', 'car');
  end;
end;


initialization
  frAddClassesRes;

end.