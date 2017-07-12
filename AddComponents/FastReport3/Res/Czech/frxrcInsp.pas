
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
    Add('propActive', 'Specifikuje zda je databáze otevøená');
    Add('propActive.TfrxHighlight', 'Specifikuje zda je zvıraznìní aktivní');
    Add('propAliasName', 'Název BDE aliasu');
    Add('propAlign', 'Urèuje zarovnání objektu relativnì k pruhu, nebo stránce');
    Add('propAlignment', 'Zarovnání objektu textu');
    Add('propAllowAllUp', 'Specifikuje zda všechna rychlá tlaèítka ve skupinì mohou bıt nevybrána ve stejnı èas');
    Add('propAllowEdit', 'Urèuje zda mùe uivatel upravovat pøedpøipravené stránky reportù');
    Add('propAllowExpressions', 'Urèuje zda mùe textovı objekt v textu obsahovat vırazy');
    Add('propAllowGrayed', 'Povoluje zašedlı stav øídících zatrítek');
    Add('propAllowHTMLTags', 'Urèuje zda mùe textovı objekt v textu obsahovat HTML tagy');
    Add('propAllowSplit', 'Urèuje zda mùe pruh rozdìlovat svùj obsah v rámci stránky');
    Add('propAuthor', 'Autor reportu');
    Add('propAutoSize', 'Urèuje zda mùe obrázek mìnit svoji velikost automaticky');
    Add('propAutoWidth', 'Urèuje zda mùe text mìnit svoji šíøku automaticky');
    Add('propBackPicture', 'Obrázek pozadí stránky');
    Add('propBarType', 'Typ èárového kódu');
    Add('propBevelInner', 'Typ vnitøního zkosení');
    Add('propBevelOuter', 'Typ vnìjšího zkosení');
    Add('propBevelWidth', 'Šíøka zkosení');
    Add('propBorder', 'Urèuje zda zobrazit vnìjší okraj, nebo ne');
    Add('propBorderStyle', 'Styl okna');
    Add('propBottomMargin', 'Velikost spodního okraje stránky');
    Add('propBrushStyle', 'Styl štìtce pouitého pro pozadí objektu');
    Add('propButtons', 'Nastavení tlaèítek viditelnıch v oknì pøedtisku');
    Add('propCacheSize', 'Max velikost pamìti pouité enginem reportu. Pokud pouívaná pamì pøesáhne tuto hodnotu, pøipravovaná stránka bude uloena do souboru na disk');
    Add('propCalcCheckSum', 'Urèuje zda bude èárovı kód vypoètené èíslice kontrolovat automaticky');
    Add('propCancel', 'Urèuje zda bude aktivována klávesa pøi stisku Esc');
    Add('propCaption', 'Název ovládání');
    Add('propCellFields', 'Názvy DB polí reprezentující køíové buòky');
    Add('propCellLevels', 'Poèet úrovní bunìk');
    Add('propCenter', 'Urèuje zda bude obrázek v ovládání vystøedìn');
    Add('propCharset', 'Sada písma');
    Add('propCharSpacing', 'Poèet pixelù mezi dvìma znaky');
    Add('propCheckColor', 'Barva znaèky zatrení');
    Add('propChecked', 'Indikuje zda je ovládání zatreno');
    Add('propCheckStyle', 'Styl znaèky zatrení');
    Add('propChild', 'Podøazenı pruh spojenı s tímto pruhem');
    Add('propCollate', 'Základní nastavení celku');
    Add('propColor.TFont', 'Barva textu');
    Add('propColor', 'Barva objektu');
    Add('propColor.TfrxFrame', 'Barva rámeèku');
    Add('propColor.TfrxHighlight', 'Urèuje barvu objektu pokud je zvıraznìní aktivní');
    Add('propColumnFields', 'Názvy DB polí reprezentující køíové sloupce');
    Add('propColumnGap', 'Mezera mezi pruhy sloupcù');
    Add('propColumnLevels', 'Poèet úrovní sloupcù');
    Add('propColumns', 'Poèet sloupcù v pruhu');
    Add('propColumnWidth', 'Šíøka pruhu sloupce');
    Add('propCondition', 'Skupinová podmínka. Skupina bude zrušena pokud se zmìní hodnota tohoto vırazu');
    Add('propCondition.TfrxHighlight', 'Øetìzec vırazu. Pokud bude vıraz pravdivı, bude aktivováno zvıraznìní');
    Add('propConnected', 'Indikuje zda je pøipojení databáze aktivní');
    Add('propConvertNulls', 'Urèuje zda budou null hodnoty DB pøevedeny na 0, False, nebo prázdnı øetìzec');
    Add('propCopies', 'Základní poèet kopií');
    Add('propCursor', 'Kurzor objektu');
    Add('propDatabaseName', 'Název databáze');
    Add('propDataField', 'Specifikuje pole ze kterého dostává objekt data');
    Add('propDataSet', 'Pøipojuje objekty k datasetu, kterı obsahuje jeho reprezentující pole');
    Add('propDate', 'Hodnota datumu ovládání');
    Add('propDateFormat', 'Specifikuje formát ve kterém je datum prezentováno');
    Add('propDecimalSeparator', 'Desetinnı oddìlovaè');
    Add('propDefault', 'Urèuje zda je tlaèítko základním tlaèítkem');
    Add('propDefHeight', 'Základní vıška øádku');
    Add('propDescription', 'Popis reportu');
    Add('propDiagonal', 'Indikuje e èára je diagonální');
    Add('propDisplayFormat', 'Formát zobrazované hodnoty');
    Add('propDoubleBuffered', 'Urèuje zda okno pøedtisku pouívá double buffering. Povolenı double buffering pøedchází obrazovému rušení, ale je pomalejší');
    Add('propDoublePass', 'Urèuje zda engine reportu provede druhı prùchod');
    Add('propDown', 'Urèuje zda je stisknuté rychlé tlaèítko');
    Add('propDownThenAcross', 'Urèuje zda budou velké køíové tabulky rozdìleny do stránek');
    Add('propDriverName', 'Název BDE ovladaèe');
    Add('propDropShadow', 'Urèuje zda má objekt stín');
    Add('propDuplex', 'Specifikuje duplexní mód pro stránku');
    Add('propEditMask', 'Specifikuje masku která reprezentuje kterı text je platnı pro øízení maskované editace');
    Add('propEnabled', 'Urèuje zda je povoleno ovládání');
    Add('propEngineOptions', 'Nastavení engine reportu');
    Add('propExpression', 'Hodnota tohoto vırazu bude zobrazena v objektu');
    Add('propExpressionDelimiters', 'Znak, kterı bude pouit k oddìlení vırazù obsaenıch v textu');
    Add('propFieldAliases', 'Aliasy polí datasetu');
    Add('propFilter', 'Podmínky filtrování pro dataset');
    Add('propFiltered', 'Urèuje zda bude dataset filtrovat záznamy s pouitím podmínky ve vlastnosti Filtr');
    Add('propFlowTo', 'Textovı objekt zobrazující text, kterı se nepøizpùsobí objektu');
    Add('propFont', 'Vlastnosti písma objektu');
    Add('propFooterAfterEach', 'Urèuje zda bude zobrazen pruh zápatí po kadém øádku dat');
    Add('propFormatStr', 'Formátovací øetìzec');
    Add('propFrame', 'Vlastnosti orámování objektu');
    Add('propGapX', 'Levé odsazení textu');
    Add('propGapY', 'Horní odsazení textu');
    Add('propGlyph', 'Obrázek ovládání');
    Add('propGroupIndex', 'Povoluje rychlá tlaèítka pro práci spoleènì jako skupina');
    Add('propHAlign', 'Vodorovné zarovnání textu');
    Add('propHeight', 'Vıška objektu');
    Add('propHGuides', 'Vodorovná vodítka stránky');
    Add('propHideZeros', 'Urèuje zda bude textovı objekt skrıvat nulové hodnoty');
    Add('propHighlight', 'Vlastnosti podmínìného zvıraznìní');
    Add('propIndexName', 'Název indexu');
    Add('propInitString', 'Inicializaèní øetìzec tiskárny pro reporty jehlièkovıch tiskáren');
    Add('propItems', 'Seznam poloek objektu');
    Add('propKeepAspectRatio', 'Dodret pùvodní stranovı pomìr obrázku');
    Add('propKeepChild', 'Urèuje zda bude pruh tisknut spolu s jeho podøazenım');
    Add('propKeepFooter', 'Urèuje zda bude pruh tisknut spolu s jeho zápatím');
    Add('propKeepHeader', 'Determines whether the band will be printed together with its header');
    Add('propKeepTogether', 'Urèuje zda bude pruh tisknut spolu se všemi jeho podøazenımi pruhy');
    Add('propKind.TfrxFormat', 'Druh formátování');
    Add('propKind', 'Druh tlaèítka');
    Add('propLargeDesignHeight', 'Urèuje zda bude mít stránka velikou vıšku v módu úprav');
    Add('propLayout', 'Plocha obrázku tlaèítka');
    Add('propLeft', 'Levá souøadnice objektu');
    Add('propLeftMargin', 'Velikost levého okraje stránky');
    Add('propLines', 'Text objektu');
    Add('propLineSpacing', 'Poèet pixelù mezi dvìma øádky textu');
    Add('propLoginPrompt', 'Urèuje zda zobrazit dialog pøihlášení');
    Add('propMargin', 'Urèuje poèet pixelù mezi okrajem obrázku a okrajem tlaèítka');
    Add('propMaster', 'Hlavní dataset');
    Add('propMasterFields', 'Pole svázané relací master-detail');
    Add('propMaximized', 'Urèuje zda bude okno pøedtisku maximalizováno');
    Add('propMaxLength', 'Max. délka textu');
    Add('propMaxPages', 'Max. poèet stránek pøipravovaného reportu');
    Add('propMaxWidth', 'Max. šíøka sloupce');
    Add('propMDIChild', 'Urèuje zda bude okno pøedtisku typu MDI podøazené');
    Add('propMemo', 'Text objektu');
    Add('propMinWidth', 'Min. šíøka sloupce');
    Add('propMirrorMargins', 'Zrcadlí okraje stránky na všechny další stránky');
    Add('propModal', 'Urèuje zda bude zobrazeno okno pøedtisku modálnì');
    Add('propModalResult', 'Urèuje zda a jak uzavøe tlaèítko modální formuláø');
    Add('propName.TFont', 'Název písma');
    Add('propName.TfrxReportOptions', 'Název  reportu');
    Add('propName', 'Název objektu');
    Add('propNumGlyphs', 'Indikuje poèet obrázkù které jsou v grafice, specifikovanıch ve vlastnosti Glyph');
    Add('propOpenDataSource', 'Urèuje zda automaticky otevøít zdroj dat, nebo ne');
    Add('propOrientation', 'Orientace stránky');
    Add('propOutlineText', 'Text, kterı bude zobrazen v ovládání v pøedtisku');
    Add('propOutlineVisible', 'Viditelnost ovládání pøedtisku');
    Add('propOutlineWidth', 'Šíøka ovládání pøedtisku');
    Add('propPageNumbers.TfrxPrintOptions', 'Poèet tisknutıch stránek');
    Add('propPaperHeight', 'Vıška stránky');
    Add('propPaperWidth', 'Šíøka stránky');
    Add('propParagraphGap', 'Odstup první øádky odstavce');
    Add('propParams.TfrxBDEDatabase', 'Parametry pøipojení');
    Add('propParams', 'Parametry query (dotazu)');
    Add('propParentFont', 'Urèuje zda bude objekt pouívat nadøazené písmo');
    Add('propPassword', 'Heslo reportu');
    Add('propPasswordChar', 'Indicuje znak, pokud je nìjakı, kterı se zobrazí na místì aktuálního znaku psaného v ovládání');
    Add('propPicture', 'Obrázek');
    Add('propPicture.TfrxReportOptions', 'Popisující obrázek reportu');
    Add('propPosition', 'Základní pozice okna');
    Add('propPreviewOptions', 'Nastavení pøedtisku reportu');
    Add('propPrintable', 'Tisknutelnost objektu. Objekt s tisknutelností=False bude zobrazen v pøedtisku, ale nebude tisknut');
    Add('propPrintChildIfInvisible', 'Urèuje zda bude podøazenı pruh vytištìn, pokud je jeho nadøazenı pruh neviditelnı');
    Add('propPrinter', 'Název tiskárny kterı bude vybrán v pøípadì otevøení, nebo spuštìní tohoto reportu');
    Add('propPrintIfDetailEmpty', 'Urèuje zda bude datovı pruh vytištìn v pøípadì, e je jeho podpruh prázdnı');
    Add('propPrintIfEmpty', 'Urèuje zda bude stránka vytištìna pokud jsou všechny její datasety prázdné');
    Add('propPrintOnFirstPage', 'Urèuje zda bude pruh vytištìn na první stránku');
    Add('propPrintOnLastPage', 'Urèuje zda bude pruh vytištìn na poslední stránku');
    Add('propPrintOnParent', 'Urèuje zda se mùe vytisknout podreport do nadøazeného pruhu');
    Add('propPrintOnPreviousPage', 'Urèuje zda mùe bıt stránka vygenerována do volného místa pøedchozí vygenerované stránky');
    Add('propPrintOptions', 'Tisk nastavení reportu');
    Add('propPrintPages', 'Urèuje zda bude vytisknuto vše, liché, nebo sudé stránky');
    Add('propRangeBegin', 'Urèuje poèáteèní bod navigace datasetu');
    Add('propRangeEnd', 'Urèuje koncovı bod navigace datasetu');
    Add('propRangeEndCount', 'Urèuje poèet záznamù v datasetu, v pøípadì e RangeEnd je pøepoèítán');
    Add('propReadOnly', 'Urèuje zda je textovı objekt pouze pro ètení');
    Add('propRepeatHeaders', 'Urèuje zda budou sloupce a øádky záhlaví tisknuty na kadé stránce');
    Add('propReportOptions', 'Nastavení reportu');
    Add('propReprintOnNewPage', 'Urèuje zda bude pruh tištìn na kadé stránce');
    Add('propRestrictions', 'Sada pøíznakù omezení');
    Add('propRightMargin', 'Velikost pravého okraje stránky');
    Add('propRotation.TfrxBarCodeView', 'Orientace èárového kódu');
    Add('propRotation', 'Otáèení textu');
    Add('propRowCount', 'Poèet virtuálních záznamù v pruhu dat');
    Add('propRowFields', 'Názvy DB polí reprezentujících køíové øádky');
    Add('propRowLevels', 'Poèet úrovní øádku');
    Add('propRTLReading', 'Urèuje zda zobrazí textovı objekt svùj text ve smìru zprava do leva');
    Add('propScriptLanguage', 'Název skriptovacího jazyka pouitého v reportu');
    Add('propSessionName', 'Název sekce BDE');
    Add('propShadowColor', 'Barva stínu');
    Add('propShadowWidth', 'Šíøka stínu');
    Add('propShape', 'Typ tvaru');
    Add('propShiftMode', 'Funkce posunu objektu');
    Add('propShowCaptions', 'Urèuje zda tlaèítka v pøedtisku zobrazí svùj název');
    Add('propShowColumnHeader', 'Urèuje zda køí zobrazí sloupcová záhlaví');
    Add('propShowColumnTotal', 'Urèuje zda køí zobrazí sloupcové celkové souèty');
    Add('propShowRowHeader', 'Urèuje zda køí zobrazí øádková záhlaví');
    Add('propShowRowTotal', 'Urèuje zda køí zobrazí øádkové celkové souèty');
    Add('propShowDialog', 'Urèuje zda bude tiskovı dialog zobrazen v oknì pøedtisku');
    Add('propShowText', 'Urèuje zda bude zobrazovat èárovı kód èitelnı text');
    Add('propSize', 'Velikost písma');
    Add('propSorted', 'Urèuje zda budou poloky seøazeny, nebo ne');
    Add('propSpacing', 'Urèuje poèet pixelù mezi obrázkem a textem');
    Add('propSQL', 'SQL vıraz');
    Add('propStartNewPage', 'Pøed tiskem pruhu zaène novou stránku');
    Add('propStretch', 'Pøizpùsobí obrázek hranicím objektu');
    Add('propStretched', 'Urèuje zda mùe bıt objekt velikostnì pøizpùsoben');
    Add('propStretchMode', 'Typ pøizpùsobení velikosti objektu');
    Add('propStyle.TFont', 'Styl písma');
    Add('propStyle', 'Styl ovládání');
    Add('propStyle.TfrxFrame', 'Styl rámeèku objektu');
    Add('propSuppressRepeated', 'Potlaèení opakovanıch hodnot');
    Add('propTableName', 'Název tabulky dat');
    Add('propTag', 'Èíslo Tagu objektu');
    Add('propTagStr', 'Øetìzec Tagu objektu');
    Add('propText', 'Text objektu');
    Add('propTitleBeforeHeader', 'Urèuje zda bude zobrazen název reportu pøed záhlavím stránky');
    Add('propTop', 'Horní souøadnice objektu');
    Add('propTopMargin', 'Velikost horního okraje stránky');
    Add('propTyp', 'Typ rámeèku');
    Add('propUnderlines', 'Urèuje zda textovı objekt zobrazí møíkové linky po kadé textové øádce');
    Add('propURL', 'URL objektu');
    Add('propUserName', 'Uivatelskı název datového objektu. Tento název bude zobrazován v datovém stromu');
    Add('propVAlign', 'Svislé zarovnání textu');
    Add('propVersionBuild', 'Info o verzi, sestavení');
    Add('propVersionMajor', 'Info o verzi, major verze');
    Add('propVersionMinor', 'Info o verzi, minor verze');
    Add('propVersionRelease', 'Info o verzi, vydání');
    Add('propVGuides', 'Svislé vodítka stránky');
    Add('propVisible', 'Viditelnost objektu');
    Add('propWidth', 'Šíøka objektu');
    Add('propWidth.TfrxFrame', 'Šíøka rámeèku');
    Add('propWindowState', 'Poèáteèní stav okna');
    Add('propWordBreak', 'Rozdìlování ruskıch slov');
    Add('propWordWrap', 'Urèuje zda textovı objekt vloí mìkkı pøechod na novou øádku tak, e se text zalomí k pravému okraji');
    Add('propZoom.TfrxBarCodeView', 'Zvìtší èárovı kód');
    Add('propZoom', 'Poèáteèní faktor zvìtšení okna pøedtisku');
    Add('propZoomMode', 'Poèáteèní reim zvìtšení okna pøedtisku');
  end;
end;


initialization
  frAddInspectorRes;

end.
