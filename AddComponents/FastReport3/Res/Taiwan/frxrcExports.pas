
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
      'Caption=�ץX�� Excel' + #13#10 +
      'OkB.Caption=�T�w' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      'GroupPageRange.Caption= ���ƽd�� ' + #13#10 +
      'AllRB.Caption=����' + #13#10 +
      'CurPageRB.Caption=����' + #13#10 +
      'PageNumbersRB.Caption=��:' + #13#10 +
      'DescrL.Caption=��J����/���d��A�åH�r�����j(�Ҧp:1,3,5-12)' + #13#10 +
      'GroupQuality.Caption= �ץX�]�w ' + #13#10 +
      'StylesCB.Caption=�˦�' + #13#10 +
      'PicturesCB.Caption=�Ϲ�' + #13#10 +
      'MergeCB.Caption=�X���x�s��' + #13#10 +
      'PageBreaksCB.Caption=����' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'WCB.Caption=�ҵ��Y�ұo' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=�b�ץX��}�� Excel' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=Excel �� (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=�ץX�� Excel' + #13#10 +
      'OkB.Caption=�T�w' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      'GroupPageRange.Caption= ���ƽd�� ' + #13#10 +
      'AllRB.Caption=����' + #13#10 +
      'CurPageRB.Caption=����' + #13#10 +
      'PageNumbersRB.Caption=��:' + #13#10 +
      'DescrL.Caption=��J����/���d��A�åH�r�����j(�Ҧp:1,3,5-12)' + #13#10 +
      'GroupQuality.Caption= �ץX�]�w ' + #13#10 +
      'StylesCB.Caption=�˦�' + #13#10 +
      'PageBreaksCB.Caption=����' + #13#10 +
      'WCB.Caption=�ҵ��Y�ұo' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=�b�ץX��}�� Excel' + #13#10 +
      'SaveDialog1.Filter=XML Excel �� (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=�ץX�� HTML table' + #13#10 +
      'OkB.Caption=�T�w' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      'GroupPageRange.Caption= ���ƽd�� ' + #13#10 +
      'AllRB.Caption=����' + #13#10 +
      'CurPageRB.Caption=����' + #13#10 +
      'PageNumbersRB.Caption=��:' + #13#10 +
      'DescrL.Caption=��J����/���d��A�åH�r�����j(�Ҧp:1,3,5-12)' + #13#10 +
      'GroupQuality.Caption= �ץX�]�w ' + #13#10 +
      'OpenAfterCB.Caption=�b�ץX��}��' + #13#10 +
      'StylesCB.Caption=�˦�' + #13#10 +
      'PicturesCB.Caption=�Ϲ�' + #13#10 +
      'PicsSameCB.Caption=�����b�@��Ƨ�' + #13#10 +
      'FixWidthCB.Caption=�T�w�e��' + #13#10 +
      'NavigatorCB.Caption=��������' + #13#10 +
      'MultipageCB.Caption=�h��' + #13#10 +
      'MozillaCB.Caption=Mozilla �s����' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=HTML �� (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=�ץX��¤�r (�I�}���L���)' + #13#10 +
      'OK.Caption=�T�w' + #13#10 +
      'Cancel.Caption=����' + #13#10 +
      'BtnPreview.Hint=�w�� �ҥ�/����' + #13#10 +
      'GroupCellProp.Caption= �ץX�ݩ�  ' + #13#10 +
      'CB_PageBreaks.Caption=����' + #13#10 +
      'CB_OEM.Caption=OEM ���X' + #13#10 +
      'CB_EmptyLines.Caption=�ťզ�' + #13#10 +
      'CB_LeadSpaces.Caption=�e�m�ť�' + #13#10 +
      'GroupPageRange.Caption= ���ƽd��  ' + #13#10 +
      'Pages.Caption=����' + #13#10 +
      'Descr.Caption=��J����/���d��A�åH�r�����j(�Ҧp:1,3,5-12)' + #13#10 +
      'GroupScaleSettings.Caption= ��v ' + #13#10 +
      'ScX.Caption=X ��v' + #13#10 +
      'ScY.Caption=Y ��v' + #13#10 +
      'GroupFramesSettings.Caption= �~�� ' + #13#10 +
      'RB_NoneFrames.Caption=�L' + #13#10 +
      'RB_Simple.Caption=²��' + #13#10 +
      'RB_Graph.Caption=�Ϲ�' + #13#10 +
      'RB_Graph.Hint=Only with OEM codepage' + #13#10 +
      'CB_PrintAfter.Caption=�b�ץX��}��' + #13#10 +
      'CB_Save.Caption=�x�s�]�w' + #13#10 +
      'GroupBox1.Caption= �w�� ' + #13#10 +
      'Label1.Caption=�e��:' + #13#10 +
      'Label3.Caption=����:' + #13#10 +
      'LBPage.Caption=��' + #13#10 +
      'ToolButton1.Hint=��j' + #13#10 +
      'ToolButton2.Hint=�Y�p' + #13#10 +
      'SaveDialog1.Filter=��r�� (�I�}���L���)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=�C�L' + #13#10 +
      'OK.Caption=�T�w' + #13#10 +
      'Cancel.Caption=����' + #13#10 +
      'GroupBox1.Caption=�L���' + #13#10 +
      'Label4.Caption=Name' + #13#10 +
      'PropButton.Caption=�]�w...' + #13#10 +
      'GroupBox3.Caption=����' + #13#10 +
      'Label2.Caption=����' + #13#10 +
      'GroupBox2.Caption= �L�����l�Ƴ]�w ' + #13#10 +
      'Label1.Caption=�L������A' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=�L�����l�Ƽ˪� (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=�L�����l�Ƽ˪� (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=�ץX�� RTF' + #13#10 +
      'OkB.Caption=�T�w' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      'GroupPageRange.Caption= ���ƽd�� ' + #13#10 +
      'AllRB.Caption=����' + #13#10 +
      'CurPageRB.Caption=����' + #13#10 +
      'PageNumbersRB.Caption=��:' + #13#10 +
      'DescrL.Caption=��J����/���d��A�åH�r�����j(�Ҧp:1,3,5-12)' + #13#10 +
      'GroupQuality.Caption= �ץX�]�w ' + #13#10 +
      'PicturesCB.Caption=�Ϲ�' + #13#10 +
      'PageBreaksCB.Caption=����' + #13#10 +
      'WCB.Caption=�ҵ��Y�ұo' + #13#10 +
      'OpenCB.Caption=�b�ץX��}��' + #13#10 +
      'SaveDialog1.Filter=RTF �� (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=�ץX�]�w' + #13#10 +
      'OK.Caption=�T�w' + #13#10 +
      'Cancel.Caption=����' + #13#10 +
      'GroupPageRange.Caption= ���ƽd��  ' + #13#10 +
      'AllRB.Caption=����' + #13#10 +
      'CurPageRB.Caption=����' + #13#10 +
      'PageNumbersRB.Caption=��:' + #13#10 +
      'DescrL.Caption=��J����/���d��A�åH�r�����j(�Ҧp:1,3,5-12)' + #13#10 +
      'GroupBox1.Caption= �Ϲ��]�w ' + #13#10 +
      'Label2.Caption=JPEG �~��' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=�ťh�����ťճ���' + #13#10 +
      'Mono.Caption=�¥�' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=�ץX�� PDF' + #13#10 +
      'OkB.Caption=�T�w' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      'GroupPageRange.Caption= ���ƽd�� ' + #13#10 +
      'AllRB.Caption=����' + #13#10 +
      'CurPageRB.Caption=����' + #13#10 +
      'PageNumbersRB.Caption=��:' + #13#10 +
      'DescrL.Caption=��J����/���d��A�åH�r�����j(�Ҧp:1,3,5-12)' + #13#10 +
      'GroupQuality.Caption= �ץX�]�w ' + #13#10 +
      'CompressedCB.Caption=���Y' + #13#10 +
      'EmbeddedCB.Caption=�O�i�r��' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'OpenCB.Caption=�b�ץX��}��' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=Adobe PDF �� (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'RTF ��');
    Add('BMPexport', 'BMP ��');
    Add('JPEGexport', 'JPEG ��');
    Add('TIFFexport', 'TIFF ��');
    Add('TextExport', '�¤�r (�I�}�L���)');
    Add('XlsOLEexport', 'Excel ��� (OLE)');
    Add('HTMLexport', 'HTML ��');
    Add('XlsXMLexport', 'Excel ��� (XML)');
    Add('PDFexport', 'PDF ��');

    Add('ProgressWait', '�еy��');
    Add('ProgressRows', '���b�إߦC');
    Add('ProgressColumns', '���b�إ���');
    Add('ProgressStyles', '���b�إ߼˦�');
    Add('ProgressObjects', '���b�ץX����');


    Add('TIFFexportFilter', 'Tiff �� (*.tif)|*.tif');
    Add('BMPexportFilter', 'BMP �� (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Jpeg �� (*.jpg)|*.jpg');

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
