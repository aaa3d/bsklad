
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
      'Caption=������� � Excel' + #13#10 +
      'OkB.Caption=��' + #13#10 +
      'CancelB.Caption=������' + #13#10 +
      'GroupPageRange.Caption= �������� ' + #13#10 +
      'AllRB.Caption=���' + #13#10 +
      'CurPageRB.Caption=�������' + #13#10 +
      'PageNumbersRB.Caption=������:' + #13#10 +
      'DescrL.Caption=������� ������ �/��� ��������� �������, ����������� ��������. ��������, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= ����� ' + #13#10 +
      'StylesCB.Caption=�����' + #13#10 +
      'PicturesCB.Caption=��������' + #13#10 +
      'MergeCB.Caption=���������� ������' + #13#10 +
      'PageBreaksCB.Caption=������� �������' + #13#10 +
      'FastExpCB.Caption=������� �������' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'AsTextCB.Caption=��� �����' + #13#10 +
      'BackgrCB.Caption=���' + #13#10 +
      'OpenExcelCB.Caption=������� Excel ����� ��������' + #13#10 +
      'SaveDialog1.Filter=���� Excel (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=������� � Excel' + #13#10 +
      'OkB.Caption=��' + #13#10 +
      'CancelB.Caption=������' + #13#10 +
      'GroupPageRange.Caption= �������� ' + #13#10 +
      'AllRB.Caption=���' + #13#10 +
      'CurPageRB.Caption=�������' + #13#10 +
      'PageNumbersRB.Caption=������:' + #13#10 +
      'DescrL.Caption=������� ������ �/��� ��������� �������, ����������� ��������. ��������, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= ����� ' + #13#10 +
      'StylesCB.Caption=�����' + #13#10 +
      'PageBreaksCB.Caption=������� �������' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'BackgrCB.Caption=���' + #13#10 +
      'OpenExcelCB.Caption=������� Excel ����� ��������' + #13#10 +
      'SaveDialog1.Filter=���� Excel (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=������� � HTML (���������)' + #13#10 +
      'OkB.Caption=��' + #13#10 +
      'CancelB.Caption=������' + #13#10 +
      'GroupPageRange.Caption= �������� ' + #13#10 +
      'AllRB.Caption=���' + #13#10 +
      'CurPageRB.Caption=�������' + #13#10 +
      'PageNumbersRB.Caption=������:' + #13#10 +
      'DescrL.Caption=������� ������ �/��� ��������� �������, ����������� ��������. ��������, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= ����� ' + #13#10 +
      'OpenAfterCB.Caption=������� ����� ��������' + #13#10 +
      'StylesCB.Caption=�����' + #13#10 +
      'PicturesCB.Caption=��������' + #13#10 +
      'PicsSameCB.Caption=��� � ����� �����' + #13#10 +
      'FixWidthCB.Caption=����.������' + #13#10 +
      'NavigatorCB.Caption=���������' + #13#10 +
      'MultipageCB.Caption=���������������' + #13#10 +
      'MozillaCB.Caption=������� Mozilla' + #13#10 +
      'BackgrCB.Caption=���' + #13#10 +
      'SaveDialog1.Filter=���� HTML (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=������� � �����' + #13#10 +
      'OK.Caption=��' + #13#10 +
      'Cancel.Caption=������' + #13#10 +
      'BtnPreview.Hint=�������� ����������' + #13#10 +
      'GroupCellProp.Caption= �����  ' + #13#10 +
      'CB_PageBreaks.Caption=������� �������' + #13#10 +
      'CB_OEM.Caption=OEM-���������' + #13#10 +
      'CB_EmptyLines.Caption=������ ������' + #13#10 +
      'CB_LeadSpaces.Caption=������� �����' + #13#10 +
      'GroupPageRange.Caption= ��������  ' + #13#10 +
      'Pages.Caption=������' + #13#10 +
      'Descr.Caption=������� ������ �/��� ��������� �������, ����������� ��������. ��������, 1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption= ������� ' + #13#10 +
      'ScX.Caption=�� ��� X' + #13#10 +
      'ScY.Caption=�� ��� Y' + #13#10 +
      'GroupFramesSettings.Caption= ����� ' + #13#10 +
      'RB_NoneFrames.Caption=���' + #13#10 +
      'RB_Simple.Caption=���������' + #13#10 +
      'RB_Graph.Caption=�����������' + #13#10 +
      'CB_PrintAfter.Caption=������ ����� ��������' + #13#10 +
      'CB_Save.Caption=��������� ���������' + #13#10 +
      'GroupBox1.Caption= �������� ' + #13#10 +
      'Label1.Caption=������:' + #13#10 +
      'Label3.Caption=������:' + #13#10 +
      'LBPage.Caption=��������' + #13#10 +
      'ToolButton1.Hint=���������' + #13#10 +
      'ToolButton2.Hint=���������' + #13#10 +
      'SaveDialog1.Filter=��������� ���� (*.txt)|*.txt' + #13#10 +
      'SaveDialog1.DefaultExt=.txt' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=������' + #13#10 +
      'OK.Caption=��' + #13#10 +
      'Cancel.Caption=������' + #13#10 +
      'GroupBox1.Caption=�������' + #13#10 +
      'Label4.Caption=���' + #13#10 +
      'PropButton.Caption=���������...' + #13#10 +
      'GroupBox3.Caption=�����' + #13#10 +
      'Label2.Caption=����������' + #13#10 +
      'GroupBox2.Caption= ����� ' + #13#10 +
      'Label1.Caption=��� ��������' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=��������� �������� (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=��������� �������� (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=������� � RTF (���������)' + #13#10 +
      'OkB.Caption=��' + #13#10 +
      'CancelB.Caption=������' + #13#10 +
      'GroupPageRange.Caption= �������� ' + #13#10 +
      'AllRB.Caption=���' + #13#10 +
      'CurPageRB.Caption=�������' + #13#10 +
      'PageNumbersRB.Caption=������:' + #13#10 +
      'DescrL.Caption=������� ������ �/��� ��������� �������, ����������� ��������. ��������, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= ����� ' + #13#10 +
      'PicturesCB.Caption=��������' + #13#10 +
      'PageBreaksCB.Caption=������� �������' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenCB.Caption=������� ����� ��������' + #13#10 +
      'SaveDialog1.Filter=���� RTF (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=������� � �������' + #13#10 +
      'OK.Caption=��' + #13#10 +
      'Cancel.Caption=������' + #13#10 +
      'GroupPageRange.Caption= �������� ' + #13#10 +
      'AllRB.Caption=���' + #13#10 +
      'CurPageRB.Caption=�������' + #13#10 +
      'PageNumbersRB.Caption=������:' + #13#10 +
      'DescrL.Caption=������� ������ �/��� ��������� �������, ����������� ��������. ��������, 1,3,5-12' + #13#10 +
      'GroupBox1.Caption= ����� ' + #13#10 +
      'Label2.Caption=�������� JPEG' + #13#10 +
      'Label1.Caption=���������� (dpi)' + #13#10 +
      'SeparateCB.Caption=���������� �����' + #13#10 +
      'CropPage.Caption=�������� ��������' + #13#10 +
      'Mono.Caption=�����������' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=������� � PDF' + #13#10 +
      'OkB.Caption=��' + #13#10 +
      'CancelB.Caption=������' + #13#10 +
      'GroupPageRange.Caption= �������� ' + #13#10 +
      'AllRB.Caption=���' + #13#10 +
      'CurPageRB.Caption=�������' + #13#10 +
      'PageNumbersRB.Caption=������:' + #13#10 +
      'DescrL.Caption=������� ������ �/��� ��������� �������, ����������� ��������. ��������, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= ����� ' + #13#10 +
      'CompressedCB.Caption=����������' + #13#10 +
      'EmbeddedCB.Caption=�������� ������' + #13#10 +
      'PrintOptCB.Caption=������� ����������' + #13#10 +
      'OutlineCB.Caption=����������' + #13#10 +
      'BackgrCB.Caption=���' + #13#10 +
      'OpenCB.Caption=������� ����� ��������' + #13#10 +
      'SaveDialog1.Filter=���� Adobe PDF (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', '�������� Word (���������)');
    Add('BMPexport', '������� BMP');
    Add('JPEGexport', '������� JPEG');
    Add('TIFFexport', '������� TIFF');
    Add('TextExport', '��������� ����');
    Add('XlsOLEexport', '�������� Excel (OLE)');
    Add('HTMLexport', '�������� HTML (���������)');
    Add('XlsXMLexport', '�������� Excel (XML)');
    Add('PDFexport', '�������� PDF');

    Add('ProgressWait', '���������, ����������');
    Add('ProgressRows', '��������� �����');
    Add('ProgressColumns', '��������� �������');
    Add('ProgressStyles', '��������� ������');
    Add('ProgressObjects', '������� ��������');

    Add('TIFFexportFilter', '������� TIFF (*.tif)|*.tif');
    Add('BMPexportFilter', '������� BMP (*.bmp)|*.bmp');
    Add('JPEGexportFilter', '������� JPEG (*.jpg)|*.jpg');

    Add('HTMLNavFirst', '������');
    Add('HTMLNavPrev', '����.');
    Add('HTMLNavNext', '����.');
    Add('HTMLNavLast', '�����');
    Add('HTMLNavRefresh', '��������');
    Add('HTMLNavPrint', '������');
    Add('HTMLNavTotal', '����� �������');
  end;
end;

initialization
  frAddExportsRes;

end.
