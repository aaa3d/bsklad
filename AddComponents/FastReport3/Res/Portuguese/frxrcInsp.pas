
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
    Add('propActive', 'Especifica se um dataset est� aberto ou n�o');
    Add('propActive.TfrxHighlight', 'Especifica se o destaque est� activo');
    Add('propAliasName', 'Nome do alias BDE');
    Add('propAlign', 'Determina o alinhamento do objecto relativamente � banda ou p�gina');
    Add('propAlignment', 'O alinhamento do texto do objecto');
    Add('propAllowAllUp', 'Especifica se todos os bot�es r�pidos do grupo podem estar desseleccionados simult�neamente');
    Add('propAllowEdit', 'Determina se o utilizador pode editar as p�ginas do relat�rio preparado');
    Add('propAllowExpressions', 'Determina se o texto do objecto pode conter express�es');
    Add('propAllowGrayed', 'Permite estado indefinido das caixas de verifica��o');
    Add('propAllowHTMLTags', 'Determina se o texto pode conter HTML');
    Add('propAllowSplit', 'Determina se a banda pode dividir o conte�do entre p�ginas');
    Add('propAuthor', 'O autor do relat�rio');
    Add('propAutoSize', 'Determina se a figura dever� alterar o seu tamanho automaticamente');
    Add('propAutoWidth', 'Determina se o texto dever� alterar a sua largura automaticamente');
    Add('propBackPicture', 'Figura de fundo da p�gina');
    Add('propBarType', 'Tipo de C�digo de Barras');
    Add('propBevelInner', 'Tipo de relevo interior');
    Add('propBevelOuter', 'Tipo de relevo exterior');
    Add('propBevelWidth', 'Largura do relevo');
    Add('propBorder', 'Determina se o limite exterior � mostrado ou n�o');
    Add('propBorderStyle', 'Estilo da Janela');
    Add('propBottomMargin', 'Tamanho da margem inferior da p�gina');
    Add('propBrushStyle', 'Estilo de pincel utilizado para pintar o fundo do objecto');
    Add('propButtons', 'Conjunto de bot�es vis�veis na janela de pr�-visualiza��o');
    Add('propCacheSize', 'Quantidade m�xima de mem�ria utilizada pelo motor de relat�rios. Se a quantidade de mem�ria utilizada exceder este valor, as p�ginas preparadas ser�o armazenadas em disco');
    Add('propCalcCheckSum', 'Determina se o d�gito de verifica��o do c�digo de barras deve ser calculado automaticamente');
    Add('propCancel', 'Determina se o bot�o deve ser activado quando prime a tecla <Esc>');
    Add('propCaption', 'R�tulo do Controlo');
    Add('propCellFields', 'Nomes dos campos da base de dados que representam as c�lulas cruzadas');
    Add('propCellLevels', 'N�mero de n�veis das c�lulas');
    Add('propCenter', 'Determina se a imagem deve ser centrada no interior do Controlo');
    Add('propCharset', 'Conjunto de caracteres do tipo de letra');
    Add('propCharSpacing', 'Quantidade de pixels entre caracteres');
    Add('propCheckColor', 'Cor da marca');
    Add('propChecked', 'Indica se o controlo est� marcado');
    Add('propCheckStyle', 'Estilo da marca');
    Add('propChild', 'Bandas "filhas" ligadas a esta banda');
    Add('propCollate', 'Configura��o padr�o para agrupamento');
    Add('propColor.TFont', 'Cor do texto');
    Add('propColor', 'Cor do objecto');
    Add('propColor.TfrxFrame', 'Cor dos limites');
    Add('propColor.TfrxHighlight', 'Determina a cor do objecto se o destaque estiver activado');
    Add('propColumnFields', 'Nome dos campos da base de dados que representam colunas cruzadas');
    Add('propColumnGap', 'Espa�o entre colunas da banda');
    Add('propColumnLevels', 'N�mero de n�veis das colunas');
    Add('propColumns', 'N�mero de colunas na banda');
    Add('propColumnWidth', 'Largura da coluna na banda');
    Add('propCondition', 'Express�o de agrupamento. O grupo muda quando o valor da express�o muda');
    Add('propCondition.TfrxHighlight', 'Se a express�o � verdadeira, o destaque � activado');
    Add('propConnected', 'Indica se a conex�o � base de dados est� activa');
    Add('propConvertNulls', 'Determina se o estado NULL � convertido para os valores 0, Falso or cadeia vazia');
    Add('propCopies', 'N�mero de c�pias padr�o');
    Add('propCursor', 'Cursor do objecto');
    Add('propDatabaseName', 'Nome da base de dados');
    Add('propDataField', 'Especifica o campo de onde o objecto obt�m dados');
    Add('propDataSet', 'Liga o objecto ao dataset que cont�m o campo apresentado');
    Add('propDate', 'O valor da data');
    Add('propDateFormat', 'Especifica o formato em que a data � apresentada');
    Add('propDecimalSeparator', 'Separador decimal');
    Add('propDefault', 'Determina se o bot�o � o bot�o padr�o');
    Add('propDefHeight', 'Altura padr�o da linha');
    Add('propDescription', 'Descri��o do relat�rio');
    Add('propDiagonal', 'Indica se a linha � diagonal');
    Add('propDisplayFormat', 'Formato do valor mostrado');
    Add('propDoubleBuffered', 'Determina se a janela de pr�-visualiza��o usa "double buffering". A utiliza��o de "double buffering" evita o efeito "flickering", mas � mais lento');
    Add('propDoublePass', 'Determina se o motor de relat�rios deve executar a segunda passagem');
    Add('propDown', 'Determina se o bot�o est� pressionado ou n�o');
    Add('propDownThenAcross', 'Determina o modo como uma tabela grande se distribui por v�rias p�ginas');
    Add('propDriverName', 'Nome do driver BDE');
    Add('propDropShadow', 'Determina se o objecto tem sombra');
    Add('propDuplex', 'Especifica o modo Duplex para a p�gina');
    Add('propEditMask', 'Especifica a m�scara de edi��o para o controlo');
    Add('propEnabled', 'Determina se o controlo est� activo');
    Add('propEngineOptions', 'Op��es do motor para o relat�rio');
    Add('propExpression', 'O valor desta express�o ser� mostrado no objecto');
    Add('propExpressionDelimiters', 'Caracteres que ser�o usados para delimitar express�es contidas no texto');
    Add('propFieldAliases', 'Aliases dos campos');
    Add('propFilter', 'Condi��o para o filtro de dados');
    Add('propFiltered', 'Determina se os dados devem ser filtrados utilizando a condi��o da propriedade Filter');
    Add('propFlowTo', 'Objecto que mostrar� o texto que n�o couber neste objecto');
    Add('propFont', 'Tipo de letra do objecto');
    Add('propFooterAfterEach', 'Determina se a banda de rodap� deve ser mostrada ap�s cada linha de dados');
    Add('propFormatStr', 'Formato');
    Add('propFrame', 'Atributos dos limites');
    Add('propGapX', 'Indenta��o esquerda do texto');
    Add('propGapY', 'Indenta��o superior do texto');
    Add('propGlyph', 'Imagem do controlo');
    Add('propGroupIndex', 'Junta os bot�es com o mesmo valor de GroupIndex no mesmo grupo');
    Add('propHAlign', 'Alinhamento horizontal do texto');
    Add('propHeight', 'Altura do objecto');
    Add('propHGuides', 'Guias horizontais da p�gina');
    Add('propHideZeros', 'Determina se o objecto de texto esconde os valores Zero');
    Add('propHighlight', 'Atributos do destaque condicional');
    Add('propIndexName', 'Nome do �ndice');
    Add('propInitString', 'Cadeia de inicializa��o da impressora para relat�rios matriciais');
    Add('propItems', 'Lista de itens do objecto');
    Add('propKeepAspectRatio', 'Manter a propor��o original das dimens�es da imagem');
    Add('propKeepChild', 'Determina se a banda ser� impressa unida �s suas filhas');
    Add('propKeepFooter', 'Determina se a banda ser� impressa unida ao seu rodap�');
    Add('propKeepHeader', 'Determina se a banda ser� impressa unida ao seu cabe�alho');
    Add('propKeepTogether', 'Determina se a banda ser� impressa unida a todas as suas sub-bandas');
    Add('propKind.TfrxFormat', 'Tipo de formata��o');
    Add('propKind', 'Tipo de bot�o');
    Add('propLargeDesignHeight', 'Determina se a p�gina ter� altura grande no modo de desenho');
    Add('propLayout', 'Posi��o da imagem no bot�o');
    Add('propLeft', 'Posi��o esquerda do objecto');
    Add('propLeftMargin', 'Tamanho da margem esquerda da p�gina');
    Add('propLines', 'Texto do objecto');
    Add('propLineSpacing', 'N�mero de pixels entre duas linhas de texto');
    Add('propLoginPrompt', 'Determina se a janela de Login deve ser mostrada');
    Add('propMargin', 'Determina o n�mero de pixels entre o canto da imagem e o canto do bot�o');
    Add('propMaster', 'Dataset mestre');
    Add('propMasterFields', 'Campos ligados por uma rela��o mestre-detalhe');
    Add('propMaximized', 'Determina se a janela de pr�-visualiza��o deve ser maximizada');
    Add('propMaxLength', 'Comprimento m�ximo do texto');
    Add('propMaxPages', 'N�mero m�ximo de p�ginas no relat�rio preparado');
    Add('propMaxWidth', 'Largura m�xima da coluna');
    Add('propMDIChild', 'Determina se a janela de pr�-visualiza��o ser� do tipo "MDI child"');
    Add('propMemo', 'Texto do objecto');
    Add('propMinWidth', 'Largura m�nima da coluna');
    Add('propMirrorMargins', 'Espelhar margens da p�gina nas p�ginas pares');
    Add('propModal', 'Determina se a janela de pr�-visualiza��o � "modal"');
    Add('propModalResult', 'Determina o modo como o bot�o fecha a janela');
    Add('propName.TFont', 'Nome do tipo de letra');
    Add('propName.TfrxReportOptions', 'Nome do relat�rio');
    Add('propName', 'Nome do objecto');
    Add('propNumGlyphs', 'Indica o n�mero de imagens que est�o no gr�fico especificado pela propriedade Glyph');
    Add('propOpenDataSource', 'Determina se a fonte de dados deve ser aberta automaticamente');
    Add('propOrientation', 'Orienta��o da p�gina');
    Add('propOutlineText', 'Texto que ser� mostrado no resumo da pr�-visualiza��o');
    Add('propOutlineVisible', 'Visibilidade do resumo na pr�-visualiza��o');
    Add('propOutlineWidth', 'Largura do resumo na pr�-visualiza��o');
    Add('propPageNumbers.TfrxPrintOptions', 'N�mero de p�ginas a imprimir');
    Add('propPaperHeight', 'Altura da p�gina');
    Add('propPaperWidth', 'Largura da p�gina');
    Add('propParagraphGap', 'Indenta��o da primeira linha do par�grafo');
    Add('propParams.TfrxBDEDatabase', 'Par�metros de conex�o');
    Add('propParams', 'Par�metros da Query');
    Add('propParentFont', 'Determina se o objecto utilizar� o tipo de letra do objecto pai');
    Add('propPassword', 'Password do relat�rio');
    Add('propPasswordChar', 'Indica o car�cter, se algum, a mostrar no lugar dos caracteres digitados');
    Add('propPicture', 'Figura');
    Add('propPicture.TfrxReportOptions', 'Figura descritiva do relat�rio');
    Add('propPosition', 'Posi��o inicial da janela');
    Add('propPreviewOptions', 'Op��es de pr�-visualiza��o do relat�rio');
    Add('propPrintable', 'Para impress�o. Objectos com Printable=False ser�o pr�-visualizados, mas n�o impressos');
    Add('propPrintChildIfInvisible', 'Determina se a banda filha ser� impressa se a sua banda m�e for invisivel');
    Add('propPrinter', 'Nome da impressora que ser� seleccionada quando este relat�rio for executado ou aberto');
    Add('propPrintIfDetailEmpty', 'Determina se a banda de dados ser� impressa se a sua sub-banda estiver vazia');
    Add('propPrintIfEmpty', 'Determina se a p�gina ser� impressa se todos os datasets estiverem vazios');
    Add('propPrintOnFirstPage', 'Determina se a banda ser� impressa na primeira p�gina');
    Add('propPrintOnLastPage', 'Determina se a banda ser� impressa na �ltima p�gina');
    Add('propPrintOnParent', 'Determina se o sub-relat�rio pode ser impresso na banda m�e');
    Add('propPrintOnPreviousPage', 'Determina se a p�gina pode ser gerada no espa�o livre da p�gina gerada anteriormente');
    Add('propPrintOptions', 'Op��es de impress�o do relat�rio');
    Add('propPrintPages', 'Determina se deve imprimir as p�ginas pares, �mpares ou todas');
    Add('propRangeBegin', 'Determina o ponto inicial de navega��o no dataset');
    Add('propRangeEnd', 'Determina o ponto final de navega��o no dataset');
    Add('propRangeEndCount', 'Determina o n�mero de registos do dataset se RangeEnd for reCount');
    Add('propReadOnly', 'Determina se o objecto de texto pode ser alterado');
    Add('propRepeatHeaders', 'Determina se os cabe�alhos de colunas e linhas ser�o reimpressos na nova p�gina');
    Add('propReportOptions', 'Op��es do relat�rio');
    Add('propReprintOnNewPage', 'Determina se a banda ser� reimpressa na nova p�gina');
    Add('propRestrictions', 'Conjunto de sinalizadores de restri��es');
    Add('propRightMargin', 'Tamanho da margem direita da p�gina');
    Add('propRotation.TfrxBarCodeView', 'Orienta��o do c�digo de barras');
    Add('propRotation', 'Rota��o do texto');
    Add('propRowCount', 'N�mero de registos virtuais na banda de dados');
    Add('propRowFields', 'Nomes dos campos representando linhas de cruzamento');
    Add('propRowLevels', 'N�mero de n�veis das linhas');
    Add('propRTLReading', 'Determina se o objecto de texto apresentar� o seu texto da direita para a esquerda');
    Add('propScriptLanguage', 'Nome da linguagem de script usada no relat�rio');
    Add('propSessionName', 'Nome da sess�o BDE');
    Add('propShadowColor', 'Cor da sombra');
    Add('propShadowWidth', 'Largura da sombra');
    Add('propShape', 'Tipo de forma');
    Add('propShiftMode', 'Modo de deslocamento do objecto');
    Add('propShowCaptions', 'Determina se os bot�es de pr�-visualiza��o mostram os seus r�tulos');
    Add('propShowColumnHeader', 'Determina se a grelha mostra cabe�alhos de colunas');
    Add('propShowColumnTotal', 'Determina se a grelha mostra o total geral das colunas');
    Add('propShowRowHeader', 'Determina se a grelha mostra os cabe�alhos das linhas');
    Add('propShowRowTotal', 'Determina se a grelha mostra os total geral das linhas');
    Add('propShowDialog', 'Determina se o di�logo de impress�o ser� mostrado na janela de pr�-visualiza��o');
    Add('propShowText', 'Determina se o c�digo de barras mostrar� o texto leg�vel');
    Add('propSize', 'Tamanho da letra');
    Add('propSorted', 'Determina se os itens ser�o ordenados ou n�o');
    Add('propSpacing', 'Determina o n�mero de pixels entre a imagem e o texto');
    Add('propSQL', 'Declara��o SQL');
    Add('propStartNewPage', 'Inicia uma nova p�gina antes de imprimir a banda');
    Add('propStretch', 'Estica a imagem para a ajustar aos limites do objecto');
    Add('propStretched', 'Determina se o objecto pode ser esticado');
    Add('propStretchMode', 'Modo de esticar o objecto');
    Add('propStyle.TFont', 'Estilo da letra');
    Add('propStyle', 'Estilo do controlo');
    Add('propStyle.TfrxFrame', 'Estilo dos limites do objecto');
    Add('propSuppressRepeated', 'Suprimir valores repetidos');
    Add('propTableName', 'Nome da tabela');
    Add('propTag', 'Propriedade num�rica gen�rica');
    Add('propTagStr', 'Propriedade texto gen�rica');
    Add('propText', 'Texto do objecto');
    Add('propTitleBeforeHeader', 'Determina se o t�tulo do relat�rio deve ser mostrado antes do cabe�alho da p�gina');
    Add('propTop', 'Posi��o superior do objecto');
    Add('propTopMargin', 'Tamanho da margem superior da p�gina');
    Add('propTyp', 'Tipo de limites');
    Add('propUnderlines', 'Determina se o objecto de texto mostrar� as linhas da grelha ap�s cada linha de texto');
    Add('propURL', 'URL do objecto');
    Add('propUserName', 'Utilizador do objecto de dados. Este nome ser� mostrado na �rvore de dados');
    Add('propVAlign', 'Alinhamento vertical do texto');
    Add('propVersionBuild', 'Informa��o sobre a vers�o, compila��o');
    Add('propVersionMajor', 'Informa��o sobre a vers�o, vers�o maior');
    Add('propVersionMinor', 'Informa��o sobre a vers�o, vers�o menor');
    Add('propVersionRelease', 'Informa��o sobre a vers�o, release');
    Add('propVGuides', 'Guias verticais da p�gina');
    Add('propVisible', 'Visibilidade do objecto');
    Add('propWidth', 'Largura do objecto');
    Add('propWidth.TfrxFrame', 'Largura dos limites');
    Add('propWindowState', 'Estado inicial da janela');
    Add('propWordBreak', 'Separar palavras russas');
    Add('propWordWrap', 'Determina se o objecto de texto insere mudan�as de linha "soft" de modo a que o texto se ajuste � direita');
    Add('propZoom.TfrxBarCodeView', 'Amplia o c�digo de barras');
    Add('propZoom', 'Factor inicial de zoom da janela de pr�-visualiza��o');
    Add('propZoomMode', 'Factor inicial de zoom da janela de pr�-visualiza��o');
  end;
end;


initialization
  frAddInspectorRes;

end.
