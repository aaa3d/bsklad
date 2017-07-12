
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
    Add('propActive', 'Meghatározza, hogy a DataSet nyitott vagy nem');
    Add('propActive.TfrxHighlight', 'Meghatározza, hogy a kiemelés aktív vagy nem');
    Add('propAliasName', 'A BDE alias neve');
    Add('propAlign', 'Meghatározza, hogy az objektum elhelyezkedése a sávhoz vagy a laphoz relatív');
    Add('propAlignment', 'Az objektum szövegének igazítása');
    Add('propAllowAllUp', 'Meghatározza, hogy a SpeedButton-ok egyidõben lehetnek-e inaktívak a csoportban');
    Add('propAllowEdit', 'Meghatározza, hogy a felhasználó szerkesztheti-e az elõkészített riport lapjait');
    Add('propAllowExpressions', 'Meghatározza, hogy a szöveg objektum tartalmazhat kifejezéseket a szövegben');
    Add('propAllowGrayed', 'Engedélyezi a három állapotú Checkbox kontrolt');
    Add('propAllowHTMLTags', 'Meghatározza, hogy a szöveg objektum tartalmazhat HTML tag-eket a szövegben');
    Add('propAllowSplit', 'Meghatározza, hogy a sáv több lapra kiterjedhet-e');
    Add('propAuthor', 'A riport szerzõje');
    Add('propAutoSize', 'Meghatározza, hogy a kép automatikusan kezelheti-e a méretét');
    Add('propAutoWidth', 'Meghatározza, hogy a szöveg objektum kezelheti-e saját méretét');
    Add('propBackPicture', 'A lap háttere');
    Add('propBarType', 'A vonalkód típusa');
    Add('propBevelInner', 'A belsõ él típusa');
    Add('propBevelOuter', 'A külsõ él típusa');
    Add('propBevelWidth', 'Az él vastagsága');
    Add('propBorder', 'Meghatározza, hogy külsõ határ mutatva legyen-e');
    Add('propBorderStyle', 'Az ablak stílusa');
    Add('propBottomMargin', 'Az alsó margó mérete');
    Add('propBrushStyle', 'Az objektum hátteréhez használt ecset stílusa');
    Add('propButtons', 'Gombok láthatók legyenek-e az elõképen');
    Add('propCacheSize', 'A riportgenerátor által használható memória mérete. Ha több memória szükséges, a lapok a merevlemezen lesznek tárolva');
    Add('propCalcCheckSum', 'Meghatározza, hogy a vonalkód az ellenõrzõszámot maga számolja-e');
    Add('propCancel', 'Meghatározza, hogy a gomb aktiválódjon-e, ha Esc-et nyomnak');
    Add('propCaption', 'A kontrol szövege');
    Add('propCellFields', 'Adatbázismezõk nevei, melyek keresztcellát határoznak meg');
    Add('propCellLevels', 'Cellaszintek száma');
    Add('propCenter', 'Meghatározza, hogy a kép a kontrolon belül középre igazodjon-e');
    Add('propCharset', 'A karakterkészlet');
    Add('propCharSpacing', 'Két karakter közötti pixelek száma');
    Add('propCheckColor', 'A pipa színe');
    Add('propChecked', 'Jelzi, hogy a kontrol kipipált');
    Add('propCheckStyle', 'A pipa stílusa');
    Add('propChild', 'Gyermek sáv ehhez a sávhoz kapcsolva');
    Add('propCollate', 'Rendezés alapbeállítása');
    Add('propColor.TFont', 'A szöveg színe');
    Add('propColor', 'Az objektum színe');
    Add('propColor.TfrxFrame', 'A keret színe');
    Add('propColor.TfrxHighlight', 'Meghatározza az objektum színét, ha a kiemelés aktív');
    Add('propColumnFields', 'Adatbázismezõk nevei, melyek keresztriport oszlopokat határoznak meg');
    Add('propColumnGap', 'A rés a sáv oszlopai között');
    Add('propColumnLevels', 'Az oszlopszintek száma');
    Add('propColumns', 'Oszlopok száma a sávban');
    Add('propColumnWidth', 'A sáv oszlop szélessége');
    Add('propCondition', 'A csoportosítás feltétele. Ha ez az érték változik, új csoport kezdõdik');
    Add('propCondition.TfrxHighlight', 'Kifejezés. Ha ez igaz, kiemelés történik');
    Add('propConnected', 'Jelzi, hogy a kapcsolat az adatbázissal aktív');
    Add('propConvertNulls', 'Meghatározza, hogy null értékek konvertálódnak-e 0, Hamis vagy üres string értékekké');
    Add('propCopies', 'A másolatok alapértelmezett száma');
    Add('propCursor', 'Az objektum kurzora');
    Add('propDatabaseName', 'Az adatbázis neve');
    Add('propDataField', 'Az objektum adatait tartalmazó mezõ meghatározása');
    Add('propDataSet', 'Az objektum kapcsolata egy Dataset-tel amelyik az adatot szolgáltató mezõt tartalmazza');
    Add('propDate', 'A kontrol dátuma');
    Add('propDateFormat', 'Dátumformátum meghatározása');
    Add('propDecimalSeparator', 'Tizedesjel');
    Add('propDefault', 'Meghatározza, hogy a gomb az alapértelmezett gomb');
    Add('propDefHeight', 'Sor alapértelmezett magassága');
    Add('propDescription', 'A riport leírása');
    Add('propDiagonal', 'Jelzi, hogy a vonal átlós');
    Add('propDisplayFormat', 'A megjelenített érték formátuma');
    Add('propDoubleBuffered', 'Meghatározza, hogy az elõkép ablaka kettõs tárolást használ-e. Ez megakadályozza a villogást, de lassú');
    Add('propDoublePass', 'Meghatározza, hogy a riport két menetes legyen-e');
    Add('propDown', 'Meghatározza, hogy a SpeedButton lenyomott vagy nem');
    Add('propDownThenAcross', 'Meghatározza, hogy a nagy méretû kereszttábla hogyan legyen lapokra osztva');
    Add('propDriverName', 'A BDE driver neve');
    Add('propDropShadow', 'Meghatározza, hogy az objektumnak legyen-e árnyéka');
    Add('propDuplex', 'A lap duplex módját határozza meg');
    Add('propEditMask', 'Meghatároz egy maszkot, amelynek megfelelõ szöveg lesz elfogadható a maszkolt edit kontrol számára');
    Add('propEnabled', 'Meghatározza, hogy a kontrol engedélyezett-e');
    Add('propEngineOptions', 'A riport opciói');
    Add('propExpression', 'E kifejezés értéke lesz mutatva az objektumban');
    Add('propExpressionDelimiters', 'Ezek a karakterek választják el a kifejezést a szövegtõl');
    Add('propFieldAliases', 'A DataSet mezõinek álnevei');
    Add('propFilter', 'A DataSet szûrõfeltétele');
    Add('propFiltered', 'Meghatározza, hogy a DataSet a Filter tulajdonság értéke alapján szûrjön-e');
    Add('propFlowTo', 'A szöveg objektum amelyik mutatja az objektumba nem férõ szöveget');
    Add('propFont', 'Az objektum betûtípusa');
    Add('propFooterAfterEach', 'Meghatározza, hogy a lábléc sáv látszon-e minden sor után');
    Add('propFormatStr', 'A formázó szöveg');
    Add('propFrame', 'A objektum keret jellemzõi');
    Add('propGapX', 'A szöveg bal oldali behúzása');
    Add('propGapY', 'A szöveg felsõ behúzása');
    Add('propGlyph', 'A kontrol képe');
    Add('propGroupIndex', 'SpeedButton-ok csoportosítása');
    Add('propHAlign', 'A szöveg vízszintes igazítása');
    Add('propHeight', 'Az objektum magassága');
    Add('propHGuides', 'A lap vízszintes vezetõi');
    Add('propHideZeros', 'Meghatározza, hogy a szöveg objektum elrejti-e a 0 értékeket');
    Add('propHighlight', 'A feltételes kiemelés jellemzõi');
    Add('propIndexName', 'Az index neve');
    Add('propInitString', 'Nyomtató inicializáló karakterek mátrixnyomtatókhoz');
    Add('propItems', 'Objektum elemeinek listája');
    Add('propKeepAspectRatio', 'Képarány megtartása');
    Add('propKeepChild', 'Meghatározza, hogy a sáv gyermekeivel együtt lesz-e nyomtatva');
    Add('propKeepFooter', 'Meghatározza, hogy a sáv a lábléccel együtt lesz-e nyomtatva');
    Add('propKeepHeader', 'Determines whether the band will be printed together with its header');
    Add('propKeepTogether', 'Meghatározza, hogy a sáv alsávjaival együtt lesz-e nyomtatva');
    Add('propKind.TfrxFormat', 'A formázás típusa');
    Add('propKind', 'A gomb fajtája');
    Add('propLargeDesignHeight', 'Meghatározza, hogy a lap magas lesz-e tervezés közben');
    Add('propLayout', 'A gomb képének elrendezése');
    Add('propLeft', 'Az objektum bal koordinátája');
    Add('propLeftMargin', 'A bal margó mérete');
    Add('propLines', 'Az objektum szövege');
    Add('propLineSpacing', 'A szöveg két sora közötti táv pixelben');
    Add('propLoginPrompt', 'Meghatározza, hogy legyen-e bejelentkezési dialógus');
    Add('propMargin', 'Meghatározza a kép és a gomb határai közötti pixelek számát');
    Add('propMaster', 'A master DataSet');
    Add('propMasterFields', 'A master kapcsolt mezõi a master-detail kapcsolat kialakításához');
    Add('propMaximized', 'Meghatározza, hogy az elõkép teljes méretû-e');
    Add('propMaxLength', 'A szöveg maximális hossza');
    Add('propMaxPages', 'Az elõkészített riport lapjainak maximális száma');
    Add('propMaxWidth', 'Oszlop maximális szélessége');
    Add('propMDIChild', 'Meghatározza, hogy az elõkép ablaka MDI gyermek lesz-e');
    Add('propMemo', 'Az objektum szövege');
    Add('propMinWidth', 'Az oszlop legkisebb szélessége');
    Add('propMirrorMargins', 'Margók tükrözése');
    Add('propModal', 'Meghatározza, hogy az elõkép ablak modális lesz-e');
    Add('propModalResult', 'Meghatározza, hogy és milyen visszatérési értékkel zárja be a gomb az ablakot');
    Add('propName.TFont', 'A betûkészlet neve');
    Add('propName.TfrxReportOptions', 'A riport címe');
    Add('propName', 'Az objektum neve');
    Add('propNumGlyphs', 'A Glyph tulajdonságban tárolt képek száma');
    Add('propOpenDataSource', 'Meghatározza, hogy a DataSource automatikusan megnyíljon-e');
    Add('propOrientation', 'A lap tájolása');
    Add('propOutlineText', 'A szöveg ami a körvonal elõkép kontrolban megjelenik');
    Add('propOutlineVisible', 'A körvonal elõkép kontrol láthatósága');
    Add('propOutlineWidth', 'A körvonal elõkép kontrol szélessége');
    Add('propPageNumbers.TfrxPrintOptions', 'A nyomtatandó oldalak száma');
    Add('propPaperHeight', 'Az oldal magassága');
    Add('propPaperWidth', 'Az oldal szélessége');
    Add('propParagraphGap', 'A bekezdés elsõ sorának behúzása');
    Add('propParams.TfrxBDEDatabase', 'A kapcsolat paraméterei');
    Add('propParams', 'A query paraméterei');
    Add('propParentFont', 'Meghatározza, hogy az objektum a szülõ betûtípusát használja-e');
    Add('propPassword', 'A riport jelszava');
    Add('propPasswordChar', 'Meghatározza a kontrolba írt karakterek helyett megjelenõ karaktert, ha nem üres');
    Add('propPicture', 'A kép');
    Add('propPicture.TfrxReportOptions', 'A leíró képe a riportnak');
    Add('propPosition', 'Az ablak kezdeti poziciója');
    Add('propPreviewOptions', 'A riport elõkép opciói');
    Add('propPrintable', 'Az objektum nyomtathatósága. Ha nem nyomtatható, az elõképen jelenik csak meg.');
    Add('propPrintChildIfInvisible', 'Meghatározza, hogy a gyerek sáv láthatatlan szülõ esetén nyomtatásra kerül-e');
    Add('propPrinter', 'A nyomtató neve, amely kiválasztásra kerül a riport megnyitása vagy nyomtatása esetén');
    Add('propPrintIfDetailEmpty', 'Meghatározza, hogy az adatsáv nyomtatva lesz-e, ha az alsávja üres');
    Add('propPrintIfEmpty', 'Meghatározza, hogy a lap nyomtatva lesz-e, ha DataSet-jei üresek');
    Add('propPrintOnFirstPage', 'Meghatározza, hogy a sáv nyomtatva lesz-e az elsõ oldalon');
    Add('propPrintOnLastPage', 'Meghatározza, hogy a sáv nyomtatva lesz-e az utolsó oldalon');
    Add('propPrintOnParent', 'Meghatározza, hogy az alriport a szülõ sávra lesz-e nyomtatva');
    Add('propPrintOnPreviousPage', 'Meghatározza, hogy az oldal az elõzõleg generált oldal üres területére lesz-e generálva');
    Add('propPrintOptions', 'A riport nyomtatási opciói');
    Add('propPrintPages', 'Meghatározza, hogy az összes, a páros vagy a páratlan oldalakat nyomtassa');
    Add('propRangeBegin', 'Meghatározza a DataSet navigáció kezdõpontját');
    Add('propRangeEnd', 'Meghatározza a DataSet navigáció végpontját');
    Add('propRangeEndCount', 'Meghatározza a DataSet rekordszámát, ha RangeEnd értéke reCount');
    Add('propReadOnly', 'Meghatározza, hogy a szöveg objektum csak olvasható-e');
    Add('propRepeatHeaders', 'Meghatározza, hogy az oszlop és sor fejlécek újra lesznek-e nyomtatva az oldalakon');
    Add('propReportOptions', 'A riport opciói');
    Add('propReprintOnNewPage', 'Meghatározza, hogy a sáv új oldalon újra lesz-e nyomtatva');
    Add('propRestrictions', 'Korlátozások');
    Add('propRightMargin', 'A jobb margó mérete');
    Add('propRotation.TfrxBarCodeView', 'A vonalkód tájolása');
    Add('propRotation', 'A szöveg elforgatása');
    Add('propRowCount', 'Virtuális rekordok száma az adatsávon');
    Add('propRowFields', 'A keresztsort meghatározó mezõk nevei');
    Add('propRowLevels', 'Sorszintek száma');
    Add('propRTLReading', 'Meghatározza, hogy a szöveg objektum jobbról balra ír-e');
    Add('propScriptLanguage', 'A riport szkriptnyelvének neve');
    Add('propSessionName', 'A BDE session neve');
    Add('propShadowColor', 'Az árnyék színe');
    Add('propShadowWidth', 'Az árnyék szélessége');
    Add('propShape', 'Az alkzat típusa');
    Add('propShiftMode', 'Az objektum eltolás-viselkedése');
    Add('propShowCaptions', 'Meghatározza, hogy az elõkép gombok szövege látszik-e');
    Add('propShowColumnHeader', 'Meghatározza, hogy a kereszttábla mutatja-e az oszlop fejléceket');
    Add('propShowColumnTotal', 'Meghatározza, hogy a kereszttábla mutatja-e az oszlop grand total-t');
    Add('propShowRowHeader', 'Meghatározza, hogy a kereszttábla mutatja-e a sor fejléceket');
    Add('propShowRowTotal', 'Meghatározza, hogy a kereszttábla mutatja-e a sor grand total-t');
    Add('propShowDialog', 'Meghatározza, hogy a nyomtatási dialógust mutatja-e az elõképben');
    Add('propShowText', 'Meghatározza, hogy a vonalkód objektum mutatja-e az olvasható szövegét');
    Add('propSize', 'A betûkészlet mérete');
    Add('propSorted', 'Meghatározza, hogy az elemek rendezettek-e');
    Add('propSpacing', 'Meghatározza, a pixelek számát a kép és a szöveg között');
    Add('propSQL', 'A SQL utasítás');
    Add('propStartNewPage', 'A sáv nyomtatása elõtt új oldalt kezd');
    Add('propStretch', 'Az objektum méretére nyújtja a képet');
    Add('propStretched', 'Meghatározza, hogy az objektum nyújtható-e');
    Add('propStretchMode', 'Az objektum nyújtási viselkedése');
    Add('propStyle.TFont', 'A betûkészlet stílusa');
    Add('propStyle', 'A kontrol stílusa');
    Add('propStyle.TfrxFrame', 'Az objektum keretének stílusa');
    Add('propSuppressRepeated', 'Ismételt értékek elnyomása');
    Add('propTableName', 'Adattábla neve');
    Add('propTag', 'Az objektum Tag száma');
    Add('propTagStr', 'Az objektum Tag szövege');
    Add('propText', 'Az objektum szövege');
    Add('propTitleBeforeHeader', 'Meghatározza, hogy a lapfejléc elõtt mutassa-e a riport címét');
    Add('propTop', 'Az objektum felsõ koordinátája');
    Add('propTopMargin', 'A felsõ margó mérete');
    Add('propTyp', 'A keret típusa');
    Add('propUnderlines', 'Meghatározza, hogy a szöveg objektum mutatja-e a rácsvonalakat a szöveg sorok után');
    Add('propURL', 'Az objektum URL-je');
    Add('propUserName', 'Az adatobjektum felhasználói neve. Ez jelenik meg az adatfán');
    Add('propVAlign', 'A szöveg függõleges igazítása');
    Add('propVersionBuild', 'Verzió info, build');
    Add('propVersionMajor', 'Verzió info, fõverzió');
    Add('propVersionMinor', 'Verzió info, alverzió');
    Add('propVersionRelease', 'Verzió info, kibocsátás');
    Add('propVGuides', 'Oldal függõleges vezetõi');
    Add('propVisible', 'Objektum láthatósága');
    Add('propWidth', 'Objektum szélessége');
    Add('propWidth.TfrxFrame', 'Keret szélessége');
    Add('propWindowState', 'Ablak kezdeti állapota');
    Add('propWordBreak', 'Orosz szavak törése');
    Add('propWordWrap', 'Meghatározza, hogy a szöveg objektum lágy sortöréseket szúrjon-e be.');
    Add('propZoom.TfrxBarCodeView', 'Vonalkód nagyítása');
    Add('propZoom', 'Elõkép kezdeti nagyítása');
    Add('propZoomMode', 'Elõkép kezdeti nagyítási módja');
  end;
end;


initialization
  frAddInspectorRes;

end.
