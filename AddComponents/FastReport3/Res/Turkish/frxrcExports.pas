
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
      'Caption=Excel dosyas�na ver' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      'GroupPageRange.Caption= Yazd�rma Aral��� ' + #13#10 +
      'AllRB.Caption=T�m�' + #13#10 +
      'CurPageRB.Caption=Ge�erli sayfa' + #13#10 +
      'PageNumbersRB.Caption=Sayfalar:' + #13#10 +
      'DescrL.Caption=Sayfa numaralar�n� ve/veya sayfa aral�klar�n� virg�lle ay�rarak girin. �rn. 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Verme ayarlar�' + #13#10 +
      'StylesCB.Caption=Stiller' + #13#10 +
      'PicturesCB.Caption=Resimler' + #13#10 +
      'MergeCB.Caption=H�creleri birle�tir' + #13#10 +
      'PageBreaksCB.Caption=Sayfa sonu' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenExcelCB.Caption=Kaydettikten sonra Excel''i a�' + #13#10 +
      'SaveDialog1.Filter=Excel dosyas� (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=Excel dosyas�na ver' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      'GroupPageRange.Caption= Yazd�rma Aral��� ' + #13#10 +
      'AllRB.Caption=T�m�' + #13#10 +
      'CurPageRB.Caption=Ge�erli sayfa' + #13#10 +
      'PageNumbersRB.Caption=Sayfalar:' + #13#10 +
      'DescrL.Caption=Sayfa numaralar�n� ve/veya sayfa aral�klar�n� virg�lle ay�rarak girin. �rn. 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Verme ayarlar�' + #13#10 +
      'StylesCB.Caption=Stiller' + #13#10 +
      'PageBreaksCB.Caption=Sayfa sonu' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenExcelCB.Caption=Kaydettikten sonra Excel''i a�' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=XML Excel dosyas� (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=HTML dosyas�na ver' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      'GroupPageRange.Caption= Yazd�rma Aral��� ' + #13#10 +
      'AllRB.Caption=T�m�' + #13#10 +
      'CurPageRB.Caption=Ge�erli sayfa' + #13#10 +
      'PageNumbersRB.Caption=Sayfalar:' + #13#10 +
      'DescrL.Caption=Sayfa numaralar�n� ve/veya sayfa aral�klar�n� virg�lle ay�rarak girin. �rn. 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Verme ayarlar�' + #13#10 +
      'OpenAfterCB.Caption=Kaydettikten sonra a�' + #13#10 +
      'StylesCB.Caption=Stiller' + #13#10 +
      'PicturesCB.Caption=Resimler' + #13#10 +
      'PicsSameCB.Caption=Hepsi bir klas�re' + #13#10 +
      'FixWidthCB.Caption=Sabit geni�lik' + #13#10 +
      'NavigatorCB.Caption=Sayfa gezgini' + #13#10 +
      'MultipageCB.Caption=�oklu sayfa' + #13#10 +
      'MozillaCB.Caption=Mozilla taray�c�s�' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=HTML dosyas� (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Text dosyas�na ver (nokta-vuru�lu yaz�c�)' + #13#10 +
      'OK.Caption=Tamam' + #13#10 +
      'Cancel.Caption=Vazge�' + #13#10 +
      'BtnPreview.Hint=�nizleme a��k/kapal�' + #13#10 +
      'GroupCellProp.Caption= Verme ayarlar�  ' + #13#10 +
      'CB_PageBreaks.Caption=Sayfa sonu' + #13#10 +
      'CB_OEM.Caption=OEM kod sayfas�' + #13#10 +
      'CB_EmptyLines.Caption=Bo� sat�rlar' + #13#10 +
      'CB_LeadSpaces.Caption=Ba�l�k bo�lu�u' + #13#10 +
      'GroupPageRange.Caption= Yazd�rma Aral���  ' + #13#10 +
      'Pages.Caption=Sayfalar:' + #13#10 +
      'Descr.Caption=Sayfa numaralar�n� ve/veya sayfa aral�klar�n� virg�lle ay�rarak girin. �rn. 1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption= �l�eklendirme ' + #13#10 +
      'ScX.Caption=Yatay' + #13#10 +
      'ScY.Caption=Dikey' + #13#10 +
      'GroupFramesSettings.Caption= �er�eveler ' + #13#10 +
      'RB_NoneFrames.Caption=Yok' + #13#10 +
      'RB_Simple.Caption=Basit' + #13#10 +
      'RB_Graph.Caption=Grafik' + #13#10 +
      'RB_Graph.Hint=Sadece OEM kod sayfas�' + #13#10 +
      'CB_PrintAfter.Caption=Kaydettikten sonra yazd�r' + #13#10 +
      'CB_Save.Caption=Ayarlar� kaydet' + #13#10 +
      'GroupBox1.Caption= �nizleme ' + #13#10 +
      'Label1.Caption=En:' + #13#10 +
      'Label3.Caption=Boy:' + #13#10 +
      'LBPage.Caption=Sayfa' + #13#10 +
      'ToolButton1.Hint=Yak�nla�t�r' + #13#10 +
      'ToolButton2.Hint=Uzakla�t�r' + #13#10 +
      'SaveDialog1.Filter=Text dosyas� (nokta-vuru�lu yaz�c�)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Yazd�r' + #13#10 +
      'OK.Caption=Tamam' + #13#10 +
      'Cancel.Caption=Vazge�' + #13#10 +
      'GroupBox1.Caption=Yaz�c�' + #13#10 +
      'Label4.Caption=Ad�' + #13#10 +
      'PropButton.Caption=Ayarlar...' + #13#10 +
      'GroupBox3.Caption=Kopya Say�s�' + #13#10 +
      'Label2.Caption=Kopya say�s�' + #13#10 +
      'GroupBox2.Caption= Yaz�c� ayarlar� ' + #13#10 +
      'Label1.Caption=Yaz�c� t�r�' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Yaz�c� �ablonu(*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=Yaz�c� �ablonu (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=RTF dosyas�na ver' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      'GroupPageRange.Caption= Yazd�rma Aral��� ' + #13#10 +
      'AllRB.Caption=T�m�' + #13#10 +
      'CurPageRB.Caption=Ge�erli sayfa' + #13#10 +
      'PageNumbersRB.Caption=Sayfalar:' + #13#10 +
      'DescrL.Caption=Sayfa numaralar�n� ve/veya sayfa aral�klar�n� virg�lle ay�rarak girin. �rn. 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Verme ayarlar�' + #13#10 +
      'PicturesCB.Caption=Resimler' + #13#10 +
      'PageBreaksCB.Caption=Sayfa sonu' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenCB.Caption=Kaydettikten sonra a�' + #13#10 +
      'SaveDialog1.Filter=RTF dosyas� (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Verme ayarlar�' + #13#10 +
      'OK.Caption=Tamam' + #13#10 +
      'Cancel.Caption=Vazge�' + #13#10 +
      'GroupPageRange.Caption= Yazd�rma Aral���  ' + #13#10 +
      'AllRB.Caption=T�m�' + #13#10 +
      'CurPageRB.Caption=Ge�erli sayfa' + #13#10 +
      'PageNumbersRB.Caption=Sayfalar:' + #13#10 +
      'DescrL.Caption=Sayfa numaralar�n� ve/veya sayfa aral�klar�n� virg�lle ay�rarak girin. �rn. 1,3,5-12' + #13#10 +
      'GroupBox1.Caption= Resim Ayarlar� ' + #13#10 +
      'Label2.Caption=JPEG kalitesi' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=Sayfalar� K�rp' + #13#10 +
      'Mono.Caption=Siyah/Beyaz' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=PDF dosyas�na ver' + #13#10 +
      'OkB.Caption=Tamam' + #13#10 +
      'CancelB.Caption=Vazge�' + #13#10 +
      'GroupPageRange.Caption= Yazd�rma Aral��� ' + #13#10 +
      'AllRB.Caption=T�m�' + #13#10 +
      'CurPageRB.Caption=Ge�erli sayfa' + #13#10 +
      'PageNumbersRB.Caption=Sayfalar:' + #13#10 +
      'DescrL.Caption=Sayfa numaralar�n� ve/veya sayfa aral�klar�n� virg�lle ay�rarak girin. �rn. 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Verme ayarlar�' + #13#10 +
      'CompressedCB.Caption=S�k��t�r�lm��' + #13#10 +
      'EmbeddedCB.Caption=Yaz� karakterlerini i�ine g�m' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenCB.Caption=Kaydettikten sonra a�' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'SaveDialog1.Filter=Adobe PDF dosyas� (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'RTF dosyas�');
    Add('BMPexport', 'BMP resmi');
    Add('JPEGexport', 'JPEG resmi');
    Add('TIFFexport', 'TIFF resmi');
    Add('TextExport', 'Text (nokta-vuru�lu yaz�c�)');
    Add('XlsOLEexport', 'Excel tablosu (OLE)');
    Add('HTMLexport', 'HTML dosyas�');
    Add('XlsXMLexport', 'Excel tablosu (XML)');
    Add('PDFexport', 'PDF dosyas�');

    Add('ProgressWait', 'L�tfen bekleyin');
    Add('ProgressRows', 'Sat�rlar d�zenleniyor');
    Add('ProgressColumns', 'Kolonlar d�zenleniyor');
    Add('ProgressStyles', 'Stiller d�zenleniyor');
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
