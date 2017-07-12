
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
    Add('propActive', 'Especifica quan una taula està o no oberta');
    Add('propActive.TfrxHighlight', 'Especifica quan un ressalt està actiu');
    Add('propAliasName', 'Nom de l''alies del BDE');
    Add('propAlign', 'Determina l''ajust de l''objecta relatiu a la banda o pàgina');
    Add('propAlignment', 'Ajustament del text');
    Add('propAllowAllUp', 'Especifica quan totes el botons d''un grup poden ser deseleccionats a la vegada');
    Add('propAllowEdit', 'Determina quan l''usuari pot editar el preparador de pàgines de l''informe');
    Add('propAllowExpressions', 'Determina quan el text pot contenir expressions');
    Add('propAllowGrayed', 'Permetre l''estat gris en els controls checkboxes');
    Add('propAllowHTMLTags', 'Determina quan el text pot contenir codi HTML');
    Add('propAllowSplit', 'Determina si la banda pot dividir-se en varies pàgines');
    Add('propAuthor', 'Autor de l''informe');
    Add('propAutoSize', 'Determina si la imatge es dimensiona automàticament');
    Add('propAutoWidth', 'Determina si el text es dimensiona l''amplada automàticament');
    Add('propBackPicture', 'Imatge pel fons de la pàgina');
    Add('propBarType', 'Tipus de Codi de Barres');
    Add('propBevelInner', 'Tipus de bisell sortit');
    Add('propBevelOuter', 'Tipus de bisell enfonsat');
    Add('propBevelWidth', 'Amplada del bisell');
    Add('propBorder', 'Determina si es mostra la vora o no');
    Add('propBorderStyle', 'Estil de la finestra');
    Add('propBottomMargin', 'Mida del marge inferior de la pàgina');
    Add('propBrushStyle', 'Estil del pinzell usat pels fons dels objectes');
    Add('propButtons', 'Configuració dels botons visible en la finestra de visualització previa');
    Add('propCacheSize', 'Màxima memòria usada per l''informe. Si la memòria usada excedeix aquest valor, es preparen per gravar a la cache del disc');
    Add('propCalcCheckSum', 'Determina si el codi de barres ha de calcular el check de control automàticament');
    Add('propCancel', 'Determina si s''activa el botó quan es clica la tecla ESC');
    Add('propCaption', 'Títol del control');
    Add('propCellFields', 'Noms dels camps de taula representats en les cel·les');
    Add('propCellLevels', 'Número de nivells de les cel·les');
    Add('propCenter', 'Determina si l''imatge ha de sortir centrada');
    Add('propCharset', 'Tipus de charset');
    Add('propCharSpacing', 'Píxels entre dos caràcters');
    Add('propCheckColor', 'Color de marc del check');
    Add('propChecked', 'Indica si el check està marcat o no');
    Add('propCheckStyle', 'Estil del check');
    Add('propChild', 'Banda Fill connectat a aquesta banda');
    Add('propCollate', 'Opció per defecte de comparació');
    Add('propColor.TFont', 'Color del text');
    Add('propColor', 'Color de l''objecte');
    Add('propColor.TfrxFrame', 'Color del marc');
    Add('propColor.TfrxHighlight', 'Determina el color de l''objecta si el ressaltat és actiu');
    Add('propColumnFields', 'Noms dels camps de taula representats en les files cel·les');
    Add('propColumnGap', 'Espai entre columnes de la banda');
    Add('propColumnLevels', 'Número de nivells de columnes');
    Add('propColumns', 'Número de columnes en la banda');
    Add('propColumnWidth', 'Ampla de les columnes de la banda');
    Add('propCondition', 'Condició de l''agrupació. El grup es separa si el valor d''aquesta expressió canvia');
    Add('propCondition.TfrxHighlight', 'Cadena d''expressió. Si aquesta expressió es certa, el ressaltat s''activa');
    Add('propConnected', 'Indica si la connexió a la base de dades és activa');
    Add('propConvertNulls', 'Determina si un valor null de la BD es pot convertir a 0, False or cadena buida');
    Add('propCopies', 'El número de còpies per defecte');
    Add('propCursor', 'Cursor de l''objecte');
    Add('propDatabaseName', 'Nom de la base de dades');
    Add('propDataField', 'Especifica el camp d''on l''objecte obté les dades');
    Add('propDataSet', 'Enllaça ñ''objecte a la taula que conté els camps a representar');
    Add('propDate', 'Date del control');
    Add('propDateFormat', 'Especifica el format en que es presenta la data');
    Add('propDecimalSeparator', 'Separador decimal');
    Add('propDefault', 'Determina si el botó és el per defecte');
    Add('propDefHeight', 'Alçada per defecte de la fila');
    Add('propDescription', 'Descripció de l''informa');
    Add('propDiagonal', 'Indica que la línia és una diagonal');
    Add('propDisplayFormat', 'Format del valor a mostrar');
    Add('propDoubleBuffered', 'Determina si la vista prèvia usa doble buffer. Activant el doble buffer prevenim parpelleig, però és més lent');
    Add('propDoublePass', 'Determina si es vol fer una doble passada per calcular l''informe');
    Add('propDown', 'Determina si un botó es manté clicat o no');
    Add('propDownThenAcross', 'Determina la llargada de la taula creuada per dividir-la en pàgines');
    Add('propDriverName', 'Nom del driver pel BDE');
    Add('propDropShadow', 'Determina si l''objecte té ombra');
    Add('propDuplex', 'Especifica el mode duplex (impressió a dos cares) per la pàgina');
    Add('propEditMask', 'Especifica la màscara que representa que el text és vàlid en control d''edició');
    Add('propEnabled', 'Determina si el control està actiu');
    Add('propEngineOptions', 'Opcions pel càlcul de l''informe');
    Add('propExpression', 'Valor d''aquesta expressió que serà mostrat en l''objecte');
    Add('propExpressionDelimiters', 'Caràcters que són usats per tancar l''expressió continguda en el text');
    Add('propFieldAliases', 'Alies pel camp');
    Add('propFilter', 'Condició pel filtre de la taula');
    Add('propFiltered', 'Determina si la taula pot filtrar els registres usant la condició de la propietat Filter');
    Add('propFlowTo', 'L''objecte de text que mostrarà el text que no càpiga en l''objecte');
    Add('propFont', 'Atributs de la lletra de l''objecte');
    Add('propFooterAfterEach', 'Determina si el peu de la banda s''ha de mostrar a cada fila');
    Add('propFormatStr', 'Cadena de format');
    Add('propFrame', 'Atributs del marc de l''objecte');
    Add('propGapX', 'Espaiat esquerra del text');
    Add('propGapY', 'Espaiat superior del text');
    Add('propGlyph', 'Imatge del control');
    Add('propGroupIndex', 'Permet als botons treballs junts com un grup');
    Add('propHAlign', 'Justificat horitzontal del text');
    Add('propHeight', 'Alçada de l''objecte');
    Add('propHGuides', 'Guies horitzontals de la pàgina');
    Add('propHideZeros', 'Determina si l''objecte oculta els valors zero');
    Add('propHighlight', 'Atributs per la condició del ressaltat');
    Add('propIndexName', 'Nom de l''índex');
    Add('propInitString', 'Cadena d''impressió inicial dels informes per impressores d''agulles');
    Add('propItems', 'Llista d''ítems de l''objecte');
    Add('propKeepAspectRatio', 'Mantenir l''aspecte ràtio original de l''imatge');
    Add('propKeepChild', 'Determina si la banda s''ha d''imprimir junt al seu fill');
    Add('propKeepFooter', 'Determina si la banda s''ha d''imprimir junt al peu');
    Add('propKeepTogether', 'Determina si la banda s''ha d''imprimir junt a la subbanda');
    Add('propKind.TfrxFormat', 'Tipus de valor pel format');
    Add('propKind', 'Tipus de botó');
    Add('propLargeDesignHeight', 'Determina si la pàgina pot tenir una alçada major en el mode de disseny');
    Add('propLayout', 'Posició de l''imatge del botó');
    Add('propLeft', 'Coordenada esquerra de l''objecte');
    Add('propLeftMargin', 'Mida del marge esquerra de la pàgina');
    Add('propLines', 'Text de l''objecte');
    Add('propLineSpacing', 'Número de píxels entre dos línies de text');
    Add('propLoginPrompt', 'Determina si s''ha de mostrar un diàleg');
    Add('propMargin', 'Determina el número de píxels entre la vora de l''imatge i la vora del botó');
    Add('propMaster', 'Taula principal');
    Add('propMasterFields', 'Camps que relacionen un master-detail');
    Add('propMaximized', 'Determina si la vista prèvia ha de ser maximitzada');
    Add('propMaxLength', 'Longitud màxima d''un text');
    Add('propMaxPages', 'Número màxim de pàgines en un informe');
    Add('propMaxWidth', 'Amplada màxima de la columna');
    Add('propMDIChild', 'Determina si la vista prèvia ha de ser del tipus MDI child');
    Add('propMemo', 'Text de l''objecte');
    Add('propMinWidth', 'Amplada mínima de la columna');
    Add('propMirrorMargins', 'Agafar el marge més petit per totes les pàgines');
    Add('propModal', 'Determina si la vista prèvia ha de ser del tipus show modal');
    Add('propModalResult', 'Determina si i com el botó tanca un form modal');
    Add('propName.TFont', 'Nom de la lletra');
    Add('propName.TfrxReportOptions', 'Nom de l''informe');
    Add('propName', 'Nom de l''objecte');
    Add('propNumGlyphs', 'Indica el número d''imatges que hi ha en el gràfic en la propietat Glyph');
    Add('propOpenDataSource', 'Determina si s''obre automàticament un datasource');
    Add('propOrientation', 'Orientació de la pàgina');
    Add('propOutlineText', 'Text que es mostra en el perfil en la vista prèvia');
    Add('propOutlineVisible', 'Perfil visible en la vista prèvia');
    Add('propOutlineWidth', 'Amplada del perfil en la vista prèvia');
    Add('propPageNumbers.TfrxPrintOptions', 'Número de pàgines a imprimir');
    Add('propPaperHeight', 'Alçada de la pàgina');
    Add('propPaperWidth', 'Amplada de la pàgina');
    Add('propParagraphGap', 'Espai de la primera línia del paràgraf');
    Add('propParams.TfrxBDEDatabase', 'Paràmetres de la connexió');
    Add('propParams', 'Paràmetres del query');
    Add('propParentFont', 'Determina si l''objecte usa la lletra del pare');
    Add('propPassword', 'Password de l''informe');
    Add('propPasswordChar', 'Indica el caràcter, si n''hi ha, es mostren en el lloc dels caràcters entrats');
    Add('propPicture', 'Imatge');
    Add('propPicture.TfrxReportOptions', 'Descripció de l''imatge de l''informe');
    Add('propPosition', 'Posició inicial de la finestra');
    Add('propPreviewOptions', 'Opcions de la vista prèvia de l''informe');
    Add('propPrintable', 'Impressió de l''objecte. Objectes amb Printable=False es veuran en la vista prèvia però no s''imprimiran');
    Add('propPrintChildIfInvisible', 'Determina si una banda fill és impresa si la seva banda pare és invisible');
    Add('propPrinter', 'Nom de l''impressora que estarà seleccionada quan s''obre o s''executa l''informe');
    Add('propPrintIfDetailEmpty', 'Determines si s''imprimirà la banda si la seva subbanda està buida');
    Add('propPrintIfEmpty', 'Determina si s''imprimirà la pàgina si totes les taules són buides');
    Add('propPrintOnFirstPage', 'Determina si s''imprimirà la banda en la primera pàgina');
    Add('propPrintOnLastPage', 'Determina si s''imprimirà la banda en l''última pàgina');
    Add('propPrintOnParent', 'Determina si es pot imprimir el subreport en la banda pare');
    Add('propPrintOnPreviousPage', 'Determina si la pàgina pot ser generada sola o en la pàgina anterior');
    Add('propPrintOptions', 'Opcions d''impressió de l''informe');
    Add('propPrintPages', 'Determina si s''ha d''imprimir totes les pàgines, les parells o les senars');
    Add('propRangeBegin', 'Determina el punt inicial per navegar per la taula');
    Add('propRangeEnd', 'Determina el punt final per navegar per la taula');
    Add('propRangeEndCount', 'Determina el número de registres en la taula si RangeEnd és reCount');
    Add('propReadOnly', 'Determina si el text és de sols lectura');
    Add('propRepeatHeaders', 'Determina si la columna i capçalera de files poden reimprimir-se en la nova pàgina');
    Add('propReportOptions', 'Opcions de l''informe');
    Add('propReprintOnNewPage', 'Determina si la banda s''ha d''imprimir en una nova pàgina');
    Add('propRestrictions', 'Opcions de restricció');
    Add('propRightMargin','Tamany del marge dret de la pàgina');
    Add('propRotation.TfrxBarCodeView', 'Orientació del codi de barres');
    Add('propRotation', 'Rotació del text');
    Add('propRowCount', 'Número de registres virtuals en la banda');
    Add('propRowFields', 'Nom dels camps de la BD representats en les files');
    Add('propRowLevels', 'Número de nivells de files');
    Add('propRTLReading', 'Determina en quina direcció es mostra el text');
    Add('propScriptLanguage', 'Nom del llenguatge script usat en l''informe');
    Add('propSessionName', 'Nom de la sessió del BDE');
    Add('propShadowColor', 'Color de l''ombra');
    Add('propShadowWidth', 'Amplada de l''ombra');
    Add('propShape', 'Tipus de la figura');
    Add('propShiftMode', 'Comportament de l''objecte');
    Add('propShowCaptions', 'Determina si els botons de la vista prèvia han de mostrar els títols');
    Add('propShowColumnHeader', 'Determina si s''ha de mostrar la capçalera de les columnes');
    Add('propShowColumnTotal', 'Determina si s''ha de mostrar el gran total de les columnes');
    Add('propShowRowHeader', 'Determina si s''ha de mostrar la capçalera de les files');
    Add('propShowRowTotal', 'Determina si s''ha de mostrar el gran total de les files');
    Add('propShowDialog', 'Determina si s''ha de mostrar el diàleg d''impressió en la vista prèvia');
    Add('propShowText', 'Determina si el codi de barres ha de mostrar el text llegible');
    Add('propSize', 'Mida de la lletra');
    Add('propSorted', 'Determina si els ítems s''han d''ordenar o no');
    Add('propSpacing', 'Determina el número de píxels entre l''imatge i el text');
    Add('propSQL', 'Codi SQL');
    Add('propStartNewPage', 'Iniciar una nova pàgina abans d''imprimir una banda');
    Add('propStretch', 'Redimensiona l''imatge per encabir-la a l''objecte');
    Add('propStretched', 'Determina si l''objecta pot ser redimensionat');
    Add('propStretchMode', 'Comportament del redimensionament');
    Add('propStyle.TFont', 'Estil de la lletra');
    Add('propStyle', 'Estil del control');
    Add('propStyle.TfrxFrame', 'Estil del marc de l''objecte');
    Add('propSuppressRepeated', 'Suprimir valors repetits');
    Add('propTableName', 'Nom de la taula');
    Add('propTag', 'Número d''etiqueta de l''objecte');
    Add('propTagStr', 'Cadena d''etiqueta de l''objecte');
    Add('propText', 'Text de l''objecte');
    Add('propTitleBeforeHeader', 'Determina si s''ha de mostrar el títol de l''informe abans de la capçalera');
    Add('propTop', 'Coordenada superior de l''objecte');
    Add('propTopMargin', 'Mida del marge superior de la pàgina');
    Add('propTyp', 'Tipus de marc');
    Add('propUnderlines', 'Determina si el text ha de mostrar les línies de la reixa després de cada línia');
    Add('propURL', 'URL de l''objecte');
    Add('propUserName', 'Nom de l''usuari del valor de l''objecte. Aquest nom es mostrarà en l''arbre de dades');
    Add('propVAlign', 'Justificat vertical del text');
    Add('propVersionBuild', 'Versió info, build');
    Add('propVersionMajor', 'Versió info, major version');
    Add('propVersionMinor', 'Versió info, minor version');
    Add('propVersionRelease', 'Versió info, release');
    Add('propVGuides', 'Guies verticals de la pàgina');
    Add('propVisible', 'Si l''objecte és visible');
    Add('propWidth', 'Amplada de l''objecte');
    Add('propWidth.TfrxFrame', 'Amplada del marc');
    Add('propWindowState', 'Estat inicial de la finestra');
    Add('propWordBreak', 'Partí paraules en rus');
    Add('propWordWrap', 'Determina si el text pot afegir salts de línia per mantenir el marge dret');
    Add('propZoom.TfrxBarCodeView', 'Zoom del codi de barres');
    Add('propZoom', 'Factor inicial de zoom de la vista prèvia');
    Add('propZoomMode', 'Moda inicial del zoom mode de la vista prèvia');
  end;
end;


initialization
  frAddInspectorRes;

end.
