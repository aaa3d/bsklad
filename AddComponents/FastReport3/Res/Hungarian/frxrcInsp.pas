
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
    Add('propActive', 'Meghat�rozza, hogy a DataSet nyitott vagy nem');
    Add('propActive.TfrxHighlight', 'Meghat�rozza, hogy a kiemel�s akt�v vagy nem');
    Add('propAliasName', 'A BDE alias neve');
    Add('propAlign', 'Meghat�rozza, hogy az objektum elhelyezked�se a s�vhoz vagy a laphoz relat�v');
    Add('propAlignment', 'Az objektum sz�veg�nek igaz�t�sa');
    Add('propAllowAllUp', 'Meghat�rozza, hogy a SpeedButton-ok egyid�ben lehetnek-e inakt�vak a csoportban');
    Add('propAllowEdit', 'Meghat�rozza, hogy a felhaszn�l� szerkesztheti-e az el�k�sz�tett riport lapjait');
    Add('propAllowExpressions', 'Meghat�rozza, hogy a sz�veg objektum tartalmazhat kifejez�seket a sz�vegben');
    Add('propAllowGrayed', 'Enged�lyezi a h�rom �llapot� Checkbox kontrolt');
    Add('propAllowHTMLTags', 'Meghat�rozza, hogy a sz�veg objektum tartalmazhat HTML tag-eket a sz�vegben');
    Add('propAllowSplit', 'Meghat�rozza, hogy a s�v t�bb lapra kiterjedhet-e');
    Add('propAuthor', 'A riport szerz�je');
    Add('propAutoSize', 'Meghat�rozza, hogy a k�p automatikusan kezelheti-e a m�ret�t');
    Add('propAutoWidth', 'Meghat�rozza, hogy a sz�veg objektum kezelheti-e saj�t m�ret�t');
    Add('propBackPicture', 'A lap h�ttere');
    Add('propBarType', 'A vonalk�d t�pusa');
    Add('propBevelInner', 'A bels� �l t�pusa');
    Add('propBevelOuter', 'A k�ls� �l t�pusa');
    Add('propBevelWidth', 'Az �l vastags�ga');
    Add('propBorder', 'Meghat�rozza, hogy k�ls� hat�r mutatva legyen-e');
    Add('propBorderStyle', 'Az ablak st�lusa');
    Add('propBottomMargin', 'Az als� marg� m�rete');
    Add('propBrushStyle', 'Az objektum h�tter�hez haszn�lt ecset st�lusa');
    Add('propButtons', 'Gombok l�that�k legyenek-e az el�k�pen');
    Add('propCacheSize', 'A riportgener�tor �ltal haszn�lhat� mem�ria m�rete. Ha t�bb mem�ria sz�ks�ges, a lapok a merevlemezen lesznek t�rolva');
    Add('propCalcCheckSum', 'Meghat�rozza, hogy a vonalk�d az ellen�rz�sz�mot maga sz�molja-e');
    Add('propCancel', 'Meghat�rozza, hogy a gomb aktiv�l�djon-e, ha Esc-et nyomnak');
    Add('propCaption', 'A kontrol sz�vege');
    Add('propCellFields', 'Adatb�zismez�k nevei, melyek keresztcell�t hat�roznak meg');
    Add('propCellLevels', 'Cellaszintek sz�ma');
    Add('propCenter', 'Meghat�rozza, hogy a k�p a kontrolon bel�l k�z�pre igazodjon-e');
    Add('propCharset', 'A karakterk�szlet');
    Add('propCharSpacing', 'K�t karakter k�z�tti pixelek sz�ma');
    Add('propCheckColor', 'A pipa sz�ne');
    Add('propChecked', 'Jelzi, hogy a kontrol kipip�lt');
    Add('propCheckStyle', 'A pipa st�lusa');
    Add('propChild', 'Gyermek s�v ehhez a s�vhoz kapcsolva');
    Add('propCollate', 'Rendez�s alapbe�ll�t�sa');
    Add('propColor.TFont', 'A sz�veg sz�ne');
    Add('propColor', 'Az objektum sz�ne');
    Add('propColor.TfrxFrame', 'A keret sz�ne');
    Add('propColor.TfrxHighlight', 'Meghat�rozza az objektum sz�n�t, ha a kiemel�s akt�v');
    Add('propColumnFields', 'Adatb�zismez�k nevei, melyek keresztriport oszlopokat hat�roznak meg');
    Add('propColumnGap', 'A r�s a s�v oszlopai k�z�tt');
    Add('propColumnLevels', 'Az oszlopszintek sz�ma');
    Add('propColumns', 'Oszlopok sz�ma a s�vban');
    Add('propColumnWidth', 'A s�v oszlop sz�less�ge');
    Add('propCondition', 'A csoportos�t�s felt�tele. Ha ez az �rt�k v�ltozik, �j csoport kezd�dik');
    Add('propCondition.TfrxHighlight', 'Kifejez�s. Ha ez igaz, kiemel�s t�rt�nik');
    Add('propConnected', 'Jelzi, hogy a kapcsolat az adatb�zissal akt�v');
    Add('propConvertNulls', 'Meghat�rozza, hogy null �rt�kek konvert�l�dnak-e 0, Hamis vagy �res string �rt�kekk�');
    Add('propCopies', 'A m�solatok alap�rtelmezett sz�ma');
    Add('propCursor', 'Az objektum kurzora');
    Add('propDatabaseName', 'Az adatb�zis neve');
    Add('propDataField', 'Az objektum adatait tartalmaz� mez� meghat�roz�sa');
    Add('propDataSet', 'Az objektum kapcsolata egy Dataset-tel amelyik az adatot szolg�ltat� mez�t tartalmazza');
    Add('propDate', 'A kontrol d�tuma');
    Add('propDateFormat', 'D�tumform�tum meghat�roz�sa');
    Add('propDecimalSeparator', 'Tizedesjel');
    Add('propDefault', 'Meghat�rozza, hogy a gomb az alap�rtelmezett gomb');
    Add('propDefHeight', 'Sor alap�rtelmezett magass�ga');
    Add('propDescription', 'A riport le�r�sa');
    Add('propDiagonal', 'Jelzi, hogy a vonal �tl�s');
    Add('propDisplayFormat', 'A megjelen�tett �rt�k form�tuma');
    Add('propDoubleBuffered', 'Meghat�rozza, hogy az el�k�p ablaka kett�s t�rol�st haszn�l-e. Ez megakad�lyozza a villog�st, de lass�');
    Add('propDoublePass', 'Meghat�rozza, hogy a riport k�t menetes legyen-e');
    Add('propDown', 'Meghat�rozza, hogy a SpeedButton lenyomott vagy nem');
    Add('propDownThenAcross', 'Meghat�rozza, hogy a nagy m�ret� keresztt�bla hogyan legyen lapokra osztva');
    Add('propDriverName', 'A BDE driver neve');
    Add('propDropShadow', 'Meghat�rozza, hogy az objektumnak legyen-e �rny�ka');
    Add('propDuplex', 'A lap duplex m�dj�t hat�rozza meg');
    Add('propEditMask', 'Meghat�roz egy maszkot, amelynek megfelel� sz�veg lesz elfogadhat� a maszkolt edit kontrol sz�m�ra');
    Add('propEnabled', 'Meghat�rozza, hogy a kontrol enged�lyezett-e');
    Add('propEngineOptions', 'A riport opci�i');
    Add('propExpression', 'E kifejez�s �rt�ke lesz mutatva az objektumban');
    Add('propExpressionDelimiters', 'Ezek a karakterek v�lasztj�k el a kifejez�st a sz�vegt�l');
    Add('propFieldAliases', 'A DataSet mez�inek �lnevei');
    Add('propFilter', 'A DataSet sz�r�felt�tele');
    Add('propFiltered', 'Meghat�rozza, hogy a DataSet a Filter tulajdons�g �rt�ke alapj�n sz�rj�n-e');
    Add('propFlowTo', 'A sz�veg objektum amelyik mutatja az objektumba nem f�r� sz�veget');
    Add('propFont', 'Az objektum bet�t�pusa');
    Add('propFooterAfterEach', 'Meghat�rozza, hogy a l�bl�c s�v l�tszon-e minden sor ut�n');
    Add('propFormatStr', 'A form�z� sz�veg');
    Add('propFrame', 'A objektum keret jellemz�i');
    Add('propGapX', 'A sz�veg bal oldali beh�z�sa');
    Add('propGapY', 'A sz�veg fels� beh�z�sa');
    Add('propGlyph', 'A kontrol k�pe');
    Add('propGroupIndex', 'SpeedButton-ok csoportos�t�sa');
    Add('propHAlign', 'A sz�veg v�zszintes igaz�t�sa');
    Add('propHeight', 'Az objektum magass�ga');
    Add('propHGuides', 'A lap v�zszintes vezet�i');
    Add('propHideZeros', 'Meghat�rozza, hogy a sz�veg objektum elrejti-e a 0 �rt�keket');
    Add('propHighlight', 'A felt�teles kiemel�s jellemz�i');
    Add('propIndexName', 'Az index neve');
    Add('propInitString', 'Nyomtat� inicializ�l� karakterek m�trixnyomtat�khoz');
    Add('propItems', 'Objektum elemeinek list�ja');
    Add('propKeepAspectRatio', 'K�par�ny megtart�sa');
    Add('propKeepChild', 'Meghat�rozza, hogy a s�v gyermekeivel egy�tt lesz-e nyomtatva');
    Add('propKeepFooter', 'Meghat�rozza, hogy a s�v a l�bl�ccel egy�tt lesz-e nyomtatva');
    Add('propKeepHeader', 'Determines whether the band will be printed together with its header');
    Add('propKeepTogether', 'Meghat�rozza, hogy a s�v als�vjaival egy�tt lesz-e nyomtatva');
    Add('propKind.TfrxFormat', 'A form�z�s t�pusa');
    Add('propKind', 'A gomb fajt�ja');
    Add('propLargeDesignHeight', 'Meghat�rozza, hogy a lap magas lesz-e tervez�s k�zben');
    Add('propLayout', 'A gomb k�p�nek elrendez�se');
    Add('propLeft', 'Az objektum bal koordin�t�ja');
    Add('propLeftMargin', 'A bal marg� m�rete');
    Add('propLines', 'Az objektum sz�vege');
    Add('propLineSpacing', 'A sz�veg k�t sora k�z�tti t�v pixelben');
    Add('propLoginPrompt', 'Meghat�rozza, hogy legyen-e bejelentkez�si dial�gus');
    Add('propMargin', 'Meghat�rozza a k�p �s a gomb hat�rai k�z�tti pixelek sz�m�t');
    Add('propMaster', 'A master DataSet');
    Add('propMasterFields', 'A master kapcsolt mez�i a master-detail kapcsolat kialak�t�s�hoz');
    Add('propMaximized', 'Meghat�rozza, hogy az el�k�p teljes m�ret�-e');
    Add('propMaxLength', 'A sz�veg maxim�lis hossza');
    Add('propMaxPages', 'Az el�k�sz�tett riport lapjainak maxim�lis sz�ma');
    Add('propMaxWidth', 'Oszlop maxim�lis sz�less�ge');
    Add('propMDIChild', 'Meghat�rozza, hogy az el�k�p ablaka MDI gyermek lesz-e');
    Add('propMemo', 'Az objektum sz�vege');
    Add('propMinWidth', 'Az oszlop legkisebb sz�less�ge');
    Add('propMirrorMargins', 'Marg�k t�kr�z�se');
    Add('propModal', 'Meghat�rozza, hogy az el�k�p ablak mod�lis lesz-e');
    Add('propModalResult', 'Meghat�rozza, hogy �s milyen visszat�r�si �rt�kkel z�rja be a gomb az ablakot');
    Add('propName.TFont', 'A bet�k�szlet neve');
    Add('propName.TfrxReportOptions', 'A riport c�me');
    Add('propName', 'Az objektum neve');
    Add('propNumGlyphs', 'A Glyph tulajdons�gban t�rolt k�pek sz�ma');
    Add('propOpenDataSource', 'Meghat�rozza, hogy a DataSource automatikusan megny�ljon-e');
    Add('propOrientation', 'A lap t�jol�sa');
    Add('propOutlineText', 'A sz�veg ami a k�rvonal el�k�p kontrolban megjelenik');
    Add('propOutlineVisible', 'A k�rvonal el�k�p kontrol l�that�s�ga');
    Add('propOutlineWidth', 'A k�rvonal el�k�p kontrol sz�less�ge');
    Add('propPageNumbers.TfrxPrintOptions', 'A nyomtatand� oldalak sz�ma');
    Add('propPaperHeight', 'Az oldal magass�ga');
    Add('propPaperWidth', 'Az oldal sz�less�ge');
    Add('propParagraphGap', 'A bekezd�s els� sor�nak beh�z�sa');
    Add('propParams.TfrxBDEDatabase', 'A kapcsolat param�terei');
    Add('propParams', 'A query param�terei');
    Add('propParentFont', 'Meghat�rozza, hogy az objektum a sz�l� bet�t�pus�t haszn�lja-e');
    Add('propPassword', 'A riport jelszava');
    Add('propPasswordChar', 'Meghat�rozza a kontrolba �rt karakterek helyett megjelen� karaktert, ha nem �res');
    Add('propPicture', 'A k�p');
    Add('propPicture.TfrxReportOptions', 'A le�r� k�pe a riportnak');
    Add('propPosition', 'Az ablak kezdeti pozici�ja');
    Add('propPreviewOptions', 'A riport el�k�p opci�i');
    Add('propPrintable', 'Az objektum nyomtathat�s�ga. Ha nem nyomtathat�, az el�k�pen jelenik csak meg.');
    Add('propPrintChildIfInvisible', 'Meghat�rozza, hogy a gyerek s�v l�thatatlan sz�l� eset�n nyomtat�sra ker�l-e');
    Add('propPrinter', 'A nyomtat� neve, amely kiv�laszt�sra ker�l a riport megnyit�sa vagy nyomtat�sa eset�n');
    Add('propPrintIfDetailEmpty', 'Meghat�rozza, hogy az adats�v nyomtatva lesz-e, ha az als�vja �res');
    Add('propPrintIfEmpty', 'Meghat�rozza, hogy a lap nyomtatva lesz-e, ha DataSet-jei �resek');
    Add('propPrintOnFirstPage', 'Meghat�rozza, hogy a s�v nyomtatva lesz-e az els� oldalon');
    Add('propPrintOnLastPage', 'Meghat�rozza, hogy a s�v nyomtatva lesz-e az utols� oldalon');
    Add('propPrintOnParent', 'Meghat�rozza, hogy az alriport a sz�l� s�vra lesz-e nyomtatva');
    Add('propPrintOnPreviousPage', 'Meghat�rozza, hogy az oldal az el�z�leg gener�lt oldal �res ter�let�re lesz-e gener�lva');
    Add('propPrintOptions', 'A riport nyomtat�si opci�i');
    Add('propPrintPages', 'Meghat�rozza, hogy az �sszes, a p�ros vagy a p�ratlan oldalakat nyomtassa');
    Add('propRangeBegin', 'Meghat�rozza a DataSet navig�ci� kezd�pontj�t');
    Add('propRangeEnd', 'Meghat�rozza a DataSet navig�ci� v�gpontj�t');
    Add('propRangeEndCount', 'Meghat�rozza a DataSet rekordsz�m�t, ha RangeEnd �rt�ke reCount');
    Add('propReadOnly', 'Meghat�rozza, hogy a sz�veg objektum csak olvashat�-e');
    Add('propRepeatHeaders', 'Meghat�rozza, hogy az oszlop �s sor fejl�cek �jra lesznek-e nyomtatva az oldalakon');
    Add('propReportOptions', 'A riport opci�i');
    Add('propReprintOnNewPage', 'Meghat�rozza, hogy a s�v �j oldalon �jra lesz-e nyomtatva');
    Add('propRestrictions', 'Korl�toz�sok');
    Add('propRightMargin', 'A jobb marg� m�rete');
    Add('propRotation.TfrxBarCodeView', 'A vonalk�d t�jol�sa');
    Add('propRotation', 'A sz�veg elforgat�sa');
    Add('propRowCount', 'Virtu�lis rekordok sz�ma az adats�von');
    Add('propRowFields', 'A keresztsort meghat�roz� mez�k nevei');
    Add('propRowLevels', 'Sorszintek sz�ma');
    Add('propRTLReading', 'Meghat�rozza, hogy a sz�veg objektum jobbr�l balra �r-e');
    Add('propScriptLanguage', 'A riport szkriptnyelv�nek neve');
    Add('propSessionName', 'A BDE session neve');
    Add('propShadowColor', 'Az �rny�k sz�ne');
    Add('propShadowWidth', 'Az �rny�k sz�less�ge');
    Add('propShape', 'Az alkzat t�pusa');
    Add('propShiftMode', 'Az objektum eltol�s-viselked�se');
    Add('propShowCaptions', 'Meghat�rozza, hogy az el�k�p gombok sz�vege l�tszik-e');
    Add('propShowColumnHeader', 'Meghat�rozza, hogy a keresztt�bla mutatja-e az oszlop fejl�ceket');
    Add('propShowColumnTotal', 'Meghat�rozza, hogy a keresztt�bla mutatja-e az oszlop grand total-t');
    Add('propShowRowHeader', 'Meghat�rozza, hogy a keresztt�bla mutatja-e a sor fejl�ceket');
    Add('propShowRowTotal', 'Meghat�rozza, hogy a keresztt�bla mutatja-e a sor grand total-t');
    Add('propShowDialog', 'Meghat�rozza, hogy a nyomtat�si dial�gust mutatja-e az el�k�pben');
    Add('propShowText', 'Meghat�rozza, hogy a vonalk�d objektum mutatja-e az olvashat� sz�veg�t');
    Add('propSize', 'A bet�k�szlet m�rete');
    Add('propSorted', 'Meghat�rozza, hogy az elemek rendezettek-e');
    Add('propSpacing', 'Meghat�rozza, a pixelek sz�m�t a k�p �s a sz�veg k�z�tt');
    Add('propSQL', 'A SQL utas�t�s');
    Add('propStartNewPage', 'A s�v nyomtat�sa el�tt �j oldalt kezd');
    Add('propStretch', 'Az objektum m�ret�re ny�jtja a k�pet');
    Add('propStretched', 'Meghat�rozza, hogy az objektum ny�jthat�-e');
    Add('propStretchMode', 'Az objektum ny�jt�si viselked�se');
    Add('propStyle.TFont', 'A bet�k�szlet st�lusa');
    Add('propStyle', 'A kontrol st�lusa');
    Add('propStyle.TfrxFrame', 'Az objektum keret�nek st�lusa');
    Add('propSuppressRepeated', 'Ism�telt �rt�kek elnyom�sa');
    Add('propTableName', 'Adatt�bla neve');
    Add('propTag', 'Az objektum Tag sz�ma');
    Add('propTagStr', 'Az objektum Tag sz�vege');
    Add('propText', 'Az objektum sz�vege');
    Add('propTitleBeforeHeader', 'Meghat�rozza, hogy a lapfejl�c el�tt mutassa-e a riport c�m�t');
    Add('propTop', 'Az objektum fels� koordin�t�ja');
    Add('propTopMargin', 'A fels� marg� m�rete');
    Add('propTyp', 'A keret t�pusa');
    Add('propUnderlines', 'Meghat�rozza, hogy a sz�veg objektum mutatja-e a r�csvonalakat a sz�veg sorok ut�n');
    Add('propURL', 'Az objektum URL-je');
    Add('propUserName', 'Az adatobjektum felhaszn�l�i neve. Ez jelenik meg az adatf�n');
    Add('propVAlign', 'A sz�veg f�gg�leges igaz�t�sa');
    Add('propVersionBuild', 'Verzi� info, build');
    Add('propVersionMajor', 'Verzi� info, f�verzi�');
    Add('propVersionMinor', 'Verzi� info, alverzi�');
    Add('propVersionRelease', 'Verzi� info, kibocs�t�s');
    Add('propVGuides', 'Oldal f�gg�leges vezet�i');
    Add('propVisible', 'Objektum l�that�s�ga');
    Add('propWidth', 'Objektum sz�less�ge');
    Add('propWidth.TfrxFrame', 'Keret sz�less�ge');
    Add('propWindowState', 'Ablak kezdeti �llapota');
    Add('propWordBreak', 'Orosz szavak t�r�se');
    Add('propWordWrap', 'Meghat�rozza, hogy a sz�veg objektum l�gy sort�r�seket sz�rjon-e be.');
    Add('propZoom.TfrxBarCodeView', 'Vonalk�d nagy�t�sa');
    Add('propZoom', 'El�k�p kezdeti nagy�t�sa');
    Add('propZoomMode', 'El�k�p kezdeti nagy�t�si m�dja');
  end;
end;


initialization
  frAddInspectorRes;

end.
