
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
    Add('propActive', 'Bestemmer om et datas�t er �bnt eller ej');
    Add('propActive.TfrxHighlight', 'Bestemmer om highlight er aktiv eller ej');
    Add('propAliasName', 'Navnet p� BDE aliaset');
    Add('propAlign', 'Bestemmer om justeringen af objekter er relativ til b�nd eller side');
    Add('propAlignment', 'Bestemmer justeringen af objektets tekst');
    Add('propAllowAllUp', 'Bestemmer om alle speed buttons i gruppen kan blive fravalgt p� samme tid');
    Add('propAllowEdit', 'Bestemmer om brugeren m� editere i den forberedte raports sider');
    Add('propAllowExpressions', 'Bestemmer om tekst-objektet m� indeholde udtryk inden i teksten');
    Add('propAllowGrayed', 'Tillad gr� tilstand for kontrollens checkboxe');
    Add('propAllowHTMLTags', 'Bestemmer om tekst-objektet m� indeholde HTML tags inden i teksten');
    Add('propAllowSplit', 'Bestemmer om b�ndet m� dele dens indhold p� flere sider');
    Add('propAuthor', 'Raportens forfatter');
    Add('propAutoSize', 'Bestemmer om billedet skal h�ndtere dens st�rrelse automatisk');
    Add('propAutoWidth', 'Bestemmer om tekst-objektet skal h�ndtere dens bredde automatisk');
    Add('propBackPicture', 'Baggrundssidens billede');
    Add('propBarType', 'Type af stregkode');
    Add('propBevelInner', 'Type af den indre bevel');
    Add('propBevelOuter', 'Type af den ydre bevel');
    Add('propBevelWidth', 'Bredden af bevel');
    Add('propBorder', 'Bestemmer om der skal vises ydre kant eller ej');
    Add('propBorderStyle', 'Vinduets stil');
    Add('propBottomMargin', 'St�rrelse af den nederste side margen');
    Add('propBrushStyle', 'Stilen for pensel anvendt p� objektets baggrund');
    Add('propButtons', 'S�t af knapper der er synlige i vis udskrift vinduet');
    Add('propCacheSize', 'Den maksimale m�ngde af hukommelse, som m� bruges af raportgeneratoren. Hvis hukommelsesforbruget overstiger denne v�rdi, vil forberedte sider blive cached til en fil p� disken');
    Add('propCalcCheckSum', 'Bestemmer om stregkoden automatisk skal beregne checktal');
    Add('propCancel', 'Bestemmer om kanppen skal aktiveres, hvis Esc-knappen bliver trykket');
    Add('propCaption', 'Kort titel for kontrollen');
    Add('propCellFields', 'Navnene p� DB felterne repr�senteret i kryds-cellerne');
    Add('propCellLevels', 'Antallet af celleniveauer');
    Add('propCenter', 'Bestemmer om billedet skal centreres inden i kontrollen');
    Add('propCharset', 'Karakters�ttet for skrifttypen');
    Add('propCharSpacing', 'Antallet af pixels mellem to tegn');
    Add('propCheckColor', 'Farven for vingebenet');
    Add('propChecked', 'Angiver om kontrollen er afkrydset');
    Add('propCheckStyle', 'Stilen for vingebenet');
    Add('propChild', 'Child b�ndet forbundet til dette b�nd');
    Add('propCollate', 'Standard ops�tningen for sammenligning');
    Add('propColor.TFont', 'Farven p� teksten');
    Add('propColor', 'Farven p� objektet');
    Add('propColor.TfrxFrame', 'Farven p� rammen');
    Add('propColor.TfrxHighlight', 'Bestemmer farven p� objektet, hvis highlight er aktivt');
    Add('propColumnFields', 'Navnene p� DB felterne repr�senteret i krydskolonnerne');
    Add('propColumnGap', 'Afstanden mellem kolonneb�ndene');
    Add('propColumnLevels', 'Antallet af kolonneniveauer');
    Add('propColumns', 'Antallet af kolonner i b�ndet');
    Add('propColumnWidth', 'Bredden p� kolonneb�ndet');
    Add('propCondition', 'Grupperingsbetingelse. Gruppen vil blive brudt, hvis v�rdien af dette udtryk skifter');
    Add('propCondition.TfrxHighlight', 'Udtryksstreng. Hvis dette udtryk er True, vil highlight blive aktivt');
    Add('propConnected', 'Angiver om database-forbindelsen er aktiv');
    Add('propConvertNulls', 'Bestemmer om null DB v�rdier skal konvereteres til 0, False eller en tom streng');
    Add('propCopies', 'Standard antallet af kopier');
    Add('propCursor', 'Mark�ren for objektet');
    Add('propDatabaseName', 'Navnet p� databasen');
    Add('propDataField', 'Angiver feltet fra hvilket objektet f�r dens data');
    Add('propDataSet', 'Sammenk�der objektet til datas�ttet der indeholder feltet som det rep�rsenterer');
    Add('propDate', 'Dato-v�rdien for kontrollen');
    Add('propDateFormat', 'Angiver formatet for, hvordan en dato bliver repr�senteret');
    Add('propDecimalSeparator', 'Decimalseparator');
    Add('propDefault', 'Bestemmer om knappen er stadard knap');
    Add('propDefHeight', 'R�kkens standard h�jde');
    Add('propDescription', 'Raportens beskrivelse');
    Add('propDiagonal', 'Angiver at linien er diagonal');
    Add('propDisplayFormat', 'Formatet for den viste v�rdi');
    Add('propDoubleBuffered', 'Bestemmer om vis udskrift-vinduet skal bruge dobbelt buffering. Sl� double buffering til forhindrer blikken, men er langsommere');
    Add('propDoublePass', 'Bestemmer om raportgeneratoren skal lave et andet genneml�b');
    Add('propDown', 'Bestemmer om speed button er trykket eller ej');
    Add('propDownThenAcross', 'Bestemmer hvordan store krydstabeller vil blive delt p� siderne');
    Add('propDriverName', 'Navnet p� BDE driveren');
    Add('propDropShadow', 'Bestemmer om objektet har skygge');
    Add('propDuplex', 'Angiver duplex mode for siden');
    Add('propEditMask', 'Angiver masken som representerer hvilken tekst er gyldig for masked edit kontrol');
    Add('propEnabled', 'Bestemmer om kontrollen er tilg�ngelig');
    Add('propEngineOptions', 'Raportgenerator valgmulighed');
    Add('propExpression', 'V�rdien af dette udtryk vil blive vist i objektet');
    Add('propExpressionDelimiters', 'Tegnet som vil blive brugt til at omslutte udtrykket indeholdt i teksten');
    Add('propFieldAliases', 'Datas�ttes felt aliaser');
    Add('propFilter', 'Filtreringsbetingelserne for datas�ttet');
    Add('propFiltered', 'Bestemmer om datas�ttet skal filtrere posterne ved brug af betingelserne i Filter property');
    Add('propFlowTo', 'Tekst-objektet som vil vise tekst som ikke passer ind i objektet');
    Add('propFont', 'Skrifttypeattributter for objektet');
    Add('propFooterAfterEach', 'Bestemmer om footer b�ndet skal vises efter hver datar�kke');
    Add('propFormatStr', 'Den formatterede streng');
    Add('propFrame', 'Rammeattributter for objektet');
    Add('propGapX', 'Tekstens venstre indryk');
    Add('propGapY', 'Tekstens top indryk');
    Add('propGlyph', 'Billedet for kontrollen');
    Add('propGroupIndex', 'Tillad at speed buttons arbejder sammen som en gruppe');
    Add('propHAlign', 'Den horisontale justering af teksten');
    Add('propHeight', 'H�jden af objektet');
    Add('propHGuides', 'Den horisontale guideline for siden');
    Add('propHideZeros', 'Bestemmer om tekst-objektet skal skjule nul-v�rdier');
    Add('propHighlight', 'Attributter for betingelses-highlight');
    Add('propIndexName', 'Navnet p� indeks');
    Add('propInitString', 'Printeres init streng for dot-matrix raporter');
    Add('propItems', 'List objektets elementer');
    Add('propKeepAspectRatio', 'Behold det originale st�rrelsesforhold p� billedet');
    Add('propKeepChild', 'Bestemmer om b�ndet skal udskrives sammen med dens child');
    Add('propKeepFooter', 'Bestemmer om b�ndet skal udskrives sammen med dens footer');
    Add('propKeepHeader', 'Bestemmer om b�ndet skal udskrives sammen med dens header');
    Add('propKeepTogether', 'Bestemmer om b�ndet skal udskrives sammen med alle dens subb�nd');
    Add('propKind.TfrxFormat', 'Typen af formattering');
    Add('propKind', 'Typen af knap');
    Add('propLargeDesignHeight', 'Bestemmer om siden skal have stor h�jde i designmode');
    Add('propLayout', 'Layoutet for knappens glyph');
    Add('propLeft', 'Venstre koordinat for objektet');
    Add('propLeftMargin', 'St�rrelsen p� venstre margen');
    Add('propLines', 'Teksten for objektet');
    Add('propLineSpacing', 'Antallet af pixels mellem to linier af tekst');
    Add('propLoginPrompt', 'Bestemmer om der skal vises en login dialogboks');
    Add('propMargin', 'Bestemmer antallet af pixels mellem kanten af billedet og kanten af knappen');
    Add('propMaster', 'Master datas�ttet');
    Add('propMasterFields', 'Felterne der er sammensat af en master-detail relation');
    Add('propMaximized', 'Bestemmer om vis udskrift-vinduet skal v�re maksimeret');
    Add('propMaxLength', 'Max l�ngden af teksten');
    Add('propMaxPages', 'Max antal sider i den forberedte raport');
    Add('propMaxWidth', 'Max bredden af kolonnen');
    Add('propMDIChild', 'Bestemmer om vis udskrift-vinduet skal v�re en MDI child');
    Add('propMemo', 'Teksten for objektet');
    Add('propMinWidth', 'Min bredde for kolonnen');
    Add('propMirrorMargins', 'Afspejl sidemargener p� de lige sider');
    Add('propModal', 'Bestemmer om vis udskrift-vinduet skal vises modalt');
    Add('propModalResult', 'Bestemmer om og hvordan knappen lukker dens modale form');
    Add('propName.TFont', 'Navnet p� skrifttypen');
    Add('propName.TfrxReportOptions', 'Navnet p� raporten');
    Add('propName', 'Navnet p� objektet');
    Add('propNumGlyphs', 'Angiver antallet af billeder der er grafik angivet i Glyph propertien');
    Add('propOpenDataSource', 'Bestemmer om datakilden automatisk skal �bnes eller ej');
    Add('propOrientation', 'Sidens retning');
    Add('propOutlineText', 'Teksten der bliver vist i vis udskrifts omridskontrol');
    Add('propOutlineVisible', 'Synligheden af vis udskrifts omridskontrol');
    Add('propOutlineWidth', 'Bredden af vis udskrift omridskontrol');
    Add('propPageNumbers.TfrxPrintOptions', 'Antallet af sider der skal udskrives');
    Add('propPaperHeight', 'H�jden p� siden');
    Add('propPaperWidth', 'Bredden p� siden');
    Add('propParagraphGap', 'Indrykningen af den f�rste linie af punktopstillingen');
    Add('propParams.TfrxBDEDatabase', 'Parameter for forbindelsen');
    Add('propParams', 'Parameter for foresp�gselen');
    Add('propParentFont', 'Bestemmer om objektet skal bruge faderes skrifttype');
    Add('propPassword', 'Raportens password');
    Add('propPasswordChar', 'Indikerer tegnet, hvis nogen, som skal vises i stedet for den faktiske tegn angivet i kontrollen');
    Add('propPicture', 'Billedet');
    Add('propPicture.TfrxReportOptions', 'Det beskrivende billed for raporten');
    Add('propPosition', 'Den initiale position af vinduet');
    Add('propPreviewOptions', 'Vis udskrift-valgmuligheder for raporten');
    Add('propPrintable', 'Udskriftsbarheden for objektet. Objekter med Udskrivbar=False vil blive vist, men ikke udskrevet');
    Add('propPrintChildIfInvisible', 'Bestemmer om child-b�ndet vil blive udskrevet hvis dens parent b�nd er usynligt');
    Add('propPrinter', 'Navnet p� printeren, som vil blive valgt hvis denne raport bliver �bnet eller k�rt');
    Add('propPrintIfDetailEmpty', 'Bestemmer om datab�ndet vil blive udskrevet hvis dens subb�nd er tomme');
    Add('propPrintIfEmpty', 'Bestemmer om siden vil blive udskrevet, hvis alle datas�t er tomme');
    Add('propPrintOnFirstPage', 'Bestemmer om b�ndet vil blive udskrevet p� den f�rste side');
    Add('propPrintOnLastPage', 'Bestemmer om b�ndet vil blive udskrevet p� den sidste side');
    Add('propPrintOnParent', 'Bestemmer om subraporten kan udskrive sig selv p� parent b�ndet');
    Add('propPrintOnPreviousPage', 'Bestemmer om siden kan blive genereret i den ledige plads fra en tidligere genereret side');
    Add('propPrintOptions', 'Udskriftvalgmulighederne for raporten');
    Add('propPrintPages', 'Bestemmer om alle, ulige eller lige sider skal udskrives');
    Add('propRangeBegin', 'Bestemmer startpunktet for datas�tsnavigationen');
    Add('propRangeEnd', 'Bestemmer slutpunktet for datas�tsnavigationen');
    Add('propRangeEndCount', 'Bestemmer antallet af poster i datas�ttet hvis RangeEnd er reCount');
    Add('propReadOnly', 'Bestemmer om tekstobjektet er skrivebeskyttet');
    Add('propRepeatHeaders', 'Bestemmer om kolonne og r�kke headers skal genskrives p� ny side');
    Add('propReportOptions', 'Valgmulighederne for raporten');
    Add('propReprintOnNewPage', 'Bestemmer om b�ndet skal genskrives p� ny side');
    Add('propRestrictions', 'Indstilling af restriktionsflag');
    Add('propRightMargin', 'St�rrelsen af h�jre side margen');
    Add('propRotation.TfrxBarCodeView', 'Retning for stregkoden');
    Add('propRotation', 'Tekstrotation');
    Add('propRowCount', 'Antallet af virtuelle poster i datab�ndet');
    Add('propRowFields', 'Navne p� DB felter repr�senteret i kryds-r�kkerne');
    Add('propRowLevels', 'Antallet af r�kke niveauer');
    Add('propRTLReading', 'Bestemmer om tekst-objektet vil vise tekst i h�jre-til-venstre retning');
    Add('propScriptLanguage', 'Navnet p� skriptsproget, der bliver anvendt i raporten');
    Add('propSessionName', 'Navnet p� BDE sessionen');
    Add('propShadowColor', 'Farven p� skyggen');
    Add('propShadowWidth', 'Bredden p� skyggen');
    Add('propShape', 'Type af form');
    Add('propShiftMode', 'Skift opf�relse for objektet');
    Add('propShowCaptions', 'Bestemmer om vis udskrift-knappen skal vise kort titel');
    Add('propShowColumnHeader', 'Bestemmer om kryds-tab skal vise kolonne headers');
    Add('propShowColumnTotal', 'Bestemmer om kryds-tab skal vise kolonne grand total');
    Add('propShowRowHeader', 'Bestemmer om kryds-tab skal vise r�kke headers');
    Add('propShowRowTotal', 'Bestemmer om kryds-tab skal vise r�kke grand total');
    Add('propShowDialog', 'Bestemmer om udskriv-dialogboksen skal vises i vis udskrift-vinduet');
    Add('propShowText', 'Bestemmer om et stregkode objekt skal vise en l�sbar tekst');
    Add('propSize', 'St�rrelse p� skrifttypen');
    Add('propSorted', 'Bestemmer om elementer er sorteret eller ikke');
    Add('propSpacing', 'Bestemmer antallet af pixels mellem billede og teksten');
    Add('propSQL', 'SQL udtrykket');
    Add('propStartNewPage', 'Starter p� en ny side f�r udprintning af et b�nd');
    Add('propStretch', 'Udstr�kker billedet til at passe objektets gr�nser');
    Add('propStretched', 'Bestemmer om objektet kan blive udstrukket');
    Add('propStretchMode', 'Opf�relse af udstr�kningen for objektet');
    Add('propStyle.TFont', 'Stilen p� skrifttypen');
    Add('propStyle', 'Stilen p� kontrollen');
    Add('propStyle.TfrxFrame', 'Stilen p� objektets ramme');
    Add('propSuppressRepeated', 'Undertryk gentagne v�rdier');
    Add('propTableName', 'Navnet p� data tabellen');
    Add('propTag', 'Tag-nummer for objektet');
    Add('propTagStr', 'Tag-streng for objektet');
    Add('propText', 'Teksten for objektet');
    Add('propTitleBeforeHeader', 'Bestemmer om raportitlen skal vises f�r sidehovedet');
    Add('propTop', 'Koordinater for objektet �verst');
    Add('propTopMargin', 'St�rrelsen for �verst sidemargin');
    Add('propTyp', 'Typen for rammen');
    Add('propUnderlines', 'Bestemmer om tekstobjekter skal vise gitterlinier efter hver tekstlinie');
    Add('propURL', 'URL for objektet');
    Add('propUserName', 'Brugernavn for data objektet. Dette navn vil blive vist i data-tr�et');
    Add('propVAlign', 'Den vertikale justering af teksten');
    Add('propVersionBuild', 'Versionsinfo, build');
    Add('propVersionMajor', 'Versionsinfo, stor version');
    Add('propVersionMinor', 'Versionsinfo, lille version');
    Add('propVersionRelease', 'Versionsinfo, frigivelse');
    Add('propVGuides', 'Den vertikale guideline for siden');
    Add('propVisible', 'Synligheden af objektet');
    Add('propWidth', 'Bredden p� objektet');
    Add('propWidth.TfrxFrame', 'Bredden af rammen');
    Add('propWindowState', 'Initial status af vinduet');
    Add('propWordBreak', 'Bryd Russiske ord');
    Add('propWordWrap', 'Bestemmer om tekstobjektet skal inds�tte et bl�dt vognskifte, s� teksten deles ved den h�jre margen');
    Add('propZoom.TfrxBarCodeView', 'Zooms stregkode');
    Add('propZoom', 'Initial zoom faktor i vis udskrift vinduet');
    Add('propZoomMode', 'Initial zoom modus i vis udskrift vinduet');
  end;
end;


initialization
  frAddInspectorRes;

end.
