
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
    Add('propActive', 'Okre�la czy �r�d�o danych jest otwarte czy nie');
    Add('propActive.TfrxHighlight', 'Okre�la czy pod�wietlanie jest w��czone');
    Add('propAliasName', 'Nazwa aliasu BDE');
    Add('propAlign', 'Okre�la po�o�enie obiektu w stosunku do wst�gi lub strony');
    Add('propAlignment', 'Rodzaj wyr�wnania tekstu w obiekcie');
    Add('propAllowAllUp', 'Okre�la czy wszystkie przyciski w grupie mog� by� jednocze�nie niewybrane');
    Add('propAllowEdit', 'Okre�la czy u�ytkownik mo�e edytowa� strony gotowego raportu');
    Add('propAllowExpressions', 'Okre�la czy obiekt tekstowy mo�e zawiera� makra w tek�cie');
    Add('propAllowGrayed', 'Zezwala na nieokre�lony stan kontrolki Checkbox');
    Add('propAllowHTMLTags', 'Okre�la czy obiekt tekstowy mo�e zawiera� znaczniki HTML w tek�cie');
    Add('propAllowSplit', 'Okre�la czy wst�ga mo�e ��czy� swoj� zawarto�� pomi�dzy stronami');
    Add('propAuthor', 'Autor raportu');
    Add('propAutoSize', 'Okre�la czy obraz powinien ustala� sw�j rozmiar automatycznie');
    Add('propAutoWidth', 'Okre�la czy obiekt tekstowy powinien ustala� swoj� szeroko�� automatycznie');
    Add('propBackPicture', 'Obraz t�a strony');
    Add('propBarType', 'Rodzaj kodu kreskowego');
    Add('propBevelInner', 'Typ �ci�cia kraw�dzi wewn�trznej');
    Add('propBevelOuter', 'Typ �ci�cia kraw�dzi zewn�trznej');
    Add('propBevelWidth', 'Szeroko�� �ci�cia');
    Add('propBorder', 'Okre�la czy pokazywa� zewn�trzn� ramk� czy nie');
    Add('propBorderStyle', 'Rodzaj okna');
    Add('propBottomMargin', 'Rozmiar marginesu dolnego strony');
    Add('propBrushStyle', 'Rodzaj p�dzla u�ytego do t�a obiektu');
    Add('propButtons', 'W��czanie przycisk�w widocznych w oknie podgl�du');
    Add('propCacheSize', 'Maksymalna ilo�� pami�ci u�ywana przez silnik raportu. Je�eli u�ywana pami�� przewy�sza t� warto��, przygotowywane strony s� buforowane w pliku dyskowym');
    Add('propCalcCheckSum', 'Okre�la czy cyfra kontrolna kodu kreskowego powininna by� obliczana automatycznie');
    Add('propCancel', 'Okre�la czy przycisk powinien reagowa� na naci�ni�cie klawisza Esc');
    Add('propCaption', 'Opis kontrolki');
    Add('propCellFields', 'Nazwy p�l bazy danych prezentowane w tabeli przestawnej');
    Add('propCellLevels', 'Ilo�� poziom�w kom�rki');
    Add('propCenter', 'Okre�la czy obraz powinien by� centrowany w wewn�trz kontrolki');
    Add('propCharset', 'Zestaw znak�w');
    Add('propCharSpacing', 'Wielko�� odst�pu pomi�dzy znakami w pikselach');
    Add('propCheckColor', 'Kolor zaznacznika wyboru');
    Add('propChecked', 'Wskazuje czy kontrolka jest wybrana');
    Add('propCheckStyle', 'Rodzaj znacznika wyboru');
    Add('propChild', 'Wst�ga podrz�dna pod��czona z t� wst�g�');
    Add('propCollate', 'Domy�lne ustawienie sortowania');
    Add('propColor.TFont', 'Kolor tekstu');
    Add('propColor', 'Kolor obiektu');
    Add('propColor.TfrxFrame', 'Kolor ramki');
    Add('propColor.TfrxHighlight', 'Okre�la kolor obiektu je�li pod�wietlenie jest aktywne');
    Add('propColumnFields', 'Nazwy p�l bazy danych prezentowane w tabeli przestawnej');
    Add('propColumnGap', 'Odst�p pomi�dzy kolumnami wst�gi');
    Add('propColumnLevels', 'Ilo�� poziom�w kolumny');
    Add('propColumns', 'Ilo�� kolumn we wst�dze');
    Add('propColumnWidth', 'Szeroko�� kolumny we wst�dze');
    Add('propCondition', 'Warunek grupowania. Ci�g�o�� grupy b�dzie przerwana je�li warto�� tego wyra�enia si� zmieni');
    Add('propCondition.TfrxHighlight', 'Tekst wyra�enia. Je�li wyra�enie jest prawd�, to wyr�nienie b�dzie aktywne');
    Add('propConnected', 'Wskazuje czy po��czenie z baz� jest aktywne');
    Add('propConvertNulls', 'Okre�la czy warto�ci puste maj� by� zamieniane na 0, Fa�sz lub pusty ci�g znak�w');
    Add('propCopies', 'Domy�lna ilo�� kopii');
    Add('propCursor', 'Rodzaj kursora nad obiektem');
    Add('propDatabaseName', 'Nazwa bazy danych');
    Add('propDataField', 'Nazwa pola z kt�rego obiekt pobiera dane');
    Add('propDataSet', 'Wskazuje �r�d�o danych powi�zane z obiektem');
    Add('propDate', 'Data');
    Add('propDateFormat', 'Okre�la format daty do wy�wietlenia');
    Add('propDecimalSeparator', 'Rodzaj separatora dziesi�tnego');
    Add('propDefault', 'Okre�la czy przycisk ma by� przyskiem domy�lnym');
    Add('propDefHeight', 'Domy�lna wysoko�� wiersza');
    Add('propDescription', 'Opis raportu');
    Add('propDiagonal', 'Okre�la �e linia jest przek�tn�');
    Add('propDisplayFormat', 'Format wy�wietlania danej');
    Add('propDoubleBuffered', 'Okre�la czy okno podgl�du ma u�ywa� podw�jnego buforowania. Spowalnia proces wy�wietlania obrazu ale poprawia jego jako��');
    Add('propDoublePass', 'Okre�la czy raport przygotowywany jest w dw�ch przebiegach');
    Add('propDown', 'Okre�la czy przycisk jest wci�niety lub nie');
    Add('propDownThenAcross', 'Okre�la w jaki spos�b du�a tabela przestawna b�dzie roz�o�ona na stronach');
    Add('propDriverName', 'Nazwa sterownika BDE');
    Add('propDropShadow', 'Okre�la czy obiekt ma posiada� cie�');
    Add('propDuplex', 'Okre�la tryb duplexu dla strony');
    Add('propEditMask', 'Okre�la mask� przy edycji danych');
    Add('propEnabled', 'Okre�la czy kontrolka jest w��czona');
    Add('propEngineOptions', 'Opcje silnika raportu');
    Add('propExpression', 'Warto�� wyra�enia wy�wietlanego w obiekcie');
    Add('propExpressionDelimiters', 'Znaki, kt�re b�d� u�yte do zamkni�cia wyra�enia zawartego w tek�cie');
    Add('propFieldAliases', 'Zast�pcza nazwa pola danych');
    Add('propFilter', 'Warunki filtrowania dla �r�d�a danych');
    Add('propFiltered', 'Okre�la czy �r�d�o danych powinno filtrowa� wiersze u�ywaj�c wyra�enia zawartego w Filter property');
    Add('propFlowTo', 'Inny obiekt tekstowy kt�ry wy�wietli tekst niemieszcz�cy si� w podstawowym obiekcie');
    Add('propFont', 'Atrybuty czcionki obiektu');
    Add('propFooterAfterEach', 'Okre�la czy wst�ga stopki powinna by� wy�wietlana po ka�dym wierszu danych');
    Add('propFormatStr', 'Formatowanie tekstu');
    Add('propFrame', 'Atrybuty ramki obiektu');
    Add('propGapX', 'Odst�p z lewej strony tekstu');
    Add('propGapY', 'Odst�p tekstu od g�ry');
    Add('propGlyph', 'Obraz symbolizuj�cy kontrolk�');
    Add('propGroupIndex', 'Pozwala przyciskom na prac� grupow�');
    Add('propHAlign', 'Wyr�wnanie tekstu w poziomie');
    Add('propHeight', 'Wysoko�� obiektu');
    Add('propHGuides', 'Poziome prowadnice na stronie');
    Add('propHideZeros', 'Okre�la czy tekst obiektu powinien ukrywa� warto�ci zerowe');
    Add('propHighlight', 'Atrybuty warunkowego wyr�nienia');
    Add('propIndexName', 'Nazwa indeksu');
    Add('propInitString', 'Tekst inicjuj�cy drukark� dla drukarek ig�owych');
    Add('propItems', 'Lista pozycji w obiekcie');
    Add('propKeepAspectRatio', 'Zachowanie oryginalnych proporcji obrazu');
    Add('propKeepChild', 'Okre�la czy wst�ga b�dzie drukowana razem z podrz�dnymi wst�gami');
    Add('propKeepFooter', 'Okre�la czy wst�ga b�dzie drukowana razem z jej stopk�');
    Add('propKeepHeader', 'Okre�la czy wst�ga b�dzie drukowana razem z jej nag��wkiem');
    Add('propKeepTogether', 'Okre�la czy wst�ga b�dzie drukowana razem ze wszystkimi jej podwst�gami');
    Add('propKind.TfrxFormat', 'Rodzaj formatowania');
    Add('propKind', 'Rodzaj przycisku');
    Add('propLargeDesignHeight', 'Okre�la czy strona b�dzie mia�a du�� wysoko�� w trybie projektowania');
    Add('propLayout', 'Rozmieszczenie obrazu na przycisku');
    Add('propLeft', 'Po�o�enie obiektu od lewej');
    Add('propLeftMargin', 'Rozmiar lewego marginesu');
    Add('propLines', 'Tekst obiektu');
    Add('propLineSpacing', 'Ilo�� pikseli pomi�dzy dwoma liniami tekstu');
    Add('propLoginPrompt', 'Okre�la czy ma by� wy�wietlane okno logowania');
    Add('propMargin', 'Okre�la ilo�� pikseli pomi�dzy kraw�dzi� obrazka i kraw�dzi� przycisku');
    Add('propMaster', 'Nadrz�dne �r�d�o danych');
    Add('propMasterFields', 'Pola tworz�ce relacj� pomi�dzy nadrz�dnym a podrz�dnym �r�d�em danych');
    Add('propMaximized', 'Okre�la czy okno podgl�du powinno by� zmaksymalizowane');
    Add('propMaxLength', 'Maksymalna d�ugo�� tekstu');
    Add('propMaxPages', 'Maksymalna ilo�� stron w przygotowywanym raporcie');
    Add('propMaxWidth', 'Maksymalna szeroko�� kolumny');
    Add('propMDIChild', 'Okre�la czy onkno podgl�du ma by� wy�wietlane jako MDI');
    Add('propMemo', 'Tekst obiektu');
    Add('propMinWidth', 'Minimalna szeroko�� kolumny');
    Add('propMirrorMargins', 'Odwr�cenie margines�w dla stron parzystych');
    Add('propModal', 'Okre�la czy okno podgl�du ma by� wy�wietlane jako okno modalne');
    Add('propModalResult', 'Okre�la czy i jak przycisk zamyka w�asn� modaln� form�');
    Add('propName.TFont', 'Nazwa czcionki');
    Add('propName.TfrxReportOptions', 'Nazwa raportu');
    Add('propName', 'Nazwa obiektu');
    Add('propNumGlyphs', 'Okre�la ilo�� obrazk�w zawartych w grafice wyspecyfikowanej w Glyph property');
    Add('propOpenDataSource', 'Okre�la czy �r�d�o danych powinno si� otwiera� automatycznie czy nie');
    Add('propOrientation', 'Orientacja strony');
    Add('propOutlineText', 'Ten tekst b�dzie wy�wietlany w podgl�dzie w kontrolce zak�adek');
    Add('propOutlineVisible', 'Okre�la czy kontrolka zak�adek ma by� widoczna na podgl�dzie');
    Add('propOutlineWidth', 'Szeroko�� kontrolki zak�adek na podgl�dzie');
    Add('propPageNumbers.TfrxPrintOptions', 'Ilo�� stron do drukowania');
    Add('propPaperHeight', 'Wysoko�� strony');
    Add('propPaperWidth', 'Szeroko�� strony');
    Add('propParagraphGap', 'Wci�cie pierwszej linii akapitu');
    Add('propParams.TfrxBDEDatabase', 'Parametry po��czenia');
    Add('propParams', 'Parametry zapytania');
    Add('propParentFont', 'Okre�la czy obiekt ma dziedziczy� w�a�ciwo�ci czcionki');
    Add('propPassword', 'Has�o raportu');
    Add('propPasswordChar', 'Znak wy�wietlany w miejsce aktualnie wprowadzanego');
    Add('propPicture', 'Obraz');
    Add('propPicture.TfrxReportOptions', 'Ikona symbolizuj�ca raport');
    Add('propPosition', 'Pozycja pocz�tkowa okna');
    Add('propPreviewOptions', 'Opcje podgl�du raportu');
    Add('propPrintable', 'Mo�liwo�� wydruku obiektu. Je�li False obiekt widoczny jedynie w podgl�dzie i nie drukowany');
    Add('propPrintChildIfInvisible', 'Okre�la czy podrz�dna wst�ga ma by� drukowana je�li wst�ga nadrz�dna jest niewidoczna');
    Add('propPrinter', 'Nazwa drukarki, kt�ra b�dzie wybrana w momencie otwarcia lub wykonania raportu');
    Add('propPrintIfDetailEmpty', 'Okre�la czy wst�ga danych b�dzie drukowana je�li jej podwst�gi s� puste');
    Add('propPrintIfEmpty', 'Okre�la czy strona b�dzie drukowana je�li wszystkie jej �r�d�a danych s� puste');
    Add('propPrintOnFirstPage', 'Okre�la czy wst�ga ma by� drukowana na pierwszej stronie');
    Add('propPrintOnLastPage', 'Okre�la czy wst�ga ma by� drukowana na ostatniej stronie');
    Add('propPrintOnParent', 'Okre�la czy podraport mo�e drukowa� si� na wst�dze nadrz�dnej');
    Add('propPrintOnPreviousPage', 'Okre�la czy strona mo�e by� generowana na wolnym miejscu poprzednio wygenerowanej strony');
    Add('propPrintOptions', 'Opcje drukowania raportu');
    Add('propPrintPages', 'Okre�la czy drukowa� wszystkie, nieparzyste lub parzyste strony');
    Add('propRangeBegin', 'Okre�la pocz�tkowy wiersz zakresu �r�d�a danych');
    Add('propRangeEnd', 'Okre�la ko�cowy wiersz zakresu �r�d�a danych');
    Add('propRangeEndCount', 'Okre�la ilo�� wierszy �r�d�a je�eli RangeEnd jest ustawiony na ReCount');
    Add('propReadOnly', 'Okre�la czy obiekt tekstowy jest tylko do odczytu');
    Add('propRepeatHeaders', 'Okre�la czy kolmna i wiersz nag��wka b�dzie ponownie drukowanyna nowej stronie');
    Add('propReportOptions', 'Opcje raportu');
    Add('propReprintOnNewPage', 'Okre�la czy wst�ga b�dzie ponownie drukowanyna nowej stronie');
    Add('propRestrictions', 'Zbi�r ogranicze� na�o�onych na kontrolk�');
    Add('propRightMargin', 'Rozmiar prawego marginesu');
    Add('propRotation.TfrxBarCodeView', 'Orientacja kodu kreskowego');
    Add('propRotation', 'Obr�t tekstu');
    Add('propRowCount', 'Ilo�� rekord�w wirtualnych na wst�dze danych');
    Add('propRowFields', 'Nazwy p�l danych prezentowanych w wierszu przestawnym');
    Add('propRowLevels', 'Ilo�� poziom�w wiersza');
    Add('propRTLReading', 'Okre�la czy obiekt tekstowy b�dzie pokazywa� tekst w kierunku z prawa do lewa');
    Add('propScriptLanguage', 'Nazwa j�zyka skryptu u�ytego w raporcie');
    Add('propSessionName', 'Nazwa sesji BDE');
    Add('propShadowColor', 'Kolor cienia');
    Add('propShadowWidth', 'Szeroko�� cienia');
    Add('propShape', 'Rodzaj kszta�tu');
    Add('propShiftMode', 'Tryb przesuwania si� obiektu');
    Add('propShowCaptions', 'Okre�la czy przyciski pogl�du pokazuj� swoje opisy');
    Add('propShowColumnHeader', 'Okre�la czy tabela przestawna pokazuje nag��wki kolumn');
    Add('propShowColumnTotal', 'Okre�la czy tabela przestawna pokazuje podsumowania kolumn');
    Add('propShowRowHeader', 'Okre�la czy tabela przestawna pokazuje nag��wki wierszy');
    Add('propShowRowTotal', 'Okre�la czy tabela przestawna pokazuje podsumowania wierszy');
    Add('propShowDialog', 'Okre�la czy wy�wietlane b�dzie okno drukowania');
    Add('propShowText', 'Okre�la czy obiekt kodu kreskowego b�dzie wy�wietla� r�wnie� kod w postaci tekstu');
    Add('propSize', 'Rozmiar czcionki');
    Add('propSorted', 'Okre�la czy pozycje b�d� sortowane czy nie');
    Add('propSpacing', 'Okre�la ilo�� pikseli pomi�dzy obrazem a tekstem');
    Add('propSQL', 'Wyra�enie SQL');
    Add('propStartNewPage', 'Drukuj wst�g� na nowej stronie');
    Add('propStretch', 'Dopasowuje rozmiary obrazu do rozmiar�w obiektu');
    Add('propStretched', 'Okre�la czy rozmiar obiektu mo�e by� dopasowywany');
    Add('propStretchMode', 'Spos�b dopasowywania obiektu');
    Add('propStyle.TFont', 'Rodzaj czcionki');
    Add('propStyle', 'Rodzaj kontrolki');
    Add('propStyle.TfrxFrame', 'Rodzaj ramki obiektu');
    Add('propSuppressRepeated', 'Nie pokazuj powtarzaj�cych si� warto�ci');
    Add('propTableName', 'Nazwa tabeli danych');
    Add('propTag', 'Numer etykiety obiektu');
    Add('propTagStr', 'Etykieta tekstowa obiektu');
    Add('propText', 'Tekst obiektu');
    Add('propTitleBeforeHeader', 'Okre�la czy pokazywa� tytu� raportu przed nag��wkiem strony');
    Add('propTop', 'G�rna wspo�rz�dna obiektu');
    Add('propTopMargin', 'Rozmiar g�rnego marginesu strony');
    Add('propTyp', 'Rodzaj ramki');
    Add('propUnderlines', 'Okre�la czy obiekt tekstowy b�dzie pokazywa� lini� siatki po ka�dej linii tekstu');
    Add('propURL', 'Adres URL obiektu');
    Add('propUserName', 'Nazwa u�ytkownika obiektu danych. Ta nazwa b�dzie pokazywana w drzewie danych');
    Add('propVAlign', 'Wyr�wnanie pionowe tekstu');
    Add('propVersionBuild', 'Informacja o wersji, kompilacja');
    Add('propVersionMajor', 'Informacja o wersji, numer nadrz�dny');
    Add('propVersionMinor', 'Informacja o wersji, numer podrz�dny');
    Add('propVersionRelease', 'Informacja o wersji, wydanie');
    Add('propVGuides', 'Pionowe prowadnice strony');
    Add('propVisible', 'Okre�la czy obiekt jest widoczny');
    Add('propWidth', 'Szeroko�� obiektu');
    Add('propWidth.TfrxFrame', 'Szeroko�� ramki');
    Add('propWindowState', 'Pocz�tkowy stan okna');
    Add('propWordBreak', '�amanie rosyjskich s��w');
    Add('propWordWrap', 'Okre�la czy obiekt tekstowy wstawia mi�kki znak nowej linii (tekst jest zawijany na prawym marginesie)');
    Add('propZoom.TfrxBarCodeView', 'Powi�ksza kod kreskowy');
    Add('propZoom', 'Pocz�tkowy wsp�czynnik powi�kszenia w oknie podgl�du');
    Add('propZoomMode', 'Pocz�tkowy tryb powi�kszenia w oknie podgl�du');
  end;
end;


initialization
  frAddInspectorRes;

end.
