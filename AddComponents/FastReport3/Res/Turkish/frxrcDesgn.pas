
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

unit frxrcDesgn;

interface

procedure frAddDesignerRes;


implementation

uses frxRes;


procedure frAddDesignerRes;
begin
  with frxResources do
  begin
    Add('TfrxObjectInspector',
      'Caption=Nesne Yöneticisi' + #13#10 +
      '');
    Add('oiProp', 'Özellikler');
    Add('oiEvent', 'Olaylar');

    Add('TfrxDataTreeForm',
      'Caption=Veri Aðacý' + #13#10 +
      'DataTS.Caption=Veri' + #13#10 +
      'VariablesTS.Caption=Deðiþkenler' + #13#10 +
      'FunctionsTS.Caption=Fonksiyonlar' + #13#10 +
      'InsFieldCB.Caption=Saha oluþtur' + #13#10 +
      'InsCaptionCB.Caption=Etiket oluþtur' + #13#10 +
      '');
    Add('dtNoData', 'Kullanýlabilir veri yok');
    Add('dtData', 'Veri');
    Add('dtSysVar', 'Sistem deðiþkenleri');
    Add('dtVar', 'Deðiþkenler');
    Add('dtFunc', 'Fonksiyonlar');

    Add('TfrxReportTreeForm',
      'Caption=Rapor Aðacý' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Script Dosyasý Aç' + #13#10 +
      'SaveScriptB.Hint=Script Dosyasýný Kaydet' + #13#10 +
      'RunScriptB.Hint=Script Çalýþtýr' + #13#10 +
      'StepScriptB.Hint=Ýçe gir' + #13#10 +
      'StopScriptB.Hint=Script sonlandýr' + #13#10 +
      'EvaluateB.Hint=Deðerlendirme' + #13#10 +
      'LangL.Caption=Dil:' + #13#10 +
      'AlignTB.Caption=Hizalama' + #13#10 +
      'AlignLeftsB.Hint=Sola Hizala' + #13#10 +
      'AlignHorzCentersB.Hint=Ortala' + #13#10 +
      'AlignRightsB.Hint=Saða Hizala' + #13#10 +
      'AlignTopsB.Hint=Üste Hizala' + #13#10 +
      'AlignVertCentersB.Hint=Ortala' + #13#10 +
      'AlignBottomsB.Hint=Alta Hizala' + #13#10 +
      'SpaceHorzB.Hint=Yatay Boþluk' + #13#10 +
      'SpaceVertB.Hint=Dikey Boþluk' + #13#10 +
      'CenterHorzB.Hint=Bandýn Ýçinde Yatay Ortala' + #13#10 +
      'CenterVertB.Hint=Bandýn Ýçinde Dikey Ortala' + #13#10 +
      'SameWidthB.Hint=Ayný Geniþlik' + #13#10 +
      'SameHeightB.Hint=Ayný Yükseklik' + #13#10 +
      'TextTB.Caption=Metin' + #13#10 +
      'StyleCB.Hint=Biçim' + #13#10 +
      'FontNameCB.Hint=Yazý Tipi Adý' + #13#10 +
      'FontSizeCB.Hint=Yazý Tipi Büyüklüðü' + #13#10 +
      'BoldB.Hint=Kalýn' + #13#10 +
      'ItalicB.Hint=Ýtalik' + #13#10 +
      'UnderlineB.Hint=Altý Çizgili' + #13#10 +
      'FontColorB.Hint=Yazý Rengi' + #13#10 +
      'HighlightB.Hint=Vurgu' + #13#10 +
      'RotateB.Hint=Metin Döndürme Açýsý' + #13#10 +
      'TextAlignLeftB.Hint=Sola Hizala' + #13#10 +
      'TextAlignCenterB.Hint=Ortala' + #13#10 +
      'TextAlignRightB.Hint=Saða Hizala' + #13#10 +
      'TextAlignBlockB.Hint=Ýki Yana Hizala' + #13#10 +
      'TextAlignTopB.Hint=Üste Hizala' + #13#10 +
      'TextAlignMiddleB.Hint=Ortala' + #13#10 +
      'TextAlignBottomB.Hint=Alta Hizala' + #13#10 +
      'FrameTB.Caption=Çerçeve' + #13#10 +
      'FrameTopB.Hint=Üst Çizgi' + #13#10 +
      'FrameBottomB.Hint=Alt Çizgi' + #13#10 +
      'FrameLeftB.Hint=Sol Çizgi' + #13#10 +
      'FrameRightB.Hint=Sað Çizgi' + #13#10 +
      'FrameAllB.Hint=Tüm Çerçeve Çizgileri' + #13#10 +
      'FrameNoB.Hint=Çerçeve Yok' + #13#10 +
      'ShadowB.Hint=Gölge' + #13#10 +
      'FillColorB.Hint=Arkaplan Rengi' + #13#10 +
      'FrameColorB.Hint=Çerçeve Rengi' + #13#10 +
      'FrameStyleB.Hint=Çerçeve Biçimi' + #13#10 +
      'FrameWidthCB.Hint=Çerçeve Geniþliði' + #13#10 +
      'StandardTB.Caption=Standart' + #13#10 +
      'NewB.Hint=Yeni Rapor' + #13#10 +
      'OpenB.Hint=Rapor Aç' + #13#10 +
      'SaveB.Hint=Rapor Kaydet' + #13#10 +
      'PreviewB.Hint=Önizleme' + #13#10 +
      'NewPageB.Hint=Yeni Rapor Sayfasý' + #13#10 +
      'NewDialogB.Hint=Yeni Diyalog Sayfasý' + #13#10 +
      'DeletePageB.Hint=Sayfa Sil' + #13#10 +
      'PageSettingsB.Hint=Sayfa Ayarlarý' + #13#10 +
      'VariablesB.Hint=Deðiþkenler' + #13#10 +
      'CutB.Hint=Kes' + #13#10 +
      'CopyB.Hint=Kopyala' + #13#10 +
      'PasteB.Hint=Yapýþtýr' + #13#10 +
      'SampleFormatB.Hint=Biçim Kopyalama' + #13#10 +
      'UndoB.Hint=Geri Al' + #13#10 +
      'RedoB.Hint=Yenile' + #13#10 +
      'ShowGridB.Hint=Çizgileri Göster' + #13#10 +
      'AlignToGridB.Hint=Çizgilere Hizala' + #13#10 +
      'SetToGridB.Hint=Çizgilere Sýðdýr' + #13#10 +
      'ScaleCB.Hint=Yakýnlaþtýr' + #13#10 +
      'ExtraToolsTB.Caption=Ekstra Araçlar' + #13#10 +
      'ObjectSelectB.Hint=Seçim Aracý' + #13#10 +
      'HandToolB.Hint=El Aracý' + #13#10 +
      'ZoomToolB.Hint=Yakýnlaþtýrma Aracý' + #13#10 +
      'TextToolB.Hint=Metin Düzenleme Aracý' + #13#10 +
      'FormatToolB.Hint=Biçim Kopyalama Aracý' + #13#10 +
      'ObjectBandB.Hint=Band Aracý' + #13#10 +
      'FileMenu.Caption=&Dosya' + #13#10 +
      'EditMenu.Caption=Dü&zen' + #13#10 +
      'FindMI.Caption=Bul...' + #13#10 +
      'FindNextMI.Caption=Sonrakini Bul' + #13#10 +
      'ReplaceMI.Caption=Deðiþtir...' + #13#10 +
      'ReportMenu.Caption=&Rapor' + #13#10 +
      'ReportDataMI.Caption=Veri...' + #13#10 +
      'ReportSettingsMI.Caption=Seçenekler...' + #13#10 +
      'ReportStylesMI.Caption=Biçimler...' + #13#10 +
      'ViewMenu.Caption=&Görünüm' + #13#10 +
      'ToolbarsMI.Caption=Araç Kutusu' + #13#10 +
      'StandardMI.Caption=Standart' + #13#10 +
      'TextMI.Caption=Metin' + #13#10 +
      'FrameMI.Caption=Çerçeve' + #13#10 +
      'AlignmentMI.Caption=Hizalama Paleti' + #13#10 +
      'ToolsMI.Caption=Ekstra Araçlar' + #13#10 +
      'InspectorMI.Caption=Nesne Yöneticisi' + #13#10 +
      'DataTreeMI.Caption=Veri Aðacý' + #13#10 +
      'ReportTreeMI.Caption=Rapor Aðacý' + #13#10 +
      'ShowRulersMI.Caption=Kurallar' + #13#10 +
      'ShowGuidesMI.Caption=Rehberler' + #13#10 +
      'DeleteGuidesMI.Caption=Rehber Sil' + #13#10 +
      'OptionsMI.Caption=Seçenekler...' + #13#10 +
      'HelpMenu.Caption=&Yardým' + #13#10 +
      'HelpContentsMI.Caption=Ýçindekiler...' + #13#10 +
      'AboutMI.Caption=FastReport Hakkýnda...' + #13#10 +
      'TabOrderMI.Caption=Tab Sýrasý...' + #13#10 +
      'UndoCmd.Caption=Geri Al' + #13#10 +
      'RedoCmd.Caption=Yenile' + #13#10 +
      'CutCmd.Caption=Kes' + #13#10 +
      'CopyCmd.Caption=Kopyala' + #13#10 +
      'PasteCmd.Caption=Yapýþtýr' + #13#10 +
      'DeleteCmd.Caption=Sil' + #13#10 +
      'DeletePageCmd.Caption=Sayfa Sil' + #13#10 +
      'SelectAllCmd.Caption=Tümünü Seç' + #13#10 +
      'EditCmd.Caption=Düzenle...' + #13#10 +
      'BringToFrontCmd.Caption=Öne Getir' + #13#10 +
      'SendToBackCmd.Caption=Alta Gönder' + #13#10 +
      'NewItemCmd.Caption=Yeni...' + #13#10 +
      'NewReportCmd.Caption=Yeni Rapor' + #13#10 +
      'NewPageCmd.Caption=Yeni Sayfa' + #13#10 +
      'NewDialogCmd.Caption=Yeni Diyalog' + #13#10 +
      'OpenCmd.Caption=Aç...' + #13#10 +
      'SaveCmd.Caption=Kaydet' + #13#10 +
      'SaveAsCmd.Caption=Farklý Kaydet...' + #13#10 +
      'VariablesCmd.Caption=Deðiþkenler...' + #13#10 +
      'PageSettingsCmd.Caption=Sayfa Ayarlarý...' + #13#10 +
      'PreviewCmd.Caption=Önizleme' + #13#10 +
      'ExitCmd.Caption=Çýkýþ' + #13#10 +
      'ReportTitleMI.Caption=Rapor Baþlýðý' + #13#10 +
      'ReportSummaryMI.Caption=Rapor Özeti' + #13#10 +
      'PageHeaderMI.Caption=Sayfa Baþlýðý' + #13#10 +
      'PageFooterMI.Caption=Sayfa Sonu' + #13#10 +
      'HeaderMI.Caption=Üst Baþlýk' + #13#10 +
      'FooterMI.Caption=Alt Baþlýk' + #13#10 +
      'MasterDataMI.Caption=Asýl Veri' + #13#10 +
      'DetailDataMI.Caption=Detay Veri' + #13#10 +
      'SubdetailDataMI.Caption=Altdetay Veri' + #13#10 +
      'Data4levelMI.Caption=4. Seviye Veri' + #13#10 +
      'Data5levelMI.Caption=5. Seviye Veri' + #13#10 +
      'Data6levelMI.Caption=6. Seviye Veri' + #13#10 +
      'GroupHeaderMI.Caption=Grup Baþlýðý' + #13#10 +
      'GroupFooterMI.Caption=Grup Sonu' + #13#10 +
      'ChildMI.Caption=Çocuk' + #13#10 +
      'ColumnHeaderMI.Caption=Kolon Baþlýðý' + #13#10 +
      'ColumnFooterMI.Caption=Kolon Sonu' + #13#10 +
      'OverlayMI.Caption=Yardýmcý' + #13#10 +
      'VerticalbandsMI.Caption=Dikey Bandlar' + #13#10 +
      'HeaderMI1.Caption=Üst Baþlýk' + #13#10 +
      'FooterMI1.Caption=Alt Baþlýk' + #13#10 +
      'MasterDataMI1.Caption=Asýl Veri' + #13#10 +
      'DetailDataMI1.Caption=Detay Veri' + #13#10 +
      'SubdetailDataMI1.Caption=Altdetay Veri' + #13#10 +
      'GroupHeaderMI1.Caption=Grup Baþlýðý' + #13#10 +
      'GroupFooterMI1.Caption=Grup Sonu' + #13#10 +
      'ChildMI1.Caption=Çocuk' + #13#10 +
      'R0MI.Caption=0°' + #13#10 +
      'R45MI.Caption=45°' + #13#10 +
      'R90MI.Caption=90°' + #13#10 +
      'R180MI.Caption=180°' + #13#10 +
      'R270MI.Caption=270°' + #13#10 +
      'FontB.Hint=Yazý Tipi Ayarlarý' + #13#10 +
      'BoldMI.Caption=Kalýn' + #13#10 +
      'ItalicMI.Caption=Ýtalik' + #13#10 +
      'UnderlineMI.Caption=Altý Çizgili' + #13#10 +
      'SuperScriptMI.Caption=Üst Simge' + #13#10 +
      'SubScriptMI.Caption=Alt Simge' + #13#10 +
      'CondensedMI.Caption=Sýkýþtýrýlmýþ' + #13#10 +
      'WideMI.Caption=Geniþ' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'OpenDialog.Filter=Rapor (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=Pascal dosyalarý (*.pas)|*.pas|C++ dosyalarý (*.cpp)|*.cpp|JavaScript dosyalarý (*.js)|*.js|Basic dosyalarý (*.vb)|*.vb|Tüm dosyalar|*.*' + #13#10 +
      'SaveScriptDialog.Filter=Pascal dosyalarý (*.pas)|*.pas|C++ dosyalarý (*.cpp)|*.cpp|JavaScript dosyalarý (*.js)|*.js|Basic dosyalarý (*.vb)|*.vb|Tüm dosyalar|*.*' + #13#10 +
      '');
    Add('dsCm', 'Santimetre');
    Add('dsInch', 'Ýnç');
    Add('dsPix', 'Pixel');
    Add('dsChars', 'Karakter');
    Add('dsCode', 'Kod');
    Add('dsPage', 'Sayfa');
    Add('dsRepFilter', 'Rapor (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'Sýkýþtýrýþmýþ Rapor (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', 'Önizleme sayfasýndaki deðiþiklikler kaydedilsin mi?');
    Add('dsSaveChangesTo', 'Deðiþikleri Kaydet ');
    Add('dsCantLoad', 'Dosya Açýlamadý');
    Add('dsStyleFile', 'Biçim');
    Add('dsCantFindProc', 'Ana prosedür bulunamadý'); 
    Add('dsClearScript', 'Tüm kod silinecek. Devam etmek istiyor musunuz?');
    Add('dsNoStyle', 'Biçim yok');
    Add('dsStyleSample', 'Örnek biçim');
    Add('dsTextNotFound', '''%s'' metni bulunamadý'); 
    Add('dsReplace', '''%s'' metnini deðiþtirmek istiyo musunuz?'); 

    Add('TfrxAboutForm',
      'Caption=FastReport Hakkýnda' + #13#10 +
      'Label4.Caption=Daha fazla bilgi için Web sayfamýzý ziyaret edin:' + #13#10 +
      'Label6.Caption=Satýþ:' + #13#10 +
      'Label8.Caption=Destek:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Sayfa Seçenekleri' + #13#10 +
      'OKB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      'TabSheet1.Caption=Kaðýt' + #13#10 +
      'Label1.Caption=Geniþlik' + #13#10 +
      'Label2.Caption=Yükseklik' + #13#10 +
      'Label11.Caption=Ölçü   ' + #13#10 +
      'Label12.Caption=Yönlendirme   ' + #13#10 +
      'Label3.Caption=Sol' + #13#10 +
      'Label4.Caption=Üst' + #13#10 +
      'Label5.Caption=Sað' + #13#10 +
      'Label6.Caption=Alt' + #13#10 +
      'Label13.Caption=Boþluklar   ' + #13#10 +
      'Label14.Caption=Kaðýt Kaynaðý   ' + #13#10 +
      'Label9.Caption=Ýlk sayfa' + #13#10 +
      'Label10.Caption=Diðer sayfalar' + #13#10 +
      'PortraitRB.Caption=Dikey' + #13#10 +
      'LandscapeRB.Caption=Yatay' + #13#10 +
      'TabSheet3.Caption=Diðer Seçenekler' + #13#10 +
      'Label7.Caption=Kolonlar   ' + #13#10 +
      'Label8.Caption=Sayý' + #13#10 +
      'Label15.Caption=Geniþlik' + #13#10 +
      'Label16.Caption=Konumlar' + #13#10 +
      'Label17.Caption=Diðer   ' + #13#10 +
      'Label18.Caption=Çift Yönlü' + #13#10 +
      'PrintOnPrevCB.Caption=Önceki sayfayý yazdýr' + #13#10 +
      'MirrorMarginsCB.Caption=Boþluklarý yansýt' + #13#10 +
      'LargeHeightCB.Caption=Dizayn aþamasýnda sayfalar büyük uzunlukta' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Rapor Dataset''ini Seç' + #13#10 +
      'OKB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Deðiþkenleri Düzenle' + #13#10 +
      'NewCategoryB.Caption=Kategori' + #13#10 +
      'NewVarB.Caption=Deðiþken' + #13#10 +
      'EditB.Caption=Düzenle' + #13#10 +
      'DeleteB.Caption=Sil' + #13#10 +
      'EditListB.Caption=Liste' + #13#10 +
      'LoadB.Caption=Yükle' + #13#10 +
      'SaveB.Caption=Kaydet' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'ExprPanel.Caption= Ýfade:' + #13#10 +
      'OpenDialog1.Filter=Sözlük (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Sözlük (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(deðiþlem tanýmlanmamýþ)');
    Add('vaVar', 'Deðiþlenler');
    Add('vaDupName', 'Ayný isim');

    Add('TfrxOptionsEditor',
      'Caption=Dizayn Seçenekleri' + #13#10 +
      'Label1.Caption=Tablo   ' + #13#10 +
      'Label2.Caption=Tür' + #13#10 +
      'Label3.Caption=Ölçü' + #13#10 +
      'Label4.Caption=Diyalog pencersi:' + #13#10 +
      'Label5.Caption=Diðer   ' + #13#10 +
      'Label6.Caption=Yazý Tipileri   ' + #13#10 +
      'Label7.Caption=Kode penceresi' + #13#10 +
      'Label8.Caption=Text düzenleyici' + #13#10 +
      'Label9.Caption=Ölçü' + #13#10 +
      'Label10.Caption=Ölçü' + #13#10 +
      'Label11.Caption=Renkler   ' + #13#10 +
      'Label12.Caption=Bandlar arasýndaki boþluk:' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=in' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      'CMRB.Caption=Santimetre:' + #13#10 +
      'InchesRB.Caption=Ýnç:' + #13#10 +
      'PixelsRB.Caption=Pixel:' + #13#10 +
      'ShowGridCB.Caption=Tabloyu göster' + #13#10 +
      'AlignGridCB.Caption=Tabloya Hizala' + #13#10 +
      'EditAfterInsCB.Caption=Ekledikten sonra düzenle' + #13#10 +
      'ObjectFontCB.Caption=Nesnenin yazý tipi ayarlarýný kullan' + #13#10 +
      'WorkspaceB.Caption=Çalýþma Alaný' + #13#10 +
      'ToolB.Caption=Araç Penceresi' + #13#10 +
      'LCDCB.Caption=LCD tablo rengi' + #13#10 +
      'FreeBandsCB.Caption=Boþ band alaný' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Varsayýlan ayarlara dön' + #13#10 +
      'BandsCaptionsCB.Caption=Band etiketlerini göster' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=DataSet seç' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      '');
    Add('dbNotAssigned', '[atanmamýþ]');
    Add('dbSingleLine', 'Tek satýr');

    Add('TfrxGroupEditorForm',
      'Caption=Grup' + #13#10 +
      'BreakOnL.Caption=Kes   ' + #13#10 +
      'OptionsL.Caption=Seçenekler   ' + #13#10 +
      'OKB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      'DataFieldRB.Caption=Veri Sahasý' + #13#10 +
      'ExpressionRB.Caption=Ýfade' + #13#10 +
      'KeepGroupTogetherCB.Caption=Grubu birlikte tut' + #13#10 +
      'StartNewPageCB.Caption=Yeni sayfaya baþla' + #13#10 +
      'OutlineCB.Caption=Ana hatlar içinde göster' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=Sistem Metni' + #13#10 +
      'DataBandL.Caption=Veri Bandý' + #13#10 +
      'DataSetL.Caption=DataSet' + #13#10 +
      'DataFieldL.Caption=VeriSahasý' + #13#10 +
      'FunctionL.Caption=Fonksiyon' + #13#10 +
      'ExpressionL.Caption=Ýfade' + #13#10 +            
      'OKB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      'AggregateRB.Caption=Toplam Deðer' + #13#10 +
      'SysVariableRB.Caption=Sistem Deðiþkeni' + #13#10 +
      'CountInvisibleCB.Caption=Görünmez bandlarýn sayýsý' + #13#10 +
      'TextRB.Caption=Metin' + #13#10 +
      'RunningTotalCB.Caption=Toplam Çalýþtýrýlan' + #13#10 +
      '');
    Add('agAggregate', 'Toplam Ekle');
    Add('vt1', '[DATE]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGES#]');
    Add('vt5', '[PAGE#] / [TOTALPAGES#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=OLE Nesnesi' + #13#10 +
      'InsertB.Caption=Ekle...' + #13#10 +
      'EditB.Caption=Düzenle...' + #13#10 +
      'CloseB.Caption=Çýkýþ' + #13#10 +
      '');
    Add('olStretched', 'Uzatýlmýþ');

    Add('TfrxBarcodeEditorForm',
      'Caption=Barkod Düzenleyici' + #13#10 +
      'CodeLbl.Caption=Kod' + #13#10 +
      'TypeLbl.Caption=Bar''ýn Türü' + #13#10 +
      'ZoomLbl.Caption=Yaklaþtýr:' + #13#10 +
      'OptionsLbl.Caption=Seçenekler   ' + #13#10 +
      'RotationLbl.Caption=Döndürme Açýsý   ' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CalcCheckSumCB.Caption=Saðlamasýný Yap ' + #13#10 + 
      'ViewTextCB.Caption=Rakamlarý Göster' + #13#10 +
      'Rotation0RB.Caption=0°' + #13#10 +
      'Rotation90RB.Caption=90°' + #13#10 +
      'Rotation180RB.Caption=180°' + #13#10 +
      'Rotation270RB.Caption=270°' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Saðlamasýný Yap'); 
    Add('bcShowText', 'Metni Göster');

    Add('TfrxAliasesEditorForm',
      'Caption=Görünen adý düzenle' + #13#10 +
      'HintL.Caption=Maddeyi düzenlemek için ENTER tuþuna basýn' + #13#10 +
      'DSAliasL.Caption=Dataset görünen adý' + #13#10 +
      'FieldAliasesL.Caption=Sahalarýn görünen adý' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      'ResetB.Caption=Sýfýrla' + #13#10 +
      'UpdateB.Caption=Update' + #13#10 +
      '');
    Add('alUserName', 'Kullanýcý Adý');
    Add('alOriginal', 'Orjinal Adý');

    Add('TfrxParamsEditorForm',
      'Caption=Parametre Düzenleyici' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      '');
    Add('qpName', 'Adý');
    Add('qpDataType', 'Veri Türü');
    Add('qpValue', 'Deðeri');

    Add('TfrxMDEditorForm',
      'Caption=Asýl-Detay baðlantýsý' + #13#10 +
      'Label1.Caption=Detay sahalarý' + #13#10 +
      'Label2.Caption=Asýl sahalar' + #13#10 +
      'Label3.Caption=Baðlantý sahalarý' + #13#10 +
      'AddB.Caption=Ekle' + #13#10 +
      'ClearB.Caption=Temizle' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=Metin' + #13#10 +
      'ExprB.Hint=Ýfade Ekle' + #13#10 +
      'AggregateB.Hint=Toplam Ekle' + #13#10 +
      'LocalFormatB.Hint=Biçimleme Ekle' + #13#10 +
      'WordWrapB.Hint=Sözcük Kaydýr' + #13#10 +
      'CancelB.Hint=Vazgeç' + #13#10 +
      'OkB.Hint=Tamam' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=Resim' + #13#10 +
      'LoadB.Hint=Yükle' + #13#10 +
      'CopyB.Hint=Kopyala' + #13#10 +
      'PasteB.Hint=Yapýþtýr' + #13#10 +
      'ClearB.Hint=Temizle' + #13#10 +
      'CancelB.Hint=Vazgeç' + #13#10 +
      'OkB.Hint=Tamam' + #13#10 +
      '');
    Add('piEmpty', 'Boþ');

    Add('TfrxChartEditorForm',
      'Caption=Grafik Düzenleyici' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=Seri Ekle' + #13#10 +
      'DeleteB.Hint=Seri Sil' + #13#10 +
      'DBSourceRB.Caption=Veri, Veritabanýndan' + #13#10 +
      'FixedDataRB.Caption=Sabit Veri' + #13#10 +
      'DatasetLbl.Caption=Dataset' + #13#10 +
      'X1Lbl.Caption=X Deðerleri' + #13#10 +
      'Y1Lbl.Caption=Y Deðerleri' + #13#10 +
      'X3Lbl.Caption=X Deðerleri (Örnek, a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Y Deðerleri (Örnek, 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Diðer seçenekler   ' + #13#10 +
      'ShowTopLbl.Caption=TopN deðeri' + #13#10 + 
      'CaptionLbl.Caption=TopN etiketi' + #13#10 +
      'SortLbl.Caption=Sýralama' + #13#10 +
      'LineMI.Caption=3B Çizgi' + #13#10 +
      'AreaMI.Caption=Alan Bloðu' + #13#10 +
      'PointMI.Caption=Nokta Daðýlým' + #13#10 +
      'BarMI.Caption=Çubuk' + #13#10 +
      'HorizBarMI.Caption=Dikey Çubuk' + #13#10 +
      'PieMI.Caption=Pasta' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +       
      'FastLineMI.Caption=Çizgi' + #13#10 +
      '');
    Add('ch3D', '3D Görüntü');
    Add('chAxis', 'Ekseni göster');
    Add('chsoNone', 'Yok');
    Add('chsoAscending', 'Artan');
    Add('chsoDescending', 'Azalan');

    Add('TfrxRichEditorForm',
      'Caption=Zengin Metin Düzenleyici' + #13#10 +
      'OpenB.Hint=Dosya Aç' + #13#10 +
      'SaveB.Hint=Dosya Kaydet' + #13#10 +
      'UndoB.Hint=Geri' + #13#10 +
      'TTB.Hint=Yazý Tipi' + #13#10 +
      'ExprB.Hint=Ýfade Ekle' + #13#10 +
      'CancelB.Hint=Vazgeç' + #13#10 +
      'OkB.Hint=Tamam' + #13#10 +
      'BoldB.Hint=Kalýn' + #13#10 +
      'ItalicB.Hint=Ýtalik' + #13#10 +
      'UnderlineB.Hint=Altý Çizgili' + #13#10 +
      'LeftAlignB.Hint=Sola Hizalý' + #13#10 +
      'CenterAlignB.Hint=Ortalý' + #13#10 +
      'RightAlignB.Hint=Saða Hizalý' + #13#10 +
      'BlockAlignB.Hint=Ýki Yana Hizalý' + #13#10 +
      'BulletsB.Hint=Madde Ými' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Tablo Düzenleyici' + #13#10 +
      'DatasetL.Caption=Kaynak Veri   ' + #13#10 +
      'DimensionsL.Caption=Boyutlar   ' + #13#10 +
      'RowsL.Caption=Satýrlar' + #13#10 +
      'ColumnsL.Caption=Kolonlar' + #13#10 +
      'CellsL.Caption=Hücreler' + #13#10 +
      'StructureL.Caption=Tablo Yapýsý   ' + #13#10 +
      'RowHeaderCB.Caption=Satýr baþlýðý' + #13#10 +
      'ColumnHeaderCB.Caption=Kolon baþlýðý' + #13#10 +
      'RowTotalCB.Caption=Satýr genel toplamý' + #13#10 +
      'ColumnTotalCB.Caption=Kolon genel toplamý' + #13#10 +
      'SwapB.Hint=Satýrlarý/Kolonlarý deðiþtir' + #13#10 +
      'StyleCB.Hint=Tablo Biçimi' + #13#10 +
      'FontB.Hint=Yazý Tipi Ayarlarý' + #13#10 +
      'AlignLeftB.Hint=Sola Hizala' + #13#10 +
      'AlignCenterB.Hint=Ortala' + #13#10 +
      'AlignRightB.Hint=Saða Hizala' + #13#10 +
      'RotationB.Hint=Metin Döndürme Açýsý' + #13#10 +
      'HighlightB.Hint=Vurgu' + #13#10 +
      'FormatB.Hint=Biçim' + #13#10 +
      'FrameB.Hint=Çerçeve Ayarlarý' + #13#10 +
      'FillColorB.Hint=Renk Doldur' + #13#10 +
      'Func1MI.Caption=Yok' + #13#10 +
      'Func2MI.Caption=Toplam' + #13#10 +
      'Func3MI.Caption=Mininum' + #13#10 +
      'Func4MI.Caption=Maksimum' + #13#10 +
      'Func5MI.Caption=Ortalama' + #13#10 +
      'Func6MI.Caption=Sayý' + #13#10 +
      'Sort1MI.Caption=Artan Sýralama (A-Z)' + #13#10 +
      'Sort2MI.Caption=Azalan Sýralama (Z-A)' + #13#10 +
      'Sort3MI.Caption=Sýralama Yok' + #13#10 +
      'BoldMI.Caption=Kalýn' + #13#10 +
      'ItalicMI.Caption=Ýtalik' + #13#10 +
      'UnderlineMI.Caption=Altý Çizgili' + #13#10 +
      'SuperScriptMI.Caption=Üst Simge' + #13#10 +
      'SubScriptMI.Caption=Alt Simge' + #13#10 +
      'CondensedMI.Caption=Sýkýþtýrýlmýþ' + #13#10 +
      'WideMI.Caption=Geniþ' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=Vazgeç' + #13#10 +
      'OkB.Hint=Tamam' + #13#10 +
      '');
    Add('crSubtotal', 'Subtotal');
    Add('crNone', 'Yok');
    Add('crSum', 'Top');
    Add('crMin', 'Min');
    Add('crMax', 'Max');
    Add('crAvg', 'Ort');
    Add('crCount', 'Sayý');
    Add('crAsc', 'A-Z');
    Add('crDesc', 'Z-A');
    Add('crFillMx', 'Tablo dolduruluyor...');
    Add('crBuildMx', 'Tablo yapýlandýrýlýyor...');
    Add('crRepHdrs', 'Baþlýklarý Tekrar Bas');
    Add('crBorder', 'Çerçeve');
    Add('crDown', 'Parçalara Ayýr');

    Add('TfrxExprEditorForm',
      'Caption=Ýfade Düzenleyici' + #13#10 +
      'ExprL.Caption=Ýfade:' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=Görüntü Biçimi' + #13#10 +
      'CategoryL.Caption=Kategori' + #13#10 +
      'FormatL.Caption=Biçim' + #13#10 +
      'FormatStrL.Caption=Biçim metni:' + #13#10 +
      'SeparatorL.Caption=Ondalýk ayracý:' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      '');
    Add('fkText', 'Metin (biçimlendirilmemiþ)');
    Add('fkNumber', 'Sayý');
    Add('fkDateTime', 'Tarih/Saat');
    Add('fkBoolean', 'Doðru/Yanlýþ');
    Add('fkNumber1', '1234.5;%g');
    Add('fkNumber2', '1234.50;%2.2f');
    Add('fkNumber3', '1,234.50;%2.2n');
    Add('fkNumber4', '$1,234.50;%2.2m');
    Add('fkDateTime1', '11.28.2002;mm.dd.yyyy');
    Add('fkDateTime2', '28 ksm 2002;dd mmm yyyy');
    Add('fkDateTime3', 'Kasým 28, 2002;mmmm dd, yyyy');
    Add('fkDateTime4', '02:14;hh:mm');
    Add('fkDateTime5', '02:14am;hh:mm am/pm');
    Add('fkDateTime6', '02:14:00;hh:mm:ss');
    Add('fkDateTime7', '02:14am, Kasým 28, 2002;hh:mm am/pm, mmmm dd, yyyy');
    Add('fkBoolean1', '0,1;0,1');
    Add('fkBoolean2', 'Hayýr,Evet;Hayýr,Evet');
    Add('fkBoolean3', '_,x;_,x');
    Add('fkBoolean4', 'Yanlýþ,Doðru;Yanlýþ,Doðru');   

    Add('TfrxHighlightEditorForm',
      'Caption=Vurgu' + #13#10 +
      'FontColorB.Caption=Renk...' + #13#10 +
      'BackColorB.Caption=Renk...' + #13#10 +
      'ConditionL.Caption=Koþul   ' + #13#10 +
      'FontL.Caption=Yazý Tipi   ' + #13#10 +
      'BackgroundL.Caption=Arkaplan   ' + #13#10 +
      'OKB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      'BoldCB.Caption=Kalýn' + #13#10 +
      'ItalicCB.Caption=Ýtalik' + #13#10 +
      'UnderlineCB.Caption=Altý Çizgili' + #13#10 +
      'TransparentRB.Caption=Saydam' + #13#10 +
      'OtherRB.Caption=Diðer' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Rapor Ayarlarý' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      'GeneralTS.Caption=Genel' + #13#10 +
      'ReportSettingsL.Caption=Yazýcý Ayarlarý   ' + #13#10 +
      'CopiesL.Caption=Kopya' + #13#10 +
      'GeneralL.Caption=Genel   ' + #13#10 +
      'PasswordL.Caption=Þifre' + #13#10 +
      'CollateCB.Caption=Harmanlý kopya' + #13#10 +
      'DoublePassCB.Caption=Ýkinci Geçiþ' + #13#10 +
      'PrintIfEmptyCB.Caption=Boþsa Yaz' + #13#10 +
      'DescriptionTS.Caption=Tanýmlama' + #13#10 +
      'NameL.Caption=Adý' + #13#10 +
      'Description1L.Caption=Tanýmlama' + #13#10 +
      'PictureL.Caption=Resim' + #13#10 +
      'AuthorL.Caption=Yazar' + #13#10 +
      'MajorL.Caption=Majör' + #13#10 +
      'MinorL.Caption=Minör' + #13#10 +
      'ReleaseL.Caption=Sunum' + #13#10 +
      'BuildL.Caption=Yapý' + #13#10 +
      'CreatedL.Caption=Oluþturuldu' + #13#10 +
      'ModifiedL.Caption=Deðiþtiriildi' + #13#10 +
      'DescriptionL.Caption=Tanýmlama   ' + #13#10 +
      'VersionL.Caption=Versiyon   ' + #13#10 +
      'PictureB.Caption=Göz At...' + #13#10 +
      '');
    Add('rePrnOnPort', 'üzerinde');

    Add('TfrxStringsEditorForm',
      'Caption=Satýr' + #13#10 +
      'CancelB.Hint=Vazgeç' + #13#10 +
      'OkB.Hint=Tamam' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=Vazgeç' + #13#10 +
      'OkB.Hint=Tamam' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=Þifre' + #13#10 +
      'PasswordL.Caption=Þifreyi girin:' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=Biçim Düzenleyici' + #13#10 +
      'ColorB.Caption=Renk...' + #13#10 +
      'FontB.Caption=Yazý Tipi...' + #13#10 +
      'FrameB.Caption=Çerçeve...' + #13#10 +
      'AddB.Hint=Ekle' + #13#10 +
      'DeleteB.Hint=Sil' + #13#10 +
      'EditB.Hint=Düzenle' + #13#10 +
      'LoadB.Hint=Yükle' + #13#10 +
      'SaveB.Hint=Kaydet' + #13#10 +
      'CancelB.Hint=Vazgeç' + #13#10 +
      'OkB.Hint=Tamam' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=Çerçeve Düzenleyici' + #13#10 +
      'FrameL.Caption=Çerçeve' + #13#10 +
      'LineL.Caption=Çerçeve Çizgisi' + #13#10 +
      'ShadowL.Caption=Gölge' + #13#10 +
      'FrameTopB.Hint=Üst Çizgi' + #13#10 +
      'FrameBottomB.Hint=Alt Çizgi' + #13#10 +
      'FrameLeftB.Hint=Sol Çizgi' + #13#10 +
      'FrameRightB.Hint=Sað Çizgi' + #13#10 +
      'FrameAllB.Hint=Tüm Çerçeve Çizgileri' + #13#10 +
      'FrameNoB.Hint=Çerçeve Yok' + #13#10 +
      'FrameColorB.Hint=Çerçeve Rengi' + #13#10 +
      'FrameStyleB.Hint=Çerçeve Biçimi' + #13#10 +
      'FrameWidthCB.Hint=Çerçeve Geniþliði' + #13#10 +
      'ShadowB.Hint=Gölge' + #13#10 +
      'ShadowColorB.Hint=Gölge Rengi' + #13#10 +
      'ShadowWidthCB.Hint=Gölge Geniþliði' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=Yeni Madde' + #13#10 +
      'ItemsTab.Caption=Maddeler' + #13#10 +
      'TemplatesTab.Caption=Þablonlar' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Tab Sýrasý' + #13#10 +
      'Label1.Caption=Tab sýrasýna göre nesne listesi:' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      'UpB.Caption=Yukarý Taþý' + #13#10 +
      'DownB.Caption=Aþaðý Taþý' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Deðerlendirme' + #13#10 +  
      'Label1.Caption=Ýfade' + #13#10 +
      'Label2.Caption=Sonuç' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Rapor Sihirbazý' + #13#10 +
      'DataTab.Caption=Veri' + #13#10 +
      'GroupsTab.Caption=Gruplar' + #13#10 +
      'LayoutTab.Caption=Alan' + #13#10 +
      'StyleTab.Caption=Biçim' + #13#10 +
      'Step1L.Caption=Step 1. Görüntülenecek DataSet ve sahalarý seç.' + #13#10 +
      'Step2L.Caption=Step 2. Gruplarý yarat (seçmeli).' + #13#10 +
      'Step3L.Caption=Step 3. Sayfa yönlendirmesini ve veri alanýný tanýmla.' + #13#10 +
      'Step4L.Caption=Step 4. Rapor biçimini seç.' + #13#10 +
      'AddFieldB.Caption=Ekle >' + #13#10 +
      'AddAllFieldsB.Caption=Hepsini ekle >>' + #13#10 +
      'RemoveFieldB.Caption=< Kaldýr' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Hepsini kaldýr' + #13#10 +
      'AddGroupB.Caption=Ekle >' + #13#10 +
      'RemoveGroupB.Caption=< Kaldýr' + #13#10 +
      'SelectedFieldsL.Caption=Seçili sahalar:' + #13#10 +
      'AvailableFieldsL.Caption=Kullanýlabilir sahalar:' + #13#10 +
      'GroupsL.Caption=Gruplar:' + #13#10 +
      'OrientationL.Caption=Yönlendirme   ' + #13#10 +
      'LayoutL.Caption=Yerleþtirme ' + #13#10 +
      'PortraitRB.Caption=Dikey' + #13#10 +
      'LandscapeRB.Caption=Yatay' + #13#10 +
      'TabularRB.Caption=Liste Þekli' + #13#10 +
      'ColumnarRB.Caption=Kart Þekli' + #13#10 +
      'FitWidthCB.Caption=Sahalarý sayfa geniþliðine sýðdýr' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      'BackB.Caption=<< Geri' + #13#10 +
      'NextB.Caption=Ýleri >>' + #13#10 +
      'FinishB.Caption=Son' + #13#10 +
      '');
    Add('wzStd', 'Standart Rapor Shirbazý');
    Add('wzDMP', 'Nokta-Vuruþlu Rapor Sihirbazý');
    Add('wzStdEmpty', 'Standart Rapor');
    Add('wzDMPEmpty', 'Nokta-Vuruþlu Rapor');


    Add('ftAllFiles', 'Tüm Dosyalar');
    Add('ftPictures', 'Resimler');
    Add('ftDB', 'Veri Dosyalarý');
    Add('ftRichFile', 'Zengin Metin Dosyasý');
    Add('ftTextFile', 'Metin Dosyasý');

    Add('prNotAssigned', '(atanmamýþ)');
    Add('prInvProp', 'Özellik deðeri geçersiz');
    Add('prDupl', 'Tekrarlanan ad');
    Add('prPict', '(Resim)');

    Add('mvExpr', 'Ýfadelere Ýzin Ver');
    Add('mvStretch', 'Sýðdýr');
    Add('mvStretchToMax', 'Maksimum Yüksekliðe Sýðdýr');
    Add('mvShift', 'Kaydýr');
    Add('mvShiftOver', 'Üzerine Bindiðinde Kaydýr');
    Add('mvVisible', 'Görünür');
    Add('mvPrintable', 'Yazdýrýlabilir');
    Add('mvFont', 'Yazý Tipi...');
    Add('mvFormat', 'Görüntü Biçimi...');
    Add('mvClear', 'Ýçindekileri Temizle');
    Add('mvAutoWidth', 'Otomatik Geniþlik');
    Add('mvWWrap', 'Sözcük Kaydýr');
    Add('mvSuppress', 'Tekrarlanan Deðerleri Gizle');
    Add('mvHideZ', 'Sýfýrlarý Gizle');
    Add('mvHTML', 'HTML Koduna Ýzin ver');
    Add('lvDiagonal', 'Çapraz');
    Add('pvAutoSize', 'Otomatik Boyutlandýr');
    Add('pvCenter', 'Ortala');
    Add('pvAspect', 'Yön Oranýný Tut');
    Add('bvSplit', 'Bölünmeye Ýzin Ver');
    Add('bvKeepChild', 'Çocuklarý Birlikte Tut');
    Add('bvPrintChild', 'Görünmezse Çocuðu Yazdýr');
    Add('bvStartPage', 'Yeni Sayfada Baþla');
    Add('bvPrintIfEmpty', 'Detayý Boþsa Yazdýr');
    Add('bvKeepDetail', 'Detayý Birlikte Tut');
    Add('bvKeepFooter', 'Sayfa Sonunu Birlikte Tut');
    Add('bvReprint', 'Yeni Sayfada Tekrar Yazdýr');
    Add('bvOnFirst', 'Ýlk Sayfada Yazdýr');
    Add('bvOnLast', 'Son Sayfada Yazdýr');
    Add('bvKeepGroup', 'Birlikte Tut');
    Add('bvFooterAfterEach', 'Her Satýrdan Sonra Alt Sayfa Sonu');
    Add('srParent', 'Üzerinde Bulunduðu Nesnede Yazdýr');
    Add('bvKeepHeader', 'Keep Header Together');

    Add('obCatDraw', 'Çizim');
    Add('obCatOther', 'Diðer nesneler');
    Add('obCatOtherControls', 'Diðer kontroller');
    Add('obDiagLine', 'Çapraz çizgi');
    Add('obRect', 'Dikdörtgen');
    Add('obRoundRect', 'yuvarlanmýþ dikdörtgen');
    Add('obEllipse', 'Elips');
    Add('obTrian', 'Üçgen');
    Add('obDiamond', 'Karo');
    Add('obLabel', 'Etiket kontrolü');
    Add('obEdit', 'Metin kontrolü');
    Add('obMemoC', 'Yazý kontrolü');
    Add('obButton', 'Düðme kontrolü');
    Add('obChBoxC', 'OnayKutusu kontrolü');
    Add('obRButton', 'RadyoDüðme kontrolü');
    Add('obLBox', 'ListeKutusu kontrolü');
    Add('obCBox', 'AçýlanListeKutusu kontrolü');
    Add('obDateEdit', 'Tarih kontrolü');
    Add('obImageC', 'Resim kontrolü');
    Add('obPanel', 'Panel kontrolü');
    Add('obGrBox', 'GrupKutusu kontrolü');
    Add('obBBtn', 'ResimliDüðme kontrolü');
    Add('obSBtn', 'HýzlýDüðme kontrolü');
    Add('obMEdit', 'BiçimliMetin kontrolü');
    Add('obChLB', 'OnayListesiKutusu kontrolü');
    Add('obDBLookup', 'DBSorguluAçýlanListeKutusu kontrolü');
    Add('obBevel', 'Bevel kontrolü');
    Add('obShape', 'Þekil nesnesi');
    Add('obText', 'Metin nesnesi');
    Add('obSysText', 'Sistem metni');
    Add('obLine', 'Çizgi nesnesi');
    Add('obPicture', 'Resim nesnesi');
    Add('obBand', 'Band object');
    Add('obDataBand', 'Veri bandý');
    Add('obSubRep', 'Alt rapor nesnesi');
    Add('obDlgPage', 'Diyalog formu');
    Add('obRepPage', 'Rapor sayfasý');
    Add('obReport', 'Rapor nesnesi');
    Add('obRich', 'Zengin metin nesnesi');
    Add('obOLE', 'OLE nesnesi');
    Add('obChBox', 'Onay kutusu nesnesi');
    Add('obChart', 'Grafik nesnesi');
    Add('obBarC', 'Barkod nesnesi');
    Add('obCross', 'Cross-tab object');
    Add('obDBCross', 'DB Cross-tab object');
    Add('obGrad', 'Dereceli renk nesnesi');
    Add('obDMPText', 'Nokta-vuruþlu metin nesnesi');
    Add('obDMPLine', 'Nokta-vuruþlu satýr nesnesi');
    Add('obBDEDB', 'BDE Veritabaný');
    Add('obBDETb', 'BDE Tablosu');
    Add('obBDEQ', 'BDE Sorgusu');
    Add('obBDEComps', 'BDE Komponenetleri');
    Add('obIBXDB', 'IBX Veritabaný');
    Add('obIBXTb', 'IBX Tablo');
    Add('obIBXQ', 'IBX Sorgusu');
    Add('obIBXComps', 'IBX Komponenetleri');
    Add('obADODB', 'ADO Veritabaný');
    Add('obADOTb', 'ADO Tablosu');
    Add('obADOQ', 'ADO Sorgusu');
    Add('obADOComps', 'ADO Komponenetleri');
    Add('obDBXDB', 'DBX Veritabaný');
    Add('obDBXTb', 'DBX Tablosu');
    Add('obDBXQ', 'DBX Sorgusu');
    Add('obDBXComps', 'DBX Komponenetleri');

    Add('ctString', 'Metin');
    Add('ctDate', 'Tarih ve Saat');
    Add('ctConv', 'Deðiþim');
    Add('ctFormat', 'Biçim');
    Add('ctMath', 'Matematiksel');
    Add('ctOther', 'Diðer');

    Add('IntToStr', 'Rakamsal deðeri metin biçimine dönüþtürür');
    Add('FloatToStr', 'Ondalýklý deðeri metin biçimine dönüþtürür');
    Add('DateToStr', 'Tarih deðeri metin biçimine dönüþtürür');
    Add('TimeToStr', 'Saat deðeri metin biçimine dönüþtürür');
    Add('DateTimeToStr', 'Tarih-saat deðeri metin biçimine dönüþtürür');
    Add('VarToStr', 'Deðiþebilir deðeri metin biçimine dönüþtürür');
    Add('StrToInt', 'Metni rakamsal biçime dönüþtürür');
    Add('StrToFloat', 'Metni ondalýklý biçime dönüþtürür');
    Add('StrToDate', 'Metni tarih biçimine dönüþtürür');
    Add('StrToTime', 'Metni saat biçimine dönüþtürür');
    Add('StrToDateTime', 'Metni tarih-saat biçimine dönüþtürür');
    Add('Format', 'Verilen bir dizi ve metni biçimlendirerek yeni bir metin döndürür');
    Add('FormatFloat', 'Ondalýklý deðeri belirli bir formata çevirir');
    Add('FormatDateTime', 'Tarih-saat deðerini belirli bir formata çevirir');
    Add('FormatMaskText', 'Metni belirli bir formata çevirir');
    Add('EncodeDate', 'Yýl, Ay ve Gün olarak gelen bir deðeri Tarih-Saat tipine çevirir');
    Add('DecodeDate', 'Tarih-Saat deðerini Yýl, Ay ve Gün olarak döndürür');
    Add('EncodeTime', 'Saat, Dakika, Saniye ve Milisaniye olarak gelen bir deðeri Tarih-Saat tipine çevirir');
    Add('DecodeTime', 'Tarih-Saat deðerini, Saat, Dakika, Saniye ve Milisaniye olarak döndürür');
    Add('Date', 'Geçerli tarihi döndürür');
    Add('Time', 'Geçerli saati döndürür');
    Add('Now', 'Geçerli tarih ve saati döndürür');
    Add('DayOfWeek', 'Günün hangi haftaya ait olduðunu döndürür');
    Add('IsLeapYear', 'Yýlýn artýk yýl olup olmadýðýný döndürür');
    Add('DaysInMonth', 'Ayýn gün sayýsýný döndürür');
    Add('Length', 'Metnin uzunluðunu döndürür');
    Add('Copy', 'Metnin içinden bir alt metin döndürür');
    Add('Pos', 'Metnin içinden bir alt metnin baþlangýç pozisyonunu verir');
    Add('Delete', 'Metnin içinden metin siler');
    Add('Insert', 'Metnin içine alt metin ekler');
    Add('Uppercase', 'Metnin tüm karakterlerini büyük harfe dönüþtürür');
    Add('Lowercase', 'Metnin tüm karakterlerini küçük harfe dönüþtürür');
    Add('Trim', 'Metnin baþýndaki ve sonundaki boþluklarý atar');
    Add('NameCase', 'Metnin ilk karakterini büyük harfe dönüþtürür');
    Add('CompareText', 'Ýki metni karþýlaþtýrýr');
    Add('Chr', 'Rakamsal deðeri karaktere dönüþtürür');
    Add('Ord', 'Bir karakterin rakamsal deðerini dönüþtürür');
    Add('SetLength', 'Metnin uzunluðunu ayarlar');
    Add('Round', 'Sayýsal bir deðeri en yakýn deðere yuvarlar');
    Add('Trunc', 'Kesirli sayýlarýn tam sayý kýsmýný döndürür');
    Add('Int', 'Reel bir sayýyý rakamsal sayýya dönüþtürür');
    Add('Frac', 'Kesirli sayýlarýn kesir kýsmýný döndürür');
    Add('Sqrt', 'Bir sayýnýn karesini döndürür');
    Add('Abs', 'Tam sayýya çevirir');
    Add('Sin', 'Sinüs''e çevirir (radyan''da)');
    Add('Cos', 'Cosinüs''e çevirir (radyan''da)');
    Add('ArcTan', 'Arktanjanta çevirir');
    Add('Tan', 'Tanjanta çevirir');
    Add('Exp', 'Sayýnýn üstel deðerini döndürür');
    Add('Ln', 'Reel bir sayýyý logaritma''ya çevirir');
    Add('Pi', '3.1415926... deðerini numaraya çevirir');
    Add('Inc', 'Deðeri arttýrýr');
    Add('Dec', 'Deðeri azaltýr');
    Add('RaiseException', 'Ýstisnai durum');
    Add('ShowMessage', 'Mesaj kutusu göster');
    Add('Randomize', 'Rastgele rakamsal deðer üretir');
    Add('Random', 'Rastgele bir rakamsal deðer döndürür');
    Add('ValidInt', 'Metin geçerli bir float deðer içeriyorsa "True" döndürür');
    Add('ValidFloat', 'Metin geçerli bir float deðer içeriyorsa "True" döndürür');
    Add('ValidDate', 'Metin geçerli bir tarih içeriyorsa "True" döndürür');
    Add('IIF', 'Eðer ifade "True" ise "DoðruDeðer" döndürür, diðer durumlarda "YanlýþDeðer" döndürür');
    Add('Get', 'Sadece iç kullaným için');
    Add('Set', 'Sadece iç kullaným için');
    Add('InputBox', 'Kullanýcýnýn metin girebilmesi için bir bilgi giriþ ekraný gösterir');
    Add('InputQuery', 'Kullanýcýnýn metin girebilmesi için bir bilgi giriþ ekraný gösterir');
    Add('MessageDlg', 'Mesaj kutusu göster');
    Add('CreateOleObject', 'Bir OLE nesnesi oluþtur');
    Add('VarArrayCreate', 'Deðiþebilir dizi oluþtur');
    Add('VarType', 'Deðiþebilir deðerin tipini döndür');
    Add('DayOf', 'Verilen tarihten günü (1..31) dönderir');
    Add('MonthOf', 'Verilen tarihten ay (1..12) dönderir');
    Add('YearOf', 'Verilen tarihten yýlý dönderir');

    Add('ctAggregate', 'Hesaplamalar');
    Add('Sum', 'Bandtaki belirtilen alanýn toplamýný hesapla');
    Add('Avg', 'Bandtaki averajlý veriyi hesapla');
    Add('Min', 'Bandtaki minimum veriyi hesapla');
    Add('Max', 'Bandtaki maksimum veriyi hesapla');
    Add('Count', 'Data satýrý kayýt sayýsý');
  end;
end;


initialization
  frAddDesignerRes;

end.
