
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
      'Caption=�����˵���' + #13#10 +
      '');
    Add('oiProp', '�ݩ�');
    Add('oiEvent', '�ƥ�');

    Add('TfrxDataTreeForm',
      'Caption=��ƾ�' + #13#10 +
      'DataTS.Caption=���' + #13#10 +
      'VariablesTS.Caption=�ܼ�' + #13#10 +
      'FunctionsTS.Caption=���' + #13#10 +
      'InsFieldCB.Caption=�إ����' + #13#10 +
      'InsCaptionCB.Caption=�إ߼��D' + #13#10 +
      '');
    Add('dtNoData', '�S����Ʈw�i�H�ϥ�');
    Add('dtData', '���');
    Add('dtSysVar', '�t���ܼ�');
    Add('dtVar', '�ܼ�');
    Add('dtFunc', '���');

    Add('TfrxReportTreeForm',
      'Caption=�����' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=�}�Ҹ}��' + #13#10 +
      'SaveScriptB.Hint=�x�s�}��' + #13#10 +
      'RunScriptB.Hint=����}��' + #13#10 +
      'StepScriptB.Hint=�l�ܦ�' + #13#10 +
      'StopScriptB.Hint=�����}��' + #13#10 +
      'EvaluateB.Hint=�D��' + #13#10 +
      'LangL.Caption=�y��:' + #13#10 +
      'AlignTB.Caption=���' + #13#10 +
      'AlignLeftsB.Hint=����' + #13#10 +
      'AlignHorzCentersB.Hint=�����m��' + #13#10 +
      'AlignRightsB.Hint=���k' + #13#10 +
      'AlignTopsB.Hint=���W' + #13#10 +
      'AlignVertCentersB.Hint=�����m��' + #13#10 +
      'AlignBottomsB.Hint=����' + #13#10 +
      'SpaceHorzB.Hint=�����Ŷ�' + #13#10 +
      'SpaceVertB.Hint=�����Ŷ�' + #13#10 +
      'CenterHorzB.Hint=�����m��' + #13#10 +
      'CenterVertB.Hint=�����m��' + #13#10 +
      'SameWidthB.Hint=�ۦP�e��' + #13#10 +
      'SameHeightB.Hint=�ۦP����' + #13#10 +
      'TextTB.Caption=��r' + #13#10 +
      'StyleCB.Hint=�˦�' + #13#10 +
      'FontNameCB.Hint=�r���W��' + #13#10 +
      'FontSizeCB.Hint=�r���j�p' + #13#10 +
      'BoldB.Hint=����' + #13#10 +
      'ItalicB.Hint=����' + #13#10 +
      'UnderlineB.Hint=���u' + #13#10 +
      'FontColorB.Hint=�r���C��' + #13#10 +
      'HighlightB.Hint=�j��' + #13#10 +
      'RotateB.Hint=��r��V' + #13#10 +
      'TextAlignLeftB.Hint=���a' + #13#10 +
      'TextAlignCenterB.Hint=�m��' + #13#10 +
      'TextAlignRightB.Hint=�k�a' + #13#10 +
      'TextAlignBlockB.Hint=���a' + #13#10 +
      'TextAlignTopB.Hint=�W������' + #13#10 +
      'TextAlignMiddleB.Hint=�����m��' + #13#10 +
      'TextAlignBottomB.Hint=��������' + #13#10 +
      'FrameTB.Caption=�~��' + #13#10 +
      'FrameTopB.Hint=�W��u' + #13#10 +
      'FrameBottomB.Hint=�U��u' + #13#10 +
      'FrameLeftB.Hint=����u' + #13#10 +
      'FrameRightB.Hint=�k��u' + #13#10 +
      'FrameAllB.Hint=�ؽu' + #13#10 +
      'FrameNoB.Hint=�S�����' + #13#10 +
      'ShadowB.Hint=���v' + #13#10 +
      'FillColorB.Hint=�I���C��' + #13#10 +
      'FrameColorB.Hint=�~���C��' + #13#10 +
      'FrameStyleB.Hint=�~�ؼ˦�' + #13#10 +
      'FrameWidthCB.Hint=�~�ؼe��' + #13#10 +
      'StandardTB.Caption=�з�' + #13#10 +
      'NewB.Hint=�s����' + #13#10 +
      'OpenB.Hint=�}�ҳ���' + #13#10 +
      'SaveB.Hint=�x�s����' + #13#10 +
      'PreviewB.Hint=�w��' + #13#10 +
      'NewPageB.Hint=�s������' + #13#10 +
      'NewDialogB.Hint=�s��ܵ���' + #13#10 +
      'DeletePageB.Hint=�R����' + #13#10 +
      'PageSettingsB.Hint=�����]�w' + #13#10 +
      'VariablesB.Hint=�ܼ�' + #13#10 +
      'CutB.Hint=�ŤU' + #13#10 +
      'CopyB.Hint=�ƻs' + #13#10 +
      'PasteB.Hint=�K�W' + #13#10 +
      'SampleFormatB.Hint=�ƻs�榡' + #13#10 +
      'UndoB.Hint=�_��' + #13#10 +
      'RedoB.Hint=�����_��' + #13#10 +
      'GroupB.Hint=�s��' + #13#10 +
      'UngroupB.Hint=�����s��' + #13#10 +
      'ShowGridB.Hint=��ܤp��l' + #13#10 +
      'AlignToGridB.Hint=�P��l����' + #13#10 +
      'SetToGridB.Hint=Fit to Grid' + #13#10 +
      'ScaleCB.Hint=��ܤ�v' + #13#10 +
      'ExtraToolsTB.Caption=�B�~�u��' + #13#10 +
      'ObjectSelectB.Hint=����u��' + #13#10 +
      'HandToolB.Hint=�{��u��' + #13#10 +
      'ZoomToolB.Hint=��ܤ�v�u��' + #13#10 +
      'TextToolB.Hint=�s���r�u��' + #13#10 +
      'FormatToolB.Hint=�ƻs�榡�u��' + #13#10 +
      'ObjectBandB.Hint=���JBand' + #13#10 +
      'FileMenu.Caption=�ɮ�(&F)' + #13#10 +
      'EditMenu.Caption=�s��(&E)' + #13#10 +
      'FindMI.Caption=�M��...' + #13#10 +
      'FindNextMI.Caption=��U�@��' + #13#10 +
      'ReplaceMI.Caption=���N...' + #13#10 +
      'ReportMenu.Caption=����(&R)' + #13#10 +
      'ReportDataMI.Caption=���...' + #13#10 +
      'ReportSettingsMI.Caption=�ﶵ...' + #13#10 +
      'ReportStylesMI.Caption=�˦�...' + #13#10 +
      'ViewMenu.Caption=�˵�(&V)' + #13#10 +
      'ToolbarsMI.Caption=�u��C' + #13#10 +
      'StandardMI.Caption=�з�' + #13#10 +
      'TextMI.Caption=��r' + #13#10 +
      'FrameMI.Caption=�~��' + #13#10 +
      'AlignmentMI.Caption=����L' + #13#10 +
      'ToolsMI.Caption=�B�~�u��' + #13#10 +
      'InspectorMI.Caption=�����˵���' + #13#10 +
      'DataTreeMI.Caption=��ƾ�' + #13#10 +
      'ReportTreeMI.Caption=�����' + #13#10 +
      'ShowRulersMI.Caption=�سW' + #13#10 +
      'ShowGuidesMI.Caption=�ɽu' + #13#10 +
      'DeleteGuidesMI.Caption=�R���ɽu' + #13#10 +
      'OptionsMI.Caption=�ﶵ...' + #13#10 +
      'HelpMenu.Caption=����(&H)' + #13#10 +
      'HelpContentsMI.Caption=���e...' + #13#10 +
      'AboutMI.Caption=���� FastReport...' + #13#10 +
      'TabOrderMI.Caption=Tab ����...' + #13#10 +
      'UndoCmd.Caption=�_��' + #13#10 +
      'RedoCmd.Caption=�����_��' + #13#10 +
      'CutCmd.Caption=�ŤU' + #13#10 +
      'CopyCmd.Caption=�ƻs' + #13#10 +
      'PasteCmd.Caption=�K�W' + #13#10 +
      'GroupCmd.Caption=�s��' + #13#10 +
      'UngroupCmd.Caption=�����s��' + #13#10 +
      'DeleteCmd.Caption=�R��' + #13#10 +
      'DeletePageCmd.Caption=�R����' + #13#10 +
      'SelectAllCmd.Caption=����' + #13#10 +
      'EditCmd.Caption=�s��...' + #13#10 +
      'BringToFrontCmd.Caption=���ɦܤW�@�h' + #13#10 +
      'SendToBackCmd.Caption=�e�ܤU�@�h' + #13#10 +
      'NewItemCmd.Caption=�s...' + #13#10 +
      'NewReportCmd.Caption=�s����' + #13#10 +
      'NewPageCmd.Caption=�s����' + #13#10 +
      'NewDialogCmd.Caption=�s��ܵ���' + #13#10 +
      'OpenCmd.Caption=�}��...' + #13#10 +
      'SaveCmd.Caption=�x�s' + #13#10 +
      'SaveAsCmd.Caption=�t�s�s��...' + #13#10 +
      'VariablesCmd.Caption=�ܼ�...' + #13#10 +
      'PageSettingsCmd.Caption=�����]�w...' + #13#10 +
      'PreviewCmd.Caption=�w��' + #13#10 +
      'ExitCmd.Caption=���}' + #13#10 +
      'ReportTitleMI.Caption=������Y' + #13#10 +
      'ReportSummaryMI.Caption=����X�p' + #13#10 +
      'PageHeaderMI.Caption=����' + #13#10 +
      'PageFooterMI.Caption=����' + #13#10 +
      'HeaderMI.Caption=�Y' + #13#10 +
      'FooterMI.Caption=��' + #13#10 +
      'MasterDataMI.Caption=�D���' + #13#10 +
      'DetailDataMI.Caption=���Ӹ��' + #13#10 +
      'SubdetailDataMI.Caption=�l���ʸ��' + #13#10 +
      'Data4levelMI.Caption=��4�����' + #13#10 +
      'Data5levelMI.Caption=��5�����' + #13#10 +
      'Data6levelMI.Caption=��6�����' + #13#10 +
      'GroupHeaderMI.Caption=�s�խ�' + #13#10 +
      'GroupFooterMI.Caption=�s�է�' + #13#10 +
      'ChildMI.Caption=�l' + #13#10 +
      'ColumnHeaderMI.Caption=�歺' + #13#10 +
      'ColumnFooterMI.Caption=���' + #13#10 +
      'OverlayMI.Caption=���|' + #13#10 +
      'VerticalbandsMI.Caption=����Band' + #13#10 +
      'HeaderMI1.Caption=�Y' + #13#10 +
      'FooterMI1.Caption=��' + #13#10 +
      'MasterDataMI1.Caption=�D���' + #13#10 +
      'DetailDataMI1.Caption=���Ӹ��' + #13#10 +
      'SubdetailDataMI1.Caption=�l���Ӹ��' + #13#10 +
      'GroupHeaderMI1.Caption=�s�խ�' + #13#10 +
      'GroupFooterMI1.Caption=�s�է�' + #13#10 +
      'ChildMI1.Caption=�l' + #13#10 +
      'R0MI.Caption=0��' + #13#10 +
      'R45MI.Caption=45��' + #13#10 +
      'R90MI.Caption=90��' + #13#10 +
      'R180MI.Caption=180��' + #13#10 +
      'R270MI.Caption=270��' + #13#10 +
      'FontB.Hint=�r���]�w' + #13#10 +
      'BoldMI.Caption=����' + #13#10 +
      'ItalicMI.Caption=����' + #13#10 +
      'UnderlineMI.Caption=���u' + #13#10 +
      'SuperScriptMI.Caption=SuperScript' + #13#10 +
      'SubScriptMI.Caption=SubScript' + #13#10 +
      'CondensedMI.Caption=���Y' + #13#10 +
      'WideMI.Caption=�e' + #13#10 +
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
    Add('dsSavePreviewChanges', '�x�s�ܧ�ܹw������?');
    Add('dsSaveChangesTo', '�x�s�ק�� ');
    Add('dsCantLoad', '�L�k���J�ɮ�');
    Add('dsStyleFile', '�˦�');
    Add('dsCantFindProc', '�䤣��D�{��');
    Add('dsClearScript', '�M���Ҧ����}���A�A�n�~���?');
    Add('dsNoStyle', '�S���˦�');
    Add('dsStyleSample', '�˦��d��');
    Add('dsTextNotFound', '��r ''%s'' �䤣��');
    Add('dsReplace', '���N��r ''%s''?');

    Add('TfrxAboutForm',
      'Caption=���� FastReport' + #13#10 +
      'Label4.Caption=���X�ڭ̪������H���o��h����T:' + #13#10 +
      'Label6.Caption=�P��:' + #13#10 +
      'Label8.Caption=�䴩:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=�����ﶵ' + #13#10 +
      'OKB.Caption=�T�{' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      'TabSheet1.Caption=�ȱi' + #13#10 +
      'Label1.Caption=�e��' + #13#10 +
      'Label2.Caption=����' + #13#10 +
      'Label11.Caption=�j�p   ' + #13#10 +
      'Label12.Caption=��V   ' + #13#10 +
      'Label3.Caption=��' + #13#10 +
      'Label4.Caption=�W' + #13#10 +
      'Label5.Caption=�k' + #13#10 +
      'Label6.Caption=�U' + #13#10 +
      'Label13.Caption=���   ' + #13#10 +
      'Label14.Caption=�ȱi�ӷ�   ' + #13#10 +
      'Label9.Caption=�Ĥ@��' + #13#10 +
      'Label10.Caption=��L��' + #13#10 +
      'PortraitRB.Caption=���L' + #13#10 +
      'LandscapeRB.Caption=��L' + #13#10 +
      'TabSheet3.Caption=��L�ﶵ' + #13#10 +
      'Label7.Caption=Columns   ' + #13#10 +
      'Label8.Caption=Number' + #13#10 +
      'Label15.Caption=�e' + #13#10 +
      'Label16.Caption=��m' + #13#10 +
      'Label17.Caption=��L   ' + #13#10 +
      'Label18.Caption=�����C�L' + #13#10 +
      'PrintOnPrevCB.Caption=�C�L�ܫe�@��' + #13#10 +
      'MirrorMarginsCB.Caption=��g���' + #13#10 +
      'LargeHeightCB.Caption=�b�]�p�Ҧ��ϥΤj���ȱi����' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=��������ƶ�' + #13#10 +
      'OKB.Caption=�T�{' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=�s���ܼ�' + #13#10 +
      'NewCategoryB.Caption=Category' + #13#10 +
      'NewVarB.Caption=�ܼ�' + #13#10 +
      'EditB.Caption=�s��' + #13#10 +
      'DeleteB.Caption=�R��' + #13#10 +
      'EditListB.Caption=�M��' + #13#10 +
      'LoadB.Caption=���J' + #13#10 +
      'SaveB.Caption=�x�s' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      'OkB.Caption=�T�{' + #13#10 +
      'ExprPanel.Caption= �B�⦡:' + #13#10 +
      'OpenDialog1.Filter=Dictionary (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Dictionary (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(���w�q�ܼ�)');
    Add('vaVar', '�ܼ�');
    Add('vaDupName', '�W�٭���');

    Add('TfrxOptionsEditor',
      'Caption=�]�p�ﶵ' + #13#10 +
      'Label1.Caption=��l   ' + #13#10 +
      'Label2.Caption=���A' + #13#10 +
      'Label3.Caption=�j�p' + #13#10 +
      'Label4.Caption=��ܵ���:' + #13#10 +
      'Label5.Caption=��L   ' + #13#10 +
      'Label6.Caption=�r��   ' + #13#10 +
      'Label7.Caption=�{���X����' + #13#10 +
      'Label8.Caption=��r�s�边' + #13#10 +
      'Label9.Caption=�j�p' + #13#10 +
      'Label10.Caption=�j�p' + #13#10 +
      'Label11.Caption=�C��   ' + #13#10 +
      'Label12.Caption=���Z:' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=in' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=�T�{' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      'CMRB.Caption=����:' + #13#10 +
      'InchesRB.Caption=�^�T:' + #13#10 +
      'PixelsRB.Caption=����:' + #13#10 +
      'ShowGridCB.Caption=��ܮ�l' + #13#10 +
      'AlignGridCB.Caption=�P��l����' + #13#10 +
      'EditAfterInsCB.Caption=���J����ܽs�边' + #13#10 +
      'ObjectFontCB.Caption=�ϥΪ��󪺦r���]�w' + #13#10 +
      'WorkspaceB.Caption=�u�@�Ŷ�' + #13#10 +
      'ToolB.Caption=�u�����' + #13#10 +
      'LCDCB.Caption=LCD ��l�C��' + #13#10 +
      'FreeBandsCB.Caption=�ۥ��\�]Band����m' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=�^�s�w�]��' + #13#10 +
      'BandsCaptionsCB.Caption=���Band�����D' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=�����ƶ�' + #13#10 +
      'OkB.Caption=�T�{' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      '');
    Add('dbNotAssigned', '[�����w]');
    Add('dbSingleLine', '�浧');

    Add('TfrxGroupEditorForm',
      'Caption=�s��' + #13#10 +
      'BreakOnL.Caption=�s�դ��j��   ' + #13#10 +
      'OptionsL.Caption=�ﶵ   ' + #13#10 +
      'OKB.Caption=�T�{' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      'DataFieldRB.Caption=������' + #13#10 +
      'ExpressionRB.Caption=�B�⦡' + #13#10 +
      'KeepGroupTogetherCB.Caption=�O���P�s�զb�@�_' + #13#10 +
      'StartNewPageCB.Caption=����' + #13#10 +
      'OutlineCB.Caption=��ܦb�j��' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=�t�γƧ�' + #13#10 +
      'DataBandL.Caption=���band' + #13#10 +
      'DataSetL.Caption=��ƶ�' + #13#10 +
      'DataFieldL.Caption=������' + #13#10 +
      'FunctionL.Caption=���' + #13#10 +
      'ExpressionL.Caption=��ܦ�' + #13#10 +
      'OKB.Caption=�T�{' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      'AggregateRB.Caption=Aggregate value' + #13#10 +
      'SysVariableRB.Caption=�t���ܼ�' + #13#10 +
      'CountInvisibleCB.Caption=�p�⤣�i��band���ƥ�' + #13#10 +
      'TextRB.Caption=��r' + #13#10 +
      'RunningTotalCB.Caption=�����`��' + #13#10 +
      '');
    Add('agAggregate', '���J�X�p');
    Add('vt1', '[DATE]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGES#]');
    Add('vt5', '[PAGE#] of [TOTALPAGES#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=OLE ����' + #13#10 +
      'InsertB.Caption=���J...' + #13#10 +
      'EditB.Caption=�s��...' + #13#10 +
      'CloseB.Caption=����' + #13#10 +
      '');
    Add('olStretched', 'Stretched');

    Add('TfrxBarcodeEditorForm',
      'Caption=���X�s�边' + #13#10 +
      'CodeLbl.Caption=�X' + #13#10 +
      'TypeLbl.Caption=���X����' + #13#10 +
      'ZoomLbl.Caption=��v:' + #13#10 +
      'OptionsLbl.Caption=�ﶵ   ' + #13#10 +
      'RotationLbl.Caption=����   ' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      'OkB.Caption=�T�{' + #13#10 +
      'CalcCheckSumCB.Caption=�p���ˬd�X ' + #13#10 +
      'ViewTextCB.Caption=��r' + #13#10 +
      'Rotation0RB.Caption=0��' + #13#10 +
      'Rotation90RB.Caption=90��' + #13#10 +
      'Rotation180RB.Caption=180��' + #13#10 +
      'Rotation270RB.Caption=270��' + #13#10 +
      '');
    Add('bcCalcChecksum', '�p���ˬd�X');
    Add('bcShowText', '��ܤ�r');

    Add('TfrxAliasesEditorForm',
      'Caption=�s��O�W' + #13#10 +
      'HintL.Caption=�� Enter �s�趵��' + #13#10 +
      'DSAliasL.Caption=��ƶ��O�W' + #13#10 +
      'FieldAliasesL.Caption=���O�W' + #13#10 +
      'OkB.Caption=�T�{' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      'ResetB.Caption=���m' + #13#10 +
      'UpdateB.Caption=Update' + #13#10 +
      '');
    Add('alUserName', '�ϥΪ̦W��');
    Add('alOriginal', '��Ӫ��W��');

    Add('TfrxParamsEditorForm',
      'Caption=�Ѽƽs�边' + #13#10 +
      'OkB.Caption=�T�{' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      '');
    Add('qpName', '�W��');
    Add('qpDataType', '��ƫ��A');
    Add('qpValue', '��');

    Add('TfrxMDEditorForm',
      'Caption=Master-Detail �s��' + #13#10 +
      'Label1.Caption=Detail ���' + #13#10 +
      'Label2.Caption=Master ���' + #13#10 +
      'Label3.Caption=Linked ���' + #13#10 +
      'AddB.Caption=�s�W' + #13#10 +
      'ClearB.Caption=�M��' + #13#10 +
      'OkB.Caption=�T�{' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=�Ƨ�' + #13#10 +
      'ExprB.Hint=���J�B�⦡' + #13#10 +
      'AggregateB.Hint=���J�X�p' + #13#10 +
      'LocalFormatB.Hint=���J��X�榡' + #13#10 +
      'WordWrapB.Hint=��r�۰ʴ���' + #13#10 +
      'CancelB.Hint=����' + #13#10 +
      'OkB.Hint=�T�w' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=�Ϲ�' + #13#10 +
      'LoadB.Hint=���J' + #13#10 +
      'CopyB.Hint=�ƻs' + #13#10 +
      'PasteB.Hint=�K�W' + #13#10 +
      'ClearB.Hint=�M��' + #13#10 +
      'CancelB.Hint=����' + #13#10 +
      'OkB.Hint=�T�{' + #13#10 +
      '');
    Add('piEmpty', '�M��');

    Add('TfrxChartEditorForm',
      'Caption=�έp�Ͻs�边' + #13#10 +
      'OkB.Caption=�T�{' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=�s�W�t�C' + #13#10 +
      'DeleteB.Hint=�R���t�C' + #13#10 +
      'DBSourceRB.Caption=��ƨӦ۸�Ʈw' + #13#10 +
      'FixedDataRB.Caption=�T�w���' + #13#10 +
      'DatasetLbl.Caption=��ƶ�' + #13#10 +
      'X1Lbl.Caption=X ��' + #13#10 +
      'Y1Lbl.Caption=Y ��' + #13#10 +
      'X3Lbl.Caption=X �� (�Ҧp, a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Y �� (�Ҧp, 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=��L�ﶵ   ' + #13#10 +
      'ShowTopLbl.Caption=�eN�W����' + #13#10 +
      'CaptionLbl.Caption=�eN�W�����D' + #13#10 +
      'SortLbl.Caption=�ƦC����' + #13#10 +
      'LineMI.Caption=Line' + #13#10 +
      'AreaMI.Caption=Area' + #13#10 +
      'PointMI.Caption=Point' + #13#10 +
      'BarMI.Caption=Bar' + #13#10 +
      'HorizBarMI.Caption=Horiz. Bar' + #13#10 +
      'PieMI.Caption=Pie' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Fast Line' + #13#10 +
      '');
    Add('ch3D', '3D �˵�');
    Add('chAxis', '��ܶb');
    Add('chsoNone', '�L');
    Add('chsoAscending', '���W');
    Add('chsoDescending', '����');

    Add('TfrxRichEditorForm',
      'Caption=RTF ���s�边' + #13#10 +
      'OpenB.Hint=�}���ɮ�' + #13#10 +
      'SaveB.Hint=�x�s�ɮ�' + #13#10 +
      'UndoB.Hint=�_��' + #13#10 +
      'TTB.Hint=�r��' + #13#10 +
      'ExprB.Hint=���J�B�⦡' + #13#10 +
      'CancelB.Hint=����' + #13#10 +
      'OkB.Hint=�T�{' + #13#10 +
      'BoldB.Hint=����' + #13#10 +
      'ItalicB.Hint=����' + #13#10 +
      'UnderlineB.Hint=���u' + #13#10 +
      'LeftAlignB.Hint=���a' + #13#10 +
      'CenterAlignB.Hint=�m��' + #13#10 +
      'RightAlignB.Hint=�k�a' + #13#10 +
      'BlockAlignB.Hint=�϶�����' + #13#10 +
      'BulletsB.Hint=�ۭ���' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=��e����s�边' + #13#10 +
      'DatasetL.Caption=�ӷ����   ' + #13#10 +
      'DimensionsL.Caption=�Ŷ�   ' + #13#10 +
      'RowsL.Caption=�C' + #13#10 +
      'ColumnsL.Caption=��' + #13#10 +
      'CellsL.Caption=�p���' + #13#10 +
      'StructureL.Caption=��e�����c   ' + #13#10 +
      'RowHeaderCB.Caption=�C��' + #13#10 +
      'ColumnHeaderCB.Caption=�歺' + #13#10 +
      'RowTotalCB.Caption=�C�`�p' + #13#10 +
      'ColumnTotalCB.Caption=���`�p' + #13#10 +
      'SwapB.Hint=�C/�椬��' + #13#10 +
      'StyleCB.Hint=��e����˦�' + #13#10 +
      'FontB.Hint=�r���]�w' + #13#10 +
      'AlignLeftB.Hint=�������' + #13#10 +
      'AlignCenterB.Hint=��������' + #13#10 +
      'AlignRightB.Hint=�k�����' + #13#10 +
      'RotationB.Hint=��r����' + #13#10 +
      'HighlightB.Hint=����' + #13#10 +
      'FormatB.Hint=�榡' + #13#10 +
      'FrameB.Hint=�~�س]�w' + #13#10 +
      'FillColorB.Hint=���C��' + #13#10 +
      'Func1MI.Caption=�L' + #13#10 +
      'Func2MI.Caption=�X�p' + #13#10 +
      'Func3MI.Caption=�̤p��' + #13#10 +
      'Func4MI.Caption=�̤j��' + #13#10 +
      'Func5MI.Caption=������' + #13#10 +
      'Func6MI.Caption=�p��' + #13#10 +
      'Sort1MI.Caption=���W (A-Z)' + #13#10 +
      'Sort2MI.Caption=���� (Z-A)' + #13#10 +
      'Sort3MI.Caption=���Ƨ�' + #13#10 +
      'BoldMI.Caption=����' + #13#10 +
      'ItalicMI.Caption=����' + #13#10 +
      'UnderlineMI.Caption=���u' + #13#10 +
      'SuperScriptMI.Caption=�W��' + #13#10 +
      'SubScriptMI.Caption=�U��' + #13#10 +
      'CondensedMI.Caption=���Y' + #13#10 +
      'WideMI.Caption=�e' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=����' + #13#10 +
      'OkB.Hint=�T�{' + #13#10 +
      '');
    Add('crSubtotal', '�p�p');
    Add('crNone', '�L');
    Add('crSum', '�X�p');
    Add('crMin', '�̤p��');
    Add('crMax', '�̤j��');
    Add('crAvg', '������');
    Add('crCount', '�p��');
    Add('crAsc', 'A-Z');
    Add('crDesc', 'Z-A');
    Add('crFillMx', '��J��e����...');
    Add('crBuildMx', '�إߥ�e����...');
    Add('crRepHdrs', '���s�C�L���Y');
    Add('crBorder', '�~��');
    Add('crDown', '�ѤW�ӤU�A�ѥ��ܥk');

    Add('TfrxExprEditorForm',
      'Caption=�B�⦡�s�边' + #13#10 +
      'ExprL.Caption=�B�⦡:' + #13#10 +
      'OkB.Caption=�T�{' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=��ܮ榡' + #13#10 +
      'CategoryL.Caption=���O' + #13#10 +
      'FormatL.Caption=�榡' + #13#10 +
      'FormatStrL.Caption=�榡�r��:' + #13#10 +
      'SeparatorL.Caption=�p���I���j�r��:' + #13#10 +
      'OkB.Caption=�T�{' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      '');
    Add('fkText', '��r (���榡��)');
    Add('fkNumber', '�Ʀr');
    Add('fkDateTime', '���/�ɶ�');
    Add('fkBoolean', '���L');
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
      'Caption=����' + #13#10 +
      'FontColorB.Caption=�C��...' + #13#10 +
      'BackColorB.Caption=�C��...' + #13#10 +
      'ConditionL.Caption=����   ' + #13#10 +
      'FontL.Caption=�r��   ' + #13#10 +
      'BackgroundL.Caption=�I��   ' + #13#10 +
      'OKB.Caption=�T�{' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      'BoldCB.Caption=����' + #13#10 +
      'ItalicCB.Caption=����' + #13#10 +
      'UnderlineCB.Caption=���u' + #13#10 +
      'TransparentRB.Caption=�z��' + #13#10 +
      'OtherRB.Caption=��L' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=����]�w' + #13#10 +
      'OkB.Caption=�T�{' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      'GeneralTS.Caption=General' + #13#10 +
      'ReportSettingsL.Caption=�L����]�w   ' + #13#10 +
      'CopiesL.Caption=�C�L����' + #13#10 +
      'GeneralL.Caption=General   ' + #13#10 +
      'PasswordL.Caption=�K�X' + #13#10 +
      'CollateCB.Caption=Collate copies' + #13#10 +
      'DoublePassCB.Caption=Double pass' + #13#10 +
      'PrintIfEmptyCB.Caption=Print if empty' + #13#10 +
      'DescriptionTS.Caption=�y�z' + #13#10 +
      'NameL.Caption=�W��' + #13#10 +
      'Description1L.Caption=�y�z' + #13#10 +
      'PictureL.Caption=�Ϲ�' + #13#10 +
      'AuthorL.Caption=�@��' + #13#10 +
      'MajorL.Caption=Major' + #13#10 +
      'MinorL.Caption=Minor' + #13#10 +
      'ReleaseL.Caption=Release' + #13#10 +
      'BuildL.Caption=Build' + #13#10 +
      'CreatedL.Caption=�إ�' + #13#10 +
      'ModifiedL.Caption=�ק�' + #13#10 +
      'DescriptionL.Caption=�y�z   ' + #13#10 +
      'VersionL.Caption=����   ' + #13#10 +
      'PictureB.Caption=�s��...' + #13#10 +
      '');
    Add('rePrnOnPort', '�b');

    Add('TfrxStringsEditorForm',
      'Caption=�r��M��' + #13#10 +
      'CancelB.Hint=����' + #13#10 +
      'OkB.Hint=�T�{' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=����' + #13#10 +
      'OkB.Hint=�T�{' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=�K�X' + #13#10 +
      'PasswordL.Caption=��J�K�X:' + #13#10 +
      'OkB.Caption=�T�{' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=�˦��s�边' + #13#10 +
      'ColorB.Caption=�C��...' + #13#10 +
      'FontB.Caption=�r��...' + #13#10 +
      'FrameB.Caption=�~��...' + #13#10 +
      'AddB.Hint=�[�J' + #13#10 +
      'DeleteB.Hint=�R��' + #13#10 +
      'EditB.Hint=�s��' + #13#10 +
      'LoadB.Hint=���J' + #13#10 +
      'SaveB.Hint=�x�s' + #13#10 +
      'CancelB.Hint=����' + #13#10 +
      'OkB.Hint=�T�{' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=�~�ؽs�边' + #13#10 +
      'FrameL.Caption=�~��' + #13#10 +
      'LineL.Caption=�ؽu' + #13#10 +
      'ShadowL.Caption=���v' + #13#10 +
      'FrameTopB.Hint=�W�u' + #13#10 +
      'FrameBottomB.Hint=���u' + #13#10 +
      'FrameLeftB.Hint=���u' + #13#10 +
      'FrameRightB.Hint=�k�u' + #13#10 +
      'FrameAllB.Hint=�~�ؽu' + #13#10 +
      'FrameNoB.Hint=�L�ؽu' + #13#10 +
      'FrameColorB.Hint=�~���C��' + #13#10 +
      'FrameStyleB.Hint=�~�ؼ˦�' + #13#10 +
      'FrameWidthCB.Hint=�~�ؼe��' + #13#10 +
      'ShadowB.Hint=���v' + #13#10 +
      'ShadowColorB.Hint=���v�C��' + #13#10 +
      'ShadowWidthCB.Hint=���v�e��' + #13#10 +
      'OkB.Caption=�T�{' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=�s����' + #13#10 +
      'ItemsTab.Caption=����' + #13#10 +
      'TemplatesTab.Caption=�˪O' + #13#10 +
      'OkB.Caption=�T�{' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Tab�䦸��' + #13#10 +
      'Label1.Caption=�����Tab�䦸��:' + #13#10 +
      'OkB.Caption=�T�{' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      'UpB.Caption=�W��' + #13#10 +
      'DownB.Caption=�U��' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=�D��' + #13#10 +
      'Label1.Caption=�B�⦡' + #13#10 +
      'Label2.Caption=���G' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=������F' + #13#10 +
      'DataTab.Caption=���' + #13#10 +
      'GroupsTab.Caption=�s��' + #13#10 +
      'LayoutTab.Caption=�榡' + #13#10 +
      'StyleTab.Caption=�˦�' + #13#10 +
      'Step1L.Caption=Step 1. ����n��ܪ���ƶ������.' + #13#10 +
      'Step2L.Caption=Step 2. �إ߸s�� (�ﶵ).' + #13#10 +
      'Step3L.Caption=Step 3. �w�q������V�θ�Ʈ榡.' + #13#10 +
      'Step4L.Caption=Step 4. ��ܳ���˦�.' + #13#10 +
      'AddFieldB.Caption=�[�J >' + #13#10 +
      'AddAllFieldsB.Caption=�����[�J >>' + #13#10 +
      'RemoveFieldB.Caption=< ����' + #13#10 +
      'RemoveAllFieldsB.Caption=<< ��������' + #13#10 +
      'AddGroupB.Caption=�[�J >' + #13#10 +
      'RemoveGroupB.Caption=< ����' + #13#10 +
      'SelectedFieldsL.Caption=��������:' + #13#10 +
      'AvailableFieldsL.Caption=�i�Ϊ����:' + #13#10 +
      'GroupsL.Caption=�s��:' + #13#10 +
      'OrientationL.Caption=��V   ' + #13#10 +
      'LayoutL.Caption=�榡   ' + #13#10 +
      'PortraitRB.Caption=���L' + #13#10 +
      'LandscapeRB.Caption=��L' + #13#10 +
      'TabularRB.Caption=Tabular' + #13#10 +
      'ColumnarRB.Caption=Columnar' + #13#10 +
      'FitWidthCB.Caption=�վ����ܭ����e��' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      'BackB.Caption=<< �W�@�B' + #13#10 +
      'NextB.Caption=�U�@�B >>' + #13#10 +
      'FinishB.Caption=����' + #13#10 +
      '');
    Add('wzStd', '�зǳ�����F');
    Add('wzDMP', '�I�x�}������F');
    Add('wzStdEmpty', '�зǳ���');
    Add('wzDMPEmpty', '�I�x�}����');


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