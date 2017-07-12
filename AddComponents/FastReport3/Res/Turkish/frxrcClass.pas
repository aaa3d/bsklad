
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

unit frxrcClass;

interface

procedure frAddClassesRes;


implementation

uses frxRes;


procedure frAddClassesRes;
begin
  with frxResources do
  begin
    Add('TfrxPreviewForm',
      'Caption=Önizleme' + #13#10 +
      'PrintB.Caption=Yazdýr' + #13#10 +
      'PrintB.Hint=Yazdýr' + #13#10 +
      'OpenB.Caption=Aç' + #13#10 +
      'OpenB.Hint=Aç' + #13#10 +
      'SaveB.Caption=Kaydet' + #13#10 +
      'SaveB.Hint=Kaydet' + #13#10 +
      'ExportB.Caption=Veri Ver' + #13#10 +
      'ExportB.Hint=Veri Ver' + #13#10 +
      'FindB.Caption=Bul' + #13#10 +
      'FindB.Hint=Bul' + #13#10 +
      'ZoomWholePageB.Caption=Tüm Sayfa' + #13#10 +
      'ZoomWholePageB.Hint=Tüm Sayfa' + #13#10 +
      'ZoomPageWidthB.Caption=Sayfa Geniþliði' + #13#10 +
      'ZoomPageWidthB.Hint=Sayfa Geniþliði' + #13#10 +
      'Zoom100B.Caption=%100' + #13#10 +
      'Zoom100B.Hint=%100' + #13#10 +
      'Zoom50B.Caption=Ýki Sayfa' + #13#10 +
      'Zoom50B.Hint=Ýki Sayfa' + #13#10 +
      'ZoomCB.Hint=Yakýnlaþtýr' + #13#10 +
      'PageSettingsB.Caption=Kenar Boþluklarý' + #13#10 +
      'PageSettingsB.Hint=Kenar Boþluklarý' + #13#10 +
      'OutlineB.Caption=Anahat' + #13#10 +
      'OutlineB.Hint=Anahat' + #13#10 +
      'HandToolB.Caption=Taþý' + #13#10 + 
      'HandToolB.Hint=Taþýma Aracý' + #13#10 +
      'ZoomToolB.Caption=Yakýnlaþtýr' + #13#10 +
      'ZoomToolB.Hint=Yakýnlaþtýrma Aracý' + #13#10 +
      'NewPageB.Caption=Sayfa Ekle' + #13#10 +
      'NewPageB.Hint=Sayfa Ekle' + #13#10 +
      'DelPageB.Caption=Sil' + #13#10 +
      'DelPageB.Hint=Sayfa Sil' + #13#10 +
      'DesignerB.Caption=Düzenlet' + #13#10 +
      'DesignerB.Hint=Sayfa Düzenle' + #13#10 +
      'FirstB.Caption=Ýlk' + #13#10 +
      'FirstB.Hint=Ýlk Sayfa' + #13#10 +
      'PriorB.Caption=Önceki' + #13#10 +
      'PriorB.Hint=Önceki Sayfa' + #13#10 +
      'NextB.Caption=Sonraki' + #13#10 +
      'NextB.Hint=Sonraki Sayfa' + #13#10 +
      'LastB.Caption=Son' + #13#10 +
      'LastB.Hint=Son Sayfa' + #13#10 +
      'CancelB.Caption=Kapat' + #13#10 +
      'PageE.Hint=Sayfa Numarasý' + #13#10 +
      '');
    Add('zmPageWidth', 'Sayfa geniþliði');
    Add('zmWholePage', 'Tüm sayfa');

    Add('TfrxPrintDialog',
      'Caption=Yazdýr' + #13#10 +
      'Label12.Caption=Yazýcý   ' + #13#10 +
      'DescrL.Caption=Sayfa numaralarýný ve/veya sayfa aralýklarýný virgülle ayýrarak girin. Örn. 1,3,5-12' + #13#10 +
      'Label1.Caption=Sayfa Aralýðý   ' + #13#10 +
      'CopiesL.Caption=Kopya Sayýsý' + #13#10 +
      'CollateL.Caption=Harmanla' + #13#10 +
      'Label2.Caption=Kopya sayýsý   ' + #13#10 +
      'PrintL.Caption=Yazdýr' + #13#10 +
      'TypeL.Caption=Tür:' + #13#10 +
      'WhereL.Caption=Konum:' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      'PropButton.Caption=Özellikler...' + #13#10 +
      'AllRB.Caption=Tümü' + #13#10 +
      'CurPageRB.Caption=Geçerli sayfa' + #13#10 +
      'PageNumbersRB.Caption=Sayfa:' + #13#10 +
      'FileCB.Caption=Dosyaya yazdýr' + #13#10 +
      'ReverseCB.Caption=Sayfayý çevir' + #13#10 +
      '');
    Add('ppAll', 'Tüm sayfalar');
    Add('ppOdd', 'Tek sayfalar');
    Add('ppEven', 'Çift sayfalar');

    Add('TfrxSearchDialog',
      'Caption=Bul' + #13#10 +
      'TextL.Caption=Aranacak kelime:' + #13#10 +
      'SearchL.Caption=Arama seçenekleri   ' + #13#10 +
      'ReplaceL.Caption=Deðiþtir' + #13#10 +
      'TopCB.Caption=Baþtan ara' + #13#10 +
      'CaseCB.Caption=Büyük/küçük harf duyarlý' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Sayfa Ayarlarý' + #13#10 +
      'WidthL.Caption=Geniþlik' + #13#10 +
      'HeightL.Caption=Yükseklik' + #13#10 +
      'SizeL.Caption=Kaðýt Boyutu  ' + #13#10 +
      'OrientationL.Caption=Yönlendirme  ' + #13#10 +
      'LeftL.Caption=Sol' + #13#10 +
      'TopL.Caption=Üst' + #13#10 +
      'RightL.Caption=Sað' + #13#10 +
      'BottomL.Caption=Alt' + #13#10 +
      'MarginsL.Caption=Kenar Boþluklarý ' + #13#10 +
      'PortraitRB.Caption=Dikey' + #13#10 +
      'LandscapeRB.Caption=Yatay' + #13#10 +
      'cmL1.Caption=cm' + #13#10 +
      'cmL2.Caption=cm' + #13#10 +
      'cmL3.Caption=cm' + #13#10 +
      'cmL4.Caption=cm' + #13#10 +
      'cmL5.Caption=cm' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      'OtherL.Caption=Diðer  ' + #13#10 +
      'ApplyToCurRB.Caption=Geçerli sayfaya uygula' + #13#10 +
      'ApplyToAllRB.Caption=Tüm sayfalara uygula' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Yazdýr' + #13#10 +
      'PrinterL.Caption=Yazýcý   ' + #13#10 +
      'PagesL.Caption=Sayfa Aralýðý   ' + #13#10 +
      'CopiesL.Caption=Kopya Sayýsý   ' + #13#10 +
      'CopiesNL.Caption=Kopya Sayýsý' + #13#10 +
      'DescrL.Caption=Sayfa numaralarýný ve/veya sayfa aralýklarýný virgülle ayýrarak girin. Örn. 1,3,5-12' + #13#10 +
      'OptionsL.Caption=Seçenekler   ' + #13#10 +
      'EscL.Caption=Çýkýþ þekli   ' + #13#10 +
      'OK.Caption=Tamam' + #13#10 +
      'Cancel.Caption=Vazgeç' + #13#10 +
      'SaveToFileCB.Caption=Dosyaya yazdir' + #13#10 +
      'AllRB.Caption=Tümü' + #13#10 +
      'CurPageRB.Caption=Geçerli Sayfa' + #13#10 +
      'PageNumbersRB.Caption=Sayfa:' + #13#10 +
      'PageBreaksCB.Caption=Sayfa Sonu' + #13#10 +
      'OemCB.Caption=OEM kod sayfasý' + #13#10 +
      'PseudoCB.Caption=Pseudographic' + #13#10 +   
      'SaveDialog1.Filter=Yazýcý dosyasý (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Vazgeç' + #13#10 +
      '');

    Add('mbConfirm', 'Onayla');
    Add('mbError', 'Hata');
    Add('mbInfo', 'Bilgi');
    Add('xrCantFindClass', 'Sýnýf bulunamadý');
    Add('prVirtual', 'Sanal');
    Add('prDefault', 'Varsayýlan');
    Add('prCustom', 'Özel');
    Add('enUnconnHeader', 'Baðlantýsýz Rapor Baþlýðý/Sonu');
    Add('enUnconnGroup', 'Grup için veri bandý yok');
    Add('enUnconnGFooter', 'Grup baþlýðý olmayan');
    Add('enBandPos', 'Geçersiz band pozisyonu:');
    Add('dbNotConn', '%s DataSet''i veriye baðlanmamýþ');
    Add('dbFldNotFound', 'Saha bulunamadý:');
    Add('clDSNotIncl', '(Rapor.DataSets''e dataset tanýmlanmamýþ)');
    Add('clUnknownVar', 'Bilinmeyen deðiþken veya saha:');
    Add('clScrError', 'Script Hatasý %s: %s');
    Add('clDSNotExist', '"%s" Dataset''i oluþturulmamýþ');
    Add('clErrors', 'Aþaðýdaki hata(lar) oluþtu:');
    Add('clExprError', 'Söz dizimi hatasý');
    Add('clFP3files', 'Rapor Hazýrlandý');
    Add('clSaving', 'Dosya Kaydediliyor...');
    Add('clCancel', 'Vazgeç');
    Add('clClose', 'Kapat');
    Add('clPrinting', 'Sayfa yazdýrýlýyor');
    Add('clLoading', 'Dosya yükleniyor...');
    Add('clPageOf', 'Sayfa %d / %d');
    Add('clFirstPass', 'Ýlk geçiþ: sayfa ');  
    Add('clNoPrinters', 'Bilgisayarýnýzda kurulu hiçbir yazýcý yok');
    Add('clDecompressError', 'Stream açýlma hatasý');

    Add('prRunningFirst', 'Ýlk çalýþan : sayfa %d');
    Add('prRunning', 'Hazýrlanan sayfa %d');
    Add('prPrinting', 'Yazýlan sayfa %d');
    Add('prExporting', 'Sayfa dýþarý atýlýyor %d');
    Add('uCm', 'cm');
    Add('uInch', 'in');
    Add('uPix', 'px');
    Add('uChar', 'chr');
  end;
end;


initialization
  frAddClassesRes;

end.