
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
      'Caption=导出到 Excel' + #13#10 +
      'OkB.Caption=确定' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'GroupPageRange.Caption= 页数范围 ' + #13#10 +
      'AllRB.Caption=全部' + #13#10 +
      'CurPageRB.Caption=本页' + #13#10 +
      'PageNumbersRB.Caption=页:' + #13#10 +
      'DescrL.Caption=输入页数/文件范围，并以逗号分隔(例如:1,3,5-12)' + #13#10 +
      'GroupQuality.Caption= 导出设置 ' + #13#10 +
      'StylesCB.Caption=样式' + #13#10 +
      'PicturesCB.Caption=图像' + #13#10 +
      'MergeCB.Caption=合并单元格' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'PageBreaksCB.Caption=分页' + #13#10 +
      'WCB.Caption=所见即所得' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=在导出后打开 Excel' + #13#10 +
      'SaveDialog1.Filter=Excel 文件 (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=导出到 Excel' + #13#10 +
      'OkB.Caption=确定' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'GroupPageRange.Caption= 页数范围 ' + #13#10 +
      'AllRB.Caption=全部' + #13#10 +
      'CurPageRB.Caption=本页' + #13#10 +
      'PageNumbersRB.Caption=页:' + #13#10 +
      'DescrL.Caption=输入页数/文件范围，并以逗号分隔(例如:1,3,5-12)' + #13#10 +
      'GroupQuality.Caption= 导出设置 ' + #13#10 +
      'StylesCB.Caption=样式' + #13#10 +
      'PageBreaksCB.Caption=分页' + #13#10 +
      'WCB.Caption=所见即所得' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=在导出后打开 Excel' + #13#10 +
      'SaveDialog1.Filter=XML Excel 文件 (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=导出到 HTML table' + #13#10 +
      'OkB.Caption=确定' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'GroupPageRange.Caption= 页数范围 ' + #13#10 +
      'AllRB.Caption=全部' + #13#10 +
      'CurPageRB.Caption=本页' + #13#10 +
      'PageNumbersRB.Caption=页:' + #13#10 +
      'DescrL.Caption=输入页数/文件范围，并以逗号分隔(例如:1,3,5-12)' + #13#10 +
      'GroupQuality.Caption= 导出设置 ' + #13#10 +
      'OpenAfterCB.Caption=在导出后打开' + #13#10 +
      'StylesCB.Caption=样式' + #13#10 +
      'PicturesCB.Caption=图像' + #13#10 +
      'PicsSameCB.Caption=全部在一数据夹' + #13#10 +
      'FixWidthCB.Caption=固定宽度' + #13#10 +
      'NavigatorCB.Caption=页面导览' + #13#10 +
      'MultipageCB.Caption=多页' + #13#10 +
      'MozillaCB.Caption=Mozilla 浏览器' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=HTML 文件 (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=导出到纯文本 (点阵式打印机)' + #13#10 +
      'OK.Caption=确定' + #13#10 +
      'Cancel.Caption=取消' + #13#10 +
      'BtnPreview.Hint=预览 启用/停用' + #13#10 +
      'GroupCellProp.Caption= 导出属性  ' + #13#10 +
      'CB_PageBreaks.Caption=分页' + #13#10 +
      'CB_OEM.Caption=OEM 页码' + #13#10 +
      'CB_EmptyLines.Caption=空白行' + #13#10 +
      'CB_LeadSpaces.Caption=前置空白' + #13#10 +
      'GroupPageRange.Caption= 页数范围  ' + #13#10 +
      'Pages.Caption=页数' + #13#10 +
      'Descr.Caption=输入页数/文件范围，并以逗号分隔(例如:1,3,5-12)' + #13#10 +
      'GroupScaleSettings.Caption= 比率 ' + #13#10 +
      'ScX.Caption=X 比率' + #13#10 +
      'ScY.Caption=Y 比率' + #13#10 +
      'GroupFramesSettings.Caption= 外框 ' + #13#10 +
      'RB_NoneFrames.Caption=无' + #13#10 +
      'RB_Simple.Caption=简单' + #13#10 +
      'RB_Graph.Caption=图像' + #13#10 +
      'RB_Graph.Hint=Only with OEM codepage' + #13#10 +
      'CB_PrintAfter.Caption=在导出后打开' + #13#10 +
      'CB_Save.Caption=保存设置' + #13#10 +
      'GroupBox1.Caption= 预览 ' + #13#10 +
      'Label1.Caption=宽度:' + #13#10 +
      'Label3.Caption=高度:' + #13#10 +
      'LBPage.Caption=页' + #13#10 +
      'ToolButton1.Hint=放大' + #13#10 +
      'ToolButton2.Hint=缩小' + #13#10 +
      'SaveDialog1.Filter=文本文件 (点阵式打印机)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=打印' + #13#10 +
      'OK.Caption=确定' + #13#10 +
      'Cancel.Caption=取消' + #13#10 +
      'GroupBox1.Caption=打印机' + #13#10 +
      'Label4.Caption=Name' + #13#10 +
      'PropButton.Caption=设置...' + #13#10 +
      'GroupBox3.Caption=份数' + #13#10 +
      'Label2.Caption=份数' + #13#10 +
      'GroupBox2.Caption= 打印机初始化设置 ' + #13#10 +
      'Label1.Caption=打印机类型' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=打印机初始化样版 (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=打印机初始化样版 (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=导出到 RTF' + #13#10 +
      'OkB.Caption=确定' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'GroupPageRange.Caption= 页数范围 ' + #13#10 +
      'AllRB.Caption=全部' + #13#10 +
      'CurPageRB.Caption=本页' + #13#10 +
      'PageNumbersRB.Caption=页:' + #13#10 +
      'DescrL.Caption=输入页数/文件范围，并以逗号分隔(例如:1,3,5-12)' + #13#10 +
      'GroupQuality.Caption= 导出设置 ' + #13#10 +
      'PicturesCB.Caption=图像' + #13#10 +
      'PageBreaksCB.Caption=分页' + #13#10 +
      'WCB.Caption=所见即所得' + #13#10 +
      'OpenCB.Caption=在导出后打开' + #13#10 +
      'SaveDialog1.Filter=RTF 文件 (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=导出设置' + #13#10 +
      'OK.Caption=确定' + #13#10 +
      'Cancel.Caption=取消' + #13#10 +
      'GroupPageRange.Caption= 页数范围  ' + #13#10 +
      'AllRB.Caption=全部' + #13#10 +
      'CurPageRB.Caption=本页' + #13#10 +
      'PageNumbersRB.Caption=页:' + #13#10 +
      'DescrL.Caption=输入页数/文件范围，并以逗号分隔(例如:1,3,5-12)' + #13#10 +
      'GroupBox1.Caption= 图像设置 ' + #13#10 +
      'Label2.Caption=JPEG 品质' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=剪去页面空白部份' + #13#10 +
      'Mono.Caption=黑白' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=导出到 PDF' + #13#10 +
      'OkB.Caption=确定' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'GroupPageRange.Caption= 页数范围 ' + #13#10 +
      'AllRB.Caption=全部' + #13#10 +
      'CurPageRB.Caption=本页' + #13#10 +
      'PageNumbersRB.Caption=页:' + #13#10 +
      'DescrL.Caption=输入页数/文件范围，并以逗号分隔(例如:1,3,5-12)' + #13#10 +
      'GroupQuality.Caption= 导出设置 ' + #13#10 +
      'CompressedCB.Caption=压缩' + #13#10 +
      'EmbeddedCB.Caption=嵌入字体' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenCB.Caption=在导出后打开' + #13#10 +
      'SaveDialog1.Filter=Adobe PDF 文件 (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'RTF 文件');
    Add('BMPexport', 'BMP 图');
    Add('JPEGexport', 'JPEG 图');
    Add('TIFFexport', 'TIFF 图');
    Add('TextExport', '纯文本 (点阵打印机)');
    Add('XlsOLEexport', 'Excel 表格 (OLE)');
    Add('HTMLexport', 'HTML 文件');
    Add('XlsXMLexport', 'Excel 表格 (XML)');
    Add('PDFexport', 'PDF 文件');

    Add('ProgressWait', '请稍候');
    Add('ProgressRows', '正在建立列');
    Add('ProgressColumns', '正在建立栏');
    Add('ProgressStyles', '正在建立样式');
    Add('ProgressObjects', '正在导出对象中');


    Add('TIFFexportFilter', 'Tiff 图 (*.tif)|*.tif');
    Add('BMPexportFilter', 'BMP 图 (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Jpeg 图 (*.jpg)|*.jpg');

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
