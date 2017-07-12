
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
    Add('propActive', 'Especifica se o Dataset est� aberto ou n�o');
    Add('propActive.TfrxHighlight', 'Especifica se o destaque(highlight) est� ativo');
    Add('propAliasName', 'O nome do alias BDE');
    Add('propAlign', 'Determina o alinhamento do objeto em rela��o � banda ou p�gina');
    Add('propAlignment', 'O alinhamento do texto do objeto');
    Add('propAllowAllUp', 'Especifica se todos os speed buttons no grupo podem ser desmarcados ao mesmo tempo');
    Add('propAllowEdit', 'Determina se o usu�rio pode editar as p�ginas do relat�rio preparado');
    Add('propAllowExpressions', 'Determina se o objeto de texto pode conter express�es dentro do texto');
    Add('propAllowGrayed', 'Permite o estado acinzentado dos checkboxes');
    Add('propAllowHTMLTags', 'Determina se o objeto de texto pode conter tags HTML no seu conte�do');
    Add('propAllowSplit', 'Determina se a banda pode dividir seu conte�do entre p�ginas');
    Add('propAuthor', 'O autor do relat�rio');
    Add('propAutoSize', 'Determina se a figura deve definir seu tamanho automaticamente');
    Add('propAutoWidth', 'Determina se o objeto de texto deve definir sua largura automaticamente');
    Add('propBackPicture', 'A figura de fundo da p�gina');
    Add('propBarType', 'O tipo do c�digo de barras');
    Add('propBevelInner', 'O tipo de relevo interno');
    Add('propBevelOuter', 'O tipo de relevo externo');
    Add('propBevelWidth', 'A largura do relevo');
    Add('propBorder', 'Determina se a borda externa deve ser mostrada ou n�o');
    Add('propBorderStyle', 'O estilo da janela');
    Add('propBottomMargin', 'O tamanho da margem inferior da p�gina');
    Add('propBrushStyle', 'O estilo do pincel usado para o fundo do objeto');
    Add('propButtons', 'Conjunto de bot�es vis�veis na janela de visualiza��o');
    Add('propCacheSize', 'Quantidade m�xima de mem�ria usada pelo mecanismo do relat�rio. Se o uso de mem�ria exceder este valor, as p�ginas preparadas ser�o armazenadas em um arquivo no disco');
    Add('propCalcCheckSum', 'Determina se o c�digo de barras deve calcular o d�gito verificador automaticamente');
    Add('propCancel', 'Determina se o bot�o deve ser ativado quando a tecla Esc for pressionada');
    Add('propCaption', 'O r�tulo do controle');
    Add('propCellFields', 'Nomes dos campos do BD representam as c�lulas do cruzamento');
    Add('propCellLevels', 'N�mero de n�veis de c�lulas');
    Add('propCenter', 'Determina se a imagem deve ser centralizada dentro do controle');
    Add('propCharset', 'O conjunto de caracteres da fonte');
    Add('propCharSpacing', 'Quantidade de pixels entre dois caracteres');
    Add('propCheckColor', 'A cor da marca');
    Add('propChecked', 'Determina se o controle est� marcado');
    Add('propCheckStyle', 'O estilo da marca');
    Add('propChild', 'Banda filha conectada a esta banda');
    Add('propCollate', 'Configura��o padr�o de agrupamento');
    Add('propColor.TFont', 'A cor do texto');
    Add('propColor', 'A cor do objeto');
    Add('propColor.TfrxFrame', 'A cor da borda');
    Add('propColor.TfrxHighlight', 'Determina a cor do objeto se o destaque (highlight) est� ativo');
    Add('propColumnFields', 'Nomes dos campos do BD representando as colunas do cruzamento');
    Add('propColumnGap', 'O espa�o entre colunas da banda');
    Add('propColumnLevels', 'N�mero de n�veis de colunas');
    Add('propColumns', 'N�mero de colunas na banda');
    Add('propColumnWidth', 'A largura da coluna da banda');
    Add('propCondition', 'A condi��o de agrupamento. O grupo ir� quebrar se o valor desta express�o mudar');
    Add('propCondition.TfrxHighlight', 'String de express�o. Se esta express�o for Verdadeira, o destaque ser� ativado.');
    Add('propConnected', 'Indica se a conex�o com o banco de dados est� ativa');
    Add('propConvertNulls', 'Determina se valores nulos do BD ser�o convertidos para 0, Falso ou string vazia');
    Add('propCopies', 'O n�mero padr�o de c�pias');
    Add('propCursor', 'O cursor do objeto');
    Add('propDatabaseName', 'O nome do banco de dados');
    Add('propDataField', 'Especifica o campo do qual o objeto obt�m seus dados');
    Add('propDataSet', 'Liga o objeto ao dataset que cont�m o campo que ele representa');
    Add('propDate', 'O valor de data do controle');
    Add('propDateFormat', 'Especifica o formato em que a data � apresentada');
    Add('propDecimalSeparator', 'O separador decimal');
    Add('propDefault', 'Determina se o bot�o � o bot�o padr�o');
    Add('propDefHeight', 'Altura padr�o da linha');
    Add('propDescription', 'A descri��o do relat�rio');
    Add('propDiagonal', 'Indica que a linha � diagonal');
    Add('propDisplayFormat', 'O formato do valor exibido');
    Add('propDoubleBuffered', 'Determina se a janela de visualiza��o usa buffering duplo. Buffering duplo habilitado previne o "flickering", por�m � mais lento');
    Add('propDoublePass', 'Determina se o mecanismo do relat�rio deve realizar um segundo passo');
    Add('propDown', 'Determina se o speed button est� pressionado ou n�o');
    Add('propDownThenAcross', 'Determina como uma tabela cruzada grande ser� dividida entre p�ginas');
    Add('propDriverName', 'O nome do driver BDE');
    Add('propDropShadow', 'Determina se o objeto possui sombra');
    Add('propDuplex', 'Especifica o modo duplex para a p�gina');
    Add('propEditMask', 'Especifica a m�scara que representa que texto � v�lido para o controle Edit com m�scara');
    Add('propEnabled', 'Determina se o controle est� habilitado');
    Add('propEngineOptions', 'As op��es do mecanismo do relat�rio');
    Add('propExpression', 'O valor desta express�o ser� exibido no objeto');
    Add('propExpressionDelimiters', 'Os caracteres que ser�o usados para delimitar as express�es contidas no texto');
    Add('propFieldAliases', 'Os apelidos dos campos do dataset');
    Add('propFilter', 'A condi��o de filtragem para o dataset');
    Add('propFiltered', 'Determina se o dataset deve filtrar os registros usando a condi��o na propriedade Filter');
    Add('propFlowTo', 'O objeto de texto que mostrar� o texto que n�o couber no objeto');
    Add('propFont', 'Os atributos da fonte do objeto');
    Add('propFooterAfterEach', 'Determina se a banda de rodap� dever� ser mostrada ap�s cada linha de dados');
    Add('propFormatStr', 'A string de formata��o');
    Add('propFrame', 'Os atributos da borda do objeto');
    Add('propGapX', 'A endenta��o esquerda do texto');
    Add('propGapY', 'A endenta��o superior do texto');
    Add('propGlyph', 'A imagem do controle');
    Add('propGroupIndex', 'Permite aos speed buttons funcionar juntos como um grupo');
    Add('propHAlign', 'O alinhamento horizontal do texto');
    Add('propHeight', 'A altura do objeto');
    Add('propHGuides', 'As guias horizontais da p�gina');
    Add('propHideZeros', 'Determina se o objeto de texto esconder� os valores zerados');
    Add('propHighlight', 'Os atributos do destaque condicional');
    Add('propIndexName', 'O nome do �ndice');
    Add('propInitString', 'String de inicializa��o da impressora para relat�rios matriciais');
    Add('propItems', 'Itens de lista do objeto');
    Add('propKeepAspectRatio', 'Manter o tamanho proporcional da imagem');
    Add('propKeepChild', 'Determina se a banda ser� impressa junto de sua banda filha');
    Add('propKeepFooter', 'Determina se a banda ser� impressa junto de seu rodap�');
    Add('propKeepHeader', 'Determines whether the band will be printed together with its header');
    Add('propKeepTogether', 'Determina se a banda ser� impressa junto de todas suas sub-bandas');
    Add('propKind.TfrxFormat', 'O tipo de formata��o');
    Add('propKind', 'O tipo de bot�o');
    Add('propLargeDesignHeight', 'Determina se a p�gina possuir� altura extensa no modo de design');
    Add('propLayout', 'O layout do glyph do bot�o');
    Add('propLeft', 'A coordenada esquerda do objeto');
    Add('propLeftMargin', 'O tamanho da margem esquerda da p�gina');
    Add('propLines', 'O texto do objeto');
    Add('propLineSpacing', 'A quantidade de pixels entre duas linhas de texto');
    Add('propLoginPrompt', 'Determina se o di�logo de login dever� ser mostrado');
    Add('propMargin', 'Determina o n�mero de pixels entre a borda da imagem e a borda do bot�o');
    Add('propMaster', 'O dataset mestre');
    Add('propMasterFields', 'Os campos ligados por rela��o mestre-detalhe');
    Add('propMaximized', 'Determina se a janela de visualiza��o dever� ser maximizada');
    Add('propMaxLength', 'Tamanho m�ximo do texto');
    Add('propMaxPages', 'N�mero m�ximo de p�ginas no relat�rio preparado');
    Add('propMaxWidth', 'Largura m�xima da coluna');
    Add('propMDIChild', 'Determina se a janela de visualiza��o ser� uma MDI filha');
    Add('propMemo', 'O texto do objeto');
    Add('propMinWidth', 'Largura m�nima da coluna');
    Add('propMirrorMargins', 'Espelha as margens nas p�ginas pares');
    Add('propModal', 'Determina se a janela de visualiza��o ser� exibida de forma modal');
    Add('propModalResult', 'Determina se e como o bot�o fecha seu formul�rio modal');
    Add('propName.TFont', 'O nome da fonte');
    Add('propName.TfrxReportOptions', 'O nome do relat�rio');
    Add('propName', 'O nome do objeto');
    Add('propNumGlyphs', 'Indica o n�mero de imagens no gr�fico especificado na propriedade Glyph');
    Add('propOpenDataSource', 'Determina se a fonte de dados deve ser aberta automaticamente ou n�o');
    Add('propOrientation', 'A orienta��o da p�gina');
    Add('propOutlineText', 'O texto que ser� mostrado no controle de resumo da visualiza��o');
    Add('propOutlineVisible', 'A visibilidade do controle de resumo da visualiza��o');
    Add('propOutlineWidth', 'A largura do controle de resumo da visualiza��o ');
    Add('propPageNumbers.TfrxPrintOptions', 'O n�mero das p�ginas a serem impressas.');
    Add('propPaperHeight', 'A altura da p�gina');
    Add('propPaperWidth', 'A largura da p�gina');
    Add('propParagraphGap', 'A endenta��o da primeira linha do par�grafo');
    Add('propParams.TfrxBDEDatabase', 'Os par�metros da conex�o');
    Add('propParams', 'Os par�metros da query');
    Add('propParentFont', 'Determina se o objeto usar� a fonte de seu objeto pai');
    Add('propPassword', 'A senha do relat�rio');
    Add('propPasswordChar', 'Indica o caractere, se algum, a ser mostrado no lugar dos caracteres reais digitados no controle');
    Add('propPicture', 'A figura');
    Add('propPicture.TfrxReportOptions', 'A figura descritiva do relat�rio');
    Add('propPosition', 'A posi��o inicial da janela');
    Add('propPreviewOptions', 'As op��es de visualiza��o do relat�rio');
    Add('propPrintable', 'Se o objeto ser� impresso. Objetos com Printable=False ser�o visualizados, mas n�o impressos');
    Add('propPrintChildIfInvisible', 'Determina se a banda filha ser� impressa caso sua banda pai seja invis�vel');
    Add('propPrinter', 'O nome da impressora que ser� selecionada quando este relat�rio for aberto ou executado');
    Add('propPrintIfDetailEmpty', 'Determina se a banda de dados ser� impressa caso sua sub-banda esteja vazia');
    Add('propPrintIfEmpty', 'Determina se a p�gina ser� impressa caso todos os seus datasets estejam vazios');
    Add('propPrintOnFirstPage', 'Determina se a banda ser� impressa na primeira p�gina');
    Add('propPrintOnLastPage', 'Determina se a banda ser� impressa na �ltima p�gina');
    Add('propPrintOnParent', 'Determina se o sub-relat�rio ser� impresso em sua banda pai');
    Add('propPrintOnPreviousPage', 'Determina se a p�gina pode ser gerada no espa�o livre da p�gina gerada anteriormente');
    Add('propPrintOptions', 'Op��es de impress�o do relat�rio');
    Add('propPrintPages', 'Determina a impress�o de todas as p�ginas, somente as �mpares ou somente as pares');
    Add('propRangeBegin', 'Determina o ponto inicial de navega��o no dataset');
    Add('propRangeEnd', 'Determina o ponto final de navega��o no dataset');
    Add('propRangeEndCount', 'Determina o n�mero de registros no dataset se RangeEnd for reCount');
    Add('propReadOnly', 'Determina se o objeto de texto � somente leitura');
    Add('propRepeatHeaders', 'Determina se os cabe�alhos de coluna e linha ser�o reimpressos em uma nova p�gina');
    Add('propReportOptions', 'As op��es do relat�rio');
    Add('propReprintOnNewPage', 'Determina se a banda ser� reimpressa em uma nova p�gina');
    Add('propRestrictions', 'Conjunto de sinais de restri��o');
    Add('propRightMargin', 'O tamanho da margem direita da p�gina');
    Add('propRotation.TfrxBarCodeView', 'A orienta��o do c�digo de barras');
    Add('propRotation', 'A rota��o do texto');
    Add('propRowCount', 'N�mero de registros virtuais na banda de dados');
    Add('propRowFields', 'Nomes dos campos de BD representando as linhas de cruzamento');
    Add('propRowLevels', 'N�mero de n�veis de linhas');
    Add('propRTLReading', 'Determina se o objeto de texto mostrar� seu conte�do no sentido da direita para a esquerda');
    Add('propScriptLanguage', 'O nome da linguagem de script usada no relat�rio');
    Add('propSessionName', 'O nome da sess�o BDE');
    Add('propShadowColor', 'A cor da sombra');
    Add('propShadowWidth', 'A largura da sombra');
    Add('propShape', 'O tipo de forma');
    Add('propShiftMode', 'O comportamento de deslocamento do objeto');
    Add('propShowCaptions', 'Determina se os bot�es da visualiza��o mostrar�o seus r�tulos');
    Add('propShowColumnHeader', 'Determina se o cruzamento mostrar� os cabe�alhos das colunas');
    Add('propShowColumnTotal', 'Determina se o cruzamento mostrar� o total geral da coluna');
    Add('propShowRowHeader', 'Determina se o cruzamento mostrar� os cabe�alhos das linhas');
    Add('propShowRowTotal', 'Determina se o cruzamento mostrar� o total geral da linha');
    Add('propShowDialog', 'Determina se o di�logo de impress�o ser� mostrado na janela de visualiza��o');
    Add('propShowText', 'Determina se o objeto c�digo de barras mostrar� texto em formato leg�vel');
    Add('propSize', 'O tamanho da fonte');
    Add('propSorted', 'Determina se os itens est�o ordenados ou n�o');
    Add('propSpacing', 'Determina o n�mero de pixels entre a imagem e o texto');
    Add('propSQL', 'A declara��o SQL');
    Add('propStartNewPage', 'Inicia uma nova p�gina antes de imprimir a banda');
    Add('propStretch', 'Estica a figura para caber nos limites do objeto');
    Add('propStretched', 'Determina se o objeto pode ser esticado');
    Add('propStretchMode', 'Modo para esticar o objeto');
    Add('propStyle.TFont', 'O estilo da fonte');
    Add('propStyle', 'O estilo do controle');
    Add('propStyle.TfrxFrame', 'O estilo da borda do objeto');
    Add('propSuppressRepeated', 'Suprime valores repetidos');
    Add('propTableName', 'O nome da tabela de dados');
    Add('propTag', 'O n�mero de marca do objeto');
    Add('propTagStr', 'A string de marca do objeto');
    Add('propText', 'O texto do objeto');
    Add('propTitleBeforeHeader', 'Determina se o t�tulo do relat�rio deve ser mostrado antes do cabe�alho da p�gina');
    Add('propTop', 'A coordenada superior do objeto');
    Add('propTopMargin', 'O tamanho da margem superior da p�gina');
    Add('propTyp', 'O tipo da borda');
    Add('propUnderlines', 'Determina se o objeto de texto mostrar� linhas de grade ap�s cada linha de texto');
    Add('propURL', 'O URL do objeto');
    Add('propUserName', 'Nome do usu�rio do objeto de dados. Este nome ser� mostrado na �rvore de dados');
    Add('propVAlign', 'O alinhamento vertical do texto');
    Add('propVersionBuild', 'Informa��o de vers�o, compila��o');
    Add('propVersionMajor', 'Informa��o de vers�o, vers�o maior');
    Add('propVersionMinor', 'Informa��o de vers�o, vers�o menor');
    Add('propVersionRelease', 'Informa��o de vers�o, libera��o');
    Add('propVGuides', 'As guias verticais da p�gina');
    Add('propVisible', 'Visibilidade do objeto');
    Add('propWidth', 'Largura do objeto');
    Add('propWidth.TfrxFrame', 'A largura da borda');
    Add('propWindowState', 'Estado inicial da janela');
    Add('propWordBreak', 'Quebrar palavras em russo');
    Add('propWordWrap', 'Determina se o objeto de texto insere retornos de carro suaves para que o texto quebre na margem direita');
    Add('propZoom.TfrxBarCodeView', 'Zooms para o c�digo de barras');
    Add('propZoom', 'Fator inicial de zoom da janela de visualiza��o');
    Add('propZoomMode', 'Modo inicial de zoom de janela de visualiza��o');
  end;
end;


initialization
  frAddInspectorRes;

end.
