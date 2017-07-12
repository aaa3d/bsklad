
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
      'Caption=����鿴��' + #13#10 +
      '');
    Add('oiProp', '����');
    Add('oiEvent', '�¼�');

    Add('TfrxDataTreeForm',
      'Caption=������' + #13#10 +
      'DataTS.Caption=����' + #13#10 +
      'VariablesTS.Caption=����' + #13#10 +
      'FunctionsTS.Caption=����' + #13#10 +
      'InsFieldCB.Caption=�����ֶ�' + #13#10 +
      'InsCaptionCB.Caption=��������' + #13#10 +
      '');
    Add('dtNoData', 'û�����ݿ����ʹ��');
    Add('dtData', '����');
    Add('dtSysVar', 'ϵͳ����');
    Add('dtVar', '����');
    Add('dtFunc', '����');

    Add('TfrxReportTreeForm',
      'Caption=������' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=�򿪽ű�' + #13#10 +
      'SaveScriptB.Hint=����ű�' + #13#10 +
      'RunScriptB.Hint=ִ�нű�' + #13#10 +
      'StepScriptB.Hint=׷����' + #13#10 +
      'StopScriptB.Hint=�����ű�' + #13#10 +
      'EvaluateB.Hint=��ֵ' + #13#10 +
      'LangL.Caption=����:' + #13#10 +
      'AlignTB.Caption=����' + #13#10 +
      'AlignLeftsB.Hint=����' + #13#10 +
      'AlignHorzCentersB.Hint=ˮƽ����' + #13#10 +
      'AlignRightsB.Hint=����' + #13#10 +
      'AlignTopsB.Hint=����' + #13#10 +
      'AlignVertCentersB.Hint=��ֱ����' + #13#10 +
      'AlignBottomsB.Hint=���' + #13#10 +
      'SpaceHorzB.Hint=ˮƽ�ռ�' + #13#10 +
      'SpaceVertB.Hint=��ֱ�ռ�' + #13#10 +
      'CenterHorzB.Hint=ˮƽ����' + #13#10 +
      'CenterVertB.Hint=��ֱ����' + #13#10 +
      'SameWidthB.Hint=��ͬ���' + #13#10 +
      'SameHeightB.Hint=��ͬ�߶�' + #13#10 +
      'TextTB.Caption=�ı�' + #13#10 +
      'StyleCB.Hint=��ʽ' + #13#10 +
      'FontNameCB.Hint=��������' + #13#10 +
      'FontSizeCB.Hint=�����С' + #13#10 +
      'BoldB.Hint=����' + #13#10 +
      'ItalicB.Hint=б��' + #13#10 +
      'UnderlineB.Hint=����' + #13#10 +
      'FontColorB.Hint=������ɫ' + #13#10 +
      'HighlightB.Hint=ǿ��' + #13#10 +
      'RotateB.Hint=�ı�����' + #13#10 +
      'TextAlignLeftB.Hint=�����' + #13#10 +
      'TextAlignCenterB.Hint=����' + #13#10 +
      'TextAlignRightB.Hint=�Ҷ���' + #13#10 +
      'TextAlignBlockB.Hint=�����' + #13#10 +
      'TextAlignTopB.Hint=��������' + #13#10 +
      'TextAlignMiddleB.Hint=��ֱ����' + #13#10 +
      'TextAlignBottomB.Hint=�ײ�����' + #13#10 +
      'FrameTB.Caption=���' + #13#10 +
      'FrameTopB.Hint=�Ϸ���' + #13#10 +
      'FrameBottomB.Hint=�·���' + #13#10 +
      'FrameLeftB.Hint=�����' + #13#10 +
      'FrameRightB.Hint=�ұ���' + #13#10 +
      'FrameAllB.Hint=����' + #13#10 +
      'FrameNoB.Hint=û�б߿�' + #13#10 +
      'ShadowB.Hint=��Ӱ' + #13#10 +
      'FillColorB.Hint=������ɫ' + #13#10 +
      'FrameColorB.Hint=�����ɫ' + #13#10 +
      'FrameStyleB.Hint=�����ʽ' + #13#10 +
      'FrameWidthCB.Hint=�����' + #13#10 +
      'StandardTB.Caption=��׼' + #13#10 +
      'NewB.Hint=�±���' + #13#10 +
      'OpenB.Hint=�򿪱���' + #13#10 +
      'SaveB.Hint=���汨��' + #13#10 +
      'PreviewB.Hint=Ԥ��' + #13#10 +
      'NewPageB.Hint=�±���ҳ��' + #13#10 +
      'NewDialogB.Hint=�¶Ի���' + #13#10 +
      'DeletePageB.Hint=ɾ��ҳ' + #13#10 +
      'PageSettingsB.Hint=ҳ������' + #13#10 +
      'VariablesB.Hint=����' + #13#10 +
      'CutB.Hint=����' + #13#10 +
      'CopyB.Hint=����' + #13#10 +
      'PasteB.Hint=ճ��' + #13#10 +
      'SampleFormatB.Hint=���Ƹ�ʽ' + #13#10 +
      'UndoB.Hint=����' + #13#10 +
      'RedoB.Hint=�ظ�' + #13#10 +
      'GroupB.Hint=Ⱥ��' + #13#10 +
      'UngroupB.Hint=ȡ��Ⱥ��' + #13#10 +
      'ShowGridB.Hint=��ʾɺ��' + #13#10 +
      'AlignToGridB.Hint=ɺ�����' + #13#10 +
      'SetToGridB.Hint=Fit to Grid' + #13#10 +
      'ScaleCB.Hint=��ʾ����' + #13#10 +
      'ExtraToolsTB.Caption=���⹤��' + #13#10 +
      'ObjectSelectB.Hint=ѡȡ����' + #13#10 +
      'HandToolB.Hint=ͽ�ֹ���' + #13#10 +
      'ZoomToolB.Hint=��ʾ���ʹ���' + #13#10 +
      'TextToolB.Hint=�༭�ı�����' + #13#10 +
      'FormatToolB.Hint=���Ƹ�ʽ����' + #13#10 +
      'ObjectBandB.Hint=����Band' + #13#10 +
      'FileMenu.Caption=�ļ�(&F)' + #13#10 +
      'EditMenu.Caption=�༭(&E)' + #13#10 +
      'FindMI.Caption=����...' + #13#10 +
      'FindNextMI.Caption=����һ��' + #13#10 +
      'ReplaceMI.Caption=�滻...' + #13#10 +
      'ReportMenu.Caption=����(&R)' + #13#10 +
      'ReportDataMI.Caption=����...' + #13#10 +
      'ReportSettingsMI.Caption=ѡ��...' + #13#10 +
      'ReportStylesMI.Caption=��ʽ...' + #13#10 +
      'ViewMenu.Caption=��ͼ(&V)' + #13#10 +
      'ToolbarsMI.Caption=������' + #13#10 +
      'StandardMI.Caption=��׼' + #13#10 +
      'TextMI.Caption=�ı�' + #13#10 +
      'FrameMI.Caption=����' + #13#10 +
      'AlignmentMI.Caption=����' + #13#10 +
      'ToolsMI.Caption=����' + #13#10 +
      'InspectorMI.Caption=����鿴��' + #13#10 +
      'DataTreeMI.Caption=������' + #13#10 +
      'ReportTreeMI.Caption=������' + #13#10 +
      'ShowRulersMI.Caption=���' + #13#10 +
      'ShowGuidesMI.Caption=��' + #13#10 +
      'DeleteGuidesMI.Caption=ɾ����' + #13#10 +
      'OptionsMI.Caption=ѡ��...' + #13#10 +
      'HelpMenu.Caption=����(&H)' + #13#10 +
      'HelpContentsMI.Caption=����...' + #13#10 +
      'AboutMI.Caption=���� FastReport...' + #13#10 +
      'TabOrderMI.Caption=Tab ����...' + #13#10 +
      'UndoCmd.Caption=����' + #13#10 +
      'RedoCmd.Caption=�ظ�' + #13#10 +
      'CutCmd.Caption=����' + #13#10 +
      'CopyCmd.Caption=����' + #13#10 +
      'PasteCmd.Caption=ճ��' + #13#10 +
      'GroupCmd.Caption=Ⱥ��' + #13#10 +
      'UngroupCmd.Caption=ȡ��Ⱥ��' + #13#10 +
      'DeleteCmd.Caption=ɾ��' + #13#10 +
      'DeletePageCmd.Caption=ɾ��ҳ' + #13#10 +
      'SelectAllCmd.Caption=ȫѡ' + #13#10 +
      'EditCmd.Caption=�༭...' + #13#10 +
      'BringToFrontCmd.Caption=���ڶ���' + #13#10 +
      'SendToBackCmd.Caption=���ڵײ�' + #13#10 +
      'NewItemCmd.Caption=�½�...' + #13#10 +
      'NewReportCmd.Caption=�±���' + #13#10 +
      'NewPageCmd.Caption=��ҳ��' + #13#10 +
      'NewDialogCmd.Caption=�¶Ի���' + #13#10 +
      'OpenCmd.Caption=��...' + #13#10 +
      'SaveCmd.Caption=����' + #13#10 +
      'SaveAsCmd.Caption=���Ϊ...' + #13#10 +
      'VariablesCmd.Caption=����...' + #13#10 +
      'PageSettingsCmd.Caption=ҳ������...' + #13#10 +
      'PreviewCmd.Caption=Ԥ��' + #13#10 +
      'ExitCmd.Caption=�˳�' + #13#10 +
      'ReportTitleMI.Caption=����̧ͷ' + #13#10 +
      'ReportSummaryMI.Caption=����ϼ�' + #13#10 +
      'PageHeaderMI.Caption=ҳ��' + #13#10 +
      'PageFooterMI.Caption=ҳβ' + #13#10 +
      'HeaderMI.Caption=ͷ' + #13#10 +
      'FooterMI.Caption=β' + #13#10 +
      'MasterDataMI.Caption=������' + #13#10 +
      'DetailDataMI.Caption=��ϸ����' + #13#10 +
      'SubdetailDataMI.Caption=����������' + #13#10 +
      'Data4levelMI.Caption=��4������' + #13#10 +
      'Data5levelMI.Caption=��5������' + #13#10 +
      'Data6levelMI.Caption=��6������' + #13#10 +
      'GroupHeaderMI.Caption=Ⱥ����' + #13#10 +
      'GroupFooterMI.Caption=Ⱥ��β' + #13#10 +
      'ChildMI.Caption=��' + #13#10 +
      'ColumnHeaderMI.Caption=����' + #13#10 +
      'ColumnFooterMI.Caption=��β' + #13#10 +
      'OverlayMI.Caption=�ص�' + #13#10 +
      'VerticalbandsMI.Caption=��ֱBand' + #13#10 +
      'HeaderMI1.Caption=ͷ' + #13#10 +
      'FooterMI1.Caption=β' + #13#10 +
      'MasterDataMI1.Caption=������' + #13#10 +
      'DetailDataMI1.Caption=��ϸ����' + #13#10 +
      'SubdetailDataMI1.Caption=����ϸ����' + #13#10 +
      'GroupHeaderMI1.Caption=Ⱥ����' + #13#10 +
      'GroupFooterMI1.Caption=Ⱥ��β' + #13#10 +
      'ChildMI1.Caption=��' + #13#10 +
      'R0MI.Caption=0��' + #13#10 +
      'R45MI.Caption=45��' + #13#10 +
      'R90MI.Caption=90��' + #13#10 +
      'R180MI.Caption=180��' + #13#10 +
      'R270MI.Caption=270��' + #13#10 +
      'FontB.Hint=��������' + #13#10 +
      'BoldMI.Caption=����' + #13#10 +
      'ItalicMI.Caption=б��' + #13#10 +
      'UnderlineMI.Caption=����' + #13#10 +
      'SuperScriptMI.Caption=SuperScript' + #13#10 +
      'SubScriptMI.Caption=SubScript' + #13#10 +
      'CondensedMI.Caption=ѹ��' + #13#10 +
      'WideMI.Caption=��' + #13#10 +
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
    Add('dsSavePreviewChanges', '��������Ԥ��ҳ��?');
    Add('dsSaveChangesTo', '�����޸��� ');
    Add('dsCantLoad', '�޷������ļ�');
    Add('dsStyleFile', '��ʽ');
    Add('dsCantFindProc', '�Ҳ���������');
    Add('dsClearScript', '������еĽű�����Ҫ������?');
    Add('dsNoStyle', 'û����ʽ');
    Add('dsStyleSample', '��ʽ����');
    Add('dsTextNotFound', '�ı� ''%s'' �Ҳ���');
    Add('dsReplace', '�滻�ı� ''%s''?');

    Add('TfrxAboutForm',
      'Caption=���� FastReport' + #13#10 +
      'Label4.Caption=�������ǵ���վ��ȡ�ø������Ϣ:' + #13#10 +
      'Label6.Caption=����:' + #13#10 +
      'Label8.Caption=֧Ԯ:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=ҳ������' + #13#10 +
      'OKB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      'TabSheet1.Caption=ֽ��' + #13#10 +
      'Label1.Caption=���' + #13#10 +
      'Label2.Caption=�߶�' + #13#10 +
      'Label11.Caption=��С   ' + #13#10 +
      'Label12.Caption=����   ' + #13#10 +
      'Label3.Caption=��߾�' + #13#10 +
      'Label4.Caption=�ϱ߾�' + #13#10 +
      'Label5.Caption=�ұ߾�' + #13#10 +
      'Label6.Caption=�±߾�' + #13#10 +
      'Label13.Caption=�߾�   ' + #13#10 +
      'Label14.Caption=ֽ����Դ   ' + #13#10 +
      'Label9.Caption=��һҳ' + #13#10 +
      'Label10.Caption=����ҳ' + #13#10 +
      'PortraitRB.Caption=����' + #13#10 +
      'LandscapeRB.Caption=����' + #13#10 +
      'TabSheet3.Caption=����ѡ��' + #13#10 +
      'Label7.Caption=����   ' + #13#10 +
      'Label8.Caption=����' + #13#10 +
      'Label15.Caption=�����' + #13#10 +
      'Label16.Caption=λ��' + #13#10 +
      'Label17.Caption=����   ' + #13#10 +
      'Label18.Caption=˫���ӡ' + #13#10 +
      'PrintOnPrevCB.Caption=��ӡ��ǰһҳ' + #13#10 +
      'MirrorMarginsCB.Caption=��չ����ӡ��' + #13#10 +
      'LargeHeightCB.Caption=�����ģʽʹ�ô��ֽ�Ÿ߶�' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=ѡȡ�������ݿ�' + #13#10 +
      'OKB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=�༭����' + #13#10 +
      'NewCategoryB.Caption=Category' + #13#10 +
      'NewVarB.Caption=����' + #13#10 +
      'EditB.Caption=�༭' + #13#10 +
      'DeleteB.Caption=ɾ��' + #13#10 +
      'EditListB.Caption=�嵥' + #13#10 +
      'LoadB.Caption=����' + #13#10 +
      'SaveB.Caption=����' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      'OkB.Caption=ȷ��' + #13#10 +
      'ExprPanel.Caption= ����ʽ:' + #13#10 +
      'OpenDialog1.Filter=Dictionary (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Dictionary (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(δ�������)');
    Add('vaVar', '����');
    Add('vaDupName', '�����ظ�');

    Add('TfrxOptionsEditor',
      'Caption=���ѡ��' + #13#10 +
      'Label1.Caption=ɺ��   ' + #13#10 +
      'Label2.Caption=����' + #13#10 +
      'Label3.Caption=��С' + #13#10 +
      'Label4.Caption=�Ի���:' + #13#10 +
      'Label5.Caption=����   ' + #13#10 +
      'Label6.Caption=����   ' + #13#10 +
      'Label7.Caption=����༭��' + #13#10 +
      'Label8.Caption=�ı��༭��' + #13#10 +
      'Label9.Caption=��С' + #13#10 +
      'Label10.Caption=��С' + #13#10 +
      'Label11.Caption=��ɫ   ' + #13#10 +
      'Label12.Caption=���:' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=in' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      'CMRB.Caption=����:' + #13#10 +
      'InchesRB.Caption=Ӣ��:' + #13#10 +
      'PixelsRB.Caption=����:' + #13#10 +
      'ShowGridCB.Caption=��ʾɺ��' + #13#10 +
      'AlignGridCB.Caption=ɺ�����' + #13#10 +
      'EditAfterInsCB.Caption=�������ʾ�༭��' + #13#10 +
      'ObjectFontCB.Caption=ʹ�ö������������' + #13#10 +
      'WorkspaceB.Caption=�����ռ�' + #13#10 +
      'ToolB.Caption=�����Ӵ�' + #13#10 +
      'LCDCB.Caption=LCD ɺ����ɫ' + #13#10 +
      'FreeBandsCB.Caption=���ɰ���Band��λ��' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=��ԭĬ������' + #13#10 +
      'BandsCaptionsCB.Caption=��ʾBand�ı���' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=ѡȡ���ݿ�' + #13#10 +
      'OkB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      '');
    Add('dbNotAssigned', '[δָ��]');
    Add('dbSingleLine', '����');

    Add('TfrxGroupEditorForm',
      'Caption=Ⱥ��' + #13#10 +
      'BreakOnL.Caption=Ⱥ��ָ���   ' + #13#10 +
      'OptionsL.Caption=ѡ��   ' + #13#10 +
      'OKB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      'DataFieldRB.Caption=�����ֶ�' + #13#10 +
      'ExpressionRB.Caption=����ʽ' + #13#10 +
      'KeepGroupTogetherCB.Caption=������Ⱥ����һ��' + #13#10 +
      'StartNewPageCB.Caption=��ҳ' + #13#10 +
      'OutlineCB.Caption=��ʾ�ڴ��' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=ϵͳ����' + #13#10 +
      'DataBandL.Caption=����band' + #13#10 +
      'DataSetL.Caption=���ݿ�' + #13#10 +
      'DataFieldL.Caption=�����ֶ�' + #13#10 +
      'FunctionL.Caption=����' + #13#10 +
      'ExpressionL.Caption=��ʾʽ' + #13#10 +
      'OKB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      'AggregateRB.Caption=Aggregate value' + #13#10 +
      'SysVariableRB.Caption=ϵͳ����' + #13#10 +
      'CountInvisibleCB.Caption=���㲻�ɼ�band����Ŀ' + #13#10 +
      'TextRB.Caption=�ı�' + #13#10 +
      'RunningTotalCB.Caption=ִ������' + #13#10 +
      '');
    Add('agAggregate', '����ϼ�');
    Add('vt1', '[DATE]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGES#]');
    Add('vt5', '[PAGE#] of [TOTALPAGES#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=OLE ����' + #13#10 +
      'InsertB.Caption=����...' + #13#10 +
      'EditB.Caption=�༭...' + #13#10 +
      'CloseB.Caption=�ر�' + #13#10 +
      '');
    Add('olStretched', 'Stretched');

    Add('TfrxBarcodeEditorForm',
      'Caption=����༭��' + #13#10 +
      'CodeLbl.Caption=��' + #13#10 +
      'TypeLbl.Caption=��������' + #13#10 +
      'ZoomLbl.Caption=����:' + #13#10 +
      'OptionsLbl.Caption=ѡ��   ' + #13#10 +
      'RotationLbl.Caption=��ת   ' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      'OkB.Caption=ȷ��' + #13#10 +
      'CalcCheckSumCB.Caption=�������� ' + #13#10 +
      'ViewTextCB.Caption=�ı�' + #13#10 +
      'Rotation0RB.Caption=0��' + #13#10 +
      'Rotation90RB.Caption=90��' + #13#10 +
      'Rotation180RB.Caption=180��' + #13#10 +
      'Rotation270RB.Caption=270��' + #13#10 +
      '');
    Add('bcCalcChecksum', '��������');
    Add('bcShowText', '��ʾ�ı�');

    Add('TfrxAliasesEditorForm',
      'Caption=�༭����' + #13#10 +
      'HintL.Caption=�� Enter �༭��Ŀ' + #13#10 +
      'DSAliasL.Caption=���ݿ����' + #13#10 +
      'FieldAliasesL.Caption=�ֶα���' + #13#10 +
      'OkB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      'ResetB.Caption=����' + #13#10 +
      '');
    Add('alUserName', 'ʹ��������');
    Add('alOriginal', 'ԭ��������');

    Add('TfrxParamsEditorForm',
      'Caption=�����༭��' + #13#10 +
      'OkB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      '');
    Add('qpName', '����');
    Add('qpDataType', '��������');
    Add('qpValue', 'ֵ');

    Add('TfrxMDEditorForm',
      'Caption=Master-Detail ����' + #13#10 +
      'Label1.Caption=Detail �ֶ�' + #13#10 +
      'Label2.Caption=Master �ֶ�' + #13#10 +
      'Label3.Caption=Linked �ֶ�' + #13#10 +
      'AddB.Caption=����' + #13#10 +
      'ClearB.Caption=���' + #13#10 +
      'OkB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=����' + #13#10 +
      'ExprB.Hint=��������ʽ' + #13#10 +
      'AggregateB.Hint=����ϼ�' + #13#10 +
      'LocalFormatB.Hint=���������ʽ' + #13#10 +
      'WordWrapB.Hint=�ı��Զ�����' + #13#10 +
      'CancelB.Hint=ȡ��' + #13#10 +
      'OkB.Hint=ȷ��' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=ͼ��' + #13#10 +
      'LoadB.Hint=����' + #13#10 +
      'CopyB.Hint=����' + #13#10 +
      'PasteB.Hint=ճ��' + #13#10 +
      'ClearB.Hint=���' + #13#10 +
      'CancelB.Hint=ȡ��' + #13#10 +
      'OkB.Hint=ȷ��' + #13#10 +
      '');
    Add('piEmpty', '���');

    Add('TfrxChartEditorForm',
      'Caption=ͳ��ͼ�༭��' + #13#10 +
      'OkB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=����ϵ��' + #13#10 +
      'DeleteB.Hint=ɾ��ϵ��' + #13#10 +
      'DBSourceRB.Caption=�����������ݿ�' + #13#10 +
      'FixedDataRB.Caption=�̶�����' + #13#10 +
      'DatasetLbl.Caption=���ݿ�' + #13#10 +
      'X1Lbl.Caption=X ֵ' + #13#10 +
      'Y1Lbl.Caption=Y ֵ' + #13#10 +
      'X3Lbl.Caption=X ֵ (����, a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Y ֵ (����, 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=����ѡ��   ' + #13#10 +
      'ShowTopLbl.Caption=ǰN����ֵ' + #13#10 +
      'CaptionLbl.Caption=ǰN���ı���' + #13#10 +
      'SortLbl.Caption=����˳��' + #13#10 +
      'LineMI.Caption=Line' + #13#10 +
      'AreaMI.Caption=Area' + #13#10 +
      'PointMI.Caption=Point' + #13#10 +
      'BarMI.Caption=Bar' + #13#10 +
      'HorizBarMI.Caption=Horiz. Bar' + #13#10 +
      'PieMI.Caption=Pie' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Fast Line' + #13#10 +
      '');
    Add('ch3D', '3D �鿴');
    Add('chAxis', '��ʾ��');
    Add('chsoNone', '��');
    Add('chsoAscending', '����');
    Add('chsoDescending', '�ݼ�');

    Add('TfrxRichEditorForm',
      'Caption=RTF �ļ��༭��' + #13#10 +
      'OpenB.Hint=���ļ�' + #13#10 +
      'SaveB.Hint=�����ļ�' + #13#10 +
      'UndoB.Hint=  ԭ' + #13#10 +
      'TTB.Hint=����' + #13#10 +
      'ExprB.Hint=��������ʽ' + #13#10 +
      'CancelB.Hint=ȡ��' + #13#10 +
      'OkB.Hint=ȷ��' + #13#10 +
      'BoldB.Hint=����' + #13#10 +
      'ItalicB.Hint=б��' + #13#10 +
      'UnderlineB.Hint=����' + #13#10 +
      'LeftAlignB.Hint=�����' + #13#10 +
      'CenterAlignB.Hint=����' + #13#10 +
      'RightAlignB.Hint=�Ҷ���' + #13#10 +
      'BlockAlignB.Hint=��������' + #13#10 +
      'BulletsB.Hint=���غ�' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=���汨��༭��' + #13#10 +
      'DatasetL.Caption=��Դ����   ' + #13#10 +
      'DimensionsL.Caption=�ռ�   ' + #13#10 +
      'RowsL.Caption=��' + #13#10 +
      'ColumnsL.Caption=��' + #13#10 +
      'CellsL.Caption=С����' + #13#10 +
      'StructureL.Caption=���汨��ṹ   ' + #13#10 +
      'RowHeaderCB.Caption=����' + #13#10 +
      'ColumnHeaderCB.Caption=����' + #13#10 +
      'RowTotalCB.Caption=���ܼ�' + #13#10 +
      'ColumnTotalCB.Caption=���ܼ�' + #13#10 +
      'SwapB.Hint=��/������' + #13#10 +
      'StyleCB.Hint=���汨����ʽ' + #13#10 +
      'FontB.Hint=��������' + #13#10 +
      'AlignLeftB.Hint=�������' + #13#10 +
      'AlignCenterB.Hint=�м�����' + #13#10 +
      'AlignRightB.Hint=�ұ�����' + #13#10 +
      'RotationB.Hint=�ı���ת' + #13#10 +
      'HighlightB.Hint=ͻ��' + #13#10 +
      'FormatB.Hint=��ʽ' + #13#10 +
      'FrameB.Hint=�������' + #13#10 +
      'FillColorB.Hint=����ɫ' + #13#10 +
      'Func1MI.Caption=��' + #13#10 +
      'Func2MI.Caption=�ϼ�' + #13#10 +
      'Func3MI.Caption=��Сֵ' + #13#10 +
      'Func4MI.Caption=���ֵ' + #13#10 +
      'Func5MI.Caption=ƽ��ֵ' + #13#10 +
      'Func6MI.Caption=����' + #13#10 +
      'Sort1MI.Caption=���� (A-Z)' + #13#10 +
      'Sort2MI.Caption=�ݼ� (Z-A)' + #13#10 +
      'Sort3MI.Caption=������' + #13#10 +
      'BoldMI.Caption=����' + #13#10 +
      'ItalicMI.Caption=б��' + #13#10 +
      'UnderlineMI.Caption=����' + #13#10 +
      'SuperScriptMI.Caption=�ϱ�' + #13#10 +
      'SubScriptMI.Caption=�±�' + #13#10 +
      'CondensedMI.Caption=ѹ��' + #13#10 +
      'WideMI.Caption=��' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=ȡ��' + #13#10 +
      'OkB.Hint=ȷ��' + #13#10 +
      '');
    Add('crSubtotal', 'С��');
    Add('crNone', '��');
    Add('crSum', '�ϼ�');
    Add('crMin', '��Сֵ');
    Add('crMax', '���ֵ');
    Add('crAvg', 'ƽ��ֵ');
    Add('crCount', '����');
    Add('crAsc', 'A-Z');
    Add('crDesc', 'Z-A');
    Add('crFillMx', '���뽻�汨����...');
    Add('crBuildMx', '�������汨����...');
    Add('crRepHdrs', '���´�ӡ��ͷ');
    Add('crBorder', '���');
    Add('crDown', '���϶��£���������');

    Add('TfrxExprEditorForm',
      'Caption=����ʽ�༭��' + #13#10 +
      'ExprL.Caption=����ʽ:' + #13#10 +
      'OkB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=��ʾ��ʽ' + #13#10 +
      'CategoryL.Caption=���' + #13#10 +
      'FormatL.Caption=��ʽ' + #13#10 +
      'FormatStrL.Caption=��ʽ�ִ�:' + #13#10 +
      'SeparatorL.Caption=С����ָ���Ԫ:' + #13#10 +
      'OkB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      '');
    Add('fkText', '�ı� (δ��ʽ��)');
    Add('fkNumber', '����');
    Add('fkDateTime', '����/ʱ��');
    Add('fkBoolean', '����');
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
      'Caption=ͻ��' + #13#10 +
      'FontColorB.Caption=��ɫ...' + #13#10 +
      'BackColorB.Caption=��ɫ...' + #13#10 +
      'ConditionL.Caption=����   ' + #13#10 +
      'FontL.Caption=����   ' + #13#10 +
      'BackgroundL.Caption=����   ' + #13#10 +
      'OKB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      'BoldCB.Caption=����' + #13#10 +
      'ItalicCB.Caption=б��' + #13#10 +
      'UnderlineCB.Caption=����' + #13#10 +
      'TransparentRB.Caption=͸��' + #13#10 +
      'OtherRB.Caption=����' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=��������' + #13#10 +
      'OkB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      'GeneralTS.Caption=����' + #13#10 +
      'ReportSettingsL.Caption=��ӡ������   ' + #13#10 +
      'CopiesL.Caption=��ӡ����' + #13#10 +
      'GeneralL.Caption=����   ' + #13#10 +
      'PasswordL.Caption=����' + #13#10 +
      'CollateCB.Caption=�Զ���ҳ' + #13#10 +
      'DoublePassCB.Caption=Double pass' + #13#10 +
      'PrintIfEmptyCB.Caption=Print if empty' + #13#10 +
      'DescriptionTS.Caption=����' + #13#10 +
      'NameL.Caption=����' + #13#10 +
      'Description1L.Caption=����' + #13#10 +
      'PictureL.Caption=ͼ��' + #13#10 +
      'AuthorL.Caption=����' + #13#10 +
      'MajorL.Caption=Major' + #13#10 +
      'MinorL.Caption=Minor' + #13#10 +
      'ReleaseL.Caption=Release' + #13#10 +
      'BuildL.Caption=Build' + #13#10 +
      'CreatedL.Caption=����' + #13#10 +
      'ModifiedL.Caption=�޸�' + #13#10 +
      'DescriptionL.Caption=����   ' + #13#10 +
      'VersionL.Caption=�汾   ' + #13#10 +
      'PictureB.Caption=���...' + #13#10 +
      '');
    Add('rePrnOnPort', '��');

    Add('TfrxStringsEditorForm',
      'Caption=�ִ��嵥' + #13#10 +
      'CancelB.Hint=ȡ��' + #13#10 +
      'OkB.Hint=ȷ��' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=ȡ��' + #13#10 +
      'OkB.Hint=ȷ��' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=����' + #13#10 +
      'PasswordL.Caption=��������:' + #13#10 +
      'OkB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=��ʽ�༭��' + #13#10 +
      'ColorB.Caption=��ɫ...' + #13#10 +
      'FontB.Caption=����...' + #13#10 +
      'FrameB.Caption=���...' + #13#10 +
      'AddB.Hint=����' + #13#10 +
      'DeleteB.Hint=ɾ��' + #13#10 +
      'EditB.Hint=�༭' + #13#10 +
      'LoadB.Hint=����' + #13#10 +
      'SaveB.Hint=����' + #13#10 +
      'CancelB.Hint=ȡ��' + #13#10 +
      'OkB.Hint=ȷ��' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=���༭��' + #13#10 +
      'FrameL.Caption=���' + #13#10 +
      'LineL.Caption=����' + #13#10 +
      'ShadowL.Caption=��Ӱ' + #13#10 +
      'FrameTopB.Hint=����' + #13#10 +
      'FrameBottomB.Hint=����' + #13#10 +
      'FrameLeftB.Hint=����' + #13#10 +
      'FrameRightB.Hint=����' + #13#10 +
      'FrameAllB.Hint=�����' + #13#10 +
      'FrameNoB.Hint=�޿���' + #13#10 +
      'FrameColorB.Hint=�����ɫ' + #13#10 +
      'FrameStyleB.Hint=�����ʽ' + #13#10 +
      'FrameWidthCB.Hint=�����' + #13#10 +
      'ShadowB.Hint=��Ӱ' + #13#10 +
      'ShadowColorB.Hint=��Ӱ��ɫ' + #13#10 +
      'ShadowWidthCB.Hint=��Ӱ���' + #13#10 +
      'OkB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=����Ŀ' + #13#10 +
      'ItemsTab.Caption=��Ŀ' + #13#10 +
      'TemplatesTab.Caption=ģ��' + #13#10 +
      'OkB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Tab������' + #13#10 +
      'Label1.Caption=�������Tab������:' + #13#10 +
      'OkB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      'UpB.Caption=����' + #13#10 +
      'DownB.Caption=����' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=��ֵ' + #13#10 +
      'Label1.Caption=����ʽ' + #13#10 +
      'Label2.Caption=���' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=������' + #13#10 +
      'DataTab.Caption=����' + #13#10 +
      'GroupsTab.Caption=Ⱥ��' + #13#10 +
      'LayoutTab.Caption=��ʽ' + #13#10 +
      'StyleTab.Caption=��ʽ' + #13#10 +
      'Step1L.Caption=Step 1. ѡȡҪ��ʾ�����ݿ⼰�ֶ�.' + #13#10 +
      'Step2L.Caption=Step 2. ����Ⱥ�� (ѡ��).' + #13#10 +
      'Step3L.Caption=Step 3. ����ҳ�淽�����ݸ�ʽ.' + #13#10 +
      'Step4L.Caption=Step 4. ѡ�񱨱���ʽ.' + #13#10 +
      'AddFieldB.Caption=���� >' + #13#10 +
      'AddAllFieldsB.Caption=ȫ������ >>' + #13#10 +
      'RemoveFieldB.Caption=< �Ƴ�' + #13#10 +
      'RemoveAllFieldsB.Caption=<< ȫ���Ƴ�' + #13#10 +
      'AddGroupB.Caption=���� >' + #13#10 +
      'RemoveGroupB.Caption=< �Ƴ�' + #13#10 +
      'SelectedFieldsL.Caption=ѡȡ���ֶ�:' + #13#10 +
      'AvailableFieldsL.Caption=���õ��ֶ�:' + #13#10 +
      'GroupsL.Caption=Ⱥ��:' + #13#10 +
      'OrientationL.Caption=����   ' + #13#10 +
      'LayoutL.Caption=��ʽ   ' + #13#10 +
      'PortraitRB.Caption=����' + #13#10 +
      'LandscapeRB.Caption=����' + #13#10 +
      'TabularRB.Caption=Tabular' + #13#10 +
      'ColumnarRB.Caption=Columnar' + #13#10 +
      'FitWidthCB.Caption=�����ֶ���ҳ����' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      'BackB.Caption=<< ��һ��' + #13#10 +
      'NextB.Caption=��һ�� >>' + #13#10 +
      'FinishB.Caption=���' + #13#10 +
      '');
    Add('wzStd', '��׼������');
    Add('wzDMP', '����󱨱���');
    Add('wzStdEmpty', '��׼����');
    Add('wzDMPEmpty', '����󱨱�');


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
