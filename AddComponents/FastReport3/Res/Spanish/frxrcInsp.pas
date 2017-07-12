
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
    Add('propActive', 'Especifica si un Dataset est� abierto o no');
    Add('propActive.TfrxHighlight', 'Especifica si el resaltado est� activo o no');
    Add('propAliasName', 'El nombre del Alias BDE');
    Add('propAlign', 'Determina la alineaci�n del objeto relativa a la banda o la p�gina');
    Add('propAlignment', 'Justifica el texto de un objeto');
    Add('propAllowAllUp', 'Especifica si todos los botones de un grupo pueden estar deseleccionados al mismo tiempo');
    Add('propAllowEdit', 'Determina si el usuario puede editar las p�ginas del informe');
    Add('propAllowExpressions', 'Determina si el texto contiene expresiones');
    Add('propAllowGrayed', 'Permitir que las casillas de verificaci�n, tengan el estado indefinido');
    Add('propAllowHTMLTags', 'Determina si el texto contiene etiquetas HTML');
    Add('propAllowSplit', 'Determina si una banda contiene p�ginas cruzadas');
    Add('propAuthor', 'El autor del informe');
    Add('propAutoSize', 'Determina si la imagen debe redimensionarse autom�ticamente');
    Add('propAutoWidth', 'Determina si el objeto debe redimensionarse a la longitud del texto');
    Add('propBackPicture', 'Imagen de fondo para la p�gina');
    Add('propBarType', 'Tipo de c�digo de barra');
    Add('propBevelInner', 'Tipo de biselado');
    Add('propBevelOuter', 'Tipo de biselado');
    Add('propBevelWidth', 'Grueso del biselado');
    Add('propBorder', 'Determina si se muestra el borde del biselado o no');
    Add('propBorderStyle', 'Estilo de ventana');
    Add('propBottomMargin', 'Tama�o para el margen de abajo');
    Add('propBrushStyle', 'Estilo de brocha que se usar� para pintar el fondo del objeto');
    Add('propButtons', 'Establece los botones que estar�n visibles en la ventana de vista previa');
    Add('propCacheSize', 'M�xima cantidad de memoria que usar� el motor de informes. Si la memoria usada excede este valor en la preparaci�n de las p�ginas, se usar� un archivo de disco');
    Add('propCalcCheckSum', 'Determina si el c�digo de barras debe calcular el d�gito de control autom�ticamente');
    Add('propCancel', 'Determina si el bot�n debe activarse cuando se pulse la tecla ESCAPE');
    Add('propCaption', 'T�tulo del control');
    Add('propCellFields', 'Nombres de campos representados en las celdas');
    Add('propCellLevels', 'N�mero de celdas del nivel');
    Add('propCenter', 'Determina si la imagen deber� estar centrada en el control');
    Add('propCharset', 'Fuente');
    Add('propCharSpacing', 'Cantidad de P�xeles entre dos caracteres');
    Add('propCheckColor', 'Color de la marca de verificaci�n');
    Add('propChecked', 'Indica si la casilla del control tiene la marca de selecci�n');
    Add('propCheckStyle', 'Estilo de marca de selecci�n');
    Add('propChild', 'Banda hija conectada a esta banda');
    Add('propCollate', 'Opciones predeterminadas de la colaci�n');
    Add('propColor.TFont', 'Color del texto');
    Add('propColor', 'Color del objeto');
    Add('propColor.TfrxFrame', 'Color del marco');
    Add('propColor.TfrxHighlight', 'Detrmina si el color resaltado del objeto est� activo');
    Add('propColumnFields', 'Nombre de campos representados en las columnas');
    Add('propColumnGap', 'Separaci�n entre las columnas de la banda');
    Add('propColumnLevels', 'N�mero de columnas para este nivel');
    Add('propColumns', 'N�mero de columnas en esta banda');
    Add('propColumnWidth', 'Ancho de columnas de esta banda');
    Add('propCondition', 'Condici�n por la que se agrupar�. El grupo de romper� si el valor de esta expresi�n cambia');
    Add('propCondition.TfrxHighlight', 'Cadena de la expresi�n. Si esta expresi�n es verdadera, el resaltado se activar�');
    Add('propConnected', 'Indica si la conexi�n con la base de datos est� activa');
    Add('propConvertNulls', 'Determina si un campo con valor nulo se convertir� a 0 o a la cadena "Vac�o"');
    Add('propCopies', 'N�mero de copias por defecto');
    Add('propCursor', 'Tipo de cursor para este objeto');
    Add('propDatabaseName', 'Nombre de la base de datos');
    Add('propDataField', 'Especifica el campo del cual el objeto obtendr� los datos');
    Add('propDataSet', 'Dataset ligado a este objeto');
    Add('propDate', 'Fecha');
    Add('propDateFormat', 'Formato para la fecha');
    Add('propDecimalSeparator', 'Separador de decimales');
    Add('propDefault', 'Determina si el bot�n estar� seleccionado por defecto');
    Add('propDefHeight', 'Alto por defecto para la fila');
    Add('propDescription', 'Descripci�n del informe');
    Add('propDiagonal', 'Indica si esta l�nea es diagonal');
    Add('propDisplayFormat', 'Formato que se usar� para la visualizaci�n de los valores');
    Add('propDoubleBuffered', 'Determina si la ventana de vista previa usar� doble buffer. activar el doble buffer, evita el parpadeo, pero es m�s lento');
    Add('propDoublePass', 'Determina si el motor de informes debe hacer una segunda pasada');
    Add('propDown', 'Determina si el bot�n de men� est� pulsado o no');
    Add('propDownThenAcross', 'Determines how the large cross table will be splitted across pages');
    Add('propDriverName', 'Nombre del driver del BDE');
    Add('propDropShadow', 'Determina si el objeto tiene sombra');
    Add('propDuplex', 'Especifica si se activa el modo duplex para esta p�gina');
    Add('propEditMask', 'Especifica la m�scara que se usar� para la edici�n en este control');
    Add('propEnabled', 'Determina si el control estar� accesible');
    Add('propEngineOptions', 'Opciones del motor de informes');
    Add('propExpression', 'Valor de la expresi�n que contiene el objeto');
    Add('propExpressionDelimiters', 'Caracteres que sr�n usados para delimitar las expresiones contenidas en el texto');
    Add('propFieldAliases', 'Campos del dataset');
    Add('propFilter', 'Condici�n del filtro para el Dataset');
    Add('propFiltered', 'Determina si el Dataset debe aplicar el filtro contenido en la propiedad Filter');
    Add('propFlowTo', 'The text object that will show the text that not fit in the object');
    Add('propFont', 'Fuente usada en este objeto');
    Add('propFooterAfterEach', 'Determina si la banda de pie debe mostrarse despu�s de cada fila de datos');
    Add('propFormatStr', 'Formato para texto');
    Add('propFrame', 'Atributos para el marco del objeto');
    Add('propGapX', 'Indentado a la izquierda para el texto');
    Add('propGapY', 'Indentado arriba para el texto');
    Add('propGlyph', 'Imagen del control');
    Add('propGroupIndex', 'Indica el grupo de botones con los que interactuar� el bot�n');
    Add('propHAlign', 'Alineaci�n horizontal del texto');
    Add('propHeight', 'Alto del objeto');
    Add('propHGuides', 'L�neas horizontales de gu�a de la p�gina');
    Add('propHideZeros', 'Determina si se mostrar� o no el valor cero');
    Add('propHighlight', 'Atributos para el resaltado');
    Add('propIndexName', 'Nombre del �ndice');
    Add('propInitString', 'Printer init string for dot-matrix reports');
    Add('propItems', 'Lista de items');
    Add('propKeepAspectRatio', 'Mantener el aspecto original de la imagen');
    Add('propKeepChild', 'Determina si la banda ha de imprimirse junto a su hija');
    Add('propKeepFooter', 'Determina si la banda ha de imprimirse junto a su pie');
    Add('propKeepTogether', 'Determina si la banda ha de imprimirse junto a todas sus subbandas');
    Add('propKind.TfrxFormat', 'Tipo de formateo');
    Add('propKind', 'The kind of the button');
    Add('propLargeDesignHeight', 'Determines whether the page will have large height in the design mode');
    Add('propLayout', 'Disposici�n de la imagen en el bot�n');
    Add('propLeft', 'Posici�n izquierda del objeto');
    Add('propLeftMargin', 'Tama�o del margen izquierdo de la p�gina');
    Add('propLines', 'Texto del objeto');
    Add('propLineSpacing', 'N�mero de p�xeles entre dos l�neas de texto');
    Add('propLoginPrompt', 'Dtermina si se mostrar� el di�logo de petici�n de login');
    Add('propMargin', 'Determina el n�mero de p�xeles entre el borde de la imagen y el borde del bot�n');
    Add('propMaster', 'Dataset maestro');
    Add('propMasterFields', 'Campos por los que se establece la relaci�n Maestro-Detalle');
    Add('propMaximized', 'Determina si la ventana de vista previa estar� maximizada');
    Add('propMaxLength', 'M�xima longitud del texto');
    Add('propMaxPages', 'M�ximo n�mero de p�ginas en la preparaci�n del informe');
    Add('propMaxWidth', 'Anchura m�xima de la columna');
    Add('propMDIChild', 'Determina si la ventana de vista previa se crear� como MDI');
    Add('propMemo', 'Texto del objeto');
    Add('propMinWidth', 'Anchura m�nima de la columna');
    Add('propMirrorMargins', 'M�rgenes de p�gina iguales en las p�ginas pares');
    Add('propModal', 'Determina si la ventana de vista previa se mostrar� en modal');
    Add('propModalResult', 'Determina el valor que devolver� cuando se cierre con este bot�n una ventana modal');
    Add('propName.TFont', 'Nombre de la fuente');
    Add('propName.TfrxReportOptions', 'Nombre del informe');
    Add('propName', 'Nombre del objeto');
    Add('propNumGlyphs', 'Indica el n�mero de im�genes contenidas en la imagen indicada en la propiedad Glyph');
    Add('propOpenDataSource', 'Determina si la fuente de datos ser� abierta autom�ticamente o no');
    Add('propOrientation', 'Orientaci�n de la p�gina');
    Add('propOutlineText', 'Texto que se mostrar� en el �ndice de la vista previa');
    Add('propOutlineVisible', 'Indica si se mostrar� el �ndice en la vista previa');
    Add('propOutlineWidth', 'Anchura que ocupar� el �ndice en la vista previa');
    Add('propPageNumbers.TfrxPrintOptions', 'N�mero de p�ginas que se imprimir�n');
    Add('propPaperHeight', 'Alto de la p�gina');
    Add('propPaperWidth', 'Ancho de la p�gina');
    Add('propParagraphGap', 'Indentaci�n para la primera l�nea del p�rrafo');
    Add('propParams.TfrxBDEDatabase', 'Par�metros de la conexi�n');
    Add('propParams', 'Par�metros de la consulta');
    Add('propParentFont', 'Indica si el objeto usar� la misma fuente que su contenedor');
    Add('propPassword', 'Contrase�a del informe');
    Add('propPasswordChar', 'Indica el caracter que se mostrar� en sustituci�n de los que realmente se teclean');
    Add('propPicture', 'Imagen');
    Add('propPicture.TfrxReportOptions', 'Imagen que describe el informe');
    Add('propPosition', 'Posici�n inicial de la ventana');
    Add('propPreviewOptions', 'Opciones de vista previa del informe');
    Add('propPrintable', 'Indica si el objeto es imprimible. Si se establece a False, el objeto ser� mostrado en la vista previa, pero no se imprimir�');
    Add('propPrintChildIfInvisible', 'Indica si la banda hija se imprimir� en el caso de que la banda padre sea invisible');
    Add('propPrinter', 'Nombre de la impresora que aparecer� seleccionada al abrir o ejecutar el informe');
    Add('propPrintIfDetailEmpty', 'Indica si la banda de datos se imprimir� en el caso de que sus subbandas est�n vac�as');
    Add('propPrintIfEmpty', 'Indica si la p�gina se imprimir� en el caso de que los Datasets est�n vac�os');
    Add('propPrintOnFirstPage', 'Indica si la banda se imprimir� en la primera p�gina');
    Add('propPrintOnLastPage', 'Indica si la banda se imprimir� en la �ltima p�gina');
    Add('propPrintOnParent', 'Determina si el subreport se puede imprimir en la banda padre');
    Add('propPrintOnPreviousPage', 'Determina si la p�gina se puede generar en el espacio libre de la p�gina previamente generada');
    Add('propPrintOptions', 'Opciones de impresi�n del informe');
    Add('propPrintPages', 'Determina si se imprime todo o solo las p�ginas pares o las impares');
    Add('propRangeBegin', 'Determina el punto de comienzo en la navegaci�n en el dataset');
    Add('propRangeEnd', 'Determina el punto de terminaci�n en la navegaci�n en el dataset');
    Add('propRangeEndCount', 'Determina el n�mero de registros que se leer�n del Dataset Si la propiedad RangeEnd es reCount');
    Add('propReadOnly', 'Determina si el texto del objeto es de solo lectura');
    Add('propRepeatHeaders', 'Determina si la columna y la fila de cabecera s4e imprimir� en la p�gina nueva');
    Add('propReportOptions', 'Opciones del informe');
    Add('propReprintOnNewPage', 'Determina si la banda ser� reimpresa en la nueva p�gina');
    Add('propRestrictions', 'Establecer restricciones');
    Add('propRightMargin', 'Tama�o del margen derecho de la p�gina');
    Add('propRotation.TfrxBarCodeView', 'Orientaci�n del c�digo de barras');
    Add('propRotation', 'Rotaci�n del texto');
    Add('propRowCount', 'N�mero de registros virtuales en la banda de datos');
    Add('propRowFields', 'Nombres de campos que representan las filas cruzadas');
    Add('propRowLevels', 'N�mero de niveles en la fila');
    Add('propRTLReading', 'Determina si el texto del objeto, se pintar� de derecha a izquierda');
    Add('propScriptLanguage', 'Nombre del lenguaje de script usado en el informe');
    Add('propSessionName', 'Nombre de la sesi�n del BDE');
    Add('propShadowColor', 'Color de la sombra');
    Add('propShadowWidth', 'Ancho de la sombra');
    Add('propShape', 'Tipo de dibujo');
    Add('propShiftMode', 'Cambia el comportamiento del objeto');
    Add('propShowCaptions', 'Determina si los botones de la vista previa mostrar�n sus t�tulos');
    Add('propShowColumnHeader', 'Determina si se mostrar�n las cabeceras de columna en los cruces');
    Add('propShowColumnTotal', 'Determina si se mostrar� la columna de Total');
    Add('propShowRowHeader', 'Determina si se mostrar�n las cabeceras de fila');
    Add('propShowRowTotal', 'Determina si se mostrar� la fila de Total');
    Add('propShowDialog', 'Determina si se mostrar� el di�logo de impresi�n en la vista previa');
    Add('propShowText', 'Determina si se mostrar� el texto del c�digo de barras');
    Add('propSize', 'Tama�o de fuente');
    Add('propSorted', 'Determina si los items ser�n ordenados o no');
    Add('propSpacing', 'Determina el n�mero de p�xeles entre la imagen y el texto');
    Add('propSQL', 'Sentencia SQL');
    Add('propStartNewPage', 'Lanzar una nueva p�gina antes de imprimir la banda');
    Add('propStretch', 'Ajusta la imagen a los l�metes del objeto');
    Add('propStretched', 'Determina si el objeto puede ser ajustado');
    Add('propStretchMode', 'Comportamiento del ajuste al objeto');
    Add('propStyle.TFont', 'Estilo de fuente');
    Add('propStyle', 'Estilo de control');
    Add('propStyle.TfrxFrame', 'Estilo del marco');
    Add('propSuppressRepeated', 'Suprime los valores repetidos');
    Add('propTableName', 'Nombre de la tabla de datos');
    Add('propTag', 'Tag');
    Add('propTagStr', 'Tag string of the object');
    Add('propText', 'Texto del objeto');
    Add('propTitleBeforeHeader', 'Determina si se mostrar� el t�tulo del informe antes de la cabecera de p�gina');
    Add('propTop', 'Posici�n arriba del objeto');
    Add('propTopMargin', 'Tama�o del margen arriba de la p�gina');
    Add('propTyp', 'Tipo de marco');
    Add('propUnderlines', 'Determina si el texto aparecer� subrayado');
    Add('propURL', 'URL del objeto');
    Add('propUserName', 'Nombre del usuario. Este nombre ser� usado para mostrarlo en el �rbol de datos');
    Add('propVAlign', 'Alineaci�n vertical del texto');
    Add('propVersionBuild', 'Informaci�n de versi�n');
    Add('propVersionMajor', 'Informaci�n de versi�n, mayor version');
    Add('propVersionMinor', 'Informaci�n de versi�n info, menor version');
    Add('propVersionRelease', 'Informaci�n de versi�n');
    Add('propVGuides', 'L�neas verticales de gu�a de la p�gina');
    Add('propVisible', 'Indica si el objeto se ver� o no');
    Add('propWidth', 'Anchura del objeto');
    Add('propWidth.TfrxFrame', 'Anchura del marco');
    Add('propWindowState', 'Estado inicial de la ventana');
    Add('propWordBreak', 'Break russian words');
    Add('propWordWrap', 'Determina si se insertar�n retornos de carro en el texto cuando la longitud de este sobrepase el margen derecho');
    Add('propZoom.TfrxBarCodeView', 'Zoom del c�digo de barras');
    Add('propZoom', 'Zoom inicial en la ventana de vista previa');
    Add('propZoomMode', 'Modo inicial de zoom en la ventana de vista previa');
  end;
end;


initialization
  frAddInspectorRes;

end.
