
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
      'Caption=Nesne Y�neticisi' + #13#10 +
      '');
    Add('oiProp', '�zellikler');
    Add('oiEvent', 'Olaylar');

    Add('TfrxDataTreeForm',
      'Caption=Veri A�ac�' + #13#10 +
      'DataTS.Caption=Veri' + #13#10 +
      'VariablesTS.Caption=De�i�kenler' + #13#10 +
      'FunctionsTS.Caption=Fonksiyonlar' + #13#10 +
      'InsFieldCB.Caption=Saha olu�tur' + #13#10 +
      'InsCaptionCB.Caption=Etiket olu�tur' + #13#10 +
      '');
    Add('dtNoData', 'Kullan�labilir veri yok');
    Add('dtData', 'Veri');
    Add('dtSysVar', 'Sistem de�i�kenleri');
    Add('dtVar', 'De�i�kenler');
    Add('dtFunc', 'Fonksiyonlar');

    Add('TfrxReportTreeForm',
      'Caption=Rapor A�ac�' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Script Dosyas� A�' + #13#10 +
      'SaveScriptB.Hint=Script Dosyas�n� Kaydet' + #13#10 +
      'RunScriptB.Hint=Script �al��t�r' + #13#10 +
      'StepScriptB.Hint=��e gir' + #13#10 +
      'StopScriptB.Hint=Script sonland�r' + #13#10 +
      'EvaluateB.Hint=De�erlendirme' + #13#10 +
      'LangL.Caption=Dil:' + #13#10 +
      'AlignTB.Caption=Hizalama' + #13#10 +
      'AlignLeftsB.Hint=Sola Hizala' + #13#10 +
      'AlignHorzCentersB.Hint=Ortala' + #13#10 +
      'AlignRightsB.Hint=Sa�a Hizala' + #13#10 +
      'AlignTopsB.Hint=�ste Hizala' + #13#10 +
      'AlignVertCentersB.Hint=Ortala' + #13#10 +
      'AlignBottomsB.Hint=Alta Hizala' + #13#10 +
      'SpaceHorzB.Hint=Yatay Bo�luk' + #13#10 +
      'SpaceVertB.Hint=Dikey Bo�luk' + #13#10 +
      'CenterHorzB.Hint=Band�n ��inde Yatay Ortala' + #13#10 +
      'CenterVertB.Hint=Band�n ��inde Dikey Ortala' + #13#10 +
      'SameWidthB.Hint=Ayn� Geni�lik' + #13#10 +
      'SameHeightB.Hint=Ayn� Y�kseklik' + #13#10 +
      'TextTB.Caption=Metin' + #13#10 +
      'StyleCB.Hint=Bi�im' + #13#10 +
      'FontNameCB.Hint=Yaz� Tipi Ad�' + #13#10 +
      'FontSizeCB.Hint=Yaz� Tipi B�y�kl���' + #13#10 +
      'BoldB.Hint=Kal�n' + #13#10 +
      'ItalicB.Hint=�talik' + #13#10 +
      'UnderlineB.Hint=Alt� �izgili' + #13#10 +
      'FontColorB.Hint=Yaz� Rengi' + #13#10 +
      'HighlightB.Hint=Vurgu' + #13#10 +
      'RotateB.Hint=Metin D�nd�rme A��s�' + #13#10 +
      'TextAlignLeftB.Hint=Sola Hizala' + #13#10 +
      'TextAlignCenterB.Hint=Ortala' + #13#10 +
      'TextAlignRightB.Hint=Sa�a Hizala' + #13#10 +
      'TextAlignBlockB.Hint=�ki Yana Hizala' + #13#10 +
      'TextAlignTopB.Hint=�ste Hizala' + #13#10 +
      'TextAlignMiddleB.Hint=Ortala' + #13#10 +
      'TextAlignBottomB.Hint=Alta Hizala' + #13#10 +
      'FrameTB.Caption=�er�eve' + #13#10 +
      'FrameTopB.Hint=�st �izgi' + #13#10 +
      'FrameBottomB.Hint=Alt �izgi' + #13#10 +
      'FrameLeftB.Hint=Sol �izgi' + #13#10 +
      'FrameRightB.Hint=Sa� �izgi' + #13#10 +
      'FrameAllB.Hint=T�m �er�eve �izgileri' + #13#10 +
      'FrameNoB.Hint=�er�eve Yok' + #13#10 +
      'ShadowB.Hint=G�lge' + #13#10 +
      'FillColorB.Hint=Arkaplan Rengi' + #13#10 +
      'FrameColorB.Hint=�er�eve Rengi' + #13#10 +
      'FrameStyleB.Hint=�er�eve Bi�imi' + #13#10 +
      'FrameWidthCB.Hint=�er�eve Geni�li�i' + #13#10 +
      'StandardTB.Caption=Standart' + #13#10 +
      'NewB.Hint=Yeni Rapor' + #13#10 +
      'OpenB.Hint=Rapor A�' + #13#10 +
      'SaveB.Hint=Rapor Kaydet' + #13#10 +
      'PreviewB.Hint=�nizleme' + #13#10 +
      'NewPageB.Hint=Yeni Rapor Sayfas�' + #13#10 +
      'NewDialogB.Hint=Yeni Diyalog Sayfas�' + #13#10 +
      'DeletePageB.Hint=Sayfa Sil' + #13#10 +
      'PageSettingsB.Hint=Sayfa Ayarlar�' + #13#10 +
      'VariablesB.Hint=De�i�kenler' + #13#10 +
      'CutB.Hint=Kes' + #13#10 +
      'CopyB.Hint=Kopyala' + #13#10 +
      'PasteB.Hint=Yap��t�r' + #13#10 +
      'SampleFormatB.Hint=Bi�im Kopyalama' + #13#10 +
      'UndoB.Hint=Geri Al' + #13#10 +
      'RedoB.Hint=Yenile' + #13#10 +
      'ShowGridB.Hint=�izgileri G�ster' + #13#10 +
      'AlignToGridB.Hint=�izgilere Hizala' + #13#10 +
      'SetToGridB.Hint=�izgilere S��d�r' + #13#10 +
      'ScaleCB.Hint=Yak�nla�t�r' + #13#10 +
      'ExtraToolsTB.Caption=Ekstra Ara�lar' + #13#10 +
      'ObjectSelectB.Hint=Se�im Arac�' + #13#10 +
      'HandToolB.Hint=El Arac�' + #13#10 +
      'ZoomToolB.Hint=Yak�nla�t�rma Arac�' + #13#10 +
      'TextToolB.Hint=Metin D�zenleme Arac�' + #13#10 +
      'FormatToolB.Hint=Bi�im Kopyalama Arac�' + #13#10 +
      'ObjectBandB.Hint=Band Arac�' + #13#10 +
      'FileMenu.Caption=&Dosya' + #13#10 +
      'EditMenu.Caption=D�&zen' + #13#10 +
      'FindMI.Caption=Bul...' + #13#10 +
      'FindNextMI.Caption=Sonrakini Bul' + #13#10 +
      'ReplaceMI.Caption=De�i�tir...' + #13#10 +
      'ReportMenu.Caption=&Rapor' + #13#10 +
      'ReportDataMI.Caption=Veri...' + #13#10 +
      'ReportSettingsMI.Caption=Se�enekler...' + #13#10 +
      'ReportStylesMI.Caption=Bi�imler...' + #13#10 +
      'ViewMenu.Caption=&G�r�n�m' + #13#10 +
      'ToolbarsMI.Caption=Ara� Kutusu' + #13#10 +
      'StandardMI.Caption=Standart' + #13#10 +
      'TextMI.Caption=Metin' + #13#10 +
      'FrameMI.Caption=�er�eve' + #13#10 +
      'AlignmentMI.Caption=Hizalama Paleti' + #13#10 +
      'ToolsMI.Caption=Ekstra Ara�lar' + #13#10 +
      'InspectorMI.Caption=Nesne Y�neticisi' + #13#10 +
      'DataTreeMI.Caption=Veri A�ac�' + #13#10 +
      'ReportTreeMI.Caption=Rapor A�ac�' + #13#10 +
      'ShowRulersMI.Caption=Kurallar' + #13#10 +
      'ShowGuidesMI.Caption=Rehberler' + #13#10 +
      'DeleteGuidesMI.Caption=Rehber Sil' + #13#10 +
      'OptionsMI.Caption=Se�enekler...' + #13#10 +
      'HelpMenu.Caption=&Yard�m' + #13#10 +
      'HelpContentsMI.Caption=��indekiler...' + #13#10 +
      'AboutMI.Caption=FastReport Hakk�nda...' + #13#10 +
      'TabOrderMI.Caption=Tab S�ras�...' + #13#10 +
      'UndoCmd.Caption=Geri Al' + #13#10 +
      'RedoCmd.Caption=Yenile' + #13#10 +
      'CutCmd.Caption=Kes' + #13#10 +
      'CopyCmd.Caption=Kopyala' + #13#10 +
      'PasteCmd.Caption=Yap��t�r' + #13#10 +
      'DeleteCmd.Caption=Sil' + #13#10 +
      'DeletePageCmd.Caption=Sayfa Sil' + #13#10 +
      'SelectAllCmd.Caption=T�m�n� Se�' + #13#10 +
      'EditCmd.Caption=D�zenle...' + #13#10 +
      'BringToFrontCmd.Caption=�ne Getir' + #13#10 +
      'SendToBackCmd.Caption=Alta G�nder' + #13#10 +
      'NewItemCmd.Caption=Yeni...' + #13#10 +
      'NewReportCmd.Caption=Yeni Rapor' + #13#10 +
      'NewPageCmd.Caption=Yeni Sayfa' + #13#10 +
      'NewDialogCmd.Caption=Yeni Diyalog' + #13#10 +
      'OpenCmd.Caption=A�...' + #13#10 +
      'SaveCmd.Caption=Kaydet' + #13#10 +
      'SaveAsCmd.Caption=Farkl� Kaydet...' + #13#10 +
      'VariablesCmd.Caption=De�i�kenler...' + #13#10 +
      'PageSettingsCmd.Caption=Sayfa Ayarlar�...' + #13#10 +
      'PreviewCmd.Caption=�nizleme' + #13#10 +
      'ExitCmd.Caption=��k��' + #13#10 +
      'ReportTitleMI.Caption=Rapor Ba�l���' + #13#10 +
      'ReportSummaryMI.Caption=Rapor �zeti' + #13#10 +
      'PageHeaderMI.Caption=Sayfa Ba�l���' + #13#10 +
      'PageFooterMI.Caption=Sayfa Sonu' + #13#10 +
      'HeaderMI.Caption=�st Ba�l�k' + #13#10 +
      'FooterMI.Caption=Alt Ba�l�k' + #13#10 +
      'MasterDataMI.Caption=As�l Veri' + #13#10 +
      'DetailDataMI.Caption=Detay Veri' + #13#10 +
      'SubdetailDataMI.Caption=Altdetay Veri' + #13#10 +
      'Data4levelMI.Caption=4. Seviye Veri' + #13#10 +
      'Data5levelMI.Caption=5. Seviye Veri' + #13#10 +
      'Data6levelMI.Caption=6. Seviye Veri' + #13#10 +
      'GroupHeaderMI.Caption=Grup Ba�l���' + #13#10 +
      'GroupFooterMI.Caption=Grup Sonu' + #13#10 +
      'ChildMI.Caption=�ocuk' + #13#10 +
      'ColumnHeaderMI.Caption=Kolon Ba�l���' + #13#10 +
      'ColumnFooterMI.Caption=Kolon Sonu' + #13#10 +
      'OverlayMI.Caption=Yard�mc�' + #13#10 +
      'VerticalbandsMI.Caption=Dikey Bandlar' + #13#10 +
      'HeaderMI1.Caption=�st Ba�l�k' + #13#10 +
      'FooterMI1.Caption=Alt Ba�l�k' + #13#10 +
      'MasterDataMI1.Caption=As�l Veri' + #13#10 +
      'DetailDataMI1.Caption=Detay Veri' + #13#10 +
      'SubdetailDataMI1.Caption=Altdetay Veri' + #13#10 +
      'GroupHeaderMI1.Caption=Grup Ba�l���' + #13#10 +
      'GroupFooterMI1.Caption=Grup Sonu' + #13#10 +
      'ChildMI1.Caption=�ocuk' + #13#10 +
      'R0MI.Caption=0�' + #13#10 +
      'R45MI.Caption=45�' + #13#10 +
      'R90MI.Caption=90�' + #13#10 +
      'R180MI.Caption=180�' + #13#10 +
      'R270MI.Caption=270�' + #13#10 +
      'FontB.Hint=Yaz� Tipi Ayarlar�' + #13#10 +
      'BoldMI.Caption=Kal�n' + #13#10 +
      'ItalicMI.Caption=�talik' + #13#10 +
      'UnderlineMI.Caption=Alt� �izgili' + #13#10 +
      'SuperScriptMI.Caption=�st Simge' + #13#10 +
      'SubScriptMI.Caption=Alt Simge' + #13#10 +
      'CondensedMI.Caption=S�k��t�r�lm��' + #13#10 +
      'WideMI.Caption=Geni�' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'OpenDialog.Filter=Rapor (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=Pascal dosyalar� (*.pas)|*.pas|C++ dosyalar� (*.cpp)|*.cpp|JavaScript dosyalar� (*.js)|*.js|Basic dosyalar� (*.vb)|*.vb|T�m dosyalar|*.*' + #13#10 +
      'SaveScriptDialog.Filter=Pascal dosyalar� (*.pas)|*.pas|C++ dosyalar� (*.cpp)|*.cpp|JavaScript dosyalar� (*.js)|*.js|Basic dosyalar� (*.vb)|*.vb|T�m dosyalar|*.*' + #13#10 +
      '');
    Add('dsCm', 'Santimetre');
    Add('dsInch', '�n�');
    Add('dsPix', 'Pixel');
    Add('dsChars', 'Karakter');
    Add('dsCode', 'Kod');
    Add('dsPage', 'Sayfa');
    Add('dsRepFilter', 'Rapor (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'S�k��t�r��m�� Rapor (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', '�nizleme sayfas�ndaki de�i�iklikler kaydedilsin mi?');
    Add('dsSaveChangesTo', 'De�i�ikleri Kaydet ');
    Add('dsCantLoad', 'Dosya A��lamad�');
    Add('dsStyleFile', 'Bi�im');
    Add('dsCantFindProc', 'Ana prosed�r bulunamad�'); 
    Add('dsClearScript', 'T�m kod silinecek. Devam etmek istiyor musunuz?');
    Add('dsNoStyle', 'Bi�im yok');
    Add('dsStyleSample', '�rnek bi�im');
    Add('dsTextNotFound', '''%s'' metni bulunamad�'); 
    Add('dsReplace', '''%s'' metnini de�i�tirmek istiyo musunuz?'); 

    Add('TfrxAboutForm',
      'Caption=FastReport Hakk�nda' + #13#10 +
      'Label4.Caption=Daha fazla bilgi i�in Web sayfam�z� ziyaret edin:' + #13#10 +
      'Label6.Caption=Sat��:' + #13#10 +
      'Label8.Caption=Destek:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Sayfa Se�enekleri' + #13#10 +
      'OKB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      'TabSheet1.Caption=Ka��t' + #13#10 +
      'Label1.Caption=Geni�lik' + #13#10 +
      'Label2.Caption=Y�kseklik' + #13#10 +
      'Label11.Caption=�l��   ' + #13#10 +
      'Label12.Caption=Y�nlendirme   ' + #13#10 +
      'Label3.Caption=Sol' + #13#10 +
      'Label4.Caption=�st' + #13#10 +
      'Label5.Caption=Sa�' + #13#10 +
      'Label6.Caption=Alt' + #13#10 +
      'Label13.Caption=Bo�luklar   ' + #13#10 +
      'Label14.Caption=Ka��t Kayna��   ' + #13#10 +
      'Label9.Caption=�lk sayfa' + #13#10 +
      'Label10.Caption=Di�er sayfalar' + #13#10 +
      'PortraitRB.Caption=Dikey' + #13#10 +
      'LandscapeRB.Caption=Yatay' + #13#10 +
      'TabSheet3.Caption=Di�er Se�enekler' + #13#10 +
      'Label7.Caption=Kolonlar   ' + #13#10 +
      'Label8.Caption=Say�' + #13#10 +
      'Label15.Caption=Geni�lik' + #13#10 +
      'Label16.Caption=Konumlar' + #13#10 +
      'Label17.Caption=Di�er   ' + #13#10 +
      'Label18.Caption=�ift Y�nl�' + #13#10 +
      'PrintOnPrevCB.Caption=�nceki sayfay� yazd�r' + #13#10 +
      'MirrorMarginsCB.Caption=Bo�luklar� yans�t' + #13#10 +
      'LargeHeightCB.Caption=Dizayn a�amas�nda sayfalar b�y�k uzunlukta' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Rapor Dataset''ini Se�' + #13#10 +
      'OKB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=De�i�kenleri D�zenle' + #13#10 +
      'NewCategoryB.Caption=Kategori' + #13#10 +
      'NewVarB.Caption=De�i�ken' + #13#10 +
      'EditB.Caption=D�zenle' + #13#10 +
      'DeleteB.Caption=Sil' + #13#10 +
      'EditListB.Caption=Liste' + #13#10 +
      'LoadB.Caption=Y�kle' + #13#10 +
      'SaveB.Caption=Kaydet' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'ExprPanel.Caption= �fade:' + #13#10 +
      'OpenDialog1.Filter=S�zl�k (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=S�zl�k (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(de�i�lem tan�mlanmam��)');
    Add('vaVar', 'De�i�lenler');
    Add('vaDupName', 'Ayn� isim');

    Add('TfrxOptionsEditor',
      'Caption=Dizayn Se�enekleri' + #13#10 +
      'Label1.Caption=Tablo   ' + #13#10 +
      'Label2.Caption=T�r' + #13#10 +
      'Label3.Caption=�l��' + #13#10 +
      'Label4.Caption=Diyalog pencersi:' + #13#10 +
      'Label5.Caption=Di�er   ' + #13#10 +
      'Label6.Caption=Yaz� Tipileri   ' + #13#10 +
      'Label7.Caption=Kode penceresi' + #13#10 +
      'Label8.Caption=Text d�zenleyici' + #13#10 +
      'Label9.Caption=�l��' + #13#10 +
      'Label10.Caption=�l��' + #13#10 +
      'Label11.Caption=Renkler   ' + #13#10 +
      'Label12.Caption=Bandlar aras�ndaki bo�luk:' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=in' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      'CMRB.Caption=Santimetre:' + #13#10 +
      'InchesRB.Caption=�n�:' + #13#10 +
      'PixelsRB.Caption=Pixel:' + #13#10 +
      'ShowGridCB.Caption=Tabloyu g�ster' + #13#10 +
      'AlignGridCB.Caption=Tabloya Hizala' + #13#10 +
      'EditAfterInsCB.Caption=Ekledikten sonra d�zenle' + #13#10 +
      'ObjectFontCB.Caption=Nesnenin yaz� tipi ayarlar�n� kullan' + #13#10 +
      'WorkspaceB.Caption=�al��ma Alan�' + #13#10 +
      'ToolB.Caption=Ara� Penceresi' + #13#10 +
      'LCDCB.Caption=LCD tablo rengi' + #13#10 +
      'FreeBandsCB.Caption=Bo� band alan�' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Varsay�lan ayarlara d�n' + #13#10 +
      'BandsCaptionsCB.Caption=Band etiketlerini g�ster' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=DataSet se�' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      '');
    Add('dbNotAssigned', '[atanmam��]');
    Add('dbSingleLine', 'Tek sat�r');

    Add('TfrxGroupEditorForm',
      'Caption=Grup' + #13#10 +
      'BreakOnL.Caption=Kes   ' + #13#10 +
      'OptionsL.Caption=Se�enekler   ' + #13#10 +
      'OKB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      'DataFieldRB.Caption=Veri Sahas�' + #13#10 +
      'ExpressionRB.Caption=�fade' + #13#10 +
      'KeepGroupTogetherCB.Caption=Grubu birlikte tut' + #13#10 +
      'StartNewPageCB.Caption=Yeni sayfaya ba�la' + #13#10 +
      'OutlineCB.Caption=Ana hatlar i�inde g�ster' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=Sistem Metni' + #13#10 +
      'DataBandL.Caption=Veri Band�' + #13#10 +
      'DataSetL.Caption=DataSet' + #13#10 +
      'DataFieldL.Caption=VeriSahas�' + #13#10 +
      'FunctionL.Caption=Fonksiyon' + #13#10 +
      'ExpressionL.Caption=�fade' + #13#10 +            
      'OKB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      'AggregateRB.Caption=Toplam De�er' + #13#10 +
      'SysVariableRB.Caption=Sistem De�i�keni' + #13#10 +
      'CountInvisibleCB.Caption=G�r�nmez bandlar�n say�s�' + #13#10 +
      'TextRB.Caption=Metin' + #13#10 +
      'RunningTotalCB.Caption=Toplam �al��t�r�lan' + #13#10 +
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
      'EditB.Caption=D�zenle...' + #13#10 +
      'CloseB.Caption=��k��' + #13#10 +
      '');
    Add('olStretched', 'Uzat�lm��');

    Add('TfrxBarcodeEditorForm',
      'Caption=Barkod D�zenleyici' + #13#10 +
      'CodeLbl.Caption=Kod' + #13#10 +
      'TypeLbl.Caption=Bar''�n T�r�' + #13#10 +
      'ZoomLbl.Caption=Yakla�t�r:' + #13#10 +
      'OptionsLbl.Caption=Se�enekler   ' + #13#10 +
      'RotationLbl.Caption=D�nd�rme A��s�   ' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CalcCheckSumCB.Caption=Sa�lamas�n� Yap ' + #13#10 + 
      'ViewTextCB.Caption=Rakamlar� G�ster' + #13#10 +
      'Rotation0RB.Caption=0�' + #13#10 +
      'Rotation90RB.Caption=90�' + #13#10 +
      'Rotation180RB.Caption=180�' + #13#10 +
      'Rotation270RB.Caption=270�' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Sa�lamas�n� Yap'); 
    Add('bcShowText', 'Metni G�ster');

    Add('TfrxAliasesEditorForm',
      'Caption=G�r�nen ad� d�zenle' + #13#10 +
      'HintL.Caption=Maddeyi d�zenlemek i�in ENTER tu�una bas�n' + #13#10 +
      'DSAliasL.Caption=Dataset g�r�nen ad�' + #13#10 +
      'FieldAliasesL.Caption=Sahalar�n g�r�nen ad�' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      'ResetB.Caption=S�f�rla' + #13#10 +
      'UpdateB.Caption=Update' + #13#10 +
      '');
    Add('alUserName', 'Kullan�c� Ad�');
    Add('alOriginal', 'Orjinal Ad�');

    Add('TfrxParamsEditorForm',
      'Caption=Parametre D�zenleyici' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      '');
    Add('qpName', 'Ad�');
    Add('qpDataType', 'Veri T�r�');
    Add('qpValue', 'De�eri');

    Add('TfrxMDEditorForm',
      'Caption=As�l-Detay ba�lant�s�' + #13#10 +
      'Label1.Caption=Detay sahalar�' + #13#10 +
      'Label2.Caption=As�l sahalar' + #13#10 +
      'Label3.Caption=Ba�lant� sahalar�' + #13#10 +
      'AddB.Caption=Ekle' + #13#10 +
      'ClearB.Caption=Temizle' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=Metin' + #13#10 +
      'ExprB.Hint=�fade Ekle' + #13#10 +
      'AggregateB.Hint=Toplam Ekle' + #13#10 +
      'LocalFormatB.Hint=Bi�imleme Ekle' + #13#10 +
      'WordWrapB.Hint=S�zc�k Kayd�r' + #13#10 +
      'CancelB.Hint=Vazge�' + #13#10 +
      'OkB.Hint=Tamam' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=Resim' + #13#10 +
      'LoadB.Hint=Y�kle' + #13#10 +
      'CopyB.Hint=Kopyala' + #13#10 +
      'PasteB.Hint=Yap��t�r' + #13#10 +
      'ClearB.Hint=Temizle' + #13#10 +
      'CancelB.Hint=Vazge�' + #13#10 +
      'OkB.Hint=Tamam' + #13#10 +
      '');
    Add('piEmpty', 'Bo�');

    Add('TfrxChartEditorForm',
      'Caption=Grafik D�zenleyici' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=Seri Ekle' + #13#10 +
      'DeleteB.Hint=Seri Sil' + #13#10 +
      'DBSourceRB.Caption=Veri, Veritaban�ndan' + #13#10 +
      'FixedDataRB.Caption=Sabit Veri' + #13#10 +
      'DatasetLbl.Caption=Dataset' + #13#10 +
      'X1Lbl.Caption=X De�erleri' + #13#10 +
      'Y1Lbl.Caption=Y De�erleri' + #13#10 +
      'X3Lbl.Caption=X De�erleri (�rnek, a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Y De�erleri (�rnek, 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Di�er se�enekler   ' + #13#10 +
      'ShowTopLbl.Caption=TopN de�eri' + #13#10 + 
      'CaptionLbl.Caption=TopN etiketi' + #13#10 +
      'SortLbl.Caption=S�ralama' + #13#10 +
      'LineMI.Caption=3B �izgi' + #13#10 +
      'AreaMI.Caption=Alan Blo�u' + #13#10 +
      'PointMI.Caption=Nokta Da��l�m' + #13#10 +
      'BarMI.Caption=�ubuk' + #13#10 +
      'HorizBarMI.Caption=Dikey �ubuk' + #13#10 +
      'PieMI.Caption=Pasta' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +       
      'FastLineMI.Caption=�izgi' + #13#10 +
      '');
    Add('ch3D', '3D G�r�nt�');
    Add('chAxis', 'Ekseni g�ster');
    Add('chsoNone', 'Yok');
    Add('chsoAscending', 'Artan');
    Add('chsoDescending', 'Azalan');

    Add('TfrxRichEditorForm',
      'Caption=Zengin Metin D�zenleyici' + #13#10 +
      'OpenB.Hint=Dosya A�' + #13#10 +
      'SaveB.Hint=Dosya Kaydet' + #13#10 +
      'UndoB.Hint=Geri' + #13#10 +
      'TTB.Hint=Yaz� Tipi' + #13#10 +
      'ExprB.Hint=�fade Ekle' + #13#10 +
      'CancelB.Hint=Vazge�' + #13#10 +
      'OkB.Hint=Tamam' + #13#10 +
      'BoldB.Hint=Kal�n' + #13#10 +
      'ItalicB.Hint=�talik' + #13#10 +
      'UnderlineB.Hint=Alt� �izgili' + #13#10 +
      'LeftAlignB.Hint=Sola Hizal�' + #13#10 +
      'CenterAlignB.Hint=Ortal�' + #13#10 +
      'RightAlignB.Hint=Sa�a Hizal�' + #13#10 +
      'BlockAlignB.Hint=�ki Yana Hizal�' + #13#10 +
      'BulletsB.Hint=Madde �mi' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Tablo D�zenleyici' + #13#10 +
      'DatasetL.Caption=Kaynak Veri   ' + #13#10 +
      'DimensionsL.Caption=Boyutlar   ' + #13#10 +
      'RowsL.Caption=Sat�rlar' + #13#10 +
      'ColumnsL.Caption=Kolonlar' + #13#10 +
      'CellsL.Caption=H�creler' + #13#10 +
      'StructureL.Caption=Tablo Yap�s�   ' + #13#10 +
      'RowHeaderCB.Caption=Sat�r ba�l���' + #13#10 +
      'ColumnHeaderCB.Caption=Kolon ba�l���' + #13#10 +
      'RowTotalCB.Caption=Sat�r genel toplam�' + #13#10 +
      'ColumnTotalCB.Caption=Kolon genel toplam�' + #13#10 +
      'SwapB.Hint=Sat�rlar�/Kolonlar� de�i�tir' + #13#10 +
      'StyleCB.Hint=Tablo Bi�imi' + #13#10 +
      'FontB.Hint=Yaz� Tipi Ayarlar�' + #13#10 +
      'AlignLeftB.Hint=Sola Hizala' + #13#10 +
      'AlignCenterB.Hint=Ortala' + #13#10 +
      'AlignRightB.Hint=Sa�a Hizala' + #13#10 +
      'RotationB.Hint=Metin D�nd�rme A��s�' + #13#10 +
      'HighlightB.Hint=Vurgu' + #13#10 +
      'FormatB.Hint=Bi�im' + #13#10 +
      'FrameB.Hint=�er�eve Ayarlar�' + #13#10 +
      'FillColorB.Hint=Renk Doldur' + #13#10 +
      'Func1MI.Caption=Yok' + #13#10 +
      'Func2MI.Caption=Toplam' + #13#10 +
      'Func3MI.Caption=Mininum' + #13#10 +
      'Func4MI.Caption=Maksimum' + #13#10 +
      'Func5MI.Caption=Ortalama' + #13#10 +
      'Func6MI.Caption=Say�' + #13#10 +
      'Sort1MI.Caption=Artan S�ralama (A-Z)' + #13#10 +
      'Sort2MI.Caption=Azalan S�ralama (Z-A)' + #13#10 +
      'Sort3MI.Caption=S�ralama Yok' + #13#10 +
      'BoldMI.Caption=Kal�n' + #13#10 +
      'ItalicMI.Caption=�talik' + #13#10 +
      'UnderlineMI.Caption=Alt� �izgili' + #13#10 +
      'SuperScriptMI.Caption=�st Simge' + #13#10 +
      'SubScriptMI.Caption=Alt Simge' + #13#10 +
      'CondensedMI.Caption=S�k��t�r�lm��' + #13#10 +
      'WideMI.Caption=Geni�' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=Vazge�' + #13#10 +
      'OkB.Hint=Tamam' + #13#10 +
      '');
    Add('crSubtotal', 'Subtotal');
    Add('crNone', 'Yok');
    Add('crSum', 'Top');
    Add('crMin', 'Min');
    Add('crMax', 'Max');
    Add('crAvg', 'Ort');
    Add('crCount', 'Say�');
    Add('crAsc', 'A-Z');
    Add('crDesc', 'Z-A');
    Add('crFillMx', 'Tablo dolduruluyor...');
    Add('crBuildMx', 'Tablo yap�land�r�l�yor...');
    Add('crRepHdrs', 'Ba�l�klar� Tekrar Bas');
    Add('crBorder', '�er�eve');
    Add('crDown', 'Par�alara Ay�r');

    Add('TfrxExprEditorForm',
      'Caption=�fade D�zenleyici' + #13#10 +
      'ExprL.Caption=�fade:' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=G�r�nt� Bi�imi' + #13#10 +
      'CategoryL.Caption=Kategori' + #13#10 +
      'FormatL.Caption=Bi�im' + #13#10 +
      'FormatStrL.Caption=Bi�im metni:' + #13#10 +
      'SeparatorL.Caption=Ondal�k ayrac�:' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      '');
    Add('fkText', 'Metin (bi�imlendirilmemi�)');
    Add('fkNumber', 'Say�');
    Add('fkDateTime', 'Tarih/Saat');
    Add('fkBoolean', 'Do�ru/Yanl��');
    Add('fkNumber1', '1234.5;%g');
    Add('fkNumber2', '1234.50;%2.2f');
    Add('fkNumber3', '1,234.50;%2.2n');
    Add('fkNumber4', '$1,234.50;%2.2m');
    Add('fkDateTime1', '11.28.2002;mm.dd.yyyy');
    Add('fkDateTime2', '28 ksm 2002;dd mmm yyyy');
    Add('fkDateTime3', 'Kas�m 28, 2002;mmmm dd, yyyy');
    Add('fkDateTime4', '02:14;hh:mm');
    Add('fkDateTime5', '02:14am;hh:mm am/pm');
    Add('fkDateTime6', '02:14:00;hh:mm:ss');
    Add('fkDateTime7', '02:14am, Kas�m 28, 2002;hh:mm am/pm, mmmm dd, yyyy');
    Add('fkBoolean1', '0,1;0,1');
    Add('fkBoolean2', 'Hay�r,Evet;Hay�r,Evet');
    Add('fkBoolean3', '_,x;_,x');
    Add('fkBoolean4', 'Yanl��,Do�ru;Yanl��,Do�ru');   

    Add('TfrxHighlightEditorForm',
      'Caption=Vurgu' + #13#10 +
      'FontColorB.Caption=Renk...' + #13#10 +
      'BackColorB.Caption=Renk...' + #13#10 +
      'ConditionL.Caption=Ko�ul   ' + #13#10 +
      'FontL.Caption=Yaz� Tipi   ' + #13#10 +
      'BackgroundL.Caption=Arkaplan   ' + #13#10 +
      'OKB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      'BoldCB.Caption=Kal�n' + #13#10 +
      'ItalicCB.Caption=�talik' + #13#10 +
      'UnderlineCB.Caption=Alt� �izgili' + #13#10 +
      'TransparentRB.Caption=Saydam' + #13#10 +
      'OtherRB.Caption=Di�er' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Rapor Ayarlar�' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      'GeneralTS.Caption=Genel' + #13#10 +
      'ReportSettingsL.Caption=Yaz�c� Ayarlar�   ' + #13#10 +
      'CopiesL.Caption=Kopya' + #13#10 +
      'GeneralL.Caption=Genel   ' + #13#10 +
      'PasswordL.Caption=�ifre' + #13#10 +
      'CollateCB.Caption=Harmanl� kopya' + #13#10 +
      'DoublePassCB.Caption=�kinci Ge�i�' + #13#10 +
      'PrintIfEmptyCB.Caption=Bo�sa Yaz' + #13#10 +
      'DescriptionTS.Caption=Tan�mlama' + #13#10 +
      'NameL.Caption=Ad�' + #13#10 +
      'Description1L.Caption=Tan�mlama' + #13#10 +
      'PictureL.Caption=Resim' + #13#10 +
      'AuthorL.Caption=Yazar' + #13#10 +
      'MajorL.Caption=Maj�r' + #13#10 +
      'MinorL.Caption=Min�r' + #13#10 +
      'ReleaseL.Caption=Sunum' + #13#10 +
      'BuildL.Caption=Yap�' + #13#10 +
      'CreatedL.Caption=Olu�turuldu' + #13#10 +
      'ModifiedL.Caption=De�i�tiriildi' + #13#10 +
      'DescriptionL.Caption=Tan�mlama   ' + #13#10 +
      'VersionL.Caption=Versiyon   ' + #13#10 +
      'PictureB.Caption=G�z At...' + #13#10 +
      '');
    Add('rePrnOnPort', '�zerinde');

    Add('TfrxStringsEditorForm',
      'Caption=Sat�r' + #13#10 +
      'CancelB.Hint=Vazge�' + #13#10 +
      'OkB.Hint=Tamam' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=Vazge�' + #13#10 +
      'OkB.Hint=Tamam' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=�ifre' + #13#10 +
      'PasswordL.Caption=�ifreyi girin:' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=Bi�im D�zenleyici' + #13#10 +
      'ColorB.Caption=Renk...' + #13#10 +
      'FontB.Caption=Yaz� Tipi...' + #13#10 +
      'FrameB.Caption=�er�eve...' + #13#10 +
      'AddB.Hint=Ekle' + #13#10 +
      'DeleteB.Hint=Sil' + #13#10 +
      'EditB.Hint=D�zenle' + #13#10 +
      'LoadB.Hint=Y�kle' + #13#10 +
      'SaveB.Hint=Kaydet' + #13#10 +
      'CancelB.Hint=Vazge�' + #13#10 +
      'OkB.Hint=Tamam' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=�er�eve D�zenleyici' + #13#10 +
      'FrameL.Caption=�er�eve' + #13#10 +
      'LineL.Caption=�er�eve �izgisi' + #13#10 +
      'ShadowL.Caption=G�lge' + #13#10 +
      'FrameTopB.Hint=�st �izgi' + #13#10 +
      'FrameBottomB.Hint=Alt �izgi' + #13#10 +
      'FrameLeftB.Hint=Sol �izgi' + #13#10 +
      'FrameRightB.Hint=Sa� �izgi' + #13#10 +
      'FrameAllB.Hint=T�m �er�eve �izgileri' + #13#10 +
      'FrameNoB.Hint=�er�eve Yok' + #13#10 +
      'FrameColorB.Hint=�er�eve Rengi' + #13#10 +
      'FrameStyleB.Hint=�er�eve Bi�imi' + #13#10 +
      'FrameWidthCB.Hint=�er�eve Geni�li�i' + #13#10 +
      'ShadowB.Hint=G�lge' + #13#10 +
      'ShadowColorB.Hint=G�lge Rengi' + #13#10 +
      'ShadowWidthCB.Hint=G�lge Geni�li�i' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=Yeni Madde' + #13#10 +
      'ItemsTab.Caption=Maddeler' + #13#10 +
      'TemplatesTab.Caption=�ablonlar' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Tab S�ras�' + #13#10 +
      'Label1.Caption=Tab s�ras�na g�re nesne listesi:' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      'UpB.Caption=Yukar� Ta��' + #13#10 +
      'DownB.Caption=A�a�� Ta��' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=De�erlendirme' + #13#10 +  
      'Label1.Caption=�fade' + #13#10 +
      'Label2.Caption=Sonu�' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Rapor Sihirbaz�' + #13#10 +
      'DataTab.Caption=Veri' + #13#10 +
      'GroupsTab.Caption=Gruplar' + #13#10 +
      'LayoutTab.Caption=Alan' + #13#10 +
      'StyleTab.Caption=Bi�im' + #13#10 +
      'Step1L.Caption=Step 1. G�r�nt�lenecek DataSet ve sahalar� se�.' + #13#10 +
      'Step2L.Caption=Step 2. Gruplar� yarat (se�meli).' + #13#10 +
      'Step3L.Caption=Step 3. Sayfa y�nlendirmesini ve veri alan�n� tan�mla.' + #13#10 +
      'Step4L.Caption=Step 4. Rapor bi�imini se�.' + #13#10 +
      'AddFieldB.Caption=Ekle >' + #13#10 +
      'AddAllFieldsB.Caption=Hepsini ekle >>' + #13#10 +
      'RemoveFieldB.Caption=< Kald�r' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Hepsini kald�r' + #13#10 +
      'AddGroupB.Caption=Ekle >' + #13#10 +
      'RemoveGroupB.Caption=< Kald�r' + #13#10 +
      'SelectedFieldsL.Caption=Se�ili sahalar:' + #13#10 +
      'AvailableFieldsL.Caption=Kullan�labilir sahalar:' + #13#10 +
      'GroupsL.Caption=Gruplar:' + #13#10 +
      'OrientationL.Caption=Y�nlendirme   ' + #13#10 +
      'LayoutL.Caption=Yerle�tirme ' + #13#10 +
      'PortraitRB.Caption=Dikey' + #13#10 +
      'LandscapeRB.Caption=Yatay' + #13#10 +
      'TabularRB.Caption=Liste �ekli' + #13#10 +
      'ColumnarRB.Caption=Kart �ekli' + #13#10 +
      'FitWidthCB.Caption=Sahalar� sayfa geni�li�ine s��d�r' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      'BackB.Caption=<< Geri' + #13#10 +
      'NextB.Caption=�leri >>' + #13#10 +
      'FinishB.Caption=Son' + #13#10 +
      '');
    Add('wzStd', 'Standart Rapor Shirbaz�');
    Add('wzDMP', 'Nokta-Vuru�lu Rapor Sihirbaz�');
    Add('wzStdEmpty', 'Standart Rapor');
    Add('wzDMPEmpty', 'Nokta-Vuru�lu Rapor');


    Add('ftAllFiles', 'T�m Dosyalar');
    Add('ftPictures', 'Resimler');
    Add('ftDB', 'Veri Dosyalar�');
    Add('ftRichFile', 'Zengin Metin Dosyas�');
    Add('ftTextFile', 'Metin Dosyas�');

    Add('prNotAssigned', '(atanmam��)');
    Add('prInvProp', '�zellik de�eri ge�ersiz');
    Add('prDupl', 'Tekrarlanan ad');
    Add('prPict', '(Resim)');

    Add('mvExpr', '�fadelere �zin Ver');
    Add('mvStretch', 'S��d�r');
    Add('mvStretchToMax', 'Maksimum Y�ksekli�e S��d�r');
    Add('mvShift', 'Kayd�r');
    Add('mvShiftOver', '�zerine Bindi�inde Kayd�r');
    Add('mvVisible', 'G�r�n�r');
    Add('mvPrintable', 'Yazd�r�labilir');
    Add('mvFont', 'Yaz� Tipi...');
    Add('mvFormat', 'G�r�nt� Bi�imi...');
    Add('mvClear', '��indekileri Temizle');
    Add('mvAutoWidth', 'Otomatik Geni�lik');
    Add('mvWWrap', 'S�zc�k Kayd�r');
    Add('mvSuppress', 'Tekrarlanan De�erleri Gizle');
    Add('mvHideZ', 'S�f�rlar� Gizle');
    Add('mvHTML', 'HTML Koduna �zin ver');
    Add('lvDiagonal', '�apraz');
    Add('pvAutoSize', 'Otomatik Boyutland�r');
    Add('pvCenter', 'Ortala');
    Add('pvAspect', 'Y�n Oran�n� Tut');
    Add('bvSplit', 'B�l�nmeye �zin Ver');
    Add('bvKeepChild', '�ocuklar� Birlikte Tut');
    Add('bvPrintChild', 'G�r�nmezse �ocu�u Yazd�r');
    Add('bvStartPage', 'Yeni Sayfada Ba�la');
    Add('bvPrintIfEmpty', 'Detay� Bo�sa Yazd�r');
    Add('bvKeepDetail', 'Detay� Birlikte Tut');
    Add('bvKeepFooter', 'Sayfa Sonunu Birlikte Tut');
    Add('bvReprint', 'Yeni Sayfada Tekrar Yazd�r');
    Add('bvOnFirst', '�lk Sayfada Yazd�r');
    Add('bvOnLast', 'Son Sayfada Yazd�r');
    Add('bvKeepGroup', 'Birlikte Tut');
    Add('bvFooterAfterEach', 'Her Sat�rdan Sonra Alt Sayfa Sonu');
    Add('srParent', '�zerinde Bulundu�u Nesnede Yazd�r');
    Add('bvKeepHeader', 'Keep Header Together');

    Add('obCatDraw', '�izim');
    Add('obCatOther', 'Di�er nesneler');
    Add('obCatOtherControls', 'Di�er kontroller');
    Add('obDiagLine', '�apraz �izgi');
    Add('obRect', 'Dikd�rtgen');
    Add('obRoundRect', 'yuvarlanm�� dikd�rtgen');
    Add('obEllipse', 'Elips');
    Add('obTrian', '��gen');
    Add('obDiamond', 'Karo');
    Add('obLabel', 'Etiket kontrol�');
    Add('obEdit', 'Metin kontrol�');
    Add('obMemoC', 'Yaz� kontrol�');
    Add('obButton', 'D��me kontrol�');
    Add('obChBoxC', 'OnayKutusu kontrol�');
    Add('obRButton', 'RadyoD��me kontrol�');
    Add('obLBox', 'ListeKutusu kontrol�');
    Add('obCBox', 'A��lanListeKutusu kontrol�');
    Add('obDateEdit', 'Tarih kontrol�');
    Add('obImageC', 'Resim kontrol�');
    Add('obPanel', 'Panel kontrol�');
    Add('obGrBox', 'GrupKutusu kontrol�');
    Add('obBBtn', 'ResimliD��me kontrol�');
    Add('obSBtn', 'H�zl�D��me kontrol�');
    Add('obMEdit', 'Bi�imliMetin kontrol�');
    Add('obChLB', 'OnayListesiKutusu kontrol�');
    Add('obDBLookup', 'DBSorguluA��lanListeKutusu kontrol�');
    Add('obBevel', 'Bevel kontrol�');
    Add('obShape', '�ekil nesnesi');
    Add('obText', 'Metin nesnesi');
    Add('obSysText', 'Sistem metni');
    Add('obLine', '�izgi nesnesi');
    Add('obPicture', 'Resim nesnesi');
    Add('obBand', 'Band object');
    Add('obDataBand', 'Veri band�');
    Add('obSubRep', 'Alt rapor nesnesi');
    Add('obDlgPage', 'Diyalog formu');
    Add('obRepPage', 'Rapor sayfas�');
    Add('obReport', 'Rapor nesnesi');
    Add('obRich', 'Zengin metin nesnesi');
    Add('obOLE', 'OLE nesnesi');
    Add('obChBox', 'Onay kutusu nesnesi');
    Add('obChart', 'Grafik nesnesi');
    Add('obBarC', 'Barkod nesnesi');
    Add('obCross', 'Cross-tab object');
    Add('obDBCross', 'DB Cross-tab object');
    Add('obGrad', 'Dereceli renk nesnesi');
    Add('obDMPText', 'Nokta-vuru�lu metin nesnesi');
    Add('obDMPLine', 'Nokta-vuru�lu sat�r nesnesi');
    Add('obBDEDB', 'BDE Veritaban�');
    Add('obBDETb', 'BDE Tablosu');
    Add('obBDEQ', 'BDE Sorgusu');
    Add('obBDEComps', 'BDE Komponenetleri');
    Add('obIBXDB', 'IBX Veritaban�');
    Add('obIBXTb', 'IBX Tablo');
    Add('obIBXQ', 'IBX Sorgusu');
    Add('obIBXComps', 'IBX Komponenetleri');
    Add('obADODB', 'ADO Veritaban�');
    Add('obADOTb', 'ADO Tablosu');
    Add('obADOQ', 'ADO Sorgusu');
    Add('obADOComps', 'ADO Komponenetleri');
    Add('obDBXDB', 'DBX Veritaban�');
    Add('obDBXTb', 'DBX Tablosu');
    Add('obDBXQ', 'DBX Sorgusu');
    Add('obDBXComps', 'DBX Komponenetleri');

    Add('ctString', 'Metin');
    Add('ctDate', 'Tarih ve Saat');
    Add('ctConv', 'De�i�im');
    Add('ctFormat', 'Bi�im');
    Add('ctMath', 'Matematiksel');
    Add('ctOther', 'Di�er');

    Add('IntToStr', 'Rakamsal de�eri metin bi�imine d�n��t�r�r');
    Add('FloatToStr', 'Ondal�kl� de�eri metin bi�imine d�n��t�r�r');
    Add('DateToStr', 'Tarih de�eri metin bi�imine d�n��t�r�r');
    Add('TimeToStr', 'Saat de�eri metin bi�imine d�n��t�r�r');
    Add('DateTimeToStr', 'Tarih-saat de�eri metin bi�imine d�n��t�r�r');
    Add('VarToStr', 'De�i�ebilir de�eri metin bi�imine d�n��t�r�r');
    Add('StrToInt', 'Metni rakamsal bi�ime d�n��t�r�r');
    Add('StrToFloat', 'Metni ondal�kl� bi�ime d�n��t�r�r');
    Add('StrToDate', 'Metni tarih bi�imine d�n��t�r�r');
    Add('StrToTime', 'Metni saat bi�imine d�n��t�r�r');
    Add('StrToDateTime', 'Metni tarih-saat bi�imine d�n��t�r�r');
    Add('Format', 'Verilen bir dizi ve metni bi�imlendirerek yeni bir metin d�nd�r�r');
    Add('FormatFloat', 'Ondal�kl� de�eri belirli bir formata �evirir');
    Add('FormatDateTime', 'Tarih-saat de�erini belirli bir formata �evirir');
    Add('FormatMaskText', 'Metni belirli bir formata �evirir');
    Add('EncodeDate', 'Y�l, Ay ve G�n olarak gelen bir de�eri Tarih-Saat tipine �evirir');
    Add('DecodeDate', 'Tarih-Saat de�erini Y�l, Ay ve G�n olarak d�nd�r�r');
    Add('EncodeTime', 'Saat, Dakika, Saniye ve Milisaniye olarak gelen bir de�eri Tarih-Saat tipine �evirir');
    Add('DecodeTime', 'Tarih-Saat de�erini, Saat, Dakika, Saniye ve Milisaniye olarak d�nd�r�r');
    Add('Date', 'Ge�erli tarihi d�nd�r�r');
    Add('Time', 'Ge�erli saati d�nd�r�r');
    Add('Now', 'Ge�erli tarih ve saati d�nd�r�r');
    Add('DayOfWeek', 'G�n�n hangi haftaya ait oldu�unu d�nd�r�r');
    Add('IsLeapYear', 'Y�l�n art�k y�l olup olmad���n� d�nd�r�r');
    Add('DaysInMonth', 'Ay�n g�n say�s�n� d�nd�r�r');
    Add('Length', 'Metnin uzunlu�unu d�nd�r�r');
    Add('Copy', 'Metnin i�inden bir alt metin d�nd�r�r');
    Add('Pos', 'Metnin i�inden bir alt metnin ba�lang�� pozisyonunu verir');
    Add('Delete', 'Metnin i�inden metin siler');
    Add('Insert', 'Metnin i�ine alt metin ekler');
    Add('Uppercase', 'Metnin t�m karakterlerini b�y�k harfe d�n��t�r�r');
    Add('Lowercase', 'Metnin t�m karakterlerini k���k harfe d�n��t�r�r');
    Add('Trim', 'Metnin ba��ndaki ve sonundaki bo�luklar� atar');
    Add('NameCase', 'Metnin ilk karakterini b�y�k harfe d�n��t�r�r');
    Add('CompareText', '�ki metni kar��la�t�r�r');
    Add('Chr', 'Rakamsal de�eri karaktere d�n��t�r�r');
    Add('Ord', 'Bir karakterin rakamsal de�erini d�n��t�r�r');
    Add('SetLength', 'Metnin uzunlu�unu ayarlar');
    Add('Round', 'Say�sal bir de�eri en yak�n de�ere yuvarlar');
    Add('Trunc', 'Kesirli say�lar�n tam say� k�sm�n� d�nd�r�r');
    Add('Int', 'Reel bir say�y� rakamsal say�ya d�n��t�r�r');
    Add('Frac', 'Kesirli say�lar�n kesir k�sm�n� d�nd�r�r');
    Add('Sqrt', 'Bir say�n�n karesini d�nd�r�r');
    Add('Abs', 'Tam say�ya �evirir');
    Add('Sin', 'Sin�s''e �evirir (radyan''da)');
    Add('Cos', 'Cosin�s''e �evirir (radyan''da)');
    Add('ArcTan', 'Arktanjanta �evirir');
    Add('Tan', 'Tanjanta �evirir');
    Add('Exp', 'Say�n�n �stel de�erini d�nd�r�r');
    Add('Ln', 'Reel bir say�y� logaritma''ya �evirir');
    Add('Pi', '3.1415926... de�erini numaraya �evirir');
    Add('Inc', 'De�eri artt�r�r');
    Add('Dec', 'De�eri azalt�r');
    Add('RaiseException', '�stisnai durum');
    Add('ShowMessage', 'Mesaj kutusu g�ster');
    Add('Randomize', 'Rastgele rakamsal de�er �retir');
    Add('Random', 'Rastgele bir rakamsal de�er d�nd�r�r');
    Add('ValidInt', 'Metin ge�erli bir float de�er i�eriyorsa "True" d�nd�r�r');
    Add('ValidFloat', 'Metin ge�erli bir float de�er i�eriyorsa "True" d�nd�r�r');
    Add('ValidDate', 'Metin ge�erli bir tarih i�eriyorsa "True" d�nd�r�r');
    Add('IIF', 'E�er ifade "True" ise "Do�ruDe�er" d�nd�r�r, di�er durumlarda "Yanl��De�er" d�nd�r�r');
    Add('Get', 'Sadece i� kullan�m i�in');
    Add('Set', 'Sadece i� kullan�m i�in');
    Add('InputBox', 'Kullan�c�n�n metin girebilmesi i�in bir bilgi giri� ekran� g�sterir');
    Add('InputQuery', 'Kullan�c�n�n metin girebilmesi i�in bir bilgi giri� ekran� g�sterir');
    Add('MessageDlg', 'Mesaj kutusu g�ster');
    Add('CreateOleObject', 'Bir OLE nesnesi olu�tur');
    Add('VarArrayCreate', 'De�i�ebilir dizi olu�tur');
    Add('VarType', 'De�i�ebilir de�erin tipini d�nd�r');
    Add('DayOf', 'Verilen tarihten g�n� (1..31) d�nderir');
    Add('MonthOf', 'Verilen tarihten ay (1..12) d�nderir');
    Add('YearOf', 'Verilen tarihten y�l� d�nderir');

    Add('ctAggregate', 'Hesaplamalar');
    Add('Sum', 'Bandtaki belirtilen alan�n toplam�n� hesapla');
    Add('Avg', 'Bandtaki averajl� veriyi hesapla');
    Add('Min', 'Bandtaki minimum veriyi hesapla');
    Add('Max', 'Bandtaki maksimum veriyi hesapla');
    Add('Count', 'Data sat�r� kay�t say�s�');
  end;
end;


initialization
  frAddDesignerRes;

end.
