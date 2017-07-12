
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
      'Caption=Objekt inspektor' + #13#10 +
      '');
    Add('oiProp', 'Vlastnosti');
    Add('oiEvent', 'Události');

    Add('TfrxDataTreeForm',
      'Caption=Strom dat' + #13#10 +
      'DataTS.Caption=Data' + #13#10 +
      'VariablesTS.Caption=Promìnné' + #13#10 +
      'FunctionsTS.Caption=Funkce' + #13#10 +
      'InsFieldCB.Caption=Vytvoøit pole' + #13#10 +
      'InsCaptionCB.Caption=Vytvoøit nadpis' + #13#10 +
      '');
    Add('dtNoData', 'Nedostupná data');
    Add('dtData', 'Data');
    Add('dtSysVar', 'Systémové promìnné');
    Add('dtVar', 'Promìnné');
    Add('dtFunc', 'Funkce');

    Add('TfrxReportTreeForm',
      'Caption=Strom Reportu' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Otevøít soubor skriptu' + #13#10 +
      'SaveScriptB.Hint=Uložit soubor skriptu' + #13#10 +
      'RunScriptB.Hint=Spustit skript' + #13#10 +
      'StepScriptB.Hint=Trasovat do' + #13#10 +
      'StopScriptB.Hint=Pøerušit skript' + #13#10 +
      'EvaluateB.Hint=Vyhodnotit' + #13#10 +
      'LangL.Caption=Jazyk:' + #13#10 +
      'AlignTB.Caption=Zarovnání' + #13#10 +
      'AlignLeftsB.Hint=Zarovnat vlevo' + #13#10 +
      'AlignHorzCentersB.Hint=Vystøedit vodorovnì' + #13#10 +
      'AlignRightsB.Hint=Zarovnat Vpravo' + #13#10 +
      'AlignTopsB.Hint=Zarovnat nahoru' + #13#10 +
      'AlignVertCentersB.Hint=Vystøedit svisle' + #13#10 +
      'AlignBottomsB.Hint=Zarovnat dolù' + #13#10 +
      'SpaceHorzB.Hint=Vodorovnì mezera' + #13#10 +
      'SpaceVertB.Hint=Svisle mezera' + #13#10 +
      'CenterHorzB.Hint=Vystøedit vodorovnì v pruhu' + #13#10 +
      'CenterVertB.Hint=Vystøedit svisle v pruhu' + #13#10 +
      'SameWidthB.Hint=Stejná šíøka' + #13#10 +
      'SameHeightB.Hint=Stejná výška' + #13#10 +
      'TextTB.Caption=Text' + #13#10 +
      'StyleCB.Hint=Styl' + #13#10 +
      'FontNameCB.Hint=Název písma' + #13#10 +
      'FontSizeCB.Hint=Velikost písma' + #13#10 +
      'BoldB.Hint=Tuèné' + #13#10 +
      'ItalicB.Hint=Kurzíva' + #13#10 +
      'UnderlineB.Hint=Podtržené' + #13#10 +
      'FontColorB.Hint=Barva písma' + #13#10 +
      'HighlightB.Hint=Zvýraznìní' + #13#10 +
      'RotateB.Hint=Otoèení textu' + #13#10 +
      'TextAlignLeftB.Hint=Zarovnat vlevo' + #13#10 +
      'TextAlignCenterB.Hint=Vystøedit vodorovnì' + #13#10 +
      'TextAlignRightB.Hint=Zarovnat Vpravo' + #13#10 +
      'TextAlignBlockB.Hint=Formátovat' + #13#10 +
      'TextAlignTopB.Hint=Zarovnat nahoru' + #13#10 +
      'TextAlignMiddleB.Hint=Vystøedit svisle' + #13#10 +
      'TextAlignBottomB.Hint=Zarovnat dolù' + #13#10 +
      'FrameTB.Caption=Rámeèek' + #13#10 +
      'FrameTopB.Hint=Èára nahoøe' + #13#10 +
      'FrameBottomB.Hint=Èára dole' + #13#10 +
      'FrameLeftB.Hint=Èára vlevo' + #13#10 +
      'FrameRightB.Hint=Èára vpravo' + #13#10 +
      'FrameAllB.Hint=Všechny èáry rámeèku' + #13#10 +
      'FrameNoB.Hint=Bez rámeèku' + #13#10 +
      'ShadowB.Hint=Stín' + #13#10 +
      'FillColorB.Hint=Barva pozadí' + #13#10 +
      'FrameColorB.Hint=Barva rámeèku' + #13#10 +
      'FrameStyleB.Hint=Barva stylu' + #13#10 +
      'FrameWidthCB.Hint=Šíøka rámeèku' + #13#10 +
      'StandardTB.Caption=Standardní' + #13#10 +
      'NewB.Hint=Nový Report' + #13#10 +
      'OpenB.Hint=Otevøít Report' + #13#10 +
      'SaveB.Hint=Uložit Report' + #13#10 +
      'PreviewB.Hint=Pøedtisk' + #13#10 +
      'NewPageB.Hint=Nová stránka Reportu' + #13#10 +
      'NewDialogB.Hint=Nová stránka dialogu' + #13#10 +
      'DeletePageB.Hint=Odstranit stránku' + #13#10 +
      'PageSettingsB.Hint=Nastavení stránky' + #13#10 +
      'VariablesB.Hint=Promìnné' + #13#10 +
      'CutB.Hint=Vystøihnout' + #13#10 +
      'CopyB.Hint=Kopírovat' + #13#10 +
      'PasteB.Hint=Vložit' + #13#10 +
      'SampleFormatB.Hint=Kopírovat formátování' + #13#10 +
      'UndoB.Hint=Zpìt' + #13#10 +
      'RedoB.Hint=Vpøed' + #13#10 +
      'ShowGridB.Hint=Zobrazit møížku' + #13#10 +
      'AlignToGridB.Hint=Zarovnat na møížku' + #13#10 +
      'SetToGridB.Hint=Pøizpùsobit k møížce' + #13#10 +
      'ScaleCB.Hint=Zvìtšení' + #13#10 +
      'ExtraToolsTB.Caption=Zvláštní nástroje' + #13#10 +
      'ObjectSelectB.Hint=Vybrat nástroj' + #13#10 +
      'HandToolB.Hint=Nástroj uchopení' + #13#10 +
      'ZoomToolB.Hint=Nástroj zvìtšení' + #13#10 +
      'TextToolB.Hint=Nástroj úpravy textu' + #13#10 +
      'FormatToolB.Hint=Nástroj kopírování formátu' + #13#10 +
      'ObjectBandB.Hint=Vložit pruh' + #13#10 +
      'FileMenu.Caption=&Soubor' + #13#10 +
      'EditMenu.Caption=Ú&prava' + #13#10 +
      'FindMI.Caption=Najít...' + #13#10 +
      'FindNextMI.Caption=Najít další' + #13#10 +
      'ReplaceMI.Caption=Nahradit...' + #13#10 +
      'ReportMenu.Caption=&Report' + #13#10 +
      'ReportDataMI.Caption=Data...' + #13#10 +
      'ReportSettingsMI.Caption=Nastavení...' + #13#10 +
      'ReportStylesMI.Caption=Styly...' + #13#10 +
      'ViewMenu.Caption=&Zobrazit' + #13#10 +
      'ToolbarsMI.Caption=Nástrojové lišty' + #13#10 +
      'StandardMI.Caption=Standardní' + #13#10 +
      'TextMI.Caption=Text' + #13#10 +
      'FrameMI.Caption=Rámeèek' + #13#10 +
      'AlignmentMI.Caption=Sada zarovnání' + #13#10 +
      'ToolsMI.Caption=Zvláštní nástroje' + #13#10 +
      'InspectorMI.Caption=Inspektor objektù' + #13#10 +
      'DataTreeMI.Caption=Strom dat' + #13#10 +
      'ReportTreeMI.Caption=Strom Reportu' + #13#10 +
      'ShowRulersMI.Caption=Mìøítka' + #13#10 +
      'ShowGuidesMI.Caption=Vodítka' + #13#10 +
      'DeleteGuidesMI.Caption=Odstranit vodítka' + #13#10 +
      'OptionsMI.Caption=Nastavení...' + #13#10 +
      'HelpMenu.Caption=&Nápovìda' + #13#10 +
      'HelpContentsMI.Caption=Obsah nápovìdy...' + #13#10 +
      'AboutMI.Caption=O FastReportu...' + #13#10 +
      'TabOrderMI.Caption=Záložka seøazení...' + #13#10 +
      'UndoCmd.Caption=Zpìt' + #13#10 +
      'RedoCmd.Caption=Vpøed' + #13#10 +
      'CutCmd.Caption=Vystøihnout' + #13#10 +
      'CopyCmd.Caption=Kopírovat' + #13#10 +
      'PasteCmd.Caption=Vložit' + #13#10 +
      'DeleteCmd.Caption=Odstranit' + #13#10 +
      'DeletePageCmd.Caption=Odstranit stránku' + #13#10 +
      'SelectAllCmd.Caption=Vybrat vše' + #13#10 +
      'EditCmd.Caption=Upravit...' + #13#10 +
      'BringToFrontCmd.Caption=Pøenést dopøedu' + #13#10 +
      'SendToBackCmd.Caption=Odeslat dozadu' + #13#10 +
      'NewItemCmd.Caption=Nový...' + #13#10 +
      'NewReportCmd.Caption=Nový Report' + #13#10 +
      'NewPageCmd.Caption=Nová stránka' + #13#10 +
      'NewDialogCmd.Caption=Nový dialog' + #13#10 +
      'OpenCmd.Caption=Otevøít...' + #13#10 +
      'SaveCmd.Caption=Uložit' + #13#10 +
      'SaveAsCmd.Caption=Uložit jako...' + #13#10 +
      'VariablesCmd.Caption=Promìnné...' + #13#10 +
      'PageSettingsCmd.Caption=Nastavení stránky...' + #13#10 +
      'PreviewCmd.Caption=Pøedtisk' + #13#10 +
      'ExitCmd.Caption=Ukonèit' + #13#10 +
      'ReportTitleMI.Caption=Název Reportu' + #13#10 +
      'ReportSummaryMI.Caption=Souhrn Reportu' + #13#10 +
      'PageHeaderMI.Caption=Záhlaví stránky' + #13#10 +
      'PageFooterMI.Caption=Zápatí stránky' + #13#10 +
      'HeaderMI.Caption=Záhlaví' + #13#10 +
      'FooterMI.Caption=Zápatí' + #13#10 +
      'MasterDataMI.Caption=Hlavní data' + #13#10 +
      'DetailDataMI.Caption=Podrobná data' + #13#10 +
      'SubdetailDataMI.Caption=Podøazená data' + #13#10 +
      'Data4levelMI.Caption=Data 4. úrovnì' + #13#10 +
      'Data5levelMI.Caption=Data 5. úrovnì' + #13#10 +
      'Data6levelMI.Caption=Data 6. úrovnì' + #13#10 +
      'GroupHeaderMI.Caption=Záhlaví skupiny' + #13#10 +
      'GroupFooterMI.Caption=Zápatí skupiny' + #13#10 +
      'ChildMI.Caption=Podøazená' + #13#10 +
      'ColumnHeaderMI.Caption=Záhlaví sloupce' + #13#10 +
      'ColumnFooterMI.Caption=Zápatí sloupce' + #13#10 +
      'OverlayMI.Caption=Pøekrytí' + #13#10 +
      'VerticalbandsMI.Caption=Svislý pruh' + #13#10 +
      'HeaderMI1.Caption=Záhlaví' + #13#10 +
      'FooterMI1.Caption=Zápatí' + #13#10 +
      'MasterDataMI1.Caption=Hlavní data' + #13#10 +
      'DetailDataMI1.Caption=Podrobná data' + #13#10 +
      'SubdetailDataMI1.Caption=Podøazená data' + #13#10 +
      'GroupHeaderMI1.Caption=Záhlaví skupiny' + #13#10 +
      'GroupFooterMI1.Caption=Zápatí skupiny' + #13#10 +
      'ChildMI1.Caption=Podøazená' + #13#10 +
      'R0MI.Caption=0°' + #13#10 +
      'R45MI.Caption=45°' + #13#10 +
      'R90MI.Caption=90°' + #13#10 +
      'R180MI.Caption=180°' + #13#10 +
      'R270MI.Caption=270°' + #13#10 +
      'FontB.Hint=Nastavení písma' + #13#10 +
      'BoldMI.Caption=Tuèné' + #13#10 +
      'ItalicMI.Caption=Kurzíva' + #13#10 +
      'UnderlineMI.Caption=Podtržené' + #13#10 +
      'SuperScriptMI.Caption=Horní index' + #13#10 +
      'SubScriptMI.Caption=Dolní index' + #13#10 +
      'CondensedMI.Caption=Stlaèené' + #13#10 +
      'WideMI.Caption=Široké' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'OpenDialog.Filter=Report (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=Soubory Pascal (*.pas)|*.pas|Soubory C++ (*.cpp)|*.cpp|Soubory JavaScript (*.js)|*.js|Soubory Basic (*.vb)|*.vb|Všechny soubory|*.*' + #13#10 +
      'SaveScriptDialog.Filter=Soubory Pascal (*.pas)|*.pas|Soubory C++ (*.cpp)|*.cpp|Soubory JavaScript (*.js)|*.js|Soubory Basic (*.vb)|*.vb|Všechny soubory|*.*' + #13#10 +
      '');
    Add('dsCm', 'Centimetry');
    Add('dsInch', 'Palce');
    Add('dsPix', 'Pixely');
    Add('dsChars', 'Znaky');
    Add('dsCode', 'Kód');
    Add('dsPage', 'Strana');
    Add('dsRepFilter', 'Report (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'Komprimovaný report (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', 'Uložit zmìny do stránky pøedtisku?');
    Add('dsSaveChangesTo', 'Uložit zmìny do ');
    Add('dsCantLoad', 'Nelze naèíst soubor');
    Add('dsStyleFile', 'Styl');
    Add('dsCantFindProc', 'Nelze nalézt hlavní proceduru');
    Add('dsClearScript', 'Toto vymaže celý kód. Chcete pokraèovat?');
    Add('dsNoStyle', 'Žádný styl');
    Add('dsStyleSample', 'Ukázka stylu');
    Add('dsTextNotFound', 'Text ''%s'' nenalezen');
    Add('dsReplace', 'Nahradit tuto událost ''%s''?');

    Add('TfrxAboutForm',
      'Caption=O FastReportu' + #13#10 +
      'Label4.Caption=Navštivte naši webstránku' + #13#10 +
      'pro více informací:' + #13#10 +
      'Label6.Caption=Prodej:' + #13#10 +
      'Label8.Caption=Podpora:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Nastavení stránky' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      'TabSheet1.Caption=Papír' + #13#10 +
      'Label1.Caption=Šíøka' + #13#10 +
      'Label2.Caption=Výška' + #13#10 +
      'Label11.Caption=Velikost   ' + #13#10 +
      'Label12.Caption=Orientace   ' + #13#10 +
      'Label3.Caption=Vlevo' + #13#10 +
      'Label4.Caption=Nahoøe' + #13#10 +
      'Label5.Caption=Vpravo' + #13#10 +
      'Label6.Caption=Dole' + #13#10 +
      'Label13.Caption=Okraje   ' + #13#10 +
      'Label14.Caption=Zdroj papíru   ' + #13#10 +
      'Label9.Caption=První stránka' + #13#10 +
      'Label10.Caption=Další stránky' + #13#10 +
      'PortraitRB.Caption=Na výšku' + #13#10 +
      'LandscapeRB.Caption=Na šíøku' + #13#10 +
      'TabSheet3.Caption=Další nastavení' + #13#10 +
      'Label7.Caption=Sloupce   ' + #13#10 +
      'Label8.Caption=Poèet' + #13#10 +
      'Label15.Caption=Šíøka' + #13#10 +
      'Label16.Caption=Pozice' + #13#10 +
      'Label17.Caption=Další   ' + #13#10 +
      'Label18.Caption=Duplex' + #13#10 +
      'PrintOnPrevCB.Caption=Tisk do pøedtisku' + #13#10 +
      'MirrorMarginsCB.Caption=Zrcadlit okraje' + #13#10 +
      'LargeHeightCB.Caption=Velká výška v módu úprav' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Vybrat Datasety Reportu' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Upravit promìnné' + #13#10 +
      'NewCategoryB.Caption=Kategorie' + #13#10 +
      'NewVarB.Caption=Promìnná' + #13#10 +
      'EditB.Caption=Upravit' + #13#10 +
      'DeleteB.Caption=Odstranit' + #13#10 +
      'EditListB.Caption=Seznam' + #13#10 +
      'LoadB.Caption=Naèíst' + #13#10 +
      'SaveB.Caption=Uložit' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'ExprPanel.Caption= Výraz:' + #13#10 +
      'OpenDialog1.Filter=Slovník (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Slovník (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(Nedefinované promìnné)');
    Add('vaVar', 'Promìnné');
    Add('vaDupName', 'Zdvojený název');

    Add('TfrxOptionsEditor',
      'Caption=Nastavení Návrháøe' + #13#10 +
      'Label1.Caption=Møížka   ' + #13#10 +
      'Label2.Caption=Typ' + #13#10 +
      'Label3.Caption=Velikost' + #13#10 +
      'Label4.Caption=Formuláø dialogu:' + #13#10 +
      'Label5.Caption=Další   ' + #13#10 +
      'Label6.Caption=Písma   ' + #13#10 +
      'Label7.Caption=Okno kódu' + #13#10 +
      'Label8.Caption=Editor memo' + #13#10 +
      'Label9.Caption=Velikost' + #13#10 +
      'Label10.Caption=Velikost' + #13#10 +
      'Label11.Caption=Barvy   ' + #13#10 +
      'Label12.Caption=Prostor mezi pruhy:' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=in' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      'CMRB.Caption=Centimetrù:' + #13#10 +
      'InchesRB.Caption=Palcù:' + #13#10 +
      'PixelsRB.Caption=Pixelù:' + #13#10 +
      'ShowGridCB.Caption=Zobrazit møížku' + #13#10 +
      'AlignGridCB.Caption=Zarovnat do møížky' + #13#10 +
      'EditAfterInsCB.Caption=Po vložení zobrazit editor' + #13#10 +
      'ObjectFontCB.Caption=Použít nastavení písma objektu' + #13#10 +
      'WorkspaceB.Caption=Pracovní plocha' + #13#10 +
      'ToolB.Caption=Okna nástrojù' + #13#10 +
      'LCDCB.Caption=Barva møížky LCD' + #13#10 +
      'FreeBandsCB.Caption=Volné umísování pruhù' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Obnovit základní' + #13#10 +
      'BandsCaptionsCB.Caption=Zobrazit názvy pruhù' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=Vybrat DataSet' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      '');
    Add('dbNotAssigned', '[nepøiøazeno]');
    Add('dbSingleLine', 'Jednoduchý øádek');

    Add('TfrxGroupEditorForm',
      'Caption=Skupina' + #13#10 +
      'BreakOnL.Caption=Break on   ' + #13#10 +
      'OptionsL.Caption=Nastavení   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      'DataFieldRB.Caption=Datové pole' + #13#10 +
      'ExpressionRB.Caption=Výraz' + #13#10 +
      'KeepGroupTogetherCB.Caption=Udržet skupinu pohromadì' + #13#10 +
      'StartNewPageCB.Caption=Spustit novou stránku' + #13#10 +
      'OutlineCB.Caption=Zobrazit uvnitø orámování' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=Systémové Memo' + #13#10 +
      'DataBandL.Caption=Pruh dat' + #13#10 +
      'DataSetL.Caption=DataSet' + #13#10 +
      'DataFieldL.Caption=Datové pole' + #13#10 +
      'FunctionL.Caption=Funkce' + #13#10 +
      'ExpressionL.Caption=Výraz' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      'AggregateRB.Caption=Agregátní hodnota' + #13#10 +
      'SysVariableRB.Caption=Systémová promìnná' + #13#10 +
      'CountInvisibleCB.Caption=Poèet neviditelných pruhù' + #13#10 +
      'TextRB.Caption=Text' + #13#10 +
      'RunningTotalCB.Caption=Souèty' + #13#10 +
      '');
    Add('agAggregate', 'Vložit agregátní promìnnou');
    Add('vt1', '[DATE]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGES#]');
    Add('vt5', '[PAGE#] z [TOTALPAGES#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=Objekt OLE' + #13#10 +
      'InsertB.Caption=Vložit...' + #13#10 +
      'EditB.Caption=Upravit...' + #13#10 +
      'CloseB.Caption=Zavøít' + #13#10 +
      '');
    Add('olStretched', 'Pøizpùsobit');

    Add('TfrxBarcodeEditorForm',
      'Caption=Editor èárového kódu' + #13#10 +
      'CodeLbl.Caption=Kód' + #13#10 +
      'TypeLbl.Caption=Typ èárového kódu' + #13#10 +
      'ZoomLbl.Caption=Zvìtšení:' + #13#10 +
      'OptionsLbl.Caption=Nastavení   ' + #13#10 +
      'RotationLbl.Caption=Otoèení   ' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CalcCheckSumCB.Caption=Vypoèítat kontrolní souèet ' + #13#10 +
      'ViewTextCB.Caption=Text' + #13#10 +
      'Rotation0RB.Caption=0°' + #13#10 +
      'Rotation90RB.Caption=90°' + #13#10 +
      'Rotation180RB.Caption=180°' + #13#10 +
      'Rotation270RB.Caption=270°' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Vypoèítat kontrolní souèet');
    Add('bcShowText', 'Zobrazit text');

    Add('TfrxAliasesEditorForm',
      'Caption=Upravit aliasy' + #13#10 +
      'HintL.Caption=Pro úpravu položky stisknìte Enter' + #13#10 +
      'DSAliasL.Caption=Alias Datasetu' + #13#10 +
      'FieldAliasesL.Caption=Aliasy polí' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      'ResetB.Caption=Vynulovat' + #13#10 +
      'UpdateB.Caption=Update' + #13#10 +
      '');
    Add('alUserName', 'Uživatelské jméno');
    Add('alOriginal', 'Originální jméno');

    Add('TfrxParamsEditorForm',
      'Caption=Editor parametrù' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      '');
    Add('qpName', 'Název');
    Add('qpDataType', 'Typ dat');
    Add('qpValue', 'Hodnota');

    Add('TfrxMDEditorForm',
      'Caption=Master-Odkaz na detail' + #13#10 +
      'Label1.Caption=Pole detailù' + #13#10 +
      'Label2.Caption=Pole hlavních dat' + #13#10 +
      'Label3.Caption=Odkazovaná pole' + #13#10 +
      'AddB.Caption=Pøidat' + #13#10 +
      'ClearB.Caption=Odstranit' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=Memo' + #13#10 +
      'ExprB.Hint=Vložit výraz' + #13#10 +
      'AggregateB.Hint=Vložit agregátní promìnnou' + #13#10 +
      'LocalFormatB.Hint=Vložit formátování' + #13#10 +
      'WordWrapB.Hint=Zalamování slov' + #13#10 +
      'CancelB.Hint=Zrušit' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=Obrázek' + #13#10 +
      'LoadB.Hint=Naèíst' + #13#10 +
      'CopyB.Hint=Kopírovat' + #13#10 +
      'PasteB.Hint=Vložit' + #13#10 +
      'ClearB.Hint=Odstranit' + #13#10 +
      'CancelB.Hint=Zrušit' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('piEmpty', 'Prázdný');

    Add('TfrxChartEditorForm',
      'Caption=Editor grafù' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=Pøidat série' + #13#10 +
      'DeleteB.Hint=Odstranit série' + #13#10 +
      'DBSourceRB.Caption=Data z DB' + #13#10 +
      'FixedDataRB.Caption=Pevná data' + #13#10 +
      'DatasetLbl.Caption=Dataset' + #13#10 +
      'X1Lbl.Caption=X hodnoty' + #13#10 +
      'Y1Lbl.Caption=Y hodnoty' + #13#10 +
      'X3Lbl.Caption=X hodnoty (napø. a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Y hodnoty (napø. 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Další nastavení   ' + #13#10 +
      'ShowTopLbl.Caption=TopN hodnoty' + #13#10 +
      'CaptionLbl.Caption=TopN název' + #13#10 +
      'SortLbl.Caption=Seøazení' + #13#10 +
      'LineMI.Caption=Èára' + #13#10 +
      'AreaMI.Caption=Plocha' + #13#10 +
      'PointMI.Caption=Bod' + #13#10 +
      'BarMI.Caption=Tyè' + #13#10 +
      'HorizBarMI.Caption=Vodor. tyè' + #13#10 +
      'PieMI.Caption=Koláè' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Rychlá èára' + #13#10 +
      '');
    Add('ch3D', '3D zobrazení');
    Add('chAxis', 'Zobrazit osy');
    Add('chsoNone', 'žádný');
    Add('chsoAscending', 'Vzestupnì');
    Add('chsoDescending', 'Sestupnì');

    Add('TfrxRichEditorForm',
      'Caption=Textový editor' + #13#10 +
      'OpenB.Hint=Otevøít soubor' + #13#10 +
      'SaveB.Hint=Uložit soubor' + #13#10 +
      'UndoB.Hint=Zpìt' + #13#10 +
      'TTB.Hint=Písmo' + #13#10 +
      'ExprB.Hint=Vložit výraz' + #13#10 +
      'CancelB.Hint=Zrušit' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      'BoldB.Hint=Tuèné' + #13#10 +
      'ItalicB.Hint=Kurzíva' + #13#10 +
      'UnderlineB.Hint=Podtržené' + #13#10 +
      'LeftAlignB.Hint=Zarovnat vlevo' + #13#10 +
      'CenterAlignB.Hint=Vystøedit' + #13#10 +
      'RightAlignB.Hint=Zarovnat vpravo' + #13#10 +
      'BlockAlignB.Hint=Formátovat' + #13#10 +
      'BulletsB.Hint=Kulièky' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Editor køížových tabulek' + #13#10 +
      'DatasetL.Caption=Zdrojová data   ' + #13#10 +
      'DimensionsL.Caption=Rozmìry   ' + #13#10 +
      'RowsL.Caption=Øádky' + #13#10 +
      'ColumnsL.Caption=Sloupce' + #13#10 +
      'CellsL.Caption=Buòky' + #13#10 +
      'StructureL.Caption=Struktura køížové tabulky   ' + #13#10 +
      'RowHeaderCB.Caption=Øádka záhlaví' + #13#10 +
      'ColumnHeaderCB.Caption=Sloupec záhlaví' + #13#10 +
      'RowTotalCB.Caption=Øádka celkového souètu' + #13#10 +
      'ColumnTotalCB.Caption=Sloupec celkového souètu' + #13#10 +
      'SwapB.Hint=Pøepnout øádky/sloupce' + #13#10 +
      'StyleCB.Hint=Styl køížové tabulky' + #13#10 +
      'FontB.Hint=Nastavení písma' + #13#10 +
      'AlignLeftB.Hint=Zarovnat vlevo' + #13#10 +
      'AlignCenterB.Hint=Vystøedit' + #13#10 +
      'AlignRightB.Hint=Zarovnat vpravo' + #13#10 +
      'RotationB.Hint=Otáèení textu' + #13#10 +
      'HighlightB.Hint=Zvýraznìní' + #13#10 +
      'FormatB.Hint=Formát' + #13#10 +
      'FrameB.Hint=Nastavení rámeèku' + #13#10 +
      'FillColorB.Hint=Barva výplnì' + #13#10 +
      'Func1MI.Caption=Žádný' + #13#10 +
      'Func2MI.Caption=Souèet' + #13#10 +
      'Func3MI.Caption=Min' + #13#10 +
      'Func4MI.Caption=Max' + #13#10 +
      'Func5MI.Caption=Prùmìr' + #13#10 +
      'Func6MI.Caption=Poèet' + #13#10 +
      'Sort1MI.Caption=Vzestupnì (A-Z)' + #13#10 +
      'Sort2MI.Caption=Sestupnì (Z-A)' + #13#10 +
      'Sort3MI.Caption=Bez øazení' + #13#10 +
      'BoldMI.Caption=Tuèné' + #13#10 +
      'ItalicMI.Caption=Kurzíva' + #13#10 +
      'UnderlineMI.Caption=Podtržené' + #13#10 +
      'SuperScriptMI.Caption=Horní index' + #13#10 +
      'SubScriptMI.Caption=Spodní index' + #13#10 +
      'CondensedMI.Caption=Stlaèené' + #13#10 +
      'WideMI.Caption=Široké' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=Zrušit' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('crSubtotal', 'Mezisouèet');
    Add('crNone', 'Žádný');
    Add('crSum', 'Souèet');
    Add('crMin', 'Min');
    Add('crMax', 'Max');
    Add('crAvg', 'Prùmìr');
    Add('crCount', 'Poèet');
    Add('crAsc', 'A-Z');
    Add('crDesc', 'Z-A');
    Add('crFillMx', 'Plnìní køížové tabulky...');
    Add('crBuildMx', 'Sestavování køížové tabulky...');
    Add('crRepHdrs', 'Pøetisk záhlaví');
    Add('crBorder', 'Okraj');
    Add('crDown', 'Dolù potom napøíè');

    Add('TfrxExprEditorForm',
      'Caption=Editor výrazù' + #13#10 +
      'ExprL.Caption=Výraz:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=Formát zobrazení' + #13#10 +
      'CategoryL.Caption=Kategorie' + #13#10 +
      'FormatL.Caption=Formát' + #13#10 +
      'FormatStrL.Caption=Retezec formatu:' + #13#10 +
      'SeparatorL.Caption=Oddelovac des.cisel:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      '');
    Add('fkText', 'Text (neformatovano)');
    Add('fkNumber', 'Cislo');
    Add('fkDateTime', 'Datum/Cas');
    Add('fkBoolean', 'Boolean');
    Add('fkNumber1', '1234.5;%g');
    Add('fkNumber2', '1234.50;%2.2f');
    Add('fkNumber3', '1,234.50;%2.2n');
    Add('fkNumber4', '$1,234.50;%2.2m');
    Add('fkDateTime1', '11.28.2002;mm.dd.yyyy');
    Add('fkDateTime2', '28 lis 2002;dd mmm yyyy');
    Add('fkDateTime3', 'Listopad 28, 2002;mmmm dd, yyyy');
    Add('fkDateTime4', '02:14;hh:mm');
    Add('fkDateTime5', '02:14am;hh:mm am/pm');
    Add('fkDateTime6', '02:14:00;hh:mm:ss');
    Add('fkDateTime7', '02:14am, Listopad 28, 2002;hh:mm am/pm, mmmm dd, yyyy');
    Add('fkBoolean1', '0,1;0,1');
    Add('fkBoolean2', 'Ne,Ano;Ne,Ano');
    Add('fkBoolean3', '_,x;_,x');
    Add('fkBoolean4', 'False,True;False,True');

    Add('TfrxHighlightEditorForm',
      'Caption=Zvýraznìní' + #13#10 +
      'FontColorB.Caption=Barva...' + #13#10 +
      'BackColorB.Caption=Barva...' + #13#10 +
      'ConditionL.Caption=Podmínka   ' + #13#10 +
      'FontL.Caption=Písmo   ' + #13#10 +
      'BackgroundL.Caption=Pozadí   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      'BoldCB.Caption=Tuèné' + #13#10 +
      'ItalicCB.Caption=Kurzíva' + #13#10 +
      'UnderlineCB.Caption=Podtržené' + #13#10 +
      'TransparentRB.Caption=Transparentní' + #13#10 +
      'OtherRB.Caption=Další' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Nastavení Reportu' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      'GeneralTS.Caption=Všeobecné' + #13#10 +
      'ReportSettingsL.Caption=Nastavení tiskárny   ' + #13#10 +
      'CopiesL.Caption=Kopií' + #13#10 +
      'GeneralL.Caption=Všeobecné   ' + #13#10 +
      'PasswordL.Caption=Heslo' + #13#10 +
      'CollateCB.Caption=Seøadit kopie' + #13#10 +
      'DoublePassCB.Caption=Dvojí prùchod' + #13#10 +
      'PrintIfEmptyCB.Caption=Tisknout i prázdné' + #13#10 +
      'DescriptionTS.Caption=Popis' + #13#10 +
      'NameL.Caption=Název' + #13#10 +
      'Description1L.Caption=Popis' + #13#10 +
      'PictureL.Caption=Obrázek' + #13#10 +
      'AuthorL.Caption=Autor' + #13#10 +
      'MajorL.Caption=Major' + #13#10 +
      'MinorL.Caption=Minor' + #13#10 +
      'ReleaseL.Caption=Vydání' + #13#10 +
      'BuildL.Caption=Sestav.' + #13#10 +
      'CreatedL.Caption=Vytvoøeno' + #13#10 +
      'ModifiedL.Caption=Upraveno' + #13#10 +
      'DescriptionL.Caption=Popis   ' + #13#10 +
      'VersionL.Caption=Verze   ' + #13#10 +
      'PictureB.Caption=Procházet...' + #13#10 +
      '');
    Add('rePrnOnPort', 'na');

    Add('TfrxStringsEditorForm',
      'Caption=Položky' + #13#10 +
      'CancelB.Hint=Zrušit' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=Zrušit' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=Heslo' + #13#10 +
      'PasswordL.Caption=Vložte heslo:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=Editor stylu' + #13#10 +
      'ColorB.Caption=Barva...' + #13#10 +
      'FontB.Caption=Písmo...' + #13#10 +
      'FrameB.Caption=Rámeèek...' + #13#10 +
      'AddB.Hint=Pøidat' + #13#10 +
      'DeleteB.Hint=Odstranit' + #13#10 +
      'EditB.Hint=Upravit' + #13#10 +
      'LoadB.Hint=Naèíst' + #13#10 +
      'SaveB.Hint=Uložit' + #13#10 +
      'CancelB.Hint=Zrušit' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=Editor rámeèku' + #13#10 +
      'FrameL.Caption=Rámeèek' + #13#10 +
      'LineL.Caption=Èára rámeèku' + #13#10 +
      'ShadowL.Caption=Stín' + #13#10 +
      'FrameTopB.Hint=Horní èára' + #13#10 +
      'FrameBottomB.Hint=Spodní èára' + #13#10 +
      'FrameLeftB.Hint=Levá èára' + #13#10 +
      'FrameRightB.Hint=Pravá èára' + #13#10 +
      'FrameAllB.Hint=Všechny èáry rámeèku' + #13#10 +
      'FrameNoB.Hint=Bez rámeèku' + #13#10 +
      'FrameColorB.Hint=Barva rámeèku' + #13#10 +
      'FrameStyleB.Hint=Styl rámeèku' + #13#10 +
      'FrameWidthCB.Hint=Šíøka rámeèku' + #13#10 +
      'ShadowB.Hint=Stín' + #13#10 +
      'ShadowColorB.Hint=Barva stínu' + #13#10 +
      'ShadowWidthCB.Hint=Šíøka stínu' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=Nová položka' + #13#10 +
      'ItemsTab.Caption=Položky' + #13#10 +
      'TemplatesTab.Caption=Šablony' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Záložky seøazování' + #13#10 +
      'Label1.Caption=Ovládání uvedené v záložce seøazení:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      'UpB.Caption=Nahoru' + #13#10 +
      'DownB.Caption=Dolù' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Vyhodnocení' + #13#10 +
      'Label1.Caption=Výraz' + #13#10 +
      'Label2.Caption=Výsledek' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Prùvodce reportem' + #13#10 +
      'DataTab.Caption=Data' + #13#10 +
      'GroupsTab.Caption=Skupiny' + #13#10 +
      'LayoutTab.Caption=Plocha' + #13#10 +
      'StyleTab.Caption=Styl' + #13#10 +
      'Step1L.Caption=Step 1. Vyberte zobrazovaný dataset a pole.' + #13#10 +
      'Step2L.Caption=Step 2. Vytvoøte skupiny (volitelné).' + #13#10 +
      'Step3L.Caption=Step 3. Zadejte orientaci stránky a plochu pro data.' + #13#10 +
      'Step4L.Caption=Step 4. Vyberte styl reportu.' + #13#10 +
      'AddFieldB.Caption=Pøidat >' + #13#10 +
      'AddAllFieldsB.Caption=Pøidat vše >>' + #13#10 +
      'RemoveFieldB.Caption=< Odstranit' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Odstranit vše' + #13#10 +
      'AddGroupB.Caption=Pøidat >' + #13#10 +
      'RemoveGroupB.Caption=< Odstranit' + #13#10 +
      'SelectedFieldsL.Caption=Vybraná pole:' + #13#10 +
      'AvailableFieldsL.Caption=Dostupná pole:' + #13#10 +
      'GroupsL.Caption=Skupiny:' + #13#10 +
      'OrientationL.Caption=Orientace   ' + #13#10 +
      'LayoutL.Caption=Plocha   ' + #13#10 +
      'PortraitRB.Caption=Na výšku' + #13#10 +
      'LandscapeRB.Caption=Na šíøku' + #13#10 +
      'TabularRB.Caption=Tabulkovì' + #13#10 +
      'ColumnarRB.Caption=Sloupcovì' + #13#10 +
      'FitWidthCB.Caption=Pøizpùsobit pole šíøce stránky' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      'BackB.Caption=<< Zpìt' + #13#10 +
      'NextB.Caption=Další >>' + #13#10 +
      'FinishB.Caption=Dokonèit' + #13#10 +
      '');
    Add('wzStd', 'Standardní prùvodce reportem');
    Add('wzDMP', 'Prùvodce reportem pro jehl. tisk.');
    Add('wzStdEmpty', 'Standardní report');
    Add('wzDMPEmpty', 'Report pro jehl. tisk.');


    Add('ftAllFiles', 'Všechny soubory');
    Add('ftPictures', 'Obrázky');
    Add('ftDB', 'Databáze');
    Add('ftRichFile', 'Soubor úpravy textu');
    Add('ftTextFile', 'Textový soubor');

    Add('prNotAssigned', '(Nepøiøazeno)');
    Add('prInvProp', 'Neplatná hodnota vlastnosti');
    Add('prDupl', 'Zdvojený název');
    Add('prPict', '(Obrázek)');

    Add('mvExpr', 'Povolit výrazy');
    Add('mvStretch', 'Pøizpùsobit velikost');
    Add('mvStretchToMax', 'Pøizpùsobit max. výšce');
    Add('mvShift', 'Posunout');
    Add('mvShiftOver', 'Posunout pøi pøesahu');
    Add('mvVisible', 'Viditelné');
    Add('mvPrintable', 'Tisknutelné');
    Add('mvFont', 'Písmo...');
    Add('mvFormat', 'Formát zobrazení...');
    Add('mvClear', 'Odstranit obsah');
    Add('mvAutoWidth', 'Autom. šíøka');
    Add('mvWWrap', 'Zalamování');
    Add('mvSuppress', 'Potlaèit opakované hodnoty');
    Add('mvHideZ', 'Skrýt nuly');
    Add('mvHTML', 'Povolit HTML tagy');
    Add('lvDiagonal', 'Úhlopøíèné');
    Add('pvAutoSize', 'Autom. velikost');
    Add('pvCenter', 'Vystøedit');
    Add('pvAspect', 'Dodržet stran. pomìr');
    Add('bvSplit', 'Povolit rozdìlení');
    Add('bvKeepChild', 'Držet podøazené u sebe');
    Add('bvPrintChild', 'Tisknout neviditelné podøazené');
    Add('bvStartPage', 'Zaèít novou stránku');
    Add('bvPrintIfEmpty', 'Tisknout i prázdné detaily');
    Add('bvKeepDetail', 'Držet detaily u sebe');
    Add('bvKeepFooter', 'Držet zápatí u sebe');
    Add('bvReprint', 'Znova tisknout na novou stranu');
    Add('bvOnFirst', 'Tisknout na první stranu');
    Add('bvOnLast', 'Tisknout na poslední stranu');
    Add('bvKeepGroup', 'Držet spolu');
    Add('bvFooterAfterEach', 'Zápatí po každé øádce');
    Add('srParent', 'Tisknout do nadøazené');
    Add('bvKeepHeader', 'Keep Header Together');

    Add('obCatDraw', 'Kresba');
    Add('obCatOther', 'Jiné objekty');
    Add('obCatOtherControls', 'Jiné ovládání');
    Add('obDiagLine', 'Šikmá èára');
    Add('obRect', 'Ètyøúhelník');
    Add('obRoundRect', 'Zaoblený ètyøúhelník');
    Add('obEllipse', 'Elipsa');
    Add('obTrian', 'Trojúhelník');
    Add('obDiamond', 'Diamant');
    Add('obLabel', 'Nadpis');
    Add('obEdit', 'Editaèní pole');
    Add('obMemoC', 'Memo');
    Add('obButton', 'Tlaèítko');
    Add('obChBoxC', 'Zatržítko');
    Add('obRButton', 'Pøepínací políèko');
    Add('obLBox', 'Rolovací seznam');
    Add('obCBox', 'Výsuvný seznam');
    Add('obDateEdit', 'Editace dat');
    Add('obImageC', 'Obrázek');
    Add('obPanel', 'Panel');
    Add('obGrBox', 'Skupinový panel');
    Add('obBBtn', 'Grafické tlaèítko');
    Add('obSBtn', 'Rychlé tlaèítko');
    Add('obMEdit', 'Masková editace');
    Add('obChLB', 'Panel seznamu zatržítek');
    Add('obDBLookup', 'Výsuvný panel DB');
    Add('obBevel', 'Objekt zkosení');
    Add('obShape', 'Objekt tvaru');
    Add('obText', 'Objekt textu');
    Add('obSysText', 'Systémový text');
    Add('obLine', 'Objekt èáry');
    Add('obPicture', 'Objekt obrázku');
    Add('obBand', 'Objekt pruhu');
    Add('obDataBand', 'Pruh dat');
    Add('obSubRep', 'Objekt Subreportu');
    Add('obDlgPage', 'Formuláø dialogu');
    Add('obRepPage', 'Stránka reportu');
    Add('obReport', 'Objekt reportu');
    Add('obRich', 'Objekt RichTextu');
    Add('obOLE', 'Objekt OLE');
    Add('obChBox', 'Objekt zatržítka');
    Add('obChart', 'Objekt grafu');
    Add('obBarC', 'Objekt èár.kódu');
    Add('obCross', 'Objekt køíž.tabulky');
    Add('obDBCross', 'Objekt DB køíž.tab.');
    Add('obGrad', 'Objekt gradientu');
    Add('obDMPText', 'Objekt textu jehl.tisk.');
    Add('obDMPLine', 'Objekt èáry jehl.tisk.');
    Add('obBDEDB', 'BDE databáze');
    Add('obBDETb', 'BDE tabulka');
    Add('obBDEQ', 'BDE Query');
    Add('obBDEComps', 'BDE komponenty');
    Add('obIBXDB', 'IBX databáze');
    Add('obIBXTb', 'IBX tabulka');
    Add('obIBXQ', 'IBX Query');
    Add('obIBXComps', 'IBX komponenty');
    Add('obADODB', 'ADO databáze');
    Add('obADOTb', 'ADO tabulka');
    Add('obADOQ', 'ADO Query');
    Add('obADOComps', 'ADO komponenty');
    Add('obDBXDB', 'DBX databáze');
    Add('obDBXTb', 'DBX tabulka');
    Add('obDBXQ', 'DBX Query');
    Add('obDBXComps', 'DBX komponenty');

    Add('ctString', 'Øetìzec');
    Add('ctDate', 'Datum a èas');
    Add('ctConv', 'Konverze');
    Add('ctFormat', 'Formátování');
    Add('ctMath', 'Matematické');
    Add('ctOther', 'Jiné');

    Add('IntToStr', 'Pøevede hodnotu integer na øetìzec');
    Add('FloatToStr', 'Pøevede hodnotu float na øetìzec');
    Add('DateToStr', 'Pøevede datum na øetìzec');
    Add('TimeToStr', 'Pøevede èas na øetìzec');
    Add('DateTimeToStr', 'Pøevede hodnotu datum-a-èas na øetìzec');
    Add('VarToStr', 'Pøevede hodnotu variant na øetìzec');
    Add('StrToInt', 'Pøevede øetìzec na hodnotu integer');
    Add('StrToFloat', 'Pøevede øetìzec na hodnotu floating-point');
    Add('StrToDate', 'Pøevede øetìzec na formát datum');
    Add('StrToTime', 'Pøevede øetìzec na formát èas');
    Add('StrToDateTime', 'Pøevede øetìzec na formát datum-a-èas');
    Add('Format', 'Vrátí formátovaný øetìzec sestavený z øad argumentù pole');
    Add('FormatFloat', 'Formátuje hodnotu floating-point');
    Add('FormatDateTime', 'Formátuje hodnotu datum-a-èas');
    Add('FormatMaskText', 'Vrátí øetìzec formátovaný s použitím upravené masky');
    Add('EncodeDate', 'Vrátí typ TDateTime pro zadaný rok, mìsíc a den');
    Add('DecodeDate', 'Rozdìlí TDateTime na hodnoty rok, mìsíc a den');
    Add('EncodeTime', 'Vrátí typ TDateTime pro zadanou hodinu, min., sek. a milisek.');
    Add('DecodeTime', 'Rozdìlí TDateTime na hodnoty hodiny, min., sek. a milisek.');
    Add('Date', 'Vrátí aktuální datum');
    Add('Time', 'Vrátí aktuální èas');
    Add('Now', 'Vrátí aktuální datum a èas');
    Add('DayOfWeek', 'Vrátí den v mìsíci zadaného datumu');
    Add('IsLeapYear', 'Indikuje zda je zadaný rok pøestupný');
    Add('DaysInMonth', 'Vrátí poèet dnù zadaného mìsíce');
    Add('Length', 'Vrátí délku øetìzce');
    Add('Copy', 'Vrátí podøetìzec øetìzce');
    Add('Pos', 'Vrátí pozici podøetìzce v øetìzci');
    Add('Delete', 'Odstraní podøetìzec z øetìzce');
    Add('Insert', 'Vloží podøetìzec do øetìzce');
    Add('Uppercase', 'Pøevede všechny znaky v øetìzci na velká písmena');
    Add('Lowercase', 'Pøevede všechny znaky v øetìzci na malá písmena');
    Add('Trim', 'Odstraní všechny poèáteèní a koncové mezery z øetìzce');
    Add('NameCase', 'Pøevede první písmeno slova na velké');
    Add('CompareText', 'Porovná dva øetìzce');
    Add('Chr', 'Pøevede hodnotu integer na char');
    Add('Ord', 'Pøevede hodnotu char na integer');
    Add('SetLength', 'Nastaví délku øetìzce');
    Add('Round', 'Zaokrouhlí hodnotu floating-point na nejbližší celé èíslo');
    Add('Trunc', 'Oøízne hodnotu floating-point na integer');
    Add('Int', 'Vrátí integer èást reálného èísla');
    Add('Frac', 'Vrátí desetinou èást reálného èísla');
    Add('Sqrt', 'Vrátí koøen mocniny zadaného èísla');
    Add('Abs', 'Vrátí absolutní hodnotu');
    Add('Sin', 'Vrátí sinus úhlu (v radiánech)');
    Add('Cos', 'Vrátí cosinus úhlu (v radiánech)');
    Add('ArcTan', 'Vrátí arctangent');
    Add('Tan', 'Vrátí tangent');
    Add('Exp', 'Vrátí exponenciál');
    Add('Ln', 'Vrátí pøirozený logaritmus reálného èísla');
    Add('Pi', 'Vrátí èíslo 3.1415926...');
    Add('Inc', 'Zvýší hodnotu');
    Add('Dec', 'Sníží hodnotu');
    Add('RaiseException', 'Vyvolá vyjímku');
    Add('ShowMessage', 'Zobrazí okno zprávy');
    Add('Randomize', 'Spustí generátor náhodných èísel');
    Add('Random', 'Vrátí náhodné èíslo');
    Add('ValidInt', 'Vrátí hodnotu True pokud zadané èíslo obsahuje platný integer');
    Add('ValidFloat', 'Vrátí hodnotu True pokud zadané èíslo obsahuje platný float');
    Add('ValidDate', 'Vrátí hodnotu True pokud zadané èíslo obsahuje platné datum');
    Add('IIF', 'Vrátí hodnotu True pokud je zadaný výraz pravdivý, jinak vrátí False');
    Add('Get', 'Pouze pro interní použití');
    Add('Set', 'Pouze pro interní použití');
    Add('InputBox', 'Zobrazí vstupní dialogové okno umožòující zadat uživateli øetìzec');
    Add('InputQuery', 'Zobrazí vstupní dialogové okno umožòující zadat uživateli øetìzec');
    Add('MessageDlg', 'Zobrazí okno zprávy');
    Add('CreateOleObjekt ', 'Vytvoøí OLE objekt');
    Add('VarArrayCreate', 'Vytvoøí variant pole');
    Add('VarType', 'Vrátí typ hodnoty variant');
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