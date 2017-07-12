
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
    Add('propActive', '������ �� �� �� ������� ������� ��� ���');
    Add('propActive.TfrxHighlight', '������ �� �� �� ����������� ������� ��� ���');
    Add('propAliasName', '����� BDE ������');
    Add('propAlign', '������ ��������� ������ ��������� � ������ �� ���� ��� ������');
    Add('propAlignment', '��������� ������ ������');
    Add('propAllowAllUp', '������ ���� ��� ������ � ����� ���� ���� ������������� �����������');
    Add('propAllowEdit', '������ ���� �������� ���� �� ��� ���������� ������ ��������');
    Add('propAllowExpressions', '������ ���� ����� ������ ���� �� ������ ������ � ������');
    Add('propAllowGrayed', '�������� �������� ����� ����������');
    Add('propAllowHTMLTags', '������ �� �� ����� ������ ���� �� ������ HTML ������ ������ ������');
    Add('propAllowSplit', '������ �� �� ���� ���� �� ���� ��� ������ �� ���� ������');
    Add('propAuthor', '����� �������');
    Add('propAutoSize', '������ �� �� ����� ����� �� ������ ���� �������� ����������');
    Add('propAutoWidth', '������ �� �� ����� ������ ����� �� ������ ���� ������ ����������');
    Add('propBackPicture', '���������� ����� ������');
    Add('propBarType', '��� �������');
    Add('propBevelInner', '��� ���������� ������');
    Add('propBevelOuter', '��� �������� ������');
    Add('propBevelWidth', '������ ������');
    Add('propBorder', '������ �� �� �� �� ����� �������� ��� ��');
    Add('propBorderStyle', '���� �������');
    Add('propBottomMargin', '�������� ��� ������� ������');
    Add('propBrushStyle', '���� ����� �� ���������� �������� ������');
    Add('propButtons', '������� ������ ������� � ������� ��������');
    Add('propCacheSize', '���������� �������� ������� ��� ������� ������ �������. ��� ����������� ������� ������� ��� ��������, ���������� ������ �� ���� �������� �� ���� ����');
    Add('propCalcCheckSum', '������ �� �� ������ ����� �� ��������� ��������� ����� ����������');
    Add('propCancel', '������ �� �� ����� ���� ���� ���������� ���� �� �������� Esc ������');
    Add('propCaption', '������ (�����) ��������');
    Add('propCellFields', '������ DB ��� ��� ���������� ����� ���� �������');
    Add('propCellLevels', '��� ����� �����');
    Add('propCenter', '������ �� �� ����� ����� �� ���� ���������� ������ ������');
    Add('propCharset', '�������� ��� �������');
    Add('propCharSpacing', '�������� ������� ����� ��� ���������');
    Add('propCheckColor', '��� ��� ������');
    Add('propChecked', '������ �� �� �� �������� ��������');
    Add('propCheckStyle', '���� ��� ������');
    Add('propChild', '���� ���� ���������� �� ��� ����');
    Add('propCollate', '������������� ���������� ������� (������� �����)');
    Add('propColor.TFont', '��� ������');
    Add('propColor', '��� ������');
    Add('propColor.TfrxFrame', '��� ������');
    Add('propColor.TfrxHighlight', '������ ��� ������ ��� �� ����������� �������');
    Add('propColumnFields', '������ DB ��� ��� ���������� ���� ������');
    Add('propColumnGap', '������� ����� ���� ������');
    Add('propColumnLevels', '��� ����� ������');
    Add('propColumns', '��� ������ � �����');
    Add('propColumnWidth', '������ ���� ������');
    Add('propCondition', '����� ���������. ����� �� �� ������� ��� �� �������� ���� ������ �������');
    Add('propCondition.TfrxHighlight', '����� ������. ��� �� ��� ����� �����, ����������� (�����������) �� �� ����������');
    Add('propConnected', '������� �� �� �� �������� ���� �������� �������');
    Add('propConvertNulls', '������ �� �� �� ��������� (null) DB ��������� ���� ������������ � 0, �� ��� ������ ������');
    Add('propCopies', '������������� ��� �����');
    Add('propCursor', '������ ������');
    Add('propDatabaseName', '����� ���� ��������');
    Add('propDataField', '������ ��� �� ���� ������ ����� �������');
    Add('propDataSet', '������� ������ �� ������� ��� ������ ��� ��� ���������');
    Add('propDate', '�������� �������� ��������');
    Add('propDateFormat', '������ ������ ������� ������');
    Add('propDecimalSeparator', '��������� ���������');
    Add('propDefault', '������ �� �� �� ����� ������������� �����');
    Add('propDefHeight', '������������� ������ ����');
    Add('propDescription', '���� �������');
    Add('propDiagonal', '������� �� �� ����� ����������');
    Add('propDisplayFormat', '������ ��������� ���������');
    Add('propDoubleBuffered', '������ �� �� ������ �������� ������� ����� ����������. ���������� ������ ���������� �������� ��������, ��� �� ������');
    Add('propDoublePass', '������ �� �� ������ ������� ����� �� ����� ����� ������');
    Add('propDown', '������ �� �� �� ���� ����� ���������� ��� ��');
    Add('propDownThenAcross', '������ ���� �� ������ ���� ������ ���� ������� �� ��������');
    Add('propDriverName', '����� BDE �������');
    Add('propDropShadow', '������ �� �� ������ ���� �����');
    Add('propDuplex', '������ ������� ��� �� ������');
    Add('propEditMask', '��������� ����� ��� ������ ��� ����� �� �������� �� ��������� ���� ��������');
    Add('propEnabled', '������ �� �� �� �������� ����������');
    Add('propEngineOptions', '����� ������ �������');
    Add('propExpression', '�������� ���� ������ �� ���� �������� � ������');
    Add('propExpressionDelimiters', '��������� ��� �� ���� ���������� �� ���������� ������ ��� �� �������� � ������');
    Add('propFieldAliases', '������ ��� ��������');
    Add('propFilter', '����� ���������� ��������');
    Add('propFiltered', '������ �� �� ������� ����� �� ���������� ������ ��������� ������ � ������ �������');
    Add('propFlowTo', '����� ������ ��� �� ����������� ����� ��� �� ���� � ������');
    Add('propFont', '�������� ����� ������');
    Add('propFooterAfterEach', '������ �� �� �� ���� ������� ���� �������� ����� ������ ���� ��������');
    Add('propFormatStr', '������ �����������');
    Add('propFrame', '�������� ������ ������');
    Add('propGapX', '���� �������� ������');
    Add('propGapY', '���� �������� ������');
    Add('propGlyph', '����� ��������');
    Add('propGroupIndex', '�������� ���� ������ �� ���� ������ ��� �����');
    Add('propHAlign', '������������ ��������� ������');
    Add('propHeight', '������ ������');
    Add('propHGuides', '������������ ����� ����� ������');
    Add('propHideZeros', '������ �� �� �� ����� ������ �� ������� ����� ���������');
    Add('propHighlight', '�������� �������� �����������');
    Add('propIndexName', '����� �������');
    Add('propInitString', '���� ������ �������� �� �������� ��������');
    Add('propItems', '���� ������ ������');
    Add('propKeepAspectRatio', '������ ���������� ��������� �����');
    Add('propKeepChild', '������ �� �� �� ���� ���� ������� ������ �� ����� �������');
    Add('propKeepFooter', '������ �� �� �� ���� ���� ������� ������ �� ����� �������� (�������)');
    Add('propKeepHeader', 'Determines whether the band will be printed together with its header');
    Add('propKeepTogether', '������ �� �� �� ���� ���� ������� ������ �� ���� ����� ������������');
    Add('propKind.TfrxFormat', '����� �����������');
    Add('propKind', '����� �������');
    Add('propLargeDesignHeight', '������ �� �� �� ������ ����� ��� ������ � ����� ����');
    Add('propLayout', '������ ������� ������');
    Add('propLeft', '���� ���������� ������');
    Add('propLeftMargin', '�������� ���� �������');
    Add('propLines', '����� ������');
    Add('propLineSpacing', '��� ������� ����� ��� ����� ������');
    Add('propLoginPrompt', '������ �� �� �� �� ������� ����� ������');
    Add('propMargin', '������ ��� ������� ������ ����� ����� � ����� �������');
    Add('propMaster', '������ �������');
    Add('propMasterFields', '��� �������� ����� ������-������ ����');
    Add('propMaximized', '������ �� �� �� ������ �������� ���� ������������');
    Add('propMaxLength', '���������� ������ ������');
    Add('propMaxPages', '���������� ��� ������ � ����������� �������');
    Add('propMaxWidth', '���������� ������ ������');
    Add('propMDIChild', '������ �� �� �� ������ �������� �� ���� MDI ����');
    Add('propMemo', '����� ������');
    Add('propMinWidth', '��������� ������ ������');
    Add('propMirrorMargins', '������� ������ ��� � �������� �� ������ ��������');
    Add('propModal', '������ �� �� �� ������ �������� ���� �������� �������');
    Add('propModalResult', '������ �� �� � ���� ����� ������� ������� �����');
    Add('propName.TFont', '����� �����');
    Add('propName.TfrxReportOptions', '����� �������');
    Add('propName', '����� ������');
    Add('propNumGlyphs', '������ ��� ����� ��� �� � Glyph �������');
    Add('propOpenDataSource', '������ �� �� �� ������ ������� ���������� �� ��');
    Add('propOrientation', '���������� ������');
    Add('propOutlineText', '����� ��� �� ���� �������� � ������� �� ������');
    Add('propOutlineVisible', '�������� �������� ��������� � ��������');
    Add('propOutlineWidth', '������ �������� ��������� � ��������');
    Add('propPageNumbers.TfrxPrintOptions', '��� ������ �� ������');
    Add('propPaperHeight', '������ ������');
    Add('propPaperWidth', '������ ������');
    Add('propParagraphGap', '������� ���� ����� ������');
    Add('propParams.TfrxBDEDatabase', '��������� ��������');
    Add('propParams', '��������� query-��');
    Add('propParentFont', '������ �� �� �� ������ ��������� ��������� ����');
    Add('propPassword', '������� �������');
    Add('propPasswordChar', '������ ��������, ��� �� ���, �� ������ �� ����� �������� ��������� �������� � ��������');
    Add('propPicture', '�����');
    Add('propPicture.TfrxReportOptions', '������ ����� ��������');
    Add('propPosition', '��������� ������� �������');
    Add('propPreviewOptions', '����� �������� ��������');
    Add('propPrintable', '�������� ������ ������. ������ �� Printable=False �� �� ������� � ��������, ��� ��� ���� �������');
    Add('propPrintChildIfInvisible', '������ �� �� �� ���� ���� ���� ������� ��� �� ����� ��������� ���� �������');
    Add('propPrinter', '����� �������� ��� �� ���� ������� ���� �� ������ ��� ������� ��� ������');
    Add('propPrintIfDetailEmpty', '������ �� �� �� ���� �������� ���� ��������� ��� �� ����� ������� ������');
    Add('propPrintIfEmpty', '������ �� �� �� �� �������� �������� ��� �� ��� ���� ���������� ������');
    Add('propPrintOnFirstPage', '������ �� �� �� ���� ���� ������� �� ���� ������');
    Add('propPrintOnLastPage', '������ �� �� �� ���� ���� ������� �� ������� ������');
    Add('propPrintOnParent', '������ �� �� ��������� ���� �� �������� ���� �� ���������� �����');
    Add('propPrintOnPreviousPage', '������ �� �� �������� ���� ���� ���������� �� ��������� �������� ��������� ���������� ������');
    Add('propPrintOptions', '����� ������ �� ������');
    Add('propPrintPages', '������ �� �� �� �� ������ ���, ������� ��� ����� ������');
    Add('propRangeBegin', '������ ������� ����� ��������� ���� �������');
    Add('propRangeEnd', '������ ��༜� ����� ��������� ���� �������');
    Add('propRangeEndCount', '������ ��� ������ � �������� ��� �� RangeEnd reCount');
    Add('propReadOnly', '������ �� �� �� ����� ������ ���� �� ������');
    Add('propRepeatHeaders', '������ �� �� �� ������� ������ � ������ ���� ������ �������� �� ���� ������');
    Add('propReportOptions', '����� �������');
    Add('propReprintOnNewPage', '������ �� �� �� ����  ���� ������ ������� �� ���� ������');
    Add('propRestrictions', '������� ������������� �������');
    Add('propRightMargin', '�������� ����� ������� ������');
    Add('propRotation.TfrxBarCodeView', '���������� �������');
    Add('propRotation', '������� ������');
    Add('propRowCount', '��� ���������� ������ � ����� ��������');
    Add('propRowFields', '������ DB ��� ��� ���������� ���� ������');
    Add('propRowLevels', '��� ����� ������');
    Add('propRTLReading', '������ �� �� ����� ������ ����� �� �������� ����� �� ����� �� ����');
    Add('propScriptLanguage', '����� ������ ������ ��� �� ��������� � �������');
    Add('propSessionName', '����� BDE �����');
    Add('propShadowColor', '��� �����');
    Add('propShadowWidth', '������ �����');
    Add('propShape', '��� �����');
    Add('propShiftMode', '���� �������� ������');
    Add('propShowCaptions', '������ �� �� �� ������ �������� ����� ���� �������');
    Add('propShowColumnHeader', '������ �� �� �� ���� ����������� ������� ������');
    Add('propShowColumnTotal', '������ �� �� �� ���� ����������� ����� ����� ������');
    Add('propShowRowHeader', '������ �� �� �� ���� ����������� ������� ������');
    Add('propShowRowTotal', '������ �� �� �� ���� ����������� ����� ����� ������');
    Add('propShowDialog', '������ �� �� �� ������ �� ������ ���� �������� � ������� ��������');
    Add('propShowText', '������ �� �� �� ������ ������ ����������� ����� �����');
    Add('propSize', '�������� �����');
    Add('propSorted', '������ �� �� �� ������ ���������');
    Add('propSpacing', '������ ��� ������� �� ����� �� ������');
    Add('propSQL', 'SQL �����');
    Add('propStartNewPage', '����� ���� ������ ��� �������� �����');
    Add('propStretch', '�������� ����� �� �� ������ � ������');
    Add('propStretched', '������ �� �� ������ ���� ���� ���������');
    Add('propStretchMode', '�������� ������ ��� ���������');
    Add('propStyle.TFont', '���� �����');
    Add('propStyle', '���� ��������');
    Add('propStyle.TfrxFrame', '���� ������ ������');
    Add('propSuppressRepeated', '�������� (���������) ��������� ���������');
    Add('propTableName', '����� ������ ��������');
    Add('propTag', '��� ��� ������');
    Add('propTagStr', '��� ������ ������');
    Add('propText', '����� ������');
    Add('propTitleBeforeHeader', '������ �� �� �� ������� ������ ������� ��� ������� ������');
    Add('propTop', '���� ���������� ������');
    Add('propTopMargin', '�������� ���� ������� ������');
    Add('propTyp', '��� ������');
    Add('propUnderlines', '������ �� �� �� ����� ����� �� �������� ����� ����� ����� ����� ����� ������');
    Add('propURL', 'URL ������');
    Add('propUserName', '���������� ��� ������ ��������. ��� ��� �� ���� ��������� � ������ ��������');
    Add('propVAlign', '���������� ��������� ������');
    Add('propVersionBuild', '������ ����, ����');
    Add('propVersionMajor', '������ ����, ������ ������');
    Add('propVersionMinor', '������ ����, �������� ������');
    Add('propVersionRelease', '������ ����, ������');
    Add('propVGuides', '���������� ����� ����� ������');
    Add('propVisible', '�������� ������');
    Add('propWidth', '������ ������');
    Add('propWidth.TfrxFrame', '������ ������');
    Add('propWindowState', '������� ����� �������');
    Add('propWordBreak', '������� ����� ����');
    Add('propWordWrap', '������ �� �� �� ����� ������ ��������� soft carriage returns ���� �� �� ����� ����� �� ����� �������');
    Add('propZoom.TfrxBarCodeView', '�������� �������');
    Add('propZoom', '������� ��� ������ ������� ��������');
    Add('propZoomMode', '������� ��� ��� ������� ��������');
  end;
end;


initialization
  frAddInspectorRes;

end.
