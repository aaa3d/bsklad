// German translation by Wolfgang Kleinrath 2004.09.03
// Weitere Anpassungen von Robert Wismet (www.rowisoft.de) 2004.10.10
// und Gerd Rech (www.iq-s.de)
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
    Add('propActive', 'Legt fest, ob ein Dataset geöffnet ist');
    Add('propActive.TfrxHighlight', 'Legt fest, ob Hervorhebung aktiv ist');
    Add('propAliasName', 'Name des BDE-Alias');
    Add('propAlign', 'Legt die Ausrichtung des Objektes relativ zum Band oder der Seite fest');
    Add('propAlignment', 'Ausrichtung des Textes des Objekts');
    Add('propAllowAllUp', 'Legt fest, ob alle Schalter in der Gruppe zugleich ausgeschaltet sein dürfen');
    Add('propAllowEdit', 'Legt fest, ob fertige Reportseiten bearbeitet werden können');
    Add('propAllowExpressions', 'Legt fest, ob das Textobjekt Ausdrücke im Text enthalten darf');
    Add('propAllowGrayed', 'Erlaubt Grauzustand eines Kontrollkästchens');
    Add('propAllowHTMLTags', 'Legt fest, ob das Textobjekt HTML tags im Text enthalten darf');
    Add('propAllowSplit', 'Legt fest, ob das Band seinen Inhalt über mehrere Seiten aufteilen darf');
    Add('propAuthor', 'Der Autor des Reports');
    Add('propAutoSize', 'Legt fest, ob das Bild seine Größe automatisch berechnet');
    Add('propAutoWidth', 'Legt fest, ob das Textobjekt seine Breite automatisch berechnet');
    Add('propBackPicture', 'Hintergrundbild');
    Add('propBarType', 'Der Typ des Barcodes');
    Add('propBevelInner', 'Der Typ des inneren Rahmens');
    Add('propBevelOuter', 'Der Typ des äußeren Rahmens');
    Add('propBevelWidth', 'Die Breite des Rahmens');
    Add('propBorder', 'Legt fest, ob der äußere Rahmen angezeigt wird');
    Add('propBorderStyle', 'Der Stil des Fensters');
    Add('propBottomMargin', 'Die Größe des unteren Seitenrandes');
    Add('propBrushStyle', 'Der Pinselstil für den Hintergrund des Objektes');
    Add('propButtons', 'Set von Schaltern im Vorschaufenster');
    Add('propCacheSize', 'Maximaler Speicher für die Reportengine. Wenn dieser Wert überschritten wrid, werden fertige Seiten auf Platte zwischengespeichert');
    Add('propCalcCheckSum', 'Legt fest, ob der Barcode die Checksumme automatisch berechnet');
    Add('propCancel', 'Legt fest, ob der Schalter druch Drücken von Escape aktiviert wird');
    Add('propCaption', 'Beschriftung des Objektes');
    Add('propCellFields', 'Namen der DB Felder repräsentieren die Kreuzzellen');
    Add('propCellLevels', 'Anzahl der Zellebenen');
    Add('propCenter', 'Legt fest, ob das Bild innerhalb des Objektes zentriert wird');
    Add('propCharset', 'Zeichensatz der Schrift');
    Add('propCharSpacing', 'Anzahl der Pixel zwischen zwei Zeichen');
    Add('propCheckColor', 'Farbe des Häkchens');
    Add('propChecked', 'Legt fest, ob das Objekt angehakt ist');
    Add('propCheckStyle', 'Stil des Häkchens');
    Add('propChild', 'Childband mit diesem Band verknüpft');
    Add('propCollate', 'Vorgabeeinstellung der Sortierung');
    Add('propColor.TFont', 'Die Farbe des Textes');
    Add('propColor', 'Die Farbe des Objektes');
    Add('propColor.TfrxFrame', 'Die Farbe des Rahmens');
    Add('propColor.TfrxHighlight', 'Legt die Farbe des Objektes fest, wenn Hervorhebung aktiv ist');
    Add('propColumnFields', 'Feldnamen repräsentieren Kreuzspalten');
    Add('propColumnGap', 'Der Abstand zwischen den Spalten');
    Add('propColumnLevels', 'Anzahl der Spaltenebenen');
    Add('propColumns', 'Anzahl der Spalten im Band');
    Add('propColumnWidth', 'Die Breite der Spalte des Bandes');
    Add('propCondition', 'Die Gruppenbedingung. Gruppenumbruch erfolgt, wenn dieser Wert wechselt');
    Add('propCondition.TfrxHighlight', 'Ausdruck. Wenn dieser Ausdruck wahr ist, wird Hervorhebung aktiviert');
    Add('propConnected', 'Legt fest, ob die Datenbankverbindung aktiv ist');
    Add('propConvertNulls', 'Legt fest, ob Nullwerte in der Datenbank in 0, False oder leere Zeichenkette konvertiert werden');
    Add('propCopies', 'Vorgabewert der Kopienanzahl');
    Add('propCursor', 'Cursor des Objektes');
    Add('propDatabaseName', 'Der Name der Datenbank');
    Add('propDataField', 'Legt das Feld fest, von dem das Objekt die Daten erhält');
    Add('propDataSet', 'Verbindet das Objekt mit dem Dataset, das das Datenfeld enthält');
    Add('propDate', 'Der Datumswert des Objektes');
    Add('propDateFormat', 'Legt fest, ion welchen Format das Datum angezeigt wird');
    Add('propDecimalSeparator', 'Das Dezimaltrennzeichen');
    Add('propDefault', 'Legt fest, ob die Schaltfläche die Standardschaltfläche ist');
    Add('propDefHeight', 'Vorgabe der Zeilenhöhe');
    Add('propDescription', 'Die Reportbeschreibung');
    Add('propDiagonal', 'Legt fest, dass die Linie diagonal verläuft');
    Add('propDisplayFormat', 'Das Anzeigeformat');
    Add('propDoubleBuffered', 'Legt fest, ob das Vorschaufenster Doppelbuffer verwendet (kein Flackern aber langsamer)');
    Add('propDoublePass', 'Legt fest, ob die Reportengine zweiten Durchlauf startet');
    Add('propDown', 'Legt fest, ob der Schalter gedrpckt ist');
    Add('propDownThenAcross', 'Legt fest, wie große Tabellen auf Seiten aufgeteilt werden');
    Add('propDriverName', 'Der Name des BDE Treibers');
    Add('propDropShadow', 'Legt fest, ob das Objekt einen Schatten hat');
    Add('propDuplex', 'Legt den Duplexmodus für die Seite fest');
    Add('propEditMask', 'Legt die Eingabe-/Anzeigemaske für das Objekt fest');
    Add('propEnabled', 'Legt fest, ob das Objekt abgeblendet ist');
    Add('propEngineOptions', 'Die Engineoptionen für den Repoprt');
    Add('propExpression', 'Der Wert dieses Ausdrucks wird im Objekt angezeigt');
    Add('propExpressionDelimiters', 'Diese Zeichen begrenzen einen Ausdruck im Text');
    Add('propFieldAliases', 'Feldaliase des Datasets');
    Add('propFilter', 'Die Filterbedingung des Datasets');
    Add('propFiltered', 'Legt fest, ob das Dataset die Sätze gemäß Filterbedingung filtert');
    Add('propFlowTo', 'Das Textobjekt, das überzähligen Text anzeigt');
    Add('propFont', 'Die Schriftattribute des Objektes');
    Add('propFooterAfterEach', 'Legt fest, ob das Fußband nach jeder Datenzeile angezeigt wird');
    Add('propFormatStr', 'Die Foramtzeichenkette');
    Add('propFrame', 'Die Rahmeneigenschaften des Objektes');
    Add('propGapX', 'Der linke Abstand des Textes');
    Add('propGapY', 'Der obere Abstand des Textes');
    Add('propGlyph', 'Das Bild des Objektes');
    Add('propGroupIndex', 'Fasst Schalter zu einer Gruppe zusammen');
    Add('propHAlign', 'Die horizontale Ausrichtung des Textes');
    Add('propHeight', 'Die Höhe des Objektes');
    Add('propHGuides', 'Horizontale Führungslinien der Seite');
    Add('propHideZeros', 'Legt fest, ob Nullwerte unterdrückt werden');
    Add('propHighlight', 'Die Eigenschaften der bedingten Hervorhebung');
    Add('propIndexName', 'Der Name des Index');
    Add('propInitString', 'Drucker init Zeichenkette für dot-matrix Reports');
    Add('propItems', 'Listet die Elemente des Objekts');
    Add('propKeepAspectRatio', 'Behält das Seitenverhältnis des Bildes');
    Add('propKeepChild', 'Legt fest, ob das Band zusammen mit dem Child gedruckt wird');
    Add('propKeepFooter', 'Legt fest, ob das Band zusammen mit dem Fuß gedruckt wird');
    Add('propKeepHeader', 'Legt fest, ob das Band zusammen mit seinem Kopf gedruckt wird');
    Add('propKeepTogether', 'Legt fest, ob das Band zusammen mit allen Unterbändern gedruckt wird');
    Add('propKind.TfrxFormat', 'Die Art der Formatierung');
    Add('propKind', 'Die Art der Schaltfläche');
    Add('propLargeDesignHeight', 'Legt fest, ob die Seite im Entwurfsmodus vergößert wird');
    Add('propLayout', 'Anordnung des Bildes auf der Schaltfläche');
    Add('propLeft', 'Die linke Koordinate des Objekts');
    Add('propLeftMargin', 'Die Größe des linken Seitenrandes');
    Add('propLines', 'Der Text des Objektes');
    Add('propLineSpacing', 'Der Abstand zwischen zwei Textzeilen in Pixel');
    Add('propLoginPrompt', 'Legt fest, ob der Anmeldedialog angezeigt wird');
    Add('propMargin', 'Legt die Anzahl der Pixel zwischen dem Bildrand und dem Rand der Schaltfläche fest');
    Add('propMaster', 'Das Hauptdataset');
    Add('propMasterFields', 'Die Felder, die durch Master-Detailbeziehung verbunden sind');
    Add('propMaximized', 'Legt fest, ob das Vorschaufenster maximiert wird');
    Add('propMaxLength', 'Maximale Textlänge');
    Add('propMaxPages', 'Maximale Anzahl der Seiten im vorbereiteten Report');
    Add('propMaxWidth', 'Maximale Breite der Spalte');
    Add('propMDIChild', 'Legt fest, ob das Vorschaufenster ein MDI-child ist');
    Add('propMemo', 'Der Text des Objektes');
    Add('propMinWidth', 'Minimale Breite der Spalte');
    Add('propMirrorMargins', 'Seitenränder auf geraden Seiten spiegeln');
    Add('propModal', 'Legt fest, ob das Vorschaufenster modal angezeigt wird');
    Add('propModalResult', 'Legt fest, ob und wie die Schaltfläche das modale Formular schließt');
    Add('propName.TFont', 'Der Name der Schrift');
    Add('propName.TfrxReportOptions', 'Der Name des Reports');
    Add('propName', 'Der Name des Objekts');
    Add('propNumGlyphs', 'Legt die Anzahl der Bilder fest, die in der Grafik sind, die in der Glypheigenschaft definiert ist');
    Add('propOpenDataSource', 'Legt fest, ob die Datasource automatisch geöffnet wird');
    Add('propOrientation', 'Die Ausrichtung der Seite');
    Add('propOutlineText', 'Der Text, der in der Outline des Vorschaufensters angezeigt wird');
    Add('propOutlineVisible', 'Die Sichtbarkeit der Outline im Vorschaufenster');
    Add('propOutlineWidth', 'Die Breite der Outline');
    Add('propPageNumbers.TfrxPrintOptions', 'Die Anazhl der Seiten, die gedruckt werden');
    Add('propPaperHeight', 'Die Höhe der Seite');
    Add('propPaperWidth', 'Die Breite der Seite');
    Add('propParagraphGap', 'Der Ertzeileneinzug des Absatzes');
    Add('propParams.TfrxBDEDatabase', 'Die Parameter der Verbindung');
    Add('propParams', 'Die Parameter der Abfrage');
    Add('propParentFont', 'Legt fest, ob das Objekt Schrifteinstellungen übernimmt');
    Add('propPassword', 'Das Passwort des Reports');
    Add('propPasswordChar', 'Legt das Zeichen fest, das an Stelle des Originalzeichens bei Passwörtern erscheint');
    Add('propPicture', 'Das Bild');
    Add('propPicture.TfrxReportOptions', 'Die Bioldbeschreibung des Reports');
    Add('propPosition', 'Die Anfangsposition des Fensters');
    Add('propPreviewOptions', 'Die Vorschauoptionen des Reports');
    Add('propPrintable', 'Druckbarkeit des Objektes. Wenn False, wird das Objekt in der Vorschau angezeigt, aber nicht gedruckt');
    Add('propPrintChildIfInvisible', 'Legt fest, ob das Childband gedruckt wird, wenn das Hauptband unsichtbar ist');
    Add('propPrinter', 'Der Name des Druckers, der beim Öffnen oder Erstellen des Reports verwendet wird');
    Add('propPrintIfDetailEmpty', 'Legt fest, ob das Datenband gedruckt wird, wenn sein Unterband leer ist');
    Add('propPrintIfEmpty', 'Legt fest, ob die Seite gedruckt wird, wenn alle Datasets leer sind');
    Add('propPrintOnFirstPage', 'Legt fest, ob das Band auf der ersten Seite gedruckt wird');
    Add('propPrintOnLastPage', 'Legt fest, ob das Band auf der letzten Seite gedruckt wird');
    Add('propPrintOnParent', 'Legt fest, ob der Unterreport auf dem Hauptband gedruckt wird');
    Add('propPrintOnPreviousPage', 'Legt fest, ob die Seite auf dem verbleibenden freien Platz der vorigen Seite erzeugt wird');
    Add('propPrintOptions', 'Druckoptionen des Reports');
    Add('propPrintPages', 'Legt fest, ob alle, ungerade oder gerade Seiten gedruckt werden');
    Add('propRangeBegin', 'Legt den Anfang des Datasetdurchlaufes fest');
    Add('propRangeEnd', 'Legt das Ende des Datasetdurchlaufes fest');
    Add('propRangeEndCount', 'Legt die Anzahl der Datensätze fest, wenn das Durchlaufende auf reCount gesetzt ist');
    Add('propReadOnly', 'Legt Nur-Lesen-Eigenschaft des Objektes fest');
    Add('propRepeatHeaders', 'Legt fest, Spalten/Zeilenkopf auf jeder neuen Seite wiederholt wird');
    Add('propReportOptions', 'Die Optionen des Reports');
    Add('propReprintOnNewPage', 'Legt fest, ob das Band auf jeder neuen Seite wiederholt wird');
    Add('propRestrictions', 'Gruppe von Einschränkungen');
    Add('propRightMargin', 'Die Größe des rechten Randes');
    Add('propRotation.TfrxBarCodeView', 'Die Ausrichtung des Barcodes');
    Add('propRotation', 'Die Textdrehung');
    Add('propRowCount', 'Anzahl der virtuellen Sätze im Datenband');
    Add('propRowFields', 'Feldnamen repräsentieren Kreuzzeilen');
    Add('propRowLevels', 'Anzahl der Zeilenebenen');
    Add('propRTLReading', 'Legt fest, ob der Text von rechts nach links dargestellt wird');
    Add('propScriptLanguage', 'Der Name der Scriptsprache im Report');
    Add('propSessionName', 'Der Name der BDE session');
    Add('propShadowColor', 'Die Farbe des Schattens');
    Add('propShadowWidth', 'Die Breite des Schattens');
    Add('propShape', 'Der Typ der Figur');
    Add('propShiftMode', 'Verschiebeverhalten des Objektes');
    Add('propShowCaptions', 'Legt fest, ob die Schaltflächen in der Vorschau die Beschriftung anzeigen');
    Add('propShowColumnHeader', 'Legt fest, ob Cross-tab Spaltenköpfe anzeigt');
    Add('propShowColumnTotal', 'Legt fest, ob Cross-tab Gesamtsummen der Spalten anzeigt');
    Add('propShowRowHeader', 'Legt fest, ob Cross-tab Zeilenköpfe anzeigt');
    Add('propShowRowTotal', 'Legt fest, ob Cross-tab Gesamtsummen der Zeilen anzeigt');
    Add('propShowDialog', 'Legt fest, ob der Druckdialog im Vorschaufenster angezeigt wird');
    Add('propShowText', 'Legt fest, ob das Barcodeobjekt lesbaren Text anzeigt');
    Add('propSize', 'Die Größe der Schrift');
    Add('propSorted', 'Legt fest, ob die Elemente sortiert werden');
    Add('propSpacing', 'Legt die die Anzahl der Pixel zwischen Bild und Text fest');
    Add('propSQL', 'Der SQL Befehl');
    Add('propStartNewPage', 'Beginnt eine neue Seite bevor das Band gedruckt wird');
    Add('propStretch', 'Dehnt das Bild bis zur Objektgröße');
    Add('propStretched', 'Legt fest, ob das Objekt gedehnt werden kann');
    Add('propStretchMode', 'Dehnverhalten des Objektes');
    Add('propStyle.TFont', 'Der Stil der Schrift');
    Add('propStyle', 'Der Stil des Objektes');
    Add('propStyle.TfrxFrame', 'Der Rahmenstil des Objektes');
    Add('propSuppressRepeated', 'Wiederholte Werte unterdrücken');
    Add('propTableName', 'Der Name der Datentabelle');
    Add('propTag', 'Tagnummer des Objektes');
    Add('propTagStr', 'Tagzeichenkette des Objektes');
    Add('propText', 'Der Text des Objektes');
    Add('propTitleBeforeHeader', 'Legt fest, ob Reporttitel vor dem Seitenkopf angezeigt wird');
    Add('propTop', 'Die obere Koordinate des Objektes');
    Add('propTopMargin', 'Die Größe des oberen Seitenrandes');
    Add('propTyp', 'Der Typ des Rahmens');
    Add('propUnderlines', 'Legt fest, ob das Textobjekt Gitterlinien nach jeder Textzeile anzeigt');
    Add('propURL', 'Die URL des Objekts');
    Add('propUserName', 'Username des Datenobjektes. Dieser Name wird im Datenbaum angezeigt');
    Add('propVAlign', 'Die vertikale Ausrichtung des Textes');
    Add('propVersionBuild', 'Versioninfo, build');
    Add('propVersionMajor', 'Versioninfo, major version');
    Add('propVersionMinor', 'Versioninfo, minor version');
    Add('propVersionRelease', 'Versioninfo, release');
    Add('propVGuides', 'Die vertikalen Führungslinien der Seite');
    Add('propVisible', 'Sichtbarkeit des Objektes');
    Add('propWidth', 'Breit des Objektes');
    Add('propWidth.TfrxFrame', 'Die Breite des Rahmens');
    Add('propWindowState', 'Anfangsanzeigestatus des Fensters');
    Add('propWordBreak', 'Silbentrennung (russisch)');
    Add('propWordWrap', 'Legt fest, ob das Textobjekt weiche Zeilenschaltungen einfügt');
    Add('propZoom.TfrxBarCodeView', 'Zoomt den Barcode');
    Add('propZoom', 'Anfänglicher Zoomfaktor des Vorschaufensters');
    Add('propZoomMode', 'Anfänglicher Zoommodus des Vorschaufensters');
  end;
end;


initialization
  frAddInspectorRes;

end.
