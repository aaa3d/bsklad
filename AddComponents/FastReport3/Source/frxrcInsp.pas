
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
    Add('propActive', 'Especifica se o Dataset está aberto ou não');
    Add('propActive.TfrxHighlight', 'Especifica se o destaque(highlight) está ativo');
    Add('propAliasName', 'O nome do alias BDE');
    Add('propAlign', 'Determina o alinhamento do objeto em relação à banda ou página');
    Add('propAlignment', 'O alinhamento do texto do objeto');
    Add('propAllowAllUp', 'Especifica se todos os speed buttons no grupo podem ser desmarcados ao mesmo tempo');
    Add('propAllowEdit', 'Determina se o usuário pode editar as páginas do relatório preparado');
    Add('propAllowExpressions', 'Determina se o objeto de texto pode conter expressões dentro do texto');
    Add('propAllowGrayed', 'Permite o estado acinzentado dos checkboxes');
    Add('propAllowHTMLTags', 'Determina se o objeto de texto pode conter tags HTML no seu conteúdo');
    Add('propAllowSplit', 'Determina se a banda pode dividir seu conteúdo entre páginas');
    Add('propAuthor', 'O autor do relatório');
    Add('propAutoSize', 'Determina se a figura deve definir seu tamanho automaticamente');
    Add('propAutoWidth', 'Determina se o objeto de texto deve definir sua largura automaticamente');
    Add('propBackPicture', 'A figura de fundo da página');
    Add('propBarType', 'O tipo do código de barras');
    Add('propBevelInner', 'O tipo de relevo interno');
    Add('propBevelOuter', 'O tipo de relevo externo');
    Add('propBevelWidth', 'A largura do relevo');
    Add('propBorder', 'Determina se a borda externa deve ser mostrada ou não');
    Add('propBorderStyle', 'O estilo da janela');
    Add('propBottomMargin', 'O tamanho da margem inferior da página');
    Add('propBrushStyle', 'O estilo do pincel usado para o fundo do objeto');
    Add('propButtons', 'Conjunto de botões visíveis na janela de visualização');
    Add('propCacheSize', 'Quantidade máxima de memória usada pelo mecanismo do relatório. Se o uso de memória exceder este valor, as páginas preparadas serão armazenadas em um arquivo no disco');
    Add('propCalcCheckSum', 'Determina se o código de barras deve calcular o dígito verificador automaticamente');
    Add('propCancel', 'Determina se o botão deve ser ativado quando a tecla Esc for pressionada');
    Add('propCaption', 'O rótulo do controle');
    Add('propCellFields', 'Nomes dos campos do BD representam as células do cruzamento');
    Add('propCellLevels', 'Número de níveis de células');
    Add('propCenter', 'Determina se a imagem deve ser centralizada dentro do controle');
    Add('propCharset', 'O conjunto de caracteres da fonte');
    Add('propCharSpacing', 'Quantidade de pixels entre dois caracteres');
    Add('propCheckColor', 'A cor da marca');
    Add('propChecked', 'Determina se o controle está marcado');
    Add('propCheckStyle', 'O estilo da marca');
    Add('propChild', 'Banda filha conectada a esta banda');
    Add('propCollate', 'Configuração padrão de agrupamento');
    Add('propColor.TFont', 'A cor do texto');
    Add('propColor', 'A cor do objeto');
    Add('propColor.TfrxFrame', 'A cor da borda');
    Add('propColor.TfrxHighlight', 'Determina a cor do objeto se o destaque (highlight) está ativo');
    Add('propColumnFields', 'Nomes dos campos do BD representando as colunas do cruzamento');
    Add('propColumnGap', 'O espaço entre colunas da banda');
    Add('propColumnLevels', 'Número de níveis de colunas');
    Add('propColumns', 'Número de colunas na banda');
    Add('propColumnWidth', 'A largura da coluna da banda');
    Add('propCondition', 'A condição de agrupamento. O grupo irá quebrar se o valor desta expressão mudar');
    Add('propCondition.TfrxHighlight', 'String de expressão. Se esta expressão for Verdadeira, o destaque será ativado.');
    Add('propConnected', 'Indica se a conexão com o banco de dados está ativa');
    Add('propConvertNulls', 'Determina se valores nulos do BD serão convertidos para 0, Falso ou string vazia');
    Add('propCopies', 'O número padrão de cópias');
    Add('propCursor', 'O cursor do objeto');
    Add('propDatabaseName', 'O nome do banco de dados');
    Add('propDataField', 'Especifica o campo do qual o objeto obtém seus dados');
    Add('propDataSet', 'Liga o objeto ao dataset que contém o campo que ele representa');
    Add('propDate', 'O valor de data do controle');
    Add('propDateFormat', 'Especifica o formato em que a data é apresentada');
    Add('propDecimalSeparator', 'O separador decimal');
    Add('propDefault', 'Determina se o botão é o botão padrão');
    Add('propDefHeight', 'Altura padrão da linha');
    Add('propDescription', 'A descrição do relatório');
    Add('propDiagonal', 'Indica que a linha é diagonal');
    Add('propDisplayFormat', 'O formato do valor exibido');
    Add('propDoubleBuffered', 'Determina se a janela de visualização usa buffering duplo. Buffering duplo habilitado previne o "flickering", porém é mais lento');
    Add('propDoublePass', 'Determina se o mecanismo do relatório deve realizar um segundo passo');
    Add('propDown', 'Determina se o speed button está pressionado ou não');
    Add('propDownThenAcross', 'Determina como uma tabela cruzada grande será dividida entre páginas');
    Add('propDriverName', 'O nome do driver BDE');
    Add('propDropShadow', 'Determina se o objeto possui sombra');
    Add('propDuplex', 'Especifica o modo duplex para a página');
    Add('propEditMask', 'Especifica a máscara que representa que texto é válido para o controle Edit com máscara');
    Add('propEnabled', 'Determina se o controle está habilitado');
    Add('propEngineOptions', 'As opções do mecanismo do relatório');
    Add('propExpression', 'O valor desta expressão será exibido no objeto');
    Add('propExpressionDelimiters', 'Os caracteres que serão usados para delimitar as expressões contidas no texto');
    Add('propFieldAliases', 'Os apelidos dos campos do dataset');
    Add('propFilter', 'A condição de filtragem para o dataset');
    Add('propFiltered', 'Determina se o dataset deve filtrar os registros usando a condição na propriedade Filter');
    Add('propFlowTo', 'O objeto de texto que mostrará o texto que não couber no objeto');
    Add('propFont', 'Os atributos da fonte do objeto');
    Add('propFooterAfterEach', 'Determina se a banda de rodapé deverá ser mostrada após cada linha de dados');
    Add('propFormatStr', 'A string de formatação');
    Add('propFrame', 'Os atributos da borda do objeto');
    Add('propGapX', 'A endentação esquerda do texto');
    Add('propGapY', 'A endentação superior do texto');
    Add('propGlyph', 'A imagem do controle');
    Add('propGroupIndex', 'Permite aos speed buttons funcionar juntos como um grupo');
    Add('propHAlign', 'O alinhamento horizontal do texto');
    Add('propHeight', 'A altura do objeto');
    Add('propHGuides', 'As guias horizontais da página');
    Add('propHideZeros', 'Determina se o objeto de texto esconderá os valores zerados');
    Add('propHighlight', 'Os atributos do destaque condicional');
    Add('propIndexName', 'O nome do índice');
    Add('propInitString', 'String de inicialização da impressora para relatórios matriciais');
    Add('propItems', 'Itens de lista do objeto');
    Add('propKeepAspectRatio', 'Manter o tamanho proporcional da imagem');
    Add('propKeepChild', 'Determina se a banda será impressa junto de sua banda filha');
    Add('propKeepFooter', 'Determina se a banda será impressa junto de seu rodapé');
    Add('propKeepHeader', 'Determines whether the band will be printed together with its header');
    Add('propKeepTogether', 'Determina se a banda será impressa junto de todas suas sub-bandas');
    Add('propKind.TfrxFormat', 'O tipo de formatação');
    Add('propKind', 'O tipo de botão');
    Add('propLargeDesignHeight', 'Determina se a página possuirá altura extensa no modo de design');
    Add('propLayout', 'O layout do glyph do botão');
    Add('propLeft', 'A coordenada esquerda do objeto');
    Add('propLeftMargin', 'O tamanho da margem esquerda da página');
    Add('propLines', 'O texto do objeto');
    Add('propLineSpacing', 'A quantidade de pixels entre duas linhas de texto');
    Add('propLoginPrompt', 'Determina se o diálogo de login deverá ser mostrado');
    Add('propMargin', 'Determina o número de pixels entre a borda da imagem e a borda do botão');
    Add('propMaster', 'O dataset mestre');
    Add('propMasterFields', 'Os campos ligados por relação mestre-detalhe');
    Add('propMaximized', 'Determina se a janela de visualização deverá ser maximizada');
    Add('propMaxLength', 'Tamanho máximo do texto');
    Add('propMaxPages', 'Número máximo de páginas no relatório preparado');
    Add('propMaxWidth', 'Largura máxima da coluna');
    Add('propMDIChild', 'Determina se a janela de visualização será uma MDI filha');
    Add('propMemo', 'O texto do objeto');
    Add('propMinWidth', 'Largura mínima da coluna');
    Add('propMirrorMargins', 'Espelha as margens nas páginas pares');
    Add('propModal', 'Determina se a janela de visualização será exibida de forma modal');
    Add('propModalResult', 'Determina se e como o botão fecha seu formulário modal');
    Add('propName.TFont', 'O nome da fonte');
    Add('propName.TfrxReportOptions', 'O nome do relatório');
    Add('propName', 'O nome do objeto');
    Add('propNumGlyphs', 'Indica o número de imagens no gráfico especificado na propriedade Glyph');
    Add('propOpenDataSource', 'Determina se a fonte de dados deve ser aberta automaticamente ou não');
    Add('propOrientation', 'A orientação da página');
    Add('propOutlineText', 'O texto que será mostrado no controle de resumo da visualização');
    Add('propOutlineVisible', 'A visibilidade do controle de resumo da visualização');
    Add('propOutlineWidth', 'A largura do controle de resumo da visualização ');
    Add('propPageNumbers.TfrxPrintOptions', 'O número das páginas a serem impressas.');
    Add('propPaperHeight', 'A altura da página');
    Add('propPaperWidth', 'A largura da página');
    Add('propParagraphGap', 'A endentação da primeira linha do parágrafo');
    Add('propParams.TfrxBDEDatabase', 'Os parâmetros da conexão');
    Add('propParams', 'Os parâmetros da query');
    Add('propParentFont', 'Determina se o objeto usará a fonte de seu objeto pai');
    Add('propPassword', 'A senha do relatório');
    Add('propPasswordChar', 'Indica o caractere, se algum, a ser mostrado no lugar dos caracteres reais digitados no controle');
    Add('propPicture', 'A figura');
    Add('propPicture.TfrxReportOptions', 'A figura descritiva do relatório');
    Add('propPosition', 'A posição inicial da janela');
    Add('propPreviewOptions', 'As opções de visualização do relatório');
    Add('propPrintable', 'Se o objeto será impresso. Objetos com Printable=False serão visualizados, mas não impressos');
    Add('propPrintChildIfInvisible', 'Determina se a banda filha será impressa caso sua banda pai seja invisível');
    Add('propPrinter', 'O nome da impressora que será selecionada quando este relatório for aberto ou executado');
    Add('propPrintIfDetailEmpty', 'Determina se a banda de dados será impressa caso sua sub-banda esteja vazia');
    Add('propPrintIfEmpty', 'Determina se a página será impressa caso todos os seus datasets estejam vazios');
    Add('propPrintOnFirstPage', 'Determina se a banda será impressa na primeira página');
    Add('propPrintOnLastPage', 'Determina se a banda será impressa na última página');
    Add('propPrintOnParent', 'Determina se o sub-relatório será impresso em sua banda pai');
    Add('propPrintOnPreviousPage', 'Determina se a página pode ser gerada no espaço livre da página gerada anteriormente');
    Add('propPrintOptions', 'Opções de impressão do relatório');
    Add('propPrintPages', 'Determina a impressão de todas as páginas, somente as ímpares ou somente as pares');
    Add('propRangeBegin', 'Determina o ponto inicial de navegação no dataset');
    Add('propRangeEnd', 'Determina o ponto final de navegação no dataset');
    Add('propRangeEndCount', 'Determina o número de registros no dataset se RangeEnd for reCount');
    Add('propReadOnly', 'Determina se o objeto de texto é somente leitura');
    Add('propRepeatHeaders', 'Determina se os cabeçalhos de coluna e linha serão reimpressos em uma nova página');
    Add('propReportOptions', 'As opções do relatório');
    Add('propReprintOnNewPage', 'Determina se a banda será reimpressa em uma nova página');
    Add('propRestrictions', 'Conjunto de sinais de restrição');
    Add('propRightMargin', 'O tamanho da margem direita da página');
    Add('propRotation.TfrxBarCodeView', 'A orientação do código de barras');
    Add('propRotation', 'A rotação do texto');
    Add('propRowCount', 'Número de registros virtuais na banda de dados');
    Add('propRowFields', 'Nomes dos campos de BD representando as linhas de cruzamento');
    Add('propRowLevels', 'Número de níveis de linhas');
    Add('propRTLReading', 'Determina se o objeto de texto mostrará seu conteúdo no sentido da direita para a esquerda');
    Add('propScriptLanguage', 'O nome da linguagem de script usada no relatório');
    Add('propSessionName', 'O nome da sessão BDE');
    Add('propShadowColor', 'A cor da sombra');
    Add('propShadowWidth', 'A largura da sombra');
    Add('propShape', 'O tipo de forma');
    Add('propShiftMode', 'O comportamento de deslocamento do objeto');
    Add('propShowCaptions', 'Determina se os botões da visualização mostrarão seus rótulos');
    Add('propShowColumnHeader', 'Determina se o cruzamento mostrará os cabeçalhos das colunas');
    Add('propShowColumnTotal', 'Determina se o cruzamento mostrará o total geral da coluna');
    Add('propShowRowHeader', 'Determina se o cruzamento mostrará os cabeçalhos das linhas');
    Add('propShowRowTotal', 'Determina se o cruzamento mostrará o total geral da linha');
    Add('propShowDialog', 'Determina se o diálogo de impressão será mostrado na janela de visualização');
    Add('propShowText', 'Determina se o objeto código de barras mostrará texto em formato legível');
    Add('propSize', 'O tamanho da fonte');
    Add('propSorted', 'Determina se os itens estão ordenados ou não');
    Add('propSpacing', 'Determina o número de pixels entre a imagem e o texto');
    Add('propSQL', 'A declaração SQL');
    Add('propStartNewPage', 'Inicia uma nova página antes de imprimir a banda');
    Add('propStretch', 'Estica a figura para caber nos limites do objeto');
    Add('propStretched', 'Determina se o objeto pode ser esticado');
    Add('propStretchMode', 'Modo para esticar o objeto');
    Add('propStyle.TFont', 'O estilo da fonte');
    Add('propStyle', 'O estilo do controle');
    Add('propStyle.TfrxFrame', 'O estilo da borda do objeto');
    Add('propSuppressRepeated', 'Suprime valores repetidos');
    Add('propTableName', 'O nome da tabela de dados');
    Add('propTag', 'O número de marca do objeto');
    Add('propTagStr', 'A string de marca do objeto');
    Add('propText', 'O texto do objeto');
    Add('propTitleBeforeHeader', 'Determina se o título do relatório deve ser mostrado antes do cabeçalho da página');
    Add('propTop', 'A coordenada superior do objeto');
    Add('propTopMargin', 'O tamanho da margem superior da página');
    Add('propTyp', 'O tipo da borda');
    Add('propUnderlines', 'Determina se o objeto de texto mostrará linhas de grade após cada linha de texto');
    Add('propURL', 'O URL do objeto');
    Add('propUserName', 'Nome do usuário do objeto de dados. Este nome será mostrado na árvore de dados');
    Add('propVAlign', 'O alinhamento vertical do texto');
    Add('propVersionBuild', 'Informação de versão, compilação');
    Add('propVersionMajor', 'Informação de versão, versão maior');
    Add('propVersionMinor', 'Informação de versão, versão menor');
    Add('propVersionRelease', 'Informação de versão, liberação');
    Add('propVGuides', 'As guias verticais da página');
    Add('propVisible', 'Visibilidade do objeto');
    Add('propWidth', 'Largura do objeto');
    Add('propWidth.TfrxFrame', 'A largura da borda');
    Add('propWindowState', 'Estado inicial da janela');
    Add('propWordBreak', 'Quebrar palavras em russo');
    Add('propWordWrap', 'Determina se o objeto de texto insere retornos de carro suaves para que o texto quebre na margem direita');
    Add('propZoom.TfrxBarCodeView', 'Zooms para o código de barras');
    Add('propZoom', 'Fator inicial de zoom da janela de visualização');
    Add('propZoomMode', 'Modo inicial de zoom de janela de visualização');
  end;
end;


initialization
  frAddInspectorRes;

end.
