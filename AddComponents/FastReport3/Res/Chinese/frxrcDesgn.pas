
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
unit frxrcDesgn;

interface

procedure frAddDesignerRes;


implementation

uses frxRes;


procedure frAddDesignerRes;
begin
  with frxResources do
  begin
    Add('TfrxObjectInspector',
      'Caption=对象查看器' + #13#10 +
      '');
    Add('oiProp', '属性');
    Add('oiEvent', '事件');

    Add('TfrxDataTreeForm',
      'Caption=数据树' + #13#10 +
      'DataTS.Caption=数据' + #13#10 +
      'VariablesTS.Caption=变量' + #13#10 +
      'FunctionsTS.Caption=函数' + #13#10 +
      'InsFieldCB.Caption=建立字段' + #13#10 +
      'InsCaptionCB.Caption=建立标题' + #13#10 +
      '');
    Add('dtNoData', '没有数据库可以使用');
    Add('dtData', '数据');
    Add('dtSysVar', '系统变量');
    Add('dtVar', '变量');
    Add('dtFunc', '函数');

    Add('TfrxReportTreeForm',
      'Caption=报表树' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=打开脚本' + #13#10 +
      'SaveScriptB.Hint=保存脚本' + #13#10 +
      'RunScriptB.Hint=执行脚本' + #13#10 +
      'StepScriptB.Hint=追踪至' + #13#10 +
      'StopScriptB.Hint=结束脚本' + #13#10 +
      'EvaluateB.Hint=求值' + #13#10 +
      'LangL.Caption=语言:' + #13#10 +
      'AlignTB.Caption=对齐' + #13#10 +
      'AlignLeftsB.Hint=齐左' + #13#10 +
      'AlignHorzCentersB.Hint=水平居中' + #13#10 +
      'AlignRightsB.Hint=齐右' + #13#10 +
      'AlignTopsB.Hint=齐上' + #13#10 +
      'AlignVertCentersB.Hint=垂直居中' + #13#10 +
      'AlignBottomsB.Hint=齐底' + #13#10 +
      'SpaceHorzB.Hint=水平空间' + #13#10 +
      'SpaceVertB.Hint=垂直空间' + #13#10 +
      'CenterHorzB.Hint=水平居中' + #13#10 +
      'CenterVertB.Hint=垂直居中' + #13#10 +
      'SameWidthB.Hint=相同宽度' + #13#10 +
      'SameHeightB.Hint=相同高度' + #13#10 +
      'TextTB.Caption=文本' + #13#10 +
      'StyleCB.Hint=样式' + #13#10 +
      'FontNameCB.Hint=字体名称' + #13#10 +
      'FontSizeCB.Hint=字体大小' + #13#10 +
      'BoldB.Hint=粗体' + #13#10 +
      'ItalicB.Hint=斜体' + #13#10 +
      'UnderlineB.Hint=底线' + #13#10 +
      'FontColorB.Hint=字体颜色' + #13#10 +
      'HighlightB.Hint=强调' + #13#10 +
      'RotateB.Hint=文本方向' + #13#10 +
      'TextAlignLeftB.Hint=左对齐' + #13#10 +
      'TextAlignCenterB.Hint=居中' + #13#10 +
      'TextAlignRightB.Hint=右对齐' + #13#10 +
      'TextAlignBlockB.Hint=左对齐' + #13#10 +
      'TextAlignTopB.Hint=上面切齐' + #13#10 +
      'TextAlignMiddleB.Hint=垂直居中' + #13#10 +
      'TextAlignBottomB.Hint=底部切齐' + #13#10 +
      'FrameTB.Caption=外框' + #13#10 +
      'FrameTopB.Hint=上方线' + #13#10 +
      'FrameBottomB.Hint=下方线' + #13#10 +
      'FrameLeftB.Hint=左边线' + #13#10 +
      'FrameRightB.Hint=右边线' + #13#10 +
      'FrameAllB.Hint=框线' + #13#10 +
      'FrameNoB.Hint=没有边框' + #13#10 +
      'ShadowB.Hint=阴影' + #13#10 +
      'FillColorB.Hint=背景颜色' + #13#10 +
      'FrameColorB.Hint=外框颜色' + #13#10 +
      'FrameStyleB.Hint=外框样式' + #13#10 +
      'FrameWidthCB.Hint=外框宽度' + #13#10 +
      'StandardTB.Caption=标准' + #13#10 +
      'NewB.Hint=新报表' + #13#10 +
      'OpenB.Hint=打开报表' + #13#10 +
      'SaveB.Hint=保存报表' + #13#10 +
      'PreviewB.Hint=预览' + #13#10 +
      'NewPageB.Hint=新报表页面' + #13#10 +
      'NewDialogB.Hint=新对话框' + #13#10 +
      'DeletePageB.Hint=删除页' + #13#10 +
      'PageSettingsB.Hint=页面设置' + #13#10 +
      'VariablesB.Hint=变量' + #13#10 +
      'CutB.Hint=剪切' + #13#10 +
      'CopyB.Hint=复制' + #13#10 +
      'PasteB.Hint=粘贴' + #13#10 +
      'SampleFormatB.Hint=复制格式' + #13#10 +
      'UndoB.Hint=撤消' + #13#10 +
      'RedoB.Hint=重复' + #13#10 +
      'GroupB.Hint=群组' + #13#10 +
      'UngroupB.Hint=取消群组' + #13#10 +
      'ShowGridB.Hint=显示珊格' + #13#10 +
      'AlignToGridB.Hint=珊格对齐' + #13#10 +
      'SetToGridB.Hint=Fit to Grid' + #13#10 +
      'ScaleCB.Hint=显示比率' + #13#10 +
      'ExtraToolsTB.Caption=额外工具' + #13#10 +
      'ObjectSelectB.Hint=选取工具' + #13#10 +
      'HandToolB.Hint=徒手工具' + #13#10 +
      'ZoomToolB.Hint=显示比率工具' + #13#10 +
      'TextToolB.Hint=编辑文本工具' + #13#10 +
      'FormatToolB.Hint=复制格式工具' + #13#10 +
      'ObjectBandB.Hint=插入Band' + #13#10 +
      'FileMenu.Caption=文件(&F)' + #13#10 +
      'EditMenu.Caption=编辑(&E)' + #13#10 +
      'FindMI.Caption=查找...' + #13#10 +
      'FindNextMI.Caption=找下一个' + #13#10 +
      'ReplaceMI.Caption=替换...' + #13#10 +
      'ReportMenu.Caption=报表(&R)' + #13#10 +
      'ReportDataMI.Caption=数据...' + #13#10 +
      'ReportSettingsMI.Caption=选项...' + #13#10 +
      'ReportStylesMI.Caption=样式...' + #13#10 +
      'ViewMenu.Caption=视图(&V)' + #13#10 +
      'ToolbarsMI.Caption=工具栏' + #13#10 +
      'StandardMI.Caption=标准' + #13#10 +
      'TextMI.Caption=文本' + #13#10 +
      'FrameMI.Caption=矩形' + #13#10 +
      'AlignmentMI.Caption=对齐' + #13#10 +
      'ToolsMI.Caption=其它' + #13#10 +
      'InspectorMI.Caption=对象查看器' + #13#10 +
      'DataTreeMI.Caption=数据树' + #13#10 +
      'ReportTreeMI.Caption=报表树' + #13#10 +
      'ShowRulersMI.Caption=标尺' + #13#10 +
      'ShowGuidesMI.Caption=向导' + #13#10 +
      'DeleteGuidesMI.Caption=删除向导' + #13#10 +
      'OptionsMI.Caption=选项...' + #13#10 +
      'HelpMenu.Caption=帮助(&H)' + #13#10 +
      'HelpContentsMI.Caption=帮助...' + #13#10 +
      'AboutMI.Caption=关于 FastReport...' + #13#10 +
      'TabOrderMI.Caption=Tab 次序...' + #13#10 +
      'UndoCmd.Caption=撤消' + #13#10 +
      'RedoCmd.Caption=重复' + #13#10 +
      'CutCmd.Caption=剪切' + #13#10 +
      'CopyCmd.Caption=复制' + #13#10 +
      'PasteCmd.Caption=粘贴' + #13#10 +
      'GroupCmd.Caption=群组' + #13#10 +
      'UngroupCmd.Caption=取消群组' + #13#10 +
      'DeleteCmd.Caption=删除' + #13#10 +
      'DeletePageCmd.Caption=删除页' + #13#10 +
      'SelectAllCmd.Caption=全选' + #13#10 +
      'EditCmd.Caption=编辑...' + #13#10 +
      'BringToFrontCmd.Caption=置于顶层' + #13#10 +
      'SendToBackCmd.Caption=置于底层' + #13#10 +
      'NewItemCmd.Caption=新建...' + #13#10 +
      'NewReportCmd.Caption=新报表' + #13#10 +
      'NewPageCmd.Caption=新页面' + #13#10 +
      'NewDialogCmd.Caption=新对话框' + #13#10 +
      'OpenCmd.Caption=打开...' + #13#10 +
      'SaveCmd.Caption=保存' + #13#10 +
      'SaveAsCmd.Caption=另存为...' + #13#10 +
      'VariablesCmd.Caption=变量...' + #13#10 +
      'PageSettingsCmd.Caption=页面设置...' + #13#10 +
      'PreviewCmd.Caption=预览' + #13#10 +
      'ExitCmd.Caption=退出' + #13#10 +
      'ReportTitleMI.Caption=报表抬头' + #13#10 +
      'ReportSummaryMI.Caption=报表合计' + #13#10 +
      'PageHeaderMI.Caption=页首' + #13#10 +
      'PageFooterMI.Caption=页尾' + #13#10 +
      'HeaderMI.Caption=头' + #13#10 +
      'FooterMI.Caption=尾' + #13#10 +
      'MasterDataMI.Caption=主数据' + #13#10 +
      'DetailDataMI.Caption=明细数据' + #13#10 +
      'SubdetailDataMI.Caption=子明性数据' + #13#10 +
      'Data4levelMI.Caption=第4阶数据' + #13#10 +
      'Data5levelMI.Caption=第5阶数据' + #13#10 +
      'Data6levelMI.Caption=第6阶数据' + #13#10 +
      'GroupHeaderMI.Caption=群组首' + #13#10 +
      'GroupFooterMI.Caption=群组尾' + #13#10 +
      'ChildMI.Caption=子' + #13#10 +
      'ColumnHeaderMI.Caption=栏首' + #13#10 +
      'ColumnFooterMI.Caption=栏尾' + #13#10 +
      'OverlayMI.Caption=重叠' + #13#10 +
      'VerticalbandsMI.Caption=垂直Band' + #13#10 +
      'HeaderMI1.Caption=头' + #13#10 +
      'FooterMI1.Caption=尾' + #13#10 +
      'MasterDataMI1.Caption=主数据' + #13#10 +
      'DetailDataMI1.Caption=明细数据' + #13#10 +
      'SubdetailDataMI1.Caption=子明细数据' + #13#10 +
      'GroupHeaderMI1.Caption=群组首' + #13#10 +
      'GroupFooterMI1.Caption=群组尾' + #13#10 +
      'ChildMI1.Caption=子' + #13#10 +
      'R0MI.Caption=0度' + #13#10 +
      'R45MI.Caption=45度' + #13#10 +
      'R90MI.Caption=90度' + #13#10 +
      'R180MI.Caption=180度' + #13#10 +
      'R270MI.Caption=270度' + #13#10 +
      'FontB.Hint=字体设置' + #13#10 +
      'BoldMI.Caption=粗体' + #13#10 +
      'ItalicMI.Caption=斜体' + #13#10 +
      'UnderlineMI.Caption=底线' + #13#10 +
      'SuperScriptMI.Caption=SuperScript' + #13#10 +
      'SubScriptMI.Caption=SubScript' + #13#10 +
      'CondensedMI.Caption=压缩' + #13#10 +
      'WideMI.Caption=宽' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'OpenDialog.Filter=Report (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=Pascal files (*.pas)|*.pas|C++ files (*.cpp)|*.cpp|JavaScript files (*.js)|*.js|Basic files (*.vb)|*.vb|All files|*.*' + #13#10 +
      'SaveScriptDialog.Filter=Pascal files (*.pas)|*.pas|C++ files (*.cpp)|*.cpp|JavaScript files (*.js)|*.js|Basic files (*.vb)|*.vb|All files|*.*' + #13#10 +
      '');
    Add('dsCm', 'Centimeters');
    Add('dsInch', 'Inches');
    Add('dsPix', 'Pixels');
    Add('dsChars', 'Characters');
    Add('dsCode', 'Code');
    Add('dsPage', 'Page');
    Add('dsRepFilter', 'Report (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'Compressed report (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', '保存变更至预览页面?');
    Add('dsSaveChangesTo', '保存修改至 ');
    Add('dsCantLoad', '无法载入文件');
    Add('dsStyleFile', '样式');
    Add('dsCantFindProc', '找不到主过程');
    Add('dsClearScript', '清除所有的脚本，你要继续吗?');
    Add('dsNoStyle', '没有样式');
    Add('dsStyleSample', '样式范例');
    Add('dsTextNotFound', '文本 ''%s'' 找不到');
    Add('dsReplace', '替换文本 ''%s''?');

    Add('TfrxAboutForm',
      'Caption=关于 FastReport' + #13#10 +
      'Label4.Caption=访问我们的网站以取得更多的信息:' + #13#10 +
      'Label6.Caption=销售:' + #13#10 +
      'Label8.Caption=支援:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=页面设置' + #13#10 +
      'OKB.Caption=确认' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'TabSheet1.Caption=纸张' + #13#10 +
      'Label1.Caption=宽度' + #13#10 +
      'Label2.Caption=高度' + #13#10 +
      'Label11.Caption=大小   ' + #13#10 +
      'Label12.Caption=方向   ' + #13#10 +
      'Label3.Caption=左边距' + #13#10 +
      'Label4.Caption=上边距' + #13#10 +
      'Label5.Caption=右边距' + #13#10 +
      'Label6.Caption=下边距' + #13#10 +
      'Label13.Caption=边距   ' + #13#10 +
      'Label14.Caption=纸张来源   ' + #13#10 +
      'Label9.Caption=第一页' + #13#10 +
      'Label10.Caption=其他页' + #13#10 +
      'PortraitRB.Caption=纵向' + #13#10 +
      'LandscapeRB.Caption=横向' + #13#10 +
      'TabSheet3.Caption=其他选项' + #13#10 +
      'Label7.Caption=分栏   ' + #13#10 +
      'Label8.Caption=栏数' + #13#10 +
      'Label15.Caption=栏间距' + #13#10 +
      'Label16.Caption=位置' + #13#10 +
      'Label17.Caption=其他   ' + #13#10 +
      'Label18.Caption=双面打印' + #13#10 +
      'PrintOnPrevCB.Caption=打印至前一页' + #13#10 +
      'MirrorMarginsCB.Caption=伸展至打印区' + #13#10 +
      'LargeHeightCB.Caption=在设计模式使用大的纸张高度' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=选取报表数据库' + #13#10 +
      'OKB.Caption=确认' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=编辑变量' + #13#10 +
      'NewCategoryB.Caption=Category' + #13#10 +
      'NewVarB.Caption=变量' + #13#10 +
      'EditB.Caption=编辑' + #13#10 +
      'DeleteB.Caption=删除' + #13#10 +
      'EditListB.Caption=清单' + #13#10 +
      'LoadB.Caption=载入' + #13#10 +
      'SaveB.Caption=保存' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'OkB.Caption=确认' + #13#10 +
      'ExprPanel.Caption= 运算式:' + #13#10 +
      'OpenDialog1.Filter=Dictionary (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Dictionary (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(未定义变量)');
    Add('vaVar', '变量');
    Add('vaDupName', '名称重复');

    Add('TfrxOptionsEditor',
      'Caption=设计选项' + #13#10 +
      'Label1.Caption=珊格   ' + #13#10 +
      'Label2.Caption=类型' + #13#10 +
      'Label3.Caption=大小' + #13#10 +
      'Label4.Caption=对话框:' + #13#10 +
      'Label5.Caption=其他   ' + #13#10 +
      'Label6.Caption=字体   ' + #13#10 +
      'Label7.Caption=代码编辑器' + #13#10 +
      'Label8.Caption=文本编辑器' + #13#10 +
      'Label9.Caption=大小' + #13#10 +
      'Label10.Caption=大小' + #13#10 +
      'Label11.Caption=颜色   ' + #13#10 +
      'Label12.Caption=间距:' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=in' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=确认' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'CMRB.Caption=毫米:' + #13#10 +
      'InchesRB.Caption=英寸:' + #13#10 +
      'PixelsRB.Caption=像素:' + #13#10 +
      'ShowGridCB.Caption=显示珊格' + #13#10 +
      'AlignGridCB.Caption=珊格对齐' + #13#10 +
      'EditAfterInsCB.Caption=插入后显示编辑器' + #13#10 +
      'ObjectFontCB.Caption=使用对象的字体设置' + #13#10 +
      'WorkspaceB.Caption=工作空间' + #13#10 +
      'ToolB.Caption=工具视窗' + #13#10 +
      'LCDCB.Caption=LCD 珊格颜色' + #13#10 +
      'FreeBandsCB.Caption=自由摆设Band的位置' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=还原默认设置' + #13#10 +
      'BandsCaptionsCB.Caption=显示Band的标题' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=选取数据库' + #13#10 +
      'OkB.Caption=确认' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      '');
    Add('dbNotAssigned', '[未指定]');
    Add('dbSingleLine', '单笔');

    Add('TfrxGroupEditorForm',
      'Caption=群组' + #13#10 +
      'BreakOnL.Caption=群组分隔于   ' + #13#10 +
      'OptionsL.Caption=选项   ' + #13#10 +
      'OKB.Caption=确认' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'DataFieldRB.Caption=数据字段' + #13#10 +
      'ExpressionRB.Caption=运算式' + #13#10 +
      'KeepGroupTogetherCB.Caption=保持与群组在一起' + #13#10 +
      'StartNewPageCB.Caption=换页' + #13#10 +
      'OutlineCB.Caption=显示在大纲' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=系统备忘' + #13#10 +
      'DataBandL.Caption=数据band' + #13#10 +
      'DataSetL.Caption=数据库' + #13#10 +
      'DataFieldL.Caption=数据字段' + #13#10 +
      'FunctionL.Caption=函数' + #13#10 +
      'ExpressionL.Caption=表示式' + #13#10 +
      'OKB.Caption=确认' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'AggregateRB.Caption=Aggregate value' + #13#10 +
      'SysVariableRB.Caption=系统变量' + #13#10 +
      'CountInvisibleCB.Caption=计算不可见band的数目' + #13#10 +
      'TextRB.Caption=文本' + #13#10 +
      'RunningTotalCB.Caption=执行总数' + #13#10 +
      '');
    Add('agAggregate', '插入合计');
    Add('vt1', '[DATE]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGES#]');
    Add('vt5', '[PAGE#] of [TOTALPAGES#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=OLE 对象' + #13#10 +
      'InsertB.Caption=插入...' + #13#10 +
      'EditB.Caption=编辑...' + #13#10 +
      'CloseB.Caption=关闭' + #13#10 +
      '');
    Add('olStretched', 'Stretched');

    Add('TfrxBarcodeEditorForm',
      'Caption=条码编辑器' + #13#10 +
      'CodeLbl.Caption=码' + #13#10 +
      'TypeLbl.Caption=条码类型' + #13#10 +
      'ZoomLbl.Caption=比率:' + #13#10 +
      'OptionsLbl.Caption=选项   ' + #13#10 +
      'RotationLbl.Caption=旋转   ' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'OkB.Caption=确认' + #13#10 +
      'CalcCheckSumCB.Caption=计算检查码 ' + #13#10 +
      'ViewTextCB.Caption=文本' + #13#10 +
      'Rotation0RB.Caption=0度' + #13#10 +
      'Rotation90RB.Caption=90度' + #13#10 +
      'Rotation180RB.Caption=180度' + #13#10 +
      'Rotation270RB.Caption=270度' + #13#10 +
      '');
    Add('bcCalcChecksum', '计算检查码');
    Add('bcShowText', '显示文本');

    Add('TfrxAliasesEditorForm',
      'Caption=编辑别名' + #13#10 +
      'HintL.Caption=按 Enter 编辑项目' + #13#10 +
      'DSAliasL.Caption=数据库别名' + #13#10 +
      'FieldAliasesL.Caption=字段别名' + #13#10 +
      'OkB.Caption=确认' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'ResetB.Caption=重置' + #13#10 +
      '');
    Add('alUserName', '使用者名称');
    Add('alOriginal', '原来的名称');

    Add('TfrxParamsEditorForm',
      'Caption=参数编辑器' + #13#10 +
      'OkB.Caption=确认' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      '');
    Add('qpName', '名称');
    Add('qpDataType', '数据类型');
    Add('qpValue', '值');

    Add('TfrxMDEditorForm',
      'Caption=Master-Detail 连结' + #13#10 +
      'Label1.Caption=Detail 字段' + #13#10 +
      'Label2.Caption=Master 字段' + #13#10 +
      'Label3.Caption=Linked 字段' + #13#10 +
      'AddB.Caption=新增' + #13#10 +
      'ClearB.Caption=清除' + #13#10 +
      'OkB.Caption=确认' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=备忘' + #13#10 +
      'ExprB.Hint=插入运算式' + #13#10 +
      'AggregateB.Hint=插入合计' + #13#10 +
      'LocalFormatB.Hint=插入输出格式' + #13#10 +
      'WordWrapB.Hint=文本自动换行' + #13#10 +
      'CancelB.Hint=取消' + #13#10 +
      'OkB.Hint=确定' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=图像' + #13#10 +
      'LoadB.Hint=载入' + #13#10 +
      'CopyB.Hint=复制' + #13#10 +
      'PasteB.Hint=粘贴' + #13#10 +
      'ClearB.Hint=清除' + #13#10 +
      'CancelB.Hint=取消' + #13#10 +
      'OkB.Hint=确认' + #13#10 +
      '');
    Add('piEmpty', '清空');

    Add('TfrxChartEditorForm',
      'Caption=统计图编辑器' + #13#10 +
      'OkB.Caption=确认' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=新增系列' + #13#10 +
      'DeleteB.Hint=删除系列' + #13#10 +
      'DBSourceRB.Caption=数据来自数据库' + #13#10 +
      'FixedDataRB.Caption=固定数据' + #13#10 +
      'DatasetLbl.Caption=数据库' + #13#10 +
      'X1Lbl.Caption=X 值' + #13#10 +
      'Y1Lbl.Caption=Y 值' + #13#10 +
      'X3Lbl.Caption=X 值 (例如, a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Y 值 (例如, 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=其他选项   ' + #13#10 +
      'ShowTopLbl.Caption=前N名的值' + #13#10 +
      'CaptionLbl.Caption=前N名的标题' + #13#10 +
      'SortLbl.Caption=排列顺序' + #13#10 +
      'LineMI.Caption=Line' + #13#10 +
      'AreaMI.Caption=Area' + #13#10 +
      'PointMI.Caption=Point' + #13#10 +
      'BarMI.Caption=Bar' + #13#10 +
      'HorizBarMI.Caption=Horiz. Bar' + #13#10 +
      'PieMI.Caption=Pie' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Fast Line' + #13#10 +
      '');
    Add('ch3D', '3D 查看');
    Add('chAxis', '显示轴');
    Add('chsoNone', '无');
    Add('chsoAscending', '递增');
    Add('chsoDescending', '递减');

    Add('TfrxRichEditorForm',
      'Caption=RTF 文件编辑器' + #13#10 +
      'OpenB.Hint=打开文件' + #13#10 +
      'SaveB.Hint=保存文件' + #13#10 +
      'UndoB.Hint=  原' + #13#10 +
      'TTB.Hint=字体' + #13#10 +
      'ExprB.Hint=插入运算式' + #13#10 +
      'CancelB.Hint=取消' + #13#10 +
      'OkB.Hint=确认' + #13#10 +
      'BoldB.Hint=粗体' + #13#10 +
      'ItalicB.Hint=斜体' + #13#10 +
      'UnderlineB.Hint=底线' + #13#10 +
      'LeftAlignB.Hint=左对齐' + #13#10 +
      'CenterAlignB.Hint=居中' + #13#10 +
      'RightAlignB.Hint=右对齐' + #13#10 +
      'BlockAlignB.Hint=区块切齐' + #13#10 +
      'BulletsB.Hint=著重号' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=交叉报表编辑器' + #13#10 +
      'DatasetL.Caption=来源数据   ' + #13#10 +
      'DimensionsL.Caption=空间   ' + #13#10 +
      'RowsL.Caption=列' + #13#10 +
      'ColumnsL.Caption=栏' + #13#10 +
      'CellsL.Caption=小方格' + #13#10 +
      'StructureL.Caption=交叉报表结构   ' + #13#10 +
      'RowHeaderCB.Caption=列首' + #13#10 +
      'ColumnHeaderCB.Caption=栏首' + #13#10 +
      'RowTotalCB.Caption=列总计' + #13#10 +
      'ColumnTotalCB.Caption=栏总计' + #13#10 +
      'SwapB.Hint=列/栏互换' + #13#10 +
      'StyleCB.Hint=交叉报表样式' + #13#10 +
      'FontB.Hint=字体设置' + #13#10 +
      'AlignLeftB.Hint=左边切齐' + #13#10 +
      'AlignCenterB.Hint=中间切齐' + #13#10 +
      'AlignRightB.Hint=右边切齐' + #13#10 +
      'RotationB.Hint=文本旋转' + #13#10 +
      'HighlightB.Hint=突显' + #13#10 +
      'FormatB.Hint=格式' + #13#10 +
      'FrameB.Hint=外框设置' + #13#10 +
      'FillColorB.Hint=填颜色' + #13#10 +
      'Func1MI.Caption=无' + #13#10 +
      'Func2MI.Caption=合计' + #13#10 +
      'Func3MI.Caption=最小值' + #13#10 +
      'Func4MI.Caption=最大值' + #13#10 +
      'Func5MI.Caption=平均值' + #13#10 +
      'Func6MI.Caption=计数' + #13#10 +
      'Sort1MI.Caption=递增 (A-Z)' + #13#10 +
      'Sort2MI.Caption=递减 (Z-A)' + #13#10 +
      'Sort3MI.Caption=不排序' + #13#10 +
      'BoldMI.Caption=粗体' + #13#10 +
      'ItalicMI.Caption=斜体' + #13#10 +
      'UnderlineMI.Caption=底线' + #13#10 +
      'SuperScriptMI.Caption=上标' + #13#10 +
      'SubScriptMI.Caption=下标' + #13#10 +
      'CondensedMI.Caption=压缩' + #13#10 +
      'WideMI.Caption=宽' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=取消' + #13#10 +
      'OkB.Hint=确认' + #13#10 +
      '');
    Add('crSubtotal', '小计');
    Add('crNone', '无');
    Add('crSum', '合计');
    Add('crMin', '最小值');
    Add('crMax', '最大值');
    Add('crAvg', '平均值');
    Add('crCount', '计数');
    Add('crAsc', 'A-Z');
    Add('crDesc', 'Z-A');
    Add('crFillMx', '填入交叉报表中...');
    Add('crBuildMx', '建立交叉报表中...');
    Add('crRepHdrs', '重新打印表头');
    Add('crBorder', '外框');
    Add('crDown', '由上而下，由左至右');

    Add('TfrxExprEditorForm',
      'Caption=运算式编辑器' + #13#10 +
      'ExprL.Caption=运算式:' + #13#10 +
      'OkB.Caption=确认' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=显示格式' + #13#10 +
      'CategoryL.Caption=类别' + #13#10 +
      'FormatL.Caption=格式' + #13#10 +
      'FormatStrL.Caption=格式字串:' + #13#10 +
      'SeparatorL.Caption=小数点分隔字元:' + #13#10 +
      'OkB.Caption=确认' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      '');
    Add('fkText', '文本 (未格式化)');
    Add('fkNumber', '数字');
    Add('fkDateTime', '日期/时间');
    Add('fkBoolean', '布林');
    Add('fkNumber1', '1234.5;%g');
    Add('fkNumber2', '1234.50;%2.2f');
    Add('fkNumber3', '1,234.50;%2.2n');
    Add('fkNumber4', '$1,234.50;%2.2m');
    Add('fkDateTime1', '11.28.2002;mm.dd.yyyy');
    Add('fkDateTime2', '28 nov 2002;dd mmm yyyy');
    Add('fkDateTime3', 'November 28, 2002;mmmm dd, yyyy');
    Add('fkDateTime4', '02:14;hh:mm');
    Add('fkDateTime5', '02:14am;hh:mm am/pm');
    Add('fkDateTime6', '02:14:00;hh:mm:ss');
    Add('fkDateTime7', '02:14am, November 28, 2002;hh:mm am/pm, mmmm dd, yyyy');
    Add('fkBoolean1', '0,1;0,1');
    Add('fkBoolean2', 'No,Yes;No,Yes');
    Add('fkBoolean3', '_,x;_,x');
    Add('fkBoolean4', 'False,True;False,True');

    Add('TfrxHighlightEditorForm',
      'Caption=突显' + #13#10 +
      'FontColorB.Caption=颜色...' + #13#10 +
      'BackColorB.Caption=颜色...' + #13#10 +
      'ConditionL.Caption=条件   ' + #13#10 +
      'FontL.Caption=字体   ' + #13#10 +
      'BackgroundL.Caption=背景   ' + #13#10 +
      'OKB.Caption=确认' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'BoldCB.Caption=粗体' + #13#10 +
      'ItalicCB.Caption=斜体' + #13#10 +
      'UnderlineCB.Caption=底线' + #13#10 +
      'TransparentRB.Caption=透明' + #13#10 +
      'OtherRB.Caption=其他' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=报表设置' + #13#10 +
      'OkB.Caption=确认' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'GeneralTS.Caption=常规' + #13#10 +
      'ReportSettingsL.Caption=打印机设置   ' + #13#10 +
      'CopiesL.Caption=打印份数' + #13#10 +
      'GeneralL.Caption=常规   ' + #13#10 +
      'PasswordL.Caption=密码' + #13#10 +
      'CollateCB.Caption=自动分页' + #13#10 +
      'DoublePassCB.Caption=Double pass' + #13#10 +
      'PrintIfEmptyCB.Caption=Print if empty' + #13#10 +
      'DescriptionTS.Caption=描述' + #13#10 +
      'NameL.Caption=名称' + #13#10 +
      'Description1L.Caption=描述' + #13#10 +
      'PictureL.Caption=图像' + #13#10 +
      'AuthorL.Caption=作者' + #13#10 +
      'MajorL.Caption=Major' + #13#10 +
      'MinorL.Caption=Minor' + #13#10 +
      'ReleaseL.Caption=Release' + #13#10 +
      'BuildL.Caption=Build' + #13#10 +
      'CreatedL.Caption=建立' + #13#10 +
      'ModifiedL.Caption=修改' + #13#10 +
      'DescriptionL.Caption=描述   ' + #13#10 +
      'VersionL.Caption=版本   ' + #13#10 +
      'PictureB.Caption=浏览...' + #13#10 +
      '');
    Add('rePrnOnPort', '在');

    Add('TfrxStringsEditorForm',
      'Caption=字串清单' + #13#10 +
      'CancelB.Hint=取消' + #13#10 +
      'OkB.Hint=确认' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=取消' + #13#10 +
      'OkB.Hint=确认' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=密码' + #13#10 +
      'PasswordL.Caption=输入密码:' + #13#10 +
      'OkB.Caption=确认' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=样式编辑器' + #13#10 +
      'ColorB.Caption=颜色...' + #13#10 +
      'FontB.Caption=字体...' + #13#10 +
      'FrameB.Caption=外框...' + #13#10 +
      'AddB.Hint=加入' + #13#10 +
      'DeleteB.Hint=删除' + #13#10 +
      'EditB.Hint=编辑' + #13#10 +
      'LoadB.Hint=载入' + #13#10 +
      'SaveB.Hint=保存' + #13#10 +
      'CancelB.Hint=取消' + #13#10 +
      'OkB.Hint=确认' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=外框编辑器' + #13#10 +
      'FrameL.Caption=外框' + #13#10 +
      'LineL.Caption=框线' + #13#10 +
      'ShadowL.Caption=阴影' + #13#10 +
      'FrameTopB.Hint=上线' + #13#10 +
      'FrameBottomB.Hint=底线' + #13#10 +
      'FrameLeftB.Hint=左线' + #13#10 +
      'FrameRightB.Hint=右线' + #13#10 +
      'FrameAllB.Hint=外框线' + #13#10 +
      'FrameNoB.Hint=无框线' + #13#10 +
      'FrameColorB.Hint=外框颜色' + #13#10 +
      'FrameStyleB.Hint=外框样式' + #13#10 +
      'FrameWidthCB.Hint=外框宽度' + #13#10 +
      'ShadowB.Hint=阴影' + #13#10 +
      'ShadowColorB.Hint=阴影颜色' + #13#10 +
      'ShadowWidthCB.Hint=阴影宽度' + #13#10 +
      'OkB.Caption=确认' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=新项目' + #13#10 +
      'ItemsTab.Caption=项目' + #13#10 +
      'TemplatesTab.Caption=模板' + #13#10 +
      'OkB.Caption=确认' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Tab键次序' + #13#10 +
      'Label1.Caption=控制项的Tab键次序:' + #13#10 +
      'OkB.Caption=确认' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'UpB.Caption=上移' + #13#10 +
      'DownB.Caption=下移' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=求值' + #13#10 +
      'Label1.Caption=运算式' + #13#10 +
      'Label2.Caption=结果' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=报表向导' + #13#10 +
      'DataTab.Caption=数据' + #13#10 +
      'GroupsTab.Caption=群组' + #13#10 +
      'LayoutTab.Caption=格式' + #13#10 +
      'StyleTab.Caption=样式' + #13#10 +
      'Step1L.Caption=Step 1. 选取要显示的数据库及字段.' + #13#10 +
      'Step2L.Caption=Step 2. 建立群组 (选项).' + #13#10 +
      'Step3L.Caption=Step 3. 定义页面方向及数据格式.' + #13#10 +
      'Step4L.Caption=Step 4. 选择报表样式.' + #13#10 +
      'AddFieldB.Caption=加入 >' + #13#10 +
      'AddAllFieldsB.Caption=全部加入 >>' + #13#10 +
      'RemoveFieldB.Caption=< 移除' + #13#10 +
      'RemoveAllFieldsB.Caption=<< 全部移除' + #13#10 +
      'AddGroupB.Caption=加入 >' + #13#10 +
      'RemoveGroupB.Caption=< 移除' + #13#10 +
      'SelectedFieldsL.Caption=选取的字段:' + #13#10 +
      'AvailableFieldsL.Caption=可用的字段:' + #13#10 +
      'GroupsL.Caption=群组:' + #13#10 +
      'OrientationL.Caption=方向   ' + #13#10 +
      'LayoutL.Caption=格式   ' + #13#10 +
      'PortraitRB.Caption=纵向' + #13#10 +
      'LandscapeRB.Caption=横向' + #13#10 +
      'TabularRB.Caption=Tabular' + #13#10 +
      'ColumnarRB.Caption=Columnar' + #13#10 +
      'FitWidthCB.Caption=调整字段至页面宽度' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'BackB.Caption=<< 上一步' + #13#10 +
      'NextB.Caption=下一步 >>' + #13#10 +
      'FinishB.Caption=完成' + #13#10 +
      '');
    Add('wzStd', '标准报表向导');
    Add('wzDMP', '点矩阵报表向导');
    Add('wzStdEmpty', '标准报表');
    Add('wzDMPEmpty', '点矩阵报表');


    Add('ftAllFiles', 'All Files');
    Add('ftPictures', 'Pictures');
    Add('ftDB', 'Databases');
    Add('ftRichFile', 'RichText file');
    Add('ftTextFile', 'Text file');

    Add('prNotAssigned', '(Not assigned)');
    Add('prInvProp', 'Invalid property value');
    Add('prDupl', 'Duplicate name');
    Add('prPict', '(Picture)');

    Add('mvExpr', 'Allow Expressions');
    Add('mvStretch', 'Stretch');
    Add('mvStretchToMax', 'Stretch to Max Height');
    Add('mvShift', 'Shift');
    Add('mvShiftOver', 'Shift When Overlapped');
    Add('mvVisible', 'Visible');
    Add('mvPrintable', 'Printable');
    Add('mvFont', 'Font...');
    Add('mvFormat', 'Display Format...');
    Add('mvClear', 'Clear Contents');
    Add('mvAutoWidth', 'Auto Width');
    Add('mvWWrap', 'Word Wrap');
    Add('mvSuppress', 'Suppress Repeated Values');
    Add('mvHideZ', 'Hide Zeros');
    Add('mvHTML', 'Allow HTML Tags');
    Add('lvDiagonal', 'Diagonal');
    Add('pvAutoSize', 'Auto Size');
    Add('pvCenter', 'Center');
    Add('pvAspect', 'Keep Aspect Ratio');
    Add('bvSplit', 'Allow Split');
    Add('bvKeepChild', 'Keep Child Together');
    Add('bvPrintChild', 'Print Child If Invisible');
    Add('bvStartPage', 'Start New Page');
    Add('bvPrintIfEmpty', 'Print If Detail Empty');
    Add('bvKeepDetail', 'Keep Detail Together');
    Add('bvKeepFooter', 'Keep Footer Together');
    Add('bvReprint', 'Reprint On New Page');
    Add('bvOnFirst', 'Print On First Page');
    Add('bvOnLast', 'Print On Last Page');
    Add('bvKeepGroup', 'Keep Together');
    Add('bvFooterAfterEach', 'Footer after each row');
    Add('srParent', 'Print On Parent');

    Add('obCatDraw', 'Draw');
    Add('obCatOther', 'Other objects');
    Add('obCatOtherControls', 'Other controls');
    Add('obDiagLine', 'Diagonal line');
    Add('obRect', 'Rectangle');
    Add('obRoundRect', 'Rounded rectangle');
    Add('obEllipse', 'Ellipse');
    Add('obTrian', 'Triangle');
    Add('obDiamond', 'Diamond');
    Add('obLabel', 'Label control');
    Add('obEdit', 'Edit control');
    Add('obMemoC', 'Memo control');
    Add('obButton', 'Button control');
    Add('obChBoxC', 'CheckBox control');
    Add('obRButton', 'RadioButton control');
    Add('obLBox', 'ListBox control');
    Add('obCBox', 'ComboBox control');
    Add('obDateEdit', 'DateEdit control');
    Add('obImageC', 'Image control');
    Add('obPanel', 'Panel control');
    Add('obGrBox', 'GroupBox control');
    Add('obBBtn', 'BitBtn control');
    Add('obSBtn', 'SpeedButton control');
    Add('obMEdit', 'MaskEdit control');
    Add('obChLB', 'CheckListBox control');
    Add('obDBLookup', 'DBLookupComboBox control');
    Add('obBevel', 'Bevel object');
    Add('obShape', 'Shape object');
    Add('obText', 'Text object');
    Add('obSysText', 'System text');
    Add('obLine', 'Line object');
    Add('obPicture', 'Picture object');
    Add('obBand', 'Band object');
    Add('obDataBand', 'Data band');
    Add('obSubRep', 'Subreport object');
    Add('obDlgPage', 'Dialog form');
    Add('obRepPage', 'Report page');
    Add('obReport', 'Report object');
    Add('obRich', 'RichText object');
    Add('obOLE', 'OLE object');
    Add('obChBox', 'CheckBox object');
    Add('obChart', 'Chart object');
    Add('obBarC', 'Barcode object');
    Add('obCross', 'Cross-tab object');
    Add('obDBCross', 'DB Cross-tab object');
    Add('obGrad', 'Gradient object');
    Add('obDMPText', 'Dot-matrix Text object');
    Add('obDMPLine', 'Dot-matrix Line object');
    Add('obBDEDB', 'BDE Database');
    Add('obBDETb', 'BDE Table');
    Add('obBDEQ', 'BDE Query');
    Add('obBDEComps', 'BDE components');
    Add('obIBXDB', 'IBX Database');
    Add('obIBXTb', 'IBX Table');
    Add('obIBXQ', 'IBX Query');
    Add('obIBXComps', 'IBX Components');
    Add('obADODB', 'ADO Database');
    Add('obADOTb', 'ADO Table');
    Add('obADOQ', 'ADO Query');
    Add('obADOComps', 'ADO Components');
    Add('obDBXDB', 'DBX Database');
    Add('obDBXTb', 'DBX Table');
    Add('obDBXQ', 'DBX Query');
    Add('obDBXComps', 'DBX Components');

    Add('ctString', 'String');
    Add('ctDate', 'Date and Time');
    Add('ctConv', 'Conversions');
    Add('ctFormat', 'Formatting');
    Add('ctMath', 'Mathematical');
    Add('ctOther', 'Other');

    Add('IntToStr', 'Converts an integer value to a string');
    Add('FloatToStr', 'Converts a float value to a string');
    Add('DateToStr', 'Converts a date to a string');
    Add('TimeToStr', 'Converts a time to a string');
    Add('DateTimeToStr', 'Converts a date-and-time value to a string');
    Add('VarToStr', 'Converts a variant value to a string');
    Add('StrToInt', 'Converts a string to an integer value');
    Add('StrToFloat', 'Converts a string to a floating-point value');
    Add('StrToDate', 'Converts a string to a date format');
    Add('StrToTime', 'Converts a string to a time format');
    Add('StrToDateTime', 'Converts a string to a date-and-time format');
    Add('Format', 'Returns formatted string assembled from a series of array arguments');
    Add('FormatFloat', 'Formats a floating-point value');
    Add('FormatDateTime', 'Formats a date-and-time value');
    Add('FormatMaskText', 'Returns a string formatted using an edit mask');
    Add('EncodeDate', 'Returns a TDateTime type for a specified Year, Month, and Day');
    Add('DecodeDate', 'Breaks TDateTime into Year, Month, and Day values');
    Add('EncodeTime', 'Returns a TDateTime type for a specified Hour, Min, Sec, and MSec');
    Add('DecodeTime', 'Breaks TDateTime into hours, minutes, seconds, and milliseconds');
    Add('Date', 'Returns current date');
    Add('Time', 'Returns current time');
    Add('Now', 'Return current date and time');
    Add('DayOfWeek', 'Returns the day of the week for a specified date');
    Add('IsLeapYear', 'Indicates whether a specified year is a leap year');
    Add('DaysInMonth', 'Returns a number of days in a specified month');
    Add('Length', 'Returns a length of a string');
    Add('Copy', 'Returns a substring of a string');
    Add('Pos', 'Returns a position of a substring in a string');
    Add('Delete', 'Removes a substring from a string');
    Add('Insert', 'Inserts a substring into a string');
    Add('Uppercase', 'Converts all character in a string to upper case');
    Add('Lowercase', 'Converts all character in a string to lower case');
    Add('Trim', 'Trims all trailing and leading spaces in a string');
    Add('NameCase', 'Converts first character of a word to upper case');
    Add('CompareText', 'Compares two strings');
    Add('Chr', 'Converts an integer value to a char');
    Add('Ord', 'Converts a character value to an integer');
    Add('SetLength', 'Sets the length of a string');
    Add('Round', 'Rounds a floating-point value to the nearest whole number');
    Add('Trunc', 'Truncates a floating-point value to an integer');
    Add('Int', 'Returns the integer part of a real number');
    Add('Frac', 'Returns the fractional part of a real number');
    Add('Sqrt', 'Returns the square root of a specified number');
    Add('Abs', 'Returns an absolute value');
    Add('Sin', 'Returns the sine of an angle (in radians)');
    Add('Cos', 'Returns the cosine of an angle (in radians)');
    Add('ArcTan', 'Returns the arctangent');
    Add('Tan', 'Returns the tangent');
    Add('Exp', 'Returns the exponential');
    Add('Ln', 'Returns the natural log of a real expression');
    Add('Pi', 'Returns the 3.1415926... number');
    Add('Inc', 'Increments a value');
    Add('Dec', 'Decrements a value');
    Add('RaiseException', 'Raises an exception');
    Add('ShowMessage', 'Shows a message box');
    Add('Randomize', 'Starts the random numbers generator');
    Add('Random', 'Returns a random number');
    Add('ValidInt', 'Returns True if specified string contains a valid integer');
    Add('ValidFloat', 'Returns True if specified string contains a valid float');
    Add('ValidDate', 'Returns True if specified string contains a valid date');
    Add('IIF', 'Returns TrueValue if specified Expr is True, otherwise returns FalseValue');
    Add('Get', 'For internal use only');
    Add('Set', 'For internal use only');
    Add('InputBox', 'Displays an input dialog box that enables the user to enter a string');
    Add('InputQuery', 'Displays an input dialog box that enables the user to enter a string');
    Add('MessageDlg', 'Shows a message box');
    Add('CreateOleObject', 'Creates an OLE object');
    Add('VarArrayCreate', 'Creates a variant array');
    Add('VarType', 'Return a type of the variant value');
    Add('DayOf', 'Returns day number (1..31) of given Date');
    Add('MonthOf', 'Returns month number (1..12) of given Date');
    Add('YearOf', 'Returns year of given Date');
  end;
end;


initialization
  frAddDesignerRes;

end.
