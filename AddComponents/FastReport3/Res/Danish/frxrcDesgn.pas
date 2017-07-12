
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
      'Caption=Datatræ' + #13#10 +
      'DataTS.Caption=Data' + #13#10 +
      'VariablesTS.Caption=Variable' + #13#10 +
      'FunctionsTS.Caption=Funktioner' + #13#10 +
      'InsFieldCB.Caption=Lav felt' + #13#10 +
      'InsCaptionCB.Caption=Lav kort titel' + #13#10 +
      '');
    Add('dtNoData', 'Intet data tilgængeligt');
    Add('dtData', 'Data');
    Add('dtSysVar', 'System variable');
    Add('dtVar', 'Variable');
    Add('dtFunc', 'Funktioner');

    Add('TfrxReportTreeForm',
      'Caption=Raporttræ' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Åbn Skript-fil' + #13#10 +
      'SaveScriptB.Hint=Gem Skript i fil' + #13#10 +
      'RunScriptB.Hint=Kør skript' + #13#10 +
      'StepScriptB.Hint=Spor ind i' + #13#10 +
      'StopScriptB.Hint=Afbryd skript' + #13#10 +
      'EvaluateB.Hint=Evaluer' + #13#10 +
      'LangL.Caption=Sprog:' + #13#10 +
      'AlignTB.Caption=Stille op på linie' + #13#10 +
      'AlignLeftsB.Hint=Stil op til venstre' + #13#10 +
      'AlignHorzCentersB.Hint=Stil op i midten' + #13#10 +
      'AlignRightsB.Hint=Stil op til højre' + #13#10 +
      'AlignTopsB.Hint=Stil op i top' + #13#10 +
      'AlignVertCentersB.Hint=Stil op centreret' + #13#10 +
      'AlignBottomsB.Hint=Stil op i bund' + #13#10 +
      'SpaceHorzB.Hint=Afstand horisontalt' + #13#10 +
      'SpaceVertB.Hint=Afstand vertikalt' + #13#10 +
      'CenterHorzB.Hint=Centere horisontalt i bånd' + #13#10 +
      'CenterVertB.Hint=Centere vertikalt i bånd' + #13#10 +
      'SameWidthB.Hint=Samme bredde' + #13#10 +
      'SameHeightB.Hint=Samme højde' + #13#10 +
      'TextTB.Caption=Tekst' + #13#10 +
      'StyleCB.Hint=Stil' + #13#10 +
      'FontNameCB.Hint=Skrifttypenavn' + #13#10 +
      'FontSizeCB.Hint=Skrifttypestørrelse' + #13#10 +
      'BoldB.Hint=Fed' + #13#10 +
      'ItalicB.Hint=Kursiv' + #13#10 +
      'UnderlineB.Hint=Understreg' + #13#10 +
      'FontColorB.Hint=Skrifttypefarve' + #13#10 +
      'HighlightB.Hint=Highlight' + #13#10 +
      'RotateB.Hint=Tekstrotation' + #13#10 +
      'TextAlignLeftB.Hint=Venstrejustering' + #13#10 +
      'TextAlignCenterB.Hint=Centreret' + #13#10 +
      'TextAlignRightB.Hint=Højrejustering' + #13#10 +
      'TextAlignBlockB.Hint=Lige margener' + #13#10 +
      'TextAlignTopB.Hint=Justering øverst' + #13#10 +
      'TextAlignMiddleB.Hint=Midterjustering' + #13#10 +
      'TextAlignBottomB.Hint=Bundjustering' + #13#10 +
      'FrameTB.Caption=Ramme' + #13#10 +
      'FrameTopB.Hint=Linie øverst' + #13#10 +
      'FrameBottomB.Hint=Linie i bund' + #13#10 +
      'FrameLeftB.Hint=Venstrelinie' + #13#10 +
      'FrameRightB.Hint=Højrelinie' + #13#10 +
      'FrameAllB.Hint=Alle rammelinier' + #13#10 +
      'FrameNoB.Hint=Ingen ramme' + #13#10 +
      'ShadowB.Hint=Skygge' + #13#10 +
      'FillColorB.Hint=Baggrundsfarve' + #13#10 +
      'FrameColorB.Hint=Rammefarve' + #13#10 +
      'FrameStyleB.Hint=Rammestil' + #13#10 +
      'FrameWidthCB.Hint=Rammebredde' + #13#10 +
      'StandardTB.Caption=Standard' + #13#10 +
      'NewB.Hint=Ny raport' + #13#10 +
      'OpenB.Hint=Åbn raport' + #13#10 +
      'SaveB.Hint=Gem raport' + #13#10 +
      'PreviewB.Hint=Vis udskrift' + #13#10 +
      'NewPageB.Hint=Ny raport side' + #13#10 +
      'NewDialogB.Hint=Ny dialog side' + #13#10 +
      'DeletePageB.Hint=Slet side' + #13#10 +
      'PageSettingsB.Hint=Sideopsætning' + #13#10 +
      'VariablesB.Hint=Variable' + #13#10 +
      'CutB.Hint=Klip' + #13#10 +
      'CopyB.Hint=Kopier' + #13#10 +
      'PasteB.Hint=Sæt ind' + #13#10 +
      'SampleFormatB.Hint=Kopier formattering' + #13#10 +
      'UndoB.Hint=Fortryd' + #13#10 +
      'RedoB.Hint=Gentag' + #13#10 +
      'GroupB.Hint=Gruppering' + #13#10 +
      'UngroupB.Hint=Fjern gruppering' + #13#10 +
      'ShowGridB.Hint=Vis gitter' + #13#10 +
      'AlignToGridB.Hint=Juster til gitter' + #13#10 +
      'SetToGridB.Hint=Tilpas til gitter' + #13#10 +
      'ScaleCB.Hint=Zoom' + #13#10 +
      'ExtraToolsTB.Caption=Ekstra værktøjer' + #13#10 +
      'ObjectSelectB.Hint=Vælg værktøj' + #13#10 +
      'HandToolB.Hint=Hånd-værktøj' + #13#10 +
      'ZoomToolB.Hint=Zoom-værktøj' + #13#10 +
      'TextToolB.Hint=Editer Tekst-værktøj' + #13#10 +
      'FormatToolB.Hint=Kopier formattering-værktøj' + #13#10 +
      'ObjectBandB.Hint=Indsæt Bånd' + #13#10 +
      'FileMenu.Caption=&Fil' + #13#10 +
      'EditMenu.Caption=&Editer' + #13#10 +
      'FindMI.Caption=Find...' + #13#10 +
      'FindNextMI.Caption=Find Næste' + #13#10 +
      'ReplaceMI.Caption=Erstat...' + #13#10 +
      'ReportMenu.Caption=&Raport' + #13#10 +
      'ReportDataMI.Caption=Data...' + #13#10 +
      'ReportSettingsMI.Caption=Valgmuligheder...' + #13#10 +
      'ReportStylesMI.Caption=Stil...' + #13#10 +
      'ViewMenu.Caption=&Vis' + #13#10 +
      'ToolbarsMI.Caption=Værktøjslinier' + #13#10 +
      'StandardMI.Caption=Standard' + #13#10 +
      'TextMI.Caption=Tekst' + #13#10 +
      'FrameMI.Caption=Ramme' + #13#10 +
      'AlignmentMI.Caption=Justeringspalette' + #13#10 +
      'ToolsMI.Caption=Ekstra værktøjer' + #13#10 +
      'InspectorMI.Caption=Objekt Inspector' + #13#10 +
      'DataTreeMI.Caption=Datatræ' + #13#10 +
      'ReportTreeMI.Caption=Raporttræ' + #13#10 +
      'ShowRulersMI.Caption=Linialer' + #13#10 +
      'ShowGuidesMI.Caption=Guides' + #13#10 +
      'DeleteGuidesMI.Caption=Delete Guides' + #13#10 +
      'OptionsMI.Caption=Valgmuligheder...' + #13#10 +
      'HelpMenu.Caption=&Hjælp' + #13#10 +
      'HelpContentsMI.Caption=Indhold af hjælpen...' + #13#10 +
      'AboutMI.Caption=Om FastReport...' + #13#10 +
      'TabOrderMI.Caption=Tab Orden...' + #13#10 +
      'UndoCmd.Caption=Fortryd' + #13#10 +
      'RedoCmd.Caption=Gentag' + #13#10 +
      'CutCmd.Caption=Klip' + #13#10 +
      'CopyCmd.Caption=Kopier' + #13#10 +
      'PasteCmd.Caption=Sæt ind' + #13#10 +
      'GroupCmd.Caption=Gruppering' + #13#10 +
      'UngroupCmd.Caption=Fjern gruppering' + #13#10 +
      'DeleteCmd.Caption=Slet' + #13#10 +
      'DeletePageCmd.Caption=Slet side' + #13#10 +
      'SelectAllCmd.Caption=Vælg alle' + #13#10 +
      'EditCmd.Caption=Editer...' + #13#10 +
      'BringToFrontCmd.Caption=Sæt forrest' + #13#10 +
      'SendToBackCmd.Caption=Sæt baggerst' + #13#10 +
      'NewItemCmd.Caption=Ny...' + #13#10 +
      'NewReportCmd.Caption=Ny raport' + #13#10 +
      'NewPageCmd.Caption=Ny side' + #13#10 +
      'NewDialogCmd.Caption=Ny dialog' + #13#10 +
      'OpenCmd.Caption=Åbn...' + #13#10 +
      'SaveCmd.Caption=Gem' + #13#10 +
      'SaveAsCmd.Caption=Gem som...' + #13#10 +
      'VariablesCmd.Caption=Variable...' + #13#10 +
      'PageSettingsCmd.Caption=Sideopsætning...' + #13#10 +
      'PreviewCmd.Caption=Vis udskrift' + #13#10 +
      'ExitCmd.Caption=Afslut' + #13#10 +
      'ReportTitleMI.Caption=Raporttitel' + #13#10 +
      'ReportSummaryMI.Caption=Raportinformation' + #13#10 +
      'PageHeaderMI.Caption=Side Header' + #13#10 +
      'PageFooterMI.Caption=Side Footer' + #13#10 +
      'HeaderMI.Caption=Header' + #13#10 +
      'FooterMI.Caption=Footer' + #13#10 +
      'MasterDataMI.Caption=Master Data' + #13#10 +
      'DetailDataMI.Caption=Detail Data' + #13#10 +
      'SubdetailDataMI.Caption=Subdetail Data' + #13#10 +
      'Data4levelMI.Caption=Data 4.niveau' + #13#10 +
      'Data5levelMI.Caption=Data 5.niveau' + #13#10 +
      'Data6levelMI.Caption=Data 6.niveau' + #13#10 +
      'GroupHeaderMI.Caption=Gruppe Header' + #13#10 +
      'GroupFooterMI.Caption=Gruppe Footer' + #13#10 +
      'ChildMI.Caption=Child' + #13#10 +
      'ColumnHeaderMI.Caption=Kolonne Header' + #13#10 +
      'ColumnFooterMI.Caption=Kolonne Footer' + #13#10 +
      'OverlayMI.Caption=Overlay' + #13#10 +
      'VerticalbandsMI.Caption=Vertikale bånd' + #13#10 +
      'HeaderMI1.Caption=Header' + #13#10 +
      'FooterMI1.Caption=Footer' + #13#10 +
      'MasterDataMI1.Caption=Master Data' + #13#10 +
      'DetailDataMI1.Caption=Detail Data' + #13#10 +
      'SubdetailDataMI1.Caption=Subdetail Data' + #13#10 +
      'GroupHeaderMI1.Caption=Gruppe Header' + #13#10 +
      'GroupFooterMI1.Caption=Gruppe Footer' + #13#10 +
      'ChildMI1.Caption=Child' + #13#10 +
      'R0MI.Caption=0°' + #13#10 +
      'R45MI.Caption=45°' + #13#10 +
      'R90MI.Caption=90°' + #13#10 +
      'R180MI.Caption=180°' + #13#10 +
      'R270MI.Caption=270°' + #13#10 +
      'FontB.Hint=Skrifttypeopsætning' + #13#10 +
      'BoldMI.Caption=Fed' + #13#10 +
      'ItalicMI.Caption=Kursiv' + #13#10 +
      'UnderlineMI.Caption=Understreg' + #13#10 +
      'SuperScriptMI.Caption=Hævet skrift' + #13#10 +
      'SubScriptMI.Caption=Sænket skrift' + #13#10 +
      'CondensedMI.Caption=Sammenpresset' + #13#10 +
      'WideMI.Caption=Bred' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'OpenDialog.Filter=Raport (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=Pascal filer (*.pas)|*.pas|C++ filer (*.cpp)|*.cpp|JavaSkript filer (*.js)|*.js|Basic filer (*.vb)|*.vb|Alle filer|*.*' + #13#10 +
      'SaveScriptDialog.Filter=Pascal filer (*.pas)|*.pas|C++ filer (*.cpp)|*.cpp|JavaSkript filer (*.js)|*.js|Basic filer (*.vb)|*.vb|Alle filer|*.*' + #13#10 +
      '');
    Add('dsCm', 'Centimeter');
    Add('dsInch', 'Tommer');
    Add('dsPix', 'Pixels');
    Add('dsChars', 'Karakterer');
    Add('dsCode', 'Kode');
    Add('dsPage', 'Side');
    Add('dsRepFilter', 'Raport (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'Komprimeret raport (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', 'Gem ændringer i vis udskrift?');
    Add('dsSaveChangesTo', 'Gem ændringer til ');
    Add('dsCantLoad', 'Kunne ikke hente filen');
    Add('dsStyleFile', 'Stil');
    Add('dsCantFindProc', 'Kunne ikke finde main proc');
    Add('dsClearScript', 'Dette vil fjerne alt kode. Ønsker du at fortsætte?');
    Add('dsNoStyle', 'Ingen stil');
    Add('dsStyleSample', 'Prøve på stil');
    Add('dsTextNotFound', 'Teksten ''%s'' blev ikke fundet');
    Add('dsReplace', 'Erstat denne forkomst af ''%s''?');

    Add('TfrxAboutForm',
      'Caption=Om FastReport' + #13#10 +
      'Label4.Caption=Besøg vores webside for mere info:' + #13#10 +
      'Label6.Caption=Salg:' + #13#10 +
      'Label8.Caption=Support:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Sideopsætning' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      'TabSheet1.Caption=Papir' + #13#10 +
      'Label1.Caption=Bredde' + #13#10 +
      'Label2.Caption=Højde' + #13#10 +
      'Label11.Caption=Størrelse   ' + #13#10 +
      'Label12.Caption=Retning   ' + #13#10 +
      'Label3.Caption=Venstre' + #13#10 +
      'Label4.Caption=Øverst' + #13#10 +
      'Label5.Caption=Højre' + #13#10 +
      'Label6.Caption=Bund' + #13#10 +
      'Label13.Caption=Margener   ' + #13#10 +
      'Label14.Caption=Papirkilde   ' + #13#10 +
      'Label9.Caption=Første side' + #13#10 +
      'Label10.Caption=Andre sider' + #13#10 +
      'PortraitRB.Caption=Stående' + #13#10 +
      'LandscapeRB.Caption=Liggende' + #13#10 +
      'TabSheet3.Caption=Andre valgmuligheder' + #13#10 +
      'Label7.Caption=Kolonner   ' + #13#10 +
      'Label8.Caption=Nummer' + #13#10 +
      'Label15.Caption=Bredde' + #13#10 +
      'Label16.Caption=Positioner' + #13#10 +
      'Label17.Caption=Andre   ' + #13#10 +
      'Label18.Caption=Duplex' + #13#10 +
      'PrintOnPrevCB.Caption=Udskriv til forgående side' + #13#10 +
      'MirrorMarginsCB.Caption=Spejl margener' + #13#10 +
      'LargeHeightCB.Caption=Stor højde i designmodus' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Vælg raportens datasæt' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Editer Variable' + #13#10 +
      'NewCategoryB.Caption=Kategori' + #13#10 +
      'NewVarB.Caption=Variable' + #13#10 +
      'EditB.Caption=Editer' + #13#10 +
      'DeleteB.Caption=Slet' + #13#10 +
      'EditListB.Caption=List' + #13#10 +
      'LoadB.Caption=Hent' + #13#10 +
      'SaveB.Caption=Gem' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'ExprPanel.Caption= Udtryk:' + #13#10 +
      'OpenDialog1.Filter=Ordbog (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Ordbog (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(Ingen variable defineret)');
    Add('vaVar', 'Variable');
    Add('vaDupName', 'Gentag navn');

    Add('TfrxOptionsEditor',
      'Caption=Designeropsætning' + #13#10 +
      'Label1.Caption=Gitter   ' + #13#10 +
      'Label2.Caption=Type' + #13#10 +
      'Label3.Caption=Størrelse' + #13#10 +
      'Label4.Caption=Dialog form:' + #13#10 +
      'Label5.Caption=Andre   ' + #13#10 +
      'Label6.Caption=Skrifttype' + #13#10 +
      'Label7.Caption=Kode-vindue' + #13#10 +
      'Label8.Caption=Memo editor' + #13#10 +
      'Label9.Caption=Størrelse' + #13#10 +
      'Label10.Caption=Størrelse' + #13#10 +
      'Label11.Caption=Farver   ' + #13#10 +
      'Label12.Caption=Mellemrum mellem bånd:' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=in' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      'CMRB.Caption=Centimeter:' + #13#10 +
      'InchesRB.Caption=Tommer:' + #13#10 +
      'PixelsRB.Caption=Pixels:' + #13#10 +
      'ShowGridCB.Caption=Vis gitter' + #13#10 +
      'AlignGridCB.Caption=Juster til gitter' + #13#10 +
      'EditAfterInsCB.Caption=Vis editor efter indsæt' + #13#10 +
      'ObjectFontCB.Caption=Brug objektets skrifttypeopsætning' + #13#10 +
      'WorkspaceB.Caption=Workspace' + #13#10 +
      'ToolB.Caption=Værktøjsvindue' + #13#10 +
      'LCDCB.Caption=LCD gitterfarve' + #13#10 +
      'FreeBandsCB.Caption=Frigør bånds placering' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Gendan standarder' + #13#10 +
      'BandsCaptionsCB.Caption=Vis bånd captions' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=Vælg Datasæt' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      '');
    Add('dbNotAssigned', '[ikke tilknyttet]');
    Add('dbSingleLine', 'Enkelt række');

    Add('TfrxGroupEditorForm',
      'Caption=Gruppe' + #13#10 +
      'BreakOnL.Caption=Break on   ' + #13#10 +
      'OptionsL.Caption=Valgmuligheder   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      'DataFieldRB.Caption=Datafelt' + #13#10 +
      'ExpressionRB.Caption=Udtryk' + #13#10 +
      'KeepGroupTogetherCB.Caption=Hold gruppen sammen' + #13#10 +
      'StartNewPageCB.Caption=Start ny side' + #13#10 +
      'OutlineCB.Caption=Vis i omrids' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=System Memo' + #13#10 +
      'DataBandL.Caption=Data bånd' + #13#10 +
      'DataSetL.Caption=DataSet' + #13#10 +
      'DataFieldL.Caption=DataFelt' + #13#10 +
      'FunctionL.Caption=Funktion' + #13#10 +
      'ExpressionL.Caption=Udtryk' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      'AggregateRB.Caption=Aggregatværdi' + #13#10 +
      'SysVariableRB.Caption=Systemvariabel' + #13#10 +
      'CountInvisibleCB.Caption=Tæl usynlige bånd' + #13#10 +
      'TextRB.Caption=Tekst' + #13#10 +
      'RunningTotalCB.Caption=Running total' + #13#10 +
      '');
    Add('agAggregate', 'Indsæt Aggregat');
    Add('vt1', '[DATE]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGES#]');
    Add('vt5', '[PAGE#] of [TOTALPAGES#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=OLE Objekt' + #13#10 +
      'InsertB.Caption=Indsæt...' + #13#10 +
      'EditB.Caption=Editer...' + #13#10 +
      'CloseB.Caption=Luk' + #13#10 +
      '');
    Add('olStretched', 'Udstrukket');

    Add('TfrxBarcodeEditorForm',
      'Caption=Barkode Editor' + #13#10 +
      'CodeLbl.Caption=Kode' + #13#10 +
      'TypeLbl.Caption=Bar-type' + #13#10 +
      'ZoomLbl.Caption=Zoom:' + #13#10 +
      'OptionsLbl.Caption=Valgmulighed   ' + #13#10 +
      'RotationLbl.Caption=Rotation   ' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CalcCheckSumCB.Caption=Calc Checksum ' + #13#10 +
      'ViewTextCB.Caption=Tekst' + #13#10 +
      'Rotation0RB.Caption=0°' + #13#10 +
      'Rotation90RB.Caption=90°' + #13#10 +
      'Rotation180RB.Caption=180°' + #13#10 +
      'Rotation270RB.Caption=270°' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Calc CheckSum');
    Add('bcShowText', 'Vis tekst');

    Add('TfrxAliasesEditorForm',
      'Caption=Editer Aliaser' + #13#10 +
      'HintL.Caption=Tryk Enter for at redigere element' + #13#10 +
      'DSAliasL.Caption=Dataset alias' + #13#10 +
      'FieldAliasesL.Caption=Feltaliaser' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      'ResetB.Caption=Reset' + #13#10 +
      'UpdateB.Caption=Update' + #13#10 +
      '');
    Add('alUserName', 'Brugernavn');
    Add('alOriginal', 'Originalt navn');

    Add('TfrxParamsEditorForm',
      'Caption=Parameter Editor' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      '');
    Add('qpName', 'Navn');
    Add('qpDataType', 'Data Type');
    Add('qpValue', 'Værdi');

    Add('TfrxMDEditorForm',
      'Caption=Master-Detail Link' + #13#10 +
      'Label1.Caption=Detail felter' + #13#10 +
      'Label2.Caption=Master felter' + #13#10 +
      'Label3.Caption=Sammensatte felter' + #13#10 +
      'AddB.Caption=Tilføj' + #13#10 +
      'ClearB.Caption=Rens' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=Memo' + #13#10 +
      'ExprB.Hint=Indsæt udtryk' + #13#10 +
      'AggregateB.Hint=Indsæt aggregat' + #13#10 +
      'LocalFormatB.Hint=Indsæt formattering' + #13#10 +
      'WordWrapB.Hint=Tekstombrydning' + #13#10 +
      'CancelB.Hint=Fortryd' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=Billede' + #13#10 +
      'LoadB.Hint=Hent' + #13#10 +
      'CopyB.Hint=Kopier' + #13#10 +
      'PasteB.Hint=Overfør' + #13#10 +
      'ClearB.Hint=Rens' + #13#10 +
      'CancelB.Hint=Fortryd' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('piEmpty', 'Tomt');

    Add('TfrxChartEditorForm',
      'Caption=Diagrameditor' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=Tilføj serie' + #13#10 +
      'DeleteB.Hint=Slet serie' + #13#10 +
      'DBSourceRB.Caption=Data fra DB' + #13#10 +
      'BandSourceRB.Caption=Båndkilde' + #13#10 +
      'FixedDataRB.Caption=Fast data' + #13#10 +
      'DatasetLbl.Caption=Datasæt' + #13#10 +
      'BandLbl.Caption=Databånd' + #13#10 +
      'X1Lbl.Caption=X værdier' + #13#10 +
      'Y1Lbl.Caption=Y værdier' + #13#10 +
      'X2Lbl.Caption=X værdier' + #13#10 +
      'Y2Lbl.Caption=Y værdier' + #13#10 +
      'X3Lbl.Caption=X værdier (for eksampel, a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Y værdier (for eksampel, 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Andre valgmuligheder   ' + #13#10 +
      'ShowTopLbl.Caption=ØverstN værdier' + #13#10 +
      'CaptionLbl.Caption=ØverstN caption' + #13#10 +
      'SortLbl.Caption=Sorteringsorden' + #13#10 +
      'LineMI.Caption=Linie' + #13#10 +
      'AreaMI.Caption=Areal' + #13#10 +
      'PointMI.Caption=Punkt' + #13#10 +
      'BarMI.Caption=Søjle' + #13#10 +
      'HorizBarMI.Caption=Horis. søjle' + #13#10 +
      'PieMI.Caption=Cirkel' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Fast Linie' + #13#10 +
      '');
    Add('ch3D', '3D visning');
    Add('chAxis', 'Viser Akser');
    Add('chsoNone', 'Ingen');
    Add('chsoAscending', 'Stigende');
    Add('chsoDescending', 'Faldende');

    Add('TfrxRichEditorForm',
      'Caption=Rich Editor' + #13#10 +
      'OpenB.Hint=Åbn Fil' + #13#10 +
      'SaveB.Hint=Gem Fil' + #13#10 +
      'UndoB.Hint=Fortryd' + #13#10 +
      'TTB.Hint=Skrifttype' + #13#10 +
      'ExprB.Hint=Indsæt udtryk' + #13#10 +
      'CancelB.Hint=Fortryd' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      'BoldB.Hint=Fed' + #13#10 +
      'ItalicB.Hint=Kursiv' + #13#10 +
      'UnderlineB.Hint=Understreg' + #13#10 +
      'LeftAlignB.Hint=Juster til venstre' + #13#10 +
      'CenterAlignB.Hint=Centreret' + #13#10 +
      'RightAlignB.Hint=Juster til højre' + #13#10 +
      'BlockAlignB.Hint=Lige margener' + #13#10 +
      'BulletsB.Hint=Opstilling' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Kryds-tab Editor' + #13#10 +
      'DatasetL.Caption=Kildedata   ' + #13#10 +
      'DimensionsL.Caption=Dimensioner   ' + #13#10 +
      'RowsL.Caption=Rækker' + #13#10 +
      'ColumnsL.Caption=Kolonner' + #13#10 +
      'CellsL.Caption=Celler' + #13#10 +
      'StructureL.Caption=Kryds-tab struktur   ' + #13#10 +
      'RowHeaderCB.Caption=Række-hoved' + #13#10 +
      'ColumnHeaderCB.Caption=Kolonne-hoved' + #13#10 +
      'RowTotalCB.Caption=Række grand total' + #13#10 +
      'ColumnTotalCB.Caption=Kolonne grand total' + #13#10 +
      'SwapB.Hint=Byt række/kolonne' + #13#10 +
      'StyleCB.Hint=Kryds-tab stil' + #13#10 +
      'FontB.Hint=Skrifttypeopsætning' + #13#10 +
      'AlignLeftB.Hint=Venstrejustering' + #13#10 +
      'AlignCenterB.Hint=Centreret' + #13#10 +
      'AlignRightB.Hint=Højrejustering' + #13#10 +
      'RotationB.Hint=Tekstrotation' + #13#10 +
      'HighlightB.Hint=Highlight' + #13#10 +
      'FormatB.Hint=Format' + #13#10 +
      'FrameB.Hint=Rammeopsætning' + #13#10 +
      'FillColorB.Hint=Udfyldningsfarve' + #13#10 +
      'Func1MI.Caption=Ingen' + #13#10 +
      'Func2MI.Caption=Sum' + #13#10 +
      'Func3MI.Caption=Min' + #13#10 +
      'Func4MI.Caption=Maks' + #13#10 +
      'Func5MI.Caption=Gennemsnit' + #13#10 +
      'Func6MI.Caption=Antal' + #13#10 +
      'Sort1MI.Caption=Stigende (A-Z)' + #13#10 +
      'Sort2MI.Caption=Faldende (Z-A)' + #13#10 +
      'Sort3MI.Caption=Ingen Sortering' + #13#10 +
      'BoldMI.Caption=Fed' + #13#10 +
      'ItalicMI.Caption=Kursiv' + #13#10 +
      'UnderlineMI.Caption=Understreg' + #13#10 +
      'SuperScriptMI.Caption=Hævet' + #13#10 +
      'SubScriptMI.Caption=Sænket' + #13#10 +
      'CondensedMI.Caption=Sammenpresset' + #13#10 +
      'WideMI.Caption=Bred' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=Fortryd' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('crSubtotal', 'Subtotal');
    Add('crNone', 'None');
    Add('crSum', 'Sum');
    Add('crMin', 'Min');
    Add('crMax', 'Maks');
    Add('crAvg', 'Avg');
    Add('crCount', 'Antal');
    Add('crAsc', 'A-Å');
    Add('crDesc', 'Å-A');
    Add('crRepHdrs', 'Genudskriv Headers');
    Add('crBorder', 'Kant');
    Add('crDown', 'Ned og så på tværs');

    Add('TfrxExprEditorForm',
      'Caption=Udtrykseditor' + #13#10 +
      'ExprL.Caption=Udtryk:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=Display Format' + #13#10 +
      'CategoryL.Caption=Kategori' + #13#10 +
      'FormatL.Caption=Format' + #13#10 +
      'FormatStrL.Caption=Formateringsstreng:' + #13#10 +
      'SeparatorL.Caption=Decimalseparator:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      '');
    Add('fkText', 'Tekst (ingen formattering)');
    Add('fkNumber', 'Tal');
    Add('fkDateTime', 'Dato/Tid');
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
    Add('fkBoolean2', 'Nej,Ja;Nej,Ja');
    Add('fkBoolean3', '_,x;_,x');
    Add('fkBoolean4', 'Falsk,Sand;Falsk,Sand');

    Add('TfrxHighlightEditorForm',
      'Caption=Highlight' + #13#10 +
      'FontColorB.Caption=Farve...' + #13#10 +
      'BackColorB.Caption=Farve...' + #13#10 +
      'ConditionL.Caption=Betingelse   ' + #13#10 +
      'FontL.Caption=Skrifttype   ' + #13#10 +
      'BackgroundL.Caption=Baggrund   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      'BoldCB.Caption=Fed' + #13#10 +
      'ItalicCB.Caption=Kursiv' + #13#10 +
      'UnderlineCB.Caption=Understreg' + #13#10 +
      'TransparentRB.Caption=Transparent' + #13#10 +
      'OtherRB.Caption=Andet' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Raportopsætning' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      'GeneralTS.Caption=Generelt' + #13#10 +
      'ReportSettingsL.Caption=Printeropsætning   ' + #13#10 +
      'CopiesL.Caption=Kopier' + #13#10 +
      'GeneralL.Caption=Generelt   ' + #13#10 +
      'PasswordL.Caption=Password' + #13#10 +
      'CollateCB.Caption=Sætvis' + #13#10 +
      'DoublePassCB.Caption=Dobeltgennemløb' + #13#10 +
      'PrintIfEmptyCB.Caption=Udskriv hvis tom' + #13#10 +
      'DescriptionTS.Caption=Beskrivelse' + #13#10 +
      'NameL.Caption=Navn' + #13#10 +
      'Description1L.Caption=Beskrivelse' + #13#10 +
      'PictureL.Caption=Billede' + #13#10 +
      'AuthorL.Caption=Forfatter' + #13#10 +
      'MajorL.Caption=Stor' + #13#10 +
      'MinorL.Caption=Lille' + #13#10 +
      'ReleaseL.Caption=Release' + #13#10 +
      'BuildL.Caption=Build' + #13#10 +
      'CreatedL.Caption=Lavet' + #13#10 +
      'ModifiedL.Caption=Ændret' + #13#10 +
      'DescriptionL.Caption=Beskrivelse   ' + #13#10 +
      'VersionL.Caption=Version   ' + #13#10 +
      'PictureB.Caption=Gennemse...' + #13#10 +
      '');
    Add('rePrnOnPort', 'på');

    Add('TfrxStringsEditorForm',
      'Caption=Linier' + #13#10 +
      'CancelB.Hint=Fortryd' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=Fortryd' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=Password' + #13#10 +
      'PasswordL.Caption=Angiv password:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=Stil-editor' + #13#10 +
      'ColorB.Caption=Farve...' + #13#10 +
      'FontB.Caption=Skrifttype...' + #13#10 +
      'FrameB.Caption=Ramme...' + #13#10 +
      'AddB.Hint=Tilføj' + #13#10 +
      'DeleteB.Hint=Slet' + #13#10 +
      'EditB.Hint=Editer' + #13#10 +
      'LoadB.Hint=Hent' + #13#10 +
      'SaveB.Hint=Gem' + #13#10 +
      'CancelB.Hint=Fortryd' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=Rammeeditor' + #13#10 +
      'FrameL.Caption=Ramme' + #13#10 +
      'LineL.Caption=Rammelinie' + #13#10 +
      'ShadowL.Caption=Skygge' + #13#10 +
      'FrameTopB.Hint=Linie øverst' + #13#10 +
      'FrameBottomB.Hint=Linie i bund' + #13#10 +
      'FrameLeftB.Hint=Venstre-linie' + #13#10 +
      'FrameRightB.Hint=Højre-linie' + #13#10 +
      'FrameAllB.Hint=Alle ramme-linier' + #13#10 +
      'FrameNoB.Hint=Ingen ramme' + #13#10 +
      'FrameColorB.Hint=Ramme-farve' + #13#10 +
      'FrameStyleB.Hint=Ramme-stil' + #13#10 +
      'FrameWidthCB.Hint=Ramme bredde' + #13#10 +
      'ShadowB.Hint=Skygge' + #13#10 +
      'ShadowColorB.Hint=Skyggefarve' + #13#10 +
      'ShadowWidthCB.Hint=Skyggebredde' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=Nyt element' + #13#10 +
      'ItemsTab.Caption=Elementer' + #13#10 +
      'TemplatesTab.Caption=Skabeloner' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Tab Orden' + #13#10 +
      'Label1.Caption=Kontroller listet i tab-orden:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      'UpB.Caption=Flyt op' + #13#10 +
      'DownB.Caption=Flyt ned' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Evaluer' + #13#10 +
      'Label1.Caption=Udtryk' + #13#10 +
      'Label2.Caption=Resultat' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Raportguide' + #13#10 +
      'DataTab.Caption=Data' + #13#10 +
      'GroupsTab.Caption=Grupper' + #13#10 +
      'LayoutTab.Caption=Layout' + #13#10 +
      'StyleTab.Caption=Stil' + #13#10 +
      'Step1L.Caption=Step 1. Vælg datasæt og felter til visning.' + #13#10 +
      'Step2L.Caption=Step 2. Lav grupper (valgfrit).' + #13#10 +
      'Step3L.Caption=Step 3. Definer sideretning og datalayout.' + #13#10 +
      'Step4L.Caption=Step 4. Vælg raport stil.' + #13#10 +
      'AddFieldB.Caption=Tilføj >' + #13#10 +
      'AddAllFieldsB.Caption=Tilføj alle >>' + #13#10 +
      'RemoveFieldB.Caption=< Fjern' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Fjern alle' + #13#10 +
      'AddGroupB.Caption=Tilføj >' + #13#10 +
      'RemoveGroupB.Caption=< Fjern' + #13#10 +
      'SelectedFieldsL.Caption=Valgte felter:' + #13#10 +
      'AvailableFieldsL.Caption=Tilgængelige felter:' + #13#10 +
      'GroupsL.Caption=Grupper:' + #13#10 +
      'OrientationL.Caption=Retning   ' + #13#10 +
      'LayoutL.Caption=Layout   ' + #13#10 +
      'PortraitRB.Caption=Stående' + #13#10 +
      'LandscapeRB.Caption=Liggende' + #13#10 +
      'TabularRB.Caption=Tabular' + #13#10 +
      'ColumnarRB.Caption=Kolonnevis' + #13#10 +
      'FitWidthCB.Caption=Tilpas felter til sidebredden' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      'BackB.Caption=<< Tilbage' + #13#10 +
      'NextB.Caption=Næste >>' + #13#10 +
      'FinishB.Caption=Afslut' + #13#10 +
      '');
    Add('wzStd', 'Standard raportguide');
    Add('wzDMP', 'Dot-Matrix raportguide');
    Add('wzStdEmpty', 'Standard raport');
    Add('wzDMPEmpty', 'Dot-Matrix raport');


    Add('ftAllFiles', 'Alle Filer');
    Add('ftPictures', 'Billeder');
    Add('ftDB', 'Databaser');
    Add('ftRichFile', 'RichText fil');
    Add('ftTextFile', 'Tekst fil');

    Add('prNotAssigned', '(Ikke tilknyttet)');
    Add('prInvProp', 'Ugyldig property værdi');
    Add('prDupl', 'Dupliker navn');
    Add('prPict', '(Billede)');

    Add('mvExpr', 'Tillad udtryk');
    Add('mvStretch', 'Udstræk');
    Add('mvStretchToMax', 'Træk ud til maksimal højde');
    Add('mvShift', 'Byt');
    Add('mvShiftOver', 'Byt ved overlap');
    Add('mvVisible', 'Synlig');
    Add('mvPrintable', 'Udskriftsbar');
    Add('mvFont', 'Skrifttype...');
    Add('mvFormat', 'Vis format...');
    Add('mvClear', 'Rens indhold');
    Add('mvAutoWidth', 'Auto bredde');
    Add('mvWWrap', 'Word Wrap');
    Add('mvSuppress', 'Undertryk gentagne værdier');
    Add('mvHideZ', 'Skjul nuller');
    Add('mvHTML', 'Tillad HTML Tags');
    Add('lvDiagonal', 'Diagonal');
    Add('pvAutoSize', 'Auto størrelse');
    Add('pvCenter', 'Centreret');
    Add('pvAspect', 'Lås højde-bredde-forhold');
    Add('bvSplit', 'Tillad deling');
    Add('bvKeepChild', 'Hold Child sammen');
    Add('bvPrintChild', 'Udskriv Child hvis usynlig');
    Add('bvStartPage', 'Start ny side');
    Add('bvPrintIfEmpty', 'Udskriv hvis Detail er tom');
    Add('bvKeepDetail', 'Hold Detail sammen');
    Add('bvKeepFooter', 'Hold Footer sammen');
    Add('bvReprint', 'Genudskriv på ny side');
    Add('bvOnFirst', 'Udskriv på første side');
    Add('bvOnLast', 'Udskriv på sidste side');
    Add('bvKeepGroup', 'Hold sammen');
    Add('bvFooterAfterEach', 'Footer efter hver række');
    Add('srParent', 'Udskriv på Parent');
    Add('bvKeepHeader', 'Hold Header sammen');

    Add('obCatDraw', 'Tegn');
    Add('obCatOther', 'Andre objekter');
    Add('obCatOtherControls', 'Andre kontroller');
    Add('obDiagLine', 'Diagonallinie');
    Add('obRect', 'Rektangel');
    Add('obRoundRect', 'Afrundet rektangel');
    Add('obEllipse', 'Ellipse');
    Add('obTrian', 'Trekant');
    Add('obDiamond', 'Diamant');
    Add('obLabel', 'Label-kontrol');
    Add('obEdit', 'Edit-kontrol');
    Add('obMemoC', 'Memo-kontrol');
    Add('obButton', 'Button-kontrol');
    Add('obChBoxC', 'CheckBox-kontrol');
    Add('obRButton', 'RadioButton-kontrol');
    Add('obLBox', 'ListBox-kontrol');
    Add('obCBox', 'ComboBox-kontrol');
    Add('obDateEdit', 'DateEdit-kontrol');
    Add('obImageC', 'Billede-kontrol');
    Add('obPanel', 'Panel-kontrol');
    Add('obGrBox', 'GroupBox-kontrol');
    Add('obBBtn', 'BitBtn-kontrol');
    Add('obSBtn', 'SpeedButton-kontrol');
    Add('obMEdit', 'MaskEdit-kontrol');
    Add('obChLB', 'CheckListBox-kontrol');
    Add('obDBLookup', 'DBLookupComboBox-kontrol');
    Add('obBevel', 'Bevel-objekt');
    Add('obShape', 'Shape-objekt');
    Add('obText', 'Tekst-objekt');
    Add('obSysText', 'System tekst');
    Add('obLine', 'Linie-objekt');
    Add('obPicture', 'Billede-objekt');
    Add('obBand', 'Bånd-objekt');
    Add('obDataBand', 'Databånd');
    Add('obSubRep', 'Underraport-objekt');
    Add('obDlgPage', 'Dialog form');
    Add('obRepPage', 'Raportside');
    Add('obReport', 'Raport-objekt');
    Add('obRich', 'RichTekst-objekt');
    Add('obOLE', 'OLE-objekt');
    Add('obChBox', 'CheckBox-objekt');
    Add('obChart', 'Diagram-objekt');
    Add('obBarC', 'Stregkode-objekt');
    Add('obCross', 'Kryds-tab-objekt');
    Add('obDBCross', 'DB Kryds-tab-objekt');
    Add('obGrad', 'Gradient-objekt');
    Add('obDMPText', 'Dot-matrix tekstobjekt');
    Add('obDMPLine', 'Dot-matrix linieobjekt');
    Add('obBDEDB', 'BDE database');
    Add('obBDETb', 'BDE tabel');
    Add('obBDEQ', 'BDE forspørgsel');
    Add('obBDEComps', 'BDE komponenter');
    Add('obIBXDB', 'IBX database');
    Add('obIBXTb', 'IBX tabel');
    Add('obIBXQ', 'IBX forspørgsel');
    Add('obIBXComps', 'IBX komponenter');
    Add('obADODB', 'ADO database');
    Add('obADOTb', 'ADO tabel');
    Add('obADOQ', 'ADO forspørgsel');
    Add('obADOComps', 'ADO komponenter');
    Add('obDBXDB', 'DBX database');
    Add('obDBXTb', 'DBX tabel');
    Add('obDBXQ', 'DBX forspørgsel');
    Add('obDBXComps', 'DBX komponenter');

    Add('ctString', 'Strenge');
    Add('ctDate', 'Dato og Tid');
    Add('ctConv', 'Konverteringer');
    Add('ctFormat', 'Formatering');
    Add('ctMath', 'Matematiske');
    Add('ctOther', 'Andre');

    Add('IntToStr', 'Konverter en integer værdi til en streng');
    Add('FloatToStr', 'Konverter en float værdi til en streng');
    Add('DateToStr', 'Konverter en dato til en streng');
    Add('TimeToStr', 'Konverter en tid til en streng');
    Add('DateTimeToStr', 'Konverter en dato-og-tid værdi til en streng');
    Add('VarToStr', 'Konverter en variant værdi til en streng');
    Add('StrToInt', 'Konverter en streng til en integer værdi');
    Add('StrToFloat', 'Konverter en streng til en floating-point værdi');
    Add('StrToDate', 'Konverter en streng til et dato format');
    Add('StrToTime', 'Konverter en streng til et tids format');
    Add('StrToDateTime', 'Konverter en streng til et dato-og-tids format');
    Add('Format', 'Returnerer en formatteret streng sammensat fra en serie af array argumenter');
    Add('FormatFloat', 'Formaterer en floating-point værdi');
    Add('FormatDateTime', 'Formaterer en dato-og-tid værdi');
    Add('FormatMaskText', 'Returnerer en streng formateret ved brug af en edit maske');
    Add('EncodeDate', 'Returnerer en TDateTime type for et specificeret år, måned, og dag');
    Add('DecodeDate', 'Deler TDateTime ind i år, måned, og dag værdier');
    Add('EncodeTime', 'Returnerer en TDateTime type for et specificeret time, min, sec, og msec');
    Add('DecodeTime', 'Deler TDateTime ind i time, minutter, sekunder, og millisekunder');
    Add('Date', 'Returner aktuel dato');
    Add('Time', 'Returner aktuel tid');
    Add('Now', 'Returner aktuel dato og tid');
    Add('DayOfWeek', 'Returnerer dagen i ugen for den specificeret dato');
    Add('IsLeapYear', 'Indikerer om et specificeret år er et skudår');
    Add('DaysInMonth', 'Returnerer antallet af dage i en specificeret måned');
    Add('Length', 'Returnerer længden af en streng');
    Add('Copy', 'Returnerer en substreng fra en streng');
    Add('Pos', 'Returnerer positionen for en substreng in en streng');
    Add('Delete', 'Fjerner en substreng fra en streng');
    Add('Insert', 'Indsætter en substring ind i en streng');
    Add('Uppercase', 'Konverter alle karakterer i en string til store bogstaver');
    Add('Lowercase', 'Konverter alle karakterer i en string til små bogstaver');
    Add('Trim', 'Fjerner alle afsluttende og begyndende mellemrum i en streng');
    Add('NameCase', 'Konverter første karakter i et ord til stort bogstav');
    Add('CompareText', 'Sammenligner to strenge');
    Add('Chr', 'Konverter en integer-værdi til en char');
    Add('Ord', 'Konverter en karakterværdi til en integer');
    Add('SetLength', 'Sætter længden af en streng');
    Add('Round', 'Afrunder en floating-point værdi til det nærmeste hele tal');
    Add('Trunc', 'Trunkere en floating-point værdi til en integer');
    Add('Int', 'Returnerer heltals-delen af et reelt tal');
    Add('Frac', 'Returnerer decimaltals-delen af et reelt tal');
    Add('Sqrt', 'Returnerer kvadratrodsværdien af et angivet tal');
    Add('Abs', 'Returnerer en absolut værdi');
    Add('Sin', 'Returnerer sinusværdien af en vinkel (i radians)');
    Add('Cos', 'Returnerer cosinusværdien af en vinkel (i radians)');
    Add('ArcTan', 'Returnerer arctangent-værdien');
    Add('Tan', 'Returnerer tangent-værdien');
    Add('Exp', 'Returnerer exponential-værdien');
    Add('Ln', 'Returnerer den naturlige log for et real udtryk');
    Add('Pi', 'Returnerer et 3.1415926...-tal');
    Add('Inc', 'Forøger en værdi');
    Add('Dec', 'Formindsker en værdi');
    Add('RaiseException', 'Rejser en undtagelse');
    Add('ShowMessage', 'Viser en beskedboks');
    Add('Randomize', 'Starter en tilfældighedstalgenerator');
    Add('Random', 'Returnerer et tilfædigt tal');
    Add('ValidInt', 'Returnerer sand, hvis den angivne streng indeholder en gyldig integer');
    Add('ValidFloat', 'Returnerer sand, hvis den angivne streng indeholder en gyldig float');
    Add('ValidDate', 'Returnerer sand, hvis den angivne streng indeholder en gyldig date');
    Add('IIF', 'Returnerer SandVærdi hvis den angivne Expr er sand, eller returneres FalskVærdi');
    Add('Get', 'Udelukkende for internt brug');
    Add('Set', 'Udelukkende for internt brug');
    Add('InputBox', 'Viser en indput-dialogboks, der tillader brugeren at angive en streng');
    Add('InputQuery', 'Viser en indput-dialogboks, der tillader brugeren at angive en streng');
    Add('MessageDlg', 'Viser en beskedboks');
    Add('CreateOleObject', 'Laver et OLE objekt');
    Add('VarArrayCreate', 'Laver et variant array');
    Add('VarType', 'Returnerer typen af variant værdien');
    Add('DayOf', 'Returnerer dagsnummeret (1..31) for en given dato');
    Add('MonthOf', 'Returnerer månedsnummeret(1..12) for en given dato');
    Add('YearOf', 'Returnerer årstallet for en given dato');

  end;
end;


initialization
  frAddDesignerRes;

end.