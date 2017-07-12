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
    Add('propActive', 'Dataset''in açýk olup olmadýðýný belirler');
    Add('propActive.TfrxHighlight', 'Specifies whether or not a highlight is active');
    Add('propAliasName', 'BDE''nin görünen adý');
    Add('propAlign', 'Bir band veya sayfaya baðlý nesnelerin düzenini belirler');
    Add('propAlignment', 'Nesnenin metninin hizasý');
    Add('propAllowAllUp', 'Grup içindeki tüm Speed Button''larýnýn ayný anda seçilmesine olanak saðlar');
    Add('propAllowEdit', 'Kullanýcýnýn hazýrlanmýþ rapor sayfalarýný düzenlemesine olanak saðlar');
    Add('propAllowExpressions', 'Metin nesnelerinin anlatým ifadeleri içermelerine olanak saðlar');
    Add('propAllowGrayed', 'CheckBox''larýn durumunun gri olmasýna izin verir');
    Add('propAllowHTMLTags', 'Metin nesnelerinin HTML kodu içermelerine olanak saðlar');
    Add('propAllowSplit', 'Bir sayfaya sýðmayan, bir sayfadan daha uzun metinlerin, bölünerek birden fazla sayfada gösterilmesine olanak saðlar');
    Add('propAuthor', 'Raporun yazarý');
    Add('propAutoSize', 'Resimlerin otomatik ölçülendirilmesine olanak saðlar');
    Add('propAutoWidth', 'Metin nesnelerinin geniþliklerinin otomatik ölçülendirilmesine olanak saðlar');
    Add('propBackPicture', 'Sayfa arkaplan resmi');
    Add('propBarType', 'Barkod tipi');
    Add('propBevelInner', 'Bevel''in iç tipi');
    Add('propBevelOuter', 'Bevel''in dýþ tipi');
    Add('propBevelWidth', 'Bevel''in geniþliði');
    Add('propBorder', 'Dýþ çerçeve çizgilerinin görünmesine olanak saðlar');
    Add('propBorderStyle', 'Pencerenin stili');
    Add('propBottomMargin', 'Sayfa alt boþluðunun ölçüsü');
    Add('propBrushStyle', 'Nesnelerin arkaplanýnda kullanýlan fýrçanýn stili');
    Add('propButtons', 'Önizleme penceresindeki düðmelerin görünürlüðünü ayarlar');
    Add('propCacheSize', 'Rapor motorunun kullandýðý maksimum bellek. Eðer bellek kullanýmý bu deðeri aþarsa, hazýrlanmýþ sayfalar disk dosyasý olarak yedeklenecektir.');
    Add('propCalcCheckSum', 'Barkod''un kontrol rakamýný otomatik olarak hesaplayabilesine olanak saðlar');
    Add('propCancel', 'ESC tuþuna basýldýðýnda button''un aktif olmasýna olanak saðlar');
    Add('propCaption', 'Nesnenin baþlýðý');
    Add('propCellFields', 'Hücreyi temsil eden sahanýn adý');
    Add('propCellLevels', 'Hücre sayýsý');
    Add('propCenter', 'Resmin nesneyi ortalamasýna olanak saðlar');
    Add('propCharset', 'Yazý tipi seti');
    Add('propCharSpacing', 'Ýki karakter arasýndaki Pixel sayýsý');
    Add('propCheckColor', 'Onay iþaretinin rengi');
    Add('propChecked', 'Nesnenin iþaretli olduðunu belirtir');
    Add('propCheckStyle', 'Onay iþaretinin stili');
    Add('propChild', 'Çocuk band bu banda baðlandý');
    Add('propCollate', 'Varsayýlan düzenleme ayarlarý');
    Add('propColor.TFont', 'Yazý rengi');
    Add('propColor', 'Nesne rengi');
    Add('propColor.TfrxFrame', 'Çerçeve rengi');
    Add('propColor.TfrxHighlight', 'Vurgu rengi aktif olduðunda Nesne rengini belirler');
    Add('propColumnFields', 'Kolonlarý temsil eden sahanýn adý');
    Add('propColumnGap', 'Band kolonlarý arasýndaki boþluk');
    Add('propColumnLevels', 'Kolon seviyelerinin sayýsý');
    Add('propColumns', 'Band''ýn içindeki kolonlarýn sayýsý');
    Add('propColumnWidth', 'Band kolonunun geniþliði');
    Add('propCondition', 'Gruplama durumu. Eðer bu ifadenin deðeri deðiþirse, grup iptal olacaktýr');
    Add('propCondition.TfrxHighlight', 'Ýfade metni. Eðer bu ifade "True" ise, vurgu aktif olacaktýr');
    Add('propConnected', 'Veritabanýnýn açýk olup olmadýðýný belirler');
    Add('propConvertNulls', 'Veritabanýndaki boþ sahalarýn 0, "False" veya <boþ> ifadelerine dönüþtürmesine olanak saðlar');
    Add('propCopies', 'Varsayýlan kopya sayýsý');
    Add('propCursor', 'Farenin nesne üstündeki þekli');
    Add('propDatabaseName', 'Veritabanýnýn adý');
    Add('propDataField', 'Nesneye baðlanan veritabaný sahasý');
    Add('propDataSet', 'Nesneye baðlanan, veritabaný sahalarýný içeren veri tablosu');
    Add('propDate', 'Nesnenin tarih deðeri');
    Add('propDateFormat', 'Tarih formatý');
    Add('propDecimalSeparator', 'Ondalýk ayracý');
    Add('propDefault', 'ENTER tuþuna basýldýðýnda button''un aktif olmasýna olanak saðlar');
    Add('propDefHeight', 'Varsayýlan satýr yüksekliði');
    Add('propDescription', 'Rapor açýklamasý');
    Add('propDiagonal', 'Çizgilerin çapraz olmasýna olanak saðlar');
    Add('propDisplayFormat', 'Görünen deðerin formatý');
    Add('propDoubleBuffered', 'Önizleme penceresinin çift buffer kullanmasýný saðlar. Eðer çift buffer özelliði açýlýrsa titreþim önlenir, ama yavaþlar');
    Add('propDoublePass', 'Rapor motorunun ikinci geçiþ yapýp yapmamasýný belirler');
    Add('propDown', 'Speed Button''un basýlý olup olmadýðýný belirler');
    Add('propDownThenAcross', 'Büyük tablonun ne þekilde parçalara ayrýlacaðýný belirler');
    Add('propDriverName', 'BDE sürücüsünün adý');
    Add('propDropShadow', 'Nesnelerin gölgesinin olup olmadýðýný belirler');
    Add('propDuplex', 'Sayfanýn çift yönlü kullanýlmasýný saðlar');
    Add('propEditMask', 'Metin nesnesi için geçerli olan format þekli');
    Add('propEnabled', 'Nesnenin kullanýlabilir olup olmadýðýný belirler');
    Add('propEngineOptions', 'Raporun motor seçenekleri');
    Add('propExpression', 'Nesnede gösterilecek ifade');
    Add('propExpressionDelimiters', 'Nesnenin içindeki ifadeyi ayýrmak için kullanacak ayraç');
    Add('propFieldAliases', 'Sahanýn görünen adý');
    Add('propFilter', 'Dataset''in filitre koþulu');
    Add('propFiltered', 'Dataset''in filitre özelliðindeki koþul kullanýlarak kayýtlarýn filtrelenmesine olanak saðlar');
    Add('propFlowTo', 'Sýðmayan metnin üzerinde gösterileceði nesne');
    Add('propFont', 'Nesnenin yazý tipi özellikleri');
    Add('propFooterAfterEach', 'Sayfa altý bandýnýn her bir veri satýrýndan sonra gösterilmesine olanak saðlar');
    Add('propFormatStr', 'Yazý biçimi');
    Add('propFrame', 'Nesnenin çerçeve özellikleri');
    Add('propGapX', 'Metnin soldan býrakýlacak boþluðu');
    Add('propGapY', 'Metnin üstten býrakýlacak boþluðu');
    Add('propGlyph', 'Nesne resmi');
    Add('propGroupIndex', 'Speed button''larýn bir grup olarak çalýþabilmesine olanak saðlar');
    Add('propHAlign', 'Metnin yatay hizalamasý');
    Add('propHeight', 'Nesnenin yüksekliði');
    Add('propHGuides', 'Sayfanýn yatay kýlavuz çizgileri');
    Add('propHideZeros', 'Metin nesnelerinde SIFIR deðerinin gösterilip gösterilmeyeceðini belirler');
    Add('propHighlight', 'Koþula baðlý vurgu özellikleri');
    Add('propIndexName', 'Indeks adý');
    Add('propInitString', 'Nokta-vuruþlu raporlar için yazýcý baþlangýç metni');
    Add('propItems', 'Nesnenin madde listesi');
    Add('propKeepAspectRatio', 'Resmin orjinal görünüm oranýný korur');
    Add('propKeepChild', 'Band''ýn çocuklarý ile birlikte yazdýrýlmasýna olanak saðlar');
    Add('propKeepFooter', 'Band''ýn alt baþlýklarý ile birlikte yazdýrýlmasýna olanak saðlar');
    Add('propKeepHeader', 'Determines whether the band will be printed together with its header');
    Add('propKeepTogether', 'Band''ýn tüm altband''larla birlikte yazdýrýlmasýna olanak saðlar');
    Add('propKind.TfrxFormat', 'Biçimlendirme þekli');
    Add('propKind', 'Button þekli');
    Add('propLargeDesignHeight', 'Dizayn aþamasýnda sayfalarýn büyük uzunlukta olmasýna olanak saðlar');
    Add('propLayout', 'Button resminin alaný');
    Add('propLeft', 'Nesnenin sol koordinatý');
    Add('propLeftMargin', 'Sayfa sol boþluðu');
    Add('propLines', 'Nesnenin metni');
    Add('propLineSpacing', 'Ýki satýr arasýndaki pixel sayýsý');
    Add('propLoginPrompt', 'Baðlanma ekranýnýn görünüp görünmemesini saðlar');
    Add('propMargin', 'Button kenar çizgisi ile resim kenar çizgisi arasýndaki pixel sayýsý');
    Add('propMaster', 'Asýl dataset');
    Add('propMasterFields', 'Asýl-Detay iliþkisinde baðlanacak sahalar');
    Add('propMaximized', 'Önizleme penceresinin tam ekran açýlmasýný saðlar');
    Add('propMaxLength', 'Metnin maksimum uzunluðu');
    Add('propMaxPages', 'Hazýrlanmýþ raporun maksimum sayfa sayýsý');
    Add('propMaxWidth', 'Kolonun maksimum geniþliði');
    Add('propMDIChild', 'Önizleme penceresinin iç pencere olarak açýlmasýný saðlar');
    Add('propMemo', 'Nesnenin metni');
    Add('propMinWidth', 'Kolonun minimum geniþliði');
    Add('propMirrorMargins', 'Çift sayfalara ayný sayfa ayarlarýný yansýtýr');
    Add('propModal', 'Önizleme penceresinin en üstte açýlmasýný saðlar');
    Add('propModalResult', 'En üstteki pencere button ile kapatýldýðýnda döndürülen deðer');
    Add('propName.TFont', 'Yazý tipinin adý');
    Add('propName.TfrxReportOptions', 'Raporun adý');
    Add('propName', 'Nesnenin adý');
    Add('propNumGlyphs', 'Glyph özelliðindeki kendine ait grafiðin içindeki resim sayýsýný belirler');
    Add('propOpenDataSource', 'Datasource''nin otomatik açýlýp açýlmayacaðýný belirler');
    Add('propOrientation', 'Sayfa yönlendirmesi');
    Add('propOutlineText', 'Önizleme penceresinde ana hat içinde gösterilecek olan metin');
    Add('propOutlineVisible', 'Önizleme penceresinin ana hattýnýn görünürlüðü');
    Add('propOutlineWidth', 'Önizleme penceresinin ana hattýnýn geniþliði');
    Add('propPageNumbers.TfrxPrintOptions', 'Yazdýrýlacak sayfa sayýsý');
    Add('propPaperHeight', 'Sayfa yüksekliði');
    Add('propPaperWidth', 'Sayfa geniþliði');
    Add('propParagraphGap', 'Paragraf baþý girintisi');
    Add('propParams.TfrxBDEDatabase', 'Baðlantý parametreleri');
    Add('propParams', 'Sorgu parametreleri');
    Add('propParentFont', 'Nesnenin, üzerinde bulunduðu nesnenin yazý tipini kullanýp kulanmayacaðýný belirler');
    Add('propPassword', 'Rapor þifresi');
    Add('propPasswordChar', 'Þifre karakteri. Girilen karakterlerin her birinin bu þekilde gösterilmesini saðlar');
    Add('propPicture', 'Resim');
    Add('propPicture.TfrxReportOptions', 'Raporun açýklama resmi');
    Add('propPosition', 'Pencerenin baþlangýç pozisyonu');
    Add('propPreviewOptions', 'Raporun önizleme özellikleri');
    Add('propPrintable', 'Nesnenin yazýlabilirliði. Eðer "False" olarak iþaretlenmiþse nesneler görüntülenir ama yazdýrýlmaz');
    Add('propPrintChildIfInvisible', 'Üzerinde bulunduðu bandýn görünmez olduðu durumda, çocuk bandýn yazdýrýlmasýna olanak saðlar');
    Add('propPrinter', 'Bu rapor açýldýðýnda veya çalýþtýrýldýðýnda seçili olacak yazýcýnýn adý');
    Add('propPrintIfDetailEmpty', 'Altband''ý boþ olan band''larýn yazdýrýlmasýna olanak saðlar');
    Add('propPrintIfEmpty', 'Tüm Dataset''ler boþ olsa bile sayfanýn yazdýrýlmasýný saðlar');
    Add('propPrintOnFirstPage', 'Band''ýn ilk sayfada yazdýrýlmasýný saðlar');
    Add('propPrintOnLastPage', 'Band''ýn son sayfada yazdýrýlmasýný saðlar');
    Add('propPrintOnParent', 'Altraporun, üzerinde bulunduðu band''da yazdýrýlmasýný saðlar');
    Add('propPrintOnPreviousPage', 'Sayfanýn, daha önce oluþturulmuþ olan sayfalarýn boþluðunda oluþturulmasýný saðlar');
    Add('propPrintOptions', 'Raporun yazdýrma ayarlarý');
    Add('propPrintPages', 'Tek, Çift veya Tüm sayfalarýn yazdýrýlmasýný saðlar');
    Add('propRangeBegin', 'Dataset''teki gezintinin baþladýðý nokta');
    Add('propRangeEnd', 'Dataset''teki gezintinin bittiði nokta');
    Add('propRangeEndCount', '"RangeEnd", "reCount" olduðunda; Dataset''ten okunacak kayýt sayýsý');
    Add('propReadOnly', 'Metin nesnesinin Salt-Okunur olup olmamasýný saðlar');
    Add('propRepeatHeaders', 'Satýr ve Kolon baþlýklarýnýn her sayfada tekrar yazýlýp yazýlmayacaðýný belirler');
    Add('propReportOptions', 'Rapor seçenekleri');
    Add('propReprintOnNewPage', 'Band''ýn her sayfada tekrar yazýlýp yazýlmayacaðýný belirler');
    Add('propRestrictions', 'Kýsýtlama ayarlarý');
    Add('propRightMargin', 'Sayfa sað boþluðu');
    Add('propRotation.TfrxBarCodeView', 'Barkod yönlendirmesi');
    Add('propRotation', 'Metin döndürme açýsý');
    Add('propRowCount', 'Band''daki gerçek kayýt sayýsý');
    Add('propRowFields', 'Satýrý temsil eden sahanýn adý');
    Add('propRowLevels', 'Satýr seviyelerinin sayýsý');
    Add('propRTLReading', 'Metin nesnelerinin yazýlarýnýn saðdan sola doðru görüntülenmesini saðlar');
    Add('propScriptLanguage', 'Raporda kullanýlan "Script" dilinin adý');
    Add('propSessionName', 'BDE oturum adý');
    Add('propShadowColor', 'Gölge rengi');
    Add('propShadowWidth', 'Gölge geniþliði');
    Add('propShape', 'Þekil nesnesinin biçimi');
    Add('propShiftMode', 'Nesnenin kaydýrma durumu');
    Add('propShowCaptions', 'Önizleme penceresindeki button''larýn etiketleriyle birlikte görüntülenip görüntülenmemesini saðlar');
    Add('propShowColumnHeader', 'Kolon baþlýklarýnýn görüntülenip görüntülenmemesini saðlar');
    Add('propShowColumnTotal', 'Kolon genel toplamýnýn görüntülenip görüntülenmemesini saðlar');
    Add('propShowRowHeader', 'Satýr baþlýklarýnýn görüntülenip görüntülenmemesini saðlar');
    Add('propShowRowTotal', 'Satýr genel toplamýnýn görüntülenip görüntülenmemesini saðlar');
    Add('propShowDialog', 'Önizleme penceresinde yazdýrma penceresinin görüntülenip görüntülenmemesini saðlar');
    Add('propShowText', 'Barkod nesnelerindeki okunabilir yazýnýn görüntülenip görüntülenmemesini saðlar');
    Add('propSize', 'Yazý tipi boyu');
    Add('propSorted', 'Maddelerin sýralanýp sýralanmamasýný saðlar');
    Add('propSpacing', 'Metin ile resim arasýndaki pixel sayýsý');
    Add('propSQL', 'SQL cümleciði');
    Add('propStartNewPage', 'Band''ý yazdýrmadan önce yeni sayfaya baþlar');
    Add('propStretch', 'Resmi, nesnenin boyutlarýna uzatýr');
    Add('propStretched', 'Nesnenin uzatýlabilmesine olanak saðlar');
    Add('propStretchMode', 'Nesnenin uzatýlabilirliliði');
    Add('propStyle.TFont', 'Yazý tipi biçimi');
    Add('propStyle', 'Nesne biçimi');
    Add('propStyle.TfrxFrame', 'Nesnenin çerçeve biçimi');
    Add('propSuppressRepeated', 'Tekrarlanan deðerlerin gizlenmesini saðlar');
    Add('propTableName', 'Veri tablosunun adý');
    Add('propTag', 'Nesnenin Tag''ýnýn rakamsal deðeri');
    Add('propTagStr', 'Nesnenin Tag''ýnýn metin deðeri');
    Add('propText', 'Nesnenin metni');
    Add('propTitleBeforeHeader', 'Sayfa baþlýðýndan önce rapor baþlýðýnýn görüntülenip görüntülemeceðini belirler');
    Add('propTop', 'Nesnenin üst koordinatý');
    Add('propTopMargin', 'Sayfa üst boþluðu');
    Add('propTyp', 'Çerçeve þekli');
    Add('propUnderlines', 'Metin nesnelerinde her bir satýrýn altýný çizer');
    Add('propURL', 'Nesnenin kaynaðý');
    Add('propUserName', 'Veri nesnesinin kullanýcý adý. Bu isim veri aðacýnda görünecektir');
    Add('propVAlign', 'Metnin dikey hizalamasý');
    Add('propVersionBuild', 'Versiyon bilgisi, derleme');
    Add('propVersionMajor', 'Versiyon bilgisi, asýl versiyon');
    Add('propVersionMinor', 'Versiyon bilgisi, alt versiyon');
    Add('propVersionRelease', 'Versiyon bilgisi, sunum');
    Add('propVGuides', 'Sayfanýn dikey kýlavuz çizgileri');
    Add('propVisible', 'Nesnenin görünebilirliliði');
    Add('propWidth', 'Nesnenin geniþliði');
    Add('propWidth.TfrxFrame', 'Çerçevenin geniþliði');
    Add('propWindowState', 'Pencerenin baþlangýç durumu');
    Add('propWordBreak', 'Rusça kelimeleri kes');
    Add('propWordWrap', 'Sýðmayan kelimeleri alt satýra kaydýrýr');
    Add('propZoom.TfrxBarCodeView', 'Barkodu yakýnlaþtýrýr');
    Add('propZoom', 'Önizleme penceresinin baþlangýç yakýnlaþtýrma deðeri');
    Add('propZoomMode', 'Önizleme penceresinin baþlangýç yakýnlaþtýrma þekli');
 end;
end;

initialization
  frAddInspectorRes;

end.
