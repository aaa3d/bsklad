
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
    Add('propAlign', 'Dolo�a poravnavo predmeta relativno na trak ali stran');
    Add('propAlignment', 'Poravnava teksta v predmetu');
    Add('propAllowAllUp', 'Navaja ali so lahko vsi Speed gumbi v skupini neizbrani v istem trenutku');
    Add('propAllowEdit', 'Dolo�a ali uporabnik lahko ureja pripravljeno poro�ilo');
    Add('propAllowExpressions', 'Dolo�a ali predmet lahko vsebuje izraz v tekstu');
    Add('propAllowGrayed', 'Dovola nedolo�eno stanje CheckBox-a');
    Add('propAllowHTMLTags', 'Dolo�a ali lahko tekst vsebuje HTML oznake');
    Add('propAllowSplit', 'Dolo�a ali lahko trak razdeli svojo vsebino po ve� straneh');
    Add('propAuthor', 'Avtor poro�ila');
    Add('propAutoSize', 'Dolo�a ali se velikost slike samodejno prilagaja');
    Add('propAutoWidth', 'Dolo�a ali se �irina predmeta Tekst samodejno prilagaja');
    Add('propBackPicture', 'Slika ozadja strani');
    Add('propBarType', 'Tip �rtne kode');
    Add('propBevelInner', 'Tip notranjega bevel-a');
    Add('propBevelOuter', 'Tip zunanjega bevel-a');
    Add('propBevelWidth', '�irina bevel-a');
    Add('propBorder', 'Dolo�a ali naj bo prikazana zunanja meja');
    Add('propBorderStyle', 'Stil okna');
    Add('propBottomMargin', 'Velikost spodnjega roba strani');
    Add('propBrushStyle', 'BrushStyle uporabljen za ozadje');
    Add('propButtons', 'Nastavitev vidnih gumbov predoglednem oknu');
    Add('propCacheSize', 'Najve�ja koli�ina spomina, ki ga uporablja program za izdelavo poro�il. �e je poraba ve�ja, bo uporabljen prostor na disku');
    Add('propCalcCheckSum', 'Dolo�a ali naj bo kontrolni znak �rtne kode samodejno izra�unan');
    Add('propCancel', 'Dolo�a ali naj bo gumb aktiviran pri pritisnjeni tipki Esc');
    Add('propCaption', 'Napis kontrole');
    Add('propCellFields', 'Imena ZP polj, ki predstavljajo celico v cross poro�ilu');
    Add('propCellLevels', '�tevilo nivojev celic');
    Add('propCenter', 'Dolo�a ali naj bo slika usredinjena znotraj kontrole');
    Add('propCharset', 'Nabor znakov pisave');
    Add('propCharSpacing', 'Koli�ina to�k med dvema znakoma');
    Add('propCheckColor', 'Barva oznake');
    Add('propChecked', 'Navaja ali je kontrola ozna�ena');
    Add('propCheckStyle', 'Stil znaka oznake');
    Add('propChild', 'Child trak povezan na ta trak');
    Add('propCollate', 'Privzeta nastavitev abecednega urejanja');
    Add('propColor.TFont', 'Barva teksta');
    Add('propColor', 'Barva predmeta');
    Add('propColor.TfrxFrame', 'Barva okvira');
    Add('propColor.TfrxHighlight', 'Dolo�a barvo predmeta, �e je povdarek aktiven');
    Add('propColumnFields', 'Imena ZP polj, ki predstavljajo stolpce v cross poro�ilu');
    Add('propColumnGap', 'Razmik med stolpci v traku');
    Add('propColumnLevels', '�tevilo nivojev stolpcev');
    Add('propColumns', '�tevilo stolpcev v traku');
    Add('propColumnWidth', '�irina stolpca v traku');
    Add('propCondition', 'Pogoj grupiranja. Ustvarjena bo nova grupa, �e se vrednost spremeni');
    Add('propCondition.TfrxHighlight', 'Niz izraza. �e je izraz True, bo povdarek aktiven');
    Add('propConnected', 'Navaja ali je povezava do zbirke podatkov aktivna');
    Add('propConvertNulls', 'Dolo�a ali naj se NULL vrednosti prevedejo v 0');
    Add('propCopies', 'Privzeto �tevilo kopij');
    Add('propCursor', 'Kurzor predmeta');
    Add('propDatabaseName', 'Ime zbirke podatkov');
    Add('propDataField', 'Navaja polje, iz katerega predmet dobiva podatke');
    Add('propDataSet', 'Predmet pove�e do dataset-a, ki vsebuje polje za prikaz');
    Add('propDate', 'Vrednost Datum');
    Add('propDateFormat', 'Dolo�a obliko prikazanega datuma');
    Add('propDecimalSeparator', 'Decimalno lo�ilo');
    Add('propDefault', 'Dolo�a ali je gumb privzeti gumb');
    Add('propDefHeight', 'Privzeta vi�ina vrstice');
    Add('propDescription', 'Opis poro�ila');
    Add('propDiagonal', 'Navaja, ali je �rta diagonalna');
    Add('propDisplayFormat', 'Oblika prikaza vrednosti');
    Add('propDoubleBuffered', 'Dolo�a ali predogledno okno uporablja dvojni medpomnilnik. Omogo�ena lastnost prepre�uje �miganje, ampak je po�asnej�e');
    Add('propDoublePass', 'Dolo�a ali naj se poro�ilo izvede v dveh prehodih');
    Add('propDown', 'Dolo�a ali je speed gumb pritisnjen ali ne');
    Add('propDownThenAcross', 'Dolo�a kako bo velika tabela razdeljena preko ve� strani');
    Add('propDriverName', 'Ime BDE gonilnika');
    Add('propDropShadow', 'Dolo�a ali ima predmet senco');
    Add('propDuplex', 'Dolo�a dvostranski na�in strani');
    Add('propEditMask', 'Dolo�a masko, ki dolo�a veljaven vnos teksta');
    Add('propEnabled', 'Dolo�a, ali je kontrola omogo�ena');
    Add('propEngineOptions', 'Mo�nosti programa za izdelavo poro�il');
    Add('propExpression', 'Vrednost tega izraza bo prikazana v predmetu');
    Add('propExpressionDelimiters', 'Znaki, ki bodo uporabljeni za dolo�itev izraza v tekstu');
    Add('propFieldAliases', 'Aliasi polj v Dataset-u');
    Add('propFilter', 'Pogoji filtriranja v dataset-u');
    Add('propFiltered', 'Dolo�a ali naj bo dataset filtriran z uporabo lastnosti Filter');
    Add('propFlowTo', 'Predmer Text, ki bo prikazal tekst, �e se ta ne prilega temu predmetu');
    Add('propFont', 'Lastnosti pisave predmeta');
    Add('propFooterAfterEach', 'Dolo�a ali naj bo Noga natisnjena za vsako podatkovno vrstico');
    Add('propFormatStr', 'Niz oblikovanja');
    Add('propFrame', 'Lastnosti okvira predmeta');
    Add('propGapX', 'Levi zamik teksta');
    Add('propGapY', 'Zgornji zamik teksta');
    Add('propGlyph', 'Slika kontrole');
    Add('propGroupIndex', 'Dovoljuje speed gumbom delovanje v skupini');
    Add('propHAlign', 'Vodoravna poravnava teksta');
    Add('propHeight', 'Vi�ina teksta');
    Add('propHGuides', 'Vodoravna vodila strani');
    Add('propHideZeros', 'Dolo�a ali bo predmet Tekst skril ni�elne vrednosti');
    Add('propHighlight', 'Lastnosti pogojnih povdarkov');
    Add('propIndexName', 'Ime indeksa');
    Add('propInitString', 'Inicializacijski niz za matri�ni tiskalnik');
    Add('propItems', 'Seznam elementov predmeta');
    Add('propKeepAspectRatio', 'Ohrani originalno razmerje med �irino in vi�ino slike');
    Add('propKeepChild', 'Dolo�a ali bo trak natisnjen skupaj z njegovim Child-om');
    Add('propKeepFooter', 'Dolo�a ali bo trak natisnjen skupaj z njegovo Nogo');
    Add('propKeepHeader', 'Dolo�a ali bo trak natisnjen skupaj z njegovo Glavo');
    Add('propKeepTogether', 'Dolo�a ali bo trak natisnjen skupaj z vsemi njegovimi podtrakovi');
    Add('propKind.TfrxFormat', 'Vrsta oblikovanja');
    Add('propKind', 'Vrsta gumba');
    Add('propLargeDesignHeight', 'Dolo�a ali bo imela stran veliko vi�ino v oblikovalnem na�inu');
    Add('propLayout', 'Polo�aj slike na gumbu');
    Add('propLeft', 'Leva koordinata predmeta');
    Add('propLeftMargin', 'Velikost levega roba strani');
    Add('propLines', 'Tekst predmeta');
    Add('propLineSpacing', 'Koli�ina to�k med dvema vrsticama teksta');
    Add('propLoginPrompt', 'Dolo�a ali naj se prika�e pogovorno okno za prijavo');
    Add('propMargin', 'Dolo�a �tevilo to�k med robovoma slike in gumba');
    Add('propMaster', 'Master dataset');
    Add('propMasterFields', 'Polja povezave v Master-detail odnosu');
    Add('propMaximized', 'Dolo�a ali bo predogledno okno maksimirano');
    Add('propMaxLength', 'Najve�ja dol�ina teksta');
    Add('propMaxPages', 'Najve�je �tevilo strani pripravljenega poro�ila');
    Add('propMaxWidth', 'Najve�ja �irina stolpca');
    Add('propMDIChild', 'Dolo�a ali naj bo predogledno okno MDI child');
    Add('propMemo', 'Tekst predmeta');
    Add('propMinWidth', 'Najmanj�a �irina stolpca');
    Add('propMirrorMargins', 'Zrcali robove strani na sodih straneh');
    Add('propModal', 'Dolo�a ali bo predogledno okno prikazano modalno');
    Add('propModalResult', 'Dolo�a ali in kako se gumb zapira v modalnem pogovornem oknu');
    Add('propName.TFont', 'Ime vrste pisave');
    Add('propName.TfrxReportOptions', 'Ime poro�ila');
    Add('propName', 'Ime predmeta');
    Add('propNumGlyphs', 'Dolo�a �tevilo slik ki se nahajajo v lastnosti Glyph');
    Add('propOpenDataSource', 'Dolo�a ali naj se datasource odpre samodejno ali ne');
    Add('propOrientation', 'Usmerjenost strani');
    Add('propOutlineText', 'Tekst, ki bo prikazan v predmetu obrisa v predogledu');
    Add('propOutlineVisible', 'Vidnost obrisa v predogledu');
    Add('propOutlineWidth', '�irina obrisa v predogledu');
    Add('propPageNumbers.TfrxPrintOptions', '�tevilo strani, ki naj se natisne');
    Add('propPaperHeight', 'Vi�ina strani');
    Add('propPaperWidth', '�irina strani');
    Add('propParagraphGap', 'Zamik prve vrstice odstavka');
    Add('propParams.TfrxBDEDatabase', 'Parametri povezave');
    Add('propParams', 'Parametri query-ja');
    Add('propParentFont', 'Dolo�a ali naj predmet uporablja pisavo parent-a');
    Add('propPassword', 'Geslo poro�ila');
    Add('propPasswordChar', 'Dolo�a znak, �e kak�en, ki se prika�e namesto pritisnjenega znaka');
    Add('propPicture', 'Slika');
    Add('propPicture.TfrxReportOptions', 'Opis slike poro�ila');
    Add('propPosition', 'Za�etni polo�aj okna');
    Add('propPreviewOptions', 'Mo�nosti predogleda poro�ila');
    Add('propPrintable', 'Natisljivost predmeta. Predmet z Printable=False bo v predogledu, ampak ne bo natisnjen');
    Add('propPrintChildIfInvisible', 'Dolo�a ali bo Child natisnjen v primeru, �e je njegov parent neviden');
    Add('propPrinter', 'Ime tiskalnika, ki bo samodejno izbran prikazu poro�ila');
    Add('propPrintIfDetailEmpty', 'Dolo�a ali bo podatkovni trak natisnjen v primeru, �e je njegov detail prazen');
    Add('propPrintIfEmpty', 'Dolo�a ali bo stran natisnjena v primeru, �e so vsi podatki prazni');
    Add('propPrintOnFirstPage', 'Dolo�a ali bo trak natisnjen na prvo stran poro�ila');
    Add('propPrintOnLastPage', 'Dolo�a ali bo trak natisnjen na zadnjo stran poro�ila');
    Add('propPrintOnParent', 'Dolo�a ali bo subreport natisnjen na parent trak');
    Add('propPrintOnPreviousPage', 'Dolo�a ali je lahko stran natisnjena na prosti prostor prej�nje strani');
    Add('propPrintOptions', 'Mo�nosti tiskanja poro�ila');
    Add('propPrintPages', 'Dolo�a ali naj se tiskajo vse, lihe ali sode strani');
    Add('propRangeBegin', 'Dolo�a za�etno to�ko dataset-a');
    Add('propRangeEnd', 'Dolo�a kon�no to�ko dataset-a');
    Add('propRangeEndCount', 'Dolo�a �tevilo zapisov v dataset-u, �e RangeEnd = reCount');
    Add('propReadOnly', 'Dolo�a ali je predmet Tekst samo-za-branje');
    Add('propRepeatHeaders', 'Dolo�a ali bodo glave natisnjene tudi na novih straneh');
    Add('propReportOptions', 'Mo�nosti poro�ila');
    Add('propReprintOnNewPage', 'Dolo�a ali bo trak natisnjen tudi na novih straneh');
    Add('propRestrictions', 'Nastavitev pravic poro�ila');
    Add('propRightMargin', 'Velikost desnega roba strani');
    Add('propRotation.TfrxBarCodeView', 'Usmerjenost �rtne kode');
    Add('propRotation', 'Vrtenje teksta');
    Add('propRowCount', '�tevilo navideznih zapisov v podatkovnem traku');
    Add('propRowFields', 'Imena ZP polj, ki predstavljajo cross vrstice');
    Add('propRowLevels', '�tevilo nivojev vrstic');
    Add('propRTLReading', 'Dolo�a ali bo predmet Tekst prikazal svoj tekst v desni-proti-levi smeri');
    Add('propScriptLanguage', 'Ime jezika skripta, uporabljenega v poro�ilu');
    Add('propSessionName', 'Ime BDE seje');
    Add('propShadowColor', 'Barva sence');
    Add('propShadowWidth', '�irina sence');
    Add('propShape', 'Tip lika');
    Add('propShiftMode', 'Obna�anje premika objekta');
    Add('propShowCaptions', 'Dolo�a ali bodo prikazani napisi gumbov v predogledu');
    Add('propShowColumnHeader', 'Dolo�a ali bodo prikazane glave stolpcev v cross poro�ilu');
    Add('propShowColumnTotal', 'Dolo�a ali bo prikazan se�tevek stolpcev v cross poro�ilu');
    Add('propShowRowHeader', 'Dolo�a ali bodo prikazane glave vrstic v cross poro�ilu');
    Add('propShowRowTotal', 'Dolo�a ali bo prikazan se�tevek vrstic v cross poro�ilu');
    Add('propShowDialog', 'Dolo�a ali bo v predogledu prikazano pogovorno okno za tiskanje');
    Add('propShowText', 'Dolo�a ali bo poleg �rtne kode prikazan bralni tekst');
    Add('propSize', 'Velikost pisave');
    Add('propSorted', 'Dolo�a ali so elementi sortirani ali ne');
    Add('propSpacing', 'Dolo�a �tevilo to�k med sliko in tekstom');
    Add('propSQL', 'SQL stavek');
    Add('propStartNewPage', 'Za�ne novo stran pred za�etkom tiskanja traku');
    Add('propStretch', 'Raztegne sliko, da se prilega mejam predmeta');
    Add('propStretched', 'Dolo�a ali se lahko predmeti raztegnejo');
    Add('propStretchMode', 'Na�in raztegovanja predmeta');
    Add('propStyle.TFont', 'Stil pisave');
    Add('propStyle', 'Stil kontrole');
    Add('propStyle.TfrxFrame', 'Stil okvira predmeta');
    Add('propSuppressRepeated', 'Prepre�i ponavljajo�e vrednosti');
    Add('propTableName', 'Ime podatkovne tabele');
    Add('propTag', '�tevilka oznake (Tag) predmeta');
    Add('propTagStr', 'Niz oznake predmeta');
    Add('propText', 'Tekst predmeta');
    Add('propTitleBeforeHeader', 'Dolo�a ali naj se Naslov poro�ila natisne pred Glavo strani');
    Add('propTop', 'Zgornja koordinata predmeta');
    Add('propTopMargin', 'Velikost zgornjaga roba strani');
    Add('propTyp', 'Tip okvira');
    Add('propUnderlines', 'Dolo�a ali bo predmet Tekst prikazal �rto za vsako vrstico teksta');
    Add('propURL', 'URL predmeta');
    Add('propUserName', 'Uporabni�ko ime podatkovnega predmeta. To ime bo prikazano v podatkovnem drevesu.');
    Add('propVAlign', 'Navpi�na poravnava teksta');
    Add('propVersionBuild', 'Info razli�ice, build');
    Add('propVersionMajor', 'Info razli�ice, major');
    Add('propVersionMinor', 'Info razli�ice, minor');
    Add('propVersionRelease', 'Info razli�ice, release');
    Add('propVGuides', 'Navpi�na vodila strani');
    Add('propVisible', 'Vidnost predmeta');
    Add('propWidth', '�irina predmeta');
    Add('propWidth.TfrxFrame', '�irina okvira');
    Add('propWindowState', 'Za�etno stanje okna');
    Add('propWordBreak', 'Delitev ruskih besed');
    Add('propWordWrap', 'Dolo�a ali naj predmet Tekst vstavi mehke prehode v novo vrstico');
    Add('propZoom.TfrxBarCodeView', 'Pove�ava �rtne kode');
    Add('propZoom', 'Za�etni faktor pove�ave predoglednega okna');
    Add('propZoomMode', 'Za�etni na�in pove�ave predoglednega okna');
  end;
end;


initialization
  frAddInspectorRes;

end.
