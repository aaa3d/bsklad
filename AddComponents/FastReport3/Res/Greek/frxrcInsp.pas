
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
    Add('propActive', '��������� �� ��� dataset ����� ������� (������) � ���');
    Add('propActive.TfrxHighlight', '��������� ���� ��� �� � ������ �������� ����� ������');
    Add('propAliasName', '�� ����� ��� ���������� BDE');
    Add('propAlign', '��������� ��� �������� ���� ������������ �� ����� �� ��� ���� � ��� ������');
    Add('propAlignment', '� �������� ��� �������� ���� ��� �����������');
    Add('propAllowAllUp', '��������� �� ��� �� ������� ����� speedbutton �� ��� ����� ������� �� ������������� ��� ���� ����������');
    Add('propAllowEdit', '��������� �� � ������� ����������� �� ������������ ��� ��� �������������� �������');
    Add('propAllowExpressions', '��������� �� ��� ����������� �������� ������������ �������');
    Add('propAllowGrayed', 'Allows grayed state of the control checkboxes');
    Add('propAllowHTMLTags', '��������� �� ��� ����������� �������� ������ �� ������������ HTML tags ���� ��� �������');
    Add('propAllowSplit', '��������� �� ��� ���� ������ �� ���������� �� ����������� ��� �� ������������ ��� ��� �������');
    Add('propAuthor', '� ������������� ��� ��������');
    Add('propAutoSize', '��������� �� ��� ������ �� ���� �������� �� ������� �������');
    Add('propAutoWidth', '��������� �� ��� ����������� �� ���� �������� ������');
    Add('propBackPicture', '� ������ ��� ����� ��� ��������');
    Add('propBarType', '� ����� ��� barcode');
    Add('propBevelInner', '� ����� ��� ���������� bevel');
    Add('propBevelOuter', '� ����� ��� ���������� bevel');
    Add('propBevelWidth', '�� ������ ��� bevel');
    Add('propBorder', '��������� �� �� ����������� �� ��������� �������');
    Add('propBorderStyle', '�� ���� ��� ���������');
    Add('propBottomMargin', '�� ��������� ������� ���� ����');
    Add('propBrushStyle', '�� ���� ��� ��������������� ��� �� ����� ��� ������������');
    Add('propButtons', '�� ������� ��� �� ����� ����� ��� �������� ��������������');
    Add('propCacheSize', '�� ������� ���� ������ ��� �� ��������������� ��� ��� ��������� ����������� ��������. ��� ������� ������ ��� ����������� �����, �� ��������������� ������� ��������� ���� ������ �����');
    Add('propCalcCheckSum', '��������� �� �� barcode �� ���������� �� check digit ��������');
    Add('propCancel', '��������� �� �� ������ �� �������������� �� �� ������� Esc');
    Add('propCaption', '� ������ ��� ��������� �� control');
    Add('propCellFields', '������� ��� ������ ��� ������������ �� ������ ������������');
    Add('propCellLevels', '������� ��� �������� �������');
    Add('propCenter', '��������� �� ��� ������ �� ����������� ���� ��� control');
    Add('propCharset', '� ������� ���������� ���� ��������������');
    Add('propCharSpacing', '������� ��� pixels ������ ��� ����������');
    Add('propCheckColor', '�� ����� ��� check mark');
    Add('propChecked', '������ �� �� control �� ����� �������������');
    Add('propCheckStyle', 'T� ���� ��� check mark');
    Add('propChild', '� ����-����� ��� ��������� �� ���� �� ����');
    Add('propCollate', '���������� ���������');
    Add('propColor.TFont', 'T� ����� ��� ��������');
    Add('propColor', '�� ����� ��� ������������');
    Add('propColor.TfrxFrame', '�� ����� ��� ��������');
    Add('propColor.TfrxHighlight', '��������� �� ����� ���� ������������ ���� ��������� ������ ��������');
    Add('propColumnFields', '������� ��� ������ ��� ������������ ���� ������ ������������');
    Add('propColumnGap', 'T� �������� ������ ������ ��� ����');
    Add('propColumnLevels', '������� �������� ������');
    Add('propColumns', '������� ������ ���� ����');
    Add('propColumnWidth', '�� ������ ��� ������ ���� ����');
    Add('propCondition', '������� ������������. � ����� �� ��������� ��� ������� � ���� ����� ��� ��������.');
    Add('propCondition', 'String ��������. ��� � ������� ���� ���������� True, �������������� � ������ ��������');
    Add('propConnected', '��������� �� � ������� �� ��� ���� ��������� ����� ������');
    Add('propConvertNulls', '��������� �� �� ����� null �� ������������� �� 0, False � ���� string');
    Add('propCopies', '������� ����������');
    Add('propCursor', '� ������� ��� ������������');
    Add('propDatabaseName', '�� ����� ��� ����� ���������');
    Add('propDataField', '��������� �� ����� ��� �� ����� �� ����������� �� ������ ��������');
    Add('propDataSet', 'Links the object to the dataset that contains the field it represents');
    Add('propDate', '� ���� ����������� ���� control');
    Add('propDateFormat', '��������� ��� ����������� ���� ����� ����������� � ����������');
    Add('propDecimalSeparator', '� ���������� ��� ���������� �� ��������');
    Add('propDefault', '��������� �� �� ������ ����� �� ������������� ������');
    Add('propDefHeight', '�� ���� ���� ������');
    Add('propDescription', '� ��������� ��� ��������');
    Add('propDiagonal', '��������� �� ��� ������ ����� ��������');
    Add('propDisplayFormat', '� ����������� ���� ������������� �����');
    Add('propDoubleBuffered', '��������� ��� �� �������� �������������� ������������ ����� buffer. � ������������ ��� ������ buffer ��������� �� flickering, ���� ����� ��� ���� �� ��������');
    Add('propDoublePass', '��������� ��� � ���������� �������� �� ��������� ������� �������');
    Add('propDown', '��������� �� ��� ������ ����� speedbutton ����� �������� � ���');
    Add('propDownThenAcross', '��������� ��� ���� ������� ������� ������������ �� �������� �� ������������ ��� ��� �������');
    Add('propDriverName', '�� ����� ��� ������ BDE');
    Add('propDropShadow', '��������� �� ��� ����������� ���� ����');
    Add('propDuplex', '��������� �� duplex mode ��� ��� ������');
    Add('propEditMask', '��������� ���� ����� ������ ������� ������� �� ��� �����');
    Add('propEnabled', '��������� �� �� control ����� ��������������');
    Add('propEngineOptions', '�������� ��� ���������� ����������� ��� ��������');
    Add('propExpression', '���� ����� ��� �������� �� ����������� ��� �����������');
    Add('propExpressionDelimiters', '�� ���������� ��� �� ���������������� ��� �� ����������� ��� ������� ���� ��� �������');
    Add('propFieldAliases', '�� ��������� ��� ������ ���������');
    Add('propFilter', '� ������� �������������� ��� �� dataset');
    Add('propFiltered', '��������� �� �� dataset �� ��������� ��� �������� ������� �� ��� ������� ��������������');
    Add('propFlowTo', '�� ����������� �������� ��� �� ��������� �� ������� ��� ���������� ��� ���� �� �����������');
    Add('propFont', '�� �������������� ��� �������������� ��� ������������');
    Add('propFooterAfterEach', '��������� �� � ���� ��������� �� ����������� �� ���� ������ ������');
    Add('propFormatStr', '�� string ������������');
    Add('propFrame', '�� �������������� ��� �������� ���� ������������');
    Add('propGapX', '� �������� ����� ��� ��������');
    Add('propGapY', '� ����� ��� �������� ��� ��� ������');
    Add('propGlyph', '�� ��������� ��� control');
    Add('propGroupIndex', '��������� �� ������� ����� speedbutton �� ��������� ���� ��� �����');
    Add('propHAlign', '� ��������� �������� ��� ��������');
    Add('propHeight', 'T� ���� ��� ������������');
    Add('propHGuides', '�� ���������� ������ ��� �������');
    Add('propHideZeros', '��������� �� �� ����������� �������� �� ���������� ��� ��������� �����');
    Add('propHighlight', '� ������� ��� ��� ������ ��������');
    Add('propIndexName', '�� ����� ��� index');
    Add('propInitString', '�� string ������������� ��� dot-matrix ��������');
    Add('propItems', '����������� ��� ������ ��� ������������');
    Add('propKeepAspectRatio', '��������� ��� ������� ��������� ���� ������������');
    Add('propKeepChild', '��������� �� � ���� �� ����������� ���� �� ��� ����-����� ��� ��� ���������');
    Add('propKeepFooter', '��������� �� � ���� �� ����������� ���� �� ��� ����-��������� ��� ��� ���������');
    Add('propKeepHeader', '��������� �� � ���� �� ����������� ���� �� ��� ����-�������� ��� ��� ���������');
    Add('propKeepTogether', '��������� �� � ���� �� ����������� ���� �� ���� ��� ���-����� ��� ��� ����������');
    Add('propKind.TfrxFormat', '�� ����� ��� ������������');
    Add('propKind', '�� ����� ��� ��������');
    Add('propLargeDesignHeight', '��������� �� ��� ������ �� ���� ������ ���� ���� ��� �������� ��� ���������');
    Add('propLayout', '� ������� ��� ���������� ��� ������');
    Add('propLeft', '� �������� ������������ ��� ������������');
    Add('propLeftMargin', '�� �������� ��������� ��� �������');
    Add('propLines', '�� ������� ��� ������������');
    Add('propLineSpacing', '�� �������� �� pixel ������� �� ��� ������� ��������');
    Add('propLoginPrompt', '��������� �� �� ����������� �� �������� login');
    Add('propMargin', '��������� �� �������� �� pixels ������� ���� ���� ��� ������� ��� ��� ���� ��� ��������');
    Add('propMaster', '�� master dataset');
    Add('propMasterFields', '�� ����� ��� ���������� ��� ��� ����� master-detail');
    Add('propMaximized', '��������� �� �� �������� �������������� �� ����������� �� ������� �������');
    Add('propMaxLength', '������� ����� ��� ��������');
    Add('propMaxPages', '�������� ������� ������� ���� �������������� �������');
    Add('propMaxWidth', 'M������ ������ ������');
    Add('propMDIChild', '��������� �� �� �������� �������������� �� ����� ����� MDI child');
    Add('propMemo', '�� ������� ��� ������������');
    Add('propMinWidth', '�������� ������ ������');
    Add('propMirrorMargins', '������������ ��� ���������� ��� ������� ���� ���� ������');
    Add('propModal', '��������� �� �� �������� �������������� �� ����� ����� modal');
    Add('propModalResult', '��������� ���� ��� ��� �� ������ �� ������� �� �������� ����� modal');
    Add('propName.TFont', '�� ����� ��� ��������������');
    Add('propName.TfrxReportOptions', '�� ����� ��� ��������');
    Add('propName', '�� ����� ��� ������������');
    Add('propNumGlyphs', '������������ ��� ������ ��� ������� ��� ���������� ���� ��������� Glyph');
    Add('propOpenDataSource', '��������� �� �� ������� � ��� �������� �� datasource');
    Add('propOrientation', '� ��������������� ��� �������');
    Add('propOutlineText', '�� ������� ��� �� ����������� ���� ���� ��� ��������������');
    Add('propOutlineVisible', '��������� �� �� �������� � ��� ���� ���� ��� ��������������');
    Add('propOutlineWidth', '�� ������ ��� ��������� ����� ��� ��������������');
    Add('propPageNumbers.TfrxPrintOptions', '� ������� ��� ������� ���� ��������');
    Add('propPaperHeight', '�� ���� ��� �������');
    Add('propPaperWidth', '�� ������ ��� �������');
    Add('propParagraphGap', '� ����� ��� ������ ������� ���� ����������');
    Add('propParams.TfrxBDEDatabase', '�� ���������� �������� �� ��� ���� ���������');
    Add('propParams', '�� ���������� ��� ����������');
    Add('propParentFont', '��������� �� �� ����������� �� ������������ ��� ������������� ��� parent');
    Add('propPassword', '� ������� ��������� ��� ��������');
    Add('propPasswordChar', '��������� ����� �� ����� � ���������� ��� �� ����������� ���� �� ���������� ��� ������ ���������');
    Add('propPicture', '� ������');
    Add('propPicture.TfrxReportOptions', '� ��������� ��� ������� ���� �������');
    Add('propPosition', '� ������ ���� ��� ���������');
    Add('propPreviewOptions', '�� �������� �������������� ��� ��������');
    Add('propPrintable', '��������� �� ��� ����������� �� �����������. ����������� �� ���� Printable=False �� ��������� ���� ������������� ���� ��� �� ������������');
    Add('propPrintChildIfInvisible', '��������� �� ��� ����-����� �� ����������� ��� � ����������� �'���� ���� ����� �� �����');
    Add('propPrinter', '�� ����� ��� �������� ��� �� ���������� ���� ���������� � ������� ��� �������');
    Add('propPrintIfDetailEmpty', '��������� �� ��� ���� ��������� �� ����������� �� �� ������������ �'���� ���-����� ����� �����');
    Add('propPrintIfEmpty', '��������� �� ��� ������ �� ����������� �� ��� �� datasets ����� ����');
    Add('propPrintOnFirstPage', '��������� �� ��� ���� �� ����������� ���� ����� ������');
    Add('propPrintOnLastPage', '��������� �� ��� ���� �� ����������� ���� ��������� ������');
    Add('propPrintOnParent', '��������� �� ��� ���-������� ������ �� ��������� ����� ���� ���� ��� ������');
    Add('propPrintOnPreviousPage', 'Determines whether the page can be generated on the free space of previously generated page');
    Add('propPrintOptions', '�������� ��������� ��� ��������');
    Add('propPrintPages', '��������� �� �� ��������� ����, ��� ����� � ��� ����� �������');
    Add('propRangeBegin', '��������� �� ������ ������ ��������� ���� ��� dataset');
    Add('propRangeEnd', '��������� �� ������ ������ ��������� ���� ��� dataset');
    Add('propRangeEndCount', '��������� ��� ������ ��� �������� ��� dataset ��� � ���������� RangeEnd ���� ���� reCount');
    Add('propReadOnly', '��������� �� �� ����������� �������� ����� ���� ���� ��������');
    Add('propRepeatHeaders', '��������� �� �� ������������ ��� ������ ��� ��� ������ �� ������������ �� ���� ������');
    Add('propReportOptions', '�� �������� ��� ��������');
    Add('propReprintOnNewPage', '��������� �� � ���� ��  �� ����������� �� ���� ������');
    Add('propRestrictions', '��� ������������� flag');
    Add('propRightMargin', '�� ���� ��������� ��� �������');
    Add('propRotation.TfrxBarCodeView', '� ��������������� ��� barcode');
    Add('propRotation', '���������� ��������');
    Add('propRowCount', '������� ������� �������� ���� ���� ���������');
    Add('propRowFields', '������� ������ ��� ��������������� ��� �������������� ������);
    Add('propRowLevels', '������� ��� �������� ������');
    Add('propRTLReading', '��������� �� �� ����������� �������� �� ��������� �� ������� �� ���������� ��� �� ����� ���� �� ��������');
    Add('propScriptLanguage', '� ������ ������ ��� �� ��������������� ���� �������');
    Add('propSessionName', '�� ����� ��� BDE session');
    Add('propShadowColor', '�� ����� ��� �����');
    Add('propShadowWidth', '�� ������ ��� �����');
    Add('propShape', '�� ����� ��� �����');
    Add('propShiftMode', '����������� Shift ��� ������������');
    Add('propShowCaptions', '��������� �� �� ������� �������������� �� ���������� ���� ������� ����');
    Add('propShowColumnHeader', '��������� �� � ����������� �� ��������� ��������� ������');
    Add('propShowColumnTotal', '��������� �� � ����������� �� ��������� ������ ������');
    Add('propShowRowHeader', '��������� �� � ����������� �� ��������� ��������� ������');
    Add('propShowRowTotal', '��������� �� � ����������� �� ��������� ������ ������');
    Add('propShowDialog', '��������� �� �� ����������� �� �������� �������� �������� ���� �������������');
    Add('propShowText', '��������� �� �� ����������� ����� barcode �� ����������� ��� ���������� �������');
    Add('propSize', '�� ������� ��� ��������������');
    Add('propSorted', '��������� �� �� ����������� ����� ������������ � ���');
    Add('propSpacing', '��������� ��� ������ �� pixel ������� ���� ������ ��� �� �������');
    Add('propSQL', '������� SQL');
    Add('propStartNewPage', '������ ��� ��� ������ ���� ��������� ��� ����');
    Add('propStretch', '�������� ��� ������ ���� �� ��������� ������� ��� ������� ��� ������������');
    Add('propStretched', '��������� �� �� ����������� �� ����� ���������');
    Add('propStretchMode', 'Stretch behavior of the object');
    Add('propStyle.TFont', '�� ���� ��� ��������������');
    Add('propStyle', 'T� ���� ��� control');
    Add('propStyle.TfrxFrame', '�� ���� ��� �������� ��� ������������');
    Add('propSuppressRepeated', '��������� ��� ����������������� �����');
    Add('propTableName', '�� ����� ��� ������ ���������');
    Add('propTag', '������� Tag ��� ������������');
    Add('propTagStr', 'Tag string ��� ������������');
    Add('propText', '�� ������� ��� ������������');
    Add('propTitleBeforeHeader', '��������� �� �� ��������� ��� �������� �������� ���� ��� ��� �������� �������');
    Add('propTop', '������������� ������� ��� ������������');
    Add('propTopMargin', '��������� ������� ��� �������');
    Add('propTyp', '����� ��������');
    Add('propUnderlines', '��������� �� �� ����������� �������� �� ��������� ������� ��������� ��� ���� ��� ������ ��������');
    Add('propURL', '��������� URL ��� ������������');
    Add('propUserName', '����� ������ ��� �� ����������� ���������. ���� �� ����� �� ����������� ���� ���� ���������');
    Add('propVAlign', '� ������ �������� ��� ��������');
    Add('propVersionBuild', '������ (build)');
    Add('propVersionMajor', '������ (major)');
    Add('propVersionMinor', '������ (minor)');
    Add('propVersionRelease', '������ (release)');
    Add('propVGuides', '�� ������� ������ ��� �������');
    Add('propVisible', '��������� �� �� ����������� �� ����� ����� � �� �����');
    Add('propWidth', '������ ��� ������������');
    Add('propWidth.TfrxFrame', '�� ������ ��� ��������');
    Add('propWindowState', '������ ��������� ��� ���������');
    Add('propWordBreak', '������ ������');
    Add('propWordWrap', '��������� ��� ���������� ��������');
    Add('propZoom.TfrxBarCodeView', '��������� �� barcode');
    Add('propZoom', '������ ��������� ��� �������� ��������������');
    Add('propZoomMode', '������� ����� ���������� ��� �������� ��������������');
  end;
end;


initialization
  frAddInspectorRes;

end.
