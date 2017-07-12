
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
      'CancelB.Caption=M�gsem' + #13#10 +
      'GroupPageRange.Caption= Oldaltartom�ny ' + #13#10 +
      'AllRB.Caption=Mindet' + #13#10 +
      'CurPageRB.Caption=Jelenlegi oldal' + #13#10 +
      'PageNumbersRB.Caption=Oldalak:' + #13#10 +
      'DescrL.Caption=Adjon meg oldalsz�mokat vagy tartom�nyokat, vessz�vel elv�lasztva. P�ld�ul 1,3,5-12' + #13#10 +
      'GroupQuality.Caption=Export�l�s be�ll�t�sa' + #13#10 +
      'StylesCB.Caption=St�lusok' + #13#10 +
      'PicturesCB.Caption=K�pek' + #13#10 +
      'MergeCB.Caption=Cell�k egyes�t�se' + #13#10 +
      'PageBreaksCB.Caption=Oldalt�r�sek' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Export ut�n Excel ind�t�sa' + #13#10 +
      'SaveDialog1.Filter=Excel f�jl (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=XML Excel export' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      'GroupPageRange.Caption=Oldaltartom�ny' + #13#10 +
      'AllRB.Caption=Mindet' + #13#10 +
      'CurPageRB.Caption=Jelenlegi oldal' + #13#10 +
      'PageNumbersRB.Caption=Oldalak:' + #13#10 +
      'DescrL.Caption=Adjon meg oldalsz�mokat vagy tartom�nyokat, vessz�vel elv�lasztva. P�ld�ul 1,3,5-12' + #13#10 +
      'GroupQuality.Caption=Export�l�s be�ll�t�sa' + #13#10 +
      'StylesCB.Caption=St�lusok' + #13#10 +
      'PageBreaksCB.Caption=Oldalt�r�sek' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Export ut�n Excel ind�t�sa' + #13#10 +
      'SaveDialog1.Filter=XML Excel f�jl (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=HTML t�bl�ba export�l' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      'GroupPageRange.Caption=Oldaltartom�ny' + #13#10 +
      'AllRB.Caption=Mindet' + #13#10 +
      'CurPageRB.Caption=Jelenlegi oldal' + #13#10 +
      'PageNumbersRB.Caption=Oldalak:' + #13#10 +
      'DescrL.Caption=Adjon meg oldalsz�mokat vagy tartom�nyokat, vessz�vel elv�lasztva. P�ld�ul 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Export�l�s be�ll�t�sa ' + #13#10 +
      'OpenAfterCB.Caption=Export ut�n megnyit�s' + #13#10 +
      'StylesCB.Caption=St�lusok' + #13#10 +
      'PicturesCB.Caption=K�pek' + #13#10 +
      'PicsSameCB.Caption=Mindent egy mapp�ba' + #13#10 +
      'FixWidthCB.Caption=Fix sz�less�g' + #13#10 +
      'NavigatorCB.Caption=Oldalnavigator' + #13#10 +
      'MultipageCB.Caption=T�bboldalas' + #13#10 +
      'MozillaCB.Caption=Mozilla b�ng�sz�' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=HTML f�jl (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Sz�veg export (m�trixnyomtat�)' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=M�gsem' + #13#10 +
      'BtnPreview.Hint=El�k�p be/ki' + #13#10 +
      'GroupCellProp.Caption= Export�l�s be�ll�t�sa ' + #13#10 +
      'CB_PageBreaks.Caption=Oldalt�r�sek' + #13#10 +
      'CB_OEM.Caption=OEM k�dlap' + #13#10 +
      'CB_EmptyLines.Caption=�res sorok' + #13#10 +
      'CB_LeadSpaces.Caption=Bevezet� sz�k�z�k' + #13#10 +
      'GroupPageRange.Caption=Oldaltartom�ny' + #13#10 +
      'Pages.Caption=Oldalsz�mok' + #13#10 +
      'Descr.Caption=Adjon meg oldalsz�mokat vagy tartom�nyokat, vessz�vel elv�lasztva. P�ld�ul 1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption=Sk�l�z�s' + #13#10 +
      'ScX.Caption=X sk�la' + #13#10 +
      'ScY.Caption=Y sk�la' + #13#10 +
      'GroupFramesSettings.Caption= Keretek ' + #13#10 +
      'RB_NoneFrames.Caption=Nincs' + #13#10 +
      'RB_Simple.Caption=Egyszer�' + #13#10 +
      'RB_Graph.Caption=Grafikus' + #13#10 +
      'RB_Graph.Hint=Csak az OEM k�dlappal' + #13#10 +
      'CB_PrintAfter.Caption=Export ut�n nyomtat�s' + #13#10 +
      'CB_Save.Caption=Be�ll�t�sok ment�se' + #13#10 +
      'GroupBox1.Caption=El�k�p' + #13#10 +
      'Label1.Caption=Sz�less�g:' + #13#10 +
      'Label3.Caption=Magass�g:' + #13#10 +
      'LBPage.Caption=Oldal' + #13#10 +
      'ToolButton1.Hint=Nagy�t�s' + #13#10 +
      'ToolButton2.Hint=Kicsiny�t�s' + #13#10 +
      'SaveDialog1.Filter=Sz�vegf�jl (m�trixnyomtat�)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Nyomtat' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=M�gsem' + #13#10 +
      'GroupBox1.Caption=Nyomtat�' + #13#10 +
      'Label4.Caption=N�v' + #13#10 +
      'PropButton.Caption=Be�ll�t...' + #13#10 +
      'GroupBox3.Caption=M�solatok' + #13#10 +
      'Label2.Caption=M�solatok sz�ma' + #13#10 +
      'GroupBox2.Caption=Nyomtat�inicializ�l�s' + #13#10 +
      'Label1.Caption=Nyomtat� t�pusa' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Nyomtat�inicializ�l�s minta (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=Nyomtat�inicializ�l�s minta (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=RTF export' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      'GroupPageRange.Caption=Oldaltartom�ny' + #13#10 +
      'AllRB.Caption=Mindet' + #13#10 +
      'CurPageRB.Caption=Jelenlegi oldal' + #13#10 +
      'PageNumbersRB.Caption=Oldalak:' + #13#10 +
      'DescrL.Caption=Adjon meg oldalsz�mokat vagy tartom�nyokat, vessz�vel elv�lasztva. P�ld�ul 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Export�l�s be�ll�t�sa ' + #13#10 +
      'PicturesCB.Caption=K�pek' + #13#10 +
      'PageBreaksCB.Caption=Oldalt�r�sek' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenCB.Caption=Export ut�n megnyit' + #13#10 +
      'SaveDialog1.Filter=RTF f�jl (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Export�l�s be�ll�t�sa' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=M�gsem' + #13#10 +
      'GroupPageRange.Caption=Oldaltartom�ny' + #13#10 +
      'AllRB.Caption=Mindet' + #13#10 +
      'CurPageRB.Caption=Jelenlegi oldal' + #13#10 +
      'PageNumbersRB.Caption=Oldalak:' + #13#10 +
      'DescrL.Caption=Adjon meg oldalsz�mokat vagy tartom�nyokat, vessz�vel elv�lasztva. P�ld�ul 1,3,5-12' + #13#10 +
      'GroupBox1.Caption=K�pbe�ll�t�sok' + #13#10 +
      'Label2.Caption=JPEG min�s�g' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=Oldalak v�g�sa' + #13#10 +
      'Mono.Caption=Egysz�n�' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=PDF export' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      'GroupPageRange.Caption=Oldaltartom�ny' + #13#10 +
      'AllRB.Caption=Mindet' + #13#10 +
      'CurPageRB.Caption=Jelenlegi oldal' + #13#10 +
      'PageNumbersRB.Caption=Oldalak:' + #13#10 +
      'DescrL.Caption=Adjon meg oldalsz�mokat vagy tartom�nyokat, vessz�vel elv�lasztva. P�ld�ul 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Export�l�s be�ll�t�sa ' + #13#10 +
      'CompressedCB.Caption=T�m�r�tett' + #13#10 +
      'EmbeddedCB.Caption=Be�gyazott bet�k' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'OpenCB.Caption=Export ut�n megnyit' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'SaveDialog1.Filter=Adobe PDF f�jl (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'RTF f�jl');
    Add('BMPexport', 'BMP k�p');
    Add('JPEGexport', 'JPEG k�p');
    Add('TIFFexport', 'TIFF k�p');
    Add('TextExport', 'Sz�veg (m�trixnyomtat�)');
    Add('XlsOLEexport', 'Excel t�bla (OLE)');
    Add('HTMLexport', 'HTML f�jl');
    Add('XlsXMLexport', 'Excel t�bla (XML)');
    Add('PDFexport', 'PDF f�jl');

    Add('ProgressWait', 'K�rem v�rjon');
    Add('ProgressRows', 'Sorok be�ll�t�sa');
    Add('ProgressColumns', 'Oszlopok be�ll�t�sa');
    Add('ProgressStyles', 'St�lusok be�ll�t�sa');
    Add('ProgressObjects', 'Objektumok export�l�sa');


    Add('TIFFexportFilter', 'Tiff k�p (*.tif)|*.tif');
    Add('BMPexportFilter', 'BMP k�p (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Jpeg k�p (*.jpg)|*.jpg');

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
