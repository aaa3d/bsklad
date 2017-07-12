
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

unit frxrcInsp;

interface

procedure frAddInspectorRes;


implementation

uses frxRes;


procedure frAddInspectorRes;
begin
  with frxResources do
  begin
    Add('propActive', '設定是否開啟資料集(DataSet)。');
    Add('propActive.TfrxHighlight', '是否啟動 highlight 功能。');
    Add('propAliasName', 'BDE 別名(alias)。');
    Add('propAlign', '決定物件與Band或page切齊。');
    Add('propAlignment', '物件文字的切齊方式。');
    Add('propAllowAllUp', '同群組的的快速按鈕是否可同時取消選取。');
    Add('propAllowEdit', '使用者是否可以編輯預覽中的報表。');
    Add('propAllowExpressions', '決定文字物件是否可以包括運算式。');
    Add('propAllowGrayed', '允許CheckBox呈現灰色的狀態。');
    Add('propAllowHTMLTags', '決定文字物件的內容是否可使用 HTML 標籤。');
    Add('propAllowSplit', '決定頁面的內容是否可跨頁列印。');
    Add('propAuthor', '報表作者。');
    Add('propAutoSize', '決定是否自動調整圖像的大小。');
    Add('propAutoWidth', '決定是否自動調整文字的寬度。');
    Add('propBackPicture', '報表頁面的背景圖。');
    Add('propBarType', '條碼的類型。');
    Add('propBevelInner', 'bevel內部的型態。');
    Add('propBevelOuter', 'bevel外部的型態。');
    Add('propBevelWidth', 'bevel的寬度。');
    Add('propBorder', '決定是否顯示外框。');
    Add('propBorderStyle', '視窗的樣式。');
    Add('propBottomMargin', '頁面下方的邊界。');
    Add('propBrushStyle', '物件背景的畫筆樣式。');
    Add('propButtons', '設定預覽視窗顯示的按鈕。');
    Add('propCacheSize', '限制報表引擎使用快取記憶體的大小，假如使用的記憶體超出設定值，報表將自動寫入硬碟快取檔案。');
    Add('propCalcCheckSum', '自動計算條碼的檢查碼。');
    Add('propCancel', '決定當按下Esc鍵時，此按鈕恢復動作。');
    Add('propCaption', '控制項的標題。');
    Add('propCellFields', '交叉報表資料庫欄位名稱。');
    Add('propCellLevels', '交叉報表的階層數。');
    Add('propCenter', '影像置中。');
    Add('propCharset', '字元集。');
    Add('propCharSpacing', '兩個字元間的間距，以像素(Pixels)表示。。');
    Add('propCheckColor', 'CheckBox勾選狀態的顏色。');
    Add('propChecked', '控制項的勾選狀態。');
    Add('propCheckStyle', 'CheckBox勾選的樣式。');
    Add('propChild', '連接至此band的Child Band名稱。');
    Add('propCollate', '預設的輸出順序設定');
    Add('propColor.TFont', '文字的顏色。');
    Add('propColor', '物件的顏色。');
    Add('propColor.TfrxFrame', '框架(Frame)的顏色');
    Add('propColor.TfrxHighlight', '假如 highlight 屬性動作時，決定物件顯示的顏色。');
    Add('propColumnFields', '交叉報表的欄位名稱。');
    Add('propColumnGap', '欄間距');
    Add('propColumnLevels', '欄的階層數。');
    Add('propColumns', '欄的個數。');
    Add('propColumnWidth', 'Band的column寬度。');
    Add('propCondition', '群組條件，假如此運算式的值改變，群組自動改變。');
    Add('propCondition.TfrxHighlight', '運算式字串。假如運算式為真(True)，醒目的顯示上將會啟動。');
    Add('propConnected', '設定是否連接資料庫。');
    Add('propConvertNulls', '是否自動將Null轉成 0, False 或 空字串。');
    Add('propCopies', '預設報表列印份數。');
    Add('propCursor', '物件的游標。');
    Add('propDatabaseName', '資料庫名稱。');
    Add('propDataField', '抓取資料庫的欄位名稱。');
    Add('propDataSet', '連結至資料集。');
    Add('propDate', '控制項的日期值。');
    Add('propDateFormat', '日期輸出格式。');
    Add('propDecimalSeparator', '小數點的分隔字元。');
    Add('propDefault', '決定此按鈕是否為預設按鈕。');
    Add('propDefHeight', '預設列高。');
    Add('propDescription', '報表用途描述');
    Add('propDiagonal', '將線條指定為斜線。');
    Add('propDisplayFormat', '資料顯示格式。');
    Add('propDoubleBuffered', '決定預覽視窗是否使用雙緩衝區。使用雙緩衝區可防止螢幕出現閃動的情形，但是會降低執行速度。');
    Add('propDoublePass', '決定報表引擎是否執行二次處理。');
    Add('propDown', '決定按鈕是否已被按下。');
    Add('propDownThenAcross', '指定多欄式報表採由上而下，由左至右列印。');
    Add('propDriverName', 'BDE驅動程式名稱。');
    Add('propDropShadow', '決定物件是否有陰影。');
    Add('propDuplex', '雙面列印模式。');
    Add('propEditMask', '輸入編輯遮罩。');
    Add('propEnabled', '決定控制項是否可動作。');
    Add('propEngineOptions', '報表引擎的選項。');
    Add('propExpression', '物件的運算式。');
    Add('propExpressionDelimiters', '運算式的分隔字元。');
    Add('propFieldAliases', '資料集欄位的別名。');
    Add('propFilter', '資料集的過濾條件。');
    Add('propFiltered', '決定 Filter 過濾條件是否啟動。');
    Add('propFlowTo', '文字物件無法容納時，顯示至其他物件。');
    Add('propFont', '物件的字型屬性。');
    Add('propFooterAfterEach', '決定是否在每個資料列之後，跟著列印 footer band。');
    Add('propFormatStr', '輸出格式編輯字串。');
    Add('propFrame', '物件的框架屬性。');
    Add('propGapX', '文字與左邊切齊。');
    Add('propGapY', '文字與上面切齊。');
    Add('propGlyph', '控制項的影像。');
    Add('propGroupIndex', '允許快速按鈕設為同一群組。');
    Add('propHAlign', '文字水平切齊方式。');
    Add('propHeight', '物件的高度。');
    Add('propHGuides', '設計報表頁面的水平導引線。');
    Add('propHideZeros', '數字前面的 0 不顯示。');
    Add('propHighlight', 'highlight屬性的條件。');
    Add('propIndexName', '索引名稱。');
    Add('propInitString', '供點矩陣報表使用的印表機初始字串。');
    Add('propItems', '物件的清單項目');
    Add('propKeepAspectRatio', '保留影像的顯示比率');
    Add('propKeepChild', '決定Band是否與Child列印在一起');
    Add('propKeepFooter', '是否與footer列印在一起');
    Add('propKeepTogether', '決定band與subband一起列印');
    Add('propKind.TfrxFormat', '格式種類');
    Add('propKind', '按鈕類型');
    Add('propLargeDesignHeight', '設計報表頁面的最大高度');
    Add('propLayout', '按鈕圖形的格式');
    Add('propLeft', '物件的左邊座標');
    Add('propLeftMargin', '左邊界的大小');
    Add('propLines', '物件的文字');
    Add('propLineSpacing', '列距');
    Add('propLoginPrompt', '顯示登入視窗');
    Add('propMargin', '按鈕圖形與邊界的距離(像素)');
    Add('propMaster', '主資料集');
    Add('propMasterFields', '主資料與明細資料關聯的欄位');
    Add('propMaximized', '預覽視窗最大化');
    Add('propMaxLength', '文字的最大長度');
    Add('propMaxPages', '預覽報表最大的頁數');
    Add('propMaxWidth', '最大欄寬');
    Add('propMDIChild', '決定預覽視窗是否為MDI子視窗');
    Add('propMemo', '物件的文字');
    Add('propMinWidth', '欄的最小寬度');
    Add('propMirrorMargins', '鏡射頁面邊界至偶數頁');
    Add('propModal', '預覽視窗是否以Modal方式顯示');
    Add('propModalResult', 'Modal視窗關閉時傳回的值');
    Add('propName.TFont', '字型名稱');
    Add('propName.TfrxReportOptions', '報表名稱');
    Add('propName', '物件名稱');
    Add('propNumGlyphs', 'Glyph屬性內圖形的數目');
    Add('propOpenDataSource', '決定是否自動開啟資料來源');
    Add('propOrientation', '報表頁面的方向');
    Add('propOutlineText', '顯示在報表大綱物件的文字');
    Add('propOutlineVisible', '顯示預覽大綱');
    Add('propOutlineWidth', '報表大綱的寬度');
    Add('propPageNumbers.TfrxPrintOptions', '列印的頁數');
    Add('propPaperHeight', '頁的高度');
    Add('propPaperWidth', '頁的寬度');
    Add('propParagraphGap', '段落首行內縮');
    Add('propParams.TfrxBDEDatabase', 'BDE資料庫連接參數');
    Add('propParams', '查詢的參數');
    Add('propParentFont', '決定物件是否顯示上層物件的字型設定');
    Add('propPassword', '報表密碼');
    Add('propPasswordChar', '密碼欄位輸入時顯示的字元');
    Add('propPicture', '圖像');
    Add('propPicture.TfrxReportOptions', '報表圖像');
    Add('propPosition', '視窗的初始位置');
    Add('propPreviewOptions', '報表預覽選項');
    Add('propPrintable', '物件是否可列印');
    Add('propPrintChildIfInvisible', '假如parent band不列印，決定child band是否列印');
    Add('propPrinter', '報表預設的印表機名稱');
    Add('propPrintIfDetailEmpty', '假如subnband是空的，決定是否列印');
    Add('propPrintIfEmpty', '假如報表資料集是空的，決定是否繼續列印');
    Add('propPrintOnFirstPage', '決定Band是否列印在首頁');
    Add('propPrintOnLastPage', '決定Band是否列印在末頁');
    Add('propPrintOnParent', '決定子報表是否列印在上層的Band');
    Add('propPrintOnPreviousPage', '決定本頁是否可列印在上頁的剩餘空間');
    Add('propPrintOptions', '報表列印選項。');
    Add('propPrintPages', '決定列印全部的報表、奇數頁或偶數頁。');
    Add('propRangeBegin', '列印資料集的起點。');
    Add('propRangeEnd', '列印資料集的終點。');
    Add('propRangeEndCount', '決定列印筆數。');
    Add('propReadOnly', '決定文字物件是否唯讀。');
    Add('propRepeatHeaders', '決定頁首是否列印在每個新的頁面。');
    Add('propReportOptions', '報表選項。');
    Add('propReprintOnNewPage', '決定是否重新列印在下一頁');
    Add('propRestrictions', '報表限制旗標。');
    Add('propRightMargin', '右邊界。');
    Add('propRotation.TfrxBarCodeView', '條碼方向');
    Add('propRotation', '旋轉文字');
    Add('propRowCount', 'Databand的虛擬資料筆數。');
    Add('propRowFields', '交叉報表列的資料庫欄位名稱');
    Add('propRowLevels', '列階層的數目');
    Add('propRTLReading', '決定文字物件是否由右至左顯示');
    Add('propScriptLanguage', '報表內部使用的腳本語言名稱。');
    Add('propSessionName', 'BDE 連線名稱。');
    Add('propShadowColor', '陰影的顏色。');
    Add('propShadowWidth', '陰影的寬度。');
    Add('propShape', '外型的樣式');
    Add('propShiftMode', '物件變動的行為');
    Add('propShowCaptions', '決定是否顯示預覽按鈕的文字說明');
    Add('propShowColumnHeader', '決定交叉報表是否顯示欄位表頭');
    Add('propShowColumnTotal', '決定交叉報表是否顯示欄位總計');
    Add('propShowRowHeader', '決定交叉報表是否顯示列的表頭');
    Add('propShowRowTotal', '決定交叉報表是否顯示列的總計');
    Add('propShowDialog', '決定列印對話視窗是否出現在預覽視窗');
    Add('propShowText', '決定條碼物件是否顯示文字說明');
    Add('propSize', '字型大小。');
    Add('propSorted', '項目是否要排序。');
    Add('propSpacing', '文字與影像間的像素(Pixels)間距。');
    Add('propSQL', 'SQL敘述');
    Add('propStartNewPage', '在列印Band之前，先執行跳頁動作。');
    Add('propStretch', '調整圖像至物件的大小。');
    Add('propStretched', '決定物件可以伸縮。');
    Add('propStretchMode', '物件伸縮的行為。');
    Add('propStyle.TFont', '字型樣式。');
    Add('propStyle', '控制項樣式。');
    Add('propStyle.TfrxFrame', '物件的框架樣式。');
    Add('propSuppressRepeated', '刪除重複的值(重複的值不列印)。');
    Add('propTableName', '資料表名稱。');
    Add('propTag', '物件的數字標籤');
    Add('propTagStr', '物件的字串標籤。');
    Add('propText', '物件的文字。');
    Add('propTitleBeforeHeader', '決定是否在頁首前顯示報表抬頭。');
    Add('propTop', '物件上方的座標。');
    Add('propTopMargin', '頁面與紙張上緣的邊界。');
    Add('propTyp', '框架的型態。');
    Add('propUnderlines', '決定文字物件再每一列之後顯示底線。');
    Add('propURL', '物件連結的 URL 位址。');
    Add('propUserName', '資料物件的使用者名稱，此名稱將顯示於資料樹狀結構。');
    Add('propVAlign', '文字垂直切齊方式。');
    Add('propVersionBuild', '版本編號');
    Add('propVersionMajor', '版本編號, 主版本編號。');
    Add('propVersionMinor', '版本編號，次版本編號。');
    Add('propVersionRelease', '版本發行資訊。');
    Add('propVGuides', '頁面的垂直導引線。');
    Add('propVisible', '物件可見。');
    Add('propWidth', '物件寬度。');
    Add('propWidth.TfrxFrame', '框架寬度。');
    Add('propWindowState', '視窗初始狀態。');
    Add('propWordBreak', '斷字');
    Add('propWordWrap', '文字是否自動換行。');
    Add('propZoom.TfrxBarCodeView', '條碼顯示比例');
    Add('propZoom', '預覽視窗初始的顯示比例。');
    Add('propZoomMode', '預覽視窗的顯示模式。');
  end;
end;


initialization
  frAddInspectorRes;

end.
