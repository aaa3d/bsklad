
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
      'Caption=Object Inspector' + #13#10 +
      '');
    Add('oiProp', 'Properties');
    Add('oiEvent', 'Events');

    Add('TfrxDataTreeForm',
      'Caption=Data Tree' + #13#10 +
      'DataTS.Caption=Data' + #13#10 +
      'VariablesTS.Caption=Variables' + #13#10 +
      'FunctionsTS.Caption=Functions' + #13#10 +
      'InsFieldCB.Caption=Create field' + #13#10 +
      'InsCaptionCB.Caption=Create caption' + #13#10 +
      '');
    Add('dtNoData', 'No data available');
    Add('dtData', 'Data');
    Add('dtSysVar', 'System variables');
    Add('dtVar', 'Variables');
    Add('dtFunc', 'Functions');

    Add('TfrxReportTreeForm',
      'Caption=Report Tree' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Open Script File' + #13#10 +
      'SaveScriptB.Hint=Save Script to File' + #13#10 +
      'RunScriptB.Hint=Run Script' + #13#10 +
      'StepScriptB.Hint=Trace Into' + #13#10 +
      'StopScriptB.Hint=Terminate Script' + #13#10 +
      'EvaluateB.Hint=Evaluate' + #13#10 +
      'LangL.Caption=Language:' + #13#10 +
      'AlignTB.Caption=Align' + #13#10 +
      'AlignLeftsB.Hint=Align Left' + #13#10 +
      'AlignHorzCentersB.Hint=Align Middle' + #13#10 +
      'AlignRightsB.Hint=Align Right' + #13#10 +
      'AlignTopsB.Hint=Align Top' + #13#10 +
      'AlignVertCentersB.Hint=Align Center' + #13#10 +
      'AlignBottomsB.Hint=Align Bottom' + #13#10 +
      'SpaceHorzB.Hint=Space Horizontally' + #13#10 +
      'SpaceVertB.Hint=Space Vertically' + #13#10 +
      'CenterHorzB.Hint=Center Horizontally in Band' + #13#10 +
      'CenterVertB.Hint=Center Vertically in Band' + #13#10 +
      'SameWidthB.Hint=Same Width' + #13#10 +
      'SameHeightB.Hint=Same Height' + #13#10 +
      'TextTB.Caption=Text' + #13#10 +
      'StyleCB.Hint=Style' + #13#10 +
      'FontNameCB.Hint=Font Name' + #13#10 +
      'FontSizeCB.Hint=Font Size' + #13#10 +
      'BoldB.Hint=Bold' + #13#10 +
      'ItalicB.Hint=Italic' + #13#10 +
      'UnderlineB.Hint=Underline' + #13#10 +
      'FontColorB.Hint=Font Color' + #13#10 +
      'HighlightB.Hint=Highlight' + #13#10 +
      'RotateB.Hint=Text Rotation' + #13#10 +
      'TextAlignLeftB.Hint=Align Left' + #13#10 +
      'TextAlignCenterB.Hint=Align Center' + #13#10 +
      'TextAlignRightB.Hint=Align Right' + #13#10 +
      'TextAlignBlockB.Hint=Justify' + #13#10 +
      'TextAlignTopB.Hint=Align Top' + #13#10 +
      'TextAlignMiddleB.Hint=Align Middle' + #13#10 +
      'TextAlignBottomB.Hint=Align Bottom' + #13#10 +
      'FrameTB.Caption=Frame' + #13#10 +
      'FrameTopB.Hint=Top Line' + #13#10 +
      'FrameBottomB.Hint=Bottom Line' + #13#10 +
      'FrameLeftB.Hint=Left Line' + #13#10 +
      'FrameRightB.Hint=Right Line' + #13#10 +
      'FrameAllB.Hint=All Frame Lines' + #13#10 +
      'FrameNoB.Hint=No Frame' + #13#10 +
      'ShadowB.Hint=Shadow' + #13#10 +
      'FillColorB.Hint=Background Color' + #13#10 +
      'FrameColorB.Hint=Frame Color' + #13#10 +
      'FrameStyleB.Hint=Frame Style' + #13#10 +
      'FrameWidthCB.Hint=Frame Width' + #13#10 +
      'StandardTB.Caption=Standard' + #13#10 +
      'NewB.Hint=New Report' + #13#10 +
      'OpenB.Hint=Open Report' + #13#10 +
      'SaveB.Hint=Save Report' + #13#10 +
      'PreviewB.Hint=Preview' + #13#10 +
      'NewPageB.Hint=New Report Page' + #13#10 +
      'NewDialogB.Hint=New Dialog Page' + #13#10 +
      'DeletePageB.Hint=Delete Page' + #13#10 +
      'PageSettingsB.Hint=Page Settings' + #13#10 +
      'VariablesB.Hint=Variables' + #13#10 +
      'CutB.Hint=Cut' + #13#10 +
      'CopyB.Hint=Copy' + #13#10 +
      'PasteB.Hint=Paste' + #13#10 +
      'SampleFormatB.Hint=Copy Formatting' + #13#10 +
      'UndoB.Hint=Undo' + #13#10 +
      'RedoB.Hint=Redo' + #13#10 +
      'GroupB.Hint=Group' + #13#10 +
      'UngroupB.Hint=Ungroup' + #13#10 +
      'ShowGridB.Hint=Show Grid' + #13#10 +
      'AlignToGridB.Hint=Align to Grid' + #13#10 +
      'SetToGridB.Hint=Fit to Grid' + #13#10 +
      'ScaleCB.Hint=Zoom' + #13#10 +
      'ExtraToolsTB.Caption=Extra Tools' + #13#10 +
      'ObjectSelectB.Hint=Select Tool' + #13#10 +
      'HandToolB.Hint=Hand Tool' + #13#10 +
      'ZoomToolB.Hint=Zoom Tool' + #13#10 +
      'TextToolB.Hint=Edit Text Tool' + #13#10 +
      'FormatToolB.Hint=Copy Format Tool' + #13#10 +
      'ObjectBandB.Hint=Insert Band' + #13#10 +
      'FileMenu.Caption=&File' + #13#10 +
      'EditMenu.Caption=&Edit' + #13#10 +
      'FindMI.Caption=Find...' + #13#10 +
      'FindNextMI.Caption=Find Next' + #13#10 +
      'ReplaceMI.Caption=Replace...' + #13#10 +
      'ReportMenu.Caption=&Report' + #13#10 +
      'ReportDataMI.Caption=Data...' + #13#10 +
      'ReportSettingsMI.Caption=Options...' + #13#10 +
      'ReportStylesMI.Caption=Styles...' + #13#10 +
      'ViewMenu.Caption=&View' + #13#10 +
      'ToolbarsMI.Caption=Toolbars' + #13#10 +
      'StandardMI.Caption=Standard' + #13#10 +
      'TextMI.Caption=Text' + #13#10 +
      'FrameMI.Caption=Frame' + #13#10 +
      'AlignmentMI.Caption=Alignment Palette' + #13#10 +
      'ToolsMI.Caption=Extra Tools' + #13#10 +
      'InspectorMI.Caption=Object Inspector' + #13#10 +
      'DataTreeMI.Caption=Data Tree' + #13#10 +
      'ReportTreeMI.Caption=Report Tree' + #13#10 +
      'ShowRulersMI.Caption=Rulers' + #13#10 +
      'ShowGuidesMI.Caption=Guides' + #13#10 +
      'DeleteGuidesMI.Caption=Delete Guides' + #13#10 +
      'OptionsMI.Caption=Options...' + #13#10 +
      'HelpMenu.Caption=&Help' + #13#10 +
      'HelpContentsMI.Caption=Help Contents...' + #13#10 +
      'AboutMI.Caption=About FastReport...' + #13#10 +
      'TabOrderMI.Caption=Tab Order...' + #13#10 +
      'UndoCmd.Caption=Undo' + #13#10 +
      'RedoCmd.Caption=Redo' + #13#10 +
      'CutCmd.Caption=Cut' + #13#10 +
      'CopyCmd.Caption=Copy' + #13#10 +
      'PasteCmd.Caption=Paste' + #13#10 +
      'GroupCmd.Caption=Group' + #13#10 +
      'UngroupCmd.Caption=Ungroup' + #13#10 +
      'DeleteCmd.Caption=Delete' + #13#10 +
      'DeletePageCmd.Caption=Delete Page' + #13#10 +
      'SelectAllCmd.Caption=Select All' + #13#10 +
      'EditCmd.Caption=Edit...' + #13#10 +
      'BringToFrontCmd.Caption=Bring to Front' + #13#10 +
      'SendToBackCmd.Caption=Send to Back' + #13#10 +
      'NewItemCmd.Caption=New...' + #13#10 +
      'NewReportCmd.Caption=New Report' + #13#10 +
      'NewPageCmd.Caption=New Page' + #13#10 +
      'NewDialogCmd.Caption=New Dialog' + #13#10 +
      'OpenCmd.Caption=Open...' + #13#10 +
      'SaveCmd.Caption=Save' + #13#10 +
      'SaveAsCmd.Caption=Save As...' + #13#10 +
      'VariablesCmd.Caption=Variables...' + #13#10 +
      'PageSettingsCmd.Caption=Page Settings...' + #13#10 +
      'PreviewCmd.Caption=Preview' + #13#10 +
      'ExitCmd.Caption=Exit' + #13#10 +
      'ReportTitleMI.Caption=Report Title' + #13#10 +
      'ReportSummaryMI.Caption=Report Summary' + #13#10 +
      'PageHeaderMI.Caption=Page Header' + #13#10 +
      'PageFooterMI.Caption=Page Footer' + #13#10 +
      'HeaderMI.Caption=Header' + #13#10 +
      'FooterMI.Caption=Footer' + #13#10 +
      'MasterDataMI.Caption=Master Data' + #13#10 +
      'DetailDataMI.Caption=Detail Data' + #13#10 +
      'SubdetailDataMI.Caption=Subdetail Data' + #13#10 +
      'Data4levelMI.Caption=Data 4th level' + #13#10 +
      'Data5levelMI.Caption=Data 5th level' + #13#10 +
      'Data6levelMI.Caption=Data 6th level' + #13#10 +
      'GroupHeaderMI.Caption=Group Header' + #13#10 +
      'GroupFooterMI.Caption=Group Footer' + #13#10 +
      'ChildMI.Caption=Child' + #13#10 +
      'ColumnHeaderMI.Caption=Column Header' + #13#10 +
      'ColumnFooterMI.Caption=Column Footer' + #13#10 +
      'OverlayMI.Caption=Overlay' + #13#10 +
      'VerticalbandsMI.Caption=Vertical bands' + #13#10 +
      'HeaderMI1.Caption=Header' + #13#10 +
      'FooterMI1.Caption=Footer' + #13#10 +
      'MasterDataMI1.Caption=Master Data' + #13#10 +
      'DetailDataMI1.Caption=Detail Data' + #13#10 +
      'SubdetailDataMI1.Caption=Subdetail Data' + #13#10 +
      'GroupHeaderMI1.Caption=Group Header' + #13#10 +
      'GroupFooterMI1.Caption=Group Footer' + #13#10 +
      'ChildMI1.Caption=Child' + #13#10 +
      'R0MI.Caption=0°' + #13#10 +
      'R45MI.Caption=45°' + #13#10 +
      'R90MI.Caption=90°' + #13#10 +
      'R180MI.Caption=180°' + #13#10 +
      'R270MI.Caption=270°' + #13#10 +
      'FontB.Hint=Font Settings' + #13#10 +
      'BoldMI.Caption=Bold' + #13#10 +
      'ItalicMI.Caption=Italic' + #13#10 +
      'UnderlineMI.Caption=Underline' + #13#10 +
      'SuperScriptMI.Caption=SuperScript' + #13#10 +
      'SubScriptMI.Caption=SubScript' + #13#10 +
      'CondensedMI.Caption=Condensed' + #13#10 +
      'WideMI.Caption=Wide' + #13#10 +
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
    Add('dsSavePreviewChanges', 'Save changes to preview page?');
    Add('dsSaveChangesTo', 'Save changes to ');
    Add('dsCantLoad', 'Couldn''t load file');
    Add('dsStyleFile', 'Style');
    Add('dsCantFindProc', 'Could not locate the main proc');
    Add('dsClearScript', 'This will clear all code. Do you want to continue?');
    Add('dsNoStyle', 'No style');
    Add('dsStyleSample', 'Style sample');
    Add('dsTextNotFound', 'Text ''%s'' not found');
    Add('dsReplace', 'Replace this occurence of ''%s''?');

    Add('TfrxAboutForm',
      'Caption=About FastReport' + #13#10 +
      'Label4.Caption=Visit our webpage for more info:' + #13#10 +
      'Label6.Caption=Sales:' + #13#10 +
      'Label8.Caption=Support:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Page Options' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'TabSheet1.Caption=Paper' + #13#10 +
      'Label1.Caption=Width' + #13#10 +
      'Label2.Caption=Height' + #13#10 +
      'Label11.Caption=Size' + #13#10 +
      'Label12.Caption=Orientation' + #13#10 +
      'Label3.Caption=Left' + #13#10 +
      'Label4.Caption=Top' + #13#10 +
      'Label5.Caption=Right' + #13#10 +
      'Label6.Caption=Bottom' + #13#10 +
      'Label13.Caption=Margins' + #13#10 +
      'Label14.Caption=Paper Source' + #13#10 +
      'Label9.Caption=First page' + #13#10 +
      'Label10.Caption=Other pages' + #13#10 +
      'PortraitRB.Caption=Portrait' + #13#10 +
      'LandscapeRB.Caption=Landscape' + #13#10 +
      'TabSheet3.Caption=Other options' + #13#10 +
      'Label7.Caption=Columns' + #13#10 +
      'Label8.Caption=Number' + #13#10 +
      'Label15.Caption=Width' + #13#10 +
      'Label16.Caption=Positions' + #13#10 +
      'Label17.Caption=Other' + #13#10 +
      'Label18.Caption=Duplex' + #13#10 +
      'PrintOnPrevCB.Caption=Print to previous page' + #13#10 +
      'MirrorMarginsCB.Caption=Mirror margins' + #13#10 +
      'LargeHeightCB.Caption=Large height in design mode' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Select Report Datasets' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Edit Variables' + #13#10 +
      'NewCategoryB.Caption=Category' + #13#10 +
      'NewVarB.Caption=Variable' + #13#10 +
      'EditB.Caption=Edit' + #13#10 +
      'DeleteB.Caption=Delete' + #13#10 +
      'EditListB.Caption=List' + #13#10 +
      'LoadB.Caption=Load' + #13#10 +
      'SaveB.Caption=Save' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'ExprPanel.Caption=Expression:' + #13#10 +
      'OpenDialog1.Filter=Dictionary (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Dictionary (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(no variables defined)');
    Add('vaVar', 'Variables');
    Add('vaDupName', 'Duplicate name');

    Add('TfrxOptionsEditor',
      'Caption=Designer Options' + #13#10 +
      'Label1.Caption=Grid' + #13#10 +
      'Label2.Caption=Type' + #13#10 +
      'Label3.Caption=Size' + #13#10 +
      'Label4.Caption=Dialog form:' + #13#10 +
      'Label5.Caption=Other' + #13#10 +
      'Label6.Caption=Fonts' + #13#10 +
      'Label7.Caption=Code window' + #13#10 +
      'Label8.Caption=Memo editor' + #13#10 +
      'Label9.Caption=Size' + #13#10 +
      'Label10.Caption=Size' + #13#10 +
      'Label11.Caption=Colors' + #13#10 +
      'Label12.Caption=Gap between bands:' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=in' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'CMRB.Caption=Centimeters:' + #13#10 +
      'InchesRB.Caption=Inches:' + #13#10 +
      'PixelsRB.Caption=Pixels:' + #13#10 +
      'ShowGridCB.Caption=Show grid' + #13#10 +
      'AlignGridCB.Caption=Align to Grid' + #13#10 +
      'EditAfterInsCB.Caption=Show editor after insert' + #13#10 +
      'ObjectFontCB.Caption=Use object''s font settings' + #13#10 +
      'WorkspaceB.Caption=Workspace' + #13#10 +
      'ToolB.Caption=Tool windows' + #13#10 +
      'LCDCB.Caption=LCD grid color' + #13#10 +
      'FreeBandsCB.Caption=Free bands placement' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Restore defaults' + #13#10 +
      'BandsCaptionsCB.Caption=Show band captions' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=Select DataSet' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      '');
    Add('dbNotAssigned', '[not assigned]');
    Add('dbSingleLine', 'Single row');

    Add('TfrxGroupEditorForm',
      'Caption=Group' + #13#10 +
      'BreakOnL.Caption=Break on' + #13#10 +
      'OptionsL.Caption=Options' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'DataFieldRB.Caption=Data field' + #13#10 +
      'ExpressionRB.Caption=Expression' + #13#10 +
      'KeepGroupTogetherCB.Caption=Keep group together' + #13#10 +
      'StartNewPageCB.Caption=Start new page' + #13#10 +
      'OutlineCB.Caption=Show in outline' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=System Memo' + #13#10 +
      'DataBandL.Caption=Data band' + #13#10 +
      'DataSetL.Caption=DataSet' + #13#10 +
      'DataFieldL.Caption=DataField' + #13#10 +
      'FunctionL.Caption=Function' + #13#10 +
      'ExpressionL.Caption=Expression' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AggregateRB.Caption=Aggregate value' + #13#10 +
      'SysVariableRB.Caption=System variable' + #13#10 +
      'CountInvisibleCB.Caption=Count invisible bands' + #13#10 +
      'TextRB.Caption=Text' + #13#10 +
      'RunningTotalCB.Caption=Running total' + #13#10 +
      '');
    Add('agAggregate', 'Insert Aggregate');
    Add('vt1', '[DATE]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGES#]');
    Add('vt5', '[PAGE#] of [TOTALPAGES#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=OLE object' + #13#10 +
      'InsertB.Caption=Insert...' + #13#10 +
      'EditB.Caption=Edit...' + #13#10 +
      'CloseB.Caption=Close' + #13#10 +
      '');
    Add('olStretched', 'Stretched');

    Add('TfrxBarcodeEditorForm',
      'Caption=Barcode Editor' + #13#10 +
      'CodeLbl.Caption=Code' + #13#10 +
      'TypeLbl.Caption=Type of Bar' + #13#10 +
      'ZoomLbl.Caption=Zoom:' + #13#10 +
      'OptionsLbl.Caption=Options' + #13#10 +
      'RotationLbl.Caption=Rotation' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CalcCheckSumCB.Caption=Calc Checksum' + #13#10 +
      'ViewTextCB.Caption=Text' + #13#10 +
      'Rotation0RB.Caption=0°' + #13#10 +
      'Rotation90RB.Caption=90°' + #13#10 +
      'Rotation180RB.Caption=180°' + #13#10 +
      'Rotation270RB.Caption=270°' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Calc Checksum');
    Add('bcShowText', 'Show Text');

    Add('TfrxAliasesEditorForm',
      'Caption=Edit Aliases' + #13#10 +
      'HintL.Caption=Press Enter to edit item' + #13#10 +
      'DSAliasL.Caption=Dataset alias' + #13#10 +
      'FieldAliasesL.Caption=Field aliases' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'ResetB.Caption=Reset' + #13#10 +
      'UpdateB.Caption=Update' + #13#10 +
      '');
    Add('alUserName', 'User name');
    Add('alOriginal', 'Original name');

    Add('TfrxParamsEditorForm',
      'Caption=Parameters Editor' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      '');
    Add('qpName', 'Name');
    Add('qpDataType', 'Data Type');
    Add('qpValue', 'Value');

    Add('TfrxMDEditorForm',
      'Caption=Master-Detail Link' + #13#10 +
      'Label1.Caption=Detail fields' + #13#10 +
      'Label2.Caption=Master fields' + #13#10 +
      'Label3.Caption=Linked fields' + #13#10 +
      'AddB.Caption=Add' + #13#10 +
      'ClearB.Caption=Clear' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=Memo' + #13#10 +
      'ExprB.Hint=Insert Expression' + #13#10 +
      'AggregateB.Hint=Insert Aggregate' + #13#10 +
      'LocalFormatB.Hint=Insert Formatting' + #13#10 +
      'WordWrapB.Hint=Word Wrap' + #13#10 +
      'CancelB.Hint=Cancel' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=Picture' + #13#10 +
      'LoadB.Hint=Load' + #13#10 +
      'CopyB.Hint=Copy' + #13#10 +
      'PasteB.Hint=Paste' + #13#10 +
      'ClearB.Hint=Clear' + #13#10 +
      'CancelB.Hint=Cancel' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('piEmpty', 'Empty');

    Add('TfrxChartEditorForm',
      'Caption=Chart Editor' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=Add Series' + #13#10 +
      'DeleteB.Hint=Delete Series' + #13#10 +
      'DBSourceRB.Caption=Data from DB' + #13#10 +
      'BandSourceRB.Caption=Band source' + #13#10 +
      'FixedDataRB.Caption=Fixed data' + #13#10 +
      'DatasetLbl.Caption=DataSet' + #13#10 +
      'BandLbl.Caption=Data band' + #13#10 +
      'X1Lbl.Caption=X Values' + #13#10 +
      'Y1Lbl.Caption=Y Values' + #13#10 +
      'X2Lbl.Caption=X Values' + #13#10 +
      'Y2Lbl.Caption=Y Values' + #13#10 +
      'X3Lbl.Caption=X Values (for example, a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Y Values (for example, 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Other options' + #13#10 +
      'ShowTopLbl.Caption=TopN values' + #13#10 +
      'CaptionLbl.Caption=TopN caption' + #13#10 +
      'SortLbl.Caption=Sort order' + #13#10 +
      'LineMI.Caption=Line' + #13#10 +
      'AreaMI.Caption=Area' + #13#10 +
      'PointMI.Caption=Point' + #13#10 +
      'BarMI.Caption=Bar' + #13#10 +
      'HorizBarMI.Caption=Horiz. Bar' + #13#10 +
      'PieMI.Caption=Pie' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Fast Line' + #13#10 +
      '');
    Add('ch3D', '3D View');
    Add('chAxis', 'Show Axis');
    Add('chsoNone', 'None');
    Add('chsoAscending', 'Ascending');
    Add('chsoDescending', 'Descending');

    Add('TfrxRichEditorForm',
      'Caption=Rich Editor' + #13#10 +
      'OpenB.Hint=Open File' + #13#10 +
      'SaveB.Hint=Save File' + #13#10 +
      'UndoB.Hint=Undo' + #13#10 +
      'TTB.Hint=Font' + #13#10 +
      'ExprB.Hint=Insert Expression' + #13#10 +
      'CancelB.Hint=Cancel' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      'BoldB.Hint=Bold' + #13#10 +
      'ItalicB.Hint=Italic' + #13#10 +
      'UnderlineB.Hint=Underline' + #13#10 +
      'LeftAlignB.Hint=Left Align' + #13#10 +
      'CenterAlignB.Hint=Center Align' + #13#10 +
      'RightAlignB.Hint=Right Align' + #13#10 +
      'BlockAlignB.Hint=Justify' + #13#10 +
      'BulletsB.Hint=Bullets' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Cross-tab Editor' + #13#10 +
      'DatasetL.Caption=Source data' + #13#10 +
      'DimensionsL.Caption=Dimensions' + #13#10 +
      'RowsL.Caption=Rows' + #13#10 +
      'ColumnsL.Caption=Columns' + #13#10 +
      'CellsL.Caption=Cells' + #13#10 +
      'StructureL.Caption=Cross-tab structure' + #13#10 +
      'RowHeaderCB.Caption=Row header' + #13#10 +
      'ColumnHeaderCB.Caption=Column header' + #13#10 +
      'RowTotalCB.Caption=Row grand total' + #13#10 +
      'ColumnTotalCB.Caption=Column grand total' + #13#10 +
      'SwapB.Hint=Swap rows/columns' + #13#10 +
      'StyleCB.Hint=Cross-tab Style' + #13#10 +
      'FontB.Hint=Font Settings' + #13#10 +
      'AlignLeftB.Hint=Align Left' + #13#10 +
      'AlignCenterB.Hint=Align Center' + #13#10 +
      'AlignRightB.Hint=Align Right' + #13#10 +
      'RotationB.Hint=Text Rotation' + #13#10 +
      'HighlightB.Hint=Highlight' + #13#10 +
      'FormatB.Hint=Format' + #13#10 +
      'FrameB.Hint=Frame Settings' + #13#10 +
      'FillColorB.Hint=Fill Color' + #13#10 +
      'Func1MI.Caption=None' + #13#10 +
      'Func2MI.Caption=Sum' + #13#10 +
      'Func3MI.Caption=Min' + #13#10 +
      'Func4MI.Caption=Max' + #13#10 +
      'Func5MI.Caption=Average' + #13#10 +
      'Func6MI.Caption=Count' + #13#10 +
      'Sort1MI.Caption=Ascending (A-Z)' + #13#10 +
      'Sort2MI.Caption=Descending (Z-A)' + #13#10 +
      'Sort3MI.Caption=No Sort' + #13#10 +
      'BoldMI.Caption=Bold' + #13#10 +
      'ItalicMI.Caption=Italic' + #13#10 +
      'UnderlineMI.Caption=Underline' + #13#10 +
      'SuperScriptMI.Caption=SuperScript' + #13#10 +
      'SubScriptMI.Caption=SubScript' + #13#10 +
      'CondensedMI.Caption=Condensed' + #13#10 +
      'WideMI.Caption=Wide' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=Cancel' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('crSubtotal', 'Subtotal');
    Add('crNone', 'None');
    Add('crSum', 'Sum');
    Add('crMin', 'Min');
    Add('crMax', 'Max');
    Add('crAvg', 'Avg');
    Add('crCount', 'Count');
    Add('crAsc', 'A-Z');
    Add('crDesc', 'Z-A');
    Add('crRepHdrs', 'Reprint Headers');
    Add('crBorder', 'Border');
    Add('crDown', 'Down Then Across');

    Add('TfrxExprEditorForm',
      'Caption=Expression Editor' + #13#10 +
      'ExprL.Caption=Expression:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=Display Format' + #13#10 +
      'CategoryL.Caption=Category' + #13#10 +
      'FormatL.Caption=Format' + #13#10 +
      'FormatStrL.Caption=Format string:' + #13#10 +
      'SeparatorL.Caption=Decimal separator:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      '');
    Add('fkText', 'Text (no formatting)');
    Add('fkNumber', 'Number');
    Add('fkDateTime', 'Date/Time');
    Add('fkBoolean', 'Boolean');
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
      'Caption=Highlight' + #13#10 +
      'FontColorB.Caption=Color...' + #13#10 +
      'BackColorB.Caption=Color...' + #13#10 +
      'ConditionL.Caption=Condition' + #13#10 +
      'FontL.Caption=Font' + #13#10 +
      'BackgroundL.Caption=Background' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'BoldCB.Caption=Bold' + #13#10 +
      'ItalicCB.Caption=Italic' + #13#10 +
      'UnderlineCB.Caption=Underline' + #13#10 +
      'TransparentRB.Caption=Transparent' + #13#10 +
      'OtherRB.Caption=Other' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Report Settings' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'GeneralTS.Caption=General' + #13#10 +
      'ReportSettingsL.Caption=Printer settings' + #13#10 +
      'CopiesL.Caption=Copies' + #13#10 +
      'GeneralL.Caption=General' + #13#10 +
      'PasswordL.Caption=Password' + #13#10 +
      'CollateCB.Caption=Collate copies' + #13#10 +
      'DoublePassCB.Caption=Double pass' + #13#10 +
      'PrintIfEmptyCB.Caption=Print if empty' + #13#10 +
      'DescriptionTS.Caption=Description' + #13#10 +
      'NameL.Caption=Name' + #13#10 +
      'Description1L.Caption=Description' + #13#10 +
      'PictureL.Caption=Picture' + #13#10 +
      'AuthorL.Caption=Author' + #13#10 +
      'MajorL.Caption=Major' + #13#10 +
      'MinorL.Caption=Minor' + #13#10 +
      'ReleaseL.Caption=Release' + #13#10 +
      'BuildL.Caption=Build' + #13#10 +
      'CreatedL.Caption=Created' + #13#10 +
      'ModifiedL.Caption=Modified' + #13#10 +
      'DescriptionL.Caption=Description' + #13#10 +
      'VersionL.Caption=Version' + #13#10 +
      'PictureB.Caption=Browse...' + #13#10 +
      '');
    Add('rePrnOnPort', 'on');

    Add('TfrxStringsEditorForm',
      'Caption=Lines' + #13#10 +
      'CancelB.Hint=Cancel' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=Cancel' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      'QBB.Hint=Query Builder' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=Password' + #13#10 +
      'PasswordL.Caption=Enter the password:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=Style Editor' + #13#10 +
      'ColorB.Caption=Color...' + #13#10 +
      'FontB.Caption=Font...' + #13#10 +
      'FrameB.Caption=Frame...' + #13#10 +
      'AddB.Hint=Add' + #13#10 +
      'DeleteB.Hint=Delete' + #13#10 +
      'EditB.Hint=Edit' + #13#10 +
      'LoadB.Hint=Load' + #13#10 +
      'SaveB.Hint=Save' + #13#10 +
      'CancelB.Hint=Cancel' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=Frame Editor' + #13#10 +
      'FrameL.Caption=Frame' + #13#10 +
      'LineL.Caption=Frame line' + #13#10 +
      'ShadowL.Caption=Shadow' + #13#10 +
      'FrameTopB.Hint=Top Line' + #13#10 +
      'FrameBottomB.Hint=Bottom Line' + #13#10 +
      'FrameLeftB.Hint=Left Line' + #13#10 +
      'FrameRightB.Hint=Right Line' + #13#10 +
      'FrameAllB.Hint=All Frame Lines' + #13#10 +
      'FrameNoB.Hint=No Frame' + #13#10 +
      'FrameColorB.Hint=Frame Color' + #13#10 +
      'FrameStyleB.Hint=Frame Style' + #13#10 +
      'FrameWidthCB.Hint=Frame Width' + #13#10 +
      'ShadowB.Hint=Shadow' + #13#10 +
      'ShadowColorB.Hint=Shadow Color' + #13#10 +
      'ShadowWidthCB.Hint=Shadow Width' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=New Item' + #13#10 +
      'ItemsTab.Caption=Items' + #13#10 +
      'TemplatesTab.Caption=Templates' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Tab Order' + #13#10 +
      'Label1.Caption=Controls listed in tab order:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'UpB.Caption=Move Up' + #13#10 +
      'DownB.Caption=Move Down' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Evaluate' + #13#10 +
      'Label1.Caption=Expression' + #13#10 +
      'Label2.Caption=Result' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Report Wizard' + #13#10 +
      'DataTab.Caption=Data' + #13#10 +
      'GroupsTab.Caption=Groups' + #13#10 +
      'LayoutTab.Caption=Layout' + #13#10 +
      'StyleTab.Caption=Style' + #13#10 +
      'Step1L.Caption=Step 1. Select the dataset and fields to display.' + #13#10 +
      'Step2L.Caption=Step 2. Create groups (optional).' + #13#10 +
      'Step3L.Caption=Step 3. Define the page orientation and data layout.' + #13#10 +
      'Step4L.Caption=Step 4. Choose the report style.' + #13#10 +
      'AddFieldB.Caption=Add >' + #13#10 +
      'AddAllFieldsB.Caption=Add all >>' + #13#10 +
      'RemoveFieldB.Caption=< Remove' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Remove all' + #13#10 +
      'AddGroupB.Caption=Add >' + #13#10 +
      'RemoveGroupB.Caption=< Remove' + #13#10 +
      'SelectedFieldsL.Caption=Selected fields:' + #13#10 +
      'AvailableFieldsL.Caption=Available fields:' + #13#10 +
      'GroupsL.Caption=Groups:' + #13#10 +
      'OrientationL.Caption=Orientation' + #13#10 +
      'LayoutL.Caption=Layout' + #13#10 +
      'PortraitRB.Caption=Portrait' + #13#10 +
      'LandscapeRB.Caption=Landscape' + #13#10 +
      'TabularRB.Caption=Tabular' + #13#10 +
      'ColumnarRB.Caption=Columnar' + #13#10 +
      'FitWidthCB.Caption=Fit fields to page width' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'BackB.Caption=<< Back' + #13#10 +
      'NextB.Caption=Next >>' + #13#10 +
      'FinishB.Caption=Finish' + #13#10 +
      '');
    Add('wzStd', 'Standard Report Wizard');
    Add('wzDMP', 'Dot-Matrix Report Wizard');
    Add('wzStdEmpty', 'Standard Report');
    Add('wzDMPEmpty', 'Dot-Matrix Report');


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
    Add('bvKeepHeader', 'Keep Header Together');

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
    Add('obDMPCmd', 'Dot-matrix Command object');

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