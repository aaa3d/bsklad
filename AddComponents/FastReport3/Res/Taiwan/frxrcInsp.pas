
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
    Add('propActive', '�]�w�O�_�}�Ҹ�ƶ�(DataSet)�C');
    Add('propActive.TfrxHighlight', '�O�_�Ұ� highlight �\��C');
    Add('propAliasName', 'BDE �O�W(alias)�C');
    Add('propAlign', '�M�w����PBand��page�����C');
    Add('propAlignment', '�����r�������覡�C');
    Add('propAllowAllUp', '�P�s�ժ����ֳt���s�O�_�i�P�ɨ�������C');
    Add('propAllowEdit', '�ϥΪ̬O�_�i�H�s��w����������C');
    Add('propAllowExpressions', '�M�w��r����O�_�i�H�]�A�B�⦡�C');
    Add('propAllowGrayed', '���\CheckBox�e�{�Ǧ⪺���A�C');
    Add('propAllowHTMLTags', '�M�w��r���󪺤��e�O�_�i�ϥ� HTML ���ҡC');
    Add('propAllowSplit', '�M�w���������e�O�_�i�󭶦C�L�C');
    Add('propAuthor', '����@�̡C');
    Add('propAutoSize', '�M�w�O�_�۰ʽվ�Ϲ����j�p�C');
    Add('propAutoWidth', '�M�w�O�_�۰ʽվ��r���e�סC');
    Add('propBackPicture', '���������I���ϡC');
    Add('propBarType', '���X�������C');
    Add('propBevelInner', 'bevel���������A�C');
    Add('propBevelOuter', 'bevel�~�������A�C');
    Add('propBevelWidth', 'bevel���e�סC');
    Add('propBorder', '�M�w�O�_��ܥ~�ءC');
    Add('propBorderStyle', '�������˦��C');
    Add('propBottomMargin', '�����U�誺��ɡC');
    Add('propBrushStyle', '����I�����e���˦��C');
    Add('propButtons', '�]�w�w��������ܪ����s�C');
    Add('propCacheSize', '�����������ϥΧ֨��O���骺�j�p�A���p�ϥΪ��O����W�X�]�w�ȡA����N�۰ʼg�J�w�Ч֨��ɮסC');
    Add('propCalcCheckSum', '�۰ʭp����X���ˬd�X�C');
    Add('propCancel', '�M�w����UEsc��ɡA�����s��_�ʧ@�C');
    Add('propCaption', '��������D�C');
    Add('propCellFields', '��e�����Ʈw���W�١C');
    Add('propCellLevels', '��e�������h�ơC');
    Add('propCenter', '�v���m���C');
    Add('propCharset', '�r�����C');
    Add('propCharSpacing', '��Ӧr���������Z�A�H����(Pixels)��ܡC�C');
    Add('propCheckColor', 'CheckBox�Ŀ窱�A���C��C');
    Add('propChecked', '������Ŀ窱�A�C');
    Add('propCheckStyle', 'CheckBox�Ŀ諸�˦��C');
    Add('propChild', '�s���ܦ�band��Child Band�W�١C');
    Add('propCollate', '�w�]����X���ǳ]�w');
    Add('propColor.TFont', '��r���C��C');
    Add('propColor', '�����C��C');
    Add('propColor.TfrxFrame', '�ج[(Frame)���C��');
    Add('propColor.TfrxHighlight', '���p highlight �ݩʰʧ@�ɡA�M�w������ܪ��C��C');
    Add('propColumnFields', '��e�������W�١C');
    Add('propColumnGap', '�涡�Z');
    Add('propColumnLevels', '�檺���h�ơC');
    Add('propColumns', '�檺�ӼơC');
    Add('propColumnWidth', 'Band��column�e�סC');
    Add('propCondition', '�s�ձ���A���p���B�⦡���ȧ��ܡA�s�զ۰ʧ��ܡC');
    Add('propCondition.TfrxHighlight', '�B�⦡�r��C���p�B�⦡���u(True)�A���ت���ܤW�N�|�ҰʡC');
    Add('propConnected', '�]�w�O�_�s����Ʈw�C');
    Add('propConvertNulls', '�O�_�۰ʱNNull�ন 0, False �� �Ŧr��C');
    Add('propCopies', '�w�]����C�L���ơC');
    Add('propCursor', '���󪺴�СC');
    Add('propDatabaseName', '��Ʈw�W�١C');
    Add('propDataField', '�����Ʈw�����W�١C');
    Add('propDataSet', '�s���ܸ�ƶ��C');
    Add('propDate', '���������ȡC');
    Add('propDateFormat', '�����X�榡�C');
    Add('propDecimalSeparator', '�p���I�����j�r���C');
    Add('propDefault', '�M�w�����s�O�_���w�]���s�C');
    Add('propDefHeight', '�w�]�C���C');
    Add('propDescription', '����γ~�y�z');
    Add('propDiagonal', '�N�u�����w���׽u�C');
    Add('propDisplayFormat', '�����ܮ榡�C');
    Add('propDoubleBuffered', '�M�w�w�������O�_�ϥ����w�İϡC�ϥ����w�İϥi����ù��X�{�{�ʪ����ΡA���O�|���C����t�סC');
    Add('propDoublePass', '�M�w��������O�_����G���B�z�C');
    Add('propDown', '�M�w���s�O�_�w�Q���U�C');
    Add('propDownThenAcross', '���w�h�榡����ĥѤW�ӤU�A�ѥ��ܥk�C�L�C');
    Add('propDriverName', 'BDE�X�ʵ{���W�١C');
    Add('propDropShadow', '�M�w����O�_�����v�C');
    Add('propDuplex', '�����C�L�Ҧ��C');
    Add('propEditMask', '��J�s��B�n�C');
    Add('propEnabled', '�M�w����O�_�i�ʧ@�C');
    Add('propEngineOptions', '����������ﶵ�C');
    Add('propExpression', '���󪺹B�⦡�C');
    Add('propExpressionDelimiters', '�B�⦡�����j�r���C');
    Add('propFieldAliases', '��ƶ���쪺�O�W�C');
    Add('propFilter', '��ƶ����L�o����C');
    Add('propFiltered', '�M�w Filter �L�o����O�_�ҰʡC');
    Add('propFlowTo', '��r����L�k�e�ǮɡA��ܦܨ�L����C');
    Add('propFont', '���󪺦r���ݩʡC');
    Add('propFooterAfterEach', '�M�w�O�_�b�C�Ӹ�ƦC����A��ۦC�L footer band�C');
    Add('propFormatStr', '��X�榡�s��r��C');
    Add('propFrame', '���󪺮ج[�ݩʡC');
    Add('propGapX', '��r�P��������C');
    Add('propGapY', '��r�P�W�������C');
    Add('propGlyph', '������v���C');
    Add('propGroupIndex', '���\�ֳt���s�]���P�@�s�աC');
    Add('propHAlign', '��r���������覡�C');
    Add('propHeight', '���󪺰��סC');
    Add('propHGuides', '�]�p�������������ɤ޽u�C');
    Add('propHideZeros', '�Ʀr�e���� 0 ����ܡC');
    Add('propHighlight', 'highlight�ݩʪ�����C');
    Add('propIndexName', '���ަW�١C');
    Add('propInitString', '���I�x�}����ϥΪ��L�����l�r��C');
    Add('propItems', '���󪺲M�涵��');
    Add('propKeepAspectRatio', '�O�d�v������ܤ�v');
    Add('propKeepChild', '�M�wBand�O�_�PChild�C�L�b�@�_');
    Add('propKeepFooter', '�O�_�Pfooter�C�L�b�@�_');
    Add('propKeepTogether', '�M�wband�Psubband�@�_�C�L');
    Add('propKind.TfrxFormat', '�榡����');
    Add('propKind', '���s����');
    Add('propLargeDesignHeight', '�]�p���������̤j����');
    Add('propLayout', '���s�ϧΪ��榡');
    Add('propLeft', '���󪺥���y��');
    Add('propLeftMargin', '����ɪ��j�p');
    Add('propLines', '���󪺤�r');
    Add('propLineSpacing', '�C�Z');
    Add('propLoginPrompt', '��ܵn�J����');
    Add('propMargin', '���s�ϧλP��ɪ��Z��(����)');
    Add('propMaster', '�D��ƶ�');
    Add('propMasterFields', '�D��ƻP���Ӹ�����p�����');
    Add('propMaximized', '�w�������̤j��');
    Add('propMaxLength', '��r���̤j����');
    Add('propMaxPages', '�w������̤j������');
    Add('propMaxWidth', '�̤j��e');
    Add('propMDIChild', '�M�w�w�������O�_��MDI�l����');
    Add('propMemo', '���󪺤�r');
    Add('propMinWidth', '�檺�̤p�e��');
    Add('propMirrorMargins', '��g������ɦܰ��ƭ�');
    Add('propModal', '�w�������O�_�HModal�覡���');
    Add('propModalResult', 'Modal���������ɶǦ^����');
    Add('propName.TFont', '�r���W��');
    Add('propName.TfrxReportOptions', '����W��');
    Add('propName', '����W��');
    Add('propNumGlyphs', 'Glyph�ݩʤ��ϧΪ��ƥ�');
    Add('propOpenDataSource', '�M�w�O�_�۰ʶ}�Ҹ�ƨӷ�');
    Add('propOrientation', '����������V');
    Add('propOutlineText', '��ܦb����j�����󪺤�r');
    Add('propOutlineVisible', '��ܹw���j��');
    Add('propOutlineWidth', '����j�����e��');
    Add('propPageNumbers.TfrxPrintOptions', '�C�L������');
    Add('propPaperHeight', '��������');
    Add('propPaperWidth', '�����e��');
    Add('propParagraphGap', '�q�����椺�Y');
    Add('propParams.TfrxBDEDatabase', 'BDE��Ʈw�s���Ѽ�');
    Add('propParams', '�d�ߪ��Ѽ�');
    Add('propParentFont', '�M�w����O�_��ܤW�h���󪺦r���]�w');
    Add('propPassword', '����K�X');
    Add('propPasswordChar', '�K�X����J����ܪ��r��');
    Add('propPicture', '�Ϲ�');
    Add('propPicture.TfrxReportOptions', '����Ϲ�');
    Add('propPosition', '��������l��m');
    Add('propPreviewOptions', '����w���ﶵ');
    Add('propPrintable', '����O�_�i�C�L');
    Add('propPrintChildIfInvisible', '���pparent band���C�L�A�M�wchild band�O�_�C�L');
    Add('propPrinter', '����w�]���L����W��');
    Add('propPrintIfDetailEmpty', '���psubnband�O�Ū��A�M�w�O�_�C�L');
    Add('propPrintIfEmpty', '���p�����ƶ��O�Ū��A�M�w�O�_�~��C�L');
    Add('propPrintOnFirstPage', '�M�wBand�O�_�C�L�b����');
    Add('propPrintOnLastPage', '�M�wBand�O�_�C�L�b����');
    Add('propPrintOnParent', '�M�w�l����O�_�C�L�b�W�h��Band');
    Add('propPrintOnPreviousPage', '�M�w�����O�_�i�C�L�b�W�����Ѿl�Ŷ�');
    Add('propPrintOptions', '����C�L�ﶵ�C');
    Add('propPrintPages', '�M�w�C�L����������B�_�ƭ��ΰ��ƭ��C');
    Add('propRangeBegin', '�C�L��ƶ����_�I�C');
    Add('propRangeEnd', '�C�L��ƶ������I�C');
    Add('propRangeEndCount', '�M�w�C�L���ơC');
    Add('propReadOnly', '�M�w��r����O�_��Ū�C');
    Add('propRepeatHeaders', '�M�w�����O�_�C�L�b�C�ӷs�������C');
    Add('propReportOptions', '����ﶵ�C');
    Add('propReprintOnNewPage', '�M�w�O�_���s�C�L�b�U�@��');
    Add('propRestrictions', '������X�СC');
    Add('propRightMargin', '�k��ɡC');
    Add('propRotation.TfrxBarCodeView', '���X��V');
    Add('propRotation', '�����r');
    Add('propRowCount', 'Databand��������Ƶ��ơC');
    Add('propRowFields', '��e����C����Ʈw���W��');
    Add('propRowLevels', '�C���h���ƥ�');
    Add('propRTLReading', '�M�w��r����O�_�ѥk�ܥ����');
    Add('propScriptLanguage', '�������ϥΪ��}���y���W�١C');
    Add('propSessionName', 'BDE �s�u�W�١C');
    Add('propShadowColor', '���v���C��C');
    Add('propShadowWidth', '���v���e�סC');
    Add('propShape', '�~�����˦�');
    Add('propShiftMode', '�����ܰʪ��欰');
    Add('propShowCaptions', '�M�w�O�_��ܹw�����s����r����');
    Add('propShowColumnHeader', '�M�w��e����O�_��������Y');
    Add('propShowColumnTotal', '�M�w��e����O�_�������`�p');
    Add('propShowRowHeader', '�M�w��e����O�_��ܦC�����Y');
    Add('propShowRowTotal', '�M�w��e����O�_��ܦC���`�p');
    Add('propShowDialog', '�M�w�C�L��ܵ����O�_�X�{�b�w������');
    Add('propShowText', '�M�w���X����O�_��ܤ�r����');
    Add('propSize', '�r���j�p�C');
    Add('propSorted', '���جO�_�n�ƧǡC');
    Add('propSpacing', '��r�P�v����������(Pixels)���Z�C');
    Add('propSQL', 'SQL�ԭz');
    Add('propStartNewPage', '�b�C�LBand���e�A����������ʧ@�C');
    Add('propStretch', '�վ�Ϲ��ܪ��󪺤j�p�C');
    Add('propStretched', '�M�w����i�H���Y�C');
    Add('propStretchMode', '������Y���欰�C');
    Add('propStyle.TFont', '�r���˦��C');
    Add('propStyle', '����˦��C');
    Add('propStyle.TfrxFrame', '���󪺮ج[�˦��C');
    Add('propSuppressRepeated', '�R�����ƪ���(���ƪ��Ȥ��C�L)�C');
    Add('propTableName', '��ƪ�W�١C');
    Add('propTag', '���󪺼Ʀr����');
    Add('propTagStr', '���󪺦r����ҡC');
    Add('propText', '���󪺤�r�C');
    Add('propTitleBeforeHeader', '�M�w�O�_�b�����e��ܳ�����Y�C');
    Add('propTop', '����W�誺�y�СC');
    Add('propTopMargin', '�����P�ȱi�W�t����ɡC');
    Add('propTyp', '�ج[�����A�C');
    Add('propUnderlines', '�M�w��r����A�C�@�C������ܩ��u�C');
    Add('propURL', '����s���� URL ��}�C');
    Add('propUserName', '��ƪ��󪺨ϥΪ̦W�١A���W�ٱN��ܩ��ƾ𪬵��c�C');
    Add('propVAlign', '��r���������覡�C');
    Add('propVersionBuild', '�����s��');
    Add('propVersionMajor', '�����s��, �D�����s���C');
    Add('propVersionMinor', '�����s���A�������s���C');
    Add('propVersionRelease', '�����o���T�C');
    Add('propVGuides', '�����������ɤ޽u�C');
    Add('propVisible', '����i���C');
    Add('propWidth', '����e�סC');
    Add('propWidth.TfrxFrame', '�ج[�e�סC');
    Add('propWindowState', '������l���A�C');
    Add('propWordBreak', '�_�r');
    Add('propWordWrap', '��r�O�_�۰ʴ���C');
    Add('propZoom.TfrxBarCodeView', '���X��ܤ��');
    Add('propZoom', '�w��������l����ܤ�ҡC');
    Add('propZoomMode', '�w����������ܼҦ��C');
  end;
end;


initialization
  frAddInspectorRes;

end.
