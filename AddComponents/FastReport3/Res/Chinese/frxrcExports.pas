
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
{******************************************
  Translate by ChenFeng For Chinese res file at 2004-12-03 23:09PM
  Email:soareay@hotmail.com
  Good Luck!
******************************************}

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
      'Caption=������ Excel' + #13#10 +
      'OkB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      'GroupPageRange.Caption= ҳ����Χ ' + #13#10 +
      'AllRB.Caption=ȫ��' + #13#10 +
      'CurPageRB.Caption=��ҳ' + #13#10 +
      'PageNumbersRB.Caption=ҳ:' + #13#10 +
      'DescrL.Caption=����ҳ��/�ļ���Χ�����Զ��ŷָ�(����:1,3,5-12)' + #13#10 +
      'GroupQuality.Caption= �������� ' + #13#10 +
      'StylesCB.Caption=��ʽ' + #13#10 +
      'PicturesCB.Caption=ͼ��' + #13#10 +
      'MergeCB.Caption=�ϲ���Ԫ��' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'PageBreaksCB.Caption=��ҳ' + #13#10 +
      'WCB.Caption=����������' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=�ڵ������ Excel' + #13#10 +
      'SaveDialog1.Filter=Excel �ļ� (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=������ Excel' + #13#10 +
      'OkB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      'GroupPageRange.Caption= ҳ����Χ ' + #13#10 +
      'AllRB.Caption=ȫ��' + #13#10 +
      'CurPageRB.Caption=��ҳ' + #13#10 +
      'PageNumbersRB.Caption=ҳ:' + #13#10 +
      'DescrL.Caption=����ҳ��/�ļ���Χ�����Զ��ŷָ�(����:1,3,5-12)' + #13#10 +
      'GroupQuality.Caption= �������� ' + #13#10 +
      'StylesCB.Caption=��ʽ' + #13#10 +
      'PageBreaksCB.Caption=��ҳ' + #13#10 +
      'WCB.Caption=����������' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=�ڵ������ Excel' + #13#10 +
      'SaveDialog1.Filter=XML Excel �ļ� (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=������ HTML table' + #13#10 +
      'OkB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      'GroupPageRange.Caption= ҳ����Χ ' + #13#10 +
      'AllRB.Caption=ȫ��' + #13#10 +
      'CurPageRB.Caption=��ҳ' + #13#10 +
      'PageNumbersRB.Caption=ҳ:' + #13#10 +
      'DescrL.Caption=����ҳ��/�ļ���Χ�����Զ��ŷָ�(����:1,3,5-12)' + #13#10 +
      'GroupQuality.Caption= �������� ' + #13#10 +
      'OpenAfterCB.Caption=�ڵ������' + #13#10 +
      'StylesCB.Caption=��ʽ' + #13#10 +
      'PicturesCB.Caption=ͼ��' + #13#10 +
      'PicsSameCB.Caption=ȫ����һ���ݼ�' + #13#10 +
      'FixWidthCB.Caption=�̶����' + #13#10 +
      'NavigatorCB.Caption=ҳ�浼��' + #13#10 +
      'MultipageCB.Caption=��ҳ' + #13#10 +
      'MozillaCB.Caption=Mozilla �����' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=HTML �ļ� (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=���������ı� (����ʽ��ӡ��)' + #13#10 +
      'OK.Caption=ȷ��' + #13#10 +
      'Cancel.Caption=ȡ��' + #13#10 +
      'BtnPreview.Hint=Ԥ�� ����/ͣ��' + #13#10 +
      'GroupCellProp.Caption= ��������  ' + #13#10 +
      'CB_PageBreaks.Caption=��ҳ' + #13#10 +
      'CB_OEM.Caption=OEM ҳ��' + #13#10 +
      'CB_EmptyLines.Caption=�հ���' + #13#10 +
      'CB_LeadSpaces.Caption=ǰ�ÿհ�' + #13#10 +
      'GroupPageRange.Caption= ҳ����Χ  ' + #13#10 +
      'Pages.Caption=ҳ��' + #13#10 +
      'Descr.Caption=����ҳ��/�ļ���Χ�����Զ��ŷָ�(����:1,3,5-12)' + #13#10 +
      'GroupScaleSettings.Caption= ���� ' + #13#10 +
      'ScX.Caption=X ����' + #13#10 +
      'ScY.Caption=Y ����' + #13#10 +
      'GroupFramesSettings.Caption= ��� ' + #13#10 +
      'RB_NoneFrames.Caption=��' + #13#10 +
      'RB_Simple.Caption=��' + #13#10 +
      'RB_Graph.Caption=ͼ��' + #13#10 +
      'RB_Graph.Hint=Only with OEM codepage' + #13#10 +
      'CB_PrintAfter.Caption=�ڵ������' + #13#10 +
      'CB_Save.Caption=��������' + #13#10 +
      'GroupBox1.Caption= Ԥ�� ' + #13#10 +
      'Label1.Caption=���:' + #13#10 +
      'Label3.Caption=�߶�:' + #13#10 +
      'LBPage.Caption=ҳ' + #13#10 +
      'ToolButton1.Hint=�Ŵ�' + #13#10 +
      'ToolButton2.Hint=��С' + #13#10 +
      'SaveDialog1.Filter=�ı��ļ� (����ʽ��ӡ��)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=��ӡ' + #13#10 +
      'OK.Caption=ȷ��' + #13#10 +
      'Cancel.Caption=ȡ��' + #13#10 +
      'GroupBox1.Caption=��ӡ��' + #13#10 +
      'Label4.Caption=Name' + #13#10 +
      'PropButton.Caption=����...' + #13#10 +
      'GroupBox3.Caption=����' + #13#10 +
      'Label2.Caption=����' + #13#10 +
      'GroupBox2.Caption= ��ӡ����ʼ������ ' + #13#10 +
      'Label1.Caption=��ӡ������' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=��ӡ����ʼ������ (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=��ӡ����ʼ������ (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=������ RTF' + #13#10 +
      'OkB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      'GroupPageRange.Caption= ҳ����Χ ' + #13#10 +
      'AllRB.Caption=ȫ��' + #13#10 +
      'CurPageRB.Caption=��ҳ' + #13#10 +
      'PageNumbersRB.Caption=ҳ:' + #13#10 +
      'DescrL.Caption=����ҳ��/�ļ���Χ�����Զ��ŷָ�(����:1,3,5-12)' + #13#10 +
      'GroupQuality.Caption= �������� ' + #13#10 +
      'PicturesCB.Caption=ͼ��' + #13#10 +
      'PageBreaksCB.Caption=��ҳ' + #13#10 +
      'WCB.Caption=����������' + #13#10 +
      'OpenCB.Caption=�ڵ������' + #13#10 +
      'SaveDialog1.Filter=RTF �ļ� (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=��������' + #13#10 +
      'OK.Caption=ȷ��' + #13#10 +
      'Cancel.Caption=ȡ��' + #13#10 +
      'GroupPageRange.Caption= ҳ����Χ  ' + #13#10 +
      'AllRB.Caption=ȫ��' + #13#10 +
      'CurPageRB.Caption=��ҳ' + #13#10 +
      'PageNumbersRB.Caption=ҳ:' + #13#10 +
      'DescrL.Caption=����ҳ��/�ļ���Χ�����Զ��ŷָ�(����:1,3,5-12)' + #13#10 +
      'GroupBox1.Caption= ͼ������ ' + #13#10 +
      'Label2.Caption=JPEG Ʒ��' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=��ȥҳ��հײ���' + #13#10 +
      'Mono.Caption=�ڰ�' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=������ PDF' + #13#10 +
      'OkB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      'GroupPageRange.Caption= ҳ����Χ ' + #13#10 +
      'AllRB.Caption=ȫ��' + #13#10 +
      'CurPageRB.Caption=��ҳ' + #13#10 +
      'PageNumbersRB.Caption=ҳ:' + #13#10 +
      'DescrL.Caption=����ҳ��/�ļ���Χ�����Զ��ŷָ�(����:1,3,5-12)' + #13#10 +
      'GroupQuality.Caption= �������� ' + #13#10 +
      'CompressedCB.Caption=ѹ��' + #13#10 +
      'EmbeddedCB.Caption=Ƕ������' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenCB.Caption=�ڵ������' + #13#10 +
      'SaveDialog1.Filter=Adobe PDF �ļ� (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'RTF �ļ�');
    Add('BMPexport', 'BMP ͼ');
    Add('JPEGexport', 'JPEG ͼ');
    Add('TIFFexport', 'TIFF ͼ');
    Add('TextExport', '���ı� (�����ӡ��)');
    Add('XlsOLEexport', 'Excel ��� (OLE)');
    Add('HTMLexport', 'HTML �ļ�');
    Add('XlsXMLexport', 'Excel ��� (XML)');
    Add('PDFexport', 'PDF �ļ�');

    Add('ProgressWait', '���Ժ�');
    Add('ProgressRows', '���ڽ�����');
    Add('ProgressColumns', '���ڽ�����');
    Add('ProgressStyles', '���ڽ�����ʽ');
    Add('ProgressObjects', '���ڵ���������');


    Add('TIFFexportFilter', 'Tiff ͼ (*.tif)|*.tif');
    Add('BMPexportFilter', 'BMP ͼ (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Jpeg ͼ (*.jpg)|*.jpg');

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
