{******************************************}
{                                          }
{             FastReport v3.0              }
{         Language resource file           }
{                                          }
{         Copyright (c) 1998-2005          }
{         by Alexander Tzyganenko,         }
{            Fast Reports Inc.             }
{                                          }
{     Translated by Tayfun SUSAMCIOGLU     }
{       Tolga CAGLAYAN, Ozkan DEMIR        }
{                 TURKEY                   }
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
    Add('propActive', 'Dataset''in a��k olup olmad���n� belirler');
    Add('propActive.TfrxHighlight', 'Specifies whether or not a highlight is active');
    Add('propAliasName', 'BDE''nin g�r�nen ad�');
    Add('propAlign', 'Bir band veya sayfaya ba�l� nesnelerin d�zenini belirler');
    Add('propAlignment', 'Nesnenin metninin hizas�');
    Add('propAllowAllUp', 'Grup i�indeki t�m Speed Button''lar�n�n ayn� anda se�ilmesine olanak sa�lar');
    Add('propAllowEdit', 'Kullan�c�n�n haz�rlanm�� rapor sayfalar�n� d�zenlemesine olanak sa�lar');
    Add('propAllowExpressions', 'Metin nesnelerinin anlat�m ifadeleri i�ermelerine olanak sa�lar');
    Add('propAllowGrayed', 'CheckBox''lar�n durumunun gri olmas�na izin verir');
    Add('propAllowHTMLTags', 'Metin nesnelerinin HTML kodu i�ermelerine olanak sa�lar');
    Add('propAllowSplit', 'Bir sayfaya s��mayan, bir sayfadan daha uzun metinlerin, b�l�nerek birden fazla sayfada g�sterilmesine olanak sa�lar');
    Add('propAuthor', 'Raporun yazar�');
    Add('propAutoSize', 'Resimlerin otomatik �l��lendirilmesine olanak sa�lar');
    Add('propAutoWidth', 'Metin nesnelerinin geni�liklerinin otomatik �l��lendirilmesine olanak sa�lar');
    Add('propBackPicture', 'Sayfa arkaplan resmi');
    Add('propBarType', 'Barkod tipi');
    Add('propBevelInner', 'Bevel''in i� tipi');
    Add('propBevelOuter', 'Bevel''in d�� tipi');
    Add('propBevelWidth', 'Bevel''in geni�li�i');
    Add('propBorder', 'D�� �er�eve �izgilerinin g�r�nmesine olanak sa�lar');
    Add('propBorderStyle', 'Pencerenin stili');
    Add('propBottomMargin', 'Sayfa alt bo�lu�unun �l��s�');
    Add('propBrushStyle', 'Nesnelerin arkaplan�nda kullan�lan f�r�an�n stili');
    Add('propButtons', '�nizleme penceresindeki d��melerin g�r�n�rl���n� ayarlar');
    Add('propCacheSize', 'Rapor motorunun kulland��� maksimum bellek. E�er bellek kullan�m� bu de�eri a�arsa, haz�rlanm�� sayfalar disk dosyas� olarak yedeklenecektir.');
    Add('propCalcCheckSum', 'Barkod''un kontrol rakam�n� otomatik olarak hesaplayabilesine olanak sa�lar');
    Add('propCancel', 'ESC tu�una bas�ld���nda button''un aktif olmas�na olanak sa�lar');
    Add('propCaption', 'Nesnenin ba�l���');
    Add('propCellFields', 'H�creyi temsil eden sahan�n ad�');
    Add('propCellLevels', 'H�cre say�s�');
    Add('propCenter', 'Resmin nesneyi ortalamas�na olanak sa�lar');
    Add('propCharset', 'Yaz� tipi seti');
    Add('propCharSpacing', '�ki karakter aras�ndaki Pixel say�s�');
    Add('propCheckColor', 'Onay i�aretinin rengi');
    Add('propChecked', 'Nesnenin i�aretli oldu�unu belirtir');
    Add('propCheckStyle', 'Onay i�aretinin stili');
    Add('propChild', '�ocuk band bu banda ba�land�');
    Add('propCollate', 'Varsay�lan d�zenleme ayarlar�');
    Add('propColor.TFont', 'Yaz� rengi');
    Add('propColor', 'Nesne rengi');
    Add('propColor.TfrxFrame', '�er�eve rengi');
    Add('propColor.TfrxHighlight', 'Vurgu rengi aktif oldu�unda Nesne rengini belirler');
    Add('propColumnFields', 'Kolonlar� temsil eden sahan�n ad�');
    Add('propColumnGap', 'Band kolonlar� aras�ndaki bo�luk');
    Add('propColumnLevels', 'Kolon seviyelerinin say�s�');
    Add('propColumns', 'Band''�n i�indeki kolonlar�n say�s�');
    Add('propColumnWidth', 'Band kolonunun geni�li�i');
    Add('propCondition', 'Gruplama durumu. E�er bu ifadenin de�eri de�i�irse, grup iptal olacakt�r');
    Add('propCondition.TfrxHighlight', '�fade metni. E�er bu ifade "True" ise, vurgu aktif olacakt�r');
    Add('propConnected', 'Veritaban�n�n a��k olup olmad���n� belirler');
    Add('propConvertNulls', 'Veritaban�ndaki bo� sahalar�n 0, "False" veya <bo�> ifadelerine d�n��t�rmesine olanak sa�lar');
    Add('propCopies', 'Varsay�lan kopya say�s�');
    Add('propCursor', 'Farenin nesne �st�ndeki �ekli');
    Add('propDatabaseName', 'Veritaban�n�n ad�');
    Add('propDataField', 'Nesneye ba�lanan veritaban� sahas�');
    Add('propDataSet', 'Nesneye ba�lanan, veritaban� sahalar�n� i�eren veri tablosu');
    Add('propDate', 'Nesnenin tarih de�eri');
    Add('propDateFormat', 'Tarih format�');
    Add('propDecimalSeparator', 'Ondal�k ayrac�');
    Add('propDefault', 'ENTER tu�una bas�ld���nda button''un aktif olmas�na olanak sa�lar');
    Add('propDefHeight', 'Varsay�lan sat�r y�ksekli�i');
    Add('propDescription', 'Rapor a��klamas�');
    Add('propDiagonal', '�izgilerin �apraz olmas�na olanak sa�lar');
    Add('propDisplayFormat', 'G�r�nen de�erin format�');
    Add('propDoubleBuffered', '�nizleme penceresinin �ift buffer kullanmas�n� sa�lar. E�er �ift buffer �zelli�i a��l�rsa titre�im �nlenir, ama yava�lar');
    Add('propDoublePass', 'Rapor motorunun ikinci ge�i� yap�p yapmamas�n� belirler');
    Add('propDown', 'Speed Button''un bas�l� olup olmad���n� belirler');
    Add('propDownThenAcross', 'B�y�k tablonun ne �ekilde par�alara ayr�laca��n� belirler');
    Add('propDriverName', 'BDE s�r�c�s�n�n ad�');
    Add('propDropShadow', 'Nesnelerin g�lgesinin olup olmad���n� belirler');
    Add('propDuplex', 'Sayfan�n �ift y�nl� kullan�lmas�n� sa�lar');
    Add('propEditMask', 'Metin nesnesi i�in ge�erli olan format �ekli');
    Add('propEnabled', 'Nesnenin kullan�labilir olup olmad���n� belirler');
    Add('propEngineOptions', 'Raporun motor se�enekleri');
    Add('propExpression', 'Nesnede g�sterilecek ifade');
    Add('propExpressionDelimiters', 'Nesnenin i�indeki ifadeyi ay�rmak i�in kullanacak ayra�');
    Add('propFieldAliases', 'Sahan�n g�r�nen ad�');
    Add('propFilter', 'Dataset''in filitre ko�ulu');
    Add('propFiltered', 'Dataset''in filitre �zelli�indeki ko�ul kullan�larak kay�tlar�n filtrelenmesine olanak sa�lar');
    Add('propFlowTo', 'S��mayan metnin �zerinde g�sterilece�i nesne');
    Add('propFont', 'Nesnenin yaz� tipi �zellikleri');
    Add('propFooterAfterEach', 'Sayfa alt� band�n�n her bir veri sat�r�ndan sonra g�sterilmesine olanak sa�lar');
    Add('propFormatStr', 'Yaz� bi�imi');
    Add('propFrame', 'Nesnenin �er�eve �zellikleri');
    Add('propGapX', 'Metnin soldan b�rak�lacak bo�lu�u');
    Add('propGapY', 'Metnin �stten b�rak�lacak bo�lu�u');
    Add('propGlyph', 'Nesne resmi');
    Add('propGroupIndex', 'Speed button''lar�n bir grup olarak �al��abilmesine olanak sa�lar');
    Add('propHAlign', 'Metnin yatay hizalamas�');
    Add('propHeight', 'Nesnenin y�ksekli�i');
    Add('propHGuides', 'Sayfan�n yatay k�lavuz �izgileri');
    Add('propHideZeros', 'Metin nesnelerinde SIFIR de�erinin g�sterilip g�sterilmeyece�ini belirler');
    Add('propHighlight', 'Ko�ula ba�l� vurgu �zellikleri');
    Add('propIndexName', 'Indeks ad�');
    Add('propInitString', 'Nokta-vuru�lu raporlar i�in yaz�c� ba�lang�� metni');
    Add('propItems', 'Nesnenin madde listesi');
    Add('propKeepAspectRatio', 'Resmin orjinal g�r�n�m oran�n� korur');
    Add('propKeepChild', 'Band''�n �ocuklar� ile birlikte yazd�r�lmas�na olanak sa�lar');
    Add('propKeepFooter', 'Band''�n alt ba�l�klar� ile birlikte yazd�r�lmas�na olanak sa�lar');
    Add('propKeepHeader', 'Determines whether the band will be printed together with its header');
    Add('propKeepTogether', 'Band''�n t�m altband''larla birlikte yazd�r�lmas�na olanak sa�lar');
    Add('propKind.TfrxFormat', 'Bi�imlendirme �ekli');
    Add('propKind', 'Button �ekli');
    Add('propLargeDesignHeight', 'Dizayn a�amas�nda sayfalar�n b�y�k uzunlukta olmas�na olanak sa�lar');
    Add('propLayout', 'Button resminin alan�');
    Add('propLeft', 'Nesnenin sol koordinat�');
    Add('propLeftMargin', 'Sayfa sol bo�lu�u');
    Add('propLines', 'Nesnenin metni');
    Add('propLineSpacing', '�ki sat�r aras�ndaki pixel say�s�');
    Add('propLoginPrompt', 'Ba�lanma ekran�n�n g�r�n�p g�r�nmemesini sa�lar');
    Add('propMargin', 'Button kenar �izgisi ile resim kenar �izgisi aras�ndaki pixel say�s�');
    Add('propMaster', 'As�l dataset');
    Add('propMasterFields', 'As�l-Detay ili�kisinde ba�lanacak sahalar');
    Add('propMaximized', '�nizleme penceresinin tam ekran a��lmas�n� sa�lar');
    Add('propMaxLength', 'Metnin maksimum uzunlu�u');
    Add('propMaxPages', 'Haz�rlanm�� raporun maksimum sayfa say�s�');
    Add('propMaxWidth', 'Kolonun maksimum geni�li�i');
    Add('propMDIChild', '�nizleme penceresinin i� pencere olarak a��lmas�n� sa�lar');
    Add('propMemo', 'Nesnenin metni');
    Add('propMinWidth', 'Kolonun minimum geni�li�i');
    Add('propMirrorMargins', '�ift sayfalara ayn� sayfa ayarlar�n� yans�t�r');
    Add('propModal', '�nizleme penceresinin en �stte a��lmas�n� sa�lar');
    Add('propModalResult', 'En �stteki pencere button ile kapat�ld���nda d�nd�r�len de�er');
    Add('propName.TFont', 'Yaz� tipinin ad�');
    Add('propName.TfrxReportOptions', 'Raporun ad�');
    Add('propName', 'Nesnenin ad�');
    Add('propNumGlyphs', 'Glyph �zelli�indeki kendine ait grafi�in i�indeki resim say�s�n� belirler');
    Add('propOpenDataSource', 'Datasource''nin otomatik a��l�p a��lmayaca��n� belirler');
    Add('propOrientation', 'Sayfa y�nlendirmesi');
    Add('propOutlineText', '�nizleme penceresinde ana hat i�inde g�sterilecek olan metin');
    Add('propOutlineVisible', '�nizleme penceresinin ana hatt�n�n g�r�n�rl���');
    Add('propOutlineWidth', '�nizleme penceresinin ana hatt�n�n geni�li�i');
    Add('propPageNumbers.TfrxPrintOptions', 'Yazd�r�lacak sayfa say�s�');
    Add('propPaperHeight', 'Sayfa y�ksekli�i');
    Add('propPaperWidth', 'Sayfa geni�li�i');
    Add('propParagraphGap', 'Paragraf ba�� girintisi');
    Add('propParams.TfrxBDEDatabase', 'Ba�lant� parametreleri');
    Add('propParams', 'Sorgu parametreleri');
    Add('propParentFont', 'Nesnenin, �zerinde bulundu�u nesnenin yaz� tipini kullan�p kulanmayaca��n� belirler');
    Add('propPassword', 'Rapor �ifresi');
    Add('propPasswordChar', '�ifre karakteri. Girilen karakterlerin her birinin bu �ekilde g�sterilmesini sa�lar');
    Add('propPicture', 'Resim');
    Add('propPicture.TfrxReportOptions', 'Raporun a��klama resmi');
    Add('propPosition', 'Pencerenin ba�lang�� pozisyonu');
    Add('propPreviewOptions', 'Raporun �nizleme �zellikleri');
    Add('propPrintable', 'Nesnenin yaz�labilirli�i. E�er "False" olarak i�aretlenmi�se nesneler g�r�nt�lenir ama yazd�r�lmaz');
    Add('propPrintChildIfInvisible', '�zerinde bulundu�u band�n g�r�nmez oldu�u durumda, �ocuk band�n yazd�r�lmas�na olanak sa�lar');
    Add('propPrinter', 'Bu rapor a��ld���nda veya �al��t�r�ld���nda se�ili olacak yaz�c�n�n ad�');
    Add('propPrintIfDetailEmpty', 'Altband''� bo� olan band''lar�n yazd�r�lmas�na olanak sa�lar');
    Add('propPrintIfEmpty', 'T�m Dataset''ler bo� olsa bile sayfan�n yazd�r�lmas�n� sa�lar');
    Add('propPrintOnFirstPage', 'Band''�n ilk sayfada yazd�r�lmas�n� sa�lar');
    Add('propPrintOnLastPage', 'Band''�n son sayfada yazd�r�lmas�n� sa�lar');
    Add('propPrintOnParent', 'Altraporun, �zerinde bulundu�u band''da yazd�r�lmas�n� sa�lar');
    Add('propPrintOnPreviousPage', 'Sayfan�n, daha �nce olu�turulmu� olan sayfalar�n bo�lu�unda olu�turulmas�n� sa�lar');
    Add('propPrintOptions', 'Raporun yazd�rma ayarlar�');
    Add('propPrintPages', 'Tek, �ift veya T�m sayfalar�n yazd�r�lmas�n� sa�lar');
    Add('propRangeBegin', 'Dataset''teki gezintinin ba�lad��� nokta');
    Add('propRangeEnd', 'Dataset''teki gezintinin bitti�i nokta');
    Add('propRangeEndCount', '"RangeEnd", "reCount" oldu�unda; Dataset''ten okunacak kay�t say�s�');
    Add('propReadOnly', 'Metin nesnesinin Salt-Okunur olup olmamas�n� sa�lar');
    Add('propRepeatHeaders', 'Sat�r ve Kolon ba�l�klar�n�n her sayfada tekrar yaz�l�p yaz�lmayaca��n� belirler');
    Add('propReportOptions', 'Rapor se�enekleri');
    Add('propReprintOnNewPage', 'Band''�n her sayfada tekrar yaz�l�p yaz�lmayaca��n� belirler');
    Add('propRestrictions', 'K�s�tlama ayarlar�');
    Add('propRightMargin', 'Sayfa sa� bo�lu�u');
    Add('propRotation.TfrxBarCodeView', 'Barkod y�nlendirmesi');
    Add('propRotation', 'Metin d�nd�rme a��s�');
    Add('propRowCount', 'Band''daki ger�ek kay�t say�s�');
    Add('propRowFields', 'Sat�r� temsil eden sahan�n ad�');
    Add('propRowLevels', 'Sat�r seviyelerinin say�s�');
    Add('propRTLReading', 'Metin nesnelerinin yaz�lar�n�n sa�dan sola do�ru g�r�nt�lenmesini sa�lar');
    Add('propScriptLanguage', 'Raporda kullan�lan "Script" dilinin ad�');
    Add('propSessionName', 'BDE oturum ad�');
    Add('propShadowColor', 'G�lge rengi');
    Add('propShadowWidth', 'G�lge geni�li�i');
    Add('propShape', '�ekil nesnesinin bi�imi');
    Add('propShiftMode', 'Nesnenin kayd�rma durumu');
    Add('propShowCaptions', '�nizleme penceresindeki button''lar�n etiketleriyle birlikte g�r�nt�lenip g�r�nt�lenmemesini sa�lar');
    Add('propShowColumnHeader', 'Kolon ba�l�klar�n�n g�r�nt�lenip g�r�nt�lenmemesini sa�lar');
    Add('propShowColumnTotal', 'Kolon genel toplam�n�n g�r�nt�lenip g�r�nt�lenmemesini sa�lar');
    Add('propShowRowHeader', 'Sat�r ba�l�klar�n�n g�r�nt�lenip g�r�nt�lenmemesini sa�lar');
    Add('propShowRowTotal', 'Sat�r genel toplam�n�n g�r�nt�lenip g�r�nt�lenmemesini sa�lar');
    Add('propShowDialog', '�nizleme penceresinde yazd�rma penceresinin g�r�nt�lenip g�r�nt�lenmemesini sa�lar');
    Add('propShowText', 'Barkod nesnelerindeki okunabilir yaz�n�n g�r�nt�lenip g�r�nt�lenmemesini sa�lar');
    Add('propSize', 'Yaz� tipi boyu');
    Add('propSorted', 'Maddelerin s�ralan�p s�ralanmamas�n� sa�lar');
    Add('propSpacing', 'Metin ile resim aras�ndaki pixel say�s�');
    Add('propSQL', 'SQL c�mleci�i');
    Add('propStartNewPage', 'Band''� yazd�rmadan �nce yeni sayfaya ba�lar');
    Add('propStretch', 'Resmi, nesnenin boyutlar�na uzat�r');
    Add('propStretched', 'Nesnenin uzat�labilmesine olanak sa�lar');
    Add('propStretchMode', 'Nesnenin uzat�labilirlili�i');
    Add('propStyle.TFont', 'Yaz� tipi bi�imi');
    Add('propStyle', 'Nesne bi�imi');
    Add('propStyle.TfrxFrame', 'Nesnenin �er�eve bi�imi');
    Add('propSuppressRepeated', 'Tekrarlanan de�erlerin gizlenmesini sa�lar');
    Add('propTableName', 'Veri tablosunun ad�');
    Add('propTag', 'Nesnenin Tag''�n�n rakamsal de�eri');
    Add('propTagStr', 'Nesnenin Tag''�n�n metin de�eri');
    Add('propText', 'Nesnenin metni');
    Add('propTitleBeforeHeader', 'Sayfa ba�l���ndan �nce rapor ba�l���n�n g�r�nt�lenip g�r�nt�lemece�ini belirler');
    Add('propTop', 'Nesnenin �st koordinat�');
    Add('propTopMargin', 'Sayfa �st bo�lu�u');
    Add('propTyp', '�er�eve �ekli');
    Add('propUnderlines', 'Metin nesnelerinde her bir sat�r�n alt�n� �izer');
    Add('propURL', 'Nesnenin kayna��');
    Add('propUserName', 'Veri nesnesinin kullan�c� ad�. Bu isim veri a�ac�nda g�r�necektir');
    Add('propVAlign', 'Metnin dikey hizalamas�');
    Add('propVersionBuild', 'Versiyon bilgisi, derleme');
    Add('propVersionMajor', 'Versiyon bilgisi, as�l versiyon');
    Add('propVersionMinor', 'Versiyon bilgisi, alt versiyon');
    Add('propVersionRelease', 'Versiyon bilgisi, sunum');
    Add('propVGuides', 'Sayfan�n dikey k�lavuz �izgileri');
    Add('propVisible', 'Nesnenin g�r�nebilirlili�i');
    Add('propWidth', 'Nesnenin geni�li�i');
    Add('propWidth.TfrxFrame', '�er�evenin geni�li�i');
    Add('propWindowState', 'Pencerenin ba�lang�� durumu');
    Add('propWordBreak', 'Rus�a kelimeleri kes');
    Add('propWordWrap', 'S��mayan kelimeleri alt sat�ra kayd�r�r');
    Add('propZoom.TfrxBarCodeView', 'Barkodu yak�nla�t�r�r');
    Add('propZoom', '�nizleme penceresinin ba�lang�� yak�nla�t�rma de�eri');
    Add('propZoomMode', '�nizleme penceresinin ba�lang�� yak�nla�t�rma �ekli');
 end;
end;

initialization
  frAddInspectorRes;

end.
