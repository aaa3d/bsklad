
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
      'Caption=Visualizar' + #13#10 +
      'PrintB.Caption=Imprimir' + #13#10 +
      'PrintB.Hint=Imprimir' + #13#10 +
      'OpenB.Caption=Abrir' + #13#10 +
      'OpenB.Hint=Abrir' + #13#10 +
      'SaveB.Caption=Salvar' + #13#10 +
      'SaveB.Hint=Salvar' + #13#10 +
      'ExportB.Caption=Exportar' + #13#10 +
      'ExportB.Hint=Exportar' + #13#10 +
      'FindB.Caption=Localizar' + #13#10 +
      'FindB.Hint=Localizar' + #13#10 +
      'ZoomWholePageB.Caption=P�gina Inteira' + #13#10 +
      'ZoomWholePageB.Hint=P�gina Inteira' + #13#10 +
      'ZoomPageWidthB.Caption=Tamanho da P�gina' + #13#10 +
      'ZoomPageWidthB.Hint=Tamanho da P�gina' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=Duas P�ginas' + #13#10 +
      'Zoom50B.Hint=Duas P�ginas' + #13#10 +
      'ZoomCB.Hint=Zoom' + #13#10 +
      'PageSettingsB.Caption=Margens' + #13#10 +
      'PageSettingsB.Hint=Margens' + #13#10 +
      'OutlineB.Caption=Resumo' + #13#10 +
      'OutlineB.Hint=Resumo' + #13#10 +
      'HandToolB.Caption=Arrastar' + #13#10 +
      'HandToolB.Hint=Ferramenta Arrastar' + #13#10 +
      'ZoomToolB.Caption=Zoom' + #13#10 +
      'ZoomToolB.Hint=Ferramenta Zoom' + #13#10 +
      'NewPageB.Caption=Adicionar P�gina' + #13#10 +
      'NewPageB.Hint=Adicionar P�gina' + #13#10 +
      'DelPageB.Caption=Remover' + #13#10 +
      'DelPageB.Hint=Remover P�gina' + #13#10 +
      'DesignerB.Caption=Editar' + #13#10 +
      'DesignerB.Hint=Editar P�gina' + #13#10 +
      'FirstB.Caption=Primeira' + #13#10 +
      'FirstB.Hint=Primeira P�gina' + #13#10 +
      'PriorB.Caption=Anterior' + #13#10 +
      'PriorB.Hint=P�gina Anterior' + #13#10 +
      'NextB.Caption=Pr�xima' + #13#10 +
      'NextB.Hint=Pr�xima P�gina' + #13#10 +
      'LastB.Caption=�ltima' + #13#10 +
      'LastB.Hint=�ltima P�gina' + #13#10 +
      'CancelB.Caption=Fechar' + #13#10 +
      'PageE.Hint=N�mero da P�gina' + #13#10 +
      '');
    Add('zmPageWidth', 'Tamanho da P�gina');
    Add('zmWholePage', 'P�gina Inteira');

    Add('TfrxPrintDialog',
      'Caption=Imprimir' + #13#10 +
      'Label12.Caption=Impressora   ' + #13#10 +
      'DescrL.Caption=Informe os n�meros das p�ginas e/ou intervalo de p�ginas, separados por v�rgulas. Por exemplo, 1,3,5-12' + #13#10 +
      'Label1.Caption=P�ginas   ' + #13#10 +
      'CopiesL.Caption=N�mero de c�pias' + #13#10 +
      'CollateL.Caption=Agrupar' + #13#10 +
      'Label2.Caption=C�pias   ' + #13#10 +
      'PrintL.Caption=Imprimir' + #13#10 +
      'TypeL.Caption=Tipo:' + #13#10 +
      'WhereL.Caption=Onde:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'PropButton.Caption=Propriedades...' + #13#10 +
      'AllRB.Caption=Todas' + #13#10 +
      'CurPageRB.Caption=P�gina atual' + #13#10 +
      'PageNumbersRB.Caption=P�ginas:' + #13#10 +
      'FileCB.Caption=Imprimir para arquivo' + #13#10 +
      'ReverseCB.Caption=Inverter p�ginas' + #13#10 +
      '');
    Add('ppAll', 'Todas as p�ginas');
    Add('ppOdd', 'P�ginas �mpares');
    Add('ppEven', 'P�ginas pares');

    Add('TfrxSearchDialog',
      'Caption=Localizar Texto' + #13#10 +
      'TextL.Caption=Texto para localizar:' + #13#10 +
      'SearchL.Caption=Op��es de pesquisa   ' + #13#10 +
      'ReplaceL.Caption=Replace with' + #13#10 +
      'TopCB.Caption=Pesquisar do in�cio' + #13#10 +
      'CaseCB.Caption=Diferenciar mai�sculas de min�sculas' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Configura��es da p�gina' + #13#10 +
      'WidthL.Caption=Largura' + #13#10 +
      'HeightL.Caption=Altura' + #13#10 +
      'SizeL.Caption=Tamanho   ' + #13#10 +
      'OrientationL.Caption=Orienta��o   ' + #13#10 +
      'LeftL.Caption=Esquerda' + #13#10 +
      'TopL.Caption=Superior' + #13#10 +
      'RightL.Caption=Direita' + #13#10 +
      'BottomL.Caption=Inferior' + #13#10 +
      'MarginsL.Caption=Margens   ' + #13#10 +
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
      'OtherL.Caption=Outros   ' + #13#10 +
      'ApplyToCurRB.Caption=Aplicar na p�gina atual' + #13#10 +
      'ApplyToAllRB.Caption=Aplicar em todas as p�ginas' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Imprimir' + #13#10 +
      'PrinterL.Caption=Impressora   ' + #13#10 +
      'PagesL.Caption=P�ginas   ' + #13#10 +
      'CopiesL.Caption=C�pias   ' + #13#10 +
      'CopiesNL.Caption=N�mero de c�pias' + #13#10 +
      'DescrL.Caption=Informe os n�meros das p�ginas e/ou intervalo de p�ginas, separados por v�rgulas. Por exemplo, 1,3,5-12' + #13#10 +
      'OptionsL.Caption=Op��es   ' + #13#10 +
      'EscL.Caption=Comandos de escape   ' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Cancelar' + #13#10 +
      'SaveToFileCB.Caption=Imprimir para arquivo' + #13#10 +
      'AllRB.Caption=Todas' + #13#10 +
      'CurPageRB.Caption=P�gina atual' + #13#10 +
      'PageNumbersRB.Caption=P�ginas:' + #13#10 +
      'PageBreaksCB.Caption=Quebras de p�gina' + #13#10 +
      'OemCB.Caption=C�digo de P�gina OEM' + #13#10 +
      'PseudoCB.Caption=Pseudogr�fico' + #13#10 +
      'SaveDialog1.Filter=Arquivo de impress�o (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Cancelar' + #13#10 +
      '');

    Add('mbConfirm', 'Confirma��o');
    Add('mbError', 'Erro');
    Add('mbInfo', 'Informa��o');
    Add('xrCantFindClass', 'Classe n�o encontrada');
    Add('prVirtual', 'Virtual');
    Add('prDefault', 'Padr�o');
    Add('prCustom', 'Customizado');
    Add('enUnconnHeader', 'Cabe�alho/rodap� desconectado');
    Add('enUnconnGroup', 'Grupo sem banda de dados');
    Add('enUnconnGFooter', 'Sem cabe�alho de grupo para');
    Add('enBandPos', 'Posi��o incorreta da banda:');
    Add('dbNotConn', 'DataSet %s n�o est� conevtado a dados');
    Add('dbFldNotFound', 'Campo n�o encontrado:');
    Add('clDSNotIncl', '(dataset n�o est� inclu�do em Report.DataSets)');
    Add('clUnknownVar', 'Vari�vel ou campo de dados desconhecido:');
    Add('clScrError', 'Erro no script em %s: %s');
    Add('clDSNotExist', 'Dataset "%s" n�o existe');
    Add('clErrors', 'Erro(s) encontrado(s):');
    Add('clExprError', 'Erro na express�o');
    Add('clFP3files', 'Relat�rio Preparado');
    Add('clSaving', 'Salvando arquivo...');
    Add('clCancel', 'Cancelar');
    Add('clClose', 'Fechar');
    Add('clPrinting', 'Imprimindo p�gina');
    Add('clLoading', 'Carregando arquivo...');
    Add('clPageOf', 'P�gina %d de %d');
    Add('clFirstPass', 'Primeiro passo: p�gina ');
    Add('clNoPrinters', 'Nenhuma impressora instalada no sistema');
    Add('clDecompressError', 'Erro de descompress�o de fluxo');
    Add('crFillMx', 'Preenchendo o cross-tab...');
    Add('crBuildMx', 'Construindo o cross-tab...');

    Add('prRunningFirst', 'First pass: page %d');
    Add('prRunning', 'Preparing page %d');
    Add('prPrinting', 'Printing page %d');
    Add('prExporting', 'Exporting page %d');
    Add('uCm', 'cm');
    Add('uInch', 'pol');
    Add('uPix', 'px');
    Add('uChar', 'car');
  end;
end;


initialization
  frAddClassesRes;

end.