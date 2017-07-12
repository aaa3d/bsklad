
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

unit frxrcInsp;

interface

procedure frAddInspectorRes;


implementation

uses frxRes;


procedure frAddInspectorRes;
begin
  with frxResources do
  begin
    Add('propActive', 'Especifica se um dataset está aberto ou não');
    Add('propActive.TfrxHighlight', 'Especifica se o destaque está activo');
    Add('propAliasName', 'Nome do alias BDE');
    Add('propAlign', 'Determina o alinhamento do objecto relativamente à banda ou página');
    Add('propAlignment', 'O alinhamento do texto do objecto');
    Add('propAllowAllUp', 'Especifica se todos os botões rápidos do grupo podem estar desseleccionados simultâneamente');
    Add('propAllowEdit', 'Determina se o utilizador pode editar as páginas do relatório preparado');
    Add('propAllowExpressions', 'Determina se o texto do objecto pode conter expressões');
    Add('propAllowGrayed', 'Permite estado indefinido das caixas de verificação');
    Add('propAllowHTMLTags', 'Determina se o texto pode conter HTML');
    Add('propAllowSplit', 'Determina se a banda pode dividir o conteúdo entre páginas');
    Add('propAuthor', 'O autor do relatório');
    Add('propAutoSize', 'Determina se a figura deverá alterar o seu tamanho automaticamente');
    Add('propAutoWidth', 'Determina se o texto deverá alterar a sua largura automaticamente');
    Add('propBackPicture', 'Figura de fundo da página');
    Add('propBarType', 'Tipo de Código de Barras');
    Add('propBevelInner', 'Tipo de relevo interior');
    Add('propBevelOuter', 'Tipo de relevo exterior');
    Add('propBevelWidth', 'Largura do relevo');
    Add('propBorder', 'Determina se o limite exterior é mostrado ou não');
    Add('propBorderStyle', 'Estilo da Janela');
    Add('propBottomMargin', 'Tamanho da margem inferior da página');
    Add('propBrushStyle', 'Estilo de pincel utilizado para pintar o fundo do objecto');
    Add('propButtons', 'Conjunto de botões visíveis na janela de pré-visualização');
    Add('propCacheSize', 'Quantidade máxima de memória utilizada pelo motor de relatórios. Se a quantidade de memória utilizada exceder este valor, as páginas preparadas serão armazenadas em disco');
    Add('propCalcCheckSum', 'Determina se o dígito de verificação do código de barras deve ser calculado automaticamente');
    Add('propCancel', 'Determina se o botão deve ser activado quando prime a tecla <Esc>');
    Add('propCaption', 'Rótulo do Controlo');
    Add('propCellFields', 'Nomes dos campos da base de dados que representam as células cruzadas');
    Add('propCellLevels', 'Número de níveis das células');
    Add('propCenter', 'Determina se a imagem deve ser centrada no interior do Controlo');
    Add('propCharset', 'Conjunto de caracteres do tipo de letra');
    Add('propCharSpacing', 'Quantidade de pixels entre caracteres');
    Add('propCheckColor', 'Cor da marca');
    Add('propChecked', 'Indica se o controlo está marcado');
    Add('propCheckStyle', 'Estilo da marca');
    Add('propChild', 'Bandas "filhas" ligadas a esta banda');
    Add('propCollate', 'Configuração padrão para agrupamento');
    Add('propColor.TFont', 'Cor do texto');
    Add('propColor', 'Cor do objecto');
    Add('propColor.TfrxFrame', 'Cor dos limites');
    Add('propColor.TfrxHighlight', 'Determina a cor do objecto se o destaque estiver activado');
    Add('propColumnFields', 'Nome dos campos da base de dados que representam colunas cruzadas');
    Add('propColumnGap', 'Espaço entre colunas da banda');
    Add('propColumnLevels', 'Número de níveis das colunas');
    Add('propColumns', 'Número de colunas na banda');
    Add('propColumnWidth', 'Largura da coluna na banda');
    Add('propCondition', 'Expressão de agrupamento. O grupo muda quando o valor da expressão muda');
    Add('propCondition.TfrxHighlight', 'Se a expressão é verdadeira, o destaque é activado');
    Add('propConnected', 'Indica se a conexão à base de dados está activa');
    Add('propConvertNulls', 'Determina se o estado NULL é convertido para os valores 0, Falso or cadeia vazia');
    Add('propCopies', 'Número de cópias padrão');
    Add('propCursor', 'Cursor do objecto');
    Add('propDatabaseName', 'Nome da base de dados');
    Add('propDataField', 'Especifica o campo de onde o objecto obtém dados');
    Add('propDataSet', 'Liga o objecto ao dataset que contém o campo apresentado');
    Add('propDate', 'O valor da data');
    Add('propDateFormat', 'Especifica o formato em que a data é apresentada');
    Add('propDecimalSeparator', 'Separador decimal');
    Add('propDefault', 'Determina se o botão é o botão padrão');
    Add('propDefHeight', 'Altura padrão da linha');
    Add('propDescription', 'Descrição do relatório');
    Add('propDiagonal', 'Indica se a linha é diagonal');
    Add('propDisplayFormat', 'Formato do valor mostrado');
    Add('propDoubleBuffered', 'Determina se a janela de pré-visualização usa "double buffering". A utilização de "double buffering" evita o efeito "flickering", mas é mais lento');
    Add('propDoublePass', 'Determina se o motor de relatórios deve executar a segunda passagem');
    Add('propDown', 'Determina se o botão está pressionado ou não');
    Add('propDownThenAcross', 'Determina o modo como uma tabela grande se distribui por várias páginas');
    Add('propDriverName', 'Nome do driver BDE');
    Add('propDropShadow', 'Determina se o objecto tem sombra');
    Add('propDuplex', 'Especifica o modo Duplex para a página');
    Add('propEditMask', 'Especifica a máscara de edição para o controlo');
    Add('propEnabled', 'Determina se o controlo está activo');
    Add('propEngineOptions', 'Opções do motor para o relatório');
    Add('propExpression', 'O valor desta expressão será mostrado no objecto');
    Add('propExpressionDelimiters', 'Caracteres que serão usados para delimitar expressões contidas no texto');
    Add('propFieldAliases', 'Aliases dos campos');
    Add('propFilter', 'Condição para o filtro de dados');
    Add('propFiltered', 'Determina se os dados devem ser filtrados utilizando a condição da propriedade Filter');
    Add('propFlowTo', 'Objecto que mostrará o texto que não couber neste objecto');
    Add('propFont', 'Tipo de letra do objecto');
    Add('propFooterAfterEach', 'Determina se a banda de rodapé deve ser mostrada após cada linha de dados');
    Add('propFormatStr', 'Formato');
    Add('propFrame', 'Atributos dos limites');
    Add('propGapX', 'Indentação esquerda do texto');
    Add('propGapY', 'Indentação superior do texto');
    Add('propGlyph', 'Imagem do controlo');
    Add('propGroupIndex', 'Junta os botões com o mesmo valor de GroupIndex no mesmo grupo');
    Add('propHAlign', 'Alinhamento horizontal do texto');
    Add('propHeight', 'Altura do objecto');
    Add('propHGuides', 'Guias horizontais da página');
    Add('propHideZeros', 'Determina se o objecto de texto esconde os valores Zero');
    Add('propHighlight', 'Atributos do destaque condicional');
    Add('propIndexName', 'Nome do índice');
    Add('propInitString', 'Cadeia de inicialização da impressora para relatórios matriciais');
    Add('propItems', 'Lista de itens do objecto');
    Add('propKeepAspectRatio', 'Manter a proporção original das dimensões da imagem');
    Add('propKeepChild', 'Determina se a banda será impressa unida às suas filhas');
    Add('propKeepFooter', 'Determina se a banda será impressa unida ao seu rodapé');
    Add('propKeepHeader', 'Determina se a banda será impressa unida ao seu cabeçalho');
    Add('propKeepTogether', 'Determina se a banda será impressa unida a todas as suas sub-bandas');
    Add('propKind.TfrxFormat', 'Tipo de formatação');
    Add('propKind', 'Tipo de botão');
    Add('propLargeDesignHeight', 'Determina se a página terá altura grande no modo de desenho');
    Add('propLayout', 'Posição da imagem no botão');
    Add('propLeft', 'Posição esquerda do objecto');
    Add('propLeftMargin', 'Tamanho da margem esquerda da página');
    Add('propLines', 'Texto do objecto');
    Add('propLineSpacing', 'Número de pixels entre duas linhas de texto');
    Add('propLoginPrompt', 'Determina se a janela de Login deve ser mostrada');
    Add('propMargin', 'Determina o número de pixels entre o canto da imagem e o canto do botão');
    Add('propMaster', 'Dataset mestre');
    Add('propMasterFields', 'Campos ligados por uma relação mestre-detalhe');
    Add('propMaximized', 'Determina se a janela de pré-visualização deve ser maximizada');
    Add('propMaxLength', 'Comprimento máximo do texto');
    Add('propMaxPages', 'Número máximo de páginas no relatório preparado');
    Add('propMaxWidth', 'Largura máxima da coluna');
    Add('propMDIChild', 'Determina se a janela de pré-visualização será do tipo "MDI child"');
    Add('propMemo', 'Texto do objecto');
    Add('propMinWidth', 'Largura mínima da coluna');
    Add('propMirrorMargins', 'Espelhar margens da página nas páginas pares');
    Add('propModal', 'Determina se a janela de pré-visualização é "modal"');
    Add('propModalResult', 'Determina o modo como o botão fecha a janela');
    Add('propName.TFont', 'Nome do tipo de letra');
    Add('propName.TfrxReportOptions', 'Nome do relatório');
    Add('propName', 'Nome do objecto');
    Add('propNumGlyphs', 'Indica o número de imagens que estão no gráfico especificado pela propriedade Glyph');
    Add('propOpenDataSource', 'Determina se a fonte de dados deve ser aberta automaticamente');
    Add('propOrientation', 'Orientação da página');
    Add('propOutlineText', 'Texto que será mostrado no resumo da pré-visualização');
    Add('propOutlineVisible', 'Visibilidade do resumo na pré-visualização');
    Add('propOutlineWidth', 'Largura do resumo na pré-visualização');
    Add('propPageNumbers.TfrxPrintOptions', 'Número de páginas a imprimir');
    Add('propPaperHeight', 'Altura da página');
    Add('propPaperWidth', 'Largura da página');
    Add('propParagraphGap', 'Indentação da primeira linha do parágrafo');
    Add('propParams.TfrxBDEDatabase', 'Parâmetros de conexão');
    Add('propParams', 'Parâmetros da Query');
    Add('propParentFont', 'Determina se o objecto utilizará o tipo de letra do objecto pai');
    Add('propPassword', 'Password do relatório');
    Add('propPasswordChar', 'Indica o carácter, se algum, a mostrar no lugar dos caracteres digitados');
    Add('propPicture', 'Figura');
    Add('propPicture.TfrxReportOptions', 'Figura descritiva do relatório');
    Add('propPosition', 'Posição inicial da janela');
    Add('propPreviewOptions', 'Opções de pré-visualização do relatório');
    Add('propPrintable', 'Para impressão. Objectos com Printable=False serão pré-visualizados, mas não impressos');
    Add('propPrintChildIfInvisible', 'Determina se a banda filha será impressa se a sua banda mãe for invisivel');
    Add('propPrinter', 'Nome da impressora que será seleccionada quando este relatório for executado ou aberto');
    Add('propPrintIfDetailEmpty', 'Determina se a banda de dados será impressa se a sua sub-banda estiver vazia');
    Add('propPrintIfEmpty', 'Determina se a página será impressa se todos os datasets estiverem vazios');
    Add('propPrintOnFirstPage', 'Determina se a banda será impressa na primeira página');
    Add('propPrintOnLastPage', 'Determina se a banda será impressa na última página');
    Add('propPrintOnParent', 'Determina se o sub-relatório pode ser impresso na banda mãe');
    Add('propPrintOnPreviousPage', 'Determina se a página pode ser gerada no espaço livre da página gerada anteriormente');
    Add('propPrintOptions', 'Opções de impressão do relatório');
    Add('propPrintPages', 'Determina se deve imprimir as páginas pares, ímpares ou todas');
    Add('propRangeBegin', 'Determina o ponto inicial de navegação no dataset');
    Add('propRangeEnd', 'Determina o ponto final de navegação no dataset');
    Add('propRangeEndCount', 'Determina o número de registos do dataset se RangeEnd for reCount');
    Add('propReadOnly', 'Determina se o objecto de texto pode ser alterado');
    Add('propRepeatHeaders', 'Determina se os cabeçalhos de colunas e linhas serão reimpressos na nova página');
    Add('propReportOptions', 'Opções do relatório');
    Add('propReprintOnNewPage', 'Determina se a banda será reimpressa na nova página');
    Add('propRestrictions', 'Conjunto de sinalizadores de restrições');
    Add('propRightMargin', 'Tamanho da margem direita da página');
    Add('propRotation.TfrxBarCodeView', 'Orientação do código de barras');
    Add('propRotation', 'Rotação do texto');
    Add('propRowCount', 'Número de registos virtuais na banda de dados');
    Add('propRowFields', 'Nomes dos campos representando linhas de cruzamento');
    Add('propRowLevels', 'Número de níveis das linhas');
    Add('propRTLReading', 'Determina se o objecto de texto apresentará o seu texto da direita para a esquerda');
    Add('propScriptLanguage', 'Nome da linguagem de script usada no relatório');
    Add('propSessionName', 'Nome da sessão BDE');
    Add('propShadowColor', 'Cor da sombra');
    Add('propShadowWidth', 'Largura da sombra');
    Add('propShape', 'Tipo de forma');
    Add('propShiftMode', 'Modo de deslocamento do objecto');
    Add('propShowCaptions', 'Determina se os botões de pré-visualização mostram os seus rótulos');
    Add('propShowColumnHeader', 'Determina se a grelha mostra cabeçalhos de colunas');
    Add('propShowColumnTotal', 'Determina se a grelha mostra o total geral das colunas');
    Add('propShowRowHeader', 'Determina se a grelha mostra os cabeçalhos das linhas');
    Add('propShowRowTotal', 'Determina se a grelha mostra os total geral das linhas');
    Add('propShowDialog', 'Determina se o diálogo de impressão será mostrado na janela de pré-visualização');
    Add('propShowText', 'Determina se o código de barras mostrará o texto legível');
    Add('propSize', 'Tamanho da letra');
    Add('propSorted', 'Determina se os itens serão ordenados ou não');
    Add('propSpacing', 'Determina o número de pixels entre a imagem e o texto');
    Add('propSQL', 'Declaração SQL');
    Add('propStartNewPage', 'Inicia uma nova página antes de imprimir a banda');
    Add('propStretch', 'Estica a imagem para a ajustar aos limites do objecto');
    Add('propStretched', 'Determina se o objecto pode ser esticado');
    Add('propStretchMode', 'Modo de esticar o objecto');
    Add('propStyle.TFont', 'Estilo da letra');
    Add('propStyle', 'Estilo do controlo');
    Add('propStyle.TfrxFrame', 'Estilo dos limites do objecto');
    Add('propSuppressRepeated', 'Suprimir valores repetidos');
    Add('propTableName', 'Nome da tabela');
    Add('propTag', 'Propriedade numérica genérica');
    Add('propTagStr', 'Propriedade texto genérica');
    Add('propText', 'Texto do objecto');
    Add('propTitleBeforeHeader', 'Determina se o título do relatório deve ser mostrado antes do cabeçalho da página');
    Add('propTop', 'Posição superior do objecto');
    Add('propTopMargin', 'Tamanho da margem superior da página');
    Add('propTyp', 'Tipo de limites');
    Add('propUnderlines', 'Determina se o objecto de texto mostrará as linhas da grelha após cada linha de texto');
    Add('propURL', 'URL do objecto');
    Add('propUserName', 'Utilizador do objecto de dados. Este nome será mostrado na árvore de dados');
    Add('propVAlign', 'Alinhamento vertical do texto');
    Add('propVersionBuild', 'Informação sobre a versão, compilação');
    Add('propVersionMajor', 'Informação sobre a versão, versão maior');
    Add('propVersionMinor', 'Informação sobre a versão, versão menor');
    Add('propVersionRelease', 'Informação sobre a versão, release');
    Add('propVGuides', 'Guias verticais da página');
    Add('propVisible', 'Visibilidade do objecto');
    Add('propWidth', 'Largura do objecto');
    Add('propWidth.TfrxFrame', 'Largura dos limites');
    Add('propWindowState', 'Estado inicial da janela');
    Add('propWordBreak', 'Separar palavras russas');
    Add('propWordWrap', 'Determina se o objecto de texto insere mudanças de linha "soft" de modo a que o texto se ajuste à direita');
    Add('propZoom.TfrxBarCodeView', 'Amplia o código de barras');
    Add('propZoom', 'Factor inicial de zoom da janela de pré-visualização');
    Add('propZoomMode', 'Factor inicial de zoom da janela de pré-visualização');
  end;
end;


initialization
  frAddInspectorRes;

end.
