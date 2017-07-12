
{******************************************}
{                                          }
{             FastReport v3.0              }
{         Language resource file           }
{                                          }
{            Copyright (c) 2004            }
{          by Alexander Fediachov,         }
{             Fast Reports, Inc.           }
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
      'Caption=Excel export' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      'GroupPageRange.Caption= Oldaltartomány ' + #13#10 +
      'AllRB.Caption=Mindet' + #13#10 +
      'CurPageRB.Caption=Jelenlegi oldal' + #13#10 +
      'PageNumbersRB.Caption=Oldalak:' + #13#10 +
      'DescrL.Caption=Adjon meg oldalszámokat vagy tartományokat, vesszõvel elválasztva. Például 1,3,5-12' + #13#10 +
      'GroupQuality.Caption=Exportálás beállítása' + #13#10 +
      'StylesCB.Caption=Stílusok' + #13#10 +
      'PicturesCB.Caption=Képek' + #13#10 +
      'MergeCB.Caption=Cellák egyesítése' + #13#10 +
      'PageBreaksCB.Caption=Oldaltörések' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Export után Excel indítása' + #13#10 +
      'SaveDialog1.Filter=Excel fájl (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=XML Excel export' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      'GroupPageRange.Caption=Oldaltartomány' + #13#10 +
      'AllRB.Caption=Mindet' + #13#10 +
      'CurPageRB.Caption=Jelenlegi oldal' + #13#10 +
      'PageNumbersRB.Caption=Oldalak:' + #13#10 +
      'DescrL.Caption=Adjon meg oldalszámokat vagy tartományokat, vesszõvel elválasztva. Például 1,3,5-12' + #13#10 +
      'GroupQuality.Caption=Exportálás beállítása' + #13#10 +
      'StylesCB.Caption=Stílusok' + #13#10 +
      'PageBreaksCB.Caption=Oldaltörések' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Export után Excel indítása' + #13#10 +
      'SaveDialog1.Filter=XML Excel fájl (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=HTML táblába exportál' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      'GroupPageRange.Caption=Oldaltartomány' + #13#10 +
      'AllRB.Caption=Mindet' + #13#10 +
      'CurPageRB.Caption=Jelenlegi oldal' + #13#10 +
      'PageNumbersRB.Caption=Oldalak:' + #13#10 +
      'DescrL.Caption=Adjon meg oldalszámokat vagy tartományokat, vesszõvel elválasztva. Például 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Exportálás beállítása ' + #13#10 +
      'OpenAfterCB.Caption=Export után megnyitás' + #13#10 +
      'StylesCB.Caption=Stílusok' + #13#10 +
      'PicturesCB.Caption=Képek' + #13#10 +
      'PicsSameCB.Caption=Mindent egy mappába' + #13#10 +
      'FixWidthCB.Caption=Fix szélesség' + #13#10 +
      'NavigatorCB.Caption=Oldalnavigator' + #13#10 +
      'MultipageCB.Caption=Többoldalas' + #13#10 +
      'MozillaCB.Caption=Mozilla böngészõ' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=HTML fájl (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Szöveg export (mátrixnyomtató)' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Mégsem' + #13#10 +
      'BtnPreview.Hint=Elõkép be/ki' + #13#10 +
      'GroupCellProp.Caption= Exportálás beállítása ' + #13#10 +
      'CB_PageBreaks.Caption=Oldaltörések' + #13#10 +
      'CB_OEM.Caption=OEM kódlap' + #13#10 +
      'CB_EmptyLines.Caption=Üres sorok' + #13#10 +
      'CB_LeadSpaces.Caption=Bevezetõ szóközök' + #13#10 +
      'GroupPageRange.Caption=Oldaltartomány' + #13#10 +
      'Pages.Caption=Oldalszámok' + #13#10 +
      'Descr.Caption=Adjon meg oldalszámokat vagy tartományokat, vesszõvel elválasztva. Például 1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption=Skálázás' + #13#10 +
      'ScX.Caption=X skála' + #13#10 +
      'ScY.Caption=Y skála' + #13#10 +
      'GroupFramesSettings.Caption= Keretek ' + #13#10 +
      'RB_NoneFrames.Caption=Nincs' + #13#10 +
      'RB_Simple.Caption=Egyszerû' + #13#10 +
      'RB_Graph.Caption=Grafikus' + #13#10 +
      'RB_Graph.Hint=Csak az OEM kódlappal' + #13#10 +
      'CB_PrintAfter.Caption=Export után nyomtatás' + #13#10 +
      'CB_Save.Caption=Beállítások mentése' + #13#10 +
      'GroupBox1.Caption=Elõkép' + #13#10 +
      'Label1.Caption=Szélesség:' + #13#10 +
      'Label3.Caption=Magasság:' + #13#10 +
      'LBPage.Caption=Oldal' + #13#10 +
      'ToolButton1.Hint=Nagyítás' + #13#10 +
      'ToolButton2.Hint=Kicsinyítés' + #13#10 +
      'SaveDialog1.Filter=Szövegfájl (mátrixnyomtató)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Nyomtat' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Mégsem' + #13#10 +
      'GroupBox1.Caption=Nyomtató' + #13#10 +
      'Label4.Caption=Név' + #13#10 +
      'PropButton.Caption=Beállít...' + #13#10 +
      'GroupBox3.Caption=Másolatok' + #13#10 +
      'Label2.Caption=Másolatok száma' + #13#10 +
      'GroupBox2.Caption=Nyomtatóinicializálás' + #13#10 +
      'Label1.Caption=Nyomtató típusa' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Nyomtatóinicializálás minta (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=Nyomtatóinicializálás minta (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=RTF export' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      'GroupPageRange.Caption=Oldaltartomány' + #13#10 +
      'AllRB.Caption=Mindet' + #13#10 +
      'CurPageRB.Caption=Jelenlegi oldal' + #13#10 +
      'PageNumbersRB.Caption=Oldalak:' + #13#10 +
      'DescrL.Caption=Adjon meg oldalszámokat vagy tartományokat, vesszõvel elválasztva. Például 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Exportálás beállítása ' + #13#10 +
      'PicturesCB.Caption=Képek' + #13#10 +
      'PageBreaksCB.Caption=Oldaltörések' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenCB.Caption=Export után megnyit' + #13#10 +
      'SaveDialog1.Filter=RTF fájl (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Exportálás beállítása' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Mégsem' + #13#10 +
      'GroupPageRange.Caption=Oldaltartomány' + #13#10 +
      'AllRB.Caption=Mindet' + #13#10 +
      'CurPageRB.Caption=Jelenlegi oldal' + #13#10 +
      'PageNumbersRB.Caption=Oldalak:' + #13#10 +
      'DescrL.Caption=Adjon meg oldalszámokat vagy tartományokat, vesszõvel elválasztva. Például 1,3,5-12' + #13#10 +
      'GroupBox1.Caption=Képbeállítások' + #13#10 +
      'Label2.Caption=JPEG minõség' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=Oldalak vágása' + #13#10 +
      'Mono.Caption=Egyszínû' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=PDF export' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      'GroupPageRange.Caption=Oldaltartomány' + #13#10 +
      'AllRB.Caption=Mindet' + #13#10 +
      'CurPageRB.Caption=Jelenlegi oldal' + #13#10 +
      'PageNumbersRB.Caption=Oldalak:' + #13#10 +
      'DescrL.Caption=Adjon meg oldalszámokat vagy tartományokat, vesszõvel elválasztva. Például 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Exportálás beállítása ' + #13#10 +
      'CompressedCB.Caption=Tömörített' + #13#10 +
      'EmbeddedCB.Caption=Beágyazott betûk' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'OpenCB.Caption=Export után megnyit' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'SaveDialog1.Filter=Adobe PDF fájl (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'RTF fájl');
    Add('BMPexport', 'BMP kép');
    Add('JPEGexport', 'JPEG kép');
    Add('TIFFexport', 'TIFF kép');
    Add('TextExport', 'Szöveg (mátrixnyomtató)');
    Add('XlsOLEexport', 'Excel tábla (OLE)');
    Add('HTMLexport', 'HTML fájl');
    Add('XlsXMLexport', 'Excel tábla (XML)');
    Add('PDFexport', 'PDF fájl');

    Add('ProgressWait', 'Kérem várjon');
    Add('ProgressRows', 'Sorok beállítása');
    Add('ProgressColumns', 'Oszlopok beállítása');
    Add('ProgressStyles', 'Stílusok beállítása');
    Add('ProgressObjects', 'Objektumok exportálása');


    Add('TIFFexportFilter', 'Tiff kép (*.tif)|*.tif');
    Add('BMPexportFilter', 'BMP kép (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Jpeg kép (*.jpg)|*.jpg');

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
