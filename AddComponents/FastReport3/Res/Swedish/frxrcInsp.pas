
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
    Add('propActive', 'Specificerar om ett dataset är öppet eller inte');
    Add('propActive.TfrxHighlight', 'Specificerar om highlight är aktivt eller inte');
    Add('propAliasName', 'Namnet på BDE alias');
    Add('propAlign', 'Bestämmer positionen på objektet relativt band eller sida');
    Add('propAlignment', 'Bestämmer position på objektets text');
    Add('propAllowAllUp', 'Specificerar om alla speed buttons i en grupp kan vara ovalda på samma gång');
    Add('propAllowEdit', 'Bestämmer om användaren kan ändra i de preparerade rapportsidorna');
    Add('propAllowExpressions', 'Bestämmer om text objekten får innehålla uttryck inuti texten');
    Add('propAllowGrayed', 'Tillåter att checkboxar kan anta grå status');
    Add('propAllowHTMLTags', 'Bestämmer om ett text objekt kan innehålla HTML taggar inuti texten');
    Add('propAllowSplit', 'Bestämmer om ett band kan delas upp över flera sidor');
    Add('propAuthor', 'Rapportens Upphovsman');
    Add('propAutoSize', 'Bestämmer om en bild ska handa sin storlek automatiskt');
    Add('propAutoWidth', 'Bestämmer om ett text objekt ska handa sin bredd automatiskt');
    Add('propBackPicture', 'Sidans bakgrundsbild');
    Add('propBarType', 'Vilken typ av barcode');
    Add('propBevelInner', 'Vilken typ av inre kant på ramen');
    Add('propBevelOuter', 'Vilken typ av yttre kant på ramen');
    Add('propBevelWidth', 'kantens bredd');
    Add('propBorder', 'Bestämmer om den yttre gränsen ska visas eller inte');
    Add('propBorderStyle', 'Fönstrets stil');
    Add('propBottomMargin', 'Storlek på bottenmarginalen');
    Add('propBrushStyle', 'Stil på den bruch som används till objektets bakgrund');
    Add('propButtons', 'Vilka knappar som ska visas i Förhandsgranska');
    Add('propCacheSize', 'Maximalt tillgängligt minne för rapport motorn. Om använt minne överskrider det här värdet så chachas sidorna till disk');
    Add('propCalcCheckSum', 'Bestämmer om  barcode ska kalylera checksiffran automatikt eller inte');
    Add('propCancel', 'Bestämmer om knappen ska aktiveras med ESC eller inte');
    Add('propCaption', 'Rubrik på kontrollen');
    Add('propCellFields', 'Namnen på de DB fält som representerar korsreferensecellerna');
    Add('propCellLevels', 'Antal cellnivåer');
    Add('propCenter', 'Bestämmer om bilden ska centreras inuti kontrollen');
    Add('propCharset', 'Fontens teckenuppsättning');
    Add('propCharSpacing', 'Antalet pixlar mellan två tecken');
    Add('propCheckColor', 'Färg på checkmarkeringen');
    Add('propChecked', 'Indikerar om kontrollen är checkmarkerad eller inte');
    Add('propCheckStyle', 'Checkmarkeringens stil');
    Add('propChild', 'Barnband ihopkopplat med detta band');
    Add('propCollate', 'Förvald sorteringsordning');
    Add('propColor.TFont', 'Färg på texten');
    Add('propColor', 'Objektets färg');
    Add('propColor.TfrxFrame', 'Ramens färg');
    Add('propColor.TfrxHighlight', 'Bestämmer vilken färg det är på objektet om highlight är aktiverat');
    Add('propColumnFields', 'Namnet på DB fälten representerar korsreferenskolumnerna');
    Add('propColumnGap', 'Mellanrummet mellan bandkolumner');
    Add('propColumnLevels', 'Antalet kolumnnivåer');
    Add('propColumns', 'Antalet kolumner i bandet');
    Add('propColumnWidth', 'Bredden på bandkolumnen');
    Add('propCondition', 'Gruppvillkoret, Gruppen kommer att bryta om värdet på det här uttrycket ändras');
    Add('propCondition.TfrxHighlight', 'Uttrycksträng. Om värdet på uttrycket är sant så är highlight på');
    Add('propConnected', 'Indikerar om en koppling till databasen är aktiv');
    Add('propConvertNulls', 'Bestämmer om null värden ska konverteras till 0, falsk eller tom sträng');
    Add('propCopies', 'Förvalt antal kopior');
    Add('propCursor', 'Objektets markör');
    Add('propDatabaseName', 'Databasens namn');
    Add('propDataField', 'Specificerar fältet som objektet får data ifrån');
    Add('propDataSet', 'Länkar obkjektet till det dataset som innehåller fältrepresentationen');
    Add('propDate', 'Kontrollens datumvärde');
    Add('propDateFormat', 'Specificerar datumformat');
    Add('propDecimalSeparator', 'Decimalseparator');
    Add('propDefault', 'Bestämmer om knappen är förvald eller inte');
    Add('propDefHeight', 'Förvald höjd på raden');
    Add('propDescription', 'Rapportbeskrivning');
    Add('propDiagonal', 'Indikerar om linjen är diagonal');
    Add('propDisplayFormat', 'Format på visat värde');
    Add('propDoubleBuffered', 'Bestämmer om Förhandsgranska använder dubbel buffer. Om dubbel buffer används förhindras blinkningar, men är långsammare');
    Add('propDoublePass', 'Bestämmer om rapportmotorn ska utför ett andra pass eller inte');
    Add('propDown', 'Bestämmer om speed button har tryckts ned eller inte');
    Add('propDownThenAcross', 'Bestämmer om ett stor korsreferens ska delas upp på flera sidor eller inte');
    Add('propDriverName', 'Namnet på BDEns drivrutin');
    Add('propDropShadow', 'Bestämmer om objektet har en skugga eller inte');
    Add('propDuplex', 'Specificerar duplex för sidan');
    Add('propEditMask', 'Specificerar den mask som representerar vilken text som är giltig för edit kontrollen');
    Add('propEnabled', 'Specificerar om kontrollen är påslagen eller inte');
    Add('propEngineOptions', 'Tillval för rapportens motor');
    Add('propExpression', 'Värdet av det här yttrycket kommer att visas i objektet');
    Add('propExpressionDelimiters', 'Tecknen som används för att innesluta uttrycket i texten.');
    Add('propFieldAliases', 'Datasetets fält alias');
    Add('propFilter', 'Datasetets filtervillkor');
    Add('propFiltered', 'Bestämmer om datasetet ska filtreras med hjälp av filtervillkoret eller inte');
    Add('propFlowTo', 'Textobjektet visar den text som inte får plats i objektet');
    Add('propFont', 'Objektets fontegenskap');
    Add('propFooterAfterEach', 'Bestämmer om bandets sidfot ska visas efter varje datapost');
    Add('propFormatStr', 'Formateringssträng');
    Add('propFrame', 'Objektets ramegenskap');
    Add('propGapX', 'Textens vänsterkant');
    Add('propGapY', 'Textens övre gräns');
    Add('propGlyph', 'Kontrollens bild');
    Add('propGroupIndex', 'Tillåter att speed buttons arbetar tillsammans som en grupp');
    Add('propHAlign', 'Den Horisontella uppställningen av texten');
    Add('propHeight', 'Objektets höjd');
    Add('propHGuides', 'De Horisontella hjälplinjerna för sidan');
    Add('propHideZeros', ' Bestämmer om objektet ska visa noll-värden eller inte');
    Add('propHighlight', 'Villkoret för att visa highlight');
    Add('propIndexName', 'Indexets namn');
    Add('propInitString', 'Initieringssträng för mastris-skrivare');
    Add('propItems', 'Listar objektets poster');
    Add('propKeepAspectRatio', 'Behåll bildens proportioner');
    Add('propKeepChild', 'Bestämmer om bandet ska skrivas ut tillsammans med dess barn');
    Add('propKeepFooter', 'Bestämmer om bandet ska skrivas ut tillsammans med dess fot');
    Add('propKeepHeader', 'Bestämmer om bandet ska skrivas ut tillsammans med dess huvud');
    Add('propKeepTogether', 'Bestämmer om bandet ska skrivas ut tillsammans med dess underband');
    Add('propKind.TfrxFormat', 'Typ av formatering');
    Add('propKind', 'Typ av knapp');
    Add('propLargeDesignHeight', 'Bestämmer om sidan ska ha stor höjd i design läge');
    Add('propLayout', 'Bestämmer knappens bildplacering');
    Add('propLeft', 'Objektets Vänstra kordinat');
    Add('propLeftMargin', 'Storlek på vänstermarginalen');
    Add('propLines', 'Objektets text');
    Add('propLineSpacing', 'Antalet pixlar mellan två rader text');
    Add('propLoginPrompt', 'Bestämmer om inloggningsfönster ska visas');
    Add('propMargin', 'Bestämmer antalet pixlar mellan kanten på bild och kanten på knappen');
    Add('propMaster', 'Master dataset');
    Add('propMasterFields', 'De fält som används som länk för master-detalj kopplingen');
    Add('propMaximized', 'Bestämmer om förhandsgranska ska maximeras');
    Add('propMaxLength', 'Maximal textlängd');
    Add('propMaxPages', 'Maximalt antal sidor i den preparerade rapporten');
    Add('propMaxWidth', 'Kolumnens maximala bredd');
    Add('propMDIChild', 'Bestämmer om Förhandsgranska ska vara ett fönster i fönstret (MDI)');
    Add('propMemo', 'Objektets text');
    Add('propMinWidth', 'Minsta bredd på kolumnen');
    Add('propMirrorMargins', 'Spegelvänd sidmarginaler på jämna sidor');
    Add('propModal', 'Bestämmer om Förhandsgranska ska visas modalt');
    Add('propModalResult', 'Bestämmer när och hur en knapp ska stänga ett modalt fönster');
    Add('propName.TFont', 'Fonstens namn');
    Add('propName.TfrxReportOptions', 'Rapportens namn');
    Add('propName', 'Objektets namn');
    Add('propNumGlyphs', 'Innehåller antalet bilder i den grafik specficerad av Glyph egenskapen');
    Add('propOpenDataSource', 'Bestämmer om ett dataset ska öppnas automatiskt eller inte');
    Add('propOrientation', 'Sidans orientering');
    Add('propOutlineText', 'Text som ska visas i förhandsgranskningens översikt');
    Add('propOutlineVisible', 'Bestämmer om översikt ska visas i Förhandsgranska');
    Add('propOutlineWidth', 'Bredd på förhandsgranskningens översikt');
    Add('propPageNumbers.TfrxPrintOptions', 'Antal sidor som ska skrivas ut');
    Add('propPaperHeight', 'Sidhöjd');
    Add('propPaperWidth', 'Sidbredd');
    Add('propParagraphGap', 'Bestämer indrag på den första raden i stycket');
    Add('propParams.TfrxBDEDatabase', 'Kopllingens parametrar');
    Add('propParams', 'Frågans (querys) parametrar');
    Add('propParentFont', 'Bestämmer om objektet ska använda objektets ägares font');
    Add('propPassword', 'Rapportens lösenord');
    Add('propPasswordChar', 'Innehåller det tecken som ska användas för att skydda lösenord från att visas på skärmen');
    Add('propPicture', 'Bilden');
    Add('propPicture.TfrxReportOptions', 'Rapportens tillval');
    Add('propPosition', 'Initial position för fönstret');
    Add('propPreviewOptions', 'Tillval till Förhandsgranska');
    Add('propPrintable', 'Objektets möjlighet till att bli utskrivet. Objekt som har Printable=False kan förhandsgranskas, men inte skrivas ut');
    Add('propPrintChildIfInvisible', 'Bestämmer om ett barnband ska skrivas ut om föräldrabandet är osynligt');
    Add('propPrinter', 'Namnet på skrivaren, när rapporten öppnas eller körs');
    Add('propPrintIfDetailEmpty', 'Bestämmer om ett databand ska skrivas ut om dess underband är tomt');
    Add('propPrintIfEmpty', 'Bestämmer om en rapport ska skrivas ut om alla dess dataset är tomma');
    Add('propPrintOnFirstPage', 'Bestämmer om bandet ska skrivas ut på första sidan');
    Add('propPrintOnLastPage', 'Bestämmer om bandet ska skrivas ut på sista sidan');
    Add('propPrintOnParent', 'Bestämmer om en underrapport kan skriva ut sig själv på sitt föräldraband');
    Add('propPrintOnPreviousPage', 'Bestämmer om sidan kan skapas i det fria utrymmet på föregående sida');
    Add('propPrintOptions', 'Rapportens utskriftstillval');
    Add('propPrintPages', 'Bestämmer om udda, jämna eller alla sidor ska skrivas ut');
    Add('propRangeBegin', 'Bestämmer startposition för navigering i datasetet');
    Add('propRangeEnd', 'Bestämmer slutposition för navigering i datasetet');
    Add('propRangeEndCount', 'Bestämmer antalet pster i datasetet om RangeEnd är lika med reCount');
    Add('propReadOnly', 'Bestämmer om text objekten ska vara skrivskyddade');
    Add('propRepeatHeaders', 'Bestämmer om column och radrubriker ska återutskrivas på ny sida');
    Add('propReportOptions', 'Rapportens tillval');
    Add('propReprintOnNewPage', 'Bestämmer om bandet ska återutskrivas på ny sida');
    Add('propRestrictions', 'En mängd begränsningsflaggor');
    Add('propRightMargin', 'Höger sidmarginal');
    Add('propRotation.TfrxBarCodeView', 'Barcodens orientering');
    Add('propRotation', 'Textvinkel');
    Add('propRowCount', 'Antalet virtuella poster i databandet');
    Add('propRowFields', 'Namnen på databasfälten som representerar korsreferensraderna');
    Add('propRowLevels', 'Antalet radnivåer');
    Add('propRTLReading', 'Bestämmer om text objektets ska visa höger-till-vänster');
    Add('propScriptLanguage', 'Namnet på det scriptspråk som används i rapporten');
    Add('propSessionName', 'Namnet på BDE sessionen');
    Add('propShadowColor', 'Färg på skuggan');
    Add('propShadowWidth', 'Skuggans bredd');
    Add('propShape', 'Figurtyp');
    Add('propShiftMode', 'Objektets förändringsegenskaper');
    Add('propShowCaptions', 'Bestämmer om förhandsgranskaknappen ska visa dess rubrik');
    Add('propShowColumnHeader', 'Bestämmer om korsreferensen ska visa kolumnrubriker');
    Add('propShowColumnTotal', 'Bestämmer om korsreferensen ska visa kolumntotaler');
    Add('propShowRowHeader', 'Bestämmer om korsreferensen ska visa radrubriker');
    Add('propShowRowTotal', 'Bestämmer om korsreferensen ska visa radtotaler');
    Add('propShowDialog', 'Bestämmer om utskriftsdialog ska visas i förhandsgranska');
    Add('propShowText', 'Bestämmer om barcode objektet ska visa läsbar text');
    Add('propSize', 'Fontstorlek');
    Add('propSorted', 'Bestämmer om posterna är sorterade eller inte');
    Add('propSpacing', 'Bestämmer antalet pixlar mellan bild och text');
    Add('propSQL', 'SQL uttryck');
    Add('propStartNewPage', 'Börjar ny sida innan band skrivs ut');
    Add('propStretch', 'Sträcker bilden så den passar objektets gränsvärden');
    Add('propStretched', 'Bestämmer om objektet kan sträckas eller inte');
    Add('propStretchMode', 'Objektets sträck egenskaper');
    Add('propStyle.TFont', 'Fontens stil');
    Add('propStyle', 'Kontrollens stil');
    Add('propStyle.TfrxFrame', 'Objektets rams stil');
    Add('propSuppressRepeated', 'Förhindra återupprepade värden');
    Add('propTableName', 'Datatabellens namn');
    Add('propTag', 'Objektets Tag nummer');
    Add('propTagStr', 'Objektets Tag sträng');
    Add('propText', 'Objektets text');
    Add('propTitleBeforeHeader', 'Bestämmer om rapportens titel ska visas innan sidhuvud');
    Add('propTop', 'Objekets topp kordinat');
    Add('propTopMargin', 'Toppmarginal');
    Add('propTyp', 'Typ av ram');
    Add('propUnderlines', 'Bestämmer om text objeketet ska cellrutor efter varje textrad');
    Add('propURL', 'Objekets URL');
    Add('propUserName', 'Objektets namn. Namnet visas i dataöversikten');
    Add('propVAlign', 'Vertikal uppställning av text');
    Add('propVersionBuild', 'Versionsinformation, build');
    Add('propVersionMajor', 'Versionsinformation, major version');
    Add('propVersionMinor', 'Versionsinformation, minor version');
    Add('propVersionRelease', 'Versionsinformation, release');
    Add('propVGuides', 'Sidan vertikala hjälprader');
    Add('propVisible', 'Objektets synlighet');
    Add('propWidth', 'Objektets bredd');
    Add('propWidth.TfrxFrame', 'Ramens bredd');
    Add('propWindowState', 'Fönstrets startläge');
    Add('propWordBreak', 'Bryt ryska ord');
    Add('propWordWrap', 'Bestämmer om objektet innehåller automatisk radbrytning');
    Add('propZoom.TfrxBarCodeView', 'Zoomar barcode');
    Add('propZoom', 'Startstorlek för förhandsgranskas innehåll');
    Add('propZoomMode', 'Initial zoom för förhandsgranska');
  end;
end;


initialization
  frAddInspectorRes;

end.
