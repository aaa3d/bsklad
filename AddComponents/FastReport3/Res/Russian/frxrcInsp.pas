
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
    Add('propActive', '����������, ������� �� ����� ������');
    Add('propActive.TfrxHighlight', '����������, ������� �� �������� ���������');
    Add('propAliasName', '��� ������ BDE');
    Add('propAlign', '������������ ������� ������������ ��������');
    Add('propAlignment', '������������ ������ �������');
    Add('propAllowAllUp', '����������, ����� �� ��� ������ ������ ���� ������');
    Add('propAllowEdit', '����������, ����� �� ������������ ������������� ������� �����');
    Add('propAllowExpressions', '����������, ����� �� � ������ ������� ���������� ���������');
    Add('propAllowGrayed', '��������� ������ ��������� ���������');
    Add('propAllowHTMLTags', '����������, ����� �� � ������ ������� ���������� HTML-����');
    Add('propAllowSplit', '��������� ������ ����������� �����');
    Add('propAuthor', '����� ������');
    Add('propAutoSize', '����-������ ��������');
    Add('propAutoWidth', '����-������ ������');
    Add('propBackPicture', '������� �������� ��������');
    Add('propBarType', '��� ���������');
    Add('propBevelInner', '��� ���������� �����');
    Add('propBevelOuter', '��� ������� �����');
    Add('propBevelWidth', '������� �����');
    Add('propBorder', '����������, ���� �� ���������� ������� ����� ������ �������');
    Add('propBorderStyle', '����� ����');
    Add('propBottomMargin', '������ ������� ���� ��������');
    Add('propBrushStyle', '����� �����, ������������ ��� ��������� ������� �������');
    Add('propCalcCheckSum', '����������, ���� �� ��������� ����������� ����� �������������');
    Add('propCancel', '����������, ������ �� ����������� ������ ��� ������� ������� Esc');
    Add('propCaption', '��������� �������� ����������');
    Add('propCellFields', '����� ����� ��, ������������� � ������� �������');
    Add('propCellLevels', '���������� ������� � ������� �������');
    Add('propCenter', '����������, ���� �� ������������ �������� ������ �������');
    Add('propCharset', '����� �������� ������');
    Add('propCharSpacing', '���������� ����� ���������');
    Add('propCheckColor', '���� �������');
    Add('propChecked', '����������, ������� �� ������� ����������');
    Add('propCheckStyle', '��� �������');
    Add('propChild', '�������� ����, ��������� � ������ ������');
    Add('propCollate', '����������, ���� �� ��������� �� ������');
    Add('propColor.TFont', '���� ������');
    Add('propColor', '���� �������');
    Add('propColor.TfrxFrame', '���� �����');
    Add('propColor.TfrxHighlight', '���� �������, ���� �������� ��������� �������');
    Add('propColumnFields', '����� ����� ��, ������������� � ��������� ������� �������');
    Add('propColumnGap', '���������� ����� ��������� �����');
    Add('propColumnLevels', '���������� ������� � ��������� ������� �������');
    Add('propColumns', '���������� ������� �� �����');
    Add('propColumnWidth', '������ ������� �����');
    Add('propCondition', '������� �����������. ��� ��������� �������� ����� ��������� ����������� ����� ������');
    Add('propCondition.TfrxHighlight', '��������� ��� ��������� ���������. ���� �������� ����� ��������� ����� True, ��������� ����� �������');
    Add('propConnected', '����������, ������� �� ����������� � ��');
    Add('propConvertNulls', '����������, ������ �� ������ �������� ����� �� ���� �������������� � 0, False ��� ������ ������, � ����������� �� ���� ����');
    Add('propCopies', '���������� �����');
    Add('propCursor', '����� ������� �������');
    Add('propDatabaseName', '��� ���� ������');
    Add('propDataField', '��� ���� ��, � �������� �������� ������');
    Add('propDataSet', '����� ������, � �������� �������� ������');
    Add('propDate', '����');
    Add('propDateFormat', '������ ����');
    Add('propDecimalSeparator', '����������� ����� � ������� ������ �����');
    Add('propDefault', '����������, ��������� �� ������ ��� ������� ������� Enter');
    Add('propDefHeight', '������ ������ ������� �� ���������');
    Add('propDescription', '�������� ������');
    Add('propDiagonal', '����������, �������� �� ����� ������������');
    Add('propDisplayFormat', '�������������� ��������� ��������');
    Add('propDoublePass', '����������, �������� �� ����� �������������');
    Add('propDown', '����������, ������ �� ������');
    Add('propDownThenAcross', '����������, ��� ����� ������� �� �������� ������� �������');
    Add('propDriverName', '��� �������� BDE');
    Add('propDropShadow', '����������, ���������� �� ����');
    Add('propDuplex', '����� ���������� ������');
    Add('propEditMask', '����� ��� �������������� ������');
    Add('propEnabled', '����������, �������� �� ������� ����������');
    Add('propEngineOptions', '�������� ������ ������');
    Add('propExpression', '���������, �������� �������� ����� ���������� � �������');
    Add('propExpressionDelimiters', '�������, ������������ ��� ����������� ��������� � ������');
    Add('propFieldAliases', '������ ����� ��');
    Add('propFilter', '��������� ���������� ������� ������ ������');
    Add('propFiltered', '����������, ���� �� ������������ ����������, ��������� � �������� Filter');
    Add('propFlowTo', '������, ������� ����� ���������� �����, �� ������������� � ������ �������');
    Add('propFont', '��������� ������');
    Add('propFooterAfterEach', '����������, ���� �� ���������� ������ ����� ������ ������ ������');
    Add('propFormatStr', '������ ��������������');
    Add('propFrame', '��������� �����');
    Add('propGapX', '������ ������ ����� � ������ �� ������ �������');
    Add('propGapY', '������ ������ ������ � ����� �� ������ �������');
    Add('propGlyph', '�������� �������� ����������');
    Add('propGroupIndex', '��������� ���������� ������ � ������');
    Add('propHAlign', '������������ ������ �� �����������');
    Add('propHeight', '������ �������');
    Add('propHideZeros', '����������, ���� �� �������� ������� � �������� ����������');
    Add('propHighlight', '��������� ��������� ���������');
    Add('propIndexName', '��� �������');
    Add('propInitString', '������ ������������� �������� ��� ������ ��������� �������');
    Add('propItems', '������ ����� �������');
    Add('propKeepAspectRatio', '��������� ��������� �����������');
    Add('propKeepChild', '����������, ������ �� ���� ���������� �� ��� �� ��������, ��� � ��� child');
    Add('propKeepFooter', '����������, ������ �� ���� ���������� �� ��� �� ��������, ��� � ��� footer');
    Add('propKeepHeader', '����������, ������ �� ���� ���������� �� ��� �� ��������, ��� � ��� header');
    Add('propKeepTogether', '����������, ������ �� ������ ������ ���������� �� ����� ��������');
    Add('propKind.TfrxFormat', '��� ��������������');
    Add('propKind', '��� ������');
    Add('propLargeDesignHeight', '����������, ����� �� �������� ����� ������� ������ � ������ ���������');
    Add('propLayout', '���������� ��������');
    Add('propLeft', '���������� � �������');
    Add('propLeftMargin', '������ ������ ���� ��������');
    Add('propLines', '����� �������');
    Add('propLineSpacing', '���������� ����� �������� ������');
    Add('propLoginPrompt', '����������, ���� �� ���������� ������ � ������/������� ��� ����������� � ��');
    Add('propMargin', '���������� ����� ��������� � ����� �������� ����������');
    Add('propMaster', '������� ����� ������, ��� ����������� ������ master-detail');
    Add('propMasterFields', '��������� ���� �������� � ������������ ������ ������');
    Add('propMaxLength', '������������ ����� ������');
    Add('propMaxWidth', '������������ ������ �������');
    Add('propMemo', '����� �������');
    Add('propMinWidth', '����������� ������ �������');
    Add('propMirrorMargins', '���������� ���� ��������');
    Add('propModalResult', '����������, � ����� ����������� ������ ��������� ��������� �����');
    Add('propName.TFont', '��� ������');
    Add('propName.TfrxReportOptions', '��� ������');
    Add('propName', '��� �������');
    Add('propNumGlyphs', '���������� ��������, �������� � �������� Glyph');
    Add('propOpenDataSource', '����������, ���� �� ������������� ��������� ����� ������');
    Add('propOrientation', '���������� ��������');
    Add('propOutlineText', '�����, ������� ����� ��������� � "������ ������" � ���� ��������������� ���������');
    Add('propOutlineVisible', '����������, ���������� �� "������ ������" � ���� ���������������� ���������');
    Add('propOutlineWidth', '������ "������ ������"');
    Add('propPageNumbers.TfrxPrintOptions', '������ �������, ������� ������ ���� ����������');
    Add('propPaperHeight', '������ ��������');
    Add('propPaperWidth', '������ ��������');
    Add('propParagraphGap', '������ ���������');
    Add('propParams.TfrxBDEDatabase', '��������� ����������� � ��');
    Add('propParams', '��������� �������');
    Add('propParentFont', '����������, ���� �� ������������ ��������� ������ ��������');
    Add('propPassword', '������ ������');
    Add('propPasswordChar', '���������� ������, ������������ ��� ����������� ������');
    Add('propPicture', '��������');
    Add('propPicture.TfrxReportOptions', '�������� ������');
    Add('propPosition', '������� ���� �� ���������');
    Add('propPreviewOptions', '��������� ���������������� ���������');
    Add('propPrintable', '����������, ���� �� �������� ������. � ����� ������ ������ ����� ����� � ���� ���������');
    Add('propPrintChildIfInvisible', '����������, ���� �� �������� �������� ����, ���� �������� ���� �������');
    Add('propPrinter', '�������, ������� ����� ������ ��� ������ ������');
    Add('propPrintIfDetailEmpty', '����������, ���� �� �������� ����, ���� ��� �������� �� �������� �������');
    Add('propPrintIfEmpty', '����������, ���� �� �������� ��������, ���� ��� �� ����-����� �� ����� �������');
    Add('propPrintOnFirstPage', '����������, ���� �� �������� ���� �� ������ ��������');
    Add('propPrintOnLastPage', '����������, ���� �� �������� ���� �� ��������� ��������');
    Add('propPrintOnParent', '����������, �������� �� ���������� ���������� ������ �� ������������ �����');
    Add('propPrintOnPreviousPage', '����������, �������� �� ������ ��������� �������� �� ��������� ����� ���������� ��������');
    Add('propPrintOptions', '��������� ������');
    Add('propPrintPages', '����������, ����� �������� �������� - ���, �������� ��� ������');
    Add('propRangeBegin', '��������� ����� ��������� �� ������ ������');
    Add('propRangeEnd', '�������� ����� ��������� �� ������ ������');
    Add('propRangeEndCount', '���������� ������� � ������ ������, ���� RangeEnd = reCount');
    Add('propReadOnly', '������������� ����� "������ ��� ������"');
    Add('propRepeatHeaders', '����������, ���� �� ��������� ����� ���������� �� ���� ���������');
    Add('propReportOptions', '��������� ������');
    Add('propReprintOnNewPage', '����������, ���� �� ��������� ����� ����� �� ���� ���������');
    Add('propRestrictions', '����� ������, ����������� �� ��� ���� ��������');
    Add('propRightMargin', '������ ������� ���� ��������');
    Add('propRotation.TfrxBarCodeView', '���������� ���������');
    Add('propRotation', '���������� ������');
    Add('propRowCount', '���������� ����� � ����-�����, ���� �� �� ��������� � ������');
    Add('propRowFields', '����� ����� ��, ������������� � ��������� ����� �������');
    Add('propRowLevels', '���������� ������� � ��������� ����� �������');
    Add('propRTLReading', '����������, ���� �� ������������ ����������� ������ ������ ������');
    Add('propSessionName', '��� ������ BDE');
    Add('propShadowColor', '���� ����');
    Add('propShadowWidth', '������ ����');
    Add('propShape', '��� ������');
    Add('propShiftMode', '����� �������� �������');
    Add('propShowColumnHeader', '����������, ���������� �� ��������� �������');
    Add('propShowColumnTotal', '����������, ���������� �� ���� �� ��������');
    Add('propShowDialog', '����������, ���������� �� ������ ������ � ���� ���������������� ���������');
    Add('propShowRowHeader', '����������, ���������� �� ��������� �����');
    Add('propShowRowTotal', '����������, ���������� �� ���� �� �������');
    Add('propShowText', '����������, ���������� �� ����� ��� ����������');
    Add('propSize', '������ ������');
    Add('propSorted', '����������, ����������� �� ������');
    Add('propSpacing', '���������� ����� ��������� � ��������');
    Add('propSQL', '��������� SQL');
    Add('propStartNewPage', '����������, ����������� �� ������ �������� ����� ������� �����');
    Add('propStretch', '����������� �������� �� �������� �������');
    Add('propStretched', '����������, ����� �� ������ �������������');
    Add('propStretchMode', '����� ������������ �������');
    Add('propStyle.TFont', '����� ������');
    Add('propStyle', '����� �������� ����������');
    Add('propStyle.TfrxFrame', '����� �����');
    Add('propSuppressRepeated', '����������, �������� �� ������������� ��������');
    Add('propTableName', '��� �������');
    Add('propTag', '��� �������, �����');
    Add('propTagStr', '��� �������, ���������');
    Add('propText', '����� �������');
    Add('propTitleBeforeHeader', '����������, ���� �� ���������� ��������� ������ ����� ���������� ��������');
    Add('propTop', '���������� Y �������');
    Add('propTopMargin', '������ ������� ������� ��������');
    Add('propTyp', '��� �����');
    Add('propUnderlines', '����������, ������������ �� ������ ������ ������');
    Add('propURL', '��������� - URL �������');
    Add('propUserName', '���������������� ��� �������');
    Add('propVAlign', '������������ ������ �� ���������');
    Add('propVersionBuild', '������, build');
    Add('propVersionMajor', '������, major version');
    Add('propVersionMinor', '������, minor version');
    Add('propVersionRelease', '������, release');
    Add('propVisible', '����������, ����� �� ������');
    Add('propWidth', '������ �������');
    Add('propWidth.TfrxFrame', '������� �����');
    Add('propWindowState', '��������� ��������� ����');
    Add('propWordBreak', '��������� ������� ����� �� ������');
    Add('propWordWrap', '����������, ���� �� ���������� ����� �� ������');
    Add('propZoom.TfrxBarCodeView', '������� ���������');
  end;
end;


initialization
  frAddInspectorRes;

end.
