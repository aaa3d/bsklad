
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
    Add('propActive', 'Especifica si un Dataset está abierto o no');
    Add('propActive.TfrxHighlight', 'Especifica si el resaltado está activo o no');
    Add('propAliasName', 'El nombre del Alias BDE');
    Add('propAlign', 'Determina la alineación del objeto relativa a la banda o la página');
    Add('propAlignment', 'Justifica el texto de un objeto');
    Add('propAllowAllUp', 'Especifica si todos los botones de un grupo pueden estar deseleccionados al mismo tiempo');
    Add('propAllowEdit', 'Determina si el usuario puede editar las páginas del informe');
    Add('propAllowExpressions', 'Determina si el texto contiene expresiones');
    Add('propAllowGrayed', 'Permitir que las casillas de verificación, tengan el estado indefinido');
    Add('propAllowHTMLTags', 'Determina si el texto contiene etiquetas HTML');
    Add('propAllowSplit', 'Determina si una banda contiene páginas cruzadas');
    Add('propAuthor', 'El autor del informe');
    Add('propAutoSize', 'Determina si la imagen debe redimensionarse automáticamente');
    Add('propAutoWidth', 'Determina si el objeto debe redimensionarse a la longitud del texto');
    Add('propBackPicture', 'Imagen de fondo para la página');
    Add('propBarType', 'Tipo de código de barra');
    Add('propBevelInner', 'Tipo de biselado');
    Add('propBevelOuter', 'Tipo de biselado');
    Add('propBevelWidth', 'Grueso del biselado');
    Add('propBorder', 'Determina si se muestra el borde del biselado o no');
    Add('propBorderStyle', 'Estilo de ventana');
    Add('propBottomMargin', 'Tamaño para el margen de abajo');
    Add('propBrushStyle', 'Estilo de brocha que se usará para pintar el fondo del objeto');
    Add('propButtons', 'Establece los botones que estarán visibles en la ventana de vista previa');
    Add('propCacheSize', 'Máxima cantidad de memoria que usará el motor de informes. Si la memoria usada excede este valor en la preparación de las páginas, se usará un archivo de disco');
    Add('propCalcCheckSum', 'Determina si el código de barras debe calcular el dígito de control automáticamente');
    Add('propCancel', 'Determina si el botón debe activarse cuando se pulse la tecla ESCAPE');
    Add('propCaption', 'Título del control');
    Add('propCellFields', 'Nombres de campos representados en las celdas');
    Add('propCellLevels', 'Número de celdas del nivel');
    Add('propCenter', 'Determina si la imagen deberá estar centrada en el control');
    Add('propCharset', 'Fuente');
    Add('propCharSpacing', 'Cantidad de Píxeles entre dos caracteres');
    Add('propCheckColor', 'Color de la marca de verificación');
    Add('propChecked', 'Indica si la casilla del control tiene la marca de selección');
    Add('propCheckStyle', 'Estilo de marca de selección');
    Add('propChild', 'Banda hija conectada a esta banda');
    Add('propCollate', 'Opciones predeterminadas de la colación');
    Add('propColor.TFont', 'Color del texto');
    Add('propColor', 'Color del objeto');
    Add('propColor.TfrxFrame', 'Color del marco');
    Add('propColor.TfrxHighlight', 'Detrmina si el color resaltado del objeto está activo');
    Add('propColumnFields', 'Nombre de campos representados en las columnas');
    Add('propColumnGap', 'Separación entre las columnas de la banda');
    Add('propColumnLevels', 'Número de columnas para este nivel');
    Add('propColumns', 'Número de columnas en esta banda');
    Add('propColumnWidth', 'Ancho de columnas de esta banda');
    Add('propCondition', 'Condición por la que se agrupará. El grupo de romperá si el valor de esta expresión cambia');
    Add('propCondition.TfrxHighlight', 'Cadena de la expresión. Si esta expresión es verdadera, el resaltado se activará');
    Add('propConnected', 'Indica si la conexión con la base de datos está activa');
    Add('propConvertNulls', 'Determina si un campo con valor nulo se convertirá a 0 o a la cadena "Vacío"');
    Add('propCopies', 'Número de copias por defecto');
    Add('propCursor', 'Tipo de cursor para este objeto');
    Add('propDatabaseName', 'Nombre de la base de datos');
    Add('propDataField', 'Especifica el campo del cual el objeto obtendrá los datos');
    Add('propDataSet', 'Dataset ligado a este objeto');
    Add('propDate', 'Fecha');
    Add('propDateFormat', 'Formato para la fecha');
    Add('propDecimalSeparator', 'Separador de decimales');
    Add('propDefault', 'Determina si el botón estará seleccionado por defecto');
    Add('propDefHeight', 'Alto por defecto para la fila');
    Add('propDescription', 'Descripción del informe');
    Add('propDiagonal', 'Indica si esta línea es diagonal');
    Add('propDisplayFormat', 'Formato que se usará para la visualización de los valores');
    Add('propDoubleBuffered', 'Determina si la ventana de vista previa usará doble buffer. activar el doble buffer, evita el parpadeo, pero es más lento');
    Add('propDoublePass', 'Determina si el motor de informes debe hacer una segunda pasada');
    Add('propDown', 'Determina si el botón de menú está pulsado o no');
    Add('propDownThenAcross', 'Determines how the large cross table will be splitted across pages');
    Add('propDriverName', 'Nombre del driver del BDE');
    Add('propDropShadow', 'Determina si el objeto tiene sombra');
    Add('propDuplex', 'Especifica si se activa el modo duplex para esta página');
    Add('propEditMask', 'Especifica la máscara que se usará para la edición en este control');
    Add('propEnabled', 'Determina si el control estará accesible');
    Add('propEngineOptions', 'Opciones del motor de informes');
    Add('propExpression', 'Valor de la expresión que contiene el objeto');
    Add('propExpressionDelimiters', 'Caracteres que srán usados para delimitar las expresiones contenidas en el texto');
    Add('propFieldAliases', 'Campos del dataset');
    Add('propFilter', 'Condición del filtro para el Dataset');
    Add('propFiltered', 'Determina si el Dataset debe aplicar el filtro contenido en la propiedad Filter');
    Add('propFlowTo', 'The text object that will show the text that not fit in the object');
    Add('propFont', 'Fuente usada en este objeto');
    Add('propFooterAfterEach', 'Determina si la banda de pie debe mostrarse después de cada fila de datos');
    Add('propFormatStr', 'Formato para texto');
    Add('propFrame', 'Atributos para el marco del objeto');
    Add('propGapX', 'Indentado a la izquierda para el texto');
    Add('propGapY', 'Indentado arriba para el texto');
    Add('propGlyph', 'Imagen del control');
    Add('propGroupIndex', 'Indica el grupo de botones con los que interactuará el botón');
    Add('propHAlign', 'Alineación horizontal del texto');
    Add('propHeight', 'Alto del objeto');
    Add('propHGuides', 'Líneas horizontales de guía de la página');
    Add('propHideZeros', 'Determina si se mostrará o no el valor cero');
    Add('propHighlight', 'Atributos para el resaltado');
    Add('propIndexName', 'Nombre del índice');
    Add('propInitString', 'Printer init string for dot-matrix reports');
    Add('propItems', 'Lista de items');
    Add('propKeepAspectRatio', 'Mantener el aspecto original de la imagen');
    Add('propKeepChild', 'Determina si la banda ha de imprimirse junto a su hija');
    Add('propKeepFooter', 'Determina si la banda ha de imprimirse junto a su pie');
    Add('propKeepTogether', 'Determina si la banda ha de imprimirse junto a todas sus subbandas');
    Add('propKind.TfrxFormat', 'Tipo de formateo');
    Add('propKind', 'The kind of the button');
    Add('propLargeDesignHeight', 'Determines whether the page will have large height in the design mode');
    Add('propLayout', 'Disposición de la imagen en el botón');
    Add('propLeft', 'Posición izquierda del objeto');
    Add('propLeftMargin', 'Tamaño del margen izquierdo de la página');
    Add('propLines', 'Texto del objeto');
    Add('propLineSpacing', 'Número de píxeles entre dos líneas de texto');
    Add('propLoginPrompt', 'Dtermina si se mostrará el diálogo de petición de login');
    Add('propMargin', 'Determina el número de píxeles entre el borde de la imagen y el borde del botón');
    Add('propMaster', 'Dataset maestro');
    Add('propMasterFields', 'Campos por los que se establece la relación Maestro-Detalle');
    Add('propMaximized', 'Determina si la ventana de vista previa estará maximizada');
    Add('propMaxLength', 'Máxima longitud del texto');
    Add('propMaxPages', 'Máximo número de páginas en la preparación del informe');
    Add('propMaxWidth', 'Anchura máxima de la columna');
    Add('propMDIChild', 'Determina si la ventana de vista previa se creará como MDI');
    Add('propMemo', 'Texto del objeto');
    Add('propMinWidth', 'Anchura mínima de la columna');
    Add('propMirrorMargins', 'Márgenes de página iguales en las páginas pares');
    Add('propModal', 'Determina si la ventana de vista previa se mostrará en modal');
    Add('propModalResult', 'Determina el valor que devolverá cuando se cierre con este botón una ventana modal');
    Add('propName.TFont', 'Nombre de la fuente');
    Add('propName.TfrxReportOptions', 'Nombre del informe');
    Add('propName', 'Nombre del objeto');
    Add('propNumGlyphs', 'Indica el número de imágenes contenidas en la imagen indicada en la propiedad Glyph');
    Add('propOpenDataSource', 'Determina si la fuente de datos será abierta automáticamente o no');
    Add('propOrientation', 'Orientación de la página');
    Add('propOutlineText', 'Texto que se mostrará en el índice de la vista previa');
    Add('propOutlineVisible', 'Indica si se mostrará el índice en la vista previa');
    Add('propOutlineWidth', 'Anchura que ocupará el índice en la vista previa');
    Add('propPageNumbers.TfrxPrintOptions', 'Número de páginas que se imprimirán');
    Add('propPaperHeight', 'Alto de la página');
    Add('propPaperWidth', 'Ancho de la página');
    Add('propParagraphGap', 'Indentación para la primera línea del párrafo');
    Add('propParams.TfrxBDEDatabase', 'Parámetros de la conexión');
    Add('propParams', 'Parámetros de la consulta');
    Add('propParentFont', 'Indica si el objeto usará la misma fuente que su contenedor');
    Add('propPassword', 'Contraseña del informe');
    Add('propPasswordChar', 'Indica el caracter que se mostrará en sustitución de los que realmente se teclean');
    Add('propPicture', 'Imagen');
    Add('propPicture.TfrxReportOptions', 'Imagen que describe el informe');
    Add('propPosition', 'Posición inicial de la ventana');
    Add('propPreviewOptions', 'Opciones de vista previa del informe');
    Add('propPrintable', 'Indica si el objeto es imprimible. Si se establece a False, el objeto será mostrado en la vista previa, pero no se imprimirá');
    Add('propPrintChildIfInvisible', 'Indica si la banda hija se imprimirá en el caso de que la banda padre sea invisible');
    Add('propPrinter', 'Nombre de la impresora que aparecerá seleccionada al abrir o ejecutar el informe');
    Add('propPrintIfDetailEmpty', 'Indica si la banda de datos se imprimirá en el caso de que sus subbandas estén vacías');
    Add('propPrintIfEmpty', 'Indica si la página se imprimirá en el caso de que los Datasets estén vacíos');
    Add('propPrintOnFirstPage', 'Indica si la banda se imprimirá en la primera página');
    Add('propPrintOnLastPage', 'Indica si la banda se imprimirá en la última página');
    Add('propPrintOnParent', 'Determina si el subreport se puede imprimir en la banda padre');
    Add('propPrintOnPreviousPage', 'Determina si la página se puede generar en el espacio libre de la página previamente generada');
    Add('propPrintOptions', 'Opciones de impresión del informe');
    Add('propPrintPages', 'Determina si se imprime todo o solo las páginas pares o las impares');
    Add('propRangeBegin', 'Determina el punto de comienzo en la navegación en el dataset');
    Add('propRangeEnd', 'Determina el punto de terminación en la navegación en el dataset');
    Add('propRangeEndCount', 'Determina el número de registros que se leerán del Dataset Si la propiedad RangeEnd es reCount');
    Add('propReadOnly', 'Determina si el texto del objeto es de solo lectura');
    Add('propRepeatHeaders', 'Determina si la columna y la fila de cabecera s4e imprimirá en la página nueva');
    Add('propReportOptions', 'Opciones del informe');
    Add('propReprintOnNewPage', 'Determina si la banda será reimpresa en la nueva página');
    Add('propRestrictions', 'Establecer restricciones');
    Add('propRightMargin', 'Tamaño del margen derecho de la página');
    Add('propRotation.TfrxBarCodeView', 'Orientación del código de barras');
    Add('propRotation', 'Rotación del texto');
    Add('propRowCount', 'Número de registros virtuales en la banda de datos');
    Add('propRowFields', 'Nombres de campos que representan las filas cruzadas');
    Add('propRowLevels', 'Número de niveles en la fila');
    Add('propRTLReading', 'Determina si el texto del objeto, se pintará de derecha a izquierda');
    Add('propScriptLanguage', 'Nombre del lenguaje de script usado en el informe');
    Add('propSessionName', 'Nombre de la sesión del BDE');
    Add('propShadowColor', 'Color de la sombra');
    Add('propShadowWidth', 'Ancho de la sombra');
    Add('propShape', 'Tipo de dibujo');
    Add('propShiftMode', 'Cambia el comportamiento del objeto');
    Add('propShowCaptions', 'Determina si los botones de la vista previa mostrarán sus títulos');
    Add('propShowColumnHeader', 'Determina si se mostrarán las cabeceras de columna en los cruces');
    Add('propShowColumnTotal', 'Determina si se mostrará la columna de Total');
    Add('propShowRowHeader', 'Determina si se mostrarán las cabeceras de fila');
    Add('propShowRowTotal', 'Determina si se mostrará la fila de Total');
    Add('propShowDialog', 'Determina si se mostrará el diálogo de impresión en la vista previa');
    Add('propShowText', 'Determina si se mostrará el texto del código de barras');
    Add('propSize', 'Tamaño de fuente');
    Add('propSorted', 'Determina si los items serán ordenados o no');
    Add('propSpacing', 'Determina el número de píxeles entre la imagen y el texto');
    Add('propSQL', 'Sentencia SQL');
    Add('propStartNewPage', 'Lanzar una nueva página antes de imprimir la banda');
    Add('propStretch', 'Ajusta la imagen a los límetes del objeto');
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
    Add('propTitleBeforeHeader', 'Determina si se mostrará el título del informe antes de la cabecera de página');
    Add('propTop', 'Posición arriba del objeto');
    Add('propTopMargin', 'Tamaño del margen arriba de la página');
    Add('propTyp', 'Tipo de marco');
    Add('propUnderlines', 'Determina si el texto aparecerá subrayado');
    Add('propURL', 'URL del objeto');
    Add('propUserName', 'Nombre del usuario. Este nombre será usado para mostrarlo en el árbol de datos');
    Add('propVAlign', 'Alineación vertical del texto');
    Add('propVersionBuild', 'Información de versión');
    Add('propVersionMajor', 'Información de versión, mayor version');
    Add('propVersionMinor', 'Información de versión info, menor version');
    Add('propVersionRelease', 'Información de versión');
    Add('propVGuides', 'Líneas verticales de guía de la página');
    Add('propVisible', 'Indica si el objeto se verá o no');
    Add('propWidth', 'Anchura del objeto');
    Add('propWidth.TfrxFrame', 'Anchura del marco');
    Add('propWindowState', 'Estado inicial de la ventana');
    Add('propWordBreak', 'Break russian words');
    Add('propWordWrap', 'Determina si se insertarán retornos de carro en el texto cuando la longitud de este sobrepase el margen derecho');
    Add('propZoom.TfrxBarCodeView', 'Zoom del código de barras');
    Add('propZoom', 'Zoom inicial en la ventana de vista previa');
    Add('propZoomMode', 'Modo inicial de zoom en la ventana de vista previa');
  end;
end;


initialization
  frAddInspectorRes;

end.
