
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

unit frxrcInsp;

interface

procedure frAddInspectorRes;


implementation

uses frxRes;


procedure frAddInspectorRes;
begin
  with frxResources do
  begin
    Add('propActive', '设置是否打开数据库(DataSet)。');
    Add('propActive.TfrxHighlight', '是否启动 highlight 功能。');
    Add('propAliasName', 'BDE 别名(alias)。');
    Add('propAlign', '决定对象与Band或page切齐。');
    Add('propAlignment', '对象文本的切齐方式。');
    Add('propAllowAllUp', '同群组的的快速按钮是否可同时取消选取。');
    Add('propAllowEdit', '使用者是否可以编辑预览中的报表。');
    Add('propAllowExpressions', '决定文本对象是否可以包括运算式。');
    Add('propAllowGrayed', '允许CheckBox呈现灰色的状态。');
    Add('propAllowHTMLTags', '决定文本对象的内容是否可使用 HTML 标签。');
    Add('propAllowSplit', '决定页面的内容是否可跨页打印。');
    Add('propAuthor', '报表作者。');
    Add('propAutoSize', '决定是否自动调整图像的大小。');
    Add('propAutoWidth', '决定是否自动调整文本的宽度。');
    Add('propBackPicture', '报表页面的背景图。');
    Add('propBarType', '条码的类型。');
    Add('propBevelInner', 'bevel内部的类型。');
    Add('propBevelOuter', 'bevel外部的类型。');
    Add('propBevelWidth', 'bevel的宽度。');
    Add('propBorder', '决定是否显示外框。');
    Add('propBorderStyle', '视窗的样式。');
    Add('propBottomMargin', '页面下方的边距。');
    Add('propBrushStyle', '对象背景的画笔样式。');
    Add('propButtons', '设置预览视窗显示的按钮。');
    Add('propCacheSize', '限制报表引擎使用快取记忆体的大小，假如使用的记忆体超出设置值，报表将自动写入硬碟快取文件。');
    Add('propCalcCheckSum', '自动计算条码的检查码。');
    Add('propCancel', '决定当按下Esc键时，此按钮恢  动作。');
    Add('propCaption', '控制项的标题。');
    Add('propCellFields', '交叉报表数据库字段名称。');
    Add('propCellLevels', '交叉报表的阶层数。');
    Add('propCenter', '影像居中。');
    Add('propCharset', '字元集。');
    Add('propCharSpacing', '两个字元间的间距，以像素(Pixels)表示。。');
    Add('propCheckColor', 'CheckBox勾选状态的颜色。');
    Add('propChecked', '控制项的勾选状态。');
    Add('propCheckStyle', 'CheckBox勾选的样式。');
    Add('propChild', '连接至此band的Child Band名称。');
    Add('propCollate', '预设的输出顺序设置');
    Add('propColor.TFont', '文本的颜色。');
    Add('propColor', '对象的颜色。');
    Add('propColor.TfrxFrame', '框架(Frame)的颜色');
    Add('propColor.TfrxHighlight', '假如 highlight 属性动作时，决定对象显示的颜色。');
    Add('propColumnFields', '交叉报表的字段名称。');
    Add('propColumnGap', '栏间距');
    Add('propColumnLevels', '栏的阶层数。');
    Add('propColumns', '栏的个数。');
    Add('propColumnWidth', 'Band的column宽度。');
    Add('propCondition', '群组条件，假如此运算式的值改变，群组自动改变。');
    Add('propCondition.TfrxHighlight', '运算式字串。假如运算式为真(True)，醒目的显示上将会启动。');
    Add('propConnected', '设置是否连接数据库。');
    Add('propConvertNulls', '是否自动将Null转成 0, False 或 空字串。');
    Add('propCopies', '预设报表打印份数。');
    Add('propCursor', '对象的游标。');
    Add('propDatabaseName', '数据库名称。');
    Add('propDataField', '抓取数据库的字段名称。');
    Add('propDataSet', '连结至数据库。');
    Add('propDate', '控制项的日期值。');
    Add('propDateFormat', '日期输出格式。');
    Add('propDecimalSeparator', '小数点的分隔字元。');
    Add('propDefault', '决定此按钮是否为预设按钮。');
    Add('propDefHeight', '预设列高。');
    Add('propDescription', '报表用途描述');
    Add('propDiagonal', '将线条指定为斜线。');
    Add('propDisplayFormat', '数据显示格式。');
    Add('propDoubleBuffered', '决定预览视窗是否使用双缓冲区。使用双缓冲区可防止萤幕出现闪动的情形，但是会降低执行速度。');
    Add('propDoublePass', '决定报表引擎是否执行二次处理。');
    Add('propDown', '决定按钮是否已被按下。');
    Add('propDownThenAcross', '指定多栏式报表采由上而下，由左至右打印。');
    Add('propDriverName', 'BDE驱动程序名称。');
    Add('propDropShadow', '决定对象是否有阴影。');
    Add('propDuplex', '双面打印模式。');
    Add('propEditMask', '输入编辑遮罩。');
    Add('propEnabled', '决定控制项是否可动作。');
    Add('propEngineOptions', '报表引擎的选项。');
    Add('propExpression', '对象的运算式。');
    Add('propExpressionDelimiters', '运算式的分隔字元。');
    Add('propFieldAliases', '数据库字段的别名。');
    Add('propFilter', '数据库的过滤条件。');
    Add('propFiltered', '决定 Filter 过滤条件是否启动。');
    Add('propFlowTo', '文本对象无法容纳时，显示至其他对象。');
    Add('propFont', '对象的字体属性。');
    Add('propFooterAfterEach', '决定是否在每个数据列之后，跟著打印 footer band。');
    Add('propFormatStr', '输出格式编辑字串。');
    Add('propFrame', '对象的框架属性。');
    Add('propGapX', '文本与左边切齐。');
    Add('propGapY', '文本与上面切齐。');
    Add('propGlyph', '控制项的影像。');
    Add('propGroupIndex', '允许快速按钮设为同一群组。');
    Add('propHAlign', '文本水平切齐方式。');
    Add('propHeight', '对象的高度。');
    Add('propHGuides', '设计报表页面的水平导引线。');
    Add('propHideZeros', '数字前面的 0 不显示。');
    Add('propHighlight', 'highlight属性的条件。');
    Add('propIndexName', '索引名称。');
    Add('propInitString', '供点矩阵报表使用的打印机初始字串。');
    Add('propItems', '对象的清单项目');
    Add('propKeepAspectRatio', '保留影像的显示比率');
    Add('propKeepChild', '决定Band是否与Child打印在一起');
    Add('propKeepFooter', '是否与footer打印在一起');
    Add('propKeepTogether', '决定band与subband一起打印');
    Add('propKind.TfrxFormat', '格式种类');
    Add('propKind', '按钮类型');
    Add('propLargeDesignHeight', '设计报表页面的最大高度');
    Add('propLayout', '按钮图形的格式');
    Add('propLeft', '对象的左边座标');
    Add('propLeftMargin', '左边距的大小');
    Add('propLines', '对象的文本');
    Add('propLineSpacing', '列距');
    Add('propLoginPrompt', '显示登入视窗');
    Add('propMargin', '按钮图形与边距的距离(像素)');
    Add('propMaster', '主数据库');
    Add('propMasterFields', '主数据与明细数据关联的字段');
    Add('propMaximized', '预览视窗最大化');
    Add('propMaxLength', '文本的最大长度');
    Add('propMaxPages', '预览报表最大的页数');
    Add('propMaxWidth', '最大栏宽');
    Add('propMDIChild', '决定预览视窗是否为MDI子视窗');
    Add('propMemo', '对象的文本');
    Add('propMinWidth', '栏的最小宽度');
    Add('propMirrorMargins', '镜射页面边距至偶数页');
    Add('propModal', '预览视窗是否以Modal方式显示');
    Add('propModalResult', 'Modal视窗关闭时传回的值');
    Add('propName.TFont', '字体名称');
    Add('propName.TfrxReportOptions', '报表名称');
    Add('propName', '对象名称');
    Add('propNumGlyphs', 'Glyph属性内图形的数目');
    Add('propOpenDataSource', '决定是否自动打开数据来源');
    Add('propOrientation', '报表页面的方向');
    Add('propOutlineText', '显示在报表大纲对象的文本');
    Add('propOutlineVisible', '显示预览大纲');
    Add('propOutlineWidth', '报表大纲的宽度');
    Add('propPageNumbers.TfrxPrintOptions', '打印的页数');
    Add('propPaperHeight', '页的高度');
    Add('propPaperWidth', '页的宽度');
    Add('propParagraphGap', '段落首行内缩');
    Add('propParams.TfrxBDEDatabase', 'BDE数据库连接参数');
    Add('propParams', '查询的参数');
    Add('propParentFont', '决定对象是否显示上层对象的字体设置');
    Add('propPassword', '报表密码');
    Add('propPasswordChar', '密码字段输入时显示的字元');
    Add('propPicture', '图像');
    Add('propPicture.TfrxReportOptions', '报表图像');
    Add('propPosition', '视窗的初始位置');
    Add('propPreviewOptions', '报表预览选项');
    Add('propPrintable', '对象是否可打印');
    Add('propPrintChildIfInvisible', '假如parent band不打印，决定child band是否打印');
    Add('propPrinter', '报表预设的打印机名称');
    Add('propPrintIfDetailEmpty', '假如subnband是空的，决定是否打印');
    Add('propPrintIfEmpty', '假如报表数据库是空的，决定是否继续打印');
    Add('propPrintOnFirstPage', '决定Band是否打印在首页');
    Add('propPrintOnLastPage', '决定Band是否打印在末页');
    Add('propPrintOnParent', '决定子报表是否打印在上层肯  nd');
    Add('propPrintOnPreviousPage', '决定本页是否可打印在上页的剩余空间');
    Add('propPrintOptions', '报表打印选项。');
    Add('propPrintPages', '决定打印全部的报表、奇数页或偶数页。');
    Add('propRangeBegin', '打印数据库的起点。');
    Add('propRangeEnd', '打印数据库的终点。');
    Add('propRangeEndCount', '决定打印笔数。');
    Add('propReadOnly', '决定文本对象是否唯读。');
    Add('propRepeatHeaders', '决定页首是否打印在每个新的页面。');
    Add('propReportOptions', '报表选项。');
    Add('propReprintOnNewPage', '决定是否重新打印在下一页');
    Add('propRestrictions', '报表限制旗标。');
    Add('propRightMargin', '右边距。');
    Add('propRotation.TfrxBarCodeView', '条码方向');
    Add('propRotation', '旋转文本');
    Add('propRowCount', 'Databand的虚拟数据笔数。');
    Add('propRowFields', '交叉报表列的数据库字段名称');
    Add('propRowLevels', '列阶层的数目');
    Add('propRTLReading', '决定文本对象是否由右至左显示');
    Add('propScriptLanguage', '报表内部使用的脚本语言名称。');
    Add('propSessionName', 'BDE 连线名称。');
    Add('propShadowColor', '阴影的颜色。');
    Add('propShadowWidth', '阴影的宽度。');
    Add('propShape', '外型的样式');
    Add('propShiftMode', '对象变动的行为');
    Add('propShowCaptions', '决定是否显示预览按钮的文本说明');
    Add('propShowColumnHeader', '决定交叉报表是否显示字段表头');
    Add('propShowColumnTotal', '决定交叉报表是否显示字段总计');
    Add('propShowRowHeader', '决定交叉报表是否显示列的表头');
    Add('propShowRowTotal', '决定交叉报表是否显示列的总计');
    Add('propShowDialog', '决定打印对话框是否出现在预览视窗');
    Add('propShowText', '决定条码对象是否显示文本说明');
    Add('propSize', '字体大小。');
    Add('propSorted', '项目是否要排序。');
    Add('propSpacing', '文本与影像间的像素(Pixels)间距。');
    Add('propSQL', 'SQL叙述');
    Add('propStartNewPage', '在打印Band之前，先执行跳页动作。');
    Add('propStretch', '调整图像至对象的大小。');
    Add('propStretched', '决定对象可以伸缩。');
    Add('propStretchMode', '对象伸缩的行为。');
    Add('propStyle.TFont', '字体样式。');
    Add('propStyle', '控制项样式。');
    Add('propStyle.TfrxFrame', '对象的框架样式。');
    Add('propSuppressRepeated', '删除重复的值(重复的值不打印)。');
    Add('propTableName', '数据表名称。');
    Add('propTag', '对象的数字标签');
    Add('propTagStr', '对象的字串标签。');
    Add('propText', '对象的文本。');
    Add('propTitleBeforeHeader', '决定是否在页首前显示报表抬头。');
    Add('propTop', '对象上方的座标。');
    Add('propTopMargin', '页面与纸张上缘的边距。');
    Add('propTyp', '框架的类型。');
    Add('propUnderlines', '决定文本对象再每一列之后显示底线。');
    Add('propURL', '对象连结的 URL 位址。');
    Add('propUserName', '数据对象的使用者名称，此名称将显示于数据树状结构。');
    Add('propVAlign', '文本垂直切齐方式。');
    Add('propVersionBuild', '版本编号');
    Add('propVersionMajor', '版本编号, 主版本编号。');
    Add('propVersionMinor', '版本编号，次版本编号。');
    Add('propVersionRelease', '版本发行信息。');
    Add('propVGuides', '页面的垂直导引线。');
    Add('propVisible', '对象可见。');
    Add('propWidth', '对象宽度。');
    Add('propWidth.TfrxFrame', '框架宽度。');
    Add('propWindowState', '视窗初始状态。');
    Add('propWordBreak', '断字');
    Add('propWordWrap', '文本是否自动换行。');
    Add('propZoom.TfrxBarCodeView', '条码显示比例');
    Add('propZoom', '预览视窗初始的显示比例。');
    Add('propZoomMode', '预览视窗的显示模式。');
  end;
end;


initialization
  frAddInspectorRes;

end.
