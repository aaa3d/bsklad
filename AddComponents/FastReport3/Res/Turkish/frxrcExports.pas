
{******************************************}
{                                          }
{             FastReport v3.0              }
{         Language resource file           }
{                                          }
{            Copyright (c) 2004            }
{          by Alexander Fediachov,         }
{             Fast Reports, Inc.           }
{                                          }
{     Translated by Tayfun SUSAMCIOGLU     }
{       Tolga CAGLAYAN, Ozkan DEMIR        }
{                 TURKEY                   }
{                                          }
{******************************************}

unit frxrcExports;

interface

procedure frAddExportsRes;

implementation

uses frxRes;

procedure frAddExportsRes;
begin
  with frxResources do
  begin
    frxResources.Add('TfrxXLSExportDialog',
      'Caption=Excel dosyasýna ver' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      'GroupPageRange.Caption= Yazdýrma Aralýðý ' + #13#10 +
      'AllRB.Caption=Tümü' + #13#10 +
      'CurPageRB.Caption=Geçerli sayfa' + #13#10 +
      'PageNumbersRB.Caption=Sayfalar:' + #13#10 +
      'DescrL.Caption=Sayfa numaralarýný ve/veya sayfa aralýklarýný virgülle ayýrarak girin. Örn. 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Verme ayarlarý' + #13#10 +
      'StylesCB.Caption=Stiller' + #13#10 +
      'PicturesCB.Caption=Resimler' + #13#10 +
      'MergeCB.Caption=Hücreleri birleþtir' + #13#10 +
      'PageBreaksCB.Caption=Sayfa sonu' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenExcelCB.Caption=Kaydettikten sonra Excel''i aç' + #13#10 +
      'SaveDialog1.Filter=Excel dosyasý (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=Excel dosyasýna ver' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      'GroupPageRange.Caption= Yazdýrma Aralýðý ' + #13#10 +
      'AllRB.Caption=Tümü' + #13#10 +
      'CurPageRB.Caption=Geçerli sayfa' + #13#10 +
      'PageNumbersRB.Caption=Sayfalar:' + #13#10 +
      'DescrL.Caption=Sayfa numaralarýný ve/veya sayfa aralýklarýný virgülle ayýrarak girin. Örn. 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Verme ayarlarý' + #13#10 +
      'StylesCB.Caption=Stiller' + #13#10 +
      'PageBreaksCB.Caption=Sayfa sonu' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenExcelCB.Caption=Kaydettikten sonra Excel''i aç' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=XML Excel dosyasý (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=HTML dosyasýna ver' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      'GroupPageRange.Caption= Yazdýrma Aralýðý ' + #13#10 +
      'AllRB.Caption=Tümü' + #13#10 +
      'CurPageRB.Caption=Geçerli sayfa' + #13#10 +
      'PageNumbersRB.Caption=Sayfalar:' + #13#10 +
      'DescrL.Caption=Sayfa numaralarýný ve/veya sayfa aralýklarýný virgülle ayýrarak girin. Örn. 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Verme ayarlarý' + #13#10 +
      'OpenAfterCB.Caption=Kaydettikten sonra aç' + #13#10 +
      'StylesCB.Caption=Stiller' + #13#10 +
      'PicturesCB.Caption=Resimler' + #13#10 +
      'PicsSameCB.Caption=Hepsi bir klasöre' + #13#10 +
      'FixWidthCB.Caption=Sabit geniþlik' + #13#10 +
      'NavigatorCB.Caption=Sayfa gezgini' + #13#10 +
      'MultipageCB.Caption=Çoklu sayfa' + #13#10 +
      'MozillaCB.Caption=Mozilla tarayýcýsý' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=HTML dosyasý (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Text dosyasýna ver (nokta-vuruþlu yazýcý)' + #13#10 +
      'OK.Caption=Tamam' + #13#10 +
      'Cancel.Caption=Vazgeç' + #13#10 +
      'BtnPreview.Hint=Önizleme açýk/kapalý' + #13#10 +
      'GroupCellProp.Caption= Verme ayarlarý  ' + #13#10 +
      'CB_PageBreaks.Caption=Sayfa sonu' + #13#10 +
      'CB_OEM.Caption=OEM kod sayfasý' + #13#10 +
      'CB_EmptyLines.Caption=Boþ satýrlar' + #13#10 +
      'CB_LeadSpaces.Caption=Baþlýk boþluðu' + #13#10 +
      'GroupPageRange.Caption= Yazdýrma Aralýðý  ' + #13#10 +
      'Pages.Caption=Sayfalar:' + #13#10 +
      'Descr.Caption=Sayfa numaralarýný ve/veya sayfa aralýklarýný virgülle ayýrarak girin. Örn. 1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption= Ölçeklendirme ' + #13#10 +
      'ScX.Caption=Yatay' + #13#10 +
      'ScY.Caption=Dikey' + #13#10 +
      'GroupFramesSettings.Caption= Çerçeveler ' + #13#10 +
      'RB_NoneFrames.Caption=Yok' + #13#10 +
      'RB_Simple.Caption=Basit' + #13#10 +
      'RB_Graph.Caption=Grafik' + #13#10 +
      'RB_Graph.Hint=Sadece OEM kod sayfasý' + #13#10 +
      'CB_PrintAfter.Caption=Kaydettikten sonra yazdýr' + #13#10 +
      'CB_Save.Caption=Ayarlarý kaydet' + #13#10 +
      'GroupBox1.Caption= Önizleme ' + #13#10 +
      'Label1.Caption=En:' + #13#10 +
      'Label3.Caption=Boy:' + #13#10 +
      'LBPage.Caption=Sayfa' + #13#10 +
      'ToolButton1.Hint=Yakýnlaþtýr' + #13#10 +
      'ToolButton2.Hint=Uzaklaþtýr' + #13#10 +
      'SaveDialog1.Filter=Text dosyasý (nokta-vuruþlu yazýcý)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Yazdýr' + #13#10 +
      'OK.Caption=Tamam' + #13#10 +
      'Cancel.Caption=Vazgeç' + #13#10 +
      'GroupBox1.Caption=Yazýcý' + #13#10 +
      'Label4.Caption=Adý' + #13#10 +
      'PropButton.Caption=Ayarlar...' + #13#10 +
      'GroupBox3.Caption=Kopya Sayýsý' + #13#10 +
      'Label2.Caption=Kopya sayýsý' + #13#10 +
      'GroupBox2.Caption= Yazýcý ayarlarý ' + #13#10 +
      'Label1.Caption=Yazýcý türü' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Yazýcý þablonu(*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=Yazýcý þablonu (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=RTF dosyasýna ver' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      'GroupPageRange.Caption= Yazdýrma Aralýðý ' + #13#10 +
      'AllRB.Caption=Tümü' + #13#10 +
      'CurPageRB.Caption=Geçerli sayfa' + #13#10 +
      'PageNumbersRB.Caption=Sayfalar:' + #13#10 +
      'DescrL.Caption=Sayfa numaralarýný ve/veya sayfa aralýklarýný virgülle ayýrarak girin. Örn. 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Verme ayarlarý' + #13#10 +
      'PicturesCB.Caption=Resimler' + #13#10 +
      'PageBreaksCB.Caption=Sayfa sonu' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenCB.Caption=Kaydettikten sonra aç' + #13#10 +
      'SaveDialog1.Filter=RTF dosyasý (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Verme ayarlarý' + #13#10 +
      'OK.Caption=Tamam' + #13#10 +
      'Cancel.Caption=Vazgeç' + #13#10 +
      'GroupPageRange.Caption= Yazdýrma Aralýðý  ' + #13#10 +
      'AllRB.Caption=Tümü' + #13#10 +
      'CurPageRB.Caption=Geçerli sayfa' + #13#10 +
      'PageNumbersRB.Caption=Sayfalar:' + #13#10 +
      'DescrL.Caption=Sayfa numaralarýný ve/veya sayfa aralýklarýný virgülle ayýrarak girin. Örn. 1,3,5-12' + #13#10 +
      'GroupBox1.Caption= Resim Ayarlarý ' + #13#10 +
      'Label2.Caption=JPEG kalitesi' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=Sayfalarý Kýrp' + #13#10 +
      'Mono.Caption=Siyah/Beyaz' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=PDF dosyasýna ver' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazgeç' + #13#10 +
      'GroupPageRange.Caption= Yazdýrma Aralýðý ' + #13#10 +
      'AllRB.Caption=Tümü' + #13#10 +
      'CurPageRB.Caption=Geçerli sayfa' + #13#10 +
      'PageNumbersRB.Caption=Sayfalar:' + #13#10 +
      'DescrL.Caption=Sayfa numaralarýný ve/veya sayfa aralýklarýný virgülle ayýrarak girin. Örn. 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Verme ayarlarý' + #13#10 +
      'CompressedCB.Caption=Sýkýþtýrýlmýþ' + #13#10 +
      'EmbeddedCB.Caption=Yazý karakterlerini içine göm' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenCB.Caption=Kaydettikten sonra aç' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'SaveDialog1.Filter=Adobe PDF dosyasý (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'RTF dosyasý');
    Add('BMPexport', 'BMP resmi');
    Add('JPEGexport', 'JPEG resmi');
    Add('TIFFexport', 'TIFF resmi');
    Add('TextExport', 'Text (nokta-vuruþlu yazýcý)');
    Add('XlsOLEexport', 'Excel tablosu (OLE)');
    Add('HTMLexport', 'HTML dosyasý');
    Add('XlsXMLexport', 'Excel tablosu (XML)');
    Add('PDFexport', 'PDF dosyasý');

    Add('ProgressWait', 'Lütfen bekleyin');
    Add('ProgressRows', 'Satýrlar düzenleniyor');
    Add('ProgressColumns', 'Kolonlar düzenleniyor');
    Add('ProgressStyles', 'Stiller düzenleniyor');
    Add('ProgressObjects', 'Nesneler veriliyor');


    Add('TIFFexportFilter', 'TIFF resmi (*.tif)|*.tif');
    Add('BMPexportFilter', 'BMP resmi (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'JPEG resmi (*.jpg)|*.jpg');

    Add('HTMLNavFirst', 'First');
    Add('HTMLNavPrev', 'Prev');
    Add('HTMLNavNext', 'Next');
    Add('HTMLNavLast', 'Last');
    Add('HTMLNavRefresh', 'Refresh');
    Add('HTMLNavPrint', 'Print');
    Add('HTMLNavTotal', 'Total pages');
  end;
end;

initialization
  frAddExportsRes;

end.
