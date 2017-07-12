
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
    Add('propActive', 'Specificerar om ett dataset �r �ppet eller inte');
    Add('propActive.TfrxHighlight', 'Specificerar om highlight �r aktivt eller inte');
    Add('propAliasName', 'Namnet p� BDE alias');
    Add('propAlign', 'Best�mmer positionen p� objektet relativt band eller sida');
    Add('propAlignment', 'Best�mmer position p� objektets text');
    Add('propAllowAllUp', 'Specificerar om alla speed buttons i en grupp kan vara ovalda p� samma g�ng');
    Add('propAllowEdit', 'Best�mmer om anv�ndaren kan �ndra i de preparerade rapportsidorna');
    Add('propAllowExpressions', 'Best�mmer om text objekten f�r inneh�lla uttryck inuti texten');
    Add('propAllowGrayed', 'Till�ter att checkboxar kan anta gr� status');
    Add('propAllowHTMLTags', 'Best�mmer om ett text objekt kan inneh�lla HTML taggar inuti texten');
    Add('propAllowSplit', 'Best�mmer om ett band kan delas upp �ver flera sidor');
    Add('propAuthor', 'Rapportens Upphovsman');
    Add('propAutoSize', 'Best�mmer om en bild ska handa sin storlek automatiskt');
    Add('propAutoWidth', 'Best�mmer om ett text objekt ska handa sin bredd automatiskt');
    Add('propBackPicture', 'Sidans bakgrundsbild');
    Add('propBarType', 'Vilken typ av barcode');
    Add('propBevelInner', 'Vilken typ av inre kant p� ramen');
    Add('propBevelOuter', 'Vilken typ av yttre kant p� ramen');
    Add('propBevelWidth', 'kantens bredd');
    Add('propBorder', 'Best�mmer om den yttre gr�nsen ska visas eller inte');
    Add('propBorderStyle', 'F�nstrets stil');
    Add('propBottomMargin', 'Storlek p� bottenmarginalen');
    Add('propBrushStyle', 'Stil p� den bruch som anv�nds till objektets bakgrund');
    Add('propButtons', 'Vilka knappar som ska visas i F�rhandsgranska');
    Add('propCacheSize', 'Maximalt tillg�ngligt minne f�r rapport motorn. Om anv�nt minne �verskrider det h�r v�rdet s� chachas sidorna till disk');
    Add('propCalcCheckSum', 'Best�mmer om  barcode ska kalylera checksiffran automatikt eller inte');
    Add('propCancel', 'Best�mmer om knappen ska aktiveras med ESC eller inte');
    Add('propCaption', 'Rubrik p� kontrollen');
    Add('propCellFields', 'Namnen p� de DB f�lt som representerar korsreferensecellerna');
    Add('propCellLevels', 'Antal cellniv�er');
    Add('propCenter', 'Best�mmer om bilden ska centreras inuti kontrollen');
    Add('propCharset', 'Fontens teckenupps�ttning');
    Add('propCharSpacing', 'Antalet pixlar mellan tv� tecken');
    Add('propCheckColor', 'F�rg p� checkmarkeringen');
    Add('propChecked', 'Indikerar om kontrollen �r checkmarkerad eller inte');
    Add('propCheckStyle', 'Checkmarkeringens stil');
    Add('propChild', 'Barnband ihopkopplat med detta band');
    Add('propCollate', 'F�rvald sorteringsordning');
    Add('propColor.TFont', 'F�rg p� texten');
    Add('propColor', 'Objektets f�rg');
    Add('propColor.TfrxFrame', 'Ramens f�rg');
    Add('propColor.TfrxHighlight', 'Best�mmer vilken f�rg det �r p� objektet om highlight �r aktiverat');
    Add('propColumnFields', 'Namnet p� DB f�lten representerar korsreferenskolumnerna');
    Add('propColumnGap', 'Mellanrummet mellan bandkolumner');
    Add('propColumnLevels', 'Antalet kolumnniv�er');
    Add('propColumns', 'Antalet kolumner i bandet');
    Add('propColumnWidth', 'Bredden p� bandkolumnen');
    Add('propCondition', 'Gruppvillkoret, Gruppen kommer att bryta om v�rdet p� det h�r uttrycket �ndras');
    Add('propCondition.TfrxHighlight', 'Uttryckstr�ng. Om v�rdet p� uttrycket �r sant s� �r highlight p�');
    Add('propConnected', 'Indikerar om en koppling till databasen �r aktiv');
    Add('propConvertNulls', 'Best�mmer om null v�rden ska konverteras till 0, falsk eller tom str�ng');
    Add('propCopies', 'F�rvalt antal kopior');
    Add('propCursor', 'Objektets mark�r');
    Add('propDatabaseName', 'Databasens namn');
    Add('propDataField', 'Specificerar f�ltet som objektet f�r data ifr�n');
    Add('propDataSet', 'L�nkar obkjektet till det dataset som inneh�ller f�ltrepresentationen');
    Add('propDate', 'Kontrollens datumv�rde');
    Add('propDateFormat', 'Specificerar datumformat');
    Add('propDecimalSeparator', 'Decimalseparator');
    Add('propDefault', 'Best�mmer om knappen �r f�rvald eller inte');
    Add('propDefHeight', 'F�rvald h�jd p� raden');
    Add('propDescription', 'Rapportbeskrivning');
    Add('propDiagonal', 'Indikerar om linjen �r diagonal');
    Add('propDisplayFormat', 'Format p� visat v�rde');
    Add('propDoubleBuffered', 'Best�mmer om F�rhandsgranska anv�nder dubbel buffer. Om dubbel buffer anv�nds f�rhindras blinkningar, men �r l�ngsammare');
    Add('propDoublePass', 'Best�mmer om rapportmotorn ska utf�r ett andra pass eller inte');
    Add('propDown', 'Best�mmer om speed button har tryckts ned eller inte');
    Add('propDownThenAcross', 'Best�mmer om ett stor korsreferens ska delas upp p� flera sidor eller inte');
    Add('propDriverName', 'Namnet p� BDEns drivrutin');
    Add('propDropShadow', 'Best�mmer om objektet har en skugga eller inte');
    Add('propDuplex', 'Specificerar duplex f�r sidan');
    Add('propEditMask', 'Specificerar den mask som representerar vilken text som �r giltig f�r edit kontrollen');
    Add('propEnabled', 'Specificerar om kontrollen �r p�slagen eller inte');
    Add('propEngineOptions', 'Tillval f�r rapportens motor');
    Add('propExpression', 'V�rdet av det h�r yttrycket kommer att visas i objektet');
    Add('propExpressionDelimiters', 'Tecknen som anv�nds f�r att innesluta uttrycket i texten.');
    Add('propFieldAliases', 'Datasetets f�lt alias');
    Add('propFilter', 'Datasetets filtervillkor');
    Add('propFiltered', 'Best�mmer om datasetet ska filtreras med hj�lp av filtervillkoret eller inte');
    Add('propFlowTo', 'Textobjektet visar den text som inte f�r plats i objektet');
    Add('propFont', 'Objektets fontegenskap');
    Add('propFooterAfterEach', 'Best�mmer om bandets sidfot ska visas efter varje datapost');
    Add('propFormatStr', 'Formateringsstr�ng');
    Add('propFrame', 'Objektets ramegenskap');
    Add('propGapX', 'Textens v�nsterkant');
    Add('propGapY', 'Textens �vre gr�ns');
    Add('propGlyph', 'Kontrollens bild');
    Add('propGroupIndex', 'Till�ter att speed buttons arbetar tillsammans som en grupp');
    Add('propHAlign', 'Den Horisontella uppst�llningen av texten');
    Add('propHeight', 'Objektets h�jd');
    Add('propHGuides', 'De Horisontella hj�lplinjerna f�r sidan');
    Add('propHideZeros', ' Best�mmer om objektet ska visa noll-v�rden eller inte');
    Add('propHighlight', 'Villkoret f�r att visa highlight');
    Add('propIndexName', 'Indexets namn');
    Add('propInitString', 'Initieringsstr�ng f�r mastris-skrivare');
    Add('propItems', 'Listar objektets poster');
    Add('propKeepAspectRatio', 'Beh�ll bildens proportioner');
    Add('propKeepChild', 'Best�mmer om bandet ska skrivas ut tillsammans med dess barn');
    Add('propKeepFooter', 'Best�mmer om bandet ska skrivas ut tillsammans med dess fot');
    Add('propKeepHeader', 'Best�mmer om bandet ska skrivas ut tillsammans med dess huvud');
    Add('propKeepTogether', 'Best�mmer om bandet ska skrivas ut tillsammans med dess underband');
    Add('propKind.TfrxFormat', 'Typ av formatering');
    Add('propKind', 'Typ av knapp');
    Add('propLargeDesignHeight', 'Best�mmer om sidan ska ha stor h�jd i design l�ge');
    Add('propLayout', 'Best�mmer knappens bildplacering');
    Add('propLeft', 'Objektets V�nstra kordinat');
    Add('propLeftMargin', 'Storlek p� v�nstermarginalen');
    Add('propLines', 'Objektets text');
    Add('propLineSpacing', 'Antalet pixlar mellan tv� rader text');
    Add('propLoginPrompt', 'Best�mmer om inloggningsf�nster ska visas');
    Add('propMargin', 'Best�mmer antalet pixlar mellan kanten p� bild och kanten p� knappen');
    Add('propMaster', 'Master dataset');
    Add('propMasterFields', 'De f�lt som anv�nds som l�nk f�r master-detalj kopplingen');
    Add('propMaximized', 'Best�mmer om f�rhandsgranska ska maximeras');
    Add('propMaxLength', 'Maximal textl�ngd');
    Add('propMaxPages', 'Maximalt antal sidor i den preparerade rapporten');
    Add('propMaxWidth', 'Kolumnens maximala bredd');
    Add('propMDIChild', 'Best�mmer om F�rhandsgranska ska vara ett f�nster i f�nstret (MDI)');
    Add('propMemo', 'Objektets text');
    Add('propMinWidth', 'Minsta bredd p� kolumnen');
    Add('propMirrorMargins', 'Spegelv�nd sidmarginaler p� j�mna sidor');
    Add('propModal', 'Best�mmer om F�rhandsgranska ska visas modalt');
    Add('propModalResult', 'Best�mmer n�r och hur en knapp ska st�nga ett modalt f�nster');
    Add('propName.TFont', 'Fonstens namn');
    Add('propName.TfrxReportOptions', 'Rapportens namn');
    Add('propName', 'Objektets namn');
    Add('propNumGlyphs', 'Inneh�ller antalet bilder i den grafik specficerad av Glyph egenskapen');
    Add('propOpenDataSource', 'Best�mmer om ett dataset ska �ppnas automatiskt eller inte');
    Add('propOrientation', 'Sidans orientering');
    Add('propOutlineText', 'Text som ska visas i f�rhandsgranskningens �versikt');
    Add('propOutlineVisible', 'Best�mmer om �versikt ska visas i F�rhandsgranska');
    Add('propOutlineWidth', 'Bredd p� f�rhandsgranskningens �versikt');
    Add('propPageNumbers.TfrxPrintOptions', 'Antal sidor som ska skrivas ut');
    Add('propPaperHeight', 'Sidh�jd');
    Add('propPaperWidth', 'Sidbredd');
    Add('propParagraphGap', 'Best�mer indrag p� den f�rsta raden i stycket');
    Add('propParams.TfrxBDEDatabase', 'Kopllingens parametrar');
    Add('propParams', 'Fr�gans (querys) parametrar');
    Add('propParentFont', 'Best�mmer om objektet ska anv�nda objektets �gares font');
    Add('propPassword', 'Rapportens l�senord');
    Add('propPasswordChar', 'Inneh�ller det tecken som ska anv�ndas f�r att skydda l�senord fr�n att visas p� sk�rmen');
    Add('propPicture', 'Bilden');
    Add('propPicture.TfrxReportOptions', 'Rapportens tillval');
    Add('propPosition', 'Initial position f�r f�nstret');
    Add('propPreviewOptions', 'Tillval till F�rhandsgranska');
    Add('propPrintable', 'Objektets m�jlighet till att bli utskrivet. Objekt som har Printable=False kan f�rhandsgranskas, men inte skrivas ut');
    Add('propPrintChildIfInvisible', 'Best�mmer om ett barnband ska skrivas ut om f�r�ldrabandet �r osynligt');
    Add('propPrinter', 'Namnet p� skrivaren, n�r rapporten �ppnas eller k�rs');
    Add('propPrintIfDetailEmpty', 'Best�mmer om ett databand ska skrivas ut om dess underband �r tomt');
    Add('propPrintIfEmpty', 'Best�mmer om en rapport ska skrivas ut om alla dess dataset �r tomma');
    Add('propPrintOnFirstPage', 'Best�mmer om bandet ska skrivas ut p� f�rsta sidan');
    Add('propPrintOnLastPage', 'Best�mmer om bandet ska skrivas ut p� sista sidan');
    Add('propPrintOnParent', 'Best�mmer om en underrapport kan skriva ut sig sj�lv p� sitt f�r�ldraband');
    Add('propPrintOnPreviousPage', 'Best�mmer om sidan kan skapas i det fria utrymmet p� f�reg�ende sida');
    Add('propPrintOptions', 'Rapportens utskriftstillval');
    Add('propPrintPages', 'Best�mmer om udda, j�mna eller alla sidor ska skrivas ut');
    Add('propRangeBegin', 'Best�mmer startposition f�r navigering i datasetet');
    Add('propRangeEnd', 'Best�mmer slutposition f�r navigering i datasetet');
    Add('propRangeEndCount', 'Best�mmer antalet pster i datasetet om RangeEnd �r lika med reCount');
    Add('propReadOnly', 'Best�mmer om text objekten ska vara skrivskyddade');
    Add('propRepeatHeaders', 'Best�mmer om column och radrubriker ska �terutskrivas p� ny sida');
    Add('propReportOptions', 'Rapportens tillval');
    Add('propReprintOnNewPage', 'Best�mmer om bandet ska �terutskrivas p� ny sida');
    Add('propRestrictions', 'En m�ngd begr�nsningsflaggor');
    Add('propRightMargin', 'H�ger sidmarginal');
    Add('propRotation.TfrxBarCodeView', 'Barcodens orientering');
    Add('propRotation', 'Textvinkel');
    Add('propRowCount', 'Antalet virtuella poster i databandet');
    Add('propRowFields', 'Namnen p� databasf�lten som representerar korsreferensraderna');
    Add('propRowLevels', 'Antalet radniv�er');
    Add('propRTLReading', 'Best�mmer om text objektets ska visa h�ger-till-v�nster');
    Add('propScriptLanguage', 'Namnet p� det scriptspr�k som anv�nds i rapporten');
    Add('propSessionName', 'Namnet p� BDE sessionen');
    Add('propShadowColor', 'F�rg p� skuggan');
    Add('propShadowWidth', 'Skuggans bredd');
    Add('propShape', 'Figurtyp');
    Add('propShiftMode', 'Objektets f�r�ndringsegenskaper');
    Add('propShowCaptions', 'Best�mmer om f�rhandsgranskaknappen ska visa dess rubrik');
    Add('propShowColumnHeader', 'Best�mmer om korsreferensen ska visa kolumnrubriker');
    Add('propShowColumnTotal', 'Best�mmer om korsreferensen ska visa kolumntotaler');
    Add('propShowRowHeader', 'Best�mmer om korsreferensen ska visa radrubriker');
    Add('propShowRowTotal', 'Best�mmer om korsreferensen ska visa radtotaler');
    Add('propShowDialog', 'Best�mmer om utskriftsdialog ska visas i f�rhandsgranska');
    Add('propShowText', 'Best�mmer om barcode objektet ska visa l�sbar text');
    Add('propSize', 'Fontstorlek');
    Add('propSorted', 'Best�mmer om posterna �r sorterade eller inte');
    Add('propSpacing', 'Best�mmer antalet pixlar mellan bild och text');
    Add('propSQL', 'SQL uttryck');
    Add('propStartNewPage', 'B�rjar ny sida innan band skrivs ut');
    Add('propStretch', 'Str�cker bilden s� den passar objektets gr�nsv�rden');
    Add('propStretched', 'Best�mmer om objektet kan str�ckas eller inte');
    Add('propStretchMode', 'Objektets str�ck egenskaper');
    Add('propStyle.TFont', 'Fontens stil');
    Add('propStyle', 'Kontrollens stil');
    Add('propStyle.TfrxFrame', 'Objektets rams stil');
    Add('propSuppressRepeated', 'F�rhindra �terupprepade v�rden');
    Add('propTableName', 'Datatabellens namn');
    Add('propTag', 'Objektets Tag nummer');
    Add('propTagStr', 'Objektets Tag str�ng');
    Add('propText', 'Objektets text');
    Add('propTitleBeforeHeader', 'Best�mmer om rapportens titel ska visas innan sidhuvud');
    Add('propTop', 'Objekets topp kordinat');
    Add('propTopMargin', 'Toppmarginal');
    Add('propTyp', 'Typ av ram');
    Add('propUnderlines', 'Best�mmer om text objeketet ska cellrutor efter varje textrad');
    Add('propURL', 'Objekets URL');
    Add('propUserName', 'Objektets namn. Namnet visas i data�versikten');
    Add('propVAlign', 'Vertikal uppst�llning av text');
    Add('propVersionBuild', 'Versionsinformation, build');
    Add('propVersionMajor', 'Versionsinformation, major version');
    Add('propVersionMinor', 'Versionsinformation, minor version');
    Add('propVersionRelease', 'Versionsinformation, release');
    Add('propVGuides', 'Sidan vertikala hj�lprader');
    Add('propVisible', 'Objektets synlighet');
    Add('propWidth', 'Objektets bredd');
    Add('propWidth.TfrxFrame', 'Ramens bredd');
    Add('propWindowState', 'F�nstrets startl�ge');
    Add('propWordBreak', 'Bryt ryska ord');
    Add('propWordWrap', 'Best�mmer om objektet inneh�ller automatisk radbrytning');
    Add('propZoom.TfrxBarCodeView', 'Zoomar barcode');
    Add('propZoom', 'Startstorlek f�r f�rhandsgranskas inneh�ll');
    Add('propZoomMode', 'Initial zoom f�r f�rhandsgranska');
  end;
end;


initialization
  frAddInspectorRes;

end.
