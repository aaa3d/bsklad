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
      'Caption=Eksportesana uz Excel' + #13#10 +
      'OkB.Caption=ok' + #13#10 +
      'CancelB.Caption=Atcelt' + #13#10 +
      'GroupPageRange.Caption= Lappuses ' + #13#10 +
      'AllRB.Caption=Visi' + #13#10 +
      'CurPageRB.Caption=Tekosa' + #13#10 +
      'PageNumbersRB.Caption=Numuri:' + #13#10 +
      'DescrL.Caption=Ievadiet numurus/vai lappuses parametrus, sadalits ar komatiem. Piemeram, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Izvelnes ' + #13#10 +
      'StylesCB.Caption=Veidi' + #13#10 +
      'PicturesCB.Caption=Atteli' + #13#10 +
      'MergeCB.Caption=Apvienot sunas' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'PageBreaksCB.Caption=Lappusu dalisana' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Atvert Excel pec eksporta' + #13#10 +
      'SaveDialog1.Filter= Excel fails (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=Eksportet uz Excel' + #13#10 +
      'OkB.Caption=ok' + #13#10 +
      'CancelB.Caption=Atcelt' + #13#10 +
      'GroupPageRange.Caption= Lappuses ' + #13#10 +
      'AllRB.Caption=Visi' + #13#10 +
      'CurPageRB.Caption=Tekosa' + #13#10 +
      'PageNumbersRB.Caption=Numuri:' + #13#10 +
      'DescrL.Caption= Ievadiet numurus/vai lappuses parametrus, sadalits ar komatiem. Piemeram, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Izvelnes ' + #13#10 +
      'StylesCB.Caption=Veidi' + #13#10 +
      'PageBreaksCB.Caption=Lappusu dalisana' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Atvert Excel pec eksporta' + #13#10 +
      'SaveDialog1.Filter= Excel fails (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=Eksports uz HTML (tabulas)' + #13#10 +
      'OkB.Caption=ok' + #13#10 +
      'CancelB.Caption=atcelt' + #13#10 +
      'GroupPageRange.Caption= Lappuses ' + #13#10 +
      'AllRB.Caption=Visi' + #13#10 +
      'CurPageRB.Caption=Tekosa' + #13#10 +
      'PageNumbersRB.Caption=Numuri:' + #13#10 +
      'DescrL.Caption= Ievadiet numurus/vai lappuses parametrus, sadalits ar komatiem. Piemeram, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Izvelnes ' + #13#10 +
      'OpenAfterCB.Caption=Atvert pec eksporta' + #13#10 +
      'StylesCB.Caption=Veidi' + #13#10 +
      'PicturesCB.Caption=Atteli' + #13#10 +
      'PicsSameCB.Caption=Viss viena mape' + #13#10 +
      'FixWidthCB.Caption=fiksetais platums' + #13#10 +
      'NavigatorCB.Caption=Navigators' + #13#10 +
      'MultipageCB.Caption=Multi lappuses' + #13#10 +
      'MozillaCB.Caption=Brauzers Mozilla' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter= HTML fails (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Eksportesana teksta' + #13#10 +
      'OK.Caption=ok' + #13#10 +
      'Cancel.Caption=atcelt' + #13#10 +
      'BtnPreview.Hint=rezultata parskats' + #13#10 +
      'GroupCellProp.Caption= Izvelnes  ' + #13#10 +
      'CB_PageBreaks.Caption=Lappusu dalisana' + #13#10 +
      'CB_OEM.Caption=OEM-kodesana' + #13#10 +
      'CB_EmptyLines.Caption=Tuksas linijas' + #13#10 +
      'CB_LeadSpaces.Caption=Atstarpes no kreisas puses' + #13#10 +
      'GroupPageRange.Caption= Lappuses ' + #13#10 +
      'Pages.Caption=Numuri' + #13#10 +
      'Descr.Caption= Ievadiet numurus/vai lappuses parametrus, sadalits ar komatiem. Piemeram, 1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption= Merogs ' + #13#10 +
      'ScX.Caption=pec ass X' + #13#10 +
      'ScY.Caption= pec ass Y' + #13#10 +
      'GroupFramesSettings.Caption= Ramji ' + #13#10 +
      'RB_NoneFrames.Caption=Ne' + #13#10 +
      'RB_Simple.Caption=Teksta' + #13#10 +
      'RB_Graph.Caption=Grafiskie' + #13#10 +
      'CB_PrintAfter.Caption=Druka pec eksporta' + #13#10 +
      'CB_Save.Caption=Saglabat uzstadijumus' + #13#10 +
      'GroupBox1.Caption= Parlukosana ' + #13#10 +
      'Label1.Caption=Platums:' + #13#10 +
      'Label3.Caption=Augstums:' + #13#10 +
      'LBPage.Caption=Lappuse' + #13#10 +
      'ToolButton1.Hint=Palielinat' + #13#10 +
      'ToolButton2.Hint=Samazinat' + #13#10 +
      'SaveDialog1.Filter=Teksta fails (*.txt)|*.txt' + #13#10 +
      'SaveDialog1.DefaultExt=.txt' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Druka' + #13#10 +
      'OK.Caption=ok' + #13#10 +
      'Cancel.Caption=Atcelt' + #13#10 +
      'GroupBox1.Caption=Printeris' + #13#10 +
      'Label4.Caption=Vards' + #13#10 +
      'PropButton.Caption=Uzstadijumi...' + #13#10 +
      'GroupBox3.Caption=Kopijas' + #13#10 +
      'Label2.Caption=Daudzums' + #13#10 +
      'GroupBox2.Caption= Izvelnes ' + #13#10 +
      'Label1.Caption=Printera veids' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Printera uzstadijumi (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter= Printera uzstadijumi (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=Eksports uz RTF (tabulas)' + #13#10 +
      'OkB.Caption=ok' + #13#10 +
      'CancelB.Caption=Atcelt' + #13#10 +
      'GroupPageRange.Caption= Lappuses ' + #13#10 +
      'AllRB.Caption=Visi' + #13#10 +
      'CurPageRB.Caption=Tekosa' + #13#10 +
      'PageNumbersRB.Caption=Numuri:' + #13#10 +
      'DescrL.Caption= Ievadiet numurus/vai lappuses parametrus, sadalits ar komatiem. Piemeram, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Izvelnes ' + #13#10 +
      'PicturesCB.Caption=Atteli' + #13#10 +
      'PageBreaksCB.Caption=Lappusu dalisana' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenCB.Caption=Atvert pec eksportesanas' + #13#10 +
      'SaveDialog1.Filter= RTF fails (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Eksportesana uz attelu' + #13#10 +
      'OK.Caption=ok' + #13#10 +
      'Cancel.Caption=Atcelt' + #13#10 +
      'GroupPageRange.Caption= Lappuses ' + #13#10 +
      'AllRB.Caption=Visi' + #13#10 +
      'CurPageRB.Caption=Tekosa' + #13#10 +
      'PageNumbersRB.Caption=Numuri:' + #13#10 +
      'DescrL.Caption= Ievadiet numurus/vai lappuses parametrus, sadalits ar komatiem. Piemeram, 1,3,5-12' + #13#10 +
      'GroupBox1.Caption= Izvelnes ' + #13#10 +
      'Label2.Caption= JPEG kvalitate' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=Partraukt lappusi' + #13#10 +
      'Mono.Caption=Monohromaiss' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=Eksportesana uz PDF' + #13#10 +
      'OkB.Caption=ok' + #13#10 +
      'CancelB.Caption=Atcelt' + #13#10 +
      'GroupPageRange.Caption= Lappuses ' + #13#10 +
      'AllRB.Caption=Visi' + #13#10 +
      'CurPageRB.Caption=Tekosa' + #13#10 +
      'PageNumbersRB.Caption=Numuri:' + #13#10 +
      'DescrL.Caption= Ievadiet numurus/vai lappuses parametrus, sadalits ar komatiem. Piemeram, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Izvelnes ' + #13#10 +
      'CompressedCB.Caption=Kompresesana' + #13#10 +
      'EmbeddedCB.Caption=Ievietot fontus' + #13#10 +
      'PrintOptCB.Caption=Atlaut' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenCB.Caption=Atvert pec eksportesanas' + #13#10 +
      'SaveDialog1.Filter= Adobe PDF fails (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'Word dokuments (tabulas)');
    Add('BMPexport', 'Attels BMP');
    Add('JPEGexport', ' Attels JPEG');
    Add('TIFFexport', ' Attels TIFF');
    Add('TextExport', 'Teksta fails');
    Add('XlsOLEexport', 'Excel dokuments (OLE)');
    Add('HTMLexport', ' HTML dokuments (табличный)');
    Add('XlsXMLexport', 'Excel dokuments (XML)');
    Add('PDFexport', 'PDF dokuments ');

    Add('ProgressWait', 'Ludzu uzgaidiet');
    Add('ProgressRows', 'Rindu uzstadisana');
    Add('ProgressColumns', 'Kolonnu uzstadisana');
    Add('ProgressStyles', 'Veidu uzstadisana');
    Add('ProgressObjects', 'Objektu eksportesana');

    Add('TIFFexportFilter', ' Attels TIFF (*.tif)|*.tif');
    Add('BMPexportFilter', ' Attels BMP (*.bmp)|*.bmp');
    Add('JPEGexportFilter', ' Attels JPEG (*.jpg)|*.jpg');

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