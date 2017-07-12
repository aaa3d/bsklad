
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
    Add('propActive', 'Geeft aan of een dataset wel of niet geopend is');
    Add('propActive.TfrxHighlight', 'Geeft aan of een highlight wel of niet aktief is');
    Add('propAliasName', 'De naam van de BDE alias');
    Add('propAlign', 'Bepaalt of de uitlijning van een object gerelateerd is aan de band of aan de pagina');
    Add('propAlignment', 'De uitlijning van de tekst van het object');
    Add('propAllowAllUp', 'Bepaalt of alle knoppen in de groep tegelijkertijd gedeselecteerd kunnen worden');
    Add('propAllowEdit', 'Bepaalt of de gebruiker de voorgedefinieerde rapportpagina''s mag bewerken');
    Add('propAllowExpressions', 'Bepaalt of het tekstobject expressies in de tekst mag bevatten');
    Add('propAllowGrayed', 'Staat de grijs-status van de vinkvelden in deze control toe');
    Add('propAllowHTMLTags', 'Bepaalt of het tekstobject HTML tags in de tekst mag bevatten');
    Add('propAllowSplit', 'Bepaalt of de band over meerdere pagina''s verdeeld mag worden');
    Add('propAuthor', 'De auteur van het rapport');
    Add('propAutoSize', 'Bepaalt of de afbeelding zijn afmeting zelf moet instellen');
    Add('propAutoWidth', 'Bepaalt of het tekstobject zijn breedte zelf moet instellen');
    Add('propBackPicture', 'De afbeelding voor de pagina achtergrond');
    Add('propBarType', 'Het type barcode');
    Add('propBevelInner', 'Het type van de binnenste rand');
    Add('propBevelOuter', 'Het type van de buitenste rand');
    Add('propBevelWidth', 'De dikte van de rand');
    Add('propBorder', 'Bepaalt of het buitenste kader getoond moet worden of niet');
    Add('propBorderStyle', 'De stijl van het venster');
    Add('propBottomMargin', 'De afmeting van de ondermarge van de pagina');
    Add('propBrushStyle', 'De stijl van de borstel die voor de objectachtergrond gebruikt wordt');
    Add('propButtons', 'Stel de knoppen in op zichtbaar in het voorbeeld venster');
    Add('propCacheSize', 'Maximale hoeveelheid geheugen die de rapportage mag gebruiken. Indien het geheugengebruik deze waarde overschrijdt, worden geprepareerde pagina''s naar de schijf cache geschreven');
    Add('propCalcCheckSum', 'Bepaalt of de barcode het controlegetal zelf moet berekenen');
    Add('propCancel', 'Bepaalt of de knop geactiveerd moet worden indien de Escape toets werd ingedrukt');
    Add('propCaption', 'Het bijschrift van de controle');
    Add('propCellFields', 'Namen van DB velden representeren de kruistabel cellen');
    Add('propCellLevels', 'Aantal cel niveaus');
    Add('propCenter', 'Bepaalt of de afbeelding binnen de control gecentreerd moet worden');
    Add('propCharset', 'De lettertype tekenset');
    Add('propCharSpacing', 'Aantal pixels tussen twee tekens');
    Add('propCheckColor', 'De kleur van het vinkje');
    Add('propChecked', 'Bepaalt of de control is aangevinkt');
    Add('propCheckStyle', 'De stijl van het vink teken');
    Add('propChild', 'child band is verbonden aan deze band');
    Add('propCollate', 'Default sorteer instelling');
    Add('propColor.TFont', 'De kleur van de tekst');
    Add('propColor', 'De kleur van het object');
    Add('propColor.TfrxFrame', 'De kleur van het frame');
    Add('propColor.TfrxHighlight', 'Bepaalt of de kleur van het object indien hightlight aktief is');
    Add('propColumnFields', 'Namen van DB velden representeren de kruistabel kolommen');
    Add('propColumnGap', 'De afstand tussen band kolommen');
    Add('propColumnLevels', 'Aantal kolom niveaus');
    Add('propColumns', 'Aantal kolommen in de band');
    Add('propColumnWidth', 'De breedte van de band kolom');
    Add('propCondition', 'De groepeer conditie. De groep eindigt indien de waarde van deze expressie verandert');
    Add('propCondition.TfrxHighlight', 'Expressie tekst. Indien deze expressie WAAR is wordt de highlight actief');
    Add('propConnected', 'Geeft aan of de database connectie actief is');
    Add('propConvertNulls', 'Bepaalt of NULL waarden in de database naar 0, ONWAAR of lege tekst geconverteerd moeten worden');
    Add('propCopies', 'Het default aantal kopieën');
    Add('propCursor', 'De cursor van dit object');
    Add('propDatabaseName', 'De naam van de database');
    Add('propDataField', 'Specificeert het veld in de database dat de gegevens voor dit object aanlevert');
    Add('propDataSet', 'Koppelt het object aan de dataset die het veld bevat dat dit object vertegenwoordigt');
    Add('propDate', 'De datumwaarde van de control');
    Add('propDateFormat', 'Geeft aan in welk formaat de datum wordt weergegeven');
    Add('propDecimalSeparator', 'Het decimale scheidingsteken');
    Add('propDefault', 'Bepaalt of de knop de default knop is');
    Add('propDefHeight', 'Default rij hoogte');
    Add('propDescription', 'De rapport omschrijving');
    Add('propDiagonal', 'Geeft aan dat de lijn diagonaal loopt');
    Add('propDisplayFormat', 'Het formaat van de getoonde waarde');
    Add('propDoubleBuffered', 'Bepaalt of het voorbeeld venster dubbele buffering gebruikt. Dubbele buffering voorkomt flikkeren van het scherm maar is trager');
    Add('propDoublePass', 'Bepaalt of de rapport motor de tweede stap moet uitvoeren');
    Add('propDown', 'Bepaalt of de snelknop is ingedrukt of niet');
    Add('propDownThenAcross', 'Bepaalt hoe een grote kruistabel over meerdere pagina''s verdeeld moet worden');
    Add('propDriverName', 'De naam van de BDE driver');
    Add('propDropShadow', 'Bepaalt of het object een schaduw heeft');
    Add('propDuplex', 'Bepaalt of de pagina dubbelzijdig wordt afgedrukt');
    Add('propEditMask', 'Specificeert het masker waarmee bepaalt wordt welke tekst geldig is in de gemaskeerde invoerveld');
    Add('propEnabled', 'Bepaalt of de control ingeschakeld is');
    Add('propEngineOptions', 'De engine opties van het rapport');
    Add('propExpression', 'De waarde van deze expressie wordt getoond in het object');
    Add('propExpressionDelimiters', 'De tekens die gebruikt worden om een expressie in de tekst op te nemen');
    Add('propFieldAliases', 'De dataset veld''s aliasen');
    Add('propFilter', 'De filterconditie voor de dataset');
    Add('propFiltered', 'Bepaalt of de dataset de records moet filteren op basis van de conditie in de Filter eigenschap');
    Add('propFlowTo', 'Het tekst object dat de tekst zal tonen die niet in het object past');
    Add('propFont', 'De lettertype eigenschappen van het object');
    Add('propFooterAfterEach', 'Bepaalt of de voettekst band na iedere gegevensrij getoond moet worden');
    Add('propFormatStr', 'De geformatteerde tekenreeks');
    Add('propFrame', 'De frame eigenschappen van het object');
    Add('propGapX', 'De linker inspring marge van de tekst');
    Add('propGapY', 'De bovenste inpring marge van de tekst');
    Add('propGlyph', 'De afbeelding van de control');
    Add('propGroupIndex', 'Sta toe dat snelknoppen als een groep samenwerken');
    Add('propHAlign', 'De horizontale uitlijning van de tekst');
    Add('propHeight', 'De hoogte van het object');
    Add('propHGuides', 'De horizontale hulplijnen van de pagina');
    Add('propHideZeros', 'Bepaalt of het tekst object de lege waaardes moet verbergen');
    Add('propHighlight', 'De conditionele hightlight eigenschappen');
    Add('propIndexName', 'De naam van de index');
    Add('propInitString', 'Printer initialisatie tekenreeks voor dot-matrix rapporten');
    Add('propItems', 'Lijst items van het object');
    Add('propKeepAspectRatio', 'Handhaaf de oorspronkelijke verhoudingen van de afbeelding');
    Add('propKeepChild', 'Bepaalt of de band tezamen met zijn child wordt afgedrukt');
    Add('propKeepFooter', 'Bepaalt of de band tezamen met zijn voetregel wordt afdrukt');
    Add('propKeepHeader', 'Bepaalt of de band tezamen met zijn kopregel wordt afgedrukt');
    Add('propKeepTogether', 'Bepaalt of de band tezamen met al zijn subbands wordt afgedrukt');
    Add('propKind.TfrxFormat', 'Het soort formattering');
    Add('propKind', 'Het soort knop');
    Add('propLargeDesignHeight', 'Bepaalt of de pagina grote hoogte gebruikt in ontwerp modus');
    Add('propLayout', 'De layout van de knop afbeelding');
    Add('propLeft', 'De linker coordinaat van het object');
    Add('propLeftMargin', 'De grootte van de linker pagina marge');
    Add('propLines', 'De tekst van het object');
    Add('propLineSpacing', 'Het aantal pixels tussen twee regels tekst');
    Add('propLoginPrompt', 'Bepaalt of de login dialoog getoond moet worden');
    Add('propMargin', 'Bepaalt het aantal pixels tussen de rand van de afbeelding en de rand van de knop');
    Add('propMaster', 'De master dataset');
    Add('propMasterFields', 'De velden zijn gekoppeld door een master-detail relatie');
    Add('propMaximized', 'Bepaalt of het voorbeeld venster gemaximaliseerd moet zijn');
    Add('propMaxLength', 'Maximale tekstlengte');
    Add('propMaxPages', 'Maximum aantal pagina''s in het geprepareerde rapport');
    Add('propMaxWidth', 'Maximum breedte van de kolom');
    Add('propMDIChild', 'Bepaalt of het voorbeeld venster een MDI venster is');
    Add('propMemo', 'De tekst van het object');
    Add('propMinWidth', 'Minimum breedte van de kolom');
    Add('propMirrorMargins', 'Spiegel de pagina marges op de even pagina''s');
    Add('propModal', 'Bepaalt of het voorbeeld venster als zelfstandig venster getoond moet worden');
    Add('propModalResult', 'Bepaalt of en hoe de knop het zelfstandige venster sluit');
    Add('propName.TFont', 'De naam van het lettertype');
    Add('propName.TfrxReportOptions', 'De naam van het rapport');
    Add('propName', 'De naam van het object');
    Add('propNumGlyphs', 'Geeft aan uit hoeveel plaatjes de afbeelding bestaat die in de Glyph eigenschap is aangegeven');
    Add('propOpenDataSource', 'Bepaalt of de datasource automatisch geopend moet worden of niet');
    Add('propOrientation', 'De pagina oriëntatie');
    Add('propOutlineText', 'De tekst die in voorbeeld venster inhoudsopgave getoond moet worden');
    Add('propOutlineVisible', 'De zichtbaarheid van de voorbeeld venster inhoudsopgaveThe visibility of the preview outline control');
    Add('propOutlineWidth', 'De breedte van de voorbeeld venster inhoudsopgave control');
    Add('propPageNumbers.TfrxPrintOptions', 'Het aantal pagina''s dat afgedrukt wordt');
    Add('propPaperHeight', 'De pagina hoogte');
    Add('propPaperWidth', 'De pagina breedte');
    Add('propParagraphGap', 'De inspringmarge op de eerste regel van een alinea');
    Add('propParams.TfrxBDEDatabase', 'De parameters van de connectie');
    Add('propParams', 'De parameters van de query');
    Add('propParentFont', 'Bepaalt of het object het lettertype van de parent gebruikt');
    Add('propPassword', 'Het wachtwoord van het rapport');
    Add('propPasswordChar', 'Geeft het teken aan, indien gebruikt, om te tonen in plaats van het werkelijke aantal tekens dat in de control is ingevoerd');
    Add('propPicture', 'De afbeelding');
    Add('propPicture.TfrxReportOptions', 'De beschrijvingsafbeelding van het rapport');
    Add('propPosition', 'De startpositie van het venster');
    Add('propPreviewOptions', 'De voorbeeld venster opties van het rapport');
    Add('propPrintable', 'Of het object afgedrukt kan worden. Objecten met Afdrukbaar=ONWAAR worden wel in het voorbeeld getoond maar niet afgedrukt');
    Add('propPrintChildIfInvisible', 'Bepaalt of de child band afgedrukt wordt indien de parent band onzichtbaar is');
    Add('propPrinter', 'De naam van de printer die gekozen wordt als het rapport geopend of afgedrukt wordt');
    Add('propPrintIfDetailEmpty', 'Bepaalt of de gegevensband afgedrukt wordt indien de subband leeg is');
    Add('propPrintIfEmpty', 'Bepaalt of de pagina wordt afgedrukt indien alle datasets leeg zijn');
    Add('propPrintOnFirstPage', 'Bepaalt of de band wordt afgedrukt op de eerste pagina');
    Add('propPrintOnLastPage', 'Bepaalt of de band wordt afgedrukt op de laatste pagina');
    Add('propPrintOnParent', 'Bepaalt of het subrapport zichzelf op een parent band kan afdrukken');
    Add('propPrintOnPreviousPage', 'Bepaalt of de pagina kan worden opgebouwd in de vrije ruimte van een hiervoor gegenereerde pagina');
    Add('propPrintOptions', 'Afdrukopties van het rapport');
    Add('propPrintPages', 'Bepaalt of alle, oneven of even pagina''s worden afgedrukt');
    Add('propRangeBegin', 'Bepaalt de startpunt van de dataset navigatie');
    Add('propRangeEnd', 'Bepaalt het eindpunt van de dataset navigatie');
    Add('propRangeEndCount', 'Bepaalt het aantal records in de dataset indien RangeEnd ingesteld is op reCount');
    Add('propReadOnly', 'Bepaalt of het tekst object alleen-lezen is');
    Add('propRepeatHeaders', 'Bepaalt of de kolom en rij titels op iedere pagina opnieuw worden afgedrukt');
    Add('propReportOptions', 'De opties van het rapport');
    Add('propReprintOnNewPage', 'Bepaalt of de band op iedere pagina opnieuw wordt afgedrukt');
    Add('propRestrictions', 'Een set van restrictie aanduidingen');
    Add('propRightMargin', 'De grootte van de rechter marge van de pagina');
    Add('propRotation.TfrxBarCodeView', 'De richting van de barcode');
    Add('propRotation', 'De verdraaiing van de tekst');
    Add('propRowCount', 'Aantal virtuele records in de gegevens band');
    Add('propRowFields', 'Namen van DB velden vertegenwoordigen de kruistabel rijen');
    Add('propRowLevels', 'Aantal rij niveaus');
    Add('propRTLReading', 'Bepaalt of het tekst object zijn inhoud van rechts-naar-links moet tonen');
    Add('propScriptLanguage', 'De naam van de scripttaal die in het rapport gebruikt wordt');
    Add('propSessionName', 'De naam van de BDE sessie');
    Add('propShadowColor', 'De kleur van de schaduw');
    Add('propShadowWidth', 'De breedte van de schaduw');
    Add('propShape', 'Het type van de vorm');
    Add('propShiftMode', 'Shift gedrag van het object');
    Add('propShowCaptions', 'Bepaalt of de knoppen in het voorbeeldvenster met tekst getoond worden');
    Add('propShowColumnHeader', 'Bepaalt of de kruistabel kolomtitels moet tonen');
    Add('propShowColumnTotal', 'Bepaalt of de kruistabel het kolomtotaal moet tonen');
    Add('propShowRowHeader', 'Bepaalt of de kruistabel rijtitels moet tonen');
    Add('propShowRowTotal', 'Bepaalt of de kruistabel het rijtotaal moet tonen');
    Add('propShowDialog', 'Bepaalt of de afdruk dialoog in het voorbeeld venster getoond moet worden');
    Add('propShowText', 'Bepaalt of de barcode een leesbare tekst moet tonen');
    Add('propSize', 'De grootte van het lettertype');
    Add('propSorted', 'Bepaalt of de items gesorteerd zijn of niet');
    Add('propSpacing', 'Bepaalt het aantal pixels tussen de afbeelding en de tekst');
    Add('propSQL', 'De SQL opdracht');
    Add('propStartNewPage', 'Begin een nieuwe pagina voordat je de band afdrukt');
    Add('propStretch', 'De afbeelding uitrekken tot de grenzen van het object');
    Add('propStretched', 'Bepaalt of het object uitgerekt kan worden');
    Add('propStretchMode', 'Uitrek gedrag van het object');
    Add('propStyle.TFont', 'De stijl van het lettertype');
    Add('propStyle', 'De stijl van de control');
    Add('propStyle.TfrxFrame', 'De stijl van het object''s frame');
    Add('propSuppressRepeated', 'Repeterende waardes onderdrukken');
    Add('propTableName', 'De naam van de gegevens tabel');
    Add('propTag', 'Tag getal van het object');
    Add('propTagStr', 'Tag tekenreeks van het object');
    Add('propText', 'De tekst van het object');
    Add('propTitleBeforeHeader', 'Bepaalt of de rapporttitel vooor de pagina kop moet worden getoond');
    Add('propTop', 'Het bovenste coordinaat van het object');
    Add('propTopMargin', 'De grootte van de pagina bovenmarge');
    Add('propTyp', 'Het type van het frame');
    Add('propUnderlines', 'Bepaalt of het tekstobject tabellijnen tussen de regels toont');
    Add('propURL', 'De URL van het object');
    Add('propUserName', 'Gebruikersnaam van het gegevens object. Deze naam wordt getoond in de gegevens boom');
    Add('propVAlign', 'De verticale uitlijning van de tekst');
    Add('propVersionBuild', 'Versie info, build');
    Add('propVersionMajor', 'Versie info, major version');
    Add('propVersionMinor', 'Versie info, minor version');
    Add('propVersionRelease', 'Versie info, release');
    Add('propVGuides', 'De verticale hulplijnen van de pagina');
    Add('propVisible', 'Zichtbaarheid van het object');
    Add('propWidth', 'Breedte van het object');
    Add('propWidth.TfrxFrame', 'De breedte van het frame');
    Add('propWindowState', 'Initiële status van het venster');
    Add('propWordBreak', 'Woorden afbreken');
    Add('propWordWrap', 'Bepaalt of het tekstobject een zachte return invoegt zodat de tekst omloopt bij de rechter kantlijn');
    Add('propZoom.TfrxBarCodeView', 'De barcode grootte aanpassen');
    Add('propZoom', 'Initiële zoom factor van het voorbeeld venster');
    Add('propZoomMode', 'Initiële zoom stand van het voorbeeld venster');
  end;
end;


initialization
  frAddInspectorRes;

end.
