
{******************************************}
{                                          }
{             FastReport v3.0              }
{         Language resource file           }
{                                          }
{         Copyright (c) 1998-2005          }
{         by Alexander Tzyganenko,         }
{            Fast Reports Inc.             }
{                                          }
{******************************************}
{******************************************
  Translate by ChenFeng For Chinese res file at 2004-12-03 23:09PM
  Email:soareay@hotmail.com
  Good Luck!
******************************************}

unit frxrcClass;

interface

procedure frAddClassesRes;


implementation

uses frxRes;


procedure frAddClassesRes;
begin
  with frxResources do
  begin
    Add('TfrxPreviewForm',
      'Caption=预览' + #13#10 +
      'PrintB.Caption=打印' + #13#10 +
      'PrintB.Hint=打印' + #13#10 +
      'OpenB.Caption=打开' + #13#10 +
      'OpenB.Hint=打开' + #13#10 +
      'SaveB.Caption=保存' + #13#10 +
      'SaveB.Hint=保存' + #13#10 +
      'ExportB.Caption=导出' + #13#10 +
      'ExportB.Hint=导出' + #13#10 +
      'FindB.Caption=寻找' + #13#10 +
      'FindB.Hint=寻找' + #13#10 +
      'ZoomWholePageB.Caption=整页' + #13#10 +
      'ZoomWholePageB.Hint=整页' + #13#10 +
      'ZoomPageWidthB.Caption=页宽' + #13#10 +
      'ZoomPageWidthB.Hint=页宽' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=两页' + #13#10 +
      'Zoom50B.Hint=两页' + #13#10 +
      'ZoomCB.Hint=显示比例' + #13#10 +
      'PageSettingsB.Caption=页面设置' + #13#10 +
      'PageSettingsB.Hint=页面设置' + #13#10 +
      'OutlineB.Caption=纲要' + #13#10 +
      'OutlineB.Hint=纲要' + #13#10 +
      'HandToolB.Caption=拖动' + #13#10 +
      'HandToolB.Hint=拖动' + #13#10 +
      'ZoomToolB.Caption=缩放' + #13#10 +
      'ZoomToolB.Hint=缩放' + #13#10 +
      'NewPageB.Caption=新增页' + #13#10 +
      'NewPageB.Hint=新增页' + #13#10 +
      'DelPageB.Caption=删除页' + #13#10 +
      'DelPageB.Hint=删除页' + #13#10 +
      'DesignerB.Caption=编辑页' + #13#10 +
      'DesignerB.Hint=编辑页' + #13#10 +
      'FirstB.Caption=首页' + #13#10 +
      'FirstB.Hint=首页' + #13#10 +
      'PriorB.Caption=前页' + #13#10 +
      'PriorB.Hint=前页' + #13#10 +
      'NextB.Caption=次页' + #13#10 +
      'NextB.Hint=次页' + #13#10 +
      'LastB.Caption=末页' + #13#10 +
      'LastB.Hint=末页' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'PageE.Hint=页数' + #13#10 +
      '');
    Add('zmPageWidth', '页宽');
    Add('zmWholePage', '整页');

    Add('TfrxPrintDialog',
      'Caption=打印' + #13#10 +
      'Label12.Caption=打印机   ' + #13#10 +
      'DescrL.Caption=输入页数/文件范围，以逗号分隔(例如:1,3,5-12)' + #13#10 +
      'Label1.Caption=页 ' + #13#10 +
      'CopiesL.Caption=份数' + #13#10 +
      'CollateL.Caption=自动分页(&T)' + #13#10 +
      'Label2.Caption=份数(&C)   ' + #13#10 +
      'PrintL.Caption=打印' + #13#10 +
      'TypeL.Caption=类型:' + #13#10 +
      'WhereL.Caption=位置:' + #13#10 +
      'OkB.Caption=确定' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'PropButton.Caption=属性(&P)' + #13#10 +
      'AllRB.Caption=全部(&A)' + #13#10 +
      'CurPageRB.Caption=本页(&E)' + #13#10 +
      'PageNumbersRB.Caption=页数(&G):' + #13#10 +
      'FileCB.Caption=输出至文件(&L)' + #13#10 +
      'ReverseCB.Caption=逆页序打印(&V)' + #13#10 +
      '');
    Add('ppAll', '范围中所有页面');
    Add('ppOdd', '奇数页');
    Add('ppEven', '偶数页');

    Add('TfrxSearchDialog',
      'Caption=寻找文本' + #13#10 +
      'TextL.Caption=寻找目标:' + #13#10 +
      'SearchL.Caption=选项   ' + #13#10 +
      'TopCB.Caption=起点' + #13#10 +
      'CaseCB.Caption=区分大小写' + #13#10 +
      'OkB.Caption=确定' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=页面设置' + #13#10 +
      'WidthL.Caption=宽度' + #13#10 +
      'HeightL.Caption=高度' + #13#10 +
      'SizeL.Caption=纸张大小   ' + #13#10 +
      'OrientationL.Caption=打印方向   ' + #13#10 +
      'LeftL.Caption=左' + #13#10 +
      'TopL.Caption=上' + #13#10 +
      'RightL.Caption=右' + #13#10 +
      'BottomL.Caption=下' + #13#10 +
      'MarginsL.Caption=边距   ' + #13#10 +
      'PortraitRB.Caption=纵向' + #13#10 +
      'LandscapeRB.Caption=横向' + #13#10 +
      'cmL1.Caption=cm' + #13#10 +
      'cmL2.Caption=cm' + #13#10 +
      'cmL3.Caption=cm' + #13#10 +
      'cmL4.Caption=cm' + #13#10 +
      'cmL5.Caption=cm' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=确定' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'OtherL.Caption=其它   ' + #13#10 +
      'ApplyToCurRB.Caption=套用本页' + #13#10 +
      'ApplyToAllRB.Caption=套用全部页面' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=打印t' + #13#10 +
      'PrinterL.Caption=打印机   ' + #13#10 +
      'PagesL.Caption=页   ' + #13#10 +
      'CopiesL.Caption=份数   ' + #13#10 +
      'CopiesNL.Caption=份数' + #13#10 +
      'DescrL.Caption=输入页数/文件范围，以逗号分隔(例如:1,3,5-12)' + #13#10 +
      'OptionsL.Caption=选项   ' + #13#10 +
      'EscL.Caption=Escape 指令   ' + #13#10 +
      'OK.Caption=确认' + #13#10 +
      'Cancel.Caption=取消' + #13#10 +
      'SaveToFileCB.Caption=打印至文件' + #13#10 +
      'AllRB.Caption=全部' + #13#10 +
      'CurPageRB.Caption=本页' + #13#10 +
      'PageNumbersRB.Caption=页数:' + #13#10 +
      'PageBreaksCB.Caption=分页' + #13#10 +
      'OemCB.Caption=OEM 页码' + #13#10 +
      'PseudoCB.Caption=扩充的图形字元' + #13#10 +
      'SaveDialog1.Filter=打印机文件 (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=取消' + #13#10 +
      '');

    Add('mbConfirm', '确认');
    Add('mbError', '错误');
    Add('mbInfo', '资讯');
    Add('xrCantFindClass', '不明的类别');
    Add('prVirtual', '虚拟');
    Add('prDefault', '预设');
    Add('prCustom', '自定');
    Add('enUnconnHeader', '未连接至表首');
    Add('enUnconnGroup', '群组未连接至数据库');
    Add('enUnconnGFooter', '没有群组表尾er for');
    Add('enBandPos', 'Band的位置错误:');
    Add('dbNotConn', '数据库 %s 未连接至数据库');
    Add('dbFldNotFound', '字段不存在:');
    Add('clDSNotIncl', '(数据库未加入至 Report.DataSets)');
    Add('clUnknownVar', '未知的变量或数据库字段:');
    Add('clScrError', 'Script 错误在 %s: %s');
    Add('clDSNotExist', '数据库 "%s" 不存在');
    Add('clErrors', '发生下列的错误:');
    Add('clExprError', '运算式错误');
    Add('clFP3files', '报表文件');
    Add('clSaving', '保存文件...');
    Add('clCancel', '取消');
    Add('clClose', '关闭(&X)');
    Add('clPrinting', '打印页');
    Add('clLoading', '载入文件...');
    Add('clPageOf', '页 %d / %d');
    Add('clFirstPass', '第一次处理过程: 页 ');
    Add('clNoPrinters', '在你的系统没有安装打印机');
    Add('clDecompressError', 'Stream 解压缩发生错误');

    Add('prRunningFirst', 'First pass: page %d');
    Add('prRunning', 'Preparing page %d');
    Add('prPrinting', 'Printing page %d');
    Add('prExporting', 'Exporting page %d');
    Add('uCm', 'cm');
    Add('uInch', 'in');
    Add('uPix', 'px');
    Add('uChar', 'chr');
  end;
end;


initialization
  frAddClassesRes;

end.
