
{******************************************}
{                                          }
{             FastReport v3.0              }
{         Language resource file           }
{                                          }
{         Copyright (c) 1998-2005          }
{         by Alexander Tzyganenko,         }
{            Fast Reports Inc.             }
{                                          }
{         Translated by Sergiy Sekela      }
{         Ternopil, Ukraine                }
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
      'Caption=���������' + #13#10 +
      '');
    Add('oiProp', '����������');
    Add('oiEvent', '��䳿');

    Add('TfrxDataTreeForm',
      'Caption=������ �����' + #13#10 +
      'DataTS.Caption=���� ��' + #13#10 +
      'VariablesTS.Caption=����' + #13#10 +
      'FunctionsTS.Caption=�������' + #13#10 +
      'InsFieldCB.Caption=��������� ����' + #13#10 +
      'InsCaptionCB.Caption=��������� ���������' + #13#10 +
      '');
    Add('dtNoData', '���� �����');
    Add('dtData', '���');
    Add('dtSysVar', '�������');
    Add('dtVar', '����');
    Add('dtFunc', '�������');

    Add('TfrxReportTreeForm',
      'Caption=������ ����' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=³������ ������' + #13#10 +
      'SaveScriptB.Hint=�������� ������' + #13#10 +
      'RunScriptB.Hint=��������� ���' + #13#10 +
      'StepScriptB.Hint=������������' + #13#10 +
      'StopScriptB.Hint=��������' + #13#10 +
      'EvaluateB.Hint=���������' + #13#10 +
      'LangL.Caption=����:' + #13#10 +
      'AlignTB.Caption=�����������' + #13#10 +
      'AlignLeftsB.Hint=�������� �� ���' + #13#10 +
      'AlignHorzCentersB.Hint=���������� �� ����������' + #13#10 +
      'AlignRightsB.Hint=�������� ���� ���' + #13#10 +
      'AlignTopsB.Hint=�������� ����� ���' + #13#10 +
      'AlignVertCentersB.Hint=���������� �� ����������' + #13#10 +
      'AlignBottomsB.Hint=�������� ���� ���' + #13#10 +
      'SpaceHorzB.Hint=����������� �������� �� �����' + #13#10 +
      'SpaceVertB.Hint=����������� �������� �� �����' + #13#10 +
      'CenterHorzB.Hint=���������� �� ���������� �� ����' + #13#10 +
      'CenterVertB.Hint=���������� �� �������� �� ����' + #13#10 +
      'SameWidthB.Hint=�� � ������' + #13#10 +
      'SameHeightB.Hint=�� � ������' + #13#10 +
      'TextTB.Caption=�����' + #13#10 +
      'StyleCB.Hint=�����' + #13#10 +
      'FontNameCB.Hint=��''� ������' + #13#10 +
      'FontSizeCB.Hint=����� ������' + #13#10 +
      'BoldB.Hint=���������' + #13#10 +
      'ItalicB.Hint=������' + #13#10 +
      'UnderlineB.Hint=ϳ����������' + #13#10 +
      'FontColorB.Hint=������� ������' + #13#10 +
      'HighlightB.Hint=������ ��������' + #13#10 +
      'RotateB.Hint=������� ������' + #13#10 +
      'TextAlignLeftB.Hint=�������� ����� ����' + #13#10 +
      'TextAlignCenterB.Hint=���������� ����� �� ����������' + #13#10 +
      'TextAlignRightB.Hint=�������� ����� ������' + #13#10 +
      'TextAlignBlockB.Hint=�������� ����� �� �����' + #13#10 +
      'TextAlignTopB.Hint=�������� �� ��������� ����' + #13#10 +
      'TextAlignMiddleB.Hint=���������� ����� �� ��������' + #13#10 +
      'TextAlignBottomB.Hint=�������� �� �������� ����' + #13#10 +
      'FrameTB.Caption=�����' + #13#10 +
      'FrameTopB.Hint=������ ���' + #13#10 +
      'FrameBottomB.Hint=����� ���' + #13#10 +
      'FrameLeftB.Hint=˳�� ���' + #13#10 +
      'FrameRightB.Hint=����� ���' + #13#10 +
      'FrameAllB.Hint=�� �� �����' + #13#10 +
      'FrameNoB.Hint=������� �����' + #13#10 +
      'ShadowB.Hint=ҳ��' + #13#10 +
      'FillColorB.Hint=������� ���������' + #13#10 +
      'FrameColorB.Hint=������� �����' + #13#10 +
      'FrameStyleB.Hint=����� �����' + #13#10 +
      'FrameWidthCB.Hint=������� �����' + #13#10 +
      'StandardTB.Caption=����������' + #13#10 +
      'NewB.Hint=����� ���' + #13#10 +
      'OpenB.Hint=³������' + #13#10 +
      'SaveB.Hint=��������' + #13#10 +
      'PreviewB.Hint=��������� ��������' + #13#10 +
      'NewPageB.Hint=������ ������� � ���' + #13#10 +
      'NewDialogB.Hint=������ ����� � ���' + #13#10 +
      'DeletePageB.Hint=�������� �������' + #13#10 +
      'PageSettingsB.Hint=������������ �������' + #13#10 +
      'VariablesB.Hint=����' + #13#10 +
      'CutB.Hint=�������' + #13#10 +
      'CopyB.Hint=��������' + #13#10 +
      'PasteB.Hint=��������' + #13#10 +
      'SampleFormatB.Hint=�������� ������' + #13#10 +
      'UndoB.Hint=���������' + #13#10 +
      'RedoB.Hint=���������' + #13#10 +
      'GroupB.Hint=���������' + #13#10 +
      'UngroupB.Hint=������������' + #13#10 +
      'ShowGridB.Hint=���������� ����' + #13#10 +
      'AlignToGridB.Hint=����������� �� ����' + #13#10 +
      'SetToGridB.Hint=����������� ��''���� � ������ ����' + #13#10 +
      'ScaleCB.Hint=�������' + #13#10 +
      'ExtraToolsTB.Caption=��������' + #13#10 +
      'ObjectSelectB.Hint=���� ��''����' + #13#10 +
      'HandToolB.Hint=����' + #13#10 +
      'ZoomToolB.Hint=����' + #13#10 +
      'TextToolB.Hint=�������� ������' + #13#10 +
      'FormatToolB.Hint=��������� ���������� �������' + #13#10 +
      'ObjectBandB.Hint=�������� ����' + #13#10 +
      'FileMenu.Caption=&����' + #13#10 +
      'EditMenu.Caption=&�����������' + #13#10 +
      'FindMI.Caption=������...' + #13#10 +
      'FindNextMI.Caption=������ ���' + #13#10 +
      'ReplaceMI.Caption=�������...' + #13#10 +
      'ReportMenu.Caption=&���' + #13#10 +
      'ReportDataMI.Caption=���...' + #13#10 +
      'ReportSettingsMI.Caption=������������...' + #13#10 +
      'ReportStylesMI.Caption=����...' + #13#10 +
      'ViewMenu.Caption=&���' + #13#10 +
      'ToolbarsMI.Caption=����� �����������' + #13#10 +
      'StandardMI.Caption=����������' + #13#10 +
      'TextMI.Caption=�����' + #13#10 +
      'FrameMI.Caption=�����' + #13#10 +
      'AlignmentMI.Caption=�����������' + #13#10 +
      'ToolsMI.Caption=��������' + #13#10 +
      'InspectorMI.Caption=���������' + #13#10 +
      'DataTreeMI.Caption=������ �����' + #13#10 +
      'ReportTreeMI.Caption=������ ����' + #13#10 +
      'ShowRulersMI.Caption=˳����' + #13#10 +
      'ShowGuidesMI.Caption=������ ��' + #13#10 +
      'DeleteGuidesMI.Caption=�������� ������ ��' + #13#10 +
      'OptionsMI.Caption=������������...' + #13#10 +
      'HelpMenu.Caption=&?' + #13#10 +
      'HelpContentsMI.Caption=Help Contents...' + #13#10 +
      'AboutMI.Caption=��� FastReport...' + #13#10 +
      'TabOrderMI.Caption=�������� TabOrder...' + #13#10 +
      'UndoCmd.Caption=���������' + #13#10 +
      'RedoCmd.Caption=���������' + #13#10 +
      'CutCmd.Caption=�������' + #13#10 +
      'CopyCmd.Caption=��������' + #13#10 +
      'PasteCmd.Caption=��������' + #13#10 +
      'GroupCmd.Caption=���������' + #13#10 +
      'UngroupCmd.Caption=������������' + #13#10 +
      'DeleteCmd.Caption=��������' + #13#10 +
      'DeletePageCmd.Caption=�������� �������' + #13#10 +
      'SelectAllCmd.Caption=������� ��' + #13#10 +
      'EditCmd.Caption=����������...' + #13#10 +
      'BringToFrontCmd.Caption=�� ������� ����' + #13#10 +
      'SendToBackCmd.Caption=�� ����� ����' + #13#10 +
      'NewItemCmd.Caption=�����...' + #13#10 +
      'NewReportCmd.Caption=����� ���' + #13#10 +
      'NewPageCmd.Caption=���� �������' + #13#10 +
      'NewDialogCmd.Caption=���� �����' + #13#10 +
      'OpenCmd.Caption=³������...' + #13#10 +
      'SaveCmd.Caption=��������' + #13#10 +
      'SaveAsCmd.Caption=�������� ��...' + #13#10 +
      'VariablesCmd.Caption=����...' + #13#10 +
      'PageSettingsCmd.Caption=������������ �������...' + #13#10 +
      'PreviewCmd.Caption=��������' + #13#10 +
      'ExitCmd.Caption=�����' + #13#10 +
      'ReportTitleMI.Caption=��������� ����' + #13#10 +
      'ReportSummaryMI.Caption=ϳ���� ����' + #13#10 +
      'PageHeaderMI.Caption=��������� �������' + #13#10 +
      'PageFooterMI.Caption=ϳ���� �������' + #13#10 +
      'HeaderMI.Caption=��������� �����' + #13#10 +
      'FooterMI.Caption=ϳ���� �����' + #13#10 +
      'MasterDataMI.Caption=��� 1 ����' + #13#10 +
      'DetailDataMI.Caption=��� 2 ����' + #13#10 +
      'SubdetailDataMI.Caption=��� 3 ����' + #13#10 +
      'Data4levelMI.Caption=��� 4 ����' + #13#10 +
      'Data5levelMI.Caption=��� 5 ����' + #13#10 +
      'Data6levelMI.Caption=��� 6 ����' + #13#10 +
      'GroupHeaderMI.Caption=��������� �����' + #13#10 +
      'GroupFooterMI.Caption=ϳ���� �����' + #13#10 +
      'ChildMI.Caption=������� ����' + #13#10 +
      'ColumnHeaderMI.Caption=��������� �������' + #13#10 +
      'ColumnFooterMI.Caption=ϳ���� �������' + #13#10 +
      'OverlayMI.Caption=������� ����' + #13#10 +
      'VerticalbandsMI.Caption=���������� �����' + #13#10 +
      'HeaderMI1.Caption=��������� �����' + #13#10 +
      'FooterMI1.Caption=ϳ���� �����' + #13#10 +
      'MasterDataMI1.Caption=��� 1 ����' + #13#10 +
      'DetailDataMI1.Caption=��� 2 ����' + #13#10 +
      'SubdetailDataMI1.Caption=��� 3 ����' + #13#10 +
      'GroupHeaderMI1.Caption=��������� �����' + #13#10 +
      'GroupFooterMI1.Caption=ϳ���� �����' + #13#10 +
      'ChildMI1.Caption=������� ����' + #13#10 +
      'R0MI.Caption=0�' + #13#10 +
      'R45MI.Caption=45�' + #13#10 +
      'R90MI.Caption=90�' + #13#10 +
      'R180MI.Caption=180�' + #13#10 +
      'R270MI.Caption=270�' + #13#10 +
      'FontB.Hint=��������� ������' + #13#10 +
      'BoldMI.Caption=����������' + #13#10 +
      'ItalicMI.Caption=�������' + #13#10 +
      'UnderlineMI.Caption=ϳ����������' + #13#10 +
      'SuperScriptMI.Caption=������ ������' + #13#10 +
      'SubScriptMI.Caption=����� ������' + #13#10 +
      'CondensedMI.Caption=�������' + #13#10 +
      'WideMI.Caption=�������' + #13#10 +
      'N12cpiMI.Caption=12 �������/����' + #13#10 +
      'N15cpiMI.Caption=15 �������/����' + #13#10 +
      'OpenDialog.Filter=��� (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=����� Pascal (*.pas)|*.pas|����� C++ (*.cpp)|*.cpp|����� JavaScript (*.js)|*.js|����� Basic (*.vb)|*.vb|All files|*.*' + #13#10 +
      'SaveScriptDialog.Filter=����� Pascal (*.pas)|*.pas|����� C++ (*.cpp)|*.cpp|����� JavaScript (*.js)|*.js|����� Basic (*.vb)|*.vb|All files|*.*' + #13#10 +
      '');
    Add('dsCm', '����������');
    Add('dsInch', '�����');
    Add('dsPix', '������');
    Add('dsChars', '�������');
    Add('dsCode', '���');
    Add('dsPage', '����.');
    Add('dsRepFilter', '��� (*.fr3)|*.fr3');
    Add('dsComprRepFilter', '������� ��� (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', '�������� ����?');
    Add('dsSaveChangesTo', '�������� ���� � ');
    Add('dsCantLoad', '�� ������� ������� ����');
    Add('dsStyleFile', '�����');
    Add('dsCantFindProc', '�� ������� ������ ������� ���������');
    Add('dsClearScript', '�� �������� ���� ���. ����������?');
    Add('dsNoStyle', '���� �����');
    Add('dsStyleSample', '������� �����');
    Add('dsTextNotFound', '����� ''%s'' �� ���������');
    Add('dsReplace', '������� ''%s''?');

    Add('TfrxAboutForm',
      'Caption=��� FastReport' + #13#10 +
      'Label4.Caption=³������� ���� �������:' + #13#10 +
      'Label6.Caption=������:' + #13#10 +
      'Label8.Caption=ϳ�������:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=������������ �������' + #13#10 +
      'OKB.Caption=��' + #13#10 +
      'CancelB.Caption=³�����' + #13#10 +
      'TabSheet1.Caption=�������' + #13#10 +
      'Label1.Caption=������' + #13#10 +
      'Label2.Caption=������' + #13#10 +
      'Label11.Caption=������   ' + #13#10 +
      'Label12.Caption=��������   ' + #13#10 +
      'Label3.Caption=˳��' + #13#10 +
      'Label4.Caption=�����' + #13#10 +
      'Label5.Caption=�����' + #13#10 +
      'Label6.Caption=����' + #13#10 +
      'Label13.Caption=����   ' + #13#10 +
      'Label14.Caption=������� ������   ' + #13#10 +
      'Label9.Caption=��� ����� �������' + #13#10 +
      'Label10.Caption=��� �����' + #13#10 +
      'PortraitRB.Caption=���������' + #13#10 +
      'LandscapeRB.Caption=��������' + #13#10 +
      'TabSheet3.Caption=����' + #13#10 +
      'Label7.Caption=�������   ' + #13#10 +
      'Label8.Caption=ʳ������' + #13#10 +
      'Label15.Caption=������' + #13#10 +
      'Label16.Caption=�������' + #13#10 +
      'Label17.Caption=����   ' + #13#10 +
      'Label18.Caption=�������' + #13#10 +
      'PrintOnPrevCB.Caption=��������� �� �������.�������' + #13#10 +
      'MirrorMarginsCB.Caption=��������� ����' + #13#10 +
      'LargeHeightCB.Caption=������ ������ � ��������' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=��� ����' + #13#10 +
      'OKB.Caption=��' + #13#10 +
      'CancelB.Caption=³�����' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=������ ������' + #13#10 +
      'NewCategoryB.Caption=��������' + #13#10 +
      'NewVarB.Caption=�����' + #13#10 +
      'EditB.Caption=������' + #13#10 +
      'DeleteB.Caption=��������' + #13#10 +
      'EditListB.Caption=������' + #13#10 +
      'LoadB.Caption=³������' + #13#10 +
      'SaveB.Caption=��������' + #13#10 +
      'CancelB.Caption=³�����' + #13#10 +
      'OkB.Caption=��' + #13#10 +
      'ExprPanel.Caption= ���������:' + #13#10 +
      'OpenDialog1.Filter=������ ������ (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=������ ������ (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(���� ������)');
    Add('vaVar', '����');
    Add('vaDupName', '����� � ����� ��''�� ��� ����');

    Add('TfrxOptionsEditor',
      'Caption=������������ ���������' + #13#10 +
      'Label1.Caption=ѳ���   ' + #13#10 +
      'Label2.Caption=���' + #13#10 +
      'Label3.Caption=�����' + #13#10 +
      'Label4.Caption=ĳ������� �����:' + #13#10 +
      'Label5.Caption=����   ' + #13#10 +
      'Label6.Caption=������   ' + #13#10 +
      'Label7.Caption=�������� ����' + #13#10 +
      'Label8.Caption=�������� ������' + #13#10 +
      'Label9.Caption=�����' + #13#10 +
      'Label10.Caption=�����' + #13#10 +
      'Label11.Caption=�������   ' + #13#10 +
      'Label12.Caption=������� �� �������:' + #13#10 +
      'Label13.Caption=��' + #13#10 +
      'Label14.Caption=in' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=��' + #13#10 +
      'CancelB.Caption=³�����' + #13#10 +
      'CMRB.Caption=����������:' + #13#10 +
      'InchesRB.Caption=�����:' + #13#10 +
      'PixelsRB.Caption=������:' + #13#10 +
      'ShowGridCB.Caption=���������� ����' + #13#10 +
      'AlignGridCB.Caption=���������� �� ����' + #13#10 +
      'EditAfterInsCB.Caption=��������� �������� ���� �������' + #13#10 +
      'ObjectFontCB.Caption=����������� ����� ��''����' + #13#10 +
      'WorkspaceB.Caption=������ ����' + #13#10 +
      'ToolB.Caption=³���' + #13#10 +
      'LCDCB.Caption=������� ���� ��� LCD-�������' + #13#10 +
      'FreeBandsCB.Caption=³���� ��������� �����' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=³������� ������������' + #13#10 +
      'BandsCaptionsCB.Caption=���������� ��������� �����' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=������� �����' + #13#10 +
      'OkB.Caption=��' + #13#10 +
      'CancelB.Caption=³�����' + #13#10 +
      '');
    Add('dbNotAssigned', '[�� �����������]');
    Add('dbSingleLine', '���� �����');

    Add('TfrxGroupEditorForm',
      'Caption=�����' + #13#10 +
      'BreakOnL.Caption=�����   ' + #13#10 +
      'OptionsL.Caption=����������   ' + #13#10 +
      'OKB.Caption=��' + #13#10 +
      'CancelB.Caption=³�����' + #13#10 +
      'DataFieldRB.Caption=���� ��' + #13#10 +
      'ExpressionRB.Caption=�����' + #13#10 +
      'KeepGroupTogetherCB.Caption=�������� ����� �� ���� �������' + #13#10 +
      'StartNewPageCB.Caption=��������� ���� �������' + #13#10 +
      'OutlineCB.Caption=���������� � ����� ����' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=��������� �����' + #13#10 +
      'DataBandL.Caption=����-����' + #13#10 +
      'DataSetL.Caption=���� �����' + #13#10 +
      'DataFieldL.Caption=���� ��' + #13#10 +
      'FunctionL.Caption=�������' + #13#10 +
      'ExpressionL.Caption=�����' + #13#10 +
      'OKB.Caption=��' + #13#10 +
      'CancelB.Caption=³�����' + #13#10 +
      'AggregateRB.Caption=��������� �������' + #13#10 +
      'SysVariableRB.Caption=�������� �����' + #13#10 +
      'CountInvisibleCB.Caption=����������� ������� �����' + #13#10 +
      'TextRB.Caption=�����' + #13#10 +
      'RunningTotalCB.Caption=����������� ��������' + #13#10 +
      '');
    Add('agAggregate', '�������� ��������� �������');
    Add('vt1', '[DATE]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGES#]');
    Add('vt5', '[PAGE#] � [TOTALPAGES#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=OLE ��''���' + #13#10 +
      'InsertB.Caption=��������...' + #13#10 +
      'EditB.Caption=��������...' + #13#10 +
      'CloseB.Caption=�������' + #13#10 +
      '');
    Add('olStretched', ' ������������');

    Add('TfrxBarcodeEditorForm',
      'Caption=��������' + #13#10 +
      'CodeLbl.Caption=���' + #13#10 +
      'TypeLbl.Caption=��� ���������' + #13#10 +
      'ZoomLbl.Caption=�������:' + #13#10 +
      'OptionsLbl.Caption=����������   ' + #13#10 +
      'RotationLbl.Caption=��������   ' + #13#10 +
      'CancelB.Caption=³�����' + #13#10 +
      'OkB.Caption=��' + #13#10 +
      'CalcCheckSumCB.Caption=���������� ����' + #13#10 +
      'ViewTextCB.Caption=���������� �����' + #13#10 +
      'Rotation0RB.Caption=0�' + #13#10 +
      'Rotation90RB.Caption=90�' + #13#10 +
      'Rotation180RB.Caption=180�' + #13#10 +
      'Rotation270RB.Caption=270�' + #13#10 +
      '');
    Add('bcCalcChecksum', '���������� ����');
    Add('bcShowText', '���������� �����');

    Add('TfrxAliasesEditorForm',
      'Caption=���������' + #13#10 +
      'HintL.Caption=�������� Enter ��� �����������' + #13#10 +
      'DSAliasL.Caption=�������� ������ �����' + #13#10 +
      'FieldAliasesL.Caption=��������� ����' + #13#10 +
      'OkB.Caption=��' + #13#10 +
      'CancelB.Caption=³�����' + #13#10 +
      'ResetB.Caption=��������' + #13#10 +
      'UpdateB.Caption=��������' + #13#10 +
      '');
    Add('alUserName', '��������');
    Add('alOriginal', '���������� ��''�');

    Add('TfrxParamsEditorForm',
      'Caption=���������' + #13#10 +
      'OkB.Caption=��' + #13#10 +
      'CancelB.Caption=³�����' + #13#10 +
      '');
    Add('qpName', '��''�');
    Add('qpDataType', '���');
    Add('qpValue', '��������');

    Add('TfrxMDEditorForm',
      'Caption=�������� Master-Detail' + #13#10 +
      'Label1.Caption=���� Detail' + #13#10 +
      'Label2.Caption=���� Master' + #13#10 +
      'Label3.Caption=��''���� ����' + #13#10 +
      'AddB.Caption=������' + #13#10 +
      'ClearB.Caption=��������' + #13#10 +
      'OkB.Caption=��' + #13#10 +
      'CancelB.Caption=³�����' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=�������� ������' + #13#10 +
      'ExprB.Hint=�������� �����' + #13#10 +
      'AggregateB.Hint=�������� ��������� �������' + #13#10 +
      'LocalFormatB.Hint=�������� ������' + #13#10 +
      'WordWrapB.Hint=���������� �����' + #13#10 +
      'CancelB.Hint=³�����' + #13#10 +
      'OkB.Hint=��' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=��������' + #13#10 +
      'LoadB.Hint=�����������' + #13#10 +
      'CopyB.Hint=��������' + #13#10 +
      'PasteB.Hint=��������' + #13#10 +
      'ClearB.Hint=��������' + #13#10 +
      'CancelB.Hint=³�����' + #13#10 +
      'OkB.Hint=��' + #13#10 +
      '');
    Add('piEmpty', '��������');

    Add('TfrxChartEditorForm',
      'Caption=ĳ������' + #13#10 +
      'OkB.Caption=��' + #13#10 +
      'AddB.Hint=������ ����' + #13#10 +
      'DeleteB.Hint=�������� ����' + #13#10 +
      'DBSourceRB.Caption=��� �� ��' + #13#10 +
      'BandSourceRB.Caption=������ �� �����' + #13#10 +
      'FixedDataRB.Caption=Գ������ ���' + #13#10 +
      'DatasetLbl.Caption=���� �����' + #13#10 +
      'BandLbl.Caption=����-����' + #13#10 +
      'X1Lbl.Caption=�������� X' + #13#10 +
      'Y1Lbl.Caption=�������� Y' + #13#10 +
      'X2Lbl.Caption=�������� X' + #13#10 +
      'Y2Lbl.Caption=�������� Y' + #13#10 +
      'X3Lbl.Caption=�������� X (���������, a;b;c)' + #13#10 +
      'Y3Lbl.Caption=�������� Y (���������, 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=����������   ' + #13#10 +
      'ShowTopLbl.Caption=���������� Top �������' + #13#10 +
      'CaptionLbl.Caption=��������� Top' + #13#10 +
      'SortLbl.Caption=����������' + #13#10 +
      'LineMI.Caption=˳�' + #13#10 +
      'AreaMI.Caption=�������' + #13#10 +
      'PointMI.Caption=������' + #13#10 +
      'BarMI.Caption=������������' + #13#10 +
      'HorizBarMI.Caption=�����.������������' + #13#10 +
      'PieMI.Caption=ĳ������' + #13#10 +
      'GanttMI.Caption=����' + #13#10 +
      'FastLineMI.Caption=����� ��' + #13#10 +
      '');
    Add('ch3D', '���������');
    Add('chAxis', '���������� ��');
    Add('chsoNone', '����');
    Add('chsoAscending', '�� ���������');
    Add('chsoDescending', '�� ��������');

    Add('TfrxRichEditorForm',
      'Caption=RichEdit' + #13#10 +
      'OpenB.Hint=³������' + #13#10 +
      'SaveB.Hint=��������' + #13#10 +
      'UndoB.Hint=���������' + #13#10 +
      'TTB.Hint=�����' + #13#10 +
      'ExprB.Hint=�������� �����' + #13#10 +
      'CancelB.Hint=³�����' + #13#10 +
      'OkB.Hint=��' + #13#10 +
      'BoldB.Hint=����������' + #13#10 +
      'ItalicB.Hint=������' + #13#10 +
      'UnderlineB.Hint=ϳ����������' + #13#10 +
      'LeftAlignB.Hint=�������� ����� ����' + #13#10 +
      'CenterAlignB.Hint=�������� ����� �� �����' + #13#10 +
      'RightAlignB.Hint=�������� ����� ������' + #13#10 +
      'BlockAlignB.Hint=�������� ����� �� �����' + #13#10 +
      'BulletsB.Hint=������' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=�������� Cross-tab' + #13#10 +
      'DatasetL.Caption=���   ' + #13#10 +
      'DimensionsL.Caption=���������   ' + #13#10 +
      'RowsL.Caption=�����' + #13#10 +
      'ColumnsL.Caption=�������' + #13#10 +
      'CellsL.Caption=�������' + #13#10 +
      'StructureL.Caption=��������� �������   ' + #13#10 +
      'RowHeaderCB.Caption=��������� �����' + #13#10 +
      'ColumnHeaderCB.Caption=��������� �������' + #13#10 +
      'RowTotalCB.Caption=ϳ������ �����' + #13#10 +
      'ColumnTotalCB.Caption=ϳ������ �������' + #13#10 +
      'SwapB.Hint=������� �����/�������' + #13#10 +
      'StyleCB.Hint=�����' + #13#10 +
      'FontB.Hint=�����' + #13#10 +
      'AlignLeftB.Hint=�������� ����' + #13#10 +
      'AlignCenterB.Hint=�������� �� ������' + #13#10 +
      'AlignRightB.Hint=�������� ������' + #13#10 +
      'RotationB.Hint=������� ������' + #13#10 +
      'HighlightB.Hint=������ ��������' + #13#10 +
      'FormatB.Hint=������' + #13#10 +
      'FrameB.Hint=�����' + #13#10 +
      'FillColorB.Hint=������� ���' + #13#10 +
      'Func1MI.Caption=����' + #13#10 +
      'Func2MI.Caption=Sum' + #13#10 +
      'Func3MI.Caption=Min' + #13#10 +
      'Func4MI.Caption=Max' + #13#10 +
      'Func5MI.Caption=Average' + #13#10 +
      'Func6MI.Caption=Count' + #13#10 +
      'Sort1MI.Caption=�� ��������� (A-Z)' + #13#10 +
      'Sort2MI.Caption=�� ������� (Z-A)' + #13#10 +
      'Sort3MI.Caption=�� ���������' + #13#10 +
      'BoldMI.Caption=����������' + #13#10 +
      'ItalicMI.Caption=������' + #13#10 +
      'UnderlineMI.Caption=ϳ����������' + #13#10 +
      'SuperScriptMI.Caption=�����������' + #13#10 +
      'SubScriptMI.Caption=ϳ���������' + #13#10 +
      'CondensedMI.Caption=�������' + #13#10 +
      'WideMI.Caption=�������' + #13#10 +
      'N12cpiMI.Caption=12 �������/����' + #13#10 +
      'N15cpiMI.Caption=15 �������/����' + #13#10 +
      'CancelB.Hint=³�����' + #13#10 +
      'OkB.Hint=��' + #13#10 +
      '');
    Add('crSubtotal', 'ϳ��������');
    Add('crNone', '����');
    Add('crSum', 'Sum');
    Add('crMin', 'Min');
    Add('crMax', 'Max');
    Add('crAvg', 'Avg');
    Add('crCount', 'Count');
    Add('crAsc', '�-�');
    Add('crDesc', '�-�');
    Add('crBorder', '����� �������');
    Add('crDown', '����, ���� ���');
    Add('crRepHdrs', '����������� ���������');

    Add('TfrxExprEditorForm',
      'Caption=�������� ������' + #13#10 +
      'ExprL.Caption=�����:' + #13#10 +
      'OkB.Caption=��' + #13#10 +
      'CancelB.Caption=³�����' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=������������' + #13#10 +
      'CategoryL.Caption=��������' + #13#10 +
      'FormatL.Caption=������' + #13#10 +
      'FormatStrL.Caption=����� ������������:' + #13#10 +
      'SeparatorL.Caption=��������� �����:' + #13#10 +
      'OkB.Caption=��' + #13#10 +
      'CancelB.Caption=³�����' + #13#10 +
      '');
    Add('fkText', '�����');
    Add('fkNumber', '�����');
    Add('fkDateTime', '����/���');
    Add('fkBoolean', '������');
    Add('fkNumber1', '1234.5;%g');
    Add('fkNumber2', '1234.50;%2.2f');
    Add('fkNumber3', '1,234.50;%2.2n');
    Add('fkNumber4', '1,234.50�;%2.2m');
    Add('fkDateTime1', '28.11.2002;dd.mm.yyyy');
    Add('fkDateTime2', '28 ����� 2002;dd mmm yyyy');
    Add('fkDateTime3', '28 �������� 2002;dd mmmm yyyy');
    Add('fkDateTime4', '02:14;hh:mm');
    Add('fkDateTime5', '02:14am;hh:mm am/pm');
    Add('fkDateTime6', '02:14:00;hh:mm:ss');
    Add('fkDateTime7', '02:14, 28 ��������� 2002;hh:mm dd mmmm yyyy');
    Add('fkBoolean1', '0,1;0,1');
    Add('fkBoolean2', 'ͳ,���;ͳ,���');
    Add('fkBoolean3', '_,x;_,x');
    Add('fkBoolean4', 'False,True;False,True');

    Add('TfrxHighlightEditorForm',
      'Caption=������ ��������' + #13#10 +
      'FontColorB.Caption=�������...' + #13#10 +
      'BackColorB.Caption=�������...' + #13#10 +
      'ConditionL.Caption=�����   ' + #13#10 +
      'FontL.Caption=�����   ' + #13#10 +
      'BackgroundL.Caption=���   ' + #13#10 +
      'OKB.Caption=��' + #13#10 +
      'CancelB.Caption=³�����' + #13#10 +
      'BoldCB.Caption=����������' + #13#10 +
      'ItalicCB.Caption=������' + #13#10 +
      'UnderlineCB.Caption=ϳ����������' + #13#10 +
      'TransparentRB.Caption=��������' + #13#10 +
      'OtherRB.Caption=����' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=������������ ����' + #13#10 +
      'OkB.Caption=��' + #13#10 +
      'CancelB.Caption=³�����' + #13#10 +
      'GeneralTS.Caption=������' + #13#10 +
      'ReportSettingsL.Caption=������������ �����   ' + #13#10 +
      'CopiesL.Caption=��ﳿ' + #13#10 +
      'GeneralL.Caption=����������   ' + #13#10 +
      'PasswordL.Caption=������' + #13#10 +
      'CollateCB.Caption=�������� �� �����' + #13#10 +
      'DoublePassCB.Caption=��� �������' + #13#10 +
      'PrintIfEmptyCB.Caption=���������, ���� �������' + #13#10 +
      'DescriptionTS.Caption=����' + #13#10 +
      'NameL.Caption=��''�' + #13#10 +
      'Description1L.Caption=����' + #13#10 +
      'PictureL.Caption=��������' + #13#10 +
      'AuthorL.Caption=�����' + #13#10 +
      'MajorL.Caption=Major' + #13#10 +
      'MinorL.Caption=Minor' + #13#10 +
      'ReleaseL.Caption=Release' + #13#10 +
      'BuildL.Caption=Build' + #13#10 +
      'CreatedL.Caption=���������' + #13#10 +
      'ModifiedL.Caption=�������' + #13#10 +
      'DescriptionL.Caption=����   ' + #13#10 +
      'VersionL.Caption=�����   ' + #13#10 +
      'PictureB.Caption=��������...' + #13#10 +
      '');
    Add('rePrnOnPort', '��');

    Add('TfrxStringsEditorForm',
      'Caption=�������� �����' + #13#10 +
      'CancelB.Hint=³�����' + #13#10 +
      'OkB.Hint=��' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=�������� SQL' + #13#10 +
      'CancelB.Hint=³�����' + #13#10 +
      'OkB.Hint=��' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=������' + #13#10 +
      'PasswordL.Caption=������ ������:' + #13#10 +
      'OkB.Caption=��' + #13#10 +
      'CancelB.Caption=³�����' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=����' + #13#10 +
      'ColorB.Caption=�������...' + #13#10 +
      'FontB.Caption=�����...' + #13#10 +
      'FrameB.Caption=�����...' + #13#10 +
      'AddB.Hint=������' + #13#10 +
      'DeleteB.Hint=��������' + #13#10 +
      'EditB.Hint=�����������' + #13#10 +
      'LoadB.Hint=�����������' + #13#10 +
      'SaveB.Hint=��������' + #13#10 +
      'CancelB.Hint=³�����' + #13#10 +
      'OkB.Hint=��' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=�������� �����' + #13#10 +
      'FrameL.Caption=�����' + #13#10 +
      'LineL.Caption=˳��' + #13#10 +
      'ShadowL.Caption=ҳ��' + #13#10 +
      'FrameTopB.Hint=������ ���' + #13#10 +
      'FrameBottomB.Hint=����� ���' + #13#10 +
      'FrameLeftB.Hint=˳�� ���' + #13#10 +
      'FrameRightB.Hint=����� ���' + #13#10 +
      'FrameAllB.Hint=�� ��' + #13#10 +
      'FrameNoB.Hint=��������� ��' + #13#10 +
      'FrameColorB.Hint=������� �����' + #13#10 +
      'FrameStyleB.Hint=����� �����' + #13#10 +
      'FrameWidthCB.Hint=������� ��' + #13#10 +
      'ShadowB.Hint=ҳ��' + #13#10 +
      'ShadowColorB.Hint=������� ��' + #13#10 +
      'ShadowWidthCB.Hint=����� ��' + #13#10 +
      'OkB.Caption=��' + #13#10 +
      'CancelB.Caption=³�����' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=�������� �����...' + #13#10 +
      'ItemsTab.Caption=������' + #13#10 +
      'TemplatesTab.Caption=�������' + #13#10 +
      'OkB.Caption=��' + #13#10 +
      'CancelB.Caption=³�����' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=�������� TabOrder' + #13#10 +
      'Label1.Caption=�������� ���������:' + #13#10 +
      'OkB.Caption=��' + #13#10 +
      'CancelB.Caption=³�����' + #13#10 +
      'UpB.Caption=������' + #13#10 +
      'DownB.Caption=����' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=���������' + #13#10 +
      'Label1.Caption=�����' + #13#10 +
      'Label2.Caption=���������' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=������� ����' + #13#10 +
      'DataTab.Caption=���' + #13#10 +
      'GroupsTab.Caption=�����' + #13#10 +
      'LayoutTab.Caption=���������' + #13#10 +
      'StyleTab.Caption=�����' + #13#10 +
      'Step1L.Caption=���� 1. ������� ��� ��� ����������� � ���.' + #13#10 +
      'Step2L.Caption=���� 2. ������� ����� (�� ����''������).' + #13#10 +
      'Step3L.Caption=���� 3. ������� �������� ������ � ��������� �����.' + #13#10 +
      'Step4L.Caption=���� 4. ������� ����� ����.' + #13#10 +
      'AddFieldB.Caption=������ >' + #13#10 +
      'AddAllFieldsB.Caption=������ �� >>' + #13#10 +
      'RemoveFieldB.Caption=< ��������' + #13#10 +
      'RemoveAllFieldsB.Caption=<< �������� ��' + #13#10 +
      'AddGroupB.Caption=������ >' + #13#10 +
      'RemoveGroupB.Caption=< ��������' + #13#10 +
      'SelectedFieldsL.Caption=����� ����:' + #13#10 +
      'AvailableFieldsL.Caption=������� ����:' + #13#10 +
      'GroupsL.Caption=�����:' + #13#10 +
      'OrientationL.Caption=��������   ' + #13#10 +
      'LayoutL.Caption=���������   ' + #13#10 +
      'PortraitRB.Caption=���������' + #13#10 +
      'LandscapeRB.Caption=��������' + #13#10 +
      'TabularRB.Caption=� ������ �������' + #13#10 +
      'ColumnarRB.Caption=� ������ �������' + #13#10 +
      'FitWidthCB.Caption=������� �� ���� �� �����' + #13#10 +
      'CancelB.Caption=³�����' + #13#10 +
      'BackB.Caption=<< �����' + #13#10 +
      'NextB.Caption=��� >>' + #13#10 +
      'FinishB.Caption=������' + #13#10 +
      '');
    Add('wzStd', '������� ������������ ����');
    Add('wzDMP', '������� ���������� ����');
    Add('wzStdEmpty', '������� ����������� ���');
    Add('wzDMPEmpty', '������� ��������� ���');


    Add('ftAllFiles', '�� �����');
    Add('ftPictures', '��������');
    Add('ftDB', '���� �����');
    Add('ftRichFile', '���� RichText');
    Add('ftTextFile', '��������� ����');

    Add('prNotAssigned', '(�� ����������)');
    Add('prInvProp', '������ �������� ����������');
    Add('prDupl', '����������� ��''�');
    Add('prPict', '(��������)');

    Add('mvExpr', '����� � �����');
    Add('mvStretch', ' ������������');
    Add('mvStretchToMax', '������������ �� ����.������');
    Add('mvShift', ' ���������');
    Add('mvShiftOver', '��������� ��� ���������');
    Add('mvVisible', '�������');
    Add('mvPrintable', ' ����������');
    Add('mvFont', '�����...');
    Add('mvFormat', '������������...');
    Add('mvClear', '�������� �����');
    Add('mvAutoWidth', '����������');
    Add('mvWWrap', '���������� �����');
    Add('mvSuppress', '����������� ����������');
    Add('mvHideZ', '����������� ���');
    Add('mvHTML', 'HTML-���� � �����');
    Add('lvDiagonal', 'ĳ���������');
    Add('pvAutoSize', '���������');
    Add('pvCenter', '����������');
    Add('pvAspect', '�������� ���������');
    Add('bvSplit', '��������� ������');
    Add('bvKeepChild', '������� Child �����');
    Add('bvPrintChild', '��������� Child ���� ���������');
    Add('bvStartPage', '��������� ���� �������');
    Add('bvPrintIfEmpty', '���������, ���� Detail �������');
    Add('bvKeepDetail', '������� Detail �����');
    Add('bvKeepFooter', '������� ����� �����');
    Add('bvReprint', '�������� �� ���� �������');
    Add('bvOnFirst', '��������� �� ������ �������');
    Add('bvOnLast', '��������� �� ������� �������');
    Add('bvKeepGroup', '������� �����');
    Add('bvFooterAfterEach', 'Footer ���� ������� ������');
    Add('srParent', '��������� �� ����');
    Add('bvKeepHeader', '������� ��������� ������');

    Add('obCatDraw', '���������');
    Add('obCatOther', '���� ��''����');
    Add('obCatOtherControls', '���� ��������');
    Add('obDiagLine', 'ĳ��������� ���');
    Add('obRect', '�����������');
    Add('obRoundRect', '���������� �����������');
    Add('obEllipse', '����');
    Add('obTrian', '���������');
    Add('obDiamond', '����');
    Add('obLabel', '������� ��������� Label');
    Add('obEdit', '������� ��������� Edit');
    Add('obMemoC', '������� ��������� Memo');
    Add('obButton', '������� ��������� Button');
    Add('obChBoxC', '������� ��������� CheckBox');
    Add('obRButton', '������� ��������� RadioButton');
    Add('obLBox', '������� ��������� ListBox');
    Add('obCBox', '������� ��������� ComboBox');
    Add('obDateEdit', '������� ��������� DateEdit');
    Add('obImageC', '������� ��������� Image');
    Add('obPanel', '������� ��������� Panel');
    Add('obGrBox', '������� ��������� GroupBox');
    Add('obBBtn', '������� ��������� BitBtn');
    Add('obSBtn', '������� ��������� SpeedButton');
    Add('obMEdit', '������� ��������� MaskEdit');
    Add('obChLB', '������� ��������� CheckListBox');
    Add('obDBLookup', '������� ��������� DBLookupComboBox');
    Add('obBevel', '������� ��������� Bevel');
    Add('obShape', '������� ��������� Shape');
    Add('obText', '��''��� "�����"');
    Add('obSysText', '��''��� "��������� �����"');
    Add('obLine', '��''��� "˳��"');
    Add('obPicture', '��''��� "�������"');
    Add('obBand', '��''��� "����"');
    Add('obDataBand', '��''��� "����-����"');
    Add('obSubRep', '��''��� "��������� ���"');
    Add('obDlgPage', 'ĳ������� �����');
    Add('obRepPage', '������� ����');
    Add('obReport', '��''��� "���"');
    Add('obRich', '��''��� "RichText"');
    Add('obOLE', '��''��� "OLE"');
    Add('obChBox', '��''��� "CheckBox"');
    Add('obChart', '��''��� "ĳ������"');
    Add('obBarC', '��''��� "��������"');
    Add('obCross', '��''��� "Cross-tab"');
    Add('obDBCross', '��''��� "DB Cross-tab"');
    Add('obGrad', '��''��� "���䳺��"');
    Add('obDMPText', '��''��� "��������� �����"');
    Add('obDMPLine', '��''��� "�������� ���"');
    Add('obBDEDB', '���� ����� BDE');
    Add('obBDETb', '������� BDE');
    Add('obBDEQ', '����� BDE');
    Add('obBDEComps', '���������� BDE');
    Add('obIBXDB', '���� ����� IBX');
    Add('obIBXTb', '������� IBX');
    Add('obIBXQ', '����� IBX');
    Add('obIBXComps', '���������� IBX');
    Add('obADODB', '���� ����� ADO');
    Add('obADOTb', '������� ADO');
    Add('obADOQ', '����� ADO');
    Add('obADOComps', '���������� ADO');
    Add('obDBXDB', '���� ����� DBX');
    Add('obDBXTb', '������� DBX');
    Add('obDBXQ', '����� DBX');
    Add('obDBXComps', '���������� DBX');

    Add('ctString', '������');
    Add('ctDate', '���� � ���');
    Add('ctConv', '�������������');
    Add('ctFormat', '������������');
    Add('ctMath', '����������');
    Add('ctOther', '����');

    Add('IntToStr', '�������� ���� ����� � �����');
    Add('FloatToStr', '�������� ��������� ����� � �����');
    Add('DateToStr', '�������� ���� � �����');
    Add('TimeToStr', '�������� ��� � �����');
    Add('DateTimeToStr', '�������� ���� � ��� � �����');
    Add('VarToStr', '�������� ������ � �����');
    Add('StrToInt', '�������� ����� � ���� �����');
    Add('StrToFloat', '�������� ����� � ��������� �����');
    Add('StrToDate', '�������� ����� � ����');
    Add('StrToTime', '�������� ����� �� ���');
    Add('StrToDateTime', '�������� ����� � ���� � ���');
    Add('Format', '������� ������������ �����');
    Add('FormatFloat', '������� ����� �����');
    Add('FormatDateTime', '������� ���� � ���');
    Add('FormatMaskText', '������� �����, �������������� ������ �����');
    Add('EncodeDate', '������� �������� TDateTime, �� ������� ������� ��������� Year, Month, Day');
    Add('DecodeDate', '������� �������� TDateTime �� �������� Year, Month, Day');
    Add('EncodeTime', '������� �������� TDateTime, �� ������� ������� ��������� Hour, Min, Sec, MSec');
    Add('DecodeTime', '������� �������� TDateTime �� �������� Hour, Min, Sec, MSec');
    Add('Date', '������� ������� ����');
    Add('Time', '������� �������� ���');
    Add('Now', '������� ������� ���� � ���');
    Add('DayOfWeek', '������� ����� ��� �����, �� ������� ������ ���');
    Add('IsLeapYear', '������� True, ���� ������� �� - ����������');
    Add('DaysInMonth', '������� ����� ��� � �������� �����');
    Add('Length', '������� ������� �����');
    Add('Copy', '������� ��������');
    Add('Pos', '������� ������� �������� � �����');
    Add('Delete', '������� ������� ������� �����');
    Add('Insert', '�������� �������� � �����');
    Add('Uppercase', '�������� �� ������� ����� � ������ ������');
    Add('Lowercase', '�������� �� ������� ����� � ����� ������');
    Add('Trim', '������� ������ �� ������� � ���� �����');
    Add('NameCase', '�������� ������ ������ ����� � ������ ������');
    Add('CompareText', '������� ��� ����� ��� ���������� �������');
    Add('Chr', '�������� ���� ����� � ������');
    Add('Ord', '�������� ������ � ���� �����');
    Add('SetLength', '���������� ������� �����');
    Add('Round', '�������� ����� �� ����������� ������ ��������');
    Add('Trunc', '³����� ������� ������� �����');
    Add('Int', '������� ���� ������� ������� ��������');
    Add('Frac', '������� ������� ������� ������� ��������');
    Add('Sqrt', '������� ����� ���������� �� �����');
    Add('Abs', '������� ������ �����');
    Add('Sin', '������� ����� ���� (� �������)');
    Add('Cos', '������� ������� ���� (� �������)');
    Add('ArcTan', '������� ����������');
    Add('Tan', '������� �������');
    Add('Exp', '������� ����������');
    Add('Ln', '������� ����������� �������� �������� �����');
    Add('Pi', '������� ����� "�"');
    Add('Inc', '������ ���� ����� �� 1');
    Add('Dec', '������ ���� ����� �� 1');
    Add('RaiseException', '������� ����������');
    Add('ShowMessage', '������ ���� �����������');
    Add('Randomize', '������� ��������� ���������� �����');
    Add('Random', '������� ��������� �����');
    Add('ValidInt', '������� True ���� ������� ����� ���� ���� ������������ � ���� �����');
    Add('ValidFloat', '������� True ���� ������� ����� ���� ���� ������������ � ����� �����');
    Add('ValidDate', '������� True ���� ������� ����� ���� ���� ������������ � ����');
    Add('IIF', '������� TrueValue ���� ������� ����� ������� True, ������ ������� FalseValue');
    Add('Get', '������� �������� ����� � ������ ������');
    Add('Set', '���������� �������� ����� � ������ ������');
    Add('InputBox', '������ ����� �������� �����');
    Add('InputQuery', '������ ����� �������� �����');
    Add('MessageDlg', '������ ���� �����������');
    Add('CreateOleObject', '������� OLE ��''���');
    Add('VarArrayCreate', '������� ����� �������');
    Add('VarType', '������� ��� �������');
    Add('DayOf', '���������� ���� (1..31) ���� Date');
    Add('MonthOf', '���������� ����� (1..12) ���� Date');
    Add('YearOf', '���������� ��� ���� Date');

    Add('ctAggregate', '����������');
    Add('Sum', '���������� ����� ��������� Expr ��� ����� Band');
    Add('Avg', '���������� ������� �������� ��������� Expr ��� ����� Band');
    Add('Min', '���������� ����������� �������� ��������� Expr ��� ����� Band');
    Add('Max', '���������� ������������ �������� ��������� Expr ��� ����� Band');
    Add('Count', '���������� ���������� ����� � ����� Band');
  end;
end;


initialization
  frAddDesignerRes;

end.

