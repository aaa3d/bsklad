
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
      'Caption=Export to Excel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'GroupPageRange.Caption= Page range ' + #13#10 +
      'AllRB.Caption=All' + #13#10 +
      'CurPageRB.Caption=Current page' + #13#10 +
      'PageNumbersRB.Caption=Pages:' + #13#10 +
      'DescrL.Caption=Enter page numbers and/or page ranges, separated by commas. For example, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Export settings ' + #13#10 +
      'StylesCB.Caption=Styles' + #13#10 +
      'PicturesCB.Caption=Pictures' + #13#10 +
      'MergeCB.Caption=Merge cells' + #13#10 +
      'PageBreaksCB.Caption=Page breaks' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Open Excel after export' + #13#10 +
      'SaveDialog1.Filter=Excel file (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=Export to Excel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'GroupPageRange.Caption= Page range ' + #13#10 +
      'AllRB.Caption=All' + #13#10 +
      'CurPageRB.Caption=Current page' + #13#10 +
      'PageNumbersRB.Caption=Pages:' + #13#10 +
      'DescrL.Caption=Enter page numbers and/or page ranges, separated by commas. For example, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Export settings ' + #13#10 +
      'StylesCB.Caption=Styles' + #13#10 +
      'PageBreaksCB.Caption=Page breaks' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Open Excel after export' + #13#10 +
      'SaveDialog1.Filter=XML Excel file (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=Export to HTML table' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'GroupPageRange.Caption= Page range ' + #13#10 +
      'AllRB.Caption=All' + #13#10 +
      'CurPageRB.Caption=Current page' + #13#10 +
      'PageNumbersRB.Caption=Pages:' + #13#10 +
      'DescrL.Caption=Enter page numbers and/or page ranges, separated by commas. For example, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Export settings ' + #13#10 +
      'OpenAfterCB.Caption=Open after export' + #13#10 +
      'StylesCB.Caption=Styles' + #13#10 +
      'PicturesCB.Caption=Pictures' + #13#10 +
      'PicsSameCB.Caption=All in one folder' + #13#10 +
      'FixWidthCB.Caption=Fixed width' + #13#10 +
      'NavigatorCB.Caption=Page navigator' + #13#10 +
      'MultipageCB.Caption=Multipage' + #13#10 +
      'MozillaCB.Caption=Mozilla browser' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=HTML file (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Export to text (dot-matrix printer)' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Cancel' + #13#10 +
      'BtnPreview.Hint=Preview on/off' + #13#10 +
      'GroupCellProp.Caption= Export properties  ' + #13#10 +
      'CB_PageBreaks.Caption=Page breaks' + #13#10 +
      'CB_OEM.Caption=OEM codepage' + #13#10 +
      'CB_EmptyLines.Caption=Empty lines' + #13#10 +
      'CB_LeadSpaces.Caption=Lead spaces' + #13#10 +
      'GroupPageRange.Caption= Page range  ' + #13#10 +
      'Pages.Caption=Page numbers' + #13#10 +
      'Descr.Caption=Enter numbers and/or page ranges, separated by commas. For example: 1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption= Scaling ' + #13#10 +
      'ScX.Caption=X Scale' + #13#10 +
      'ScY.Caption=Y Scale' + #13#10 +
      'GroupFramesSettings.Caption= Frames ' + #13#10 +
      'RB_NoneFrames.Caption=None' + #13#10 +
      'RB_Simple.Caption=Simple' + #13#10 +
      'RB_Graph.Caption=Graphic' + #13#10 +
      'RB_Graph.Hint=Only with OEM codepage' + #13#10 +
      'CB_PrintAfter.Caption=Print after export' + #13#10 +
      'CB_Save.Caption=Save settings' + #13#10 +
      'GroupBox1.Caption= Preview ' + #13#10 +
      'Label1.Caption=Width:' + #13#10 +
      'Label3.Caption=Height:' + #13#10 +
      'LBPage.Caption=Page' + #13#10 +
      'ToolButton1.Hint=Zoom in' + #13#10 +
      'ToolButton2.Hint=Zoom out' + #13#10 +
      'SaveDialog1.Filter=Text file (dot-matrix printer)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Print' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Cancel' + #13#10 +
      'GroupBox1.Caption=Printer' + #13#10 +
      'Label4.Caption=Name' + #13#10 +
      'PropButton.Caption=Setup...' + #13#10 +
      'GroupBox3.Caption=Copies' + #13#10 +
      'Label2.Caption=Number of copies' + #13#10 +
      'GroupBox2.Caption= Printer init setup ' + #13#10 +
      'Label1.Caption=Printer type' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Printer init template (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=Printer init template (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=Export to RTF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'GroupPageRange.Caption= Page range ' + #13#10 +
      'AllRB.Caption=All' + #13#10 +
      'CurPageRB.Caption=Current page' + #13#10 +
      'PageNumbersRB.Caption=Pages:' + #13#10 +
      'DescrL.Caption=Enter page numbers and/or page ranges, separated by commas. For example, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Export settings ' + #13#10 +
      'PicturesCB.Caption=Pictures' + #13#10 +
      'PageBreaksCB.Caption=Page breaks' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenCB.Caption=Open after export' + #13#10 +
      'SaveDialog1.Filter=RTF file (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Export Settings' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Cancel' + #13#10 +
      'GroupPageRange.Caption= Page range  ' + #13#10 +
      'AllRB.Caption=All' + #13#10 +
      'CurPageRB.Caption=Current page' + #13#10 +
      'PageNumbersRB.Caption=Pages:' + #13#10 +
      'DescrL.Caption=Enter page numbers and/or page ranges, separated by commas. For example, 1,3,5-12' + #13#10 +
      'GroupBox1.Caption= Image settings ' + #13#10 +
      'Label2.Caption=JPEG quality' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=Crop pages' + #13#10 +
      'Mono.Caption=Monochrome' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=Export to PDF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'GroupPageRange.Caption= Page range ' + #13#10 +
      'AllRB.Caption=All' + #13#10 +
      'CurPageRB.Caption=Current page' + #13#10 +
      'PageNumbersRB.Caption=Pages:' + #13#10 +
      'DescrL.Caption=Enter page numbers and/or page ranges, separated by commas. For example, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Export settings ' + #13#10 +
      'CompressedCB.Caption=Compressed' + #13#10 +
      'EmbeddedCB.Caption=Embedded fonts' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenCB.Caption=Open after export' + #13#10 +
      'SaveDialog1.Filter=Adobe PDF file (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'RTF file');
    Add('BMPexport', 'BMP image');
    Add('JPEGexport', 'JPEG image');
    Add('TIFFexport', 'TIFF image');
    Add('TextExport', 'Text (matrix printer)');
    Add('XlsOLEexport', 'Excel table (OLE)');
    Add('HTMLexport', 'HTML file');
    Add('XlsXMLexport', 'Excel table (XML)');
    Add('PDFexport', 'PDF file');

    Add('ProgressWait', 'Please wait');
    Add('ProgressRows', 'Setting up rows');
    Add('ProgressColumns', 'Setting up columns');
    Add('ProgressStyles', 'Setting up styles');
    Add('ProgressObjects', 'Exporting objects');


    Add('TIFFexportFilter', 'Tiff image (*.tif)|*.tif');
    Add('BMPexportFilter', 'BMP image (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Jpeg image (*.jpg)|*.jpg');

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
