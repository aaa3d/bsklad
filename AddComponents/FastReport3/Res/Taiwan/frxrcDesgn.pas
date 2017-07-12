
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
      'Caption=物件檢視器' + #13#10 +
      '');
    Add('oiProp', '屬性');
    Add('oiEvent', '事件');

    Add('TfrxDataTreeForm',
      'Caption=資料樹' + #13#10 +
      'DataTS.Caption=資料' + #13#10 +
      'VariablesTS.Caption=變數' + #13#10 +
      'FunctionsTS.Caption=函數' + #13#10 +
      'InsFieldCB.Caption=建立欄位' + #13#10 +
      'InsCaptionCB.Caption=建立標題' + #13#10 +
      '');
    Add('dtNoData', '沒有資料庫可以使用');
    Add('dtData', '資料');
    Add('dtSysVar', '系統變數');
    Add('dtVar', '變數');
    Add('dtFunc', '函數');

    Add('TfrxReportTreeForm',
      'Caption=報表樹' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=開啟腳本' + #13#10 +
      'SaveScriptB.Hint=儲存腳本' + #13#10 +
      'RunScriptB.Hint=執行腳本' + #13#10 +
      'StepScriptB.Hint=追蹤至' + #13#10 +
      'StopScriptB.Hint=結束腳本' + #13#10 +
      'EvaluateB.Hint=求值' + #13#10 +
      'LangL.Caption=語言:' + #13#10 +
      'AlignTB.Caption=對齊' + #13#10 +
      'AlignLeftsB.Hint=齊左' + #13#10 +
      'AlignHorzCentersB.Hint=水平置中' + #13#10 +
      'AlignRightsB.Hint=齊右' + #13#10 +
      'AlignTopsB.Hint=齊上' + #13#10 +
      'AlignVertCentersB.Hint=垂直置中' + #13#10 +
      'AlignBottomsB.Hint=齊底' + #13#10 +
      'SpaceHorzB.Hint=水平空間' + #13#10 +
      'SpaceVertB.Hint=垂直空間' + #13#10 +
      'CenterHorzB.Hint=水平置中' + #13#10 +
      'CenterVertB.Hint=垂直置中' + #13#10 +
      'SameWidthB.Hint=相同寬度' + #13#10 +
      'SameHeightB.Hint=相同高度' + #13#10 +
      'TextTB.Caption=文字' + #13#10 +
      'StyleCB.Hint=樣式' + #13#10 +
      'FontNameCB.Hint=字型名稱' + #13#10 +
      'FontSizeCB.Hint=字型大小' + #13#10 +
      'BoldB.Hint=粗體' + #13#10 +
      'ItalicB.Hint=斜體' + #13#10 +
      'UnderlineB.Hint=底線' + #13#10 +
      'FontColorB.Hint=字體顏色' + #13#10 +
      'HighlightB.Hint=強調' + #13#10 +
      'RotateB.Hint=文字方向' + #13#10 +
      'TextAlignLeftB.Hint=左靠' + #13#10 +
      'TextAlignCenterB.Hint=置中' + #13#10 +
      'TextAlignRightB.Hint=右靠' + #13#10 +
      'TextAlignBlockB.Hint=左靠' + #13#10 +
      'TextAlignTopB.Hint=上面切齊' + #13#10 +
      'TextAlignMiddleB.Hint=垂直置中' + #13#10 +
      'TextAlignBottomB.Hint=底部切齊' + #13#10 +
      'FrameTB.Caption=外框' + #13#10 +
      'FrameTopB.Hint=上方線' + #13#10 +
      'FrameBottomB.Hint=下方線' + #13#10 +
      'FrameLeftB.Hint=左邊線' + #13#10 +
      'FrameRightB.Hint=右邊線' + #13#10 +
      'FrameAllB.Hint=框線' + #13#10 +
      'FrameNoB.Hint=沒有邊框' + #13#10 +
      'ShadowB.Hint=陰影' + #13#10 +
      'FillColorB.Hint=背景顏色' + #13#10 +
      'FrameColorB.Hint=外框顏色' + #13#10 +
      'FrameStyleB.Hint=外框樣式' + #13#10 +
      'FrameWidthCB.Hint=外框寬度' + #13#10 +
      'StandardTB.Caption=標準' + #13#10 +
      'NewB.Hint=新報表' + #13#10 +
      'OpenB.Hint=開啟報表' + #13#10 +
      'SaveB.Hint=儲存報表' + #13#10 +
      'PreviewB.Hint=預覽' + #13#10 +
      'NewPageB.Hint=新報表頁面' + #13#10 +
      'NewDialogB.Hint=新對話視窗' + #13#10 +
      'DeletePageB.Hint=刪除頁' + #13#10 +
      'PageSettingsB.Hint=頁面設定' + #13#10 +
      'VariablesB.Hint=變數' + #13#10 +
      'CutB.Hint=剪下' + #13#10 +
      'CopyB.Hint=複製' + #13#10 +
      'PasteB.Hint=貼上' + #13#10 +
      'SampleFormatB.Hint=複製格式' + #13#10 +
      'UndoB.Hint=復原' + #13#10 +
      'RedoB.Hint=取消復原' + #13#10 +
      'GroupB.Hint=群組' + #13#10 +
      'UngroupB.Hint=取消群組' + #13#10 +
      'ShowGridB.Hint=顯示小格子' + #13#10 +
      'AlignToGridB.Hint=與格子切齊' + #13#10 +
      'SetToGridB.Hint=Fit to Grid' + #13#10 +
      'ScaleCB.Hint=顯示比率' + #13#10 +
      'ExtraToolsTB.Caption=額外工具' + #13#10 +
      'ObjectSelectB.Hint=選取工具' + #13#10 +
      'HandToolB.Hint=徒手工具' + #13#10 +
      'ZoomToolB.Hint=顯示比率工具' + #13#10 +
      'TextToolB.Hint=編輯文字工具' + #13#10 +
      'FormatToolB.Hint=複製格式工具' + #13#10 +
      'ObjectBandB.Hint=插入Band' + #13#10 +
      'FileMenu.Caption=檔案(&F)' + #13#10 +
      'EditMenu.Caption=編輯(&E)' + #13#10 +
      'FindMI.Caption=尋找...' + #13#10 +
      'FindNextMI.Caption=找下一個' + #13#10 +
      'ReplaceMI.Caption=取代...' + #13#10 +
      'ReportMenu.Caption=報表(&R)' + #13#10 +
      'ReportDataMI.Caption=資料...' + #13#10 +
      'ReportSettingsMI.Caption=選項...' + #13#10 +
      'ReportStylesMI.Caption=樣式...' + #13#10 +
      'ViewMenu.Caption=檢視(&V)' + #13#10 +
      'ToolbarsMI.Caption=工具列' + #13#10 +
      'StandardMI.Caption=標準' + #13#10 +
      'TextMI.Caption=文字' + #13#10 +
      'FrameMI.Caption=外框' + #13#10 +
      'AlignmentMI.Caption=對齊盤' + #13#10 +
      'ToolsMI.Caption=額外工具' + #13#10 +
      'InspectorMI.Caption=物件檢視器' + #13#10 +
      'DataTreeMI.Caption=資料樹' + #13#10 +
      'ReportTreeMI.Caption=報表樹' + #13#10 +
      'ShowRulersMI.Caption=尺規' + #13#10 +
      'ShowGuidesMI.Caption=導線' + #13#10 +
      'DeleteGuidesMI.Caption=刪除導線' + #13#10 +
      'OptionsMI.Caption=選項...' + #13#10 +
      'HelpMenu.Caption=說明(&H)' + #13#10 +
      'HelpContentsMI.Caption=內容...' + #13#10 +
      'AboutMI.Caption=關於 FastReport...' + #13#10 +
      'TabOrderMI.Caption=Tab 次序...' + #13#10 +
      'UndoCmd.Caption=復原' + #13#10 +
      'RedoCmd.Caption=取消復原' + #13#10 +
      'CutCmd.Caption=剪下' + #13#10 +
      'CopyCmd.Caption=複製' + #13#10 +
      'PasteCmd.Caption=貼上' + #13#10 +
      'GroupCmd.Caption=群組' + #13#10 +
      'UngroupCmd.Caption=取消群組' + #13#10 +
      'DeleteCmd.Caption=刪除' + #13#10 +
      'DeletePageCmd.Caption=刪除頁' + #13#10 +
      'SelectAllCmd.Caption=全選' + #13#10 +
      'EditCmd.Caption=編輯...' + #13#10 +
      'BringToFrontCmd.Caption=提升至上一層' + #13#10 +
      'SendToBackCmd.Caption=送至下一層' + #13#10 +
      'NewItemCmd.Caption=新...' + #13#10 +
      'NewReportCmd.Caption=新報表' + #13#10 +
      'NewPageCmd.Caption=新頁面' + #13#10 +
      'NewDialogCmd.Caption=新對話視窗' + #13#10 +
      'OpenCmd.Caption=開啟...' + #13#10 +
      'SaveCmd.Caption=儲存' + #13#10 +
      'SaveAsCmd.Caption=另存新檔...' + #13#10 +
      'VariablesCmd.Caption=變數...' + #13#10 +
      'PageSettingsCmd.Caption=頁面設定...' + #13#10 +
      'PreviewCmd.Caption=預覽' + #13#10 +
      'ExitCmd.Caption=離開' + #13#10 +
      'ReportTitleMI.Caption=報表抬頭' + #13#10 +
      'ReportSummaryMI.Caption=報表合計' + #13#10 +
      'PageHeaderMI.Caption=頁首' + #13#10 +
      'PageFooterMI.Caption=頁尾' + #13#10 +
      'HeaderMI.Caption=頭' + #13#10 +
      'FooterMI.Caption=尾' + #13#10 +
      'MasterDataMI.Caption=主資料' + #13#10 +
      'DetailDataMI.Caption=明細資料' + #13#10 +
      'SubdetailDataMI.Caption=子明性資料' + #13#10 +
      'Data4levelMI.Caption=第4階資料' + #13#10 +
      'Data5levelMI.Caption=第5階資料' + #13#10 +
      'Data6levelMI.Caption=第6階資料' + #13#10 +
      'GroupHeaderMI.Caption=群組首' + #13#10 +
      'GroupFooterMI.Caption=群組尾' + #13#10 +
      'ChildMI.Caption=子' + #13#10 +
      'ColumnHeaderMI.Caption=欄首' + #13#10 +
      'ColumnFooterMI.Caption=欄尾' + #13#10 +
      'OverlayMI.Caption=重疊' + #13#10 +
      'VerticalbandsMI.Caption=垂直Band' + #13#10 +
      'HeaderMI1.Caption=頭' + #13#10 +
      'FooterMI1.Caption=尾' + #13#10 +
      'MasterDataMI1.Caption=主資料' + #13#10 +
      'DetailDataMI1.Caption=明細資料' + #13#10 +
      'SubdetailDataMI1.Caption=子明細資料' + #13#10 +
      'GroupHeaderMI1.Caption=群組首' + #13#10 +
      'GroupFooterMI1.Caption=群組尾' + #13#10 +
      'ChildMI1.Caption=子' + #13#10 +
      'R0MI.Caption=0度' + #13#10 +
      'R45MI.Caption=45度' + #13#10 +
      'R90MI.Caption=90度' + #13#10 +
      'R180MI.Caption=180度' + #13#10 +
      'R270MI.Caption=270度' + #13#10 +
      'FontB.Hint=字型設定' + #13#10 +
      'BoldMI.Caption=粗體' + #13#10 +
      'ItalicMI.Caption=斜體' + #13#10 +
      'UnderlineMI.Caption=底線' + #13#10 +
      'SuperScriptMI.Caption=SuperScript' + #13#10 +
      'SubScriptMI.Caption=SubScript' + #13#10 +
      'CondensedMI.Caption=壓縮' + #13#10 +
      'WideMI.Caption=寬' + #13#10 +
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
    Add('dsSavePreviewChanges', '儲存變更至預覽頁面?');
    Add('dsSaveChangesTo', '儲存修改至 ');
    Add('dsCantLoad', '無法載入檔案');
    Add('dsStyleFile', '樣式');
    Add('dsCantFindProc', '找不到主程序');
    Add('dsClearScript', '清除所有的腳本，你要繼續嗎?');
    Add('dsNoStyle', '沒有樣式');
    Add('dsStyleSample', '樣式範例');
    Add('dsTextNotFound', '文字 ''%s'' 找不到');
    Add('dsReplace', '取代文字 ''%s''?');

    Add('TfrxAboutForm',
      'Caption=關於 FastReport' + #13#10 +
      'Label4.Caption=拜訪我們的網站以取得更多的資訊:' + #13#10 +
      'Label6.Caption=銷售:' + #13#10 +
      'Label8.Caption=支援:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=頁面選項' + #13#10 +
      'OKB.Caption=確認' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'TabSheet1.Caption=紙張' + #13#10 +
      'Label1.Caption=寬度' + #13#10 +
      'Label2.Caption=高度' + #13#10 +
      'Label11.Caption=大小   ' + #13#10 +
      'Label12.Caption=方向   ' + #13#10 +
      'Label3.Caption=左' + #13#10 +
      'Label4.Caption=上' + #13#10 +
      'Label5.Caption=右' + #13#10 +
      'Label6.Caption=下' + #13#10 +
      'Label13.Caption=邊界   ' + #13#10 +
      'Label14.Caption=紙張來源   ' + #13#10 +
      'Label9.Caption=第一頁' + #13#10 +
      'Label10.Caption=其他頁' + #13#10 +
      'PortraitRB.Caption=直印' + #13#10 +
      'LandscapeRB.Caption=橫印' + #13#10 +
      'TabSheet3.Caption=其他選項' + #13#10 +
      'Label7.Caption=Columns   ' + #13#10 +
      'Label8.Caption=Number' + #13#10 +
      'Label15.Caption=寬' + #13#10 +
      'Label16.Caption=位置' + #13#10 +
      'Label17.Caption=其他   ' + #13#10 +
      'Label18.Caption=雙面列印' + #13#10 +
      'PrintOnPrevCB.Caption=列印至前一頁' + #13#10 +
      'MirrorMarginsCB.Caption=鏡射邊界' + #13#10 +
      'LargeHeightCB.Caption=在設計模式使用大的紙張高度' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=選取報表資料集' + #13#10 +
      'OKB.Caption=確認' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=編輯變數' + #13#10 +
      'NewCategoryB.Caption=Category' + #13#10 +
      'NewVarB.Caption=變數' + #13#10 +
      'EditB.Caption=編輯' + #13#10 +
      'DeleteB.Caption=刪除' + #13#10 +
      'EditListB.Caption=清單' + #13#10 +
      'LoadB.Caption=載入' + #13#10 +
      'SaveB.Caption=儲存' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'OkB.Caption=確認' + #13#10 +
      'ExprPanel.Caption= 運算式:' + #13#10 +
      'OpenDialog1.Filter=Dictionary (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Dictionary (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(未定義變數)');
    Add('vaVar', '變數');
    Add('vaDupName', '名稱重複');

    Add('TfrxOptionsEditor',
      'Caption=設計選項' + #13#10 +
      'Label1.Caption=格子   ' + #13#10 +
      'Label2.Caption=型態' + #13#10 +
      'Label3.Caption=大小' + #13#10 +
      'Label4.Caption=對話視窗:' + #13#10 +
      'Label5.Caption=其他   ' + #13#10 +
      'Label6.Caption=字型   ' + #13#10 +
      'Label7.Caption=程式碼視窗' + #13#10 +
      'Label8.Caption=文字編輯器' + #13#10 +
      'Label9.Caption=大小' + #13#10 +
      'Label10.Caption=大小' + #13#10 +
      'Label11.Caption=顏色   ' + #13#10 +
      'Label12.Caption=間距:' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=in' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=確認' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'CMRB.Caption=公分:' + #13#10 +
      'InchesRB.Caption=英吋:' + #13#10 +
      'PixelsRB.Caption=像素:' + #13#10 +
      'ShowGridCB.Caption=顯示格子' + #13#10 +
      'AlignGridCB.Caption=與格子切齊' + #13#10 +
      'EditAfterInsCB.Caption=插入後顯示編輯器' + #13#10 +
      'ObjectFontCB.Caption=使用物件的字型設定' + #13#10 +
      'WorkspaceB.Caption=工作空間' + #13#10 +
      'ToolB.Caption=工具視窗' + #13#10 +
      'LCDCB.Caption=LCD 格子顏色' + #13#10 +
      'FreeBandsCB.Caption=自由擺設Band的位置' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=回存預設值' + #13#10 +
      'BandsCaptionsCB.Caption=顯示Band的標題' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=選取資料集' + #13#10 +
      'OkB.Caption=確認' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      '');
    Add('dbNotAssigned', '[未指定]');
    Add('dbSingleLine', '單筆');

    Add('TfrxGroupEditorForm',
      'Caption=群組' + #13#10 +
      'BreakOnL.Caption=群組分隔於   ' + #13#10 +
      'OptionsL.Caption=選項   ' + #13#10 +
      'OKB.Caption=確認' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'DataFieldRB.Caption=資料欄位' + #13#10 +
      'ExpressionRB.Caption=運算式' + #13#10 +
      'KeepGroupTogetherCB.Caption=保持與群組在一起' + #13#10 +
      'StartNewPageCB.Caption=換頁' + #13#10 +
      'OutlineCB.Caption=顯示在大綱' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=系統備忘' + #13#10 +
      'DataBandL.Caption=資料band' + #13#10 +
      'DataSetL.Caption=資料集' + #13#10 +
      'DataFieldL.Caption=資料欄位' + #13#10 +
      'FunctionL.Caption=函數' + #13#10 +
      'ExpressionL.Caption=表示式' + #13#10 +
      'OKB.Caption=確認' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'AggregateRB.Caption=Aggregate value' + #13#10 +
      'SysVariableRB.Caption=系統變數' + #13#10 +
      'CountInvisibleCB.Caption=計算不可見band的數目' + #13#10 +
      'TextRB.Caption=文字' + #13#10 +
      'RunningTotalCB.Caption=執行總數' + #13#10 +
      '');
    Add('agAggregate', '插入合計');
    Add('vt1', '[DATE]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGES#]');
    Add('vt5', '[PAGE#] of [TOTALPAGES#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=OLE 物件' + #13#10 +
      'InsertB.Caption=插入...' + #13#10 +
      'EditB.Caption=編輯...' + #13#10 +
      'CloseB.Caption=關閉' + #13#10 +
      '');
    Add('olStretched', 'Stretched');

    Add('TfrxBarcodeEditorForm',
      'Caption=條碼編輯器' + #13#10 +
      'CodeLbl.Caption=碼' + #13#10 +
      'TypeLbl.Caption=條碼類型' + #13#10 +
      'ZoomLbl.Caption=比率:' + #13#10 +
      'OptionsLbl.Caption=選項   ' + #13#10 +
      'RotationLbl.Caption=旋轉   ' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'OkB.Caption=確認' + #13#10 +
      'CalcCheckSumCB.Caption=計算檢查碼 ' + #13#10 +
      'ViewTextCB.Caption=文字' + #13#10 +
      'Rotation0RB.Caption=0度' + #13#10 +
      'Rotation90RB.Caption=90度' + #13#10 +
      'Rotation180RB.Caption=180度' + #13#10 +
      'Rotation270RB.Caption=270度' + #13#10 +
      '');
    Add('bcCalcChecksum', '計算檢查碼');
    Add('bcShowText', '顯示文字');

    Add('TfrxAliasesEditorForm',
      'Caption=編輯別名' + #13#10 +
      'HintL.Caption=按 Enter 編輯項目' + #13#10 +
      'DSAliasL.Caption=資料集別名' + #13#10 +
      'FieldAliasesL.Caption=欄位別名' + #13#10 +
      'OkB.Caption=確認' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'ResetB.Caption=重置' + #13#10 +
      'UpdateB.Caption=Update' + #13#10 +
      '');
    Add('alUserName', '使用者名稱');
    Add('alOriginal', '原來的名稱');

    Add('TfrxParamsEditorForm',
      'Caption=參數編輯器' + #13#10 +
      'OkB.Caption=確認' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      '');
    Add('qpName', '名稱');
    Add('qpDataType', '資料型態');
    Add('qpValue', '值');

    Add('TfrxMDEditorForm',
      'Caption=Master-Detail 連結' + #13#10 +
      'Label1.Caption=Detail 欄位' + #13#10 +
      'Label2.Caption=Master 欄位' + #13#10 +
      'Label3.Caption=Linked 欄位' + #13#10 +
      'AddB.Caption=新增' + #13#10 +
      'ClearB.Caption=清除' + #13#10 +
      'OkB.Caption=確認' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=備忘' + #13#10 +
      'ExprB.Hint=插入運算式' + #13#10 +
      'AggregateB.Hint=插入合計' + #13#10 +
      'LocalFormatB.Hint=插入輸出格式' + #13#10 +
      'WordWrapB.Hint=文字自動換行' + #13#10 +
      'CancelB.Hint=取消' + #13#10 +
      'OkB.Hint=確定' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=圖像' + #13#10 +
      'LoadB.Hint=載入' + #13#10 +
      'CopyB.Hint=複製' + #13#10 +
      'PasteB.Hint=貼上' + #13#10 +
      'ClearB.Hint=清除' + #13#10 +
      'CancelB.Hint=取消' + #13#10 +
      'OkB.Hint=確認' + #13#10 +
      '');
    Add('piEmpty', '清空');

    Add('TfrxChartEditorForm',
      'Caption=統計圖編輯器' + #13#10 +
      'OkB.Caption=確認' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=新增系列' + #13#10 +
      'DeleteB.Hint=刪除系列' + #13#10 +
      'DBSourceRB.Caption=資料來自資料庫' + #13#10 +
      'FixedDataRB.Caption=固定資料' + #13#10 +
      'DatasetLbl.Caption=資料集' + #13#10 +
      'X1Lbl.Caption=X 值' + #13#10 +
      'Y1Lbl.Caption=Y 值' + #13#10 +
      'X3Lbl.Caption=X 值 (例如, a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Y 值 (例如, 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=其他選項   ' + #13#10 +
      'ShowTopLbl.Caption=前N名的值' + #13#10 +
      'CaptionLbl.Caption=前N名的標題' + #13#10 +
      'SortLbl.Caption=排列順序' + #13#10 +
      'LineMI.Caption=Line' + #13#10 +
      'AreaMI.Caption=Area' + #13#10 +
      'PointMI.Caption=Point' + #13#10 +
      'BarMI.Caption=Bar' + #13#10 +
      'HorizBarMI.Caption=Horiz. Bar' + #13#10 +
      'PieMI.Caption=Pie' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Fast Line' + #13#10 +
      '');
    Add('ch3D', '3D 檢視');
    Add('chAxis', '顯示軸');
    Add('chsoNone', '無');
    Add('chsoAscending', '遞增');
    Add('chsoDescending', '遞減');

    Add('TfrxRichEditorForm',
      'Caption=RTF 文件編輯器' + #13#10 +
      'OpenB.Hint=開啟檔案' + #13#10 +
      'SaveB.Hint=儲存檔案' + #13#10 +
      'UndoB.Hint=復原' + #13#10 +
      'TTB.Hint=字型' + #13#10 +
      'ExprB.Hint=插入運算式' + #13#10 +
      'CancelB.Hint=取消' + #13#10 +
      'OkB.Hint=確認' + #13#10 +
      'BoldB.Hint=粗體' + #13#10 +
      'ItalicB.Hint=斜體' + #13#10 +
      'UnderlineB.Hint=底線' + #13#10 +
      'LeftAlignB.Hint=左靠' + #13#10 +
      'CenterAlignB.Hint=置中' + #13#10 +
      'RightAlignB.Hint=右靠' + #13#10 +
      'BlockAlignB.Hint=區塊切齊' + #13#10 +
      'BulletsB.Hint=著重號' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=交叉報表編輯器' + #13#10 +
      'DatasetL.Caption=來源資料   ' + #13#10 +
      'DimensionsL.Caption=空間   ' + #13#10 +
      'RowsL.Caption=列' + #13#10 +
      'ColumnsL.Caption=欄' + #13#10 +
      'CellsL.Caption=小方格' + #13#10 +
      'StructureL.Caption=交叉報表結構   ' + #13#10 +
      'RowHeaderCB.Caption=列首' + #13#10 +
      'ColumnHeaderCB.Caption=欄首' + #13#10 +
      'RowTotalCB.Caption=列總計' + #13#10 +
      'ColumnTotalCB.Caption=欄總計' + #13#10 +
      'SwapB.Hint=列/欄互換' + #13#10 +
      'StyleCB.Hint=交叉報表樣式' + #13#10 +
      'FontB.Hint=字型設定' + #13#10 +
      'AlignLeftB.Hint=左邊切齊' + #13#10 +
      'AlignCenterB.Hint=中間切齊' + #13#10 +
      'AlignRightB.Hint=右邊切齊' + #13#10 +
      'RotationB.Hint=文字旋轉' + #13#10 +
      'HighlightB.Hint=突顯' + #13#10 +
      'FormatB.Hint=格式' + #13#10 +
      'FrameB.Hint=外框設定' + #13#10 +
      'FillColorB.Hint=填顏色' + #13#10 +
      'Func1MI.Caption=無' + #13#10 +
      'Func2MI.Caption=合計' + #13#10 +
      'Func3MI.Caption=最小值' + #13#10 +
      'Func4MI.Caption=最大值' + #13#10 +
      'Func5MI.Caption=平均值' + #13#10 +
      'Func6MI.Caption=計數' + #13#10 +
      'Sort1MI.Caption=遞增 (A-Z)' + #13#10 +
      'Sort2MI.Caption=遞減 (Z-A)' + #13#10 +
      'Sort3MI.Caption=不排序' + #13#10 +
      'BoldMI.Caption=粗體' + #13#10 +
      'ItalicMI.Caption=斜體' + #13#10 +
      'UnderlineMI.Caption=底線' + #13#10 +
      'SuperScriptMI.Caption=上標' + #13#10 +
      'SubScriptMI.Caption=下標' + #13#10 +
      'CondensedMI.Caption=壓縮' + #13#10 +
      'WideMI.Caption=寬' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=取消' + #13#10 +
      'OkB.Hint=確認' + #13#10 +
      '');
    Add('crSubtotal', '小計');
    Add('crNone', '無');
    Add('crSum', '合計');
    Add('crMin', '最小值');
    Add('crMax', '最大值');
    Add('crAvg', '平均值');
    Add('crCount', '計數');
    Add('crAsc', 'A-Z');
    Add('crDesc', 'Z-A');
    Add('crFillMx', '填入交叉報表中...');
    Add('crBuildMx', '建立交叉報表中...');
    Add('crRepHdrs', '重新列印表頭');
    Add('crBorder', '外框');
    Add('crDown', '由上而下，由左至右');

    Add('TfrxExprEditorForm',
      'Caption=運算式編輯器' + #13#10 +
      'ExprL.Caption=運算式:' + #13#10 +
      'OkB.Caption=確認' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=顯示格式' + #13#10 +
      'CategoryL.Caption=類別' + #13#10 +
      'FormatL.Caption=格式' + #13#10 +
      'FormatStrL.Caption=格式字串:' + #13#10 +
      'SeparatorL.Caption=小數點分隔字元:' + #13#10 +
      'OkB.Caption=確認' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      '');
    Add('fkText', '文字 (未格式化)');
    Add('fkNumber', '數字');
    Add('fkDateTime', '日期/時間');
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
      'Caption=突顯' + #13#10 +
      'FontColorB.Caption=顏色...' + #13#10 +
      'BackColorB.Caption=顏色...' + #13#10 +
      'ConditionL.Caption=條件   ' + #13#10 +
      'FontL.Caption=字型   ' + #13#10 +
      'BackgroundL.Caption=背景   ' + #13#10 +
      'OKB.Caption=確認' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'BoldCB.Caption=粗體' + #13#10 +
      'ItalicCB.Caption=斜體' + #13#10 +
      'UnderlineCB.Caption=底線' + #13#10 +
      'TransparentRB.Caption=透明' + #13#10 +
      'OtherRB.Caption=其他' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=報表設定' + #13#10 +
      'OkB.Caption=確認' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'GeneralTS.Caption=General' + #13#10 +
      'ReportSettingsL.Caption=印表機設定   ' + #13#10 +
      'CopiesL.Caption=列印份數' + #13#10 +
      'GeneralL.Caption=General   ' + #13#10 +
      'PasswordL.Caption=密碼' + #13#10 +
      'CollateCB.Caption=Collate copies' + #13#10 +
      'DoublePassCB.Caption=Double pass' + #13#10 +
      'PrintIfEmptyCB.Caption=Print if empty' + #13#10 +
      'DescriptionTS.Caption=描述' + #13#10 +
      'NameL.Caption=名稱' + #13#10 +
      'Description1L.Caption=描述' + #13#10 +
      'PictureL.Caption=圖像' + #13#10 +
      'AuthorL.Caption=作者' + #13#10 +
      'MajorL.Caption=Major' + #13#10 +
      'MinorL.Caption=Minor' + #13#10 +
      'ReleaseL.Caption=Release' + #13#10 +
      'BuildL.Caption=Build' + #13#10 +
      'CreatedL.Caption=建立' + #13#10 +
      'ModifiedL.Caption=修改' + #13#10 +
      'DescriptionL.Caption=描述   ' + #13#10 +
      'VersionL.Caption=版本   ' + #13#10 +
      'PictureB.Caption=瀏覽...' + #13#10 +
      '');
    Add('rePrnOnPort', '在');

    Add('TfrxStringsEditorForm',
      'Caption=字串清單' + #13#10 +
      'CancelB.Hint=取消' + #13#10 +
      'OkB.Hint=確認' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=取消' + #13#10 +
      'OkB.Hint=確認' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=密碼' + #13#10 +
      'PasswordL.Caption=輸入密碼:' + #13#10 +
      'OkB.Caption=確認' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=樣式編輯器' + #13#10 +
      'ColorB.Caption=顏色...' + #13#10 +
      'FontB.Caption=字型...' + #13#10 +
      'FrameB.Caption=外框...' + #13#10 +
      'AddB.Hint=加入' + #13#10 +
      'DeleteB.Hint=刪除' + #13#10 +
      'EditB.Hint=編輯' + #13#10 +
      'LoadB.Hint=載入' + #13#10 +
      'SaveB.Hint=儲存' + #13#10 +
      'CancelB.Hint=取消' + #13#10 +
      'OkB.Hint=確認' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=外框編輯器' + #13#10 +
      'FrameL.Caption=外框' + #13#10 +
      'LineL.Caption=框線' + #13#10 +
      'ShadowL.Caption=陰影' + #13#10 +
      'FrameTopB.Hint=上線' + #13#10 +
      'FrameBottomB.Hint=底線' + #13#10 +
      'FrameLeftB.Hint=左線' + #13#10 +
      'FrameRightB.Hint=右線' + #13#10 +
      'FrameAllB.Hint=外框線' + #13#10 +
      'FrameNoB.Hint=無框線' + #13#10 +
      'FrameColorB.Hint=外框顏色' + #13#10 +
      'FrameStyleB.Hint=外框樣式' + #13#10 +
      'FrameWidthCB.Hint=外框寬度' + #13#10 +
      'ShadowB.Hint=陰影' + #13#10 +
      'ShadowColorB.Hint=陰影顏色' + #13#10 +
      'ShadowWidthCB.Hint=陰影寬度' + #13#10 +
      'OkB.Caption=確認' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=新項目' + #13#10 +
      'ItemsTab.Caption=項目' + #13#10 +
      'TemplatesTab.Caption=樣板' + #13#10 +
      'OkB.Caption=確認' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Tab鍵次序' + #13#10 +
      'Label1.Caption=控制項的Tab鍵次序:' + #13#10 +
      'OkB.Caption=確認' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'UpB.Caption=上移' + #13#10 +
      'DownB.Caption=下移' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=求值' + #13#10 +
      'Label1.Caption=運算式' + #13#10 +
      'Label2.Caption=結果' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=報表精靈' + #13#10 +
      'DataTab.Caption=資料' + #13#10 +
      'GroupsTab.Caption=群組' + #13#10 +
      'LayoutTab.Caption=格式' + #13#10 +
      'StyleTab.Caption=樣式' + #13#10 +
      'Step1L.Caption=Step 1. 選取要顯示的資料集及欄位.' + #13#10 +
      'Step2L.Caption=Step 2. 建立群組 (選項).' + #13#10 +
      'Step3L.Caption=Step 3. 定義頁面方向及資料格式.' + #13#10 +
      'Step4L.Caption=Step 4. 選擇報表樣式.' + #13#10 +
      'AddFieldB.Caption=加入 >' + #13#10 +
      'AddAllFieldsB.Caption=全部加入 >>' + #13#10 +
      'RemoveFieldB.Caption=< 移除' + #13#10 +
      'RemoveAllFieldsB.Caption=<< 全部移除' + #13#10 +
      'AddGroupB.Caption=加入 >' + #13#10 +
      'RemoveGroupB.Caption=< 移除' + #13#10 +
      'SelectedFieldsL.Caption=選取的欄位:' + #13#10 +
      'AvailableFieldsL.Caption=可用的欄位:' + #13#10 +
      'GroupsL.Caption=群組:' + #13#10 +
      'OrientationL.Caption=方向   ' + #13#10 +
      'LayoutL.Caption=格式   ' + #13#10 +
      'PortraitRB.Caption=直印' + #13#10 +
      'LandscapeRB.Caption=橫印' + #13#10 +
      'TabularRB.Caption=Tabular' + #13#10 +
      'ColumnarRB.Caption=Columnar' + #13#10 +
      'FitWidthCB.Caption=調整欄位至頁面寬度' + #13#10 +
      'CancelB.Caption=取消' + #13#10 +
      'BackB.Caption=<< 上一步' + #13#10 +
      'NextB.Caption=下一步 >>' + #13#10 +
      'FinishB.Caption=完成' + #13#10 +
      '');
    Add('wzStd', '標準報表精靈');
    Add('wzDMP', '點矩陣報表精靈');
    Add('wzStdEmpty', '標準報表');
    Add('wzDMPEmpty', '點矩陣報表');


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

    Add('ctAggregate', 'Aggregate');
    Add('Sum', 'Calculates the sum of the Expr for the Band datarow');
    Add('Avg', 'Calculates the average of the Expr for the Band datarow');
    Add('Min', 'Calculates the minimum of the Expr for the Band datarow');
    Add('Max', 'Calculates the maximum of the Expr for the Band datarow');
    Add('Count', 'Calculates the number of datarows');
  end;
end;


initialization
  frAddDesignerRes;

end.