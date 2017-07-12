
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
    Add('propActive', 'Especifica quan una taula est� o no oberta');
    Add('propActive.TfrxHighlight', 'Especifica quan un ressalt est� actiu');
    Add('propAliasName', 'Nom de l''alies del BDE');
    Add('propAlign', 'Determina l''ajust de l''objecta relatiu a la banda o p�gina');
    Add('propAlignment', 'Ajustament del text');
    Add('propAllowAllUp', 'Especifica quan totes el botons d''un grup poden ser deseleccionats a la vegada');
    Add('propAllowEdit', 'Determina quan l''usuari pot editar el preparador de p�gines de l''informe');
    Add('propAllowExpressions', 'Determina quan el text pot contenir expressions');
    Add('propAllowGrayed', 'Permetre l''estat gris en els controls checkboxes');
    Add('propAllowHTMLTags', 'Determina quan el text pot contenir codi HTML');
    Add('propAllowSplit', 'Determina si la banda pot dividir-se en varies p�gines');
    Add('propAuthor', 'Autor de l''informe');
    Add('propAutoSize', 'Determina si la imatge es dimensiona autom�ticament');
    Add('propAutoWidth', 'Determina si el text es dimensiona l''amplada autom�ticament');
    Add('propBackPicture', 'Imatge pel fons de la p�gina');
    Add('propBarType', 'Tipus de Codi de Barres');
    Add('propBevelInner', 'Tipus de bisell sortit');
    Add('propBevelOuter', 'Tipus de bisell enfonsat');
    Add('propBevelWidth', 'Amplada del bisell');
    Add('propBorder', 'Determina si es mostra la vora o no');
    Add('propBorderStyle', 'Estil de la finestra');
    Add('propBottomMargin', 'Mida del marge inferior de la p�gina');
    Add('propBrushStyle', 'Estil del pinzell usat pels fons dels objectes');
    Add('propButtons', 'Configuraci� dels botons visible en la finestra de visualitzaci� previa');
    Add('propCacheSize', 'M�xima mem�ria usada per l''informe. Si la mem�ria usada excedeix aquest valor, es preparen per gravar a la cache del disc');
    Add('propCalcCheckSum', 'Determina si el codi de barres ha de calcular el check de control autom�ticament');
    Add('propCancel', 'Determina si s''activa el bot� quan es clica la tecla ESC');
    Add('propCaption', 'T�tol del control');
    Add('propCellFields', 'Noms dels camps de taula representats en les cel�les');
    Add('propCellLevels', 'N�mero de nivells de les cel�les');
    Add('propCenter', 'Determina si l''imatge ha de sortir centrada');
    Add('propCharset', 'Tipus de charset');
    Add('propCharSpacing', 'P�xels entre dos car�cters');
    Add('propCheckColor', 'Color de marc del check');
    Add('propChecked', 'Indica si el check est� marcat o no');
    Add('propCheckStyle', 'Estil del check');
    Add('propChild', 'Banda Fill connectat a aquesta banda');
    Add('propCollate', 'Opci� per defecte de comparaci�');
    Add('propColor.TFont', 'Color del text');
    Add('propColor', 'Color de l''objecte');
    Add('propColor.TfrxFrame', 'Color del marc');
    Add('propColor.TfrxHighlight', 'Determina el color de l''objecta si el ressaltat �s actiu');
    Add('propColumnFields', 'Noms dels camps de taula representats en les files cel�les');
    Add('propColumnGap', 'Espai entre columnes de la banda');
    Add('propColumnLevels', 'N�mero de nivells de columnes');
    Add('propColumns', 'N�mero de columnes en la banda');
    Add('propColumnWidth', 'Ampla de les columnes de la banda');
    Add('propCondition', 'Condici� de l''agrupaci�. El grup es separa si el valor d''aquesta expressi� canvia');
    Add('propCondition.TfrxHighlight', 'Cadena d''expressi�. Si aquesta expressi� es certa, el ressaltat s''activa');
    Add('propConnected', 'Indica si la connexi� a la base de dades �s activa');
    Add('propConvertNulls', 'Determina si un valor null de la BD es pot convertir a 0, False or cadena buida');
    Add('propCopies', 'El n�mero de c�pies per defecte');
    Add('propCursor', 'Cursor de l''objecte');
    Add('propDatabaseName', 'Nom de la base de dades');
    Add('propDataField', 'Especifica el camp d''on l''objecte obt� les dades');
    Add('propDataSet', 'Enlla�a �''objecte a la taula que cont� els camps a representar');
    Add('propDate', 'Date del control');
    Add('propDateFormat', 'Especifica el format en que es presenta la data');
    Add('propDecimalSeparator', 'Separador decimal');
    Add('propDefault', 'Determina si el bot� �s el per defecte');
    Add('propDefHeight', 'Al�ada per defecte de la fila');
    Add('propDescription', 'Descripci� de l''informa');
    Add('propDiagonal', 'Indica que la l�nia �s una diagonal');
    Add('propDisplayFormat', 'Format del valor a mostrar');
    Add('propDoubleBuffered', 'Determina si la vista pr�via usa doble buffer. Activant el doble buffer prevenim parpelleig, per� �s m�s lent');
    Add('propDoublePass', 'Determina si es vol fer una doble passada per calcular l''informe');
    Add('propDown', 'Determina si un bot� es mant� clicat o no');
    Add('propDownThenAcross', 'Determina la llargada de la taula creuada per dividir-la en p�gines');
    Add('propDriverName', 'Nom del driver pel BDE');
    Add('propDropShadow', 'Determina si l''objecte t� ombra');
    Add('propDuplex', 'Especifica el mode duplex (impressi� a dos cares) per la p�gina');
    Add('propEditMask', 'Especifica la m�scara que representa que el text �s v�lid en control d''edici�');
    Add('propEnabled', 'Determina si el control est� actiu');
    Add('propEngineOptions', 'Opcions pel c�lcul de l''informe');
    Add('propExpression', 'Valor d''aquesta expressi� que ser� mostrat en l''objecte');
    Add('propExpressionDelimiters', 'Car�cters que s�n usats per tancar l''expressi� continguda en el text');
    Add('propFieldAliases', 'Alies pel camp');
    Add('propFilter', 'Condici� pel filtre de la taula');
    Add('propFiltered', 'Determina si la taula pot filtrar els registres usant la condici� de la propietat Filter');
    Add('propFlowTo', 'L''objecte de text que mostrar� el text que no c�piga en l''objecte');
    Add('propFont', 'Atributs de la lletra de l''objecte');
    Add('propFooterAfterEach', 'Determina si el peu de la banda s''ha de mostrar a cada fila');
    Add('propFormatStr', 'Cadena de format');
    Add('propFrame', 'Atributs del marc de l''objecte');
    Add('propGapX', 'Espaiat esquerra del text');
    Add('propGapY', 'Espaiat superior del text');
    Add('propGlyph', 'Imatge del control');
    Add('propGroupIndex', 'Permet als botons treballs junts com un grup');
    Add('propHAlign', 'Justificat horitzontal del text');
    Add('propHeight', 'Al�ada de l''objecte');
    Add('propHGuides', 'Guies horitzontals de la p�gina');
    Add('propHideZeros', 'Determina si l''objecte oculta els valors zero');
    Add('propHighlight', 'Atributs per la condici� del ressaltat');
    Add('propIndexName', 'Nom de l''�ndex');
    Add('propInitString', 'Cadena d''impressi� inicial dels informes per impressores d''agulles');
    Add('propItems', 'Llista d''�tems de l''objecte');
    Add('propKeepAspectRatio', 'Mantenir l''aspecte r�tio original de l''imatge');
    Add('propKeepChild', 'Determina si la banda s''ha d''imprimir junt al seu fill');
    Add('propKeepFooter', 'Determina si la banda s''ha d''imprimir junt al peu');
    Add('propKeepTogether', 'Determina si la banda s''ha d''imprimir junt a la subbanda');
    Add('propKind.TfrxFormat', 'Tipus de valor pel format');
    Add('propKind', 'Tipus de bot�');
    Add('propLargeDesignHeight', 'Determina si la p�gina pot tenir una al�ada major en el mode de disseny');
    Add('propLayout', 'Posici� de l''imatge del bot�');
    Add('propLeft', 'Coordenada esquerra de l''objecte');
    Add('propLeftMargin', 'Mida del marge esquerra de la p�gina');
    Add('propLines', 'Text de l''objecte');
    Add('propLineSpacing', 'N�mero de p�xels entre dos l�nies de text');
    Add('propLoginPrompt', 'Determina si s''ha de mostrar un di�leg');
    Add('propMargin', 'Determina el n�mero de p�xels entre la vora de l''imatge i la vora del bot�');
    Add('propMaster', 'Taula principal');
    Add('propMasterFields', 'Camps que relacionen un master-detail');
    Add('propMaximized', 'Determina si la vista pr�via ha de ser maximitzada');
    Add('propMaxLength', 'Longitud m�xima d''un text');
    Add('propMaxPages', 'N�mero m�xim de p�gines en un informe');
    Add('propMaxWidth', 'Amplada m�xima de la columna');
    Add('propMDIChild', 'Determina si la vista pr�via ha de ser del tipus MDI child');
    Add('propMemo', 'Text de l''objecte');
    Add('propMinWidth', 'Amplada m�nima de la columna');
    Add('propMirrorMargins', 'Agafar el marge m�s petit per totes les p�gines');
    Add('propModal', 'Determina si la vista pr�via ha de ser del tipus show modal');
    Add('propModalResult', 'Determina si i com el bot� tanca un form modal');
    Add('propName.TFont', 'Nom de la lletra');
    Add('propName.TfrxReportOptions', 'Nom de l''informe');
    Add('propName', 'Nom de l''objecte');
    Add('propNumGlyphs', 'Indica el n�mero d''imatges que hi ha en el gr�fic en la propietat Glyph');
    Add('propOpenDataSource', 'Determina si s''obre autom�ticament un datasource');
    Add('propOrientation', 'Orientaci� de la p�gina');
    Add('propOutlineText', 'Text que es mostra en el perfil en la vista pr�via');
    Add('propOutlineVisible', 'Perfil visible en la vista pr�via');
    Add('propOutlineWidth', 'Amplada del perfil en la vista pr�via');
    Add('propPageNumbers.TfrxPrintOptions', 'N�mero de p�gines a imprimir');
    Add('propPaperHeight', 'Al�ada de la p�gina');
    Add('propPaperWidth', 'Amplada de la p�gina');
    Add('propParagraphGap', 'Espai de la primera l�nia del par�graf');
    Add('propParams.TfrxBDEDatabase', 'Par�metres de la connexi�');
    Add('propParams', 'Par�metres del query');
    Add('propParentFont', 'Determina si l''objecte usa la lletra del pare');
    Add('propPassword', 'Password de l''informe');
    Add('propPasswordChar', 'Indica el car�cter, si n''hi ha, es mostren en el lloc dels car�cters entrats');
    Add('propPicture', 'Imatge');
    Add('propPicture.TfrxReportOptions', 'Descripci� de l''imatge de l''informe');
    Add('propPosition', 'Posici� inicial de la finestra');
    Add('propPreviewOptions', 'Opcions de la vista pr�via de l''informe');
    Add('propPrintable', 'Impressi� de l''objecte. Objectes amb Printable=False es veuran en la vista pr�via per� no s''imprimiran');
    Add('propPrintChildIfInvisible', 'Determina si una banda fill �s impresa si la seva banda pare �s invisible');
    Add('propPrinter', 'Nom de l''impressora que estar� seleccionada quan s''obre o s''executa l''informe');
    Add('propPrintIfDetailEmpty', 'Determines si s''imprimir� la banda si la seva subbanda est� buida');
    Add('propPrintIfEmpty', 'Determina si s''imprimir� la p�gina si totes les taules s�n buides');
    Add('propPrintOnFirstPage', 'Determina si s''imprimir� la banda en la primera p�gina');
    Add('propPrintOnLastPage', 'Determina si s''imprimir� la banda en l''�ltima p�gina');
    Add('propPrintOnParent', 'Determina si es pot imprimir el subreport en la banda pare');
    Add('propPrintOnPreviousPage', 'Determina si la p�gina pot ser generada sola o en la p�gina anterior');
    Add('propPrintOptions', 'Opcions d''impressi� de l''informe');
    Add('propPrintPages', 'Determina si s''ha d''imprimir totes les p�gines, les parells o les senars');
    Add('propRangeBegin', 'Determina el punt inicial per navegar per la taula');
    Add('propRangeEnd', 'Determina el punt final per navegar per la taula');
    Add('propRangeEndCount', 'Determina el n�mero de registres en la taula si RangeEnd �s reCount');
    Add('propReadOnly', 'Determina si el text �s de sols lectura');
    Add('propRepeatHeaders', 'Determina si la columna i cap�alera de files poden reimprimir-se en la nova p�gina');
    Add('propReportOptions', 'Opcions de l''informe');
    Add('propReprintOnNewPage', 'Determina si la banda s''ha d''imprimir en una nova p�gina');
    Add('propRestrictions', 'Opcions de restricci�');
    Add('propRightMargin','Tamany del marge dret de la p�gina');
    Add('propRotation.TfrxBarCodeView', 'Orientaci� del codi de barres');
    Add('propRotation', 'Rotaci� del text');
    Add('propRowCount', 'N�mero de registres virtuals en la banda');
    Add('propRowFields', 'Nom dels camps de la BD representats en les files');
    Add('propRowLevels', 'N�mero de nivells de files');
    Add('propRTLReading', 'Determina en quina direcci� es mostra el text');
    Add('propScriptLanguage', 'Nom del llenguatge script usat en l''informe');
    Add('propSessionName', 'Nom de la sessi� del BDE');
    Add('propShadowColor', 'Color de l''ombra');
    Add('propShadowWidth', 'Amplada de l''ombra');
    Add('propShape', 'Tipus de la figura');
    Add('propShiftMode', 'Comportament de l''objecte');
    Add('propShowCaptions', 'Determina si els botons de la vista pr�via han de mostrar els t�tols');
    Add('propShowColumnHeader', 'Determina si s''ha de mostrar la cap�alera de les columnes');
    Add('propShowColumnTotal', 'Determina si s''ha de mostrar el gran total de les columnes');
    Add('propShowRowHeader', 'Determina si s''ha de mostrar la cap�alera de les files');
    Add('propShowRowTotal', 'Determina si s''ha de mostrar el gran total de les files');
    Add('propShowDialog', 'Determina si s''ha de mostrar el di�leg d''impressi� en la vista pr�via');
    Add('propShowText', 'Determina si el codi de barres ha de mostrar el text llegible');
    Add('propSize', 'Mida de la lletra');
    Add('propSorted', 'Determina si els �tems s''han d''ordenar o no');
    Add('propSpacing', 'Determina el n�mero de p�xels entre l''imatge i el text');
    Add('propSQL', 'Codi SQL');
    Add('propStartNewPage', 'Iniciar una nova p�gina abans d''imprimir una banda');
    Add('propStretch', 'Redimensiona l''imatge per encabir-la a l''objecte');
    Add('propStretched', 'Determina si l''objecta pot ser redimensionat');
    Add('propStretchMode', 'Comportament del redimensionament');
    Add('propStyle.TFont', 'Estil de la lletra');
    Add('propStyle', 'Estil del control');
    Add('propStyle.TfrxFrame', 'Estil del marc de l''objecte');
    Add('propSuppressRepeated', 'Suprimir valors repetits');
    Add('propTableName', 'Nom de la taula');
    Add('propTag', 'N�mero d''etiqueta de l''objecte');
    Add('propTagStr', 'Cadena d''etiqueta de l''objecte');
    Add('propText', 'Text de l''objecte');
    Add('propTitleBeforeHeader', 'Determina si s''ha de mostrar el t�tol de l''informe abans de la cap�alera');
    Add('propTop', 'Coordenada superior de l''objecte');
    Add('propTopMargin', 'Mida del marge superior de la p�gina');
    Add('propTyp', 'Tipus de marc');
    Add('propUnderlines', 'Determina si el text ha de mostrar les l�nies de la reixa despr�s de cada l�nia');
    Add('propURL', 'URL de l''objecte');
    Add('propUserName', 'Nom de l''usuari del valor de l''objecte. Aquest nom es mostrar� en l''arbre de dades');
    Add('propVAlign', 'Justificat vertical del text');
    Add('propVersionBuild', 'Versi� info, build');
    Add('propVersionMajor', 'Versi� info, major version');
    Add('propVersionMinor', 'Versi� info, minor version');
    Add('propVersionRelease', 'Versi� info, release');
    Add('propVGuides', 'Guies verticals de la p�gina');
    Add('propVisible', 'Si l''objecte �s visible');
    Add('propWidth', 'Amplada de l''objecte');
    Add('propWidth.TfrxFrame', 'Amplada del marc');
    Add('propWindowState', 'Estat inicial de la finestra');
    Add('propWordBreak', 'Part� paraules en rus');
    Add('propWordWrap', 'Determina si el text pot afegir salts de l�nia per mantenir el marge dret');
    Add('propZoom.TfrxBarCodeView', 'Zoom del codi de barres');
    Add('propZoom', 'Factor inicial de zoom de la vista pr�via');
    Add('propZoomMode', 'Moda inicial del zoom mode de la vista pr�via');
  end;
end;


initialization
  frAddInspectorRes;

end.
