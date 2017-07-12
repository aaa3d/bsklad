
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
    Add('propActive', 'Specifies whether or not a dataset is open');
    Add('propActive.TfrxHighlight', 'Specifies whether or not a highlight is active');
    Add('propAliasName', 'The name of the BDE alias');
    Add('propAlign', 'Determines the alignment of the object relative to band or page');
    Add('propAlignment', 'The alignment of the object''s text');
    Add('propAllowAllUp', 'Specifies whether all speed buttons in the group can be unselected at the same time');
    Add('propAllowEdit', 'Determines whether the user may edit the prepared report pages');
    Add('propAllowExpressions', 'Determines whether the text object may contain expressions inside the text');
    Add('propAllowGrayed', 'Allows grayed state of the control checkboxes');
    Add('propAllowHTMLTags', 'Determines whether the text object may contain HTML tags inside the text');
    Add('propAllowSplit', 'Determines whether the band may split its contents across pages');
    Add('propAuthor', 'The author of the report');
    Add('propAutoSize', 'Determines whether the picture should handle its size automatically');
    Add('propAutoWidth', 'Determines whether the text object should handle its width automatically');
    Add('propBackPicture', 'The background page picture');
    Add('propBarType', 'The type of the barcode');
    Add('propBevelInner', 'The type of the inner bevel');
    Add('propBevelOuter', 'The type of the outer bevel');
    Add('propBevelWidth', 'The width of the bevel');
    Add('propBorder', 'Determines whether to show outer border or not');
    Add('propBorderStyle', 'The style of the window');
    Add('propBottomMargin', 'The size of the bottom page margin');
    Add('propBrushStyle', 'The style of the brush used for object''s background');
    Add('propButtons', 'Set of buttons visible in the preview window');
    Add('propCacheSize', 'Maximum amount of the memory used by the report engine. If memory usage is exceeds this value, prepared pages will be cached to the disk file');
    Add('propCalcCheckSum', 'Determines whether the barcode should be calculate the check digit automatically');
    Add('propCancel', 'Determines whether the button should be activated when Esc key pressed');
    Add('propCaption', 'The caption of the control');
    Add('propCellFields', 'Names of DB fields represents the cross cells');
    Add('propCellLevels', 'Number of cell levels');
    Add('propCenter', 'Determines whether the image should be centered inside the control');
    Add('propCharset', 'The font charset');
    Add('propCharSpacing', 'Amount of pixels between two characters');
    Add('propCheckColor', 'The color of the check mark');
    Add('propChecked', 'Indicates whether the control is checked');
    Add('propCheckStyle', 'The style of the check mark');
    Add('propChild', 'Child band connected to this band');
    Add('propCollate', 'Default setting of collation');
    Add('propColor.TFont', 'The color of the text');
    Add('propColor', 'The color of the object');
    Add('propColor.TfrxFrame', 'The color of the frame');
    Add('propColor.TfrxHighlight', 'Determines the color of the object if highlight is active');
    Add('propColumnFields', 'Names of DB fields represents the cross columns');
    Add('propColumnGap', 'The gap between band columns');
    Add('propColumnLevels', 'Number of column levels');
    Add('propColumns', 'Number of columns in the band');
    Add('propColumnWidth', 'The width of the band column');
    Add('propCondition', 'The grouping condition. The group will break if value of this expression changed');
    Add('propCondition.TfrxHighlight', 'Expression string. If this expression is True, the highlight will be active');
    Add('propConnected', 'Indicates whether the database connection is active');
    Add('propConvertNulls', 'Determines whether null DB values will converted to 0, False or empty string');
    Add('propCopies', 'The default number of copies');
    Add('propCursor', 'The cursor of the object');
    Add('propDatabaseName', 'The name of the database');
    Add('propDataField', 'Specifies the field from which the object gets data');
    Add('propDataSet', 'Links the object to the dataset that contains the field it represents');
    Add('propDate', 'The date value of the control');
    Add('propDateFormat', 'Specifies format in which the date is presented');
    Add('propDecimalSeparator', 'The decimal separator');
    Add('propDefault', 'Determines whether the button is the default button');
    Add('propDefHeight', 'Default height of the row');
    Add('propDescription', 'The report description');
    Add('propDiagonal', 'Indicates that the line is diagonal');
    Add('propDisplayFormat', 'The format of the displayed value');
    Add('propDoubleBuffered', 'Determines whether the preview window uses double buffering. Enabled double buffering prevents flickering, but is slower');
    Add('propDoublePass', 'Determines whether the report engine should perform the second pass');
    Add('propDown', 'Determines whether the speed button is pressed or not');
    Add('propDownThenAcross', 'Determines how the large cross table will be splitted across pages');
    Add('propDriverName', 'The name of the BDE driver');
    Add('propDropShadow', 'Determines whether the objects has a shadow');
    Add('propDuplex', 'Specifies the duplex mode for the page');
    Add('propEditMask', 'Specifies the mask that represents what text is valid for the masked edit control');
    Add('propEnabled', 'Determines whether the control is enabled');
    Add('propEngineOptions', 'The engine options of the report');
    Add('propExpression', 'Value of this expression will be shown in the object');
    Add('propExpressionDelimiters', 'The characters that will be used for enclosing the expressions contained in the text');
    Add('propFieldAliases', 'The dataset field''s aliases');
    Add('propFilter', 'The filtering condition for the dataset');
    Add('propFiltered', 'Determines whether the dataset should filter the records using the condition in the Filter property');
    Add('propFlowTo', 'The text object that will show the text that not fit in the object');
    Add('propFont', 'The font attributes of the object');
    Add('propFooterAfterEach', 'Determines whether the footer band should be shown after each data row');
    Add('propFormatStr', 'The formatting string');
    Add('propFrame', 'The frame attributes of the object');
    Add('propGapX', 'The left indent of the text');
    Add('propGapY', 'The top indent of the text');
    Add('propGlyph', 'The image of the control');
    Add('propGroupIndex', 'Allows speed buttons to work together as a group');
    Add('propHAlign', 'The horizontal alignment of the text');
    Add('propHeight', 'The height of the object');
    Add('propHGuides', 'The horizontal guidelines of the page');
    Add('propHideZeros', 'Determines whether the text object will hide the zero values');
    Add('propHighlight', 'The conditional highlight attributes');
    Add('propIndexName', 'The name of the index');
    Add('propInitString', 'Printer init string for dot-matrix reports');
    Add('propItems', 'List items of the object');
    Add('propKeepAspectRatio', 'Keep the original aspect ratio of the image');
    Add('propKeepChild', 'Determines whether the band will be printed together with its child');
    Add('propKeepFooter', 'Determines whether the band will be printed together with its footer');
    Add('propKeepHeader', 'Determines whether the band will be printed together with its header');
    Add('propKeepTogether', 'Determines whether the band will be printed together with all its subbands');
    Add('propKind.TfrxFormat', 'The kind of formatting');
    Add('propKind', 'The kind of the button');
    Add('propLargeDesignHeight', 'Determines whether the page will have large height in the design mode');
    Add('propLayout', 'The layout of the button glyph');
    Add('propLeft', 'The left coordinate of the object');
    Add('propLeftMargin', 'The size of the left page margin');
    Add('propLines', 'The text of the object');
    Add('propLineSpacing', 'The amount of pixels between two lines of text');
    Add('propLoginPrompt', 'Determines whether to show the login dialog');
    Add('propMargin', 'Determines the number of pixels between the edge of the image and the edge of the button');
    Add('propMaster', 'The master dataset');
    Add('propMasterFields', 'The fields linked by master-detail relationship');
    Add('propMaximized', 'Determines whether the preview window will be maximized');
    Add('propMaxLength', 'Max length of the text');
    Add('propMaxPages', 'Max number of pages in the prepared report');
    Add('propMaxWidth', 'Max width of the column');
    Add('propMDIChild', 'Determines whether the preview window will be MDI child');
    Add('propMemo', 'The text of the object');
    Add('propMinWidth', 'Min width of the column');
    Add('propMirrorMargins', 'Mirror the page margins on the even pages');
    Add('propModal', 'Determines whether the preview window will be shown modally');
    Add('propModalResult', 'Determines whether and how the button closes its modal form');
    Add('propName.TFont', 'The name of the font');
    Add('propName.TfrxReportOptions', 'The name of the report');
    Add('propName', 'The name of the object');
    Add('propNumGlyphs', 'Indicates the number of images that are in the graphic specified in the Glyph property');
    Add('propOpenDataSource', 'Determines whether to open datasource automatically or not');
    Add('propOrientation', 'The orientation of the page');
    Add('propOutlineText', 'The text that will be shown in the preview outline control');
    Add('propOutlineVisible', 'The visibility of the preview outline control');
    Add('propOutlineWidth', 'The width of the preview outline control');
    Add('propPageNumbers.TfrxPrintOptions', 'The numbers of the pages to be printed');
    Add('propPaperHeight', 'The height of the page');
    Add('propPaperWidth', 'The width of the page');
    Add('propParagraphGap', 'The indent of the first line of paragraph');
    Add('propParams.TfrxBDEDatabase', 'The parameters of the connection');
    Add('propParams', 'The parameters of the query');
    Add('propParentFont', 'Determines whether the object will use parent''s font');
    Add('propPassword', 'The report password');
    Add('propPasswordChar', 'Indicates the character, if any, to display in place of the actual characters typed in the control');
    Add('propPicture', 'The picture');
    Add('propPicture.TfrxReportOptions', 'The description picture of the report');
    Add('propPosition', 'The initial position of the window');
    Add('propPreviewOptions', 'The preview options of the report');
    Add('propPrintable', 'Printability of the object. Objects with the Printable=False will be previewed, but not printed');
    Add('propPrintChildIfInvisible', 'Determines whether the child band will be printed if its parent band is invisible');
    Add('propPrinter', 'The name of the printer that will be selected when open or run this report');
    Add('propPrintIfDetailEmpty', 'Determines whether the databand will be printed if its subband is empty');
    Add('propPrintIfEmpty', 'Determines whether the page will be printed if all its datasets are empty');
    Add('propPrintOnFirstPage', 'Determines whether the band will be printed on the first page');
    Add('propPrintOnLastPage', 'Determines whether the band will be printed on the last page');
    Add('propPrintOnParent', 'Determines whether the subreport can print itself on parent band');
    Add('propPrintOnPreviousPage', 'Determines whether the page can be generated on the free space of previously generated page');
    Add('propPrintOptions', 'Print options of the report');
    Add('propPrintPages', 'Determines whether to print all, odd or even pages');
    Add('propRangeBegin', 'Determines the start point of dataset navigation');
    Add('propRangeEnd', 'Determines the end point of dataset navigation');
    Add('propRangeEndCount', 'Determines the number of records in the dataset if RangeEnd is reCount');
    Add('propReadOnly', 'Determines whether the text object is read-only');
    Add('propRepeatHeaders', 'Determines whether the column and row headers will be reprinted on new page');
    Add('propReportOptions', 'The options of the report');
    Add('propReprintOnNewPage', 'Determines whether the band will be reprinted on new page');
    Add('propRestrictions', 'Set of restriction flags');
    Add('propRightMargin', 'The size of the right page margin');
    Add('propRotation.TfrxBarCodeView', 'The orientation of the barcode');
    Add('propRotation', 'The text rotation');
    Add('propRowCount', 'Number of virtual records in the databand');
    Add('propRowFields', 'Names of DB fields represents the cross rows');
    Add('propRowLevels', 'Number of row levels');
    Add('propRTLReading', 'Determines whether the text object will show its text in right-to-left direction');
    Add('propScriptLanguage', 'The name of the script language used in the report');
    Add('propSessionName', 'The name of the BDE session');
    Add('propShadowColor', 'The color of the shadow');
    Add('propShadowWidth', 'The width of the shadow');
    Add('propShape', 'The type of the shape');
    Add('propShiftMode', 'Shift behavior of the object');
    Add('propShowCaptions', 'Determines whether the preview buttons will show its captions');
    Add('propShowColumnHeader', 'Determines whether the cross will show column headers');
    Add('propShowColumnTotal', 'Determines whether the cross will show column grand total');
    Add('propShowRowHeader', 'Determines whether the cross will show row headers');
    Add('propShowRowTotal', 'Determines whether the cross will show row grand total');
    Add('propShowDialog', 'Determines whether the print dialog will be shown in the preview window');
    Add('propShowText', 'Determines whether the barcode object will show a readable text');
    Add('propSize', 'The size of the font');
    Add('propSorted', 'Determines whether the items are sorted or not');
    Add('propSpacing', 'Determines the number of pixels between the image and the text');
    Add('propSQL', 'The SQL statement');
    Add('propStartNewPage', 'Starts a new page before printing a band');
    Add('propStretch', 'Stretches the picture to fit the object bounds');
    Add('propStretched', 'Determines whether the object can be stretched');
    Add('propStretchMode', 'Stretch behavior of the object');
    Add('propStyle.TFont', 'The style of the font');
    Add('propStyle', 'The style of the control');
    Add('propStyle.TfrxFrame', 'The style of the object''s frame');
    Add('propSuppressRepeated', 'Suppresses repeated values');
    Add('propTableName', 'The name of the data table');
    Add('propTag', 'Tag number of the object');
    Add('propTagStr', 'Tag string of the object');
    Add('propText', 'The text of the object');
    Add('propTitleBeforeHeader', 'Determines whether to show report title before page header');
    Add('propTop', 'The top coordinate of the object');
    Add('propTopMargin', 'The size of the top page margin');
    Add('propTyp', 'The type of the frame');
    Add('propUnderlines', 'Determines whether the text object will show grid lines after each text line');
    Add('propURL', 'The URL of the object');
    Add('propUserName', 'User name of the data object. This name will be shown in the data tree');
    Add('propVAlign', 'The vertical alignment of the text');
    Add('propVersionBuild', 'Version info, build');
    Add('propVersionMajor', 'Version info, major version');
    Add('propVersionMinor', 'Version info, minor version');
    Add('propVersionRelease', 'Version info, release');
    Add('propVGuides', 'The vertical guidelines of the page');
    Add('propVisible', 'Visibility of the object');
    Add('propWidth', 'Width of the object');
    Add('propWidth.TfrxFrame', 'The width of the frame');
    Add('propWindowState', 'Initial state of the window');
    Add('propWordBreak', 'Break russian words');
    Add('propWordWrap', 'Determines whether the text object inserts soft carriage returns so text wraps at the right margin');
    Add('propZoom.TfrxBarCodeView', 'Zooms the barcode');
    Add('propZoom', 'Initial zoom factor of the preview window');
    Add('propZoomMode', 'Initial zoom mode of the preview window');
  end;
end;


initialization
  frAddInspectorRes;

end.
