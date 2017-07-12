
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
    Add('propActive', 'Okreœla czy Ÿród³o danych jest otwarte czy nie');
    Add('propActive.TfrxHighlight', 'Okreœla czy podœwietlanie jest w³¹czone');
    Add('propAliasName', 'Nazwa aliasu BDE');
    Add('propAlign', 'Okreœla po³o¿enie obiektu w stosunku do wstêgi lub strony');
    Add('propAlignment', 'Rodzaj wyrównania tekstu w obiekcie');
    Add('propAllowAllUp', 'Okreœla czy wszystkie przyciski w grupie mog¹ byæ jednoczeœnie niewybrane');
    Add('propAllowEdit', 'Okreœla czy u¿ytkownik mo¿e edytowaæ strony gotowego raportu');
    Add('propAllowExpressions', 'Okreœla czy obiekt tekstowy mo¿e zawieraæ makra w tekœcie');
    Add('propAllowGrayed', 'Zezwala na nieokreœlony stan kontrolki Checkbox');
    Add('propAllowHTMLTags', 'Okreœla czy obiekt tekstowy mo¿e zawieraæ znaczniki HTML w tekœcie');
    Add('propAllowSplit', 'Okreœla czy wstêga mo¿e ³¹czyæ swoj¹ zawartoœæ pomiêdzy stronami');
    Add('propAuthor', 'Autor raportu');
    Add('propAutoSize', 'Okreœla czy obraz powinien ustalaæ swój rozmiar automatycznie');
    Add('propAutoWidth', 'Okreœla czy obiekt tekstowy powinien ustalaæ swoj¹ szerokoœæ automatycznie');
    Add('propBackPicture', 'Obraz t³a strony');
    Add('propBarType', 'Rodzaj kodu kreskowego');
    Add('propBevelInner', 'Typ œciêcia krawêdzi wewnêtrznej');
    Add('propBevelOuter', 'Typ œciêcia krawêdzi zewnêtrznej');
    Add('propBevelWidth', 'Szerokoœæ œciêcia');
    Add('propBorder', 'Okreœla czy pokazywaæ zewnêtrzn¹ ramkê czy nie');
    Add('propBorderStyle', 'Rodzaj okna');
    Add('propBottomMargin', 'Rozmiar marginesu dolnego strony');
    Add('propBrushStyle', 'Rodzaj pêdzla u¿ytego do t³a obiektu');
    Add('propButtons', 'W³¹czanie przycisków widocznych w oknie podgl¹du');
    Add('propCacheSize', 'Maksymalna iloœæ pamiêci u¿ywana przez silnik raportu. Je¿eli u¿ywana pamiêæ przewy¿sza t¹ wartoœæ, przygotowywane strony s¹ buforowane w pliku dyskowym');
    Add('propCalcCheckSum', 'Okreœla czy cyfra kontrolna kodu kreskowego powininna byæ obliczana automatycznie');
    Add('propCancel', 'Okreœla czy przycisk powinien reagowaæ na naciœniêcie klawisza Esc');
    Add('propCaption', 'Opis kontrolki');
    Add('propCellFields', 'Nazwy pól bazy danych prezentowane w tabeli przestawnej');
    Add('propCellLevels', 'Iloœæ poziomów komórki');
    Add('propCenter', 'Okreœla czy obraz powinien byæ centrowany w wewn¹trz kontrolki');
    Add('propCharset', 'Zestaw znaków');
    Add('propCharSpacing', 'Wielkoœæ odstêpu pomiêdzy znakami w pikselach');
    Add('propCheckColor', 'Kolor zaznacznika wyboru');
    Add('propChecked', 'Wskazuje czy kontrolka jest wybrana');
    Add('propCheckStyle', 'Rodzaj znacznika wyboru');
    Add('propChild', 'Wstêga podrzêdna pod³¹czona z t¹ wstêg¹');
    Add('propCollate', 'Domyœlne ustawienie sortowania');
    Add('propColor.TFont', 'Kolor tekstu');
    Add('propColor', 'Kolor obiektu');
    Add('propColor.TfrxFrame', 'Kolor ramki');
    Add('propColor.TfrxHighlight', 'Okreœla kolor obiektu jeœli podœwietlenie jest aktywne');
    Add('propColumnFields', 'Nazwy pól bazy danych prezentowane w tabeli przestawnej');
    Add('propColumnGap', 'Odstêp pomiêdzy kolumnami wstêgi');
    Add('propColumnLevels', 'Iloœæ poziomów kolumny');
    Add('propColumns', 'Iloœæ kolumn we wstêdze');
    Add('propColumnWidth', 'Szerokoœæ kolumny we wstêdze');
    Add('propCondition', 'Warunek grupowania. Ci¹g³oœæ grupy bêdzie przerwana jeœli wartoœæ tego wyra¿enia siê zmieni');
    Add('propCondition.TfrxHighlight', 'Tekst wyra¿enia. Jeœli wyra¿enie jest prawd¹, to wyró¿nienie bêdzie aktywne');
    Add('propConnected', 'Wskazuje czy po³¹czenie z baz¹ jest aktywne');
    Add('propConvertNulls', 'Okreœla czy wartoœci puste maj¹ byæ zamieniane na 0, Fa³sz lub pusty ci¹g znaków');
    Add('propCopies', 'Domyœlna iloœæ kopii');
    Add('propCursor', 'Rodzaj kursora nad obiektem');
    Add('propDatabaseName', 'Nazwa bazy danych');
    Add('propDataField', 'Nazwa pola z którego obiekt pobiera dane');
    Add('propDataSet', 'Wskazuje Ÿród³o danych powi¹zane z obiektem');
    Add('propDate', 'Data');
    Add('propDateFormat', 'Okreœla format daty do wyœwietlenia');
    Add('propDecimalSeparator', 'Rodzaj separatora dziesiêtnego');
    Add('propDefault', 'Okreœla czy przycisk ma byæ przyskiem domyœlnym');
    Add('propDefHeight', 'Domyœlna wysokoœæ wiersza');
    Add('propDescription', 'Opis raportu');
    Add('propDiagonal', 'Okreœla ¿e linia jest przek¹tn¹');
    Add('propDisplayFormat', 'Format wyœwietlania danej');
    Add('propDoubleBuffered', 'Okreœla czy okno podgl¹du ma u¿ywaæ podwójnego buforowania. Spowalnia proces wyœwietlania obrazu ale poprawia jego jakoœæ');
    Add('propDoublePass', 'Okreœla czy raport przygotowywany jest w dwóch przebiegach');
    Add('propDown', 'Okreœla czy przycisk jest wciœniety lub nie');
    Add('propDownThenAcross', 'Okreœla w jaki sposób du¿a tabela przestawna bêdzie roz³o¿ona na stronach');
    Add('propDriverName', 'Nazwa sterownika BDE');
    Add('propDropShadow', 'Okreœla czy obiekt ma posiadaæ cieñ');
    Add('propDuplex', 'Okreœla tryb duplexu dla strony');
    Add('propEditMask', 'Okreœla maskê przy edycji danych');
    Add('propEnabled', 'Okreœla czy kontrolka jest w³¹czona');
    Add('propEngineOptions', 'Opcje silnika raportu');
    Add('propExpression', 'Wartoœæ wyra¿enia wyœwietlanego w obiekcie');
    Add('propExpressionDelimiters', 'Znaki, które bêd¹ u¿yte do zamkniêcia wyra¿enia zawartego w tekœcie');
    Add('propFieldAliases', 'Zastêpcza nazwa pola danych');
    Add('propFilter', 'Warunki filtrowania dla Ÿród³a danych');
    Add('propFiltered', 'Okreœla czy Ÿród³o danych powinno filtrowaæ wiersze u¿ywaj¹c wyra¿enia zawartego w Filter property');
    Add('propFlowTo', 'Inny obiekt tekstowy który wyœwietli tekst niemieszcz¹cy siê w podstawowym obiekcie');
    Add('propFont', 'Atrybuty czcionki obiektu');
    Add('propFooterAfterEach', 'Okreœla czy wstêga stopki powinna byæ wyœwietlana po ka¿dym wierszu danych');
    Add('propFormatStr', 'Formatowanie tekstu');
    Add('propFrame', 'Atrybuty ramki obiektu');
    Add('propGapX', 'Odstêp z lewej strony tekstu');
    Add('propGapY', 'Odstêp tekstu od góry');
    Add('propGlyph', 'Obraz symbolizuj¹cy kontrolkê');
    Add('propGroupIndex', 'Pozwala przyciskom na pracê grupow¹');
    Add('propHAlign', 'Wyrównanie tekstu w poziomie');
    Add('propHeight', 'Wysokoœæ obiektu');
    Add('propHGuides', 'Poziome prowadnice na stronie');
    Add('propHideZeros', 'Okreœla czy tekst obiektu powinien ukrywaæ wartoœci zerowe');
    Add('propHighlight', 'Atrybuty warunkowego wyró¿nienia');
    Add('propIndexName', 'Nazwa indeksu');
    Add('propInitString', 'Tekst inicjuj¹cy drukarkê dla drukarek ig³owych');
    Add('propItems', 'Lista pozycji w obiekcie');
    Add('propKeepAspectRatio', 'Zachowanie oryginalnych proporcji obrazu');
    Add('propKeepChild', 'Okreœla czy wstêga bêdzie drukowana razem z podrzêdnymi wstêgami');
    Add('propKeepFooter', 'Okreœla czy wstêga bêdzie drukowana razem z jej stopk¹');
    Add('propKeepHeader', 'Okreœla czy wstêga bêdzie drukowana razem z jej nag³ówkiem');
    Add('propKeepTogether', 'Okreœla czy wstêga bêdzie drukowana razem ze wszystkimi jej podwstêgami');
    Add('propKind.TfrxFormat', 'Rodzaj formatowania');
    Add('propKind', 'Rodzaj przycisku');
    Add('propLargeDesignHeight', 'Okreœla czy strona bêdzie mia³a du¿¹ wysokoœæ w trybie projektowania');
    Add('propLayout', 'Rozmieszczenie obrazu na przycisku');
    Add('propLeft', 'Po³o¿enie obiektu od lewej');
    Add('propLeftMargin', 'Rozmiar lewego marginesu');
    Add('propLines', 'Tekst obiektu');
    Add('propLineSpacing', 'Iloœæ pikseli pomiêdzy dwoma liniami tekstu');
    Add('propLoginPrompt', 'Okreœla czy ma byæ wyœwietlane okno logowania');
    Add('propMargin', 'Okreœla iloœÆ pikseli pomiêdzy krawêdzi¹ obrazka i krawêdzi¹ przycisku');
    Add('propMaster', 'Nadrzêdne Ÿród³o danych');
    Add('propMasterFields', 'Pola tworz¹ce relacjê pomiêdzy nadrzêdnym a podrzêdnym Ÿród³em danych');
    Add('propMaximized', 'Okreœla czy okno podgl¹du powinno byæ zmaksymalizowane');
    Add('propMaxLength', 'Maksymalna d³ugoœæ tekstu');
    Add('propMaxPages', 'Maksymalna iloœæ stron w przygotowywanym raporcie');
    Add('propMaxWidth', 'Maksymalna szerokoœæ kolumny');
    Add('propMDIChild', 'Okreœla czy onkno podgl¹du ma byæ wyœwietlane jako MDI');
    Add('propMemo', 'Tekst obiektu');
    Add('propMinWidth', 'Minimalna szerokoœæ kolumny');
    Add('propMirrorMargins', 'Odwrócenie marginesów dla stron parzystych');
    Add('propModal', 'Okreœla czy okno podgl¹du ma byæ wyœwietlane jako okno modalne');
    Add('propModalResult', 'Okreœla czy i jak przycisk zamyka w³asn¹ modaln¹ formê');
    Add('propName.TFont', 'Nazwa czcionki');
    Add('propName.TfrxReportOptions', 'Nazwa raportu');
    Add('propName', 'Nazwa obiektu');
    Add('propNumGlyphs', 'Okreœla iloœæ obrazków zawartych w grafice wyspecyfikowanej w Glyph property');
    Add('propOpenDataSource', 'Okreœla czy Ÿród³o danych powinno siê otwieraæ automatycznie czy nie');
    Add('propOrientation', 'Orientacja strony');
    Add('propOutlineText', 'Ten tekst bêdzie wyœwietlany w podgl¹dzie w kontrolce zak³adek');
    Add('propOutlineVisible', 'Okreœla czy kontrolka zak³adek ma byæ widoczna na podgl¹dzie');
    Add('propOutlineWidth', 'Szerokoœæ kontrolki zak³adek na podgl¹dzie');
    Add('propPageNumbers.TfrxPrintOptions', 'Iloœæ stron do drukowania');
    Add('propPaperHeight', 'Wysokoœæ strony');
    Add('propPaperWidth', 'Szerokoœæ strony');
    Add('propParagraphGap', 'Wciêcie pierwszej linii akapitu');
    Add('propParams.TfrxBDEDatabase', 'Parametry po³¹czenia');
    Add('propParams', 'Parametry zapytania');
    Add('propParentFont', 'Okreœla czy obiekt ma dziedziczyæ w³aœciwoœci czcionki');
    Add('propPassword', 'Has³o raportu');
    Add('propPasswordChar', 'Znak wyœwietlany w miejsce aktualnie wprowadzanego');
    Add('propPicture', 'Obraz');
    Add('propPicture.TfrxReportOptions', 'Ikona symbolizuj¹ca raport');
    Add('propPosition', 'Pozycja pocz¹tkowa okna');
    Add('propPreviewOptions', 'Opcje podgl¹du raportu');
    Add('propPrintable', 'Mo¿liwoœæ wydruku obiektu. Jeœli False obiekt widoczny jedynie w podgl¹dzie i nie drukowany');
    Add('propPrintChildIfInvisible', 'Okreœla czy podrzêdna wstêga ma byæ drukowana jeœli wstêga nadrzêdna jest niewidoczna');
    Add('propPrinter', 'Nazwa drukarki, która bêdzie wybrana w momencie otwarcia lub wykonania raportu');
    Add('propPrintIfDetailEmpty', 'Okreœla czy wstêga danych bêdzie drukowana jeœli jej podwstêgi s¹ puste');
    Add('propPrintIfEmpty', 'Okreœla czy strona bêdzie drukowana jeœli wszystkie jej Ÿród³a danych s¹ puste');
    Add('propPrintOnFirstPage', 'Okreœla czy wstêga ma byæ drukowana na pierwszej stronie');
    Add('propPrintOnLastPage', 'Okreœla czy wstêga ma byæ drukowana na ostatniej stronie');
    Add('propPrintOnParent', 'Okreœla czy podraport mo¿e drukowaæ siê na wstêdze nadrzêdnej');
    Add('propPrintOnPreviousPage', 'Okreœla czy strona mo¿e byæ generowana na wolnym miejscu poprzednio wygenerowanej strony');
    Add('propPrintOptions', 'Opcje drukowania raportu');
    Add('propPrintPages', 'Okreœla czy drukowaæ wszystkie, nieparzyste lub parzyste strony');
    Add('propRangeBegin', 'Okreœla pocz¹tkowy wiersz zakresu Ÿród³a danych');
    Add('propRangeEnd', 'Okreœla koñcowy wiersz zakresu Ÿród³a danych');
    Add('propRangeEndCount', 'Okreœla iloœæ wierszy Ÿród³a je¿eli RangeEnd jest ustawiony na ReCount');
    Add('propReadOnly', 'Okreœla czy obiekt tekstowy jest tylko do odczytu');
    Add('propRepeatHeaders', 'Okreœla czy kolmna i wiersz nag³ówka bêdzie ponownie drukowanyna nowej stronie');
    Add('propReportOptions', 'Opcje raportu');
    Add('propReprintOnNewPage', 'Okreœla czy wstêga bêdzie ponownie drukowanyna nowej stronie');
    Add('propRestrictions', 'Zbiór ograniczeñ na³o¿onych na kontrolkê');
    Add('propRightMargin', 'Rozmiar prawego marginesu');
    Add('propRotation.TfrxBarCodeView', 'Orientacja kodu kreskowego');
    Add('propRotation', 'Obrót tekstu');
    Add('propRowCount', 'Iloœæ rekordów wirtualnych na wstêdze danych');
    Add('propRowFields', 'Nazwy pól danych prezentowanych w wierszu przestawnym');
    Add('propRowLevels', 'Iloœæ poziomów wiersza');
    Add('propRTLReading', 'Okreœla czy obiekt tekstowy bêdzie pokazywa³ tekst w kierunku z prawa do lewa');
    Add('propScriptLanguage', 'Nazwa jêzyka skryptu u¿ytego w raporcie');
    Add('propSessionName', 'Nazwa sesji BDE');
    Add('propShadowColor', 'Kolor cienia');
    Add('propShadowWidth', 'Szerokoœæ cienia');
    Add('propShape', 'Rodzaj kszta³tu');
    Add('propShiftMode', 'Tryb przesuwania siê obiektu');
    Add('propShowCaptions', 'Okreœla czy przyciski pogl¹du pokazuj¹ swoje opisy');
    Add('propShowColumnHeader', 'Okreœla czy tabela przestawna pokazuje nag³ówki kolumn');
    Add('propShowColumnTotal', 'Okreœla czy tabela przestawna pokazuje podsumowania kolumn');
    Add('propShowRowHeader', 'Okreœla czy tabela przestawna pokazuje nag³ówki wierszy');
    Add('propShowRowTotal', 'Okreœla czy tabela przestawna pokazuje podsumowania wierszy');
    Add('propShowDialog', 'Okreœla czy wyœwietlane bêdzie okno drukowania');
    Add('propShowText', 'Okreœla czy obiekt kodu kreskowego bêdzie wyœwietla³ równie¿ kod w postaci tekstu');
    Add('propSize', 'Rozmiar czcionki');
    Add('propSorted', 'Okreœla czy pozycje bêd¹ sortowane czy nie');
    Add('propSpacing', 'Okreœla iloœæ pikseli pomiêdzy obrazem a tekstem');
    Add('propSQL', 'Wyra¿enie SQL');
    Add('propStartNewPage', 'Drukuj wstêgê na nowej stronie');
    Add('propStretch', 'Dopasowuje rozmiary obrazu do rozmiarów obiektu');
    Add('propStretched', 'Okreœla czy rozmiar obiektu mo¿e byæ dopasowywany');
    Add('propStretchMode', 'Sposób dopasowywania obiektu');
    Add('propStyle.TFont', 'Rodzaj czcionki');
    Add('propStyle', 'Rodzaj kontrolki');
    Add('propStyle.TfrxFrame', 'Rodzaj ramki obiektu');
    Add('propSuppressRepeated', 'Nie pokazuj powtarzaj¹cych siê wartoœci');
    Add('propTableName', 'Nazwa tabeli danych');
    Add('propTag', 'Numer etykiety obiektu');
    Add('propTagStr', 'Etykieta tekstowa obiektu');
    Add('propText', 'Tekst obiektu');
    Add('propTitleBeforeHeader', 'Okreœla czy pokazywaæ tytu³ raportu przed nag³ówkiem strony');
    Add('propTop', 'Górna wspo³rzêdna obiektu');
    Add('propTopMargin', 'Rozmiar górnego marginesu strony');
    Add('propTyp', 'Rodzaj ramki');
    Add('propUnderlines', 'Okreœla czy obiekt tekstowy bêdzie pokazywa³ liniê siatki po ka¿dej linii tekstu');
    Add('propURL', 'Adres URL obiektu');
    Add('propUserName', 'Nazwa u¿ytkownika obiektu danych. Ta nazwa bêdzie pokazywana w drzewie danych');
    Add('propVAlign', 'Wyrównanie pionowe tekstu');
    Add('propVersionBuild', 'Informacja o wersji, kompilacja');
    Add('propVersionMajor', 'Informacja o wersji, numer nadrzêdny');
    Add('propVersionMinor', 'Informacja o wersji, numer podrzêdny');
    Add('propVersionRelease', 'Informacja o wersji, wydanie');
    Add('propVGuides', 'Pionowe prowadnice strony');
    Add('propVisible', 'Okreœla czy obiekt jest widoczny');
    Add('propWidth', 'Szerokoœæ obiektu');
    Add('propWidth.TfrxFrame', 'Szerokoœæ ramki');
    Add('propWindowState', 'Pocz¹tkowy stan okna');
    Add('propWordBreak', '£amanie rosyjskich s³ów');
    Add('propWordWrap', 'Okreœla czy obiekt tekstowy wstawia miêkki znak nowej linii (tekst jest zawijany na prawym marginesie)');
    Add('propZoom.TfrxBarCodeView', 'Powiêksza kod kreskowy');
    Add('propZoom', 'Pocz¹tkowy wspó³czynnik powiêkszenia w oknie podgl¹du');
    Add('propZoomMode', 'Pocz¹tkowy tryb powiêkszenia w oknie podgl¹du');
  end;
end;


initialization
  frAddInspectorRes;

end.
