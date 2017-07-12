
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
      'Caption=匯出到 Excel' + #13#10 +
      'OkB.Caption=確定' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'GroupPageRange.Caption= 頁數範圍 ' + #13#10 +
      'AllRB.Caption=全部' + #13#10 +
      'CurPageRB.Caption=本頁' + #13#10 +
      'PageNumbersRB.Caption=頁:' + #13#10 +
      'DescrL.Caption=輸入頁數/文件範圍，並以逗號分隔(例如:1,3,5-12)' + #13#10 +
      'GroupQuality.Caption= 匯出設定 ' + #13#10 +
      'StylesCB.Caption=樣式' + #13#10 +
      'PicturesCB.Caption=圖像' + #13#10 +
      'MergeCB.Caption=合併儲存格' + #13#10 +
      'PageBreaksCB.Caption=分頁' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'WCB.Caption=所視即所得' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=在匯出後開啟 Excel' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=Excel 檔 (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=匯出到 Excel' + #13#10 +
      'OkB.Caption=確定' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'GroupPageRange.Caption= 頁數範圍 ' + #13#10 +
      'AllRB.Caption=全部' + #13#10 +
      'CurPageRB.Caption=本頁' + #13#10 +
      'PageNumbersRB.Caption=頁:' + #13#10 +
      'DescrL.Caption=輸入頁數/文件範圍，並以逗號分隔(例如:1,3,5-12)' + #13#10 +
      'GroupQuality.Caption= 匯出設定 ' + #13#10 +
      'StylesCB.Caption=樣式' + #13#10 +
      'PageBreaksCB.Caption=分頁' + #13#10 +
      'WCB.Caption=所視即所得' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=在匯出後開啟 Excel' + #13#10 +
      'SaveDialog1.Filter=XML Excel 檔 (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=匯出到 HTML table' + #13#10 +
      'OkB.Caption=確定' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'GroupPageRange.Caption= 頁數範圍 ' + #13#10 +
      'AllRB.Caption=全部' + #13#10 +
      'CurPageRB.Caption=本頁' + #13#10 +
      'PageNumbersRB.Caption=頁:' + #13#10 +
      'DescrL.Caption=輸入頁數/文件範圍，並以逗號分隔(例如:1,3,5-12)' + #13#10 +
      'GroupQuality.Caption= 匯出設定 ' + #13#10 +
      'OpenAfterCB.Caption=在匯出後開啟' + #13#10 +
      'StylesCB.Caption=樣式' + #13#10 +
      'PicturesCB.Caption=圖像' + #13#10 +
      'PicsSameCB.Caption=全部在一資料夾' + #13#10 +
      'FixWidthCB.Caption=固定寬度' + #13#10 +
      'NavigatorCB.Caption=頁面導覽' + #13#10 +
      'MultipageCB.Caption=多頁' + #13#10 +
      'MozillaCB.Caption=Mozilla 瀏覽器' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=HTML 檔 (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=匯出到純文字 (點陣式印表機)' + #13#10 +
      'OK.Caption=確定' + #13#10 +
      'Cancel.Caption=取消' + #13#10 +
      'BtnPreview.Hint=預覽 啟用/停用' + #13#10 +
      'GroupCellProp.Caption= 匯出屬性  ' + #13#10 +
      'CB_PageBreaks.Caption=分頁' + #13#10 +
      'CB_OEM.Caption=OEM 頁碼' + #13#10 +
      'CB_EmptyLines.Caption=空白行' + #13#10 +
      'CB_LeadSpaces.Caption=前置空白' + #13#10 +
      'GroupPageRange.Caption= 頁數範圍  ' + #13#10 +
      'Pages.Caption=頁數' + #13#10 +
      'Descr.Caption=輸入頁數/文件範圍，並以逗號分隔(例如:1,3,5-12)' + #13#10 +
      'GroupScaleSettings.Caption= 比率 ' + #13#10 +
      'ScX.Caption=X 比率' + #13#10 +
      'ScY.Caption=Y 比率' + #13#10 +
      'GroupFramesSettings.Caption= 外框 ' + #13#10 +
      'RB_NoneFrames.Caption=無' + #13#10 +
      'RB_Simple.Caption=簡單' + #13#10 +
      'RB_Graph.Caption=圖像' + #13#10 +
      'RB_Graph.Hint=Only with OEM codepage' + #13#10 +
      'CB_PrintAfter.Caption=在匯出後開啟' + #13#10 +
      'CB_Save.Caption=儲存設定' + #13#10 +
      'GroupBox1.Caption= 預覽 ' + #13#10 +
      'Label1.Caption=寬度:' + #13#10 +
      'Label3.Caption=高度:' + #13#10 +
      'LBPage.Caption=頁' + #13#10 +
      'ToolButton1.Hint=放大' + #13#10 +
      'ToolButton2.Hint=縮小' + #13#10 +
      'SaveDialog1.Filter=文字檔 (點陣式印表機)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=列印' + #13#10 +
      'OK.Caption=確定' + #13#10 +
      'Cancel.Caption=取消' + #13#10 +
      'GroupBox1.Caption=印表機' + #13#10 +
      'Label4.Caption=Name' + #13#10 +
      'PropButton.Caption=設定...' + #13#10 +
      'GroupBox3.Caption=份數' + #13#10 +
      'Label2.Caption=份數' + #13#10 +
      'GroupBox2.Caption= 印表機初始化設定 ' + #13#10 +
      'Label1.Caption=印表機型態' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=印表機初始化樣版 (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=印表機初始化樣版 (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=匯出到 RTF' + #13#10 +
      'OkB.Caption=確定' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'GroupPageRange.Caption= 頁數範圍 ' + #13#10 +
      'AllRB.Caption=全部' + #13#10 +
      'CurPageRB.Caption=本頁' + #13#10 +
      'PageNumbersRB.Caption=頁:' + #13#10 +
      'DescrL.Caption=輸入頁數/文件範圍，並以逗號分隔(例如:1,3,5-12)' + #13#10 +
      'GroupQuality.Caption= 匯出設定 ' + #13#10 +
      'PicturesCB.Caption=圖像' + #13#10 +
      'PageBreaksCB.Caption=分頁' + #13#10 +
      'WCB.Caption=所視即所得' + #13#10 +
      'OpenCB.Caption=在匯出後開啟' + #13#10 +
      'SaveDialog1.Filter=RTF 檔 (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=匯出設定' + #13#10 +
      'OK.Caption=確定' + #13#10 +
      'Cancel.Caption=取消' + #13#10 +
      'GroupPageRange.Caption= 頁數範圍  ' + #13#10 +
      'AllRB.Caption=全部' + #13#10 +
      'CurPageRB.Caption=本頁' + #13#10 +
      'PageNumbersRB.Caption=頁:' + #13#10 +
      'DescrL.Caption=輸入頁數/文件範圍，並以逗號分隔(例如:1,3,5-12)' + #13#10 +
      'GroupBox1.Caption= 圖像設定 ' + #13#10 +
      'Label2.Caption=JPEG 品質' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=剪去頁面空白部份' + #13#10 +
      'Mono.Caption=黑白' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=匯出到 PDF' + #13#10 +
      'OkB.Caption=確定' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'GroupPageRange.Caption= 頁數範圍 ' + #13#10 +
      'AllRB.Caption=全部' + #13#10 +
      'CurPageRB.Caption=本頁' + #13#10 +
      'PageNumbersRB.Caption=頁:' + #13#10 +
      'DescrL.Caption=輸入頁數/文件範圍，並以逗號分隔(例如:1,3,5-12)' + #13#10 +
      'GroupQuality.Caption= 匯出設定 ' + #13#10 +
      'CompressedCB.Caption=壓縮' + #13#10 +
      'EmbeddedCB.Caption=嵌進字型' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'OpenCB.Caption=在匯出後開啟' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=Adobe PDF 檔 (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'RTF 檔');
    Add('BMPexport', 'BMP 圖');
    Add('JPEGexport', 'JPEG 圖');
    Add('TIFFexport', 'TIFF 圖');
    Add('TextExport', '純文字 (點陣印表機)');
    Add('XlsOLEexport', 'Excel 表格 (OLE)');
    Add('HTMLexport', 'HTML 檔');
    Add('XlsXMLexport', 'Excel 表格 (XML)');
    Add('PDFexport', 'PDF 檔');

    Add('ProgressWait', '請稍候');
    Add('ProgressRows', '正在建立列');
    Add('ProgressColumns', '正在建立欄');
    Add('ProgressStyles', '正在建立樣式');
    Add('ProgressObjects', '正在匯出物件中');


    Add('TIFFexportFilter', 'Tiff 圖 (*.tif)|*.tif');
    Add('BMPexportFilter', 'BMP 圖 (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Jpeg 圖 (*.jpg)|*.jpg');

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
