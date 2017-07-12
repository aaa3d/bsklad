
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
      'Caption=Eksporter til Excel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      'GroupPageRange.Caption= Sideområde ' + #13#10 +
      'AllRB.Caption=Alle' + #13#10 +
      'CurPageRB.Caption=Aktuel side' + #13#10 +
      'PageNumbersRB.Caption=Sider:' + #13#10 +
      'DescrL.Caption=Angiv sidetal og/eller sideområder adskilt af kommaer, f.eks. 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Eksportopsætning ' + #13#10 +
      'StylesCB.Caption=Stilart' + #13#10 +
      'PicturesCB.Caption=Billeder' + #13#10 +
      'MergeCB.Caption=Sammensæt celler' + #13#10 +
      'PageBreaksCB.Caption=Sideskift' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Åbn Excel efter eksport' + #13#10 +
      'SaveDialog1.Filter=Excel fil (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=Eksport til Excel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      'GroupPageRange.Caption= Sideområde ' + #13#10 +
      'AllRB.Caption=Alle' + #13#10 +
      'CurPageRB.Caption=Aktuel side' + #13#10 +
      'PageNumbersRB.Caption=Sider:' + #13#10 +
      'DescrL.Caption=Angiv sidetal og/eller sideområder adskilt af kommaer, f.eks. 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Eksportopsætning ' + #13#10 +
      'StylesCB.Caption=Stilart' + #13#10 +
      'PageBreaksCB.Caption=Sideskift' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Åbn Excel efter eksport' + #13#10 +
      'SaveDialog1.Filter=XML Excel fil (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=Eksporter til HTML tabel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      'GroupPageRange.Caption= Sideområde ' + #13#10 +
      'AllRB.Caption=Alle' + #13#10 +
      'CurPageRB.Caption=Aktuel side' + #13#10 +
      'PageNumbersRB.Caption=Sider:' + #13#10 +
      'DescrL.Caption=Angiv sidetal og/eller sideområder adskilt af kommaer, f.eks. 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Eksportopsætning ' + #13#10 +
      'OpenAfterCB.Caption=Åbn efter eksport' + #13#10 +
      'StylesCB.Caption=Stilart' + #13#10 +
      'PicturesCB.Caption=Billeder' + #13#10 +
      'PicsSameCB.Caption=Alt i en mappe' + #13#10 +
      'FixWidthCB.Caption=Fast bredde' + #13#10 +
      'NavigatorCB.Caption=Sidenavigation' + #13#10 +
      'MultipageCB.Caption=Multiside' + #13#10 +
      'MozillaCB.Caption=Mozilla browser' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=HTML fil (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Eksporter til tekst (dot-matrix printer)' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Fortryd' + #13#10 +
      'BtnPreview.Hint=Vis udskrift slået til/fra' + #13#10 +
      'GroupCellProp.Caption= Eksportegenskaber  ' + #13#10 +
      'CB_PageBreaks.Caption=Sideskift' + #13#10 +
      'CB_OEM.Caption=OEM codepage' + #13#10 +
      'CB_EmptyLines.Caption=Tomme linier' + #13#10 +
      'CB_LeadSpaces.Caption=Mellemrum i starten' + #13#10 +
      'GroupPageRange.Caption= Sideområde  ' + #13#10 +
      'Pages.Caption=Sidenummer' + #13#10 +
      'Descr.Caption=Angiv sidetal og/eller sideområder adskilt af kommaer, f.eks. 1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption= Skalering ' + #13#10 +
      'ScX.Caption=X Skala' + #13#10 +
      'ScY.Caption=Y Skala' + #13#10 +
      'GroupFramesSettings.Caption= Rammer ' + #13#10 +
      'RB_NoneFrames.Caption=Ingen' + #13#10 +
      'RB_Simple.Caption=Simpel' + #13#10 +
      'RB_Graph.Caption=Grafik' + #13#10 +
      'RB_Graph.Hint=Kun med OEM codepage' + #13#10 +
      'CB_PrintAfter.Caption=Udskriv efter eksport' + #13#10 +
      'CB_Save.Caption=Gem opsætning' + #13#10 +
      'GroupBox1.Caption= Vis udskrift ' + #13#10 +
      'Label1.Caption=Bredde:' + #13#10 +
      'Label3.Caption=Højde:' + #13#10 +
      'LBPage.Caption=Side' + #13#10 +
      'ToolButton1.Hint=Zoom ind' + #13#10 +
      'ToolButton2.Hint=Zoom ud' + #13#10 +
      'SaveDialog1.Filter=Tekst fil (dot-matrix printer)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Udskriv' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Fortryd' + #13#10 +
      'GroupBox1.Caption=Printer' + #13#10 +
      'Label4.Caption=Navn' + #13#10 +
      'PropButton.Caption=Opsætning...' + #13#10 +
      'GroupBox3.Caption=Kopier' + #13#10 +
      'Label2.Caption=Antal af kopier' + #13#10 +
      'GroupBox2.Caption= Printer init opsætning ' + #13#10 +
      'Label1.Caption=Printer type' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Printer init skabelon (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=Printer init skabelon (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=Eksporter til RTF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      'GroupPageRange.Caption= Sideområde ' + #13#10 +
      'AllRB.Caption=Alle' + #13#10 +
      'CurPageRB.Caption=Aktuel side' + #13#10 +
      'PageNumbersRB.Caption=Side:' + #13#10 +
      'DescrL.Caption=Angiv sidetal og/eller sideområder adskilt af kommaer, f.eks. 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Eksportopsætning ' + #13#10 +
      'PicturesCB.Caption=Billeder' + #13#10 +
      'PageBreaksCB.Caption=Sideskift' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenCB.Caption=Åbn efter eksport' + #13#10 +
      'SaveDialog1.Filter=RTF fil (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Eksportopsætning' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Fortryd' + #13#10 +
      'GroupPageRange.Caption= Sideområde  ' + #13#10 +
      'AllRB.Caption=Alle' + #13#10 +
      'CurPageRB.Caption=Aktuel side' + #13#10 +
      'PageNumbersRB.Caption=Sider:' + #13#10 +
      'DescrL.Caption=Angiv sidetal og/eller sideområder adskilt af kommaer, f.eks. 1,3,5-12' + #13#10 +
      'GroupBox1.Caption= Billedeopsætning ' + #13#10 +
      'Label2.Caption=JPEG kvalitet' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=Beskær sider' + #13#10 +
      'Mono.Caption=Monochrome' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=Eksporter til PDF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      'GroupPageRange.Caption= Sideområde ' + #13#10 +
      'AllRB.Caption=Alle' + #13#10 +
      'CurPageRB.Caption=Aktuel side' + #13#10 +
      'PageNumbersRB.Caption=Sider:' + #13#10 +
      'DescrL.Caption=Angiv sidetal og/eller sideområder adskilt af kommaer, f.eks. 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Eksportopsætning ' + #13#10 +
      'CompressedCB.Caption=Komprimeret' + #13#10 +
      'EmbeddedCB.Caption=Embedded skrifttyper' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'OpenCB.Caption=Åbn efter eksport' + #13#10 +
      'SaveDialog1.Filter=Adobe PDF fil (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'RTF fil');
    Add('BMPexport', 'BMP billede');
    Add('JPEGexport', 'JPEG billede');
    Add('TIFFexport', 'TIFF billede');
    Add('TextExport', 'Tekst (matrix printer)');
    Add('XlsOLEexport', 'Excel tabel (OLE)');
    Add('HTMLexport', 'HTML fil');
    Add('XlsXMLexport', 'Excel tabel (XML)');
    Add('PDFexport', 'PDF fil');

    Add('ProgressWait', 'Vent venligst');
    Add('ProgressRows', 'Opsætter rækker');
    Add('ProgressColumns', 'Opsætter kolonner');
    Add('ProgressStyles', 'Opsætter styles');
    Add('ProgressObjects', 'Eksporterer objekter');


    Add('TIFFexportFilter', 'Tiff billede (*.tif)|*.tif');
    Add('BMPexportFilter', 'BMP billede (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Jpeg billede (*.jpg)|*.jpg');

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
