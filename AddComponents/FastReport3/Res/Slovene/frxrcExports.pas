
{******************************************}
{                                          }
{             FastReport v3.0              }
{         Language resource file           }
{                                          }
{            Copyright (c) 2004            }
{          by Alexander Fediachov,         }
{             Fast Reports, Inc.           }
{                                          }
{         Slovene translation by:          }
{         Primoz Planinc, Planles s.p.     }
{         mail: info@planles.net           }
{         made in October, 2004            }
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
      'Caption=Izvoz v Excel' + #13#10 +
      'OkB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Preklièi' + #13#10 +
      'GroupPageRange.Caption= Obseg strani ' + #13#10 +
      'AllRB.Caption=Vse' + #13#10 +
      'CurPageRB.Caption=Trenutna stran' + #13#10 +
      'PageNumbersRB.Caption=Strani:' + #13#10 +
      'DescrL.Caption=Vnesite številke in/ali obsege strani loèene z vejicami. Na primer: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Nastavitev izvoza ' + #13#10 +
      'StylesCB.Caption=Stili' + #13#10 +
      'PicturesCB.Caption=Slike' + #13#10 +
      'MergeCB.Caption=Spoji celice' + #13#10 +
      'PageBreaksCB.Caption=Prelomi strani' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Odpri Excel po izvozu' + #13#10 +
      'SaveDialog1.Filter=Excel datoteka (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=Izvoz v Excel' + #13#10 +
      'OkB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Preklièi' + #13#10 +
      'GroupPageRange.Caption= Obseg strani ' + #13#10 +
      'AllRB.Caption=Vse' + #13#10 +
      'CurPageRB.Caption=Trenutna stran' + #13#10 +
      'PageNumbersRB.Caption=Strani:' + #13#10 +
      'DescrL.Caption=Vnesite številke in/ali obsege strani loèene z vejicami. Na primer: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Nastavitev izvoza ' + #13#10 +
      'StylesCB.Caption=Stili' + #13#10 +
      'PageBreaksCB.Caption=Prelomi strani' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Odpri Excel po izvozu' + #13#10 +
      'SaveDialog1.Filter=XML Excel datoteka (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=Izvoz v HTML tabelo' + #13#10 +
      'OkB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Preklièi' + #13#10 +
      'GroupPageRange.Caption= Obseg strani ' + #13#10 +
      'AllRB.Caption=Vse' + #13#10 +
      'CurPageRB.Caption=Trenutna stran' + #13#10 +
      'PageNumbersRB.Caption=Strani:' + #13#10 +
      'DescrL.Caption=Vnesite številke in/ali obsege strani loèene z vejicami. Na primer: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Nastavitev izvoza ' + #13#10 +
      'OpenAfterCB.Caption=Odpri po izvozu' + #13#10 +
      'StylesCB.Caption=Stili' + #13#10 +
      'PicturesCB.Caption=Slike' + #13#10 +
      'PicsSameCB.Caption=Vse v isto mapo' + #13#10 +
      'FixWidthCB.Caption=Fiksna širina' + #13#10 +
      'NavigatorCB.Caption=Navigator za strani' + #13#10 +
      'MultipageCB.Caption=Veèstransko' + #13#10 +
      'MozillaCB.Caption=Mozilla brskalnik' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=HTML datoteka (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Izvoz v tekstovno datoteko (matrièni tiskalnik)' + #13#10 +
      'Ok.Caption=V redu' + #13#10 +
      'Cancel.Caption=Preklièi' + #13#10 +
      'BtnPreview.Hint=Predogled vkl/izkl' + #13#10 +
      'GroupCellProp.Caption= Lastnosti izvoza  ' + #13#10 +
      'CB_PageBreaks.Caption=Prelomi strani' + #13#10 +
      'CB_OEM.Caption=OEM kodna stran' + #13#10 +
      'CB_EmptyLines.Caption=Prezne vrstice' + #13#10 +
      'CB_LeadSpaces.Caption=Vodilni presledki' + #13#10 +
      'GroupPageRange.Caption= Obseg strani  ' + #13#10 +
      'Pages.Caption=Številke strani' + #13#10 +
      'Descr.Caption=Vnesite številke in/ali obsege strani loèene z vejicami. Na primer: 1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption= Skaliranje ' + #13#10 +
      'ScX.Caption=X vrednost' + #13#10 +
      'ScY.Caption=Y vrednost' + #13#10 +
      'GroupFramesSettings.Caption= Okviri ' + #13#10 +
      'RB_NoneFrames.Caption=Brez' + #13#10 +
      'RB_Simple.Caption=Enostaven' + #13#10 +
      'RB_Graph.Caption=Grafièen' + #13#10 +
      'RB_Graph.Hint=Samo z OEM kodno stranjo' + #13#10 +
      'CB_PrintAfter.Caption=Natisni po izvozu' + #13#10 +
      'CB_Save.Caption=Shrani nastavitve' + #13#10 +
      'GroupBox1.Caption= Predogled ' + #13#10 +
      'Label1.Caption=Širina:' + #13#10 +
      'Label3.Caption=Višina:' + #13#10 +
      'LBPage.Caption=Stran' + #13#10 +
      'ToolButton1.Hint=Približaj' + #13#10 +
      'ToolButton2.Hint=Oddalji' + #13#10 +
      'SaveDialog1.Filter=Tekstovna datoteka (matrièni tiskalnik)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Print' + #13#10 +
      'Ok.Caption=V redu' + #13#10 +
      'Cancel.Caption=Preklièi' + #13#10 +
      'GroupBox1.Caption=Tiskalnik' + #13#10 +
      'Label4.Caption=Ime' + #13#10 +
      'PropButton.Caption=Nastavitve...' + #13#10 +
      'GroupBox3.Caption=Kopije' + #13#10 +
      'Label2.Caption=Število kopij' + #13#10 +
      'GroupBox2.Caption= Nastavitve tiskalnika ' + #13#10 +
      'Label1.Caption=Tip tiskalnika' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Predloga tiskalnika (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=Predloga tiskalnika (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=Izvoz v RTF' + #13#10 +
      'OkB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Preklièi' + #13#10 +
      'GroupPageRange.Caption= Obseg strani ' + #13#10 +
      'AllRB.Caption=Vse' + #13#10 +
      'CurPageRB.Caption=Trenutna stran' + #13#10 +
      'PageNumbersRB.Caption=Strani:' + #13#10 +
      'DescrL.Caption=Vnesite številke in/ali obsege strani loèene z vejicami. Na primer: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Nastavitev izvoza ' + #13#10 +
      'PicturesCB.Caption=Slike' + #13#10 +
      'PageBreaksCB.Caption=Prelomi strani' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenCB.Caption=Odpri po izvozu' + #13#10 +
      'SaveDialog1.Filter=RTF datoteka (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Nastavitev izvoza' + #13#10 +
      'Ok.Caption=V redu' + #13#10 +
      'Cancel.Caption=Preklièi' + #13#10 +
      'GroupPageRange.Caption= Obseg strani ' + #13#10 +
      'AllRB.Caption=Vse' + #13#10 +
      'CurPageRB.Caption=Trenutna stran' + #13#10 +
      'PageNumbersRB.Caption=Strani:' + #13#10 +
      'DescrL.Caption=Vnesite številke in/ali obsege strani loèene z vejicami. Na primer: 1,3,5-12' + #13#10 +
      'GroupBox1.Caption= Nastavitev slike ' + #13#10 +
      'Label2.Caption=JPEG kvaliteta' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=Obrez strani' + #13#10 +
      'Mono.Caption=Èrno-belo' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=Izvoz v PDF' + #13#10 +
      'OkB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Preklièi' + #13#10 +
      'GroupPageRange.Caption= Obseg strani ' + #13#10 +
      'AllRB.Caption=Vse' + #13#10 +
      'CurPageRB.Caption=Trenutna stran' + #13#10 +
      'PageNumbersRB.Caption=Strani:' + #13#10 +
      'DescrL.Caption=Vnesite številke in/ali obsege strani loèene z vejicami. Na primer: 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Nastavitev izvoza ' + #13#10 +
      'CompressedCB.Caption=Stisnjeno' + #13#10 +
      'EmbeddedCB.Caption=Vstavljene pisave' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenCB.Caption=Odpri po izvozu' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'SaveDialog1.Filter=Adobe PDF datoteka (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'RTF datoteka');
    Add('BMPexport', 'BMP slika');
    Add('JPEGexport', 'JPEG slika');
    Add('TIFFexport', 'TIFF slika');
    Add('TextExport', 'Text (matrièni tiskalnik)');
    Add('XlsOLEexport', 'Excel tabela (OLE)');
    Add('HTMLexport', 'HTML datoteka');
    Add('XlsXMLexport', 'Excel tabela (XML)');
    Add('PDFexport', 'PDF datoteka');

    Add('ProgressWait', 'Prismo, poèakajte');
    Add('ProgressRows', 'Nastavljanje vrstic');
    Add('ProgressColumns', 'Nastavljanje stolpcev');
    Add('ProgressStyles', 'Nastavljanje stilov');
    Add('ProgressObjects', 'Izvažanje predmetov');


    Add('TIFFexportFilter', 'Tiff slika (*.tif)|*.tif');
    Add('BMPexportFilter', 'BMP slika (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Jpeg slika (*.jpg)|*.jpg');

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
