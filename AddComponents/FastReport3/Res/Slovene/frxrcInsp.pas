
{******************************************}
{                                          }
{             FastReport v3.0              }
{         Language resource file           }
{                                          }
{         Copyright (c) 1998-2005          }
{         by Alexander Tzyganenko,         }
{            Fast Reports Inc.             }
{                                          }
{         Slovene translation by:          }
{         Primoz Planinc, Planles s.p.     }
{         mail: info@planles.net           }
{         made in October, 2004            }
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
    Add('propActive', 'Navaja ali je dataset odprt ali ne');
    Add('propActive.TfrxHighlight', 'Navaja ali je povdarek aktiven ali ne');
    Add('propAliasName', 'Ime BDE aliasa');
    Add('propAlign', 'Doloèa poravnavo predmeta relativno na trak ali stran');
    Add('propAlignment', 'Poravnava teksta v predmetu');
    Add('propAllowAllUp', 'Navaja ali so lahko vsi Speed gumbi v skupini neizbrani v istem trenutku');
    Add('propAllowEdit', 'Doloèa ali uporabnik lahko ureja pripravljeno poroèilo');
    Add('propAllowExpressions', 'Doloèa ali predmet lahko vsebuje izraz v tekstu');
    Add('propAllowGrayed', 'Dovola nedoloèeno stanje CheckBox-a');
    Add('propAllowHTMLTags', 'Doloèa ali lahko tekst vsebuje HTML oznake');
    Add('propAllowSplit', 'Doloèa ali lahko trak razdeli svojo vsebino po veè straneh');
    Add('propAuthor', 'Avtor poroèila');
    Add('propAutoSize', 'Doloèa ali se velikost slike samodejno prilagaja');
    Add('propAutoWidth', 'Doloèa ali se širina predmeta Tekst samodejno prilagaja');
    Add('propBackPicture', 'Slika ozadja strani');
    Add('propBarType', 'Tip èrtne kode');
    Add('propBevelInner', 'Tip notranjega bevel-a');
    Add('propBevelOuter', 'Tip zunanjega bevel-a');
    Add('propBevelWidth', 'Širina bevel-a');
    Add('propBorder', 'Doloèa ali naj bo prikazana zunanja meja');
    Add('propBorderStyle', 'Stil okna');
    Add('propBottomMargin', 'Velikost spodnjega roba strani');
    Add('propBrushStyle', 'BrushStyle uporabljen za ozadje');
    Add('propButtons', 'Nastavitev vidnih gumbov predoglednem oknu');
    Add('propCacheSize', 'Najveèja kolièina spomina, ki ga uporablja program za izdelavo poroèil. Èe je poraba veèja, bo uporabljen prostor na disku');
    Add('propCalcCheckSum', 'Doloèa ali naj bo kontrolni znak èrtne kode samodejno izraèunan');
    Add('propCancel', 'Doloèa ali naj bo gumb aktiviran pri pritisnjeni tipki Esc');
    Add('propCaption', 'Napis kontrole');
    Add('propCellFields', 'Imena ZP polj, ki predstavljajo celico v cross poroèilu');
    Add('propCellLevels', 'Število nivojev celic');
    Add('propCenter', 'Doloèa ali naj bo slika usredinjena znotraj kontrole');
    Add('propCharset', 'Nabor znakov pisave');
    Add('propCharSpacing', 'Kolièina toèk med dvema znakoma');
    Add('propCheckColor', 'Barva oznake');
    Add('propChecked', 'Navaja ali je kontrola oznaèena');
    Add('propCheckStyle', 'Stil znaka oznake');
    Add('propChild', 'Child trak povezan na ta trak');
    Add('propCollate', 'Privzeta nastavitev abecednega urejanja');
    Add('propColor.TFont', 'Barva teksta');
    Add('propColor', 'Barva predmeta');
    Add('propColor.TfrxFrame', 'Barva okvira');
    Add('propColor.TfrxHighlight', 'Doloèa barvo predmeta, èe je povdarek aktiven');
    Add('propColumnFields', 'Imena ZP polj, ki predstavljajo stolpce v cross poroèilu');
    Add('propColumnGap', 'Razmik med stolpci v traku');
    Add('propColumnLevels', 'Število nivojev stolpcev');
    Add('propColumns', 'Število stolpcev v traku');
    Add('propColumnWidth', 'Širina stolpca v traku');
    Add('propCondition', 'Pogoj grupiranja. Ustvarjena bo nova grupa, èe se vrednost spremeni');
    Add('propCondition.TfrxHighlight', 'Niz izraza. Èe je izraz True, bo povdarek aktiven');
    Add('propConnected', 'Navaja ali je povezava do zbirke podatkov aktivna');
    Add('propConvertNulls', 'Doloèa ali naj se NULL vrednosti prevedejo v 0');
    Add('propCopies', 'Privzeto število kopij');
    Add('propCursor', 'Kurzor predmeta');
    Add('propDatabaseName', 'Ime zbirke podatkov');
    Add('propDataField', 'Navaja polje, iz katerega predmet dobiva podatke');
    Add('propDataSet', 'Predmet poveže do dataset-a, ki vsebuje polje za prikaz');
    Add('propDate', 'Vrednost Datum');
    Add('propDateFormat', 'Doloèa obliko prikazanega datuma');
    Add('propDecimalSeparator', 'Decimalno loèilo');
    Add('propDefault', 'Doloèa ali je gumb privzeti gumb');
    Add('propDefHeight', 'Privzeta višina vrstice');
    Add('propDescription', 'Opis poroèila');
    Add('propDiagonal', 'Navaja, ali je èrta diagonalna');
    Add('propDisplayFormat', 'Oblika prikaza vrednosti');
    Add('propDoubleBuffered', 'Doloèa ali predogledno okno uporablja dvojni medpomnilnik. Omogoèena lastnost prepreèuje žmiganje, ampak je poèasnejše');
    Add('propDoublePass', 'Doloèa ali naj se poroèilo izvede v dveh prehodih');
    Add('propDown', 'Doloèa ali je speed gumb pritisnjen ali ne');
    Add('propDownThenAcross', 'Doloèa kako bo velika tabela razdeljena preko veè strani');
    Add('propDriverName', 'Ime BDE gonilnika');
    Add('propDropShadow', 'Doloèa ali ima predmet senco');
    Add('propDuplex', 'Doloèa dvostranski naèin strani');
    Add('propEditMask', 'Doloèa masko, ki doloèa veljaven vnos teksta');
    Add('propEnabled', 'Doloèa, ali je kontrola omogoèena');
    Add('propEngineOptions', 'Možnosti programa za izdelavo poroèil');
    Add('propExpression', 'Vrednost tega izraza bo prikazana v predmetu');
    Add('propExpressionDelimiters', 'Znaki, ki bodo uporabljeni za doloèitev izraza v tekstu');
    Add('propFieldAliases', 'Aliasi polj v Dataset-u');
    Add('propFilter', 'Pogoji filtriranja v dataset-u');
    Add('propFiltered', 'Doloèa ali naj bo dataset filtriran z uporabo lastnosti Filter');
    Add('propFlowTo', 'Predmer Text, ki bo prikazal tekst, èe se ta ne prilega temu predmetu');
    Add('propFont', 'Lastnosti pisave predmeta');
    Add('propFooterAfterEach', 'Doloèa ali naj bo Noga natisnjena za vsako podatkovno vrstico');
    Add('propFormatStr', 'Niz oblikovanja');
    Add('propFrame', 'Lastnosti okvira predmeta');
    Add('propGapX', 'Levi zamik teksta');
    Add('propGapY', 'Zgornji zamik teksta');
    Add('propGlyph', 'Slika kontrole');
    Add('propGroupIndex', 'Dovoljuje speed gumbom delovanje v skupini');
    Add('propHAlign', 'Vodoravna poravnava teksta');
    Add('propHeight', 'Višina teksta');
    Add('propHGuides', 'Vodoravna vodila strani');
    Add('propHideZeros', 'Doloèa ali bo predmet Tekst skril nièelne vrednosti');
    Add('propHighlight', 'Lastnosti pogojnih povdarkov');
    Add('propIndexName', 'Ime indeksa');
    Add('propInitString', 'Inicializacijski niz za matrièni tiskalnik');
    Add('propItems', 'Seznam elementov predmeta');
    Add('propKeepAspectRatio', 'Ohrani originalno razmerje med širino in višino slike');
    Add('propKeepChild', 'Doloèa ali bo trak natisnjen skupaj z njegovim Child-om');
    Add('propKeepFooter', 'Doloèa ali bo trak natisnjen skupaj z njegovo Nogo');
    Add('propKeepHeader', 'Doloèa ali bo trak natisnjen skupaj z njegovo Glavo');
    Add('propKeepTogether', 'Doloèa ali bo trak natisnjen skupaj z vsemi njegovimi podtrakovi');
    Add('propKind.TfrxFormat', 'Vrsta oblikovanja');
    Add('propKind', 'Vrsta gumba');
    Add('propLargeDesignHeight', 'Doloèa ali bo imela stran veliko višino v oblikovalnem naèinu');
    Add('propLayout', 'Položaj slike na gumbu');
    Add('propLeft', 'Leva koordinata predmeta');
    Add('propLeftMargin', 'Velikost levega roba strani');
    Add('propLines', 'Tekst predmeta');
    Add('propLineSpacing', 'Kolièina toèk med dvema vrsticama teksta');
    Add('propLoginPrompt', 'Doloèa ali naj se prikaže pogovorno okno za prijavo');
    Add('propMargin', 'Doloèa število toèk med robovoma slike in gumba');
    Add('propMaster', 'Master dataset');
    Add('propMasterFields', 'Polja povezave v Master-detail odnosu');
    Add('propMaximized', 'Doloèa ali bo predogledno okno maksimirano');
    Add('propMaxLength', 'Najveèja dolžina teksta');
    Add('propMaxPages', 'Najveèje število strani pripravljenega poroèila');
    Add('propMaxWidth', 'Najveèja širina stolpca');
    Add('propMDIChild', 'Doloèa ali naj bo predogledno okno MDI child');
    Add('propMemo', 'Tekst predmeta');
    Add('propMinWidth', 'Najmanjša širina stolpca');
    Add('propMirrorMargins', 'Zrcali robove strani na sodih straneh');
    Add('propModal', 'Doloèa ali bo predogledno okno prikazano modalno');
    Add('propModalResult', 'Doloèa ali in kako se gumb zapira v modalnem pogovornem oknu');
    Add('propName.TFont', 'Ime vrste pisave');
    Add('propName.TfrxReportOptions', 'Ime poroèila');
    Add('propName', 'Ime predmeta');
    Add('propNumGlyphs', 'Doloèa število slik ki se nahajajo v lastnosti Glyph');
    Add('propOpenDataSource', 'Doloèa ali naj se datasource odpre samodejno ali ne');
    Add('propOrientation', 'Usmerjenost strani');
    Add('propOutlineText', 'Tekst, ki bo prikazan v predmetu obrisa v predogledu');
    Add('propOutlineVisible', 'Vidnost obrisa v predogledu');
    Add('propOutlineWidth', 'Širina obrisa v predogledu');
    Add('propPageNumbers.TfrxPrintOptions', 'Število strani, ki naj se natisne');
    Add('propPaperHeight', 'Višina strani');
    Add('propPaperWidth', 'Širina strani');
    Add('propParagraphGap', 'Zamik prve vrstice odstavka');
    Add('propParams.TfrxBDEDatabase', 'Parametri povezave');
    Add('propParams', 'Parametri query-ja');
    Add('propParentFont', 'Doloèa ali naj predmet uporablja pisavo parent-a');
    Add('propPassword', 'Geslo poroèila');
    Add('propPasswordChar', 'Doloèa znak, èe kakšen, ki se prikaže namesto pritisnjenega znaka');
    Add('propPicture', 'Slika');
    Add('propPicture.TfrxReportOptions', 'Opis slike poroèila');
    Add('propPosition', 'Zaèetni položaj okna');
    Add('propPreviewOptions', 'Možnosti predogleda poroèila');
    Add('propPrintable', 'Natisljivost predmeta. Predmet z Printable=False bo v predogledu, ampak ne bo natisnjen');
    Add('propPrintChildIfInvisible', 'Doloèa ali bo Child natisnjen v primeru, èe je njegov parent neviden');
    Add('propPrinter', 'Ime tiskalnika, ki bo samodejno izbran prikazu poroèila');
    Add('propPrintIfDetailEmpty', 'Doloèa ali bo podatkovni trak natisnjen v primeru, èe je njegov detail prazen');
    Add('propPrintIfEmpty', 'Doloèa ali bo stran natisnjena v primeru, èe so vsi podatki prazni');
    Add('propPrintOnFirstPage', 'Doloèa ali bo trak natisnjen na prvo stran poroèila');
    Add('propPrintOnLastPage', 'Doloèa ali bo trak natisnjen na zadnjo stran poroèila');
    Add('propPrintOnParent', 'Doloèa ali bo subreport natisnjen na parent trak');
    Add('propPrintOnPreviousPage', 'Doloèa ali je lahko stran natisnjena na prosti prostor prejšnje strani');
    Add('propPrintOptions', 'Možnosti tiskanja poroèila');
    Add('propPrintPages', 'Doloèa ali naj se tiskajo vse, lihe ali sode strani');
    Add('propRangeBegin', 'Doloèa zaèetno toèko dataset-a');
    Add('propRangeEnd', 'Doloèa konèno toèko dataset-a');
    Add('propRangeEndCount', 'Doloèa število zapisov v dataset-u, èe RangeEnd = reCount');
    Add('propReadOnly', 'Doloèa ali je predmet Tekst samo-za-branje');
    Add('propRepeatHeaders', 'Doloèa ali bodo glave natisnjene tudi na novih straneh');
    Add('propReportOptions', 'Možnosti poroèila');
    Add('propReprintOnNewPage', 'Doloèa ali bo trak natisnjen tudi na novih straneh');
    Add('propRestrictions', 'Nastavitev pravic poroèila');
    Add('propRightMargin', 'Velikost desnega roba strani');
    Add('propRotation.TfrxBarCodeView', 'Usmerjenost èrtne kode');
    Add('propRotation', 'Vrtenje teksta');
    Add('propRowCount', 'Število navideznih zapisov v podatkovnem traku');
    Add('propRowFields', 'Imena ZP polj, ki predstavljajo cross vrstice');
    Add('propRowLevels', 'Število nivojev vrstic');
    Add('propRTLReading', 'Doloèa ali bo predmet Tekst prikazal svoj tekst v desni-proti-levi smeri');
    Add('propScriptLanguage', 'Ime jezika skripta, uporabljenega v poroèilu');
    Add('propSessionName', 'Ime BDE seje');
    Add('propShadowColor', 'Barva sence');
    Add('propShadowWidth', 'Širina sence');
    Add('propShape', 'Tip lika');
    Add('propShiftMode', 'Obnašanje premika objekta');
    Add('propShowCaptions', 'Doloèa ali bodo prikazani napisi gumbov v predogledu');
    Add('propShowColumnHeader', 'Doloèa ali bodo prikazane glave stolpcev v cross poroèilu');
    Add('propShowColumnTotal', 'Doloèa ali bo prikazan seštevek stolpcev v cross poroèilu');
    Add('propShowRowHeader', 'Doloèa ali bodo prikazane glave vrstic v cross poroèilu');
    Add('propShowRowTotal', 'Doloèa ali bo prikazan seštevek vrstic v cross poroèilu');
    Add('propShowDialog', 'Doloèa ali bo v predogledu prikazano pogovorno okno za tiskanje');
    Add('propShowText', 'Doloèa ali bo poleg èrtne kode prikazan bralni tekst');
    Add('propSize', 'Velikost pisave');
    Add('propSorted', 'Doloèa ali so elementi sortirani ali ne');
    Add('propSpacing', 'Doloèa število toèk med sliko in tekstom');
    Add('propSQL', 'SQL stavek');
    Add('propStartNewPage', 'Zaène novo stran pred zaèetkom tiskanja traku');
    Add('propStretch', 'Raztegne sliko, da se prilega mejam predmeta');
    Add('propStretched', 'Doloèa ali se lahko predmeti raztegnejo');
    Add('propStretchMode', 'Naèin raztegovanja predmeta');
    Add('propStyle.TFont', 'Stil pisave');
    Add('propStyle', 'Stil kontrole');
    Add('propStyle.TfrxFrame', 'Stil okvira predmeta');
    Add('propSuppressRepeated', 'Prepreèi ponavljajoèe vrednosti');
    Add('propTableName', 'Ime podatkovne tabele');
    Add('propTag', 'Številka oznake (Tag) predmeta');
    Add('propTagStr', 'Niz oznake predmeta');
    Add('propText', 'Tekst predmeta');
    Add('propTitleBeforeHeader', 'Doloèa ali naj se Naslov poroèila natisne pred Glavo strani');
    Add('propTop', 'Zgornja koordinata predmeta');
    Add('propTopMargin', 'Velikost zgornjaga roba strani');
    Add('propTyp', 'Tip okvira');
    Add('propUnderlines', 'Doloèa ali bo predmet Tekst prikazal èrto za vsako vrstico teksta');
    Add('propURL', 'URL predmeta');
    Add('propUserName', 'Uporabniško ime podatkovnega predmeta. To ime bo prikazano v podatkovnem drevesu.');
    Add('propVAlign', 'Navpièna poravnava teksta');
    Add('propVersionBuild', 'Info razlièice, build');
    Add('propVersionMajor', 'Info razlièice, major');
    Add('propVersionMinor', 'Info razlièice, minor');
    Add('propVersionRelease', 'Info razlièice, release');
    Add('propVGuides', 'Navpièna vodila strani');
    Add('propVisible', 'Vidnost predmeta');
    Add('propWidth', 'Širina predmeta');
    Add('propWidth.TfrxFrame', 'Širina okvira');
    Add('propWindowState', 'Zaèetno stanje okna');
    Add('propWordBreak', 'Delitev ruskih besed');
    Add('propWordWrap', 'Doloèa ali naj predmet Tekst vstavi mehke prehode v novo vrstico');
    Add('propZoom.TfrxBarCodeView', 'Poveèava èrtne kode');
    Add('propZoom', 'Zaèetni faktor poveèave predoglednega okna');
    Add('propZoomMode', 'Zaèetni naèin poveèave predoglednega okna');
  end;
end;


initialization
  frAddInspectorRes;

end.
