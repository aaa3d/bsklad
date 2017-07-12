
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
    Add('propActive', 'Specifikuje zda je datab�ze otev�en�');
    Add('propActive.TfrxHighlight', 'Specifikuje zda je zv�razn�n� aktivn�');
    Add('propAliasName', 'N�zev BDE aliasu');
    Add('propAlign', 'Ur�uje zarovn�n� objektu relativn� k pruhu, nebo str�nce');
    Add('propAlignment', 'Zarovn�n� objektu textu');
    Add('propAllowAllUp', 'Specifikuje zda v�echna rychl� tla��tka ve skupin� mohou b�t nevybr�na ve stejn� �as');
    Add('propAllowEdit', 'Ur�uje zda m��e u�ivatel upravovat p�edp�ipraven� str�nky report�');
    Add('propAllowExpressions', 'Ur�uje zda m��e textov� objekt v textu obsahovat v�razy');
    Add('propAllowGrayed', 'Povoluje za�edl� stav ��d�c�ch zatr��tek');
    Add('propAllowHTMLTags', 'Ur�uje zda m��e textov� objekt v textu obsahovat HTML tagy');
    Add('propAllowSplit', 'Ur�uje zda m��e pruh rozd�lovat sv�j obsah v r�mci str�nky');
    Add('propAuthor', 'Autor reportu');
    Add('propAutoSize', 'Ur�uje zda m��e obr�zek m�nit svoji velikost automaticky');
    Add('propAutoWidth', 'Ur�uje zda m��e text m�nit svoji ���ku automaticky');
    Add('propBackPicture', 'Obr�zek pozad� str�nky');
    Add('propBarType', 'Typ ��rov�ho k�du');
    Add('propBevelInner', 'Typ vnit�n�ho zkosen�');
    Add('propBevelOuter', 'Typ vn�j��ho zkosen�');
    Add('propBevelWidth', '���ka zkosen�');
    Add('propBorder', 'Ur�uje zda zobrazit vn�j�� okraj, nebo ne');
    Add('propBorderStyle', 'Styl okna');
    Add('propBottomMargin', 'Velikost spodn�ho okraje str�nky');
    Add('propBrushStyle', 'Styl �t�tce pou�it�ho pro pozad� objektu');
    Add('propButtons', 'Nastaven� tla��tek viditeln�ch v okn� p�edtisku');
    Add('propCacheSize', 'Max velikost pam�ti pou�it� enginem reportu. Pokud pou��van� pam� p�es�hne tuto hodnotu, p�ipravovan� str�nka bude ulo�ena do souboru na disk');
    Add('propCalcCheckSum', 'Ur�uje zda bude ��rov� k�d vypo�ten� ��slice kontrolovat automaticky');
    Add('propCancel', 'Ur�uje zda bude aktivov�na kl�vesa p�i stisku Esc');
    Add('propCaption', 'N�zev ovl�d�n�');
    Add('propCellFields', 'N�zvy DB pol� reprezentuj�c� k��ov� bu�ky');
    Add('propCellLevels', 'Po�et �rovn� bun�k');
    Add('propCenter', 'Ur�uje zda bude obr�zek v ovl�d�n� vyst�ed�n');
    Add('propCharset', 'Sada p�sma');
    Add('propCharSpacing', 'Po�et pixel� mezi dv�ma znaky');
    Add('propCheckColor', 'Barva zna�ky zatr�en�');
    Add('propChecked', 'Indikuje zda je ovl�d�n� zatr�eno');
    Add('propCheckStyle', 'Styl zna�ky zatr�en�');
    Add('propChild', 'Pod�azen� pruh spojen� s t�mto pruhem');
    Add('propCollate', 'Z�kladn� nastaven� celku');
    Add('propColor.TFont', 'Barva textu');
    Add('propColor', 'Barva objektu');
    Add('propColor.TfrxFrame', 'Barva r�me�ku');
    Add('propColor.TfrxHighlight', 'Ur�uje barvu objektu pokud je zv�razn�n� aktivn�');
    Add('propColumnFields', 'N�zvy DB pol� reprezentuj�c� k��ov� sloupce');
    Add('propColumnGap', 'Mezera mezi pruhy sloupc�');
    Add('propColumnLevels', 'Po�et �rovn� sloupc�');
    Add('propColumns', 'Po�et sloupc� v pruhu');
    Add('propColumnWidth', '���ka pruhu sloupce');
    Add('propCondition', 'Skupinov� podm�nka. Skupina bude zru�ena pokud se zm�n� hodnota tohoto v�razu');
    Add('propCondition.TfrxHighlight', '�et�zec v�razu. Pokud bude v�raz pravdiv�, bude aktivov�no zv�razn�n�');
    Add('propConnected', 'Indikuje zda je p�ipojen� datab�ze aktivn�');
    Add('propConvertNulls', 'Ur�uje zda budou null hodnoty DB p�evedeny na 0, False, nebo pr�zdn� �et�zec');
    Add('propCopies', 'Z�kladn� po�et kopi�');
    Add('propCursor', 'Kurzor objektu');
    Add('propDatabaseName', 'N�zev datab�ze');
    Add('propDataField', 'Specifikuje pole ze kter�ho dost�v� objekt data');
    Add('propDataSet', 'P�ipojuje objekty k datasetu, kter� obsahuje jeho reprezentuj�c� pole');
    Add('propDate', 'Hodnota datumu ovl�d�n�');
    Add('propDateFormat', 'Specifikuje form�t ve kter�m je datum prezentov�no');
    Add('propDecimalSeparator', 'Desetinn� odd�lova�');
    Add('propDefault', 'Ur�uje zda je tla��tko z�kladn�m tla��tkem');
    Add('propDefHeight', 'Z�kladn� v��ka ��dku');
    Add('propDescription', 'Popis reportu');
    Add('propDiagonal', 'Indikuje �e ��ra je diagon�ln�');
    Add('propDisplayFormat', 'Form�t zobrazovan� hodnoty');
    Add('propDoubleBuffered', 'Ur�uje zda okno p�edtisku pou��v� double buffering. Povolen� double buffering p�edch�z� obrazov�mu ru�en�, ale je pomalej��');
    Add('propDoublePass', 'Ur�uje zda engine reportu provede druh� pr�chod');
    Add('propDown', 'Ur�uje zda je stisknut� rychl� tla��tko');
    Add('propDownThenAcross', 'Ur�uje zda budou velk� k��ov� tabulky rozd�leny do str�nek');
    Add('propDriverName', 'N�zev BDE ovlada�e');
    Add('propDropShadow', 'Ur�uje zda m� objekt st�n');
    Add('propDuplex', 'Specifikuje duplexn� m�d pro str�nku');
    Add('propEditMask', 'Specifikuje masku kter� reprezentuje kter� text je platn� pro ��zen� maskovan� editace');
    Add('propEnabled', 'Ur�uje zda je povoleno ovl�d�n�');
    Add('propEngineOptions', 'Nastaven� engine reportu');
    Add('propExpression', 'Hodnota tohoto v�razu bude zobrazena v objektu');
    Add('propExpressionDelimiters', 'Znak, kter� bude pou�it k odd�len� v�raz� obsa�en�ch v textu');
    Add('propFieldAliases', 'Aliasy pol� datasetu');
    Add('propFilter', 'Podm�nky filtrov�n� pro dataset');
    Add('propFiltered', 'Ur�uje zda bude dataset filtrovat z�znamy s pou�it�m podm�nky ve vlastnosti Filtr');
    Add('propFlowTo', 'Textov� objekt zobrazuj�c� text, kter� se nep�izp�sob� objektu');
    Add('propFont', 'Vlastnosti p�sma objektu');
    Add('propFooterAfterEach', 'Ur�uje zda bude zobrazen pruh z�pat� po ka�d�m ��dku dat');
    Add('propFormatStr', 'Form�tovac� �et�zec');
    Add('propFrame', 'Vlastnosti or�mov�n� objektu');
    Add('propGapX', 'Lev� odsazen� textu');
    Add('propGapY', 'Horn� odsazen� textu');
    Add('propGlyph', 'Obr�zek ovl�d�n�');
    Add('propGroupIndex', 'Povoluje rychl� tla��tka pro pr�ci spole�n� jako skupina');
    Add('propHAlign', 'Vodorovn� zarovn�n� textu');
    Add('propHeight', 'V��ka objektu');
    Add('propHGuides', 'Vodorovn� vod�tka str�nky');
    Add('propHideZeros', 'Ur�uje zda bude textov� objekt skr�vat nulov� hodnoty');
    Add('propHighlight', 'Vlastnosti podm�n�n�ho zv�razn�n�');
    Add('propIndexName', 'N�zev indexu');
    Add('propInitString', 'Inicializa�n� �et�zec tisk�rny pro reporty jehli�kov�ch tisk�ren');
    Add('propItems', 'Seznam polo�ek objektu');
    Add('propKeepAspectRatio', 'Dodr�et p�vodn� stranov� pom�r obr�zku');
    Add('propKeepChild', 'Ur�uje zda bude pruh tisknut spolu s jeho pod�azen�m');
    Add('propKeepFooter', 'Ur�uje zda bude pruh tisknut spolu s jeho z�pat�m');
    Add('propKeepHeader', 'Determines whether the band will be printed together with its header');
    Add('propKeepTogether', 'Ur�uje zda bude pruh tisknut spolu se v�emi jeho pod�azen�mi pruhy');
    Add('propKind.TfrxFormat', 'Druh form�tov�n�');
    Add('propKind', 'Druh tla��tka');
    Add('propLargeDesignHeight', 'Ur�uje zda bude m�t str�nka velikou v��ku v m�du �prav');
    Add('propLayout', 'Plocha obr�zku tla��tka');
    Add('propLeft', 'Lev� sou�adnice objektu');
    Add('propLeftMargin', 'Velikost lev�ho okraje str�nky');
    Add('propLines', 'Text objektu');
    Add('propLineSpacing', 'Po�et pixel� mezi dv�ma ��dky textu');
    Add('propLoginPrompt', 'Ur�uje zda zobrazit dialog p�ihl�en�');
    Add('propMargin', 'Ur�uje po�et pixel� mezi okrajem obr�zku a okrajem tla��tka');
    Add('propMaster', 'Hlavn� dataset');
    Add('propMasterFields', 'Pole sv�zan� relac� master-detail');
    Add('propMaximized', 'Ur�uje zda bude okno p�edtisku maximalizov�no');
    Add('propMaxLength', 'Max. d�lka textu');
    Add('propMaxPages', 'Max. po�et str�nek p�ipravovan�ho reportu');
    Add('propMaxWidth', 'Max. ���ka sloupce');
    Add('propMDIChild', 'Ur�uje zda bude okno p�edtisku typu MDI pod�azen�');
    Add('propMemo', 'Text objektu');
    Add('propMinWidth', 'Min. ���ka sloupce');
    Add('propMirrorMargins', 'Zrcadl� okraje str�nky na v�echny dal�� str�nky');
    Add('propModal', 'Ur�uje zda bude zobrazeno okno p�edtisku mod�ln�');
    Add('propModalResult', 'Ur�uje zda a jak uzav�e tla��tko mod�ln� formul��');
    Add('propName.TFont', 'N�zev p�sma');
    Add('propName.TfrxReportOptions', 'N�zev  reportu');
    Add('propName', 'N�zev objektu');
    Add('propNumGlyphs', 'Indikuje po�et obr�zk� kter� jsou v grafice, specifikovan�ch ve vlastnosti Glyph');
    Add('propOpenDataSource', 'Ur�uje zda automaticky otev��t zdroj dat, nebo ne');
    Add('propOrientation', 'Orientace str�nky');
    Add('propOutlineText', 'Text, kter� bude zobrazen v ovl�d�n� v p�edtisku');
    Add('propOutlineVisible', 'Viditelnost ovl�d�n� p�edtisku');
    Add('propOutlineWidth', '���ka ovl�d�n� p�edtisku');
    Add('propPageNumbers.TfrxPrintOptions', 'Po�et tisknut�ch str�nek');
    Add('propPaperHeight', 'V��ka str�nky');
    Add('propPaperWidth', '���ka str�nky');
    Add('propParagraphGap', 'Odstup prvn� ��dky odstavce');
    Add('propParams.TfrxBDEDatabase', 'Parametry p�ipojen�');
    Add('propParams', 'Parametry query (dotazu)');
    Add('propParentFont', 'Ur�uje zda bude objekt pou��vat nad�azen� p�smo');
    Add('propPassword', 'Heslo reportu');
    Add('propPasswordChar', 'Indicuje znak, pokud je n�jak�, kter� se zobraz� na m�st� aktu�ln�ho znaku psan�ho v ovl�d�n�');
    Add('propPicture', 'Obr�zek');
    Add('propPicture.TfrxReportOptions', 'Popisuj�c� obr�zek reportu');
    Add('propPosition', 'Z�kladn� pozice okna');
    Add('propPreviewOptions', 'Nastaven� p�edtisku reportu');
    Add('propPrintable', 'Tisknutelnost objektu. Objekt s tisknutelnost�=False bude zobrazen v p�edtisku, ale nebude tisknut');
    Add('propPrintChildIfInvisible', 'Ur�uje zda bude pod�azen� pruh vyti�t�n, pokud je jeho nad�azen� pruh neviditeln�');
    Add('propPrinter', 'N�zev tisk�rny kter� bude vybr�n v p��pad� otev�en�, nebo spu�t�n� tohoto reportu');
    Add('propPrintIfDetailEmpty', 'Ur�uje zda bude datov� pruh vyti�t�n v p��pad�, �e je jeho podpruh pr�zdn�');
    Add('propPrintIfEmpty', 'Ur�uje zda bude str�nka vyti�t�na pokud jsou v�echny jej� datasety pr�zdn�');
    Add('propPrintOnFirstPage', 'Ur�uje zda bude pruh vyti�t�n na prvn� str�nku');
    Add('propPrintOnLastPage', 'Ur�uje zda bude pruh vyti�t�n na posledn� str�nku');
    Add('propPrintOnParent', 'Ur�uje zda se m��e vytisknout podreport do nad�azen�ho pruhu');
    Add('propPrintOnPreviousPage', 'Ur�uje zda m��e b�t str�nka vygenerov�na do voln�ho m�sta p�edchoz� vygenerovan� str�nky');
    Add('propPrintOptions', 'Tisk nastaven� reportu');
    Add('propPrintPages', 'Ur�uje zda bude vytisknuto v�e, lich�, nebo sud� str�nky');
    Add('propRangeBegin', 'Ur�uje po��te�n� bod navigace datasetu');
    Add('propRangeEnd', 'Ur�uje koncov� bod navigace datasetu');
    Add('propRangeEndCount', 'Ur�uje po�et z�znam� v datasetu, v p��pad� �e RangeEnd je p�epo��t�n');
    Add('propReadOnly', 'Ur�uje zda je textov� objekt pouze pro �ten�');
    Add('propRepeatHeaders', 'Ur�uje zda budou sloupce a ��dky z�hlav� tisknuty na ka�d� str�nce');
    Add('propReportOptions', 'Nastaven� reportu');
    Add('propReprintOnNewPage', 'Ur�uje zda bude pruh ti�t�n na ka�d� str�nce');
    Add('propRestrictions', 'Sada p��znak� omezen�');
    Add('propRightMargin', 'Velikost prav�ho okraje str�nky');
    Add('propRotation.TfrxBarCodeView', 'Orientace ��rov�ho k�du');
    Add('propRotation', 'Ot��en� textu');
    Add('propRowCount', 'Po�et virtu�ln�ch z�znam� v pruhu dat');
    Add('propRowFields', 'N�zvy DB pol� reprezentuj�c�ch k��ov� ��dky');
    Add('propRowLevels', 'Po�et �rovn� ��dku');
    Add('propRTLReading', 'Ur�uje zda zobraz� textov� objekt sv�j text ve sm�ru zprava do leva');
    Add('propScriptLanguage', 'N�zev skriptovac�ho jazyka pou�it�ho v reportu');
    Add('propSessionName', 'N�zev sekce BDE');
    Add('propShadowColor', 'Barva st�nu');
    Add('propShadowWidth', '���ka st�nu');
    Add('propShape', 'Typ tvaru');
    Add('propShiftMode', 'Funkce posunu objektu');
    Add('propShowCaptions', 'Ur�uje zda tla��tka v p�edtisku zobraz� sv�j n�zev');
    Add('propShowColumnHeader', 'Ur�uje zda k�� zobraz� sloupcov� z�hlav�');
    Add('propShowColumnTotal', 'Ur�uje zda k�� zobraz� sloupcov� celkov� sou�ty');
    Add('propShowRowHeader', 'Ur�uje zda k�� zobraz� ��dkov� z�hlav�');
    Add('propShowRowTotal', 'Ur�uje zda k�� zobraz� ��dkov� celkov� sou�ty');
    Add('propShowDialog', 'Ur�uje zda bude tiskov� dialog zobrazen v okn� p�edtisku');
    Add('propShowText', 'Ur�uje zda bude zobrazovat ��rov� k�d �iteln� text');
    Add('propSize', 'Velikost p�sma');
    Add('propSorted', 'Ur�uje zda budou polo�ky se�azeny, nebo ne');
    Add('propSpacing', 'Ur�uje po�et pixel� mezi obr�zkem a textem');
    Add('propSQL', 'SQL v�raz');
    Add('propStartNewPage', 'P�ed tiskem pruhu za�ne novou str�nku');
    Add('propStretch', 'P�izp�sob� obr�zek hranic�m objektu');
    Add('propStretched', 'Ur�uje zda m��e b�t objekt velikostn� p�izp�soben');
    Add('propStretchMode', 'Typ p�izp�soben� velikosti objektu');
    Add('propStyle.TFont', 'Styl p�sma');
    Add('propStyle', 'Styl ovl�d�n�');
    Add('propStyle.TfrxFrame', 'Styl r�me�ku objektu');
    Add('propSuppressRepeated', 'Potla�en� opakovan�ch hodnot');
    Add('propTableName', 'N�zev tabulky dat');
    Add('propTag', '��slo Tagu objektu');
    Add('propTagStr', '�et�zec Tagu objektu');
    Add('propText', 'Text objektu');
    Add('propTitleBeforeHeader', 'Ur�uje zda bude zobrazen n�zev reportu p�ed z�hlav�m str�nky');
    Add('propTop', 'Horn� sou�adnice objektu');
    Add('propTopMargin', 'Velikost horn�ho okraje str�nky');
    Add('propTyp', 'Typ r�me�ku');
    Add('propUnderlines', 'Ur�uje zda textov� objekt zobraz� m��kov� linky po ka�d� textov� ��dce');
    Add('propURL', 'URL objektu');
    Add('propUserName', 'U�ivatelsk� n�zev datov�ho objektu. Tento n�zev bude zobrazov�n v datov�m stromu');
    Add('propVAlign', 'Svisl� zarovn�n� textu');
    Add('propVersionBuild', 'Info o verzi, sestaven�');
    Add('propVersionMajor', 'Info o verzi, major verze');
    Add('propVersionMinor', 'Info o verzi, minor verze');
    Add('propVersionRelease', 'Info o verzi, vyd�n�');
    Add('propVGuides', 'Svisl� vod�tka str�nky');
    Add('propVisible', 'Viditelnost objektu');
    Add('propWidth', '���ka objektu');
    Add('propWidth.TfrxFrame', '���ka r�me�ku');
    Add('propWindowState', 'Po��te�n� stav okna');
    Add('propWordBreak', 'Rozd�lov�n� rusk�ch slov');
    Add('propWordWrap', 'Ur�uje zda textov� objekt vlo�� m�kk� p�echod na novou ��dku tak, �e se text zalom� k prav�mu okraji');
    Add('propZoom.TfrxBarCodeView', 'Zv�t�� ��rov� k�d');
    Add('propZoom', 'Po��te�n� faktor zv�t�en� okna p�edtisku');
    Add('propZoomMode', 'Po��te�n� re�im zv�t�en� okna p�edtisku');
  end;
end;


initialization
  frAddInspectorRes;

end.
