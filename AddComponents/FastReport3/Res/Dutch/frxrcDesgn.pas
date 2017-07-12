
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
      'Caption=Object inspecteur' + #13#10 +
      '');
    Add('oiProp', 'Eigenschappen');
    Add('oiEvent', 'Gebeurtenissen');

    Add('TfrxDataTreeForm',
      'Caption=Gegevens boom' + #13#10 +
      'DataTS.Caption=Gegevens' + #13#10 +
      'VariablesTS.Caption=Variabelen' + #13#10 +
      'FunctionsTS.Caption=Functies' + #13#10 +
      'InsFieldCB.Caption=Veld aanmaken' + #13#10 +
      'InsCaptionCB.Caption=Bijschrift aanmaken' + #13#10 +
      '');
    Add('dtNoData', 'Geen gegevens beschikbaar');
    Add('dtData', 'Gegevens');
    Add('dtSysVar', 'Systeem variabelen');
    Add('dtVar', 'Variabelen');
    Add('dtFunc', 'Functies');

    Add('TfrxReportTreeForm',
      'Caption=Rapport boom' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Scriptbestand openen' + #13#10 +
      'SaveScriptB.Hint=Script in bestand opslaan' + #13#10 +
      'RunScriptB.Hint=Script uitvoeren' + #13#10 +
      'StepScriptB.Hint=Trace Into' + #13#10 +
      'StopScriptB.Hint=Script beëindigen' + #13#10 +
      'EvaluateB.Hint=Evalueren' + #13#10 +
      'LangL.Caption=Taal:' + #13#10 +
      'AlignTB.Caption=Uitlijnen' + #13#10 +
      'AlignLeftsB.Hint=Links uitlijnen' + #13#10 +
      'AlignHorzCentersB.Hint=Horizontaal centreren' + #13#10 +
      'AlignRightsB.Hint=Rechts uitlijnen' + #13#10 +
      'AlignTopsB.Hint=Aan bovenzijde uitlijnen' + #13#10 +
      'AlignVertCentersB.Hint=Verticaal centreren' + #13#10 +
      'AlignBottomsB.Hint=Aan onderzijde uitlijnen' + #13#10 +
      'SpaceHorzB.Hint=Horizontaal verdelen' + #13#10 +
      'SpaceVertB.Hint=Verticaal verdelen' + #13#10 +
      'CenterHorzB.Hint=Horizontaal centreren binnen de Band' + #13#10 +
      'CenterVertB.Hint=Verticaal centreren binnen de Band' + #13#10 +
      'SameWidthB.Hint=Gelijke breedte' + #13#10 +
      'SameHeightB.Hint=Gelijke hoogte' + #13#10 +
      'TextTB.Caption=Tekst' + #13#10 +
      'StyleCB.Hint=Stijl' + #13#10 +
      'FontNameCB.Hint=Lettertype naam' + #13#10 +
      'FontSizeCB.Hint=Lettertype grootte' + #13#10 +
      'BoldB.Hint=Vet' + #13#10 +
      'ItalicB.Hint=Cursief' + #13#10 +
      'UnderlineB.Hint=Onderstreept' + #13#10 +
      'FontColorB.Hint=Lettertype kleur' + #13#10 +
      'HighlightB.Hint=Markeren' + #13#10 +
      'RotateB.Hint=Tekst verdraaiing' + #13#10 +
      'TextAlignLeftB.Hint=Links uitlijnen' + #13#10 +
      'TextAlignCenterB.Hint=Horizontaal Centreren' + #13#10 +
      'TextAlignRightB.Hint=Rechts uitlijnen' + #13#10 +
      'TextAlignBlockB.Hint=Uitvullen' + #13#10 +
      'TextAlignTopB.Hint=Boven uitlijnen' + #13#10 +
      'TextAlignMiddleB.Hint=Verticaal centreren' + #13#10 +
      'TextAlignBottomB.Hint=Onder uitlijnen' + #13#10 +
      'FrameTB.Caption=Kaders' + #13#10 +
      'FrameTopB.Hint=Boven kader' + #13#10 +
      'FrameBottomB.Hint=Onder kader' + #13#10 +
      'FrameLeftB.Hint=Linker kader' + #13#10 +
      'FrameRightB.Hint=Rechter kader' + #13#10 +
      'FrameAllB.Hint=Alle kaders' + #13#10 +
      'FrameNoB.Hint=Geen kaders' + #13#10 +
      'ShadowB.Hint=Schaduw' + #13#10 +
      'FillColorB.Hint=Achtergrondkleur' + #13#10 +
      'FrameColorB.Hint=Kaderlijnkleur' + #13#10 +
      'FrameStyleB.Hint=Kaderlijnstijl' + #13#10 +
      'FrameWidthCB.Hint=Kaderlijnbreedte' + #13#10 +
      'StandardTB.Caption=Standaard' + #13#10 +
      'NewB.Hint=Nieuw Rapport' + #13#10 +
      'OpenB.Hint=Rapport openen' + #13#10 +
      'SaveB.Hint=Rapport opslaan' + #13#10 +
      'PreviewB.Hint=Voorbeeld' + #13#10 +
      'NewPageB.Hint=Nieuwe rapport pagina' + #13#10 +
      'NewDialogB.Hint=Nieuwe dialoog pagina' + #13#10 +
      'DeletePageB.Hint=Pagina verwijderen' + #13#10 +
      'PageSettingsB.Hint=Pagina instellingen' + #13#10 +
      'VariablesB.Hint=Variabelen' + #13#10 +
      'CutB.Hint=Knippen' + #13#10 +
      'CopyB.Hint=Kopiëren' + #13#10 +
      'PasteB.Hint=Plakken' + #13#10 +
      'SampleFormatB.Hint=Opmaak kopiëren' + #13#10 +
      'UndoB.Hint=Ongedaan maken' + #13#10 +
      'RedoB.Hint=Opnieuw doen' + #13#10 +
      'GroupB.Hint=Groeperen' + #13#10 +
      'UngroupB.Hint=Groepering opheffen' + #13#10 +
      'ShowGridB.Hint=Raster tonen' + #13#10 +
      'AlignToGridB.Hint=Uitlijnen op het raster' + #13#10 +
      'SetToGridB.Hint=Formaat aanpassen aan het raster' + #13#10 +
      'ScaleCB.Hint=Zoom' + #13#10 +
      'ExtraToolsTB.Caption=Extra gereedschap' + #13#10 +
      'ObjectSelectB.Hint=Selecteren' + #13#10 +
      'HandToolB.Hint=Slepen' + #13#10 +
      'ZoomToolB.Hint=Zoomen' + #13#10 +
      'TextToolB.Hint=Tekst' + #13#10 +
      'FormatToolB.Hint=Opmaak kopiëren' + #13#10 +
      'ObjectBandB.Hint=Band invoegen' + #13#10 +
      'FileMenu.Caption=&Bestand' + #13#10 +
      'EditMenu.Caption=B&ewerken' + #13#10 +
      'FindMI.Caption=Zoeken...' + #13#10 +
      'FindNextMI.Caption=Volgende zoeken' + #13#10 +
      'ReplaceMI.Caption=Vervangen...' + #13#10 +
      'ReportMenu.Caption=&Rapport' + #13#10 +
      'ReportDataMI.Caption=Gegevens...' + #13#10 +
      'ReportSettingsMI.Caption=Opties...' + #13#10 +
      'ReportStylesMI.Caption=Stijlen...' + #13#10 +
      'ViewMenu.Caption=Bee&ld' + #13#10 +
      'ToolbarsMI.Caption=Werkbalken' + #13#10 +
      'StandardMI.Caption=Standaard' + #13#10 +
      'TextMI.Caption=Tekst' + #13#10 +
      'FrameMI.Caption=Kaderlijnen' + #13#10 +
      'AlignmentMI.Caption=Uitlijn palet' + #13#10 +
      'ToolsMI.Caption=Extra gereedschap' + #13#10 +
      'InspectorMI.Caption=Object inspecteur' + #13#10 +
      'DataTreeMI.Caption=Gegevens boom' + #13#10 +
      'ReportTreeMI.Caption=Rapport boom' + #13#10 +
      'ShowRulersMI.Caption=Linealen' + #13#10 +
      'ShowGuidesMI.Caption=Hulplijnen' + #13#10 +
      'DeleteGuidesMI.Caption=Hulplijnen verwijderen' + #13#10 +
      'OptionsMI.Caption=Opties...' + #13#10 +
      'HelpMenu.Caption=&Help' + #13#10 +
      'HelpContentsMI.Caption=Help inhoudsopgave...' + #13#10 +
      'AboutMI.Caption=Over FastReport...' + #13#10 +
      'TabOrderMI.Caption=Tab volgorde...' + #13#10 +
      'UndoCmd.Caption=Ongedaan maken' + #13#10 +
      'RedoCmd.Caption=Opnieuw doen' + #13#10 +
      'CutCmd.Caption=Knippen' + #13#10 +
      'CopyCmd.Caption=Kopiëren' + #13#10 +
      'PasteCmd.Caption=Plakken' + #13#10 +
      'GroupCmd.Caption=Groeperen' + #13#10 +
      'UngroupCmd.Caption=Groep opheffen' + #13#10 +
      'DeleteCmd.Caption=Verwijderen' + #13#10 +
      'DeletePageCmd.Caption=Pagina verwijderen' + #13#10 +
      'SelectAllCmd.Caption=Alles selecteren' + #13#10 +
      'EditCmd.Caption=Bewerken...' + #13#10 +
      'BringToFrontCmd.Caption=Naar voorgrond brengen' + #13#10 +
      'SendToBackCmd.Caption=Naar achtergond sturen' + #13#10 +
      'NewItemCmd.Caption=Nieuw...' + #13#10 +
      'NewReportCmd.Caption=Nieuw rapport' + #13#10 +
      'NewPageCmd.Caption=Nieuwe pagina' + #13#10 +
      'NewDialogCmd.Caption=Nieuwe dialoog' + #13#10 +
      'OpenCmd.Caption=Openen...' + #13#10 +
      'SaveCmd.Caption=Opslaan' + #13#10 +
      'SaveAsCmd.Caption=Opslaan als...' + #13#10 +
      'VariablesCmd.Caption=Variabelen...' + #13#10 +
      'PageSettingsCmd.Caption=Pagina instellingen...' + #13#10 +
      'PreviewCmd.Caption=Voorbeeld' + #13#10 +
      'ExitCmd.Caption=Einde' + #13#10 +
      'ReportTitleMI.Caption=Rapport titel' + #13#10 +
      'ReportSummaryMI.Caption=Rapport samenvatting' + #13#10 +
      'PageHeaderMI.Caption=Pagina kop' + #13#10 +
      'PageFooterMI.Caption=Pagina voet' + #13#10 +
      'HeaderMI.Caption=Koptekst' + #13#10 +
      'FooterMI.Caption=Voettekst' + #13#10 +
      'MasterDataMI.Caption=Master gegevens' + #13#10 +
      'DetailDataMI.Caption=Detail gegevens' + #13#10 +
      'SubdetailDataMI.Caption=Subdetail gegevens' + #13#10 +
      'Data4levelMI.Caption=Gegevens 4e niveau' + #13#10 +
      'Data5levelMI.Caption=Gegevens 5e niveau' + #13#10 +
      'Data6levelMI.Caption=Gegevens 6e niveau' + #13#10 +
      'GroupHeaderMI.Caption=Groep kop' + #13#10 +
      'GroupFooterMI.Caption=Groep voet' + #13#10 +
      'ChildMI.Caption=child' + #13#10 +
      'ColumnHeaderMI.Caption=Kolom kop' + #13#10 +
      'ColumnFooterMI.Caption=Kolom voet' + #13#10 +
      'OverlayMI.Caption=Overlappen' + #13#10 +
      'VerticalbandsMI.Caption=Verticale banden' + #13#10 +
      'HeaderMI1.Caption=Kop' + #13#10 +
      'FooterMI1.Caption=Voet' + #13#10 +
      'MasterDataMI1.Caption=Master gegevens' + #13#10 +
      'DetailDataMI1.Caption=Detail gegevens' + #13#10 +
      'SubdetailDataMI1.Caption=Subdetail gegevens' + #13#10 +
      'GroupHeaderMI1.Caption=Groep kop' + #13#10 +
      'GroupFooterMI1.Caption=Groep voet' + #13#10 +
      'ChildMI1.Caption=child' + #13#10 +
      'R0MI.Caption=0°' + #13#10 +
      'R45MI.Caption=45°' + #13#10 +
      'R90MI.Caption=90°' + #13#10 +
      'R180MI.Caption=180°' + #13#10 +
      'R270MI.Caption=270°' + #13#10 +
      'FontB.Hint=Lettertype instellingen' + #13#10 +
      'BoldMI.Caption=Vet' + #13#10 +
      'ItalicMI.Caption=Cursief' + #13#10 +
      'UnderlineMI.Caption=Onderstreept' + #13#10 +
      'SuperScriptMI.Caption=SuperScript' + #13#10 +
      'SubScriptMI.Caption=SubScript' + #13#10 +
      'CondensedMI.Caption=Gecomprimeerd' + #13#10 +
      'WideMI.Caption=Breed' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'OpenDialog.Filter=Rapport (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=Pascal bestanden (*.pas)|*.pas|C++ files (*.cpp)|*.cpp|JavaScript bestanden (*.js)|*.js|Basic bestanden (*.vb)|*.vb|Alle bestanden|*.*' + #13#10 +
      'SaveScriptDialog.Filter=Pascal bestanden (*.pas)|*.pas|C++ files (*.cpp)|*.cpp|JavaScript bestanden (*.js)|*.js|Basic bestanden (*.vb)|*.vb|Alle bestanden|*.*' + #13#10 +
      '');
    Add('dsCm', 'Centimeters');
    Add('dsInch', 'Inches');
    Add('dsPix', 'Pixels');
    Add('dsChars', 'Tekens');
    Add('dsCode', 'Code');
    Add('dsPage', 'Pagina');
    Add('dsRepFilter', 'Rapport (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'Gecomprimeerd rapport (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', 'Wijzigingen in voorbeeld pagina opslaan?');
    Add('dsSaveChangesTo', 'Wijzigingen opslaan in ');
    Add('dsCantLoad', 'Bestand kon niet geladen worden');
    Add('dsStyleFile', 'Stijl');
    Add('dsCantFindProc', 'Kon de main procedure niet vinden');
    Add('dsClearScript', 'Dit zal alle code wissen. Wil je hiermee doorgaan?');
    Add('dsNoStyle', 'Geen stijl');
    Add('dsStyleSample', 'Stijl voorbeeld');
    Add('dsTextNotFound', 'Tekst ''%s'' niet gevonden');
    Add('dsReplace', 'Vervang deze verschijning van ''%s''?');

    Add('TfrxAboutForm',
      'Caption=Over FastReport' + #13#10 +
      'Label4.Caption=Zie de website voor meer informatie:' + #13#10 +
      'Label6.Caption=Verkoop:' + #13#10 +
      'Label8.Caption=Support:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Pagina opties' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      'TabSheet1.Caption=Papier' + #13#10 +
      'Label1.Caption=Breedte' + #13#10 +
      'Label2.Caption=Hoogte' + #13#10 +
      'Label11.Caption=Formaat   ' + #13#10 +
      'Label12.Caption=Oriëntatie   ' + #13#10 +
      'Label3.Caption=Links' + #13#10 +
      'Label4.Caption=Boven' + #13#10 +
      'Label5.Caption=Rechts' + #13#10 +
      'Label6.Caption=Onder' + #13#10 +
      'Label13.Caption=Marges   ' + #13#10 +
      'Label14.Caption=Papier bron   ' + #13#10 +
      'Label9.Caption=Eerste pagina' + #13#10 +
      'Label10.Caption=Overige pagina''s' + #13#10 +
      'PortraitRB.Caption=Staand' + #13#10 +
      'LandscapeRB.Caption=Liggend' + #13#10 +
      'TabSheet3.Caption=Overige opties' + #13#10 +
      'Label7.Caption=Kolommen   ' + #13#10 +
      'Label8.Caption=Aantal' + #13#10 +
      'Label15.Caption=Breedte' + #13#10 +
      'Label16.Caption=Posities' + #13#10 +
      'Label17.Caption=Anders   ' + #13#10 +
      'Label18.Caption=Dubbelzijdig' + #13#10 +
      'PrintOnPrevCB.Caption=Afdrukken op vorige pagina' + #13#10 +
      'MirrorMarginsCB.Caption=Marges spiegelen' + #13#10 +
      'LargeHeightCB.Caption=Grote hoogte in ontwerp modus' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Selecteer Rapport datasets' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Bewerk variabelen' + #13#10 +
      'NewCategoryB.Caption=Categorie' + #13#10 +
      'NewVarB.Caption=Variabele' + #13#10 +
      'EditB.Caption=Bewerken' + #13#10 +
      'DeleteB.Caption=Verwijderen' + #13#10 +
      'EditListB.Caption=Lijst' + #13#10 +
      'LoadB.Caption=Laden' + #13#10 +
      'SaveB.Caption=Opslaan' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'ExprPanel.Caption= Expressie:' + #13#10 +
      'OpenDialog1.Filter=Dictionary (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Dictionary (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(geen variabelen gedefinieerd)');
    Add('vaVar', 'Variabelen');
    Add('vaDupName', 'Dubbele naam');

    Add('TfrxOptionsEditor',
      'Caption=Ontwerp opties' + #13#10 +
      'Label1.Caption=Raster   ' + #13#10 +
      'Label2.Caption=Type' + #13#10 +
      'Label3.Caption=Formaat' + #13#10 +
      'Label4.Caption=Dialoog form:' + #13#10 +
      'Label5.Caption=Anders   ' + #13#10 +
      'Label6.Caption=Lettertypen   ' + #13#10 +
      'Label7.Caption=Code venster' + #13#10 +
      'Label8.Caption=Tekst bewerker' + #13#10 +
      'Label9.Caption=Formaat' + #13#10 +
      'Label10.Caption=Formaat' + #13#10 +
      'Label11.Caption=Kleuren   ' + #13#10 +
      'Label12.Caption=Afstand tussen banden:' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=in' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      'CMRB.Caption=Centimeters:' + #13#10 +
      'InchesRB.Caption=Inches:' + #13#10 +
      'PixelsRB.Caption=Pixels:' + #13#10 +
      'ShowGridCB.Caption=Raster weergeven' + #13#10 +
      'AlignGridCB.Caption=Uitlijnen op het raster' + #13#10 +
      'EditAfterInsCB.Caption=Toon het bewerkingsgereedschap na het invoegen' + #13#10 +
      'ObjectFontCB.Caption=Gebruik lettertype van object' + #13#10 +
      'WorkspaceB.Caption=Werkruimte' + #13#10 +
      'ToolB.Caption=Gereedschap vensters' + #13#10 +
      'LCDCB.Caption=LCD raster kleur' + #13#10 +
      'FreeBandsCB.Caption=Vrije band plaatsing' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Standaard waarden' + #13#10 +
      'BandsCaptionsCB.Caption=Toon band bijschriften' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=Selecteer dataSet' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      '');
    Add('dbNotAssigned', '[niet toegewezen]');
    Add('dbSingleLine', 'Enkele rij');

    Add('TfrxGroupEditorForm',
      'Caption=Groeperen' + #13#10 +
      'BreakOnL.Caption=Verbreken op   ' + #13#10 +
      'OptionsL.Caption=Opties   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      'DataFieldRB.Caption=Gegevens veld' + #13#10 +
      'ExpressionRB.Caption=Expressie' + #13#10 +
      'KeepGroupTogetherCB.Caption=Hou de groep bijelkaar' + #13#10 +
      'StartNewPageCB.Caption=Start met een nieuwe pagina' + #13#10 +
      'OutlineCB.Caption=In inhoudsopgave tonen' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=Systeem Memo' + #13#10 +
      'DataBandL.Caption=Gegevens band' + #13#10 +
      'DataSetL.Caption=DataSet' + #13#10 +
      'DataFieldL.Caption=Gegevens veld' + #13#10 +
      'FunctionL.Caption=Functie' + #13#10 +
      'ExpressionL.Caption=Expressie' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      'AggregateRB.Caption=Berekende waarde' + #13#10 +
      'SysVariableRB.Caption=Systeem variabele' + #13#10 +
      'CountInvisibleCB.Caption=Tel de onzichtbare banden' + #13#10 +
      'TextRB.Caption=Tekst' + #13#10 +
      'RunningTotalCB.Caption=Tussen totaal' + #13#10 +
      '');
    Add('agAggregate', 'Opsomming invoegen');
    Add('vt1', '[DATE]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGES#]');
    Add('vt5', '[PAGE#] of [TOTALPAGES#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=OLE Object' + #13#10 +
      'InsertB.Caption=Invoegen...' + #13#10 +
      'EditB.Caption=Bewerken...' + #13#10 +
      'CloseB.Caption=Sluiten' + #13#10 +
      '');
    Add('olStretched', 'Uitgerekt');

    Add('TfrxBarcodeEditorForm',
      'Caption=Barcode Editor' + #13#10 +
      'CodeLbl.Caption=Code' + #13#10 +
      'TypeLbl.Caption=Type van de Bar' + #13#10 +
      'ZoomLbl.Caption=Zoom:' + #13#10 +
      'OptionsLbl.Caption=Opties   ' + #13#10 +
      'RotationLbl.Caption=Rotatie   ' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CalcCheckSumCB.Caption=Checksum berekenen ' + #13#10 +
      'ViewTextCB.Caption=Tekst' + #13#10 +
      'Rotation0RB.Caption=0°' + #13#10 +
      'Rotation90RB.Caption=90°' + #13#10 +
      'Rotation180RB.Caption=180°' + #13#10 +
      'Rotation270RB.Caption=270°' + #13#10 +
      '');
    Add('bcCalcChecksum', 'CheckSum berekenen');
    Add('bcShowText', 'Tekst tonen');

    Add('TfrxAliasesEditorForm',
      'Caption=Bewerk aliasen' + #13#10 +
      'HintL.Caption=Druk op Enter om het item te bewerken' + #13#10 +
      'DSAliasL.Caption=Dataset alias' + #13#10 +
      'FieldAliasesL.Caption=Veld aliases' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      'ResetB.Caption=Opnieuw' + #13#10 +
      'UpdateB.Caption=Update' + #13#10 +
      '');
    Add('alUserName', 'Gebruikers naam');
    Add('alOriginal', 'Originele naam');

    Add('TfrxParamsEditorForm',
      'Caption=Parameters Editor' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      '');
    Add('qpName', 'Naam');
    Add('qpDataType', 'Data Type');
    Add('qpValue', 'Waarde');

    Add('TfrxMDEditorForm',
      'Caption=Master-Detail link' + #13#10 +
      'Label1.Caption=Detail velden' + #13#10 +
      'Label2.Caption=Master velden' + #13#10 +
      'Label3.Caption=Linked velden' + #13#10 +
      'AddB.Caption=Toevoegen' + #13#10 +
      'ClearB.Caption=Wissen' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=Memo' + #13#10 +
      'ExprB.Hint=Expression invoegen' + #13#10 +
      'AggregateB.Hint=Berekening invoegen' + #13#10 +
      'LocalFormatB.Hint=Opmaak invoegen' + #13#10 +
      'WordWrapB.Hint=Woorden afbreken' + #13#10 +
      'CancelB.Hint=Annuleren' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=Afbeelding' + #13#10 +
      'LoadB.Hint=Laden' + #13#10 +
      'CopyB.Hint=Kopiëren' + #13#10 +
      'PasteB.Hint=Plakken' + #13#10 +
      'ClearB.Hint=Wissen' + #13#10 +
      'CancelB.Hint=Annuleren' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('piEmpty', 'Leeg');

    Add('TfrxChartEditorForm',
      'Caption=Chart Editor' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=Series toevoegen' + #13#10 +
      'DeleteB.Hint=Series verwijderen' + #13#10 +
      'DBSourceRB.Caption=Gegevens uit de DB' + #13#10 +
      'BandSourceRB.Caption=Band bron' + #13#10 +
      'FixedDataRB.Caption=Vaste gegevens' + #13#10 +
      'DatasetLbl.Caption=Dataset' + #13#10 +
      'BandLbl.Caption=Gegevens band' + #13#10 +
      'X1Lbl.Caption=X waarden' + #13#10 +
      'Y1Lbl.Caption=Y waarden' + #13#10 +
      'X2Lbl.Caption=X waarden' + #13#10 +
      'Y2Lbl.Caption=Y waarden' + #13#10 +
      'X3Lbl.Caption=X waarden (bijvoorbeeld, a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Y waarden (bijvoorbeeld, 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Overige opties   ' + #13#10 +
      'ShowTopLbl.Caption=TopN waarden' + #13#10 +
      'CaptionLbl.Caption=TopN bijschrift' + #13#10 +
      'SortLbl.Caption=Sorteervolgorde' + #13#10 +
      'LineMI.Caption=Lijn' + #13#10 +
      'AreaMI.Caption=Gebied' + #13#10 +
      'PointMI.Caption=Punt' + #13#10 +
      'BarMI.Caption=Bar' + #13#10 +
      'HorizBarMI.Caption=Horizontale balk' + #13#10 +
      'PieMI.Caption=Taart' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Fast Line' + #13#10 +
      '');
    Add('ch3D', '3D beeld');
    Add('chAxis', 'As tonen');
    Add('chsoNone', 'Geen');
    Add('chsoAscending', 'Oplopend');
    Add('chsoDescending', 'Aflopend');

    Add('TfrxRichEditorForm',
      'Caption=Rich Editor' + #13#10 +
      'OpenB.Hint=Bestand openen' + #13#10 +
      'SaveB.Hint=Bestand opslaan' + #13#10 +
      'UndoB.Hint=Ongedaan maken' + #13#10 +
      'TTB.Hint=Lettertype' + #13#10 +
      'ExprB.Hint=Expressie invoegen' + #13#10 +
      'CancelB.Hint=Annuleren' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      'BoldB.Hint=Vet' + #13#10 +
      'ItalicB.Hint=Cursief' + #13#10 +
      'UnderlineB.Hint=Onderstreept' + #13#10 +
      'LeftAlignB.Hint=Links uitlijnen' + #13#10 +
      'CenterAlignB.Hint=Horizontaal centreren' + #13#10 +
      'RightAlignB.Hint=Rechts uitlijnen' + #13#10 +
      'BlockAlignB.Hint=Uitvullen' + #13#10 +
      'BulletsB.Hint=Opsommingstekens' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Cross-tab Editor' + #13#10 +
      'DatasetL.Caption=Brongegevens   ' + #13#10 +
      'DimensionsL.Caption=Dimensies   ' + #13#10 +
      'RowsL.Caption=Rijen' + #13#10 +
      'ColumnsL.Caption=Kolommen' + #13#10 +
      'CellsL.Caption=Cellen' + #13#10 +
      'StructureL.Caption=Kruistabel structuur   ' + #13#10 +
      'RowHeaderCB.Caption=Rij kop' + #13#10 +
      'ColumnHeaderCB.Caption=Kolom kop' + #13#10 +
      'RowTotalCB.Caption=Rij totaal' + #13#10 +
      'ColumnTotalCB.Caption=Kolom totaal' + #13#10 +
      'SwapB.Hint=Rijen en kolommen omwisselen' + #13#10 +
      'StyleCB.Hint=Kruistabel stijl' + #13#10 +
      'FontB.Hint=Lettertype instellingen' + #13#10 +
      'AlignLeftB.Hint=Links uitlijnen' + #13#10 +
      'AlignCenterB.Hint=Horizontaal centreren' + #13#10 +
      'AlignRightB.Hint=Rechts uitlijnen' + #13#10 +
      'RotationB.Hint=Tekst rotatie' + #13#10 +
      'HighlightB.Hint=Markeren' + #13#10 +
      'FormatB.Hint=Formaat' + #13#10 +
      'FrameB.Hint=Kaderlijninstellingen' + #13#10 +
      'FillColorB.Hint=Opvulkleur' + #13#10 +
      'Func1MI.Caption=Geen' + #13#10 +
      'Func2MI.Caption=Som' + #13#10 +
      'Func3MI.Caption=Min' + #13#10 +
      'Func4MI.Caption=Max' + #13#10 +
      'Func5MI.Caption=Gemiddelde' + #13#10 +
      'Func6MI.Caption=Aantal' + #13#10 +
      'Sort1MI.Caption=Oplopend (A-Z)' + #13#10 +
      'Sort2MI.Caption=Aflopend (Z-A)' + #13#10 +
      'Sort3MI.Caption=Geen sortering' + #13#10 +
      'BoldMI.Caption=Vet' + #13#10 +
      'ItalicMI.Caption=Cursief' + #13#10 +
      'UnderlineMI.Caption=Onderstreept' + #13#10 +
      'SuperScriptMI.Caption=SuperScript' + #13#10 +
      'SubScriptMI.Caption=SubScript' + #13#10 +
      'CondensedMI.Caption=Gecomprimeerd' + #13#10 +
      'WideMI.Caption=Breed' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=Annuleren' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('crSubtotal', 'Subtotaal');
    Add('crNone', 'Geen');
    Add('crSum', 'Som');
    Add('crMin', 'Min');
    Add('crMax', 'Max');
    Add('crAvg', 'Gem');
    Add('crCount', 'Aantal');
    Add('crAsc', 'A-Z');
    Add('crDesc', 'Z-A');
    Add('crRepHdrs', 'Koppen opnieuw afdrukken');
    Add('crBorder', 'Kader');
    Add('crDown', 'Verticaal, vervolgens horizontaal');

    Add('TfrxExprEditorForm',
      'Caption=Expressie Editor' + #13#10 +
      'ExprL.Caption=Expressie:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=Toon formaat' + #13#10 +
      'CategoryL.Caption=Categorie' + #13#10 +
      'FormatL.Caption=Formaat' + #13#10 +
      'FormatStrL.Caption=Tekenreeks formaat:' + #13#10 +
      'SeparatorL.Caption=Decimale scheidingsteken:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      '');
    Add('fkText', 'Tekst (geen formattering)');
    Add('fkNumber', 'Getal');
    Add('fkDateTime', 'Datum/Tijd');
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
    Add('fkBoolean2', 'Nee,Ja;Nee,Ja');
    Add('fkBoolean3', '_,x;_,x');
    Add('fkBoolean4', 'Onwaar,Waar;Onwaar,Waar');

    Add('TfrxHighlightEditorForm',
      'Caption=Markeren' + #13#10 +
      'FontColorB.Caption=Kleur...' + #13#10 +
      'BackColorB.Caption=Kleur...' + #13#10 +
      'ConditionL.Caption=Conditie   ' + #13#10 +
      'FontL.Caption=Lettertype   ' + #13#10 +
      'BackgroundL.Caption=Achtergrond   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      'BoldCB.Caption=Vet' + #13#10 +
      'ItalicCB.Caption=Cursief' + #13#10 +
      'UnderlineCB.Caption=Onderstreept' + #13#10 +
      'TransparentRB.Caption=Transparant' + #13#10 +
      'OtherRB.Caption=Overig' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Rapport instellingen' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      'GeneralTS.Caption=Algemeen' + #13#10 +
      'ReportSettingsL.Caption=Printer instellingen   ' + #13#10 +
      'CopiesL.Caption=Kopieën' + #13#10 +
      'GeneralL.Caption=Algemeen   ' + #13#10 +
      'PasswordL.Caption=Wachtwoord' + #13#10 +
      'CollateCB.Caption=Kopieën groeperen' + #13#10 +
      'DoublePassCB.Caption=Dubbele stap' + #13#10 +
      'PrintIfEmptyCB.Caption=Afdrukken indien leeg' + #13#10 +
      'DescriptionTS.Caption=Beschrijving' + #13#10 +
      'NameL.Caption=Naam' + #13#10 +
      'Description1L.Caption=Beschrijving' + #13#10 +
      'PictureL.Caption=Afbeelding' + #13#10 +
      'AuthorL.Caption=Auteur' + #13#10 +
      'MajorL.Caption=Major' + #13#10 +
      'MinorL.Caption=Minor' + #13#10 +
      'ReleaseL.Caption=Release' + #13#10 +
      'BuildL.Caption=Build' + #13#10 +
      'CreatedL.Caption=Gecreëerd' + #13#10 +
      'ModifiedL.Caption=Gewijzigd' + #13#10 +
      'DescriptionL.Caption=Beschrijving   ' + #13#10 +
      'VersionL.Caption=Versie   ' + #13#10 +
      'PictureB.Caption=Bladeren...' + #13#10 +
      '');
    Add('rePrnOnPort', 'aan');

    Add('TfrxStringsEditorForm',
      'Caption=Regels' + #13#10 +
      'CancelB.Hint=Annuleren' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=Annuleren' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=Wachtwoord' + #13#10 +
      'PasswordL.Caption=Voer het wachtwoord in:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=Stijl bewerken' + #13#10 +
      'ColorB.Caption=Kleur...' + #13#10 +
      'FontB.Caption=Lettertype...' + #13#10 +
      'FrameB.Caption=Kaders...' + #13#10 +
      'AddB.Hint=Toevoegen' + #13#10 +
      'DeleteB.Hint=Verwijderen' + #13#10 +
      'EditB.Hint=Bewerken' + #13#10 +
      'LoadB.Hint=Laden' + #13#10 +
      'SaveB.Hint=Opslaan' + #13#10 +
      'CancelB.Hint=Annuleren' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=Kaders bewerken' + #13#10 +
      'FrameL.Caption=Kader' + #13#10 +
      'LineL.Caption=Kaderlijn' + #13#10 +
      'ShadowL.Caption=Schaduw' + #13#10 +
      'FrameTopB.Hint=Boven kader' + #13#10 +
      'FrameBottomB.Hint=Onder kader' + #13#10 +
      'FrameLeftB.Hint=Linker kader' + #13#10 +
      'FrameRightB.Hint=Rechter kader' + #13#10 +
      'FrameAllB.Hint=Alle kaders' + #13#10 +
      'FrameNoB.Hint=Geen kaders' + #13#10 +
      'FrameColorB.Hint=Kaderlijnkleur' + #13#10 +
      'FrameStyleB.Hint=Kaderlijnstijl' + #13#10 +
      'FrameWidthCB.Hint=Kaderlijnbreedte' + #13#10 +
      'ShadowB.Hint=Schaduw' + #13#10 +
      'ShadowColorB.Hint=Schaduw kleur' + #13#10 +
      'ShadowWidthCB.Hint=Schaduw breedte' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=New Item' + #13#10 +
      'ItemsTab.Caption=Items' + #13#10 +
      'TemplatesTab.Caption=Templates' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Tab volgorde' + #13#10 +
      'Label1.Caption=Controls op tab volgorde:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      'UpB.Caption=Verplaats omhoog' + #13#10 +
      'DownB.Caption=Verplaats omlaag' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Evalueer' + #13#10 +
      'Label1.Caption=Expressie' + #13#10 +
      'Label2.Caption=Resultaat' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Rapport Wizard' + #13#10 +
      'DataTab.Caption=Gegevens' + #13#10 +
      'GroupsTab.Caption=Groepen' + #13#10 +
      'LayoutTab.Caption=Vormgeving' + #13#10 +
      'StyleTab.Caption=Stijl' + #13#10 +
      'Step1L.Caption=Stap 1. Selecteer de dataset en velden die getoond moeten worden.' + #13#10 +
      'Step2L.Caption=Stap 2. Creëer groepen (optioneel).' + #13#10 +
      'Step3L.Caption=Stap 3. Definieer de pagina oriëntatie en gegevens layout.' + #13#10 +
      'Step4L.Caption=Stap 4. Kies de rapport stijl.' + #13#10 +
      'AddFieldB.Caption=Toevoegen >' + #13#10 +
      'AddAllFieldsB.Caption=Alles toevoegen >>' + #13#10 +
      'RemoveFieldB.Caption=< Verwijderen' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Alles verwijderen' + #13#10 +
      'AddGroupB.Caption=Toevoegen >' + #13#10 +
      'RemoveGroupB.Caption=< Verwijderen' + #13#10 +
      'SelectedFieldsL.Caption=Geselecteerde velden:' + #13#10 +
      'AvailableFieldsL.Caption=Beschikbare velden:' + #13#10 +
      'GroupsL.Caption=Groepen:' + #13#10 +
      'OrientationL.Caption=Oriëntatie   ' + #13#10 +
      'LayoutL.Caption=Vormgeving   ' + #13#10 +
      'PortraitRB.Caption=Staand' + #13#10 +
      'LandscapeRB.Caption=Liggend' + #13#10 +
      'TabularRB.Caption=Tabelgewijs' + #13#10 +
      'ColumnarRB.Caption=Kolomgewijs' + #13#10 +
      'FitWidthCB.Caption=Maak velden passend binnen de pagina breedte' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      'BackB.Caption=<< Terug' + #13#10 +
      'NextB.Caption=Volgende >>' + #13#10 +
      'FinishB.Caption=Voltooien' + #13#10 +
      '');
    Add('wzStd', 'Standaard Rapport Wizard');
    Add('wzDMP', 'Dot-Matrix Rapport Wizard');
    Add('wzStdEmpty', 'Standaard Rapport');
    Add('wzDMPEmpty', 'Dot-Matrix Rapport');


    Add('ftAllFiles', 'Alle bestanden');
    Add('ftPictures', 'Afbeeldingen');
    Add('ftDB', 'Databases');
    Add('ftRichFile', 'Opgemaakt bestand');
    Add('ftTextFile', 'Tekst bestand');

    Add('prNotAssigned', '(Niet toegewezen)');
    Add('prInvProp', 'Ongeldige waarde voor deze eigenschap');
    Add('prDupl', 'Dubbele naam');
    Add('prPict', '(Afbeelding)');

    Add('mvExpr', 'Expressies toestaan');
    Add('mvStretch', 'Uitrekken');
    Add('mvStretchToMax', 'Uitrekken tot maximale hoogte');
    Add('mvShift', 'Verschuiven');
    Add('mvShiftOver', 'Verschuiven bij overlapping');
    Add('mvVisible', 'Zichtbaar');
    Add('mvPrintable', 'Afdrukbaar');
    Add('mvFont', 'Lettertype...');
    Add('mvFormat', 'Weergave formaat...');
    Add('mvClear', 'Inhoud wissen');
    Add('mvAutoWidth', 'Automatische breedte');
    Add('mvWWrap', 'Woorden afbreken');
    Add('mvSuppress', 'Onderdruk repeterende waarden');
    Add('mvHideZ', 'Verberg nullen');
    Add('mvHTML', 'HTML tags toestaan');
    Add('lvDiagonal', 'Diagonaal');
    Add('pvAutoSize', 'Automatische grootte');
    Add('pvCenter', 'Centreer');
    Add('pvAspect', 'Verhouding handhaven');
    Add('bvSplit', 'Splitsen over meerdere pagina''s toestaan');
    Add('bvKeepChild', 'Hou child en parent bij elkaar');
    Add('bvPrintChild', 'Druk child af indien onzichtbaar');
    Add('bvStartPage', 'Start nieuwe pagina');
    Add('bvPrintIfEmpty', 'Afdrukken indien detail band leeg is');
    Add('bvKeepDetail', 'Houd detail bands bij elkaar');
    Add('bvKeepFooter', 'Houd voettekst bij elkaar');
    Add('bvReprint', 'Opnieuw afdrukken op nieuwe pagina');
    Add('bvOnFirst', 'Afdrukken op eerste pagina');
    Add('bvOnLast', 'Afdrukken op laatste pagina');
    Add('bvKeepGroup', 'Houd bij elkaar');
    Add('bvFooterAfterEach', 'Voettekst afdrukken na iedere regel');
    Add('srParent', 'Afdrukken op Parent');
    Add('bvKeepHeader', 'Houd kopteksten bij elkaar');

    Add('obCatDraw', 'Tekenen');
    Add('obCatOther', 'Overige objecten');
    Add('obCatOtherControls', 'Overige controls');
    Add('obDiagLine', 'Diagonale lijn');
    Add('obRect', 'Rechthoek');
    Add('obRoundRect', 'Afgeronde rechthoek');
    Add('obEllipse', 'Ellips');
    Add('obTrian', 'Driehoek');
    Add('obDiamond', 'Diamant');
    Add('obLabel', 'Label control');
    Add('obEdit', 'Invoerveld control');
    Add('obMemoC', 'Tekstveld control');
    Add('obButton', 'Knop control');
    Add('obChBoxC', 'Vinkveld control');
    Add('obRButton', 'Radioknop control');
    Add('obLBox', 'Lijstveld control');
    Add('obCBox', 'Combiveld control');
    Add('obDateEdit', 'Datumveld control');
    Add('obImageC', 'Afbeelding control');
    Add('obPanel', 'Paneel control');
    Add('obGrBox', 'Groepskader control');
    Add('obBBtn', 'Afbeeldingsknop control');
    Add('obSBtn', 'Werkbalkknop control');
    Add('obMEdit', 'Gemaskerde invoerveld control');
    Add('obChLB', 'Vinkveld lijst control');
    Add('obDBLookup', 'DBLookupComboBox control');
    Add('obBevel', 'Rand object');
    Add('obShape', 'Vorm object');
    Add('obText', 'Tekst object');
    Add('obSysText', 'Systeem tekst');
    Add('obLine', 'Lijn object');
    Add('obPicture', 'Afbeelding object');
    Add('obBand', 'Band object');
    Add('obDataBand', 'Gegevens band');
    Add('obSubRep', 'Subrapport object');
    Add('obDlgPage', 'Dialoog formulier');
    Add('obRepPage', 'Rapport pagina');
    Add('obReport', 'Rapport object');
    Add('obRich', 'RichText object');
    Add('obOLE', 'OLE object');
    Add('obChBox', 'Vinkveld object');
    Add('obChart', 'Grafiek object');
    Add('obBarC', 'Barcode object');
    Add('obCross', 'Kruistabel object');
    Add('obDBCross', 'DB kruistabel object');
    Add('obGrad', 'Raster object');
    Add('obDMPText', 'Dot-matrix tekst object');
    Add('obDMPLine', 'Dot-matrix lijn object');
    Add('obBDEDB', 'BDE Database');
    Add('obBDETb', 'BDE Tabel');
    Add('obBDEQ', 'BDE Query');
    Add('obBDEComps', 'BDE componenten');
    Add('obIBXDB', 'IBX Database');
    Add('obIBXTb', 'IBX Tabel');
    Add('obIBXQ', 'IBX Query');
    Add('obIBXComps', 'IBX componenten');
    Add('obADODB', 'ADO Database');
    Add('obADOTb', 'ADO Tabel');
    Add('obADOQ', 'ADO Query');
    Add('obADOComps', 'ADO componenten');
    Add('obDBXDB', 'DBX Database');
    Add('obDBXTb', 'DBX Tabel');
    Add('obDBXQ', 'DBX Query');
    Add('obDBXComps', 'DBX Componenten');

    Add('ctString', 'Tekenreeks');
    Add('ctDate', 'Datum en tijd');
    Add('ctConv', 'Conversies');
    Add('ctFormat', 'Formattering');
    Add('ctMath', 'Mathematisch');
    Add('ctOther', 'Overig');

    Add('IntToStr', 'Converteert een integer waarde in een tekenreeks');
    Add('FloatToStr', 'Converteert een decimaal getal in een tekenreeks');
    Add('DateToStr', 'Converteert een datum in een tekenreeks');
    Add('TimeToStr', 'Converteert een tijd in een tekenreeks');
    Add('DateTimeToStr', 'Converteert een datum-en-tijd waarde in een tekenreeks');
    Add('VarToStr', 'Converteert een variant waarde in een tekenreeks');
    Add('StrToInt', 'Converteert een tekenreeks in een integer waarde');
    Add('StrToFloat', 'Converteert een tekenreeks in een decimaal getal');
    Add('StrToDate', 'Converteert een tekenreeks in een datumformaat');
    Add('StrToTime', 'Converteert een tekenreeks in een tijdformaat');
    Add('StrToDateTime', 'Converteert een tekenreeks in een datum-en-tijd formaat');
    Add('Format', 'Geeft een geformatteerde tekenreeks terug die is opgebouwd uit een serie array waarden');
    Add('FormatFloat', 'Formatteert een decimaal getal');
    Add('FormatDateTime', 'Formatteert een datum-en-tijd waarde');
    Add('FormatMaskText', 'Formatteert een tekenreeks m.b.v. een invoer masker');
    Add('EncodeDate', 'Geeft een TDateTime type terug voor een bepaald jaar, maand en dag');
    Add('DecodeDate', 'Verdeekt een TDateTime in jaar, maand en dag waarden');
    Add('EncodeTime', 'Geeft een TDateTime type terug voor een bepaald uur, minuut, seconde en milliseconde');
    Add('DecodeTime', 'Verdeelt een TDateTime in uren, minuten, secondes en millisecondes');
    Add('Date', 'Geeft de huidige datume terug');
    Add('Time', 'Geeft de huidige tijd terug');
    Add('Now', 'Geeft de huidige datum en tijd terug');
    Add('DayOfWeek', 'Geeft de dag van de week terug voor een bepaalde datum');
    Add('IsLeapYear', 'Geeft aan of een bepaald jaar een schrikkeljaar is');
    Add('DaysInMonth', 'Geeft het aantal dagen in een bepaalde maand terug');
    Add('Length', 'Geeft de lengte van een tekenreeks terug');
    Add('Copy', 'Geeft een deel van een tekenreeks terug');
    Add('Pos', 'Geeft een positie van een tekenreeks in een andere tekenreeks terug');
    Add('Delete', 'Verwijdert een tekenreeks uit een andere tekenreeks');
    Add('Insert', 'Voegt een tekenreeks in een andere tekenreeks in');
    Add('Uppercase', 'Converteert alle tekens in een tekenreeks in hoofdletters');
    Add('Lowercase', 'Converteert alle tekens in een tekenreeks in kleine letters');
    Add('Trim', 'Verwijdert alle linker en rechter spaties van een tekenreeks');
    Add('NameCase', 'Converteert het eerste teken van een woord in een hoofdletter');
    Add('CompareText', 'Vergelijkt twee tekenreeksen');
    Add('Chr', 'Converteert een geheel getal in een karakter');
    Add('Ord', 'Converteert een karakter in een geheel getal');
    Add('SetLength', 'Stelt de lengte van een tekenreeks in');
    Add('Round', 'Rondt een decimal getal af op het dichtstbijzijnde gehele getal');
    Add('Trunc', 'Kapt een deciaal getal af tot een geheel getal');
    Add('Int', 'Geeft het gehele getal deel terug van een decimaal getal');
    Add('Frac', 'Geeft het decimale deel terug van een decimaal getal');
    Add('Sqrt', 'Geeft de vierkantswortel van een bepaald getal terug');
    Add('Abs', 'Geeft een absoluut getal terug');
    Add('Sin', 'Geeft de sinuswaarde van een hoek terug (in radialen)');
    Add('Cos', 'Geeft de cosinuswaarde van een hoek terug (in radialen)');
    Add('ArcTan', 'Geeft de arctangeswaarde terug');
    Add('Tan', 'Geeft de tangenswaarde terug');
    Add('Exp', 'Geeft de exponentiële waarde terug');
    Add('Ln', 'Geeft de N-Log van een reële expressie terug');
    Add('Pi', 'Geeft het 3.1415926... getal terug');
    Add('Inc', 'Verhoogt een waarde met 1');
    Add('Dec', 'Verlaagt een waarde met 1');
    Add('RaiseException', 'Toont een exceptie melding');
    Add('ShowMessage', 'Toont een bericht kader');
    Add('Randomize', 'Start de willekeurig getal generator');
    Add('Random', 'Geeft een willekeurig getal terug');
    Add('ValidInt', 'Geeft de waarde WAAR terug indien de opgegeven tekenreeks een geldig geheel getal is');
    Add('ValidFloat', 'Geeft de waarde WAAR terug indien de opgegeven tekenreeks een geldig decimaal getal is');
    Add('ValidDate', 'Geeft de waarde WAAR terug indien de opgegeven tekenreeks een geldige datum is');
    Add('IIF', 'Geeft het WAAR-deel terug indien de opgegeven expressie WAAR is, ander wordt het ONWAAR-deel terug gegeven');
    Add('Get', 'Uitsluitend voor intern gebruik');
    Add('Set', 'Uitsluitend voor intern gebruik');
    Add('InputBox', 'Toont een invoer dialoog waarmee de gebruiker een tekenreeks kan invoeren');
    Add('InputQuery', 'Toont een invoer dialoog waarmee de gebruiker een tekenreeks kan invoeren');
    Add('MessageDlg', 'Toont een bericht dialoog');
    Add('CreateOleObject', 'Creëert een OLE object');
    Add('VarArrayCreate', 'Creëert een variant array');
    Add('VarType', 'Geeft het type van een variant waarde terug');
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