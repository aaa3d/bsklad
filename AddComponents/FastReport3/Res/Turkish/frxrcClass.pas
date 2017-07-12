
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
      'Caption=�nizleme' + #13#10 +
      'PrintB.Caption=Yazd�r' + #13#10 +
      'PrintB.Hint=Yazd�r' + #13#10 +
      'OpenB.Caption=A�' + #13#10 +
      'OpenB.Hint=A�' + #13#10 +
      'SaveB.Caption=Kaydet' + #13#10 +
      'SaveB.Hint=Kaydet' + #13#10 +
      'ExportB.Caption=Veri Ver' + #13#10 +
      'ExportB.Hint=Veri Ver' + #13#10 +
      'FindB.Caption=Bul' + #13#10 +
      'FindB.Hint=Bul' + #13#10 +
      'ZoomWholePageB.Caption=T�m Sayfa' + #13#10 +
      'ZoomWholePageB.Hint=T�m Sayfa' + #13#10 +
      'ZoomPageWidthB.Caption=Sayfa Geni�li�i' + #13#10 +
      'ZoomPageWidthB.Hint=Sayfa Geni�li�i' + #13#10 +
      'Zoom100B.Caption=%100' + #13#10 +
      'Zoom100B.Hint=%100' + #13#10 +
      'Zoom50B.Caption=�ki Sayfa' + #13#10 +
      'Zoom50B.Hint=�ki Sayfa' + #13#10 +
      'ZoomCB.Hint=Yak�nla�t�r' + #13#10 +
      'PageSettingsB.Caption=Kenar Bo�luklar�' + #13#10 +
      'PageSettingsB.Hint=Kenar Bo�luklar�' + #13#10 +
      'OutlineB.Caption=Anahat' + #13#10 +
      'OutlineB.Hint=Anahat' + #13#10 +
      'HandToolB.Caption=Ta��' + #13#10 + 
      'HandToolB.Hint=Ta��ma Arac�' + #13#10 +
      'ZoomToolB.Caption=Yak�nla�t�r' + #13#10 +
      'ZoomToolB.Hint=Yak�nla�t�rma Arac�' + #13#10 +
      'NewPageB.Caption=Sayfa Ekle' + #13#10 +
      'NewPageB.Hint=Sayfa Ekle' + #13#10 +
      'DelPageB.Caption=Sil' + #13#10 +
      'DelPageB.Hint=Sayfa Sil' + #13#10 +
      'DesignerB.Caption=D�zenlet' + #13#10 +
      'DesignerB.Hint=Sayfa D�zenle' + #13#10 +
      'FirstB.Caption=�lk' + #13#10 +
      'FirstB.Hint=�lk Sayfa' + #13#10 +
      'PriorB.Caption=�nceki' + #13#10 +
      'PriorB.Hint=�nceki Sayfa' + #13#10 +
      'NextB.Caption=Sonraki' + #13#10 +
      'NextB.Hint=Sonraki Sayfa' + #13#10 +
      'LastB.Caption=Son' + #13#10 +
      'LastB.Hint=Son Sayfa' + #13#10 +
      'CancelB.Caption=Kapat' + #13#10 +
      'PageE.Hint=Sayfa Numaras�' + #13#10 +
      '');
    Add('zmPageWidth', 'Sayfa geni�li�i');
    Add('zmWholePage', 'T�m sayfa');

    Add('TfrxPrintDialog',
      'Caption=Yazd�r' + #13#10 +
      'Label12.Caption=Yaz�c�   ' + #13#10 +
      'DescrL.Caption=Sayfa numaralar�n� ve/veya sayfa aral�klar�n� virg�lle ay�rarak girin. �rn. 1,3,5-12' + #13#10 +
      'Label1.Caption=Sayfa Aral���   ' + #13#10 +
      'CopiesL.Caption=Kopya Say�s�' + #13#10 +
      'CollateL.Caption=Harmanla' + #13#10 +
      'Label2.Caption=Kopya say�s�   ' + #13#10 +
      'PrintL.Caption=Yazd�r' + #13#10 +
      'TypeL.Caption=T�r:' + #13#10 +
      'WhereL.Caption=Konum:' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      'PropButton.Caption=�zellikler...' + #13#10 +
      'AllRB.Caption=T�m�' + #13#10 +
      'CurPageRB.Caption=Ge�erli sayfa' + #13#10 +
      'PageNumbersRB.Caption=Sayfa:' + #13#10 +
      'FileCB.Caption=Dosyaya yazd�r' + #13#10 +
      'ReverseCB.Caption=Sayfay� �evir' + #13#10 +
      '');
    Add('ppAll', 'T�m sayfalar');
    Add('ppOdd', 'Tek sayfalar');
    Add('ppEven', '�ift sayfalar');

    Add('TfrxSearchDialog',
      'Caption=Bul' + #13#10 +
      'TextL.Caption=Aranacak kelime:' + #13#10 +
      'SearchL.Caption=Arama se�enekleri   ' + #13#10 +
      'ReplaceL.Caption=De�i�tir' + #13#10 +
      'TopCB.Caption=Ba�tan ara' + #13#10 +
      'CaseCB.Caption=B�y�k/k���k harf duyarl�' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Sayfa Ayarlar�' + #13#10 +
      'WidthL.Caption=Geni�lik' + #13#10 +
      'HeightL.Caption=Y�kseklik' + #13#10 +
      'SizeL.Caption=Ka��t Boyutu  ' + #13#10 +
      'OrientationL.Caption=Y�nlendirme  ' + #13#10 +
      'LeftL.Caption=Sol' + #13#10 +
      'TopL.Caption=�st' + #13#10 +
      'RightL.Caption=Sa�' + #13#10 +
      'BottomL.Caption=Alt' + #13#10 +
      'MarginsL.Caption=Kenar Bo�luklar� ' + #13#10 +
      'PortraitRB.Caption=Dikey' + #13#10 +
      'LandscapeRB.Caption=Yatay' + #13#10 +
      'cmL1.Caption=cm' + #13#10 +
      'cmL2.Caption=cm' + #13#10 +
      'cmL3.Caption=cm' + #13#10 +
      'cmL4.Caption=cm' + #13#10 +
      'cmL5.Caption=cm' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      'OtherL.Caption=Di�er  ' + #13#10 +
      'ApplyToCurRB.Caption=Ge�erli sayfaya uygula' + #13#10 +
      'ApplyToAllRB.Caption=T�m sayfalara uygula' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Yazd�r' + #13#10 +
      'PrinterL.Caption=Yaz�c�   ' + #13#10 +
      'PagesL.Caption=Sayfa Aral���   ' + #13#10 +
      'CopiesL.Caption=Kopya Say�s�   ' + #13#10 +
      'CopiesNL.Caption=Kopya Say�s�' + #13#10 +
      'DescrL.Caption=Sayfa numaralar�n� ve/veya sayfa aral�klar�n� virg�lle ay�rarak girin. �rn. 1,3,5-12' + #13#10 +
      'OptionsL.Caption=Se�enekler   ' + #13#10 +
      'EscL.Caption=��k�� �ekli   ' + #13#10 +
      'OK.Caption=Tamam' + #13#10 +
      'Cancel.Caption=Vazge�' + #13#10 +
      'SaveToFileCB.Caption=Dosyaya yazdir' + #13#10 +
      'AllRB.Caption=T�m�' + #13#10 +
      'CurPageRB.Caption=Ge�erli Sayfa' + #13#10 +
      'PageNumbersRB.Caption=Sayfa:' + #13#10 +
      'PageBreaksCB.Caption=Sayfa Sonu' + #13#10 +
      'OemCB.Caption=OEM kod sayfas�' + #13#10 +
      'PseudoCB.Caption=Pseudographic' + #13#10 +   
      'SaveDialog1.Filter=Yaz�c� dosyas� (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Vazge�' + #13#10 +
      '');

    Add('mbConfirm', 'Onayla');
    Add('mbError', 'Hata');
    Add('mbInfo', 'Bilgi');
    Add('xrCantFindClass', 'S�n�f bulunamad�');
    Add('prVirtual', 'Sanal');
    Add('prDefault', 'Varsay�lan');
    Add('prCustom', '�zel');
    Add('enUnconnHeader', 'Ba�lant�s�z Rapor Ba�l���/Sonu');
    Add('enUnconnGroup', 'Grup i�in veri band� yok');
    Add('enUnconnGFooter', 'Grup ba�l��� olmayan');
    Add('enBandPos', 'Ge�ersiz band pozisyonu:');
    Add('dbNotConn', '%s DataSet''i veriye ba�lanmam��');
    Add('dbFldNotFound', 'Saha bulunamad�:');
    Add('clDSNotIncl', '(Rapor.DataSets''e dataset tan�mlanmam��)');
    Add('clUnknownVar', 'Bilinmeyen de�i�ken veya saha:');
    Add('clScrError', 'Script Hatas� %s: %s');
    Add('clDSNotExist', '"%s" Dataset''i olu�turulmam��');
    Add('clErrors', 'A�a��daki hata(lar) olu�tu:');
    Add('clExprError', 'S�z dizimi hatas�');
    Add('clFP3files', 'Rapor Haz�rland�');
    Add('clSaving', 'Dosya Kaydediliyor...');
    Add('clCancel', 'Vazge�');
    Add('clClose', 'Kapat');
    Add('clPrinting', 'Sayfa yazd�r�l�yor');
    Add('clLoading', 'Dosya y�kleniyor...');
    Add('clPageOf', 'Sayfa %d / %d');
    Add('clFirstPass', '�lk ge�i�: sayfa ');  
    Add('clNoPrinters', 'Bilgisayar�n�zda kurulu hi�bir yaz�c� yok');
    Add('clDecompressError', 'Stream a��lma hatas�');

    Add('prRunningFirst', '�lk �al��an : sayfa %d');
    Add('prRunning', 'Haz�rlanan sayfa %d');
    Add('prPrinting', 'Yaz�lan sayfa %d');
    Add('prExporting', 'Sayfa d��ar� at�l�yor %d');
    Add('uCm', 'cm');
    Add('uInch', 'in');
    Add('uPix', 'px');
    Add('uChar', 'chr');
  end;
end;


initialization
  frAddClassesRes;

end.