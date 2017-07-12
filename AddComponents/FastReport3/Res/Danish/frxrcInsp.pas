
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
    Add('propActive', 'Bestemmer om et datasæt er åbnt eller ej');
    Add('propActive.TfrxHighlight', 'Bestemmer om highlight er aktiv eller ej');
    Add('propAliasName', 'Navnet på BDE aliaset');
    Add('propAlign', 'Bestemmer om justeringen af objekter er relativ til bånd eller side');
    Add('propAlignment', 'Bestemmer justeringen af objektets tekst');
    Add('propAllowAllUp', 'Bestemmer om alle speed buttons i gruppen kan blive fravalgt på samme tid');
    Add('propAllowEdit', 'Bestemmer om brugeren må editere i den forberedte raports sider');
    Add('propAllowExpressions', 'Bestemmer om tekst-objektet må indeholde udtryk inden i teksten');
    Add('propAllowGrayed', 'Tillad grå tilstand for kontrollens checkboxe');
    Add('propAllowHTMLTags', 'Bestemmer om tekst-objektet må indeholde HTML tags inden i teksten');
    Add('propAllowSplit', 'Bestemmer om båndet må dele dens indhold på flere sider');
    Add('propAuthor', 'Raportens forfatter');
    Add('propAutoSize', 'Bestemmer om billedet skal håndtere dens størrelse automatisk');
    Add('propAutoWidth', 'Bestemmer om tekst-objektet skal håndtere dens bredde automatisk');
    Add('propBackPicture', 'Baggrundssidens billede');
    Add('propBarType', 'Type af stregkode');
    Add('propBevelInner', 'Type af den indre bevel');
    Add('propBevelOuter', 'Type af den ydre bevel');
    Add('propBevelWidth', 'Bredden af bevel');
    Add('propBorder', 'Bestemmer om der skal vises ydre kant eller ej');
    Add('propBorderStyle', 'Vinduets stil');
    Add('propBottomMargin', 'Størrelse af den nederste side margen');
    Add('propBrushStyle', 'Stilen for pensel anvendt på objektets baggrund');
    Add('propButtons', 'Sæt af knapper der er synlige i vis udskrift vinduet');
    Add('propCacheSize', 'Den maksimale mængde af hukommelse, som må bruges af raportgeneratoren. Hvis hukommelsesforbruget overstiger denne værdi, vil forberedte sider blive cached til en fil på disken');
    Add('propCalcCheckSum', 'Bestemmer om stregkoden automatisk skal beregne checktal');
    Add('propCancel', 'Bestemmer om kanppen skal aktiveres, hvis Esc-knappen bliver trykket');
    Add('propCaption', 'Kort titel for kontrollen');
    Add('propCellFields', 'Navnene på DB felterne repræsenteret i kryds-cellerne');
    Add('propCellLevels', 'Antallet af celleniveauer');
    Add('propCenter', 'Bestemmer om billedet skal centreres inden i kontrollen');
    Add('propCharset', 'Karaktersættet for skrifttypen');
    Add('propCharSpacing', 'Antallet af pixels mellem to tegn');
    Add('propCheckColor', 'Farven for vingebenet');
    Add('propChecked', 'Angiver om kontrollen er afkrydset');
    Add('propCheckStyle', 'Stilen for vingebenet');
    Add('propChild', 'Child båndet forbundet til dette bånd');
    Add('propCollate', 'Standard opsætningen for sammenligning');
    Add('propColor.TFont', 'Farven på teksten');
    Add('propColor', 'Farven på objektet');
    Add('propColor.TfrxFrame', 'Farven på rammen');
    Add('propColor.TfrxHighlight', 'Bestemmer farven på objektet, hvis highlight er aktivt');
    Add('propColumnFields', 'Navnene på DB felterne repræsenteret i krydskolonnerne');
    Add('propColumnGap', 'Afstanden mellem kolonnebåndene');
    Add('propColumnLevels', 'Antallet af kolonneniveauer');
    Add('propColumns', 'Antallet af kolonner i båndet');
    Add('propColumnWidth', 'Bredden på kolonnebåndet');
    Add('propCondition', 'Grupperingsbetingelse. Gruppen vil blive brudt, hvis værdien af dette udtryk skifter');
    Add('propCondition.TfrxHighlight', 'Udtryksstreng. Hvis dette udtryk er True, vil highlight blive aktivt');
    Add('propConnected', 'Angiver om database-forbindelsen er aktiv');
    Add('propConvertNulls', 'Bestemmer om null DB værdier skal konvereteres til 0, False eller en tom streng');
    Add('propCopies', 'Standard antallet af kopier');
    Add('propCursor', 'Markøren for objektet');
    Add('propDatabaseName', 'Navnet på databasen');
    Add('propDataField', 'Angiver feltet fra hvilket objektet får dens data');
    Add('propDataSet', 'Sammenkæder objektet til datasættet der indeholder feltet som det repærsenterer');
    Add('propDate', 'Dato-værdien for kontrollen');
    Add('propDateFormat', 'Angiver formatet for, hvordan en dato bliver repræsenteret');
    Add('propDecimalSeparator', 'Decimalseparator');
    Add('propDefault', 'Bestemmer om knappen er stadard knap');
    Add('propDefHeight', 'Rækkens standard højde');
    Add('propDescription', 'Raportens beskrivelse');
    Add('propDiagonal', 'Angiver at linien er diagonal');
    Add('propDisplayFormat', 'Formatet for den viste værdi');
    Add('propDoubleBuffered', 'Bestemmer om vis udskrift-vinduet skal bruge dobbelt buffering. Slå double buffering til forhindrer blikken, men er langsommere');
    Add('propDoublePass', 'Bestemmer om raportgeneratoren skal lave et andet gennemløb');
    Add('propDown', 'Bestemmer om speed button er trykket eller ej');
    Add('propDownThenAcross', 'Bestemmer hvordan store krydstabeller vil blive delt på siderne');
    Add('propDriverName', 'Navnet på BDE driveren');
    Add('propDropShadow', 'Bestemmer om objektet har skygge');
    Add('propDuplex', 'Angiver duplex mode for siden');
    Add('propEditMask', 'Angiver masken som representerer hvilken tekst er gyldig for masked edit kontrol');
    Add('propEnabled', 'Bestemmer om kontrollen er tilgængelig');
    Add('propEngineOptions', 'Raportgenerator valgmulighed');
    Add('propExpression', 'Værdien af dette udtryk vil blive vist i objektet');
    Add('propExpressionDelimiters', 'Tegnet som vil blive brugt til at omslutte udtrykket indeholdt i teksten');
    Add('propFieldAliases', 'Datasættes felt aliaser');
    Add('propFilter', 'Filtreringsbetingelserne for datasættet');
    Add('propFiltered', 'Bestemmer om datasættet skal filtrere posterne ved brug af betingelserne i Filter property');
    Add('propFlowTo', 'Tekst-objektet som vil vise tekst som ikke passer ind i objektet');
    Add('propFont', 'Skrifttypeattributter for objektet');
    Add('propFooterAfterEach', 'Bestemmer om footer båndet skal vises efter hver datarække');
    Add('propFormatStr', 'Den formatterede streng');
    Add('propFrame', 'Rammeattributter for objektet');
    Add('propGapX', 'Tekstens venstre indryk');
    Add('propGapY', 'Tekstens top indryk');
    Add('propGlyph', 'Billedet for kontrollen');
    Add('propGroupIndex', 'Tillad at speed buttons arbejder sammen som en gruppe');
    Add('propHAlign', 'Den horisontale justering af teksten');
    Add('propHeight', 'Højden af objektet');
    Add('propHGuides', 'Den horisontale guideline for siden');
    Add('propHideZeros', 'Bestemmer om tekst-objektet skal skjule nul-værdier');
    Add('propHighlight', 'Attributter for betingelses-highlight');
    Add('propIndexName', 'Navnet på indeks');
    Add('propInitString', 'Printeres init streng for dot-matrix raporter');
    Add('propItems', 'List objektets elementer');
    Add('propKeepAspectRatio', 'Behold det originale størrelsesforhold på billedet');
    Add('propKeepChild', 'Bestemmer om båndet skal udskrives sammen med dens child');
    Add('propKeepFooter', 'Bestemmer om båndet skal udskrives sammen med dens footer');
    Add('propKeepHeader', 'Bestemmer om båndet skal udskrives sammen med dens header');
    Add('propKeepTogether', 'Bestemmer om båndet skal udskrives sammen med alle dens subbånd');
    Add('propKind.TfrxFormat', 'Typen af formattering');
    Add('propKind', 'Typen af knap');
    Add('propLargeDesignHeight', 'Bestemmer om siden skal have stor højde i designmode');
    Add('propLayout', 'Layoutet for knappens glyph');
    Add('propLeft', 'Venstre koordinat for objektet');
    Add('propLeftMargin', 'Størrelsen på venstre margen');
    Add('propLines', 'Teksten for objektet');
    Add('propLineSpacing', 'Antallet af pixels mellem to linier af tekst');
    Add('propLoginPrompt', 'Bestemmer om der skal vises en login dialogboks');
    Add('propMargin', 'Bestemmer antallet af pixels mellem kanten af billedet og kanten af knappen');
    Add('propMaster', 'Master datasættet');
    Add('propMasterFields', 'Felterne der er sammensat af en master-detail relation');
    Add('propMaximized', 'Bestemmer om vis udskrift-vinduet skal være maksimeret');
    Add('propMaxLength', 'Max længden af teksten');
    Add('propMaxPages', 'Max antal sider i den forberedte raport');
    Add('propMaxWidth', 'Max bredden af kolonnen');
    Add('propMDIChild', 'Bestemmer om vis udskrift-vinduet skal være en MDI child');
    Add('propMemo', 'Teksten for objektet');
    Add('propMinWidth', 'Min bredde for kolonnen');
    Add('propMirrorMargins', 'Afspejl sidemargener på de lige sider');
    Add('propModal', 'Bestemmer om vis udskrift-vinduet skal vises modalt');
    Add('propModalResult', 'Bestemmer om og hvordan knappen lukker dens modale form');
    Add('propName.TFont', 'Navnet på skrifttypen');
    Add('propName.TfrxReportOptions', 'Navnet på raporten');
    Add('propName', 'Navnet på objektet');
    Add('propNumGlyphs', 'Angiver antallet af billeder der er grafik angivet i Glyph propertien');
    Add('propOpenDataSource', 'Bestemmer om datakilden automatisk skal åbnes eller ej');
    Add('propOrientation', 'Sidens retning');
    Add('propOutlineText', 'Teksten der bliver vist i vis udskrifts omridskontrol');
    Add('propOutlineVisible', 'Synligheden af vis udskrifts omridskontrol');
    Add('propOutlineWidth', 'Bredden af vis udskrift omridskontrol');
    Add('propPageNumbers.TfrxPrintOptions', 'Antallet af sider der skal udskrives');
    Add('propPaperHeight', 'Højden på siden');
    Add('propPaperWidth', 'Bredden på siden');
    Add('propParagraphGap', 'Indrykningen af den første linie af punktopstillingen');
    Add('propParams.TfrxBDEDatabase', 'Parameter for forbindelsen');
    Add('propParams', 'Parameter for forespøgselen');
    Add('propParentFont', 'Bestemmer om objektet skal bruge faderes skrifttype');
    Add('propPassword', 'Raportens password');
    Add('propPasswordChar', 'Indikerer tegnet, hvis nogen, som skal vises i stedet for den faktiske tegn angivet i kontrollen');
    Add('propPicture', 'Billedet');
    Add('propPicture.TfrxReportOptions', 'Det beskrivende billed for raporten');
    Add('propPosition', 'Den initiale position af vinduet');
    Add('propPreviewOptions', 'Vis udskrift-valgmuligheder for raporten');
    Add('propPrintable', 'Udskriftsbarheden for objektet. Objekter med Udskrivbar=False vil blive vist, men ikke udskrevet');
    Add('propPrintChildIfInvisible', 'Bestemmer om child-båndet vil blive udskrevet hvis dens parent bånd er usynligt');
    Add('propPrinter', 'Navnet på printeren, som vil blive valgt hvis denne raport bliver åbnet eller kørt');
    Add('propPrintIfDetailEmpty', 'Bestemmer om databåndet vil blive udskrevet hvis dens subbånd er tomme');
    Add('propPrintIfEmpty', 'Bestemmer om siden vil blive udskrevet, hvis alle datasæt er tomme');
    Add('propPrintOnFirstPage', 'Bestemmer om båndet vil blive udskrevet på den første side');
    Add('propPrintOnLastPage', 'Bestemmer om båndet vil blive udskrevet på den sidste side');
    Add('propPrintOnParent', 'Bestemmer om subraporten kan udskrive sig selv på parent båndet');
    Add('propPrintOnPreviousPage', 'Bestemmer om siden kan blive genereret i den ledige plads fra en tidligere genereret side');
    Add('propPrintOptions', 'Udskriftvalgmulighederne for raporten');
    Add('propPrintPages', 'Bestemmer om alle, ulige eller lige sider skal udskrives');
    Add('propRangeBegin', 'Bestemmer startpunktet for datasætsnavigationen');
    Add('propRangeEnd', 'Bestemmer slutpunktet for datasætsnavigationen');
    Add('propRangeEndCount', 'Bestemmer antallet af poster i datasættet hvis RangeEnd er reCount');
    Add('propReadOnly', 'Bestemmer om tekstobjektet er skrivebeskyttet');
    Add('propRepeatHeaders', 'Bestemmer om kolonne og række headers skal genskrives på ny side');
    Add('propReportOptions', 'Valgmulighederne for raporten');
    Add('propReprintOnNewPage', 'Bestemmer om båndet skal genskrives på ny side');
    Add('propRestrictions', 'Indstilling af restriktionsflag');
    Add('propRightMargin', 'Størrelsen af højre side margen');
    Add('propRotation.TfrxBarCodeView', 'Retning for stregkoden');
    Add('propRotation', 'Tekstrotation');
    Add('propRowCount', 'Antallet af virtuelle poster i databåndet');
    Add('propRowFields', 'Navne på DB felter repræsenteret i kryds-rækkerne');
    Add('propRowLevels', 'Antallet af række niveauer');
    Add('propRTLReading', 'Bestemmer om tekst-objektet vil vise tekst i højre-til-venstre retning');
    Add('propScriptLanguage', 'Navnet på skriptsproget, der bliver anvendt i raporten');
    Add('propSessionName', 'Navnet på BDE sessionen');
    Add('propShadowColor', 'Farven på skyggen');
    Add('propShadowWidth', 'Bredden på skyggen');
    Add('propShape', 'Type af form');
    Add('propShiftMode', 'Skift opførelse for objektet');
    Add('propShowCaptions', 'Bestemmer om vis udskrift-knappen skal vise kort titel');
    Add('propShowColumnHeader', 'Bestemmer om kryds-tab skal vise kolonne headers');
    Add('propShowColumnTotal', 'Bestemmer om kryds-tab skal vise kolonne grand total');
    Add('propShowRowHeader', 'Bestemmer om kryds-tab skal vise række headers');
    Add('propShowRowTotal', 'Bestemmer om kryds-tab skal vise række grand total');
    Add('propShowDialog', 'Bestemmer om udskriv-dialogboksen skal vises i vis udskrift-vinduet');
    Add('propShowText', 'Bestemmer om et stregkode objekt skal vise en læsbar tekst');
    Add('propSize', 'Størrelse på skrifttypen');
    Add('propSorted', 'Bestemmer om elementer er sorteret eller ikke');
    Add('propSpacing', 'Bestemmer antallet af pixels mellem billede og teksten');
    Add('propSQL', 'SQL udtrykket');
    Add('propStartNewPage', 'Starter på en ny side før udprintning af et bånd');
    Add('propStretch', 'Udstrækker billedet til at passe objektets grænser');
    Add('propStretched', 'Bestemmer om objektet kan blive udstrukket');
    Add('propStretchMode', 'Opførelse af udstrækningen for objektet');
    Add('propStyle.TFont', 'Stilen på skrifttypen');
    Add('propStyle', 'Stilen på kontrollen');
    Add('propStyle.TfrxFrame', 'Stilen på objektets ramme');
    Add('propSuppressRepeated', 'Undertryk gentagne værdier');
    Add('propTableName', 'Navnet på data tabellen');
    Add('propTag', 'Tag-nummer for objektet');
    Add('propTagStr', 'Tag-streng for objektet');
    Add('propText', 'Teksten for objektet');
    Add('propTitleBeforeHeader', 'Bestemmer om raportitlen skal vises før sidehovedet');
    Add('propTop', 'Koordinater for objektet øverst');
    Add('propTopMargin', 'Størrelsen for øverst sidemargin');
    Add('propTyp', 'Typen for rammen');
    Add('propUnderlines', 'Bestemmer om tekstobjekter skal vise gitterlinier efter hver tekstlinie');
    Add('propURL', 'URL for objektet');
    Add('propUserName', 'Brugernavn for data objektet. Dette navn vil blive vist i data-træet');
    Add('propVAlign', 'Den vertikale justering af teksten');
    Add('propVersionBuild', 'Versionsinfo, build');
    Add('propVersionMajor', 'Versionsinfo, stor version');
    Add('propVersionMinor', 'Versionsinfo, lille version');
    Add('propVersionRelease', 'Versionsinfo, frigivelse');
    Add('propVGuides', 'Den vertikale guideline for siden');
    Add('propVisible', 'Synligheden af objektet');
    Add('propWidth', 'Bredden på objektet');
    Add('propWidth.TfrxFrame', 'Bredden af rammen');
    Add('propWindowState', 'Initial status af vinduet');
    Add('propWordBreak', 'Bryd Russiske ord');
    Add('propWordWrap', 'Bestemmer om tekstobjektet skal indsætte et blødt vognskifte, så teksten deles ved den højre margen');
    Add('propZoom.TfrxBarCodeView', 'Zooms stregkode');
    Add('propZoom', 'Initial zoom faktor i vis udskrift vinduet');
    Add('propZoomMode', 'Initial zoom modus i vis udskrift vinduet');
  end;
end;


initialization
  frAddInspectorRes;

end.
