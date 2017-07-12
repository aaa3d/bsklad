
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
      'Caption=Objektinspekterare' + #13#10 +
      '');
    Add('oiProp', 'Egenskaper');
    Add('oiEvent', 'Händelser');

    Add('TfrxDataTreeForm',
      'Caption=Data Träd' + #13#10 +
      'DataTS.Caption=Data' + #13#10 +
      'VariablesTS.Caption=Variabler' + #13#10 +
      'FunctionsTS.Caption=Funktioner' + #13#10 +
      'InsFieldCB.Caption=Skapa fält' + #13#10 +
      'InsCaptionCB.Caption=Skapa Rubrik' + #13#10 +
      '');
    Add('dtNoData', 'Inget data tillgängligt');
    Add('dtData', 'Data');
    Add('dtSysVar', 'Systemvariabler');
    Add('dtVar', 'Variabler');
    Add('dtFunc', 'Funktioner');

    Add('TfrxReportTreeForm',
      'Caption=Rapport Träd' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Öppna Scriptfil' + #13#10 +
      'SaveScriptB.Hint=Spara Script till Fil' + #13#10 +
      'RunScriptB.Hint=Kör Script' + #13#10 +
      'StepScriptB.Hint=Spåra in i' + #13#10 +
      'StopScriptB.Hint=Avsluta Script' + #13#10 +
      'EvaluateB.Hint=Utvärdera' + #13#10 +
      'LangL.Caption=Språk:' + #13#10 +
      'AlignTB.Caption=Justera' + #13#10 +
      'AlignLeftsB.Hint=Vänsterjustering' + #13#10 +
      'AlignHorzCentersB.Hint=Centrera' + #13#10 +
      'AlignRightsB.Hint=Högerjustering' + #13#10 +
      'AlignTopsB.Hint=Topjustering' + #13#10 +
      'AlignVertCentersB.Hint=Justera mot mitt' + #13#10 +
      'AlignBottomsB.Hint=Justera mot botten' + #13#10 +
      'SpaceHorzB.Hint=Jämt mellanrum Horisontellt' + #13#10 +
      'SpaceVertB.Hint=Jämnt mellanrum vertikalt' + #13#10 +
      'CenterHorzB.Hint=Centrera Horisontellt i Band' + #13#10 +
      'CenterVertB.Hint=Centrera Vertikalt i Band' + #13#10 +
      'SameWidthB.Hint=Samma bredd' + #13#10 +
      'SameHeightB.Hint=Samma Höjd' + #13#10 +
      'TextTB.Caption=Text' + #13#10 +
      'StyleCB.Hint=Stil' + #13#10 +
      'FontNameCB.Hint=Fontnamn' + #13#10 +
      'FontSizeCB.Hint=Fontstorlek' + #13#10 +
      'BoldB.Hint=Fet' + #13#10 +
      'ItalicB.Hint=Kursiv' + #13#10 +
      'UnderlineB.Hint=Understruken' + #13#10 +
      'FontColorB.Hint=Teckenfärg' + #13#10 +
      'HighlightB.Hint=Markerad' + #13#10 +
      'RotateB.Hint=Text Rotation' + #13#10 +
      'TextAlignLeftB.Hint=Vänsterjustering' + #13#10 +
      'TextAlignCenterB.Hint=Centrera' + #13#10 +
      'TextAlignRightB.Hint=Högerjustering' + #13#10 +
      'TextAlignBlockB.Hint=Justera' + #13#10 +
      'TextAlignTopB.Hint=Topjustering' + #13#10 +
      'TextAlignMiddleB.Hint=Mittenjustering' + #13#10 +
      'TextAlignBottomB.Hint=Bottenjustering' + #13#10 +
      'FrameTB.Caption=Ram' + #13#10 +
      'FrameTopB.Hint=Toplinje' + #13#10 +
      'FrameBottomB.Hint=Bottenlinje' + #13#10 +
      'FrameLeftB.Hint=Vänsterlinje' + #13#10 +
      'FrameRightB.Hint=Högerlinje' + #13#10 +
      'FrameAllB.Hint=Alla Ramlinjer' + #13#10 +
      'FrameNoB.Hint=Ingen Ram' + #13#10 +
      'ShadowB.Hint=Skugga' + #13#10 +
      'FillColorB.Hint=Bakgrundsfärg' + #13#10 +
      'FrameColorB.Hint=Ramfärg' + #13#10 +
      'FrameStyleB.Hint=Ramstil' + #13#10 +
      'FrameWidthCB.Hint=Rambredd' + #13#10 +
      'StandardTB.Caption=Standard' + #13#10 +
      'NewB.Hint=Ny Rapport' + #13#10 +
      'OpenB.Hint=Öppna Rapport' + #13#10 +
      'SaveB.Hint=Spara Rapport' + #13#10 +
      'PreviewB.Hint=Förhandsgranska' + #13#10 +
      'NewPageB.Hint=Ny Rapportsida' + #13#10 +
      'NewDialogB.Hint=Ny Dialogsida' + #13#10 +
      'DeletePageB.Hint=Radera Sida' + #13#10 +
      'PageSettingsB.Hint=Sidinställningar' + #13#10 +
      'VariablesB.Hint=Variabler' + #13#10 +
      'CutB.Hint=Klipp ut' + #13#10 +
      'CopyB.Hint=Kopiera' + #13#10 +
      'PasteB.Hint=Klistra in' + #13#10 +
      'SampleFormatB.Hint=Kopiera Format' + #13#10 +
      'UndoB.Hint=Ångra' + #13#10 +
      'RedoB.Hint=Återta' + #13#10 +
      'GroupB.Hint=Gruppera' + #13#10 +
      'UngroupB.Hint=Ta bort Gruppering' + #13#10 +
      'ShowGridB.Hint=Visa Grid' + #13#10 +
      'AlignToGridB.Hint=Fäst mot Grid' + #13#10 +
      'SetToGridB.Hint=Anpassa mot Grid' + #13#10 +
      'ScaleCB.Hint=Zoom' + #13#10 +
      'ExtraToolsTB.Caption=Extra Verktyg' + #13#10 +
      'ObjectSelectB.Hint=Välj Verktyg' + #13#10 +
      'HandToolB.Hint=Hand Verktyg' + #13#10 +
      'ZoomToolB.Hint=Zoom Verktyg' + #13#10 +
      'TextToolB.Hint=Redigera Text Verktyg' + #13#10 +
      'FormatToolB.Hint=Kopiera Format Verktyg' + #13#10 +
      'ObjectBandB.Hint=Lägg till Band' + #13#10 +
      'FileMenu.Caption=&Arkiv' + #13#10 +
      'EditMenu.Caption=&Redigera' + #13#10 +
      'FindMI.Caption=Sök...' + #13#10 +
      'FindNextMI.Caption=Sök Nästa' + #13#10 +
      'ReplaceMI.Caption=Ersätt...' + #13#10 +
      'ReportMenu.Caption=&Rapport' + #13#10 +
      'ReportDataMI.Caption=Data...' + #13#10 +
      'ReportSettingsMI.Caption=Tillval...' + #13#10 +
      'ReportStylesMI.Caption=Stil...' + #13#10 +
      'ViewMenu.Caption=&Visa' + #13#10 +
      'ToolbarsMI.Caption=Vertygsfält' + #13#10 +
      'StandardMI.Caption=Standard' + #13#10 +
      'TextMI.Caption=Text' + #13#10 +
      'FrameMI.Caption=Ram' + #13#10 +
      'AlignmentMI.Caption=Justeringspalett' + #13#10 +
      'ToolsMI.Caption=Extra Verktyg' + #13#10 +
      'InspectorMI.Caption=Objektinspekterare' + #13#10 +
      'DataTreeMI.Caption=Data Träd' + #13#10 +
      'ReportTreeMI.Caption=Rapport Träd' + #13#10 +
      'ShowRulersMI.Caption=Linjaler' + #13#10 +
      'ShowGuidesMI.Caption=Guider' + #13#10 +
      'DeleteGuidesMI.Caption=Ta bort Guider' + #13#10 +
      'OptionsMI.Caption=Tillval...' + #13#10 +
      'HelpMenu.Caption=&Hjälp' + #13#10 +
      'HelpContentsMI.Caption=Hjälp Innehåll...' + #13#10 +
      'AboutMI.Caption=Om FastReport...' + #13#10 +
      'TabOrderMI.Caption=Tabuleringsordning...' + #13#10 +
      'UndoCmd.Caption=Ångra' + #13#10 +
      'RedoCmd.Caption=Återta' + #13#10 +
      'CutCmd.Caption=Klipp ut' + #13#10 +
      'CopyCmd.Caption=Kopiera' + #13#10 +
      'PasteCmd.Caption=Klistra in' + #13#10 +
      'GroupCmd.Caption=Gruppera' + #13#10 +
      'UngroupCmd.Caption=Ta bort Gruppering' + #13#10 +
      'DeleteCmd.Caption=Radera' + #13#10 +
      'DeletePageCmd.Caption=Radera Sida' + #13#10 +
      'SelectAllCmd.Caption=Välj alla' + #13#10 +
      'EditCmd.Caption=Redigera...' + #13#10 +
      'BringToFrontCmd.Caption=Lägg in Förgrunden' + #13#10 +
      'SendToBackCmd.Caption=Skicka till Bakgrunden' + #13#10 +
      'NewItemCmd.Caption=Ny...' + #13#10 +
      'NewReportCmd.Caption=Ny Rapport' + #13#10 +
      'NewPageCmd.Caption=Ny Sida' + #13#10 +
      'NewDialogCmd.Caption=Ny Dialog' + #13#10 +
      'OpenCmd.Caption=Öppna...' + #13#10 +
      'SaveCmd.Caption=Spara' + #13#10 +
      'SaveAsCmd.Caption=Spara som...' + #13#10 +
      'VariablesCmd.Caption=Variabler...' + #13#10 +
      'PageSettingsCmd.Caption=Sidinställningar...' + #13#10 +
      'PreviewCmd.Caption=Förhandsgranska' + #13#10 +
      'ExitCmd.Caption=Avsluta' + #13#10 +
      'ReportTitleMI.Caption=Rapport Titel' + #13#10 +
      'ReportSummaryMI.Caption=Rapport Summering' + #13#10 +
      'PageHeaderMI.Caption=Sidhuvud' + #13#10 +
      'PageFooterMI.Caption=Sidfot' + #13#10 +
      'HeaderMI.Caption=Huvud' + #13#10 +
      'FooterMI.Caption=Fot' + #13#10 +
      'MasterDataMI.Caption=Masterdata' + #13#10 +
      'DetailDataMI.Caption=Detaljdata' + #13#10 +
      'SubdetailDataMI.Caption=Subdetalj Data' + #13#10 +
      'Data4levelMI.Caption=Data fjärde nivå' + #13#10 +
      'Data5levelMI.Caption=Data femte nivå' + #13#10 +
      'Data6levelMI.Caption=Data sjätte nivå' + #13#10 +
      'GroupHeaderMI.Caption=Grupphuvud' + #13#10 +
      'GroupFooterMI.Caption=Gruppfot' + #13#10 +
      'ChildMI.Caption=Child' + #13#10 +
      'ColumnHeaderMI.Caption=Kolumnhuvud' + #13#10 +
      'ColumnFooterMI.Caption=Kolumnfot' + #13#10 +
      'OverlayMI.Caption=Overlay' + #13#10 +
      'VerticalbandsMI.Caption=Vertikala band' + #13#10 +
      'HeaderMI1.Caption=Huvud' + #13#10 +
      'FooterMI1.Caption=Fot' + #13#10 +
      'MasterDataMI1.Caption=Masterdata' + #13#10 +
      'DetailDataMI1.Caption=Detaljdata' + #13#10 +
      'SubdetailDataMI1.Caption=Subdetalj Data' + #13#10 +
      'GroupHeaderMI1.Caption=Grupphuvud' + #13#10 +
      'GroupFooterMI1.Caption=Gruppfot' + #13#10 +
      'ChildMI1.Caption=Barn' + #13#10 +
      'R0MI.Caption=0°' + #13#10 +
      'R45MI.Caption=45°' + #13#10 +
      'R90MI.Caption=90°' + #13#10 +
      'R180MI.Caption=180°' + #13#10 +
      'R270MI.Caption=270°' + #13#10 +
      'FontB.Hint=Fontinställningar' + #13#10 +
      'BoldMI.Caption=Fet' + #13#10 +
      'ItalicMI.Caption=Kursiv' + #13#10 +
      'UnderlineMI.Caption=Understruken' + #13#10 +
      'SuperScriptMI.Caption=Upphöjd' + #13#10 +
      'SubScriptMI.Caption=Nedsänken' + #13#10 +
      'CondensedMI.Caption=Komprimerad' + #13#10 +
      'WideMI.Caption=Bred' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'OpenDialog.Filter=Rapport (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=Pascal filer (*.pas)|*.pas|C++ filer (*.cpp)|*.cpp|JavaScript filer (*.js)|*.js|Basic filer (*.vb)|*.vb|All filer|*.*' + #13#10 +
      'SaveScriptDialog.Filter=Pascal filer (*.pas)|*.pas|C++ filer (*.cpp)|*.cpp|JavaScript filer (*.js)|*.js|Basic files (*.vb)|*.vb|All files|*.*' + #13#10 +
      '');
    Add('dsCm', 'Centimeter');
    Add('dsInch', 'Tum');
    Add('dsPix', 'Pixel');
    Add('dsChars', 'Tecken');
    Add('dsCode', 'Kod');
    Add('dsPage', 'Sida');
    Add('dsRepFilter', 'Rapport (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'Komprimerad rapport (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', 'Spara ändringar gjorda i förhandsgranska?');
    Add('dsSaveChangesTo', 'Spara ändringarna till ');
    Add('dsCantLoad', 'Kan inte läsa fil');
    Add('dsStyleFile', 'Stil');
    Add('dsCantFindProc', 'Kan inte hitta: main proc');
    Add('dsClearScript', 'Det här kommer att radera all kod. Vill du forsätta?');
    Add('dsNoStyle', 'Ingen stil');
    Add('dsStyleSample', 'Stilförlaga');
    Add('dsTextNotFound', 'Hittar inte Text ''%s''.');
    Add('dsReplace', 'Ersätt med ''%s''?');

    Add('TfrxAboutForm',
      'Caption=About FastReport' + #13#10 +
      'Label4.Caption=Besök vår hemsida för mer information:' + #13#10 +
      'Label6.Caption=Försäljning:' + #13#10 +
      'Label8.Caption=Support:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Sidinställningar' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      'TabSheet1.Caption=Papper' + #13#10 +
      'Label1.Caption=Bredd' + #13#10 +
      'Label2.Caption=Höjd' + #13#10 +
      'Label11.Caption=Storlek   ' + #13#10 +
      'Label12.Caption=Orientering   ' + #13#10 +
      'Label3.Caption=Vänster' + #13#10 +
      'Label4.Caption=Topp' + #13#10 +
      'Label5.Caption=Höger' + #13#10 +
      'Label6.Caption=Botten' + #13#10 +
      'Label13.Caption=Marginaler   ' + #13#10 +
      'Label14.Caption=Papperskälla   ' + #13#10 +
      'Label9.Caption=Firsta sidan' + #13#10 +
      'Label10.Caption=Övriga sidor' + #13#10 +
      'PortraitRB.Caption=Porträtt' + #13#10 +
      'LandscapeRB.Caption=Landskap' + #13#10 +
      'TabSheet3.Caption=Andra tillval' + #13#10 +
      'Label7.Caption=Kolumner   ' + #13#10 +
      'Label8.Caption=Antal' + #13#10 +
      'Label15.Caption=Bredd' + #13#10 +
      'Label16.Caption=Positioner' + #13#10 +
      'Label17.Caption=Övrigt   ' + #13#10 +
      'Label18.Caption=Duplex' + #13#10 +
      'PrintOnPrevCB.Caption=Skriv till föregående sida' + #13#10 +
      'MirrorMarginsCB.Caption=Spegelmarginaler' + #13#10 +
      'LargeHeightCB.Caption=Stor höjd i designläge' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Välj Rapportens DataSet' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Redigera Variabler' + #13#10 +
      'NewCategoryB.Caption=Kategori' + #13#10 +
      'NewVarB.Caption=Variabel' + #13#10 +
      'EditB.Caption=Redigera' + #13#10 +
      'DeleteB.Caption=Radera' + #13#10 +
      'EditListB.Caption=Lista' + #13#10 +
      'LoadB.Caption=Hämta' + #13#10 +
      'SaveB.Caption=Spara' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'ExprPanel.Caption= Uttryck:' + #13#10 +
      'OpenDialog1.Filter=Uppslagsbok (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Uppslagsbok (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(inga varibaler definierade)');
    Add('vaVar', 'Variabler');
    Add('vaDupName', 'Dublettnamn');

    Add('TfrxOptionsEditor',
      'Caption=Designerinställningar' + #13#10 +
      'Label1.Caption=Grid   ' + #13#10 +
      'Label2.Caption=Typ' + #13#10 +
      'Label3.Caption=Storlek' + #13#10 +
      'Label4.Caption=Dialog form:' + #13#10 +
      'Label5.Caption=Övrigt   ' + #13#10 +
      'Label6.Caption=Fonter   ' + #13#10 +
      'Label7.Caption=Kodfönster' + #13#10 +
      'Label8.Caption=Memoredigerare' + #13#10 +
      'Label9.Caption=Storlek' + #13#10 +
      'Label10.Caption=Storlek' + #13#10 +
      'Label11.Caption=Färger   ' + #13#10 +
      'Label12.Caption=Mellanrum mellan band:' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=tum' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      'CMRB.Caption=Centimeter:' + #13#10 +
      'InchesRB.Caption=Tum:' + #13#10 +
      'PixelsRB.Caption=Pixel:' + #13#10 +
      'ShowGridCB.Caption=Visa grid' + #13#10 +
      'AlignGridCB.Caption=Fäst mot grid' + #13#10 +
      'EditAfterInsCB.Caption=Visa redigerare efter tillägg' + #13#10 +
      'ObjectFontCB.Caption=Använd objektets fontinställningar' + #13#10 +
      'WorkspaceB.Caption=Arbetsutrymme' + #13#10 +
      'ToolB.Caption=Vertygsfönster' + #13#10 +
      'LCDCB.Caption=LCD grid färg' + #13#10 +
      'FreeBandsCB.Caption=Placera band fritt' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Återställ till förvalt' + #13#10 +
      'BandsCaptionsCB.Caption=Visa bandrubrik' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=Välj DataSet' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      '');
    Add('dbNotAssigned', '[inte angiven]');
    Add('dbSingleLine', 'Ensam rad');

    Add('TfrxGroupEditorForm',
      'Caption=Grupp' + #13#10 +
      'BreakOnL.Caption=Bryt på   ' + #13#10 +
      'OptionsL.Caption=Tillval   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      'DataFieldRB.Caption=Datafält' + #13#10 +
      'ExpressionRB.Caption=Uttryck' + #13#10 +
      'KeepGroupTogetherCB.Caption=Håll ihop gruppen' + #13#10 +
      'StartNewPageCB.Caption=Starta på ny sida' + #13#10 +
      'OutlineCB.Caption=Visa i översikt' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=System Memo' + #13#10 +
      'DataBandL.Caption=Data band' + #13#10 +
      'DataSetL.Caption=DataSet' + #13#10 +
      'DataFieldL.Caption=DataFält' + #13#10 +
      'FunctionL.Caption=Funktion' + #13#10 +
      'ExpressionL.Caption=Uttryck' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      'AggregateRB.Caption=Summerings värde' + #13#10 +
      'SysVariableRB.Caption=Systemvariabel' + #13#10 +
      'CountInvisibleCB.Caption=Räkna osynliga band' + #13#10 +
      'TextRB.Caption=Text' + #13#10 +
      'RunningTotalCB.Caption=Körd total' + #13#10 +
      '');
    Add('agAggregate', 'Infoga Summering');
    Add('vt1', '[DATUM]');
    Add('vt2', '[TID]');
    Add('vt3', '[SIDA#]');
    Add('vt4', '[TOTALTSIDOR#]');
    Add('vt5', '[SIDA#] av [TOTALTSIDOR#]');
    Add('vt6', '[RAD#]');

    Add('TfrxOleEditorForm',
      'Caption=OLE Objekt' + #13#10 +
      'InsertB.Caption=Infoga...' + #13#10 +
      'EditB.Caption=Redigera...' + #13#10 +
      'CloseB.Caption=Stäng' + #13#10 +
      '');
    Add('olStretched', 'Sträckt');

    Add('TfrxBarcodeEditorForm',
      'Caption=Barcode Redigerare' + #13#10 +
      'CodeLbl.Caption=Kod' + #13#10 +
      'TypeLbl.Caption=Vilken Bar' + #13#10 +
      'ZoomLbl.Caption=Zoom:' + #13#10 +
      'OptionsLbl.Caption=Tillval   ' + #13#10 +
      'RotationLbl.Caption=Rotation   ' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CalcCheckSumCB.Caption=Beräkna Checksumma ' + #13#10 +
      'ViewTextCB.Caption=Text' + #13#10 +
      'Rotation0RB.Caption=0°' + #13#10 +
      'Rotation90RB.Caption=90°' + #13#10 +
      'Rotation180RB.Caption=180°' + #13#10 +
      'Rotation270RB.Caption=270°' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Beräkna Checksumma');
    Add('bcShowText', 'Visa Text');

    Add('TfrxAliasesEditorForm',
      'Caption=Smeknamnsredigerare' + #13#10 +
      'HintL.Caption=tryck på Enter för att redigera' + #13#10 +
      'DSAliasL.Caption=Smeknamn på Dataset' + #13#10 +
      'FieldAliasesL.Caption=Smeknamn på fält' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      'ResetB.Caption=Återställ' + #13#10 +
      'UpdateB.Caption=Update' + #13#10 +
      '');
    Add('alUserName', 'Användarnamn');
    Add('alOriginal', 'Originalnamn');

    Add('TfrxParamsEditorForm',
      'Caption=Parameterredigerare' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      '');
    Add('qpName', 'Namn');
    Add('qpDataType', 'Datatyp');
    Add('qpValue', 'Värde');

    Add('TfrxMDEditorForm',
      'Caption=Master-Detalj Länk' + #13#10 +
      'Label1.Caption=Detalj fält' + #13#10 +
      'Label2.Caption=Master fält' + #13#10 +
      'Label3.Caption=Länkade fält' + #13#10 +
      'AddB.Caption=Lägg till' + #13#10 +
      'ClearB.Caption=Rensa' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=Memo' + #13#10 +
      'ExprB.Hint=Infoga Uttryck' + #13#10 +
      'AggregateB.Hint=Infoga Summering' + #13#10 +
      'LocalFormatB.Hint=Infoga Formatering' + #13#10 +
      'WordWrapB.Hint=Automatiskt radbyte' + #13#10 +
      'CancelB.Hint=Avbryt' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=Bild' + #13#10 +
      'LoadB.Hint=Hämta' + #13#10 +
      'CopyB.Hint=Kopiera' + #13#10 +
      'PasteB.Hint=Klistra in' + #13#10 +
      'ClearB.Hint=Rensa' + #13#10 +
      'CancelB.Hint=Avbryt' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('piEmpty', 'Tom');

    Add('TfrxChartEditorForm',
      'Caption=Grafredigerare' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=Infoga serie' + #13#10 +
      'DeleteB.Hint=radera serie' + #13#10 +
      'DBSourceRB.Caption=Data från DB' + #13#10 +
      'BandSourceRB.Caption=Band källa' + #13#10 +
      'FixedDataRB.Caption=Fast data' + #13#10 +
      'DatasetLbl.Caption=Dataset' + #13#10 +
      'BandLbl.Caption=Data band' + #13#10 +
      'X1Lbl.Caption=X Värden' + #13#10 +
      'Y1Lbl.Caption=Y Värden' + #13#10 +
      'X2Lbl.Caption=X Värden' + #13#10 +
      'Y2Lbl.Caption=Y Värden' + #13#10 +
      'X3Lbl.Caption=X Värden (t.ex. a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Y Värden (t.ex. 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Andra tillval   ' + #13#10 +
      'ShowTopLbl.Caption=ToppN värden' + #13#10 +
      'CaptionLbl.Caption=ToppN rubrik' + #13#10 +
      'SortLbl.Caption=Sorteringsordning' + #13#10 +
      'LineMI.Caption=Linje' + #13#10 +
      'AreaMI.Caption=Område' + #13#10 +
      'PointMI.Caption=Punkt' + #13#10 +
      'BarMI.Caption=Stapel' + #13#10 +
      'HorizBarMI.Caption=Horis. Stapel' + #13#10 +
      'PieMI.Caption=Cirkel' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Snabb Linje' + #13#10 +
      '');
    Add('ch3D', '3D Vy');
    Add('chAxis', 'Visa Axlar');
    Add('chsoNone', 'Ingen');
    Add('chsoAscending', 'Stigande');
    Add('chsoDescending', 'Sjunkande');

    Add('TfrxRichEditorForm',
      'Caption=RichRedigerare' + #13#10 +
      'OpenB.Hint=Öppna Fil' + #13#10 +
      'SaveB.Hint=Spara Fil' + #13#10 +
      'UndoB.Hint=Ångra' + #13#10 +
      'TTB.Hint=Font' + #13#10 +
      'ExprB.Hint=Infoga Uttryck' + #13#10 +
      'CancelB.Hint=Avbryt' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      'BoldB.Hint=Fet' + #13#10 +
      'ItalicB.Hint=Kursiv' + #13#10 +
      'UnderlineB.Hint=Understruken' + #13#10 +
      'LeftAlignB.Hint=Vänsterjusterad' + #13#10 +
      'CenterAlignB.Hint=Centrerad' + #13#10 +
      'RightAlignB.Hint=Högerjusterad' + #13#10 +
      'BlockAlignB.Hint=Justera' + #13#10 +
      'BulletsB.Hint=Punkter' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Korsreferenseditor' + #13#10 +
      'DatasetL.Caption=Käll data   ' + #13#10 +
      'DimensionsL.Caption=Dimensioner   ' + #13#10 +
      'RowsL.Caption=Rader' + #13#10 +
      'ColumnsL.Caption=Kolumner' + #13#10 +
      'CellsL.Caption=Celler' + #13#10 +
      'StructureL.Caption=Korsreferensstruktur   ' + #13#10 +
      'RowHeaderCB.Caption=Rad huvud' + #13#10 +
      'ColumnHeaderCB.Caption=Kolumnhuvud' + #13#10 +
      'RowTotalCB.Caption=Totalt rad' + #13#10 +
      'ColumnTotalCB.Caption=Totalt kolumn' + #13#10 +
      'SwapB.Hint=Byt rad/kolumn' + #13#10 +
      'StyleCB.Hint=Korsreferensstil' + #13#10 +
      'FontB.Hint=Fontinställningar' + #13#10 +
      'AlignLeftB.Hint=Vänsterjustering' + #13#10 +
      'AlignCenterB.Hint=Centrera' + #13#10 +
      'AlignRightB.Hint=Högerjustering' + #13#10 +
      'RotationB.Hint=Text Rotation' + #13#10 +
      'HighlightB.Hint=Markera' + #13#10 +
      'FormatB.Hint=Format' + #13#10 +
      'FrameB.Hint=Raminställningar' + #13#10 +
      'FillColorB.Hint=Fyllnadsfärg' + #13#10 +
      'Func1MI.Caption=Ingen' + #13#10 +
      'Func2MI.Caption=Sum' + #13#10 +
      'Func3MI.Caption=Min' + #13#10 +
      'Func4MI.Caption=Max' + #13#10 +
      'Func5MI.Caption=Medel' + #13#10 +
      'Func6MI.Caption=Antal' + #13#10 +
      'Sort1MI.Caption=Stigande (A-Ö)' + #13#10 +
      'Sort2MI.Caption=Sjunkande (Ö-A)' + #13#10 +
      'Sort3MI.Caption=Ingen sortering' + #13#10 +
      'BoldMI.Caption=Fet' + #13#10 +
      'ItalicMI.Caption=Kursiv' + #13#10 +
      'UnderlineMI.Caption=Understruken' + #13#10 +
      'SuperScriptMI.Caption=Upphöjd' + #13#10 +
      'SubScriptMI.Caption=Nedsänkt' + #13#10 +
      'CondensedMI.Caption=Komprimerad' + #13#10 +
      'WideMI.Caption=Bred' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=Avbryt' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('crSubtotal', 'Deltotal');
    Add('crNone', 'Ingen');
    Add('crSum', 'Sum');
    Add('crMin', 'Min');
    Add('crMax', 'Max');
    Add('crAvg', 'Medel');
    Add('crCount', 'Antal');
    Add('crAsc', 'A-Ö');
    Add('crDesc', 'Ö-A');
    Add('crRepHdrs', 'Återutskriv Huvud');
    Add('crBorder', 'Gräns');
    Add('crDown', 'Ner Sedan Genom');

    Add('TfrxExprEditorForm',
      'Caption=Uttryckseditor' + #13#10 +
      'ExprL.Caption=Uttryck:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=Formateringseditor' + #13#10 +
      'CategoryL.Caption=Kategori' + #13#10 +
      'FormatL.Caption=Format' + #13#10 +
      'FormatStrL.Caption=Formatsträng:' + #13#10 +
      'SeparatorL.Caption=Decimal separator:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      '');
    Add('fkText', 'Text (ingen formatering)');
    Add('fkNumber', 'Tal');
    Add('fkDateTime', 'Datum/Tid');
    Add('fkBoolean', 'Sant/Falskt');
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
    Add('fkBoolean4', 'Falskt,Sant;Falskt,Sant');

    Add('TfrxHighlightEditorForm',
      'Caption=Markerad' + #13#10 +
      'FontColorB.Caption=Färg...' + #13#10 +
      'BackColorB.Caption=Färg...' + #13#10 +
      'ConditionL.Caption=Villkor   ' + #13#10 +
      'FontL.Caption=Font   ' + #13#10 +
      'BackgroundL.Caption=Bakgrund   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      'BoldCB.Caption=Fet' + #13#10 +
      'ItalicCB.Caption=Kursiv' + #13#10 +
      'UnderlineCB.Caption=Understruken' + #13#10 +
      'TransparentRB.Caption=Genomskinlig' + #13#10 +
      'OtherRB.Caption=Annan' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Rapportinställningar' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      'GeneralTS.Caption=Generella' + #13#10 +
      'ReportSettingsL.Caption=Skrivarinställningar' + #13#10 +
      'CopiesL.Caption=Kopior' + #13#10 +
      'GeneralL.Caption=Generella   ' + #13#10 +
      'PasswordL.Caption=Lösenord' + #13#10 +
      'CollateCB.Caption=Sortera kopior' + #13#10 +
      'DoublePassCB.Caption=Dubbelpass' + #13#10 +
      'PrintIfEmptyCB.Caption=Skriv ut tom' + #13#10 +
      'DescriptionTS.Caption=Description' + #13#10 +
      'NameL.Caption=Namn' + #13#10 +
      'Description1L.Caption=Beskrivning' + #13#10 +
      'PictureL.Caption=Bild' + #13#10 +
      'AuthorL.Caption=Upphovsman' + #13#10 +
      'MajorL.Caption=Major' + #13#10 +
      'MinorL.Caption=Minor' + #13#10 +
      'ReleaseL.Caption=Release' + #13#10 +
      'BuildL.Caption=Build' + #13#10 +
      'CreatedL.Caption=Skapad' + #13#10 +
      'ModifiedL.Caption=Modifierad' + #13#10 +
      'DescriptionL.Caption=Beskrivning   ' + #13#10 +
      'VersionL.Caption=Version   ' + #13#10 +
      'PictureB.Caption=Leta...' + #13#10 +
      '');
    Add('rePrnOnPort', 'på');

    Add('TfrxStringsEditorForm',
      'Caption=Rader' + #13#10 +
      'CancelB.Hint=Avbryt' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=Avbryt' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=Lösenord' + #13#10 +
      'PasswordL.Caption=Ange lösenord:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=Stileditor' + #13#10 +
      'ColorB.Caption=Färg...' + #13#10 +
      'FontB.Caption=Font...' + #13#10 +
      'FrameB.Caption=Ram...' + #13#10 +
      'AddB.Hint=Infoga' + #13#10 +
      'DeleteB.Hint=Radera' + #13#10 +
      'EditB.Hint=Redigera' + #13#10 +
      'LoadB.Hint=Hämta' + #13#10 +
      'SaveB.Hint=Spara' + #13#10 +
      'CancelB.Hint=Avbryt' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=Rameditor' + #13#10 +
      'FrameL.Caption=Ram' + #13#10 +
      'LineL.Caption=Ramlinje' + #13#10 +
      'ShadowL.Caption=Skugga' + #13#10 +
      'FrameTopB.Hint=Toplinje' + #13#10 +
      'FrameBottomB.Hint=Bottenlinje' + #13#10 +
      'FrameLeftB.Hint=Vänsterlinje' + #13#10 +
      'FrameRightB.Hint=Högerlinje' + #13#10 +
      'FrameAllB.Hint=Alla sidor' + #13#10 +
      'FrameNoB.Hint=Ingen Ram' + #13#10 +
      'FrameColorB.Hint=Ramfärg' + #13#10 +
      'FrameStyleB.Hint=Ramstil' + #13#10 +
      'FrameWidthCB.Hint=Linjebredd' + #13#10 +
      'ShadowB.Hint=Skugga' + #13#10 +
      'ShadowColorB.Hint=Skuggfärg' + #13#10 +
      'ShadowWidthCB.Hint=Skuggbredd' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=Ny Post' + #13#10 +
      'ItemsTab.Caption=Poster' + #13#10 +
      'TemplatesTab.Caption=Förlagor' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Tabuleringsordning' + #13#10 +
      'Label1.Caption=Komponenterna listas i tab ordning:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      'UpB.Caption=Flytta Upp' + #13#10 +
      'DownB.Caption=Flytta Ned' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Utvärdera' + #13#10 +
      'Label1.Caption=Uttryck' + #13#10 +
      'Label2.Caption=Resultat' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Rapport Wizard' + #13#10 +
      'DataTab.Caption=Data' + #13#10 +
      'GroupsTab.Caption=Grupper' + #13#10 +
      'LayoutTab.Caption=Layout' + #13#10 +
      'StyleTab.Caption=Stil' + #13#10 +
      'Step1L.Caption=Steg 1. Välj dataset och de fält som ska visas.' + #13#10 +
      'Step2L.Caption=Steg 2. Skapa grupper (inte obligatorsikt).' + #13#10 +
      'Step3L.Caption=Steg 3. Definiera pappersorientering och layout.' + #13#10 +
      'Step4L.Caption=Step 4. Välj rapportstil.' + #13#10 +
      'AddFieldB.Caption=Infoga >' + #13#10 +
      'AddAllFieldsB.Caption=Infoga alla >>' + #13#10 +
      'RemoveFieldB.Caption=< Radera' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Radera alla' + #13#10 +
      'AddGroupB.Caption=Infoga >' + #13#10 +
      'RemoveGroupB.Caption=< Radera' + #13#10 +
      'SelectedFieldsL.Caption=Välj fält:' + #13#10 +
      'AvailableFieldsL.Caption=Tillgängliga fält:' + #13#10 +
      'GroupsL.Caption=Grupper:' + #13#10 +
      'OrientationL.Caption=Orientering   ' + #13#10 +
      'LayoutL.Caption=Layout   ' + #13#10 +
      'PortraitRB.Caption=Porträtt' + #13#10 +
      'LandscapeRB.Caption=Landskap' + #13#10 +
      'TabularRB.Caption=Tab' + #13#10 +
      'ColumnarRB.Caption=Kolumn' + #13#10 +
      'FitWidthCB.Caption=Passa in fälten inom sidans bredd' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      'BackB.Caption=<< Tillbaka' + #13#10 +
      'NextB.Caption=Nästa >>' + #13#10 +
      'FinishB.Caption=Slutför' + #13#10 +
      '');
    Add('wzStd', 'Standard Rapport Wizard');
    Add('wzDMP', 'Dot-Matris Rapport Wizard');
    Add('wzStdEmpty', 'Standard Rapport');
    Add('wzDMPEmpty', 'Dot-Matris Rapport');


    Add('ftAllFiles', 'Alla Filer');
    Add('ftPictures', 'Bilder');
    Add('ftDB', 'Databaser');
    Add('ftRichFile', 'RichText filer');
    Add('ftTextFile', 'Text filer');

    Add('prNotAssigned', '(Ej tilldelat)');
    Add('prInvProp', 'Felaktigt egenskapsvärde');
    Add('prDupl', 'Dublett namn');
    Add('prPict', '(Bild)');

    Add('mvExpr', 'Tillåt uttryck');
    Add('mvStretch', 'Sträck');
    Add('mvStretchToMax', 'Sträck till Max Höjd');
    Add('mvShift', 'Shifta');
    Add('mvShiftOver', 'Shifta om överlappad');
    Add('mvVisible', 'Synlig');
    Add('mvPrintable', 'Skrivbar');
    Add('mvFont', 'Font...');
    Add('mvFormat', 'Visa Format...');
    Add('mvClear', 'Rensa Innehåll');
    Add('mvAutoWidth', 'Automatisk bredd');
    Add('mvWWrap', 'Radbrytning');
    Add('mvSuppress', 'Undertryck Upprepade värden');
    Add('mvHideZ', 'Göm nollor');
    Add('mvHTML', 'Tillåt HTML Tags');
    Add('lvDiagonal', 'Diagonal');
    Add('pvAutoSize', 'Automtisk Storlek');
    Add('pvCenter', 'Centrera');
    Add('pvAspect', 'Behåll proportioner');
    Add('bvSplit', 'Tillåt delning');
    Add('bvKeepChild', 'Håll ihop barn');
    Add('bvPrintChild', 'Skriv ut även om barnet är osynligt');
    Add('bvStartPage', 'Starta Sy Sida');
    Add('bvPrintIfEmpty', 'Skriv ut om detaljen är tom');
    Add('bvKeepDetail', 'Håll ihop detalj');
    Add('bvKeepFooter', 'Håll ihop fot');
    Add('bvReprint', 'Återutskrift på ny sida');
    Add('bvOnFirst', 'Skriv ut på första sidan');
    Add('bvOnLast', 'Skriv ut på sista sidan');
    Add('bvKeepGroup', 'Håll ihop');
    Add('bvFooterAfterEach', 'Fot efter varje rad');
    Add('srParent', 'Skriv ut på förälder');
    Add('bvKeepHeader', 'Håll ihop huvud');

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

    Add('ctString', 'Sträng');
    Add('ctDate', 'Datum och Tid');
    Add('ctConv', 'Omvandlingar');
    Add('ctFormat', 'Formatering');
    Add('ctMath', 'Matematiska');
    Add('ctOther', 'Övriga');

    Add('IntToStr', 'Konverterar ett heltal till en sträng');
    Add('FloatToStr', 'Konverterar ett decimaltal till en sträng');
    Add('DateToStr', 'Konverterar ett datum till en sträng');
    Add('TimeToStr', 'Konverterar en tid till en sträng');
    Add('DateTimeToStr', 'Konverterar ett datum-och-tid till en sträng');
    Add('VarToStr', 'Konverterar en variant till en sträng');
    Add('StrToInt', 'Konverterar en sträng till het heltal');
    Add('StrToFloat', 'Konverterar en sträng till ett decimaltal');
    Add('StrToDate', 'Konverterar en sträng till ett datum');
    Add('StrToTime', 'Konverterar en sträng till en tid');
    Add('StrToDateTime', 'Konverterar en sträng till ett datum-och-tid');
    Add('Format', 'Returnerar en formaterad sträng från en serie argument');
    Add('FormatFloat', 'Formaterar en decimaltal');
    Add('FormatDateTime', 'Formaterar ett datum-och-tid värde');
    Add('FormatMaskText', 'Returnerar en formaterad sträng basrad på en edit mask');
    Add('EncodeDate', 'Returnerar en TDateTime typ från en specificerad År, Mån, Dag');
    Add('DecodeDate', 'Delar upp en TDateTime till År, Månad och Dag värden');
    Add('EncodeTime', 'Returnerar en TDateTime typ för en specifik Tim, Min, Sec och MSec');
    Add('DecodeTime', 'Delar TDateTime till Tim, Min, Sec och MSec');
    Add('Date', 'Returnerar Aktuellt datum');
    Add('Time', 'Returnerar Aktuell tid');
    Add('Now', 'Returnerar Aktuell Datum och Tid');
    Add('DayOfWeek', 'Returnserar aktuell veckodag for specificerat Datum');
    Add('IsLeapYear', 'Indikerar om specificerat År och skottår elle inte');
    Add('DaysInMonth', 'Returnerar antal dagar för specificerad månad');
    Add('Length', 'Returnerar längden på en sträng');
    Add('Copy', 'Returnerar en delsträng av en sträng');
    Add('Pos', 'Returnerar postion på delsträng i en sträng');
    Add('Delete', 'Tar bort delsträng i en sträng');
    Add('Insert', 'infogar en delsträng i en sträng');
    Add('Uppercase', 'Konverterar alla tecken i en sträng till VERSALER');
    Add('Lowercase', 'Konverterar alla tecken i en sträng till gemener');
    Add('Trim', 'Tar bort alla inledande och avslutande mellanslag i en sträng');
    Add('NameCase', 'Konverterar första tecknet i varje ord till VERSAL');
    Add('CompareText', 'Jämför två strängar');
    Add('Chr', 'Konverterar ett heltal till char');
    Add('Ord', 'Konverterar en char till heltal');
    Add('SetLength', 'Sätter längden på en sträng');
    Add('Round', 'Avrundar ett decimaltal till närmaste heltal');
    Add('Trunc', 'Trunkerar ett decimaltal till ett heltal');
    Add('Int', 'Returnerar heltalsdelen av ett flyttal');
    Add('Frac', 'Returnerar decimaldelen av ett flyttal');
    Add('Sqrt', 'Returnerar kvadratroten ur ett spceficerat tal');
    Add('Abs', 'Returnerar det absoluta värdet av ett tal');
    Add('Sin', 'Returnerar sinus för en vinkel (i radianer)');
    Add('Cos', 'Returnerar cosinus föe en vinkel (i radianer)');
    Add('ArcTan', 'Returnérar arctangens');
    Add('Tan', 'Returnerar tangens');
    Add('Exp', 'Returnerar exponenten');
    Add('Ln', 'Returnerar den naturliga logaritmen av ett uttryck');
    Add('Pi', 'Returnerar 3.1415926... talet');
    Add('Inc', 'Ökar ett värde');
    Add('Dec', 'Minskar ett värde');
    Add('RaiseException', 'Ökar ett uttryck');
    Add('ShowMessage', 'Visar en meddelandebox');
    Add('Randomize', 'Startar slumptalsgeneratorn');
    Add('Random', 'Returnerar ett slumptal');
    Add('ValidInt', 'Returnerar Sant om specificerad sträng innehåller ett giltigt heltal');
    Add('ValidFloat', 'Returnerar Sant om specificerad sträng innehåller ett giltigt decimaltal');
    Add('ValidDate', 'Returnerar Sant om specificerad sträng innehåller ett giltigt datum');
    Add('IIF', 'Returnerar  SantVärde om specificerat uttryck är sant, annars returneras FalskVärde');
    Add('Get', 'Endast för intern användning');
    Add('Set', 'Endast för intern användning');
    Add('InputBox', 'Visar ett inmatningsfönster så att användaren kan ange en sträng');
    Add('InputQuery', 'Visar ett dialogfönster så att användaren kan ange en sträng');
    Add('MessageDlg', 'Visar ett meddelandefönster');
    Add('CreateOleObject', 'Skapar ett OLE objekt');
    Add('VarArrayCreate', 'Skapar en variant array');
    Add('VarType', 'Returnerar vilken typ det är på variant värdet');
    Add('DayOf', 'Returnerar dagnummer (1..31) för angivet Datum');
    Add('MonthOf', 'Returnerar månadsnummer (1..12) för angivent Datum');
    Add('YearOf', 'Returnerar År från angivet Datum');

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