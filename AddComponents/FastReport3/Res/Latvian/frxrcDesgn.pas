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
      'Caption=Inspektors' + #13#10 +
      '');
    Add('oiProp', 'Ipasibas');
    Add('oiEvent', 'Izmainas');

    Add('TfrxDataTreeForm',
      'Caption=Datu koks' + #13#10 +
      'DataTS.Caption=BD laukums' + #13#10 +
      'VariablesTS.Caption=Mainigie' + #13#10 +
      'FunctionsTS.Caption=Funkcijas' + #13#10 +
      'InsFieldCB.Caption=Ievietot laukumu' + #13#10 +
      'InsCaptionCB.Caption=Ievietot virsrakstu' + #13#10 +
      '');
    Add('dtNoData', 'Nav datu');
    Add('dtData', 'Dati');
    Add('dtSysVar', 'Sistemas');
    Add('dtVar', 'Mainigie');
    Add('dtFunc', 'Funkcijas');

    Add('TfrxReportTreeForm',
      'Caption=Atskaites koks' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Atvert skriptu' + #13#10 +
      'SaveScriptB.Hint=Saglabat skriptu' + #13#10 +
      'RunScriptB.Hint=Atvert atskaiti' + #13#10 +
      'StepScriptB.Hint=Atjaunosana' + #13#10 +
      'StopScriptB.Hint=Apstadinat' + #13#10 +
      'EvaluateB.Hint=Izskaitlot' + #13#10 +
      'LangL.Caption=Valoda:' + #13#10 +
      'AlignTB.Caption=Izlidzinasana' + #13#10 +
      'AlignLeftsB.Hint=Izlidzinat kreisas malas' + #13#10 +
      'AlignHorzCentersB.Hint=Centret horizontali' + #13#10 +
      'AlignRightsB.Hint= Izlidzinat labas malas' + #13#10 +
      'AlignTopsB.Hint= Izlidzinat augsejas malas' + #13#10 +
      'AlignVertCentersB.Hint= Centret horizontali' + #13#10 +
      'AlignBottomsB.Hint= Izlidzinat apaksejas malas' + #13#10 +
      'SpaceHorzB.Hint=Izlidzinat pec platuma' + #13#10 +
      'SpaceVertB.Hint=Izlidzinat pec augstuma' + #13#10 +
      'CenterHorzB.Hint=Centret horizontali pec joslas' + #13#10 +
      'CenterVertB.Hint= Centret vertikali pec joslas' + #13#10 +
      'SameWidthB.Hint=Tads pats platums' + #13#10 +
      'SameHeightB.Hint=Tads pats augstums' + #13#10 +
      'TextTB.Caption=Teksts' + #13#10 +
      'StyleCB.Hint=Veids' + #13#10 +
      'FontNameCB.Hint=Fonta nosaukums' + #13#10 +
      'FontSizeCB.Hint=Fonta lielums' + #13#10 +
      'BoldB.Hint=Treknie burti' + #13#10 +
      'ItalicB.Hint=Kursors' + #13#10 +
      'UnderlineB.Hint=Pasvitrosana' + #13#10 +
      'FontColorB.Hint=Fonta krasa' + #13#10 +
      'HighlightB.Hint=Ietecama izdalisana' + #13#10 +
      'RotateB.Hint=Teksta apgriesana' + #13#10 +
      'TextAlignLeftB.Hint=Izlidzinat tekstu uz kreiso pusi' + #13#10 +
      'TextAlignCenterB.Hint= Centret tekstu horizontali' + #13#10 +
      'TextAlignRightB.Hint= Izlidzinat tekstu uz labo pusi' + #13#10 +
      'TextAlignBlockB.Hint= Izlidzinat tekstu pec platuma' + #13#10 +
      'TextAlignTopB.Hint=Izlidzinat pec augsejas malas' + #13#10 +
      'TextAlignMiddleB.Hint= Centret tekstu vertikali' + #13#10 +
      'TextAlignBottomB.Hint= Izlidzinat pec apaksejas malas' + #13#10 +
      'FrameTB.Caption=Ramis' + #13#10 +
      'FrameTopB.Hint=Augseja linija' + #13#10 +
      'FrameBottomB.Hint=Apakseja linija' + #13#10 +
      'FrameLeftB.Hint=Kreisa linija' + #13#10 +
      'FrameRightB.Hint=Laba linija' + #13#10 +
      'FrameAllB.Hint=Visas ramja linijas' + #13#10 +
      'FrameNoB.Hint=Dzest rami' + #13#10 +
      'ShadowB.Hint=Ena' + #13#10 +
      'FillColorB.Hint=Aizlejuma krasa' + #13#10 +
      'FrameColorB.Hint=Ramja krasa' + #13#10 +
      'FrameStyleB.Hint=Ramja veids' + #13#10 +
      'FrameWidthCB.Hint=Ramja biezums' + #13#10 +
      'StandardTB.Caption=Standarta' + #13#10 +
      'NewB.Hint=Jauna atskaite' + #13#10 +
      'OpenB.Hint=Atvert' + #13#10 +
      'SaveB.Hint=Saglabat' + #13#10 +
      'PreviewB.Hint=Parlukosana' + #13#10 +
      'NewPageB.Hint=Pievienot lappusi atskaitei' + #13#10 +
      'NewDialogB.Hint=Pievienot veidni atskaitei' + #13#10 +
      'DeletePageB.Hint=Dzest lappusi' + #13#10 +
      'PageSettingsB.Hint=Lappuses uzstadijumi' + #13#10 +
      'VariablesB.Hint=Mainigie' + #13#10 +
      'CutB.Hint=Izgriezt' + #13#10 +
      'CopyB.Hint=Kopet' + #13#10 +
      'PasteB.Hint=Ievietot' + #13#10 +
      'SampleFormatB.Hint=Kopet formatu' + #13#10 +
      'UndoB.Hint=Atcelt' + #13#10 +
      'RedoB.Hint=Atkartot' + #13#10 +
      'ShowGridB.Hint=Radit tiklu' + #13#10 +
      'AlignToGridB.Hint=Izlidzinasana pec tikla' + #13#10 +
      'SetToGridB.Hint=Izvietot objektus tikla mezglos' + #13#10 +
      'ScaleCB.Hint=Merogs' + #13#10 +
      'ExtraToolsTB.Caption=Papildriki' + #13#10 +
      'ObjectSelectB.Hint=Objektu izvele' + #13#10 +
      'HandToolB.Hint=Roka' + #13#10 +
      'ZoomToolB.Hint=Lupa' + #13#10 +
      'TextToolB.Hint=Teksta redaktors' + #13#10 +
      'FormatToolB.Hint=Areja teksta kopesana' + #13#10 +
      'ObjectBandB.Hint=Ievietot joslu' + #13#10 +
      'FileMenu.Caption=&fails' + #13#10 +
      'EditMenu.Caption=&labojumi' + #13#10 +
      'FindMI.Caption=Atrast...' + #13#10 +
      'FindNextMI.Caption=Meklet talak' + #13#10 +
      'ReplaceMI.Caption=Aizvietot...' + #13#10 +
      'ReportMenu.Caption=&atskaite' + #13#10 +
      'ReportDataMI.Caption=Dati...' + #13#10 +
      'ReportSettingsMI.Caption=Uzstadijumi...' + #13#10 +
      'ReportStylesMI.Caption=Veidi...' + #13#10 +
      'ViewMenu.Caption=&Veidi' + #13#10 +
      'ToolbarsMI.Caption=Instrumentu panelis' + #13#10 +
      'StandardMI.Caption=Standarta' + #13#10 +
      'TextMI.Caption=Teksts' + #13#10 +
      'FrameMI.Caption=Ramis' + #13#10 +
      'AlignmentMI.Caption=Izlidzinasana' + #13#10 +
      'ToolsMI.Caption=Ìàñòåðà' + #13#10 +
      'InspectorMI.Caption=Inspektors' + #13#10 +
      'DataTreeMI.Caption=Datu koks' + #13#10 +
      'ReportTreeMI.Caption= Datu koks' + #13#10 +
      'ShowRulersMI.Caption=Lineali' + #13#10 +
      'ShowGuidesMI.Caption=Dalijuma linijas' + #13#10 +
      'DeleteGuidesMI.Caption=Dzest dalijuma linijas' + #13#10 +
      'OptionsMI.Caption=Uzstadijumi...' + #13#10 +
      'HelpMenu.Caption=&?' + #13#10 +
      'HelpContentsMI.Caption=Help Contents...' + #13#10 +
      'AboutMI.Caption=Î FastReport...' + #13#10 +
      'TabOrderMI.Caption=Redaktors TabOrder...' + #13#10 +
      'UndoCmd.Caption=Atcelt' + #13#10 +
      'RedoCmd.Caption=Atkartot' + #13#10 +
      'CutCmd.Caption=Izgriezt' + #13#10 +
      'CopyCmd.Caption=Kopet' + #13#10 +
      'PasteCmd.Caption=Ievietot' + #13#10 +
      'DeleteCmd.Caption=Dzest' + #13#10 +
      'DeletePageCmd.Caption=Dzest lappusi' + #13#10 +
      'SelectAllCmd.Caption=Izveleties visu' + #13#10 +
      'EditCmd.Caption=Rediget...' + #13#10 +
      'BringToFrontCmd.Caption=Pirmaja plana' + #13#10 +
      'SendToBackCmd.Caption=Aizmugureja plana' + #13#10 +
      'NewItemCmd.Caption=Jauns...' + #13#10 +
      'NewReportCmd.Caption=Jauna atskaite' + #13#10 +
      'NewPageCmd.Caption=Jauna lappuse' + #13#10 +
      'NewDialogCmd.Caption=Jauna veidne' + #13#10 +
      'OpenCmd.Caption=Atvert...' + #13#10 +
      'SaveCmd.Caption=Saglabat' + #13#10 +
      'SaveAsCmd.Caption=Saglabat ka...' + #13#10 +
      'VariablesCmd.Caption=Mainigie...' + #13#10 +
      'PageSettingsCmd.Caption=Lappuses uzstadijumi...' + #13#10 +
      'PreviewCmd.Caption=Parlukosana' + #13#10 +
      'ExitCmd.Caption=Iziet' + #13#10 +
      'ReportTitleMI.Caption=Atskaites virsraksts' + #13#10 +
      'ReportSummaryMI.Caption=Kopeja atskaite' + #13#10 +
      'PageHeaderMI.Caption=Lappuses virsraksts' + #13#10 +
      'PageFooterMI.Caption=Lappuses josla' + #13#10 +
      'HeaderMI.Caption=Datu virsraksts' + #13#10 +
      'FooterMI.Caption=Datu josla' + #13#10 +
      'MasterDataMI.Caption=1. limena dati' + #13#10 +
      'DetailDataMI.Caption=2. limena dati' + #13#10 +
      'SubdetailDataMI.Caption=3. limena dati' + #13#10 +
      'Data4levelMI.Caption=4. limena dati' + #13#10 +
      'Data5levelMI.Caption=5. limena dati' + #13#10 +
      'Data6levelMI.Caption=6. limena dati' + #13#10 +
      'GroupHeaderMI.Caption=Grupas virsraksts' + #13#10 +
      'GroupFooterMI.Caption=Grupas josla' + #13#10 +
      'ChildMI.Caption=Meitas josla' + #13#10 +
      'ColumnHeaderMI.Caption=Kolonnas virsraksts' + #13#10 +
      'ColumnFooterMI.Caption=Kolonnas josla' + #13#10 +
      'OverlayMI.Caption=Fona josla' + #13#10 +
      'VerticalbandsMI.Caption=Vertikalas joslas' + #13#10 +
      'HeaderMI1.Caption=Datu virsraksts' + #13#10 +
      'FooterMI1.Caption=Datu josla' + #13#10 +
      'MasterDataMI1.Caption=1. limena dati' + #13#10 +
      'DetailDataMI1.Caption=2. limena dati' + #13#10 +
      'SubdetailDataMI1.Caption=3. limena dati' + #13#10 +
      'GroupHeaderMI1.Caption=Grupas virsraksts' + #13#10 +
      'GroupFooterMI1.Caption=Grupas josla' + #13#10 +
      'ChildMI1.Caption= Meitas josla' + #13#10 +
      'R0MI.Caption=0°' + #13#10 +
      'R45MI.Caption=45°' + #13#10 +
      'R90MI.Caption=90°' + #13#10 +
      'R180MI.Caption=180°' + #13#10 +
      'R270MI.Caption=270°' + #13#10 +
      'FontB.Hint=Fonta parametri' + #13#10 +
      'BoldMI.Caption=Trekns' + #13#10 +
      'ItalicMI.Caption=Ieslips' + #13#10 +
      'UnderlineMI.Caption=Pasvitrots' + #13#10 +
      'SuperScriptMI.Caption=Augsejais indekss' + #13#10 +
      'SubScriptMI.Caption=Apaksejais indekss' + #13#10 +
      'CondensedMI.Caption=Saspiestais' + #13#10 +
      'WideMI.Caption=Platais' + #13#10 +
      'N12cpiMI.Caption=12 simboli/colla' + #13#10 +
      'N15cpiMI.Caption=15 simboli/colla' + #13#10 +
      'OpenDialog.Filter=Atskaite (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter= Pascal faili (*.pas)|*.pas|Ôàéëû C++ (*.cpp)|*.cpp| JavaScript faili (*.js)|*.js|Ôàéëû Basic (*.vb)|*.vb|All files|*.*' + #13#10 +
      'SaveScriptDialog.Filter= Pascal faili (*.pas)|*.pas|Ôàéëû C++ (*.cpp)|*.cpp|Ôàéëû JavaScript (*.js)|*.js| Basic faili (*.vb)|*.vb|All files|*.*' + #13#10 +
      'GroupB.Hint=Grupet' + #13#10 +
      'UngroupB.Hint=Izverst grupesanu' + #13#10 +
      'GroupCmd.Caption= Grupet' + #13#10 +
      'UngroupCmd.Caption= Izverst grupesanu' + #13#10 +
      '');
    Add('dsCm', 'Centimetri');
    Add('dsInch', 'Collas');
    Add('dsPix', 'Punkti');
    Add('dsChars', 'Simboli');
    Add('dsCode', 'Kods');
    Add('dsPage', 'Lappuse');
    Add('dsRepFilter', 'Atskaite (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'Saspiesta atskaite (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', 'Saglabat izmainas?');
    Add('dsSaveChangesTo', 'Saglabat izmainas .... ');
    Add('dsCantLoad', 'Neizdevas atvert failu');
    Add('dsStyleFile', 'Veds');
    Add('dsCantFindProc', 'Neizdevas atrast galveno proceduru');
    Add('dsClearScript', 'Tas attiris visu kodu. Turpinat?');
    Add('dsNoStyle', 'Nav veida');
    Add('dsStyleSample', 'Veida piemers');
    Add('dsTextNotFound', 'Teksts ''%s'' nav atrasts');
    Add('dsReplace', 'Aizvietot ''%s''?');

    Add('TfrxAboutForm',
      'Caption=Î FastReport' + #13#10 +
      'Label4.Caption=Apmeklejiet musu majas lapu:' + #13#10 +
      'Label6.Caption=Pardosanas:' + #13#10 +
      'Label8.Caption=Atbalsts:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Lappuses uzstadijumi' + #13#10 +
      'OKB.Caption=ok' + #13#10 +
      'CancelB.Caption=Atcelt' + #13#10 +
      'TabSheet1.Caption=Lappuse' + #13#10 +
      'Label1.Caption=Platums' + #13#10 +
      'Label2.Caption=Augstums' + #13#10 +
      'Label11.Caption=Formats   ' + #13#10 +
      'Label12.Caption=Orientacija   ' + #13#10 +
      'Label3.Caption=Kreisais' + #13#10 +
      'Label4.Caption=Augsejais' + #13#10 +
      'Label5.Caption=Labais' + #13#10 +
      'Label6.Caption=Apaksejais' + #13#10 +
      'Label13.Caption=Laukumi   ' + #13#10 +
      'Label14.Caption=Papira avots   ' + #13#10 +
      'Label9.Caption=Pirmajai lappusei' + #13#10 +
      'Label10.Caption=Parejam' + #13#10 +
      'PortraitRB.Caption=Vertkali' + #13#10 +
      'LandscapeRB.Caption=Horizontali' + #13#10 +
      'TabSheet3.Caption=Parejie' + #13#10 +
      'Label7.Caption=Kolonnas   ' + #13#10 +
      'Label8.Caption=Daudzums' + #13#10 +
      'Label15.Caption=Platums' + #13#10 +
      'Label16.Caption=Pozicijas' + #13#10 +
      'Label17.Caption=Parejie   ' + #13#10 +
      'Label18.Caption=Duplekss' + #13#10 +
      'PrintOnPrevCB.Caption=Izdruka uz ieprieksejas lappuses' + #13#10 +
      'MirrorMarginsCB.Caption=Spogullaukumi' + #13#10 +
      'LargeHeightCB.Caption=Liels augstums dizaineri' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Atskaites dati' + #13#10 +
      'OKB.Caption=ok' + #13#10 +
      'CancelB.Caption=Atcelt' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Mainigo saraksts' + #13#10 +
      'NewCategoryB.Caption=Kategorija' + #13#10 +
      'NewVarB.Caption=Mainiga' + #13#10 +
      'EditB.Caption=Izmainit' + #13#10 +
      'DeleteB.Caption=Dzest' + #13#10 +
      'EditListB.Caption=Saraksts' + #13#10 +
      'LoadB.Caption=Atvert' + #13#10 +
      'SaveB.Caption=Saglabat' + #13#10 +
      'CancelB.Caption=Atcelt' + #13#10 +
      'OkB.Caption=ok' + #13#10 +
      'ExprPanel.Caption= Izteiksme:' + #13#10 +
      'OpenDialog1.Filter=Mainigo saraksts (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter= Mainigo saraksts (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(nav mainigo)');
    Add('vaVar', 'Mainigie');
    Add('vaDupName', 'Mainigais ar sadu nosaukumu jau eksiste');

    Add('TfrxOptionsEditor',
      'Caption=Dizainera uzst;ad;ijumi' + #13#10 +
      'Label1.Caption=Tikls   ' + #13#10 +
      'Label2.Caption=Veids' + #13#10 +
      'Label3.Caption=Izmers' + #13#10 +
      'Label4.Caption=Dialoga forma:' + #13#10 +
      'Label5.Caption=Parejie   ' + #13#10 +
      'Label6.Caption=Fonti   ' + #13#10 +
      'Label7.Caption=Koda redaktors' + #13#10 +
      'Label8.Caption=Teksta redaktors' + #13#10 +
      'Label9.Caption=Izmers' + #13#10 +
      'Label10.Caption= Izmers ' + #13#10 +
      'Label11.Caption=Krasas   ' + #13#10 +
      'Label12.Caption=Atstarpe starp joslam:' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=in' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=ok' + #13#10 +
      'CancelB.Caption=Atcelt' + #13#10 +
      'CMRB.Caption=Centimetri:' + #13#10 +
      'InchesRB.Caption=Collas:' + #13#10 +
      'PixelsRB.Caption=Punkti:' + #13#10 +
      'ShowGridCB.Caption=Radit tiklu' + #13#10 +
      'AlignGridCB.Caption=Izlidzinat pec tikla' + #13#10 +
      'EditAfterInsCB.Caption=Izsaukt redaktoru pec ievietosanas' + #13#10 +
      'ObjectFontCB.Caption=Izmantot objekta fontu' + #13#10 +
      'WorkspaceB.Caption=Darba laukums' + #13#10 +
      'ToolB.Caption=Logi' + #13#10 +
      'LCDCB.Caption=Laukuma krasa LCD-monitoram' + #13#10 +
      'FreeBandsCB.Caption=Briva joslu izvietosana' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Atjaunot uzstadijumus' + #13#10 +
      'BandsCaptionsCB.Caption=Paradit joslu virsrakstus' + #13#10 +
      '');


    Add('TfrxDataBandEditorForm',
      'Caption=Datu avots' + #13#10 +
      'OkB.Caption=ok' + #13#10 +
      'CancelB.Caption=Atcelt' + #13#10 +
      '');
    Add('dbNotAssigned', '[nav noteikts]');
    Add('dbSingleLine', 'Viena rinda');


    Add('TfrxGroupEditorForm',
      'Caption=Grupa' + #13#10 +
      'BreakOnL.Caption=Noteikumi   ' + #13#10 +
      'OptionsL.Caption=Ipasibas   ' + #13#10 +
      'OKB.Caption=ok' + #13#10 +
      'CancelB.Caption=Atcelt' + #13#10 +
      'DataFieldRB.Caption=BD laukums' + #13#10 +
      'ExpressionRB.Caption=Izteiksme' + #13#10 +
      'KeepGroupTogetherCB.Caption=Izvidot grupu uz vienas lappuses' + #13#10 +
      'StartNewPageCB.Caption=Formet jaunu lappusi' + #13#10 +
      'OutlineCB.Caption=Radit atskaites koku' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=Konteksts' + #13#10 +
      'DataBandL.Caption=Datu josla' + #13#10 +
      'DataSetL.Caption=Datu ievadisana' + #13#10 +
      'DataFieldL.Caption=BD laukums' + #13#10 +
      'FunctionL.Caption=Funkcija' + #13#10 +
      'ExpressionL.Caption=Izteiksme' + #13#10 +
      'OKB.Caption=ok' + #13#10 +
      'CancelB.Caption=Atcelt' + #13#10 +
      'AggregateRB.Caption=Agregata funkcija' + #13#10 +
      'SysVariableRB.Caption=Sistemas mainigais' + #13#10 +
      'CountInvisibleCB.Caption=Atcereties neredzamas joslas' + #13#10 +
      'TextRB.Caption=Teksts' + #13#10 +
      'RunningTotalCB.Caption=Augoss kopejais' + #13#10 +
      '');
    Add('agAggregate', 'Ievietot agregata funkciju');
    Add('vt1', '[DATE]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGES#]');
    Add('vt5', '[PAGE#] no [TOTALPAGES#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=OLE objekts' + #13#10 +
      'InsertB.Caption=Ievietot...' + #13#10 +
      'EditB.Caption=Redaktors...' + #13#10 +
      'CloseB.Caption=Aizvert' + #13#10 +
      '');
    Add('olStretched', 'Izstiepjamais');

    Add('TfrxBarcodeEditorForm',
      'Caption=Svitru kods' + #13#10 +
      'CodeLbl.Caption=Kods' + #13#10 +
      'TypeLbl.Caption=Svitru koda veids' + #13#10 +
      'ZoomLbl.Caption=Merogs:' + #13#10 +
      'OptionsLbl.Caption=ipasibas   ' + #13#10 +
      'RotationLbl.Caption=orientacija   ' + #13#10 +
      'CancelB.Caption=atcelt' + #13#10 +
      'OkB.Caption=ok' + #13#10 +
      'CalcCheckSumCB.Caption=kontroles summa' + #13#10 +
      'ViewTextCB.Caption=paradit tekstu' + #13#10 +
      'Rotation0RB.Caption=0°' + #13#10 +
      'Rotation90RB.Caption=90°' + #13#10 +
      'Rotation180RB.Caption=180°' + #13#10 +
      'Rotation270RB.Caption=270°' + #13#10 +
      '');
    Add('bcCalcChecksum', 'kontroles summa ììà');
    Add('bcShowText', 'paradit tekstu');

    Add('TfrxAliasesEditorForm',
      'Caption=pseidonimi' + #13#10 +
      'HintL.Caption=nospiediet Enter, lai redigetu' + #13#10 +
      'DSAliasL.Caption=datu ievades pseidonimi' + #13#10 +
      'FieldAliasesL.Caption=laukuma pseidonimi' + #13#10 +
      'OkB.Caption=ok' + #13#10 +
      'CancelB.Caption=atcelt' + #13#10 +
      'ResetB.Caption=atcelt' + #13#10 +
      'UpdateB.Caption=atjaunot' + #13#10 +
      '');
    Add('alUserName', 'pseidonims');
    Add('alOriginal', 'pamatnosaukums');

    Add('TfrxParamsEditorForm',
      'Caption=parametri' + #13#10 +
      'OkB.Caption=ok' + #13#10 +
      'CancelB.Caption=atcelt' + #13#10 +
      '');
    Add('qpName', 'nosaukums');
    Add('qpDataType', 'veids');
    Add('qpValue', 'nozime');

    Add('TfrxMDEditorForm',
      'Caption= Master-Detail redaktors' + #13#10 +
      'Label1.Caption= Detail laukums' + #13#10 +
      'Label2.Caption= Master laukums' + #13#10 +
      'Label3.Caption=saistitie laukumi' + #13#10 +
      'AddB.Caption=pievienot' + #13#10 +
      'ClearB.Caption=attirit' + #13#10 +
      'OkB.Caption=ok' + #13#10 +
      'CancelB.Caption=atcelt' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=teksta redaktors' + #13#10 +
      'ExprB.Hint=ievietot izteiksmi' + #13#10 +
      'AggregateB.Hint=ievietot agregata funkciju' + #13#10 +
      'LocalFormatB.Hint=ievietot formatu' + #13#10 +
      'WordWrapB.Hint=parnest vardus' + #13#10 +
      'CancelB.Hint=atcelt' + #13#10 +
      'OkB.Hint=ok' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=attels' + #13#10 +
      'LoadB.Hint=palaist' + #13#10 +
      'CopyB.Hint=kopet' + #13#10 +
      'PasteB.Hint=ievietot' + #13#10 +
      'ClearB.Hint=attirit' + #13#10 +
      'CancelB.Hint=atcelt' + #13#10 +
      'OkB.Hint=ok' + #13#10 +
      '');
    Add('piEmpty', 'tukss');

    Add('TfrxChartEditorForm',
      'Caption=diagramma' + #13#10 +
      'OkB.Caption=ok' + #13#10 +
      'AddB.Hint=pievienot seriju' + #13#10 +
      'DeleteB.Hint=dzest seriju' + #13#10 +
      'DBSourceRB.Caption=dati no BD' + #13#10 +
      'BandSourceRB.Caption=dati no joslas' + #13#10 +
      'FixedDataRB.Caption=fiksetie dati' + #13#10 +
      'DatasetLbl.Caption=datu ievade' + #13#10 +
      'BandLbl.Caption=datu josla' + #13#10 +
      'X1Lbl.Caption=nozime X' + #13#10 +
      'Y1Lbl.Caption= nozime Y' + #13#10 +
      'X2Lbl.Caption= nozime X' + #13#10 +
      'Y2Lbl.Caption= nozime Y' + #13#10 +
      'X3Lbl.Caption= nozime X (piemeram, a;b;c)' + #13#10 +
      'Y3Lbl.Caption= nozime Y (piemeram, 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=ipasibas   ' + #13#10 +
      'ShowTopLbl.Caption=radit TopN nozimes' + #13#10 +
      'CaptionLbl.Caption= TopN virsraksts' + #13#10 +
      'SortLbl.Caption=sortesana' + #13#10 +
      'LineMI.Caption=linijas' + #13#10 +
      'AreaMI.Caption=rajons' + #13#10 +
      'PointMI.Caption=punkti' + #13#10 +
      'BarMI.Caption=taisnsturi' + #13#10 +
      'HorizBarMI.Caption=horizontalie taisnsturi' + #13#10 +
      'PieMI.Caption=diagramma' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=atras linijas' + #13#10 +
      '');
    Add('ch3D', 'tris dimensiju');
    Add('chAxis', 'radit asis');
    Add('chsoNone', 'ne');
    Add('chsoAscending', 'pec augosas');
    Add('chsoDescending', 'pec dilstosas');

    Add('TfrxRichEditorForm',
      'Caption=RichEdit' + #13#10 +
      'OpenB.Hint=atvert' + #13#10 +
      'SaveB.Hint=saglabat' + #13#10 +
      'UndoB.Hint=atcelt' + #13#10 +
      'TTB.Hint=fonts' + #13#10 +
      'ExprB.Hint=ievietot izteiksmi' + #13#10 +
      'CancelB.Hint=atcelt' + #13#10 +
      'OkB.Hint=ok' + #13#10 +
      'BoldB.Hint=treknie burti' + #13#10 +
      'ItalicB.Hint=kursors' + #13#10 +
      'UnderlineB.Hint=pasvitrosana' + #13#10 +
      'LeftAlignB.Hint=izlidzinat tekstu uz kreiso pusi' + #13#10 +
      'CenterAlignB.Hint=izlidzinat tekstu uz centru' + #13#10 +
      'RightAlignB.Hint= izlidzinat tekstu uz labo pusi' + #13#10 +
      'BlockAlignB.Hint=izlidzinat tekstu pec platuma' + #13#10 +
      'BulletsB.Hint=saraksts' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Cross-tab redaktors' + #13#10 +

      'DatasetL.Caption=dati   ' + #13#10 +
      'DimensionsL.Caption=pec izmeriem   ' + #13#10 +
      'RowsL.Caption=rindas' + #13#10 +
      'ColumnsL.Caption=kolonnas' + #13#10 +
      'CellsL.Caption=sunas' + #13#10 +
      'StructureL.Caption=tabulas struktura   ' + #13#10 +
      'RowHeaderCB.Caption=rindas virsraksts' + #13#10 +
      'ColumnHeaderCB.Caption=kolonnas virsraksts' + #13#10 +
      'RowTotalCB.Caption=rindas rezultats' + #13#10 +
      'ColumnTotalCB.Caption=kolonnas rezultats' + #13#10 +
      'SwapB.Hint=mainit rindas/kolonnas' + #13#10 +
      'StyleCB.Hint=veids' + #13#10 +
      'FontB.Hint=fonts' + #13#10 +
      'AlignLeftB.Hint=izlidzinat pa kreisi' + #13#10 +
      'AlignCenterB.Hint=izlidzinat uz centru' + #13#10 +
      'AlignRightB.Hint=izlidzinat pa labi' + #13#10 +
      'RotationB.Hint=teksta apgriesana' + #13#10 +
      'HighlightB.Hint=atlauta izdalisana' + #13#10 +
      'FormatB.Hint=formats' + #13#10 +
      'FrameB.Hint=ramis' + #13#10 +
      'FillColorB.Hint=fona krasa' + #13#10 +
      'Func1MI.Caption=ne' + #13#10 +
      'Func2MI.Caption=summa' + #13#10 +
      'Func3MI.Caption=Min' + #13#10 +
      'Func4MI.Caption=Max' + #13#10 +
      'Func5MI.Caption=Average' + #13#10 +
      'Func6MI.Caption=Count' + #13#10 +
      'Sort1MI.Caption=pec augosa (A-Z)' + #13#10 +
      'Sort2MI.Caption=pec dilstosa (Z-A)' + #13#10 +
      'Sort3MI.Caption=nesortet' + #13#10 +
      'BoldMI.Caption=treknie' + #13#10 +
      'ItalicMI.Caption=kursivs' + #13#10 +

      'UnderlineMI.Caption=pasvitrots' + #13#10 +
      'SuperScriptMI.Caption=virsrindas' + #13#10 +
      'SubScriptMI.Caption=zemrindas' + #13#10 +
      'CondensedMI.Caption=saspiestais' + #13#10 +
      'WideMI.Caption=platais' + #13#10 +
      'N12cpiMI.Caption=12 simboli/collas' + #13#10 +
      'N15cpiMI.Caption=15 simboli/collas' + #13#10 +
      'CancelB.Hint=atcelt' + #13#10 +
      'OkB.Hint=ok' + #13#10 +
      '');
    Add('crSubtotal', 'noklusetais rezultats');
    Add('crNone', 'ne');
    Add('crSum', 'Sum');
    Add('crMin', 'Min');
    Add('crMax', 'Max');
    Add('crAvg', 'Avg');
    Add('crCount', 'Count');
    Add('crAsc', 'À-Z');
    Add('crDesc', 'Z-À');
    Add('crBorder', 'ramis apkart');
    Add('crDown', 'uz apaksu, pec tam uz malu');
    Add('crRepHdrs', 'atkartot virsrakstus');

    Add('TfrxExprEditorForm',
      'Caption=izteikumu redaktors' + #13#10 +
      'ExprL.Caption=izteiciens:' + #13#10 +
      'OkB.Caption=ok' + #13#10 +
      'CancelB.Caption=atcelt' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=formatesana' + #13#10 +
      'CategoryL.Caption=kategorija' + #13#10 +
      'FormatL.Caption=formats' + #13#10 +
      'FormatStrL.Caption=formatesanas rinda:' + #13#10 +
      'SeparatorL.Caption=sadalit dalas:' + #13#10 +
      'OkB.Caption=ok' + #13#10 +
      'CancelB.Caption=atcelt' + #13#10 +
      '');
    Add('fkText', 'teksts');
    Add('fkNumber', 'datums');
    Add('fkDateTime', 'datums/laiks');
    Add('fkBoolean', 'logiskais');
    Add('fkNumber1', '1234.5;%g');
    Add('fkNumber2', '1234.50;%2.2f');
    Add('fkNumber3', '1,234.50;%2.2n');
    Add('fkNumber4', '1,234.50ð;%2.2m');
    Add('fkDateTime1', '28.11.2002;dd.mm.yyyy');
    Add('fkDateTime2', '28 Nov 2002;dd mmm yyyy');
    Add('fkDateTime3', '28 Novembris 2002;dd mmmm yyyy');
    Add('fkDateTime4', '02:14;hh:mm');
    Add('fkDateTime5', '02:14am;hh:mm am/pm');
    Add('fkDateTime6', '02:14:00;hh:mm:ss');
    Add('fkDateTime7', '02:14, 28 Novembris 2002;hh:mm dd mmmm yyyy');
    Add('fkBoolean1', '0,1;0,1');
    Add('fkBoolean2', 'ne/ja;ne,ja');
    Add('fkBoolean3', '_,x;_,x');
    Add('fkBoolean4', 'False,True;False,True');

    Add('TfrxHighlightEditorForm',
      'Caption=atlauta izcelsana' + #13#10 +
      'FontColorB.Caption=krasa...' + #13#10 +
      'BackColorB.Caption=krasa...' + #13#10 +
      'ConditionL.Caption=noteikumi   ' + #13#10 +
      'FontL.Caption=fonts  ' + #13#10 +
      'BackgroundL.Caption=fons ' + #13#10 +
      'OKB.Caption=ok' + #13#10 +
      'CancelB.Caption=atcelt' + #13#10 +
      'BoldCB.Caption=treknais' + #13#10 +
      'ItalicCB.Caption=kursors' + #13#10 +
      'UnderlineCB.Caption=pasvitrotais' + #13#10 +
      'TransparentRB.Caption=caurspidigais' + #13#10 +
      'OtherRB.Caption=parejie' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=atskaites uzstadijumi' + #13#10 +
      'OkB.Caption=ok' + #13#10 +
      'CancelB.Caption=atcelt' + #13#10 +
      'GeneralTS.Caption=pamata' + #13#10 +
      'ReportSettingsL.Caption=Drukas uzstadijumi   ' + #13#10 +
      'CopiesL.Caption=kopijas' + #13#10 +
      'GeneralL.Caption=ipasibas   ' + #13#10 +
      'PasswordL.Caption=parole' + #13#10 +
      'CollateCB.Caption=izdalit pa kopijam' + #13#10 +
      'DoublePassCB.Caption=divas izejas' + #13#10 +
      'PrintIfEmptyCB.Caption=drukat, ja tukss' + #13#10 +
      'DescriptionTS.Caption=apraksts' + #13#10 +
      'NameL.Caption=nosaukums' + #13#10 +
      'Description1L.Caption=apraksts' + #13#10 +
      'PictureL.Caption=attels' + #13#10 +
      'AuthorL.Caption=autors' + #13#10 +
      'MajorL.Caption=Major' + #13#10 +
      'MinorL.Caption=Minor' + #13#10 +
      'ReleaseL.Caption=Release' + #13#10 +
      'BuildL.Caption=Build' + #13#10 +
      'CreatedL.Caption=izveidota' + #13#10 +
      'ModifiedL.Caption=izmainita' + #13#10 +
      'DescriptionL.Caption=apraksts   ' + #13#10 +
      'VersionL.Caption=versija   ' + #13#10 +
      'PictureB.Caption=parlukosana...' + #13#10 +
      '');
    Add('rePrnOnPort', 'uz');

    Add('TfrxStringsEditorForm',
      'Caption=rindas redaktors' + #13#10 +
      'CancelB.Hint=atcelt' + #13#10 +
      'OkB.Hint=ok' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption= SQL redaktors' + #13#10 +
      'CancelB.Hint=atcelt' + #13#10 +
      'OkB.Hint=ok' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=parole' + #13#10 +
      'PasswordL.Caption=ievadiet paroli:' + #13#10 +
      'OkB.Caption=ok' + #13#10 +
      'CancelB.Caption=atcelt' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=veidi' + #13#10 +
      'ColorB.Caption=krasa...' + #13#10 +
      'FontB.Caption=fonts...' + #13#10 +
      'FrameB.Caption=ramis...' + #13#10 +
      'AddB.Hint=pievienot' + #13#10 +
      'DeleteB.Hint=dzest' + #13#10 +
      'EditB.Hint=labojumi' + #13#10 +
      'LoadB.Hint=palaist' + #13#10 +
      'SaveB.Hint=saglabat' + #13#10 +
      'CancelB.Hint=atcelt' + #13#10 +
      'OkB.Hint=ok' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=ramja redaktors' + #13#10 +
      'FrameL.Caption=ramis' + #13#10 +
      'LineL.Caption=linija' + #13#10 +
      'ShadowL.Caption=ena' + #13#10 +
      'FrameTopB.Hint=augseja linija' + #13#10 +
      'FrameBottomB.Hint=apakseja linija' + #13#10 +
      'FrameLeftB.Hint=kreisa linija' + #13#10 +
      'FrameRightB.Hint=laba linija' + #13#10 +
      'FrameAllB.Hint=visas linijas' + #13#10 +
      'FrameNoB.Hint=izslegt linijas' + #13#10 +
      'FrameColorB.Hint=ramja krasa' + #13#10 +
      'FrameStyleB.Hint=ramja stils' + #13#10 +
      'FrameWidthCB.Hint=linijas biezums' + #13#10 +
      'ShadowB.Hint=ena' + #13#10 +
      'ShadowColorB.Hint=enas krasa' + #13#10 +
      'ShadowWidthCB.Hint=enas izmers' + #13#10 +
      'OkB.Caption=ok' + #13#10 +
      'CancelB.Caption=atcelt' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=izveidot jaunu...' + #13#10 +
      'ItemsTab.Caption=saraksts' + #13#10 +
      'TemplatesTab.Caption=sabloni' + #13#10 +
      'OkB.Caption=ok' + #13#10 +
      'CancelB.Caption=atcelt' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption= TabOrder redaktors' + #13#10 +
      'Label1.Caption=vadosie elementi:' + #13#10 +
      'OkB.Caption=ok' + #13#10 +
      'CancelB.Caption=atcelt' + #13#10 +
      'UpB.Caption=uz augsu' + #13#10 +
      'DownB.Caption=uz apaksu' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=izskaitlot' + #13#10 +
      'Label1.Caption=izteiksme' + #13#10 +
      'Label2.Caption=rezultats' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=atskaisu parvaldnieks' + #13#10 +
      'DataTab.Caption=dati' + #13#10 +
      'GroupsTab.Caption=grupas' + #13#10 +
      'LayoutTab.Caption=izvietojums' + #13#10 +
      'StyleTab.Caption=veids' + #13#10 +
      'Step1L.Caption=1. solis izvelieties datus, kurus atspogulosiet atskaite.' + #13#10 +
      'Step2L.Caption= 2. solis izveidojiet grupas (nav obligati).' + #13#10 +
      'Step3L.Caption= 3. solis izvelieties lapas orientaciju un datu izvietojumu.' + #13#10 +
      'Step4L.Caption= 4. solis izvelieties atskaites veidu.' + #13#10 +
      'AddFieldB.Caption=pievienot >' + #13#10 +
      'AddAllFieldsB.Caption=pievienot visu >>' + #13#10 +
      'RemoveFieldB.Caption=< dzest' + #13#10 +
      'RemoveAllFieldsB.Caption=<< dzest visu' + #13#10 +
      'AddGroupB.Caption=pievienot >' + #13#10 +
      'RemoveGroupB.Caption=< dzest' + #13#10 +
      'SelectedFieldsL.Caption=izveletie laukumi:' + #13#10 +
      'AvailableFieldsL.Caption=aktivie laukumi:' + #13#10 +
      'GroupsL.Caption=grupas:' + #13#10 +
      'OrientationL.Caption=orientacija   ' + #13#10 +
      'LayoutL.Caption=izvietojums   ' + #13#10 +
      'PortraitRB.Caption=vertikali' + #13#10 +
      'LandscapeRB.Caption=horizontali' + #13#10 +
      'TabularRB.Caption=tabulas veida' + #13#10 +
      'ColumnarRB.Caption=kolonnu veida' + #13#10 +
      'FitWidthCB.Caption=izvietot laukumus pec platuma' + #13#10 +
      'CancelB.Caption=atcelt' + #13#10 +
      'BackB.Caption=<< atpakal' + #13#10 +
      'NextB.Caption=talak >>' + #13#10 +
      'FinishB.Caption=gatavs' + #13#10 +
      '');
    Add('wzStd', 'standarta atskaites parvaldnieks');
    Add('wzDMP', 'matricas atskaites parvaldnieks');
    Add('wzStdEmpty', 'tuksa standarta atskaite');
    Add('wzDMPEmpty', 'tuksa atskaites matrica');


    Add('ftAllFiles', 'visi faili');
    Add('ftPictures', 'atteli');
    Add('ftDB', 'datu bazes');
    Add('ftRichFile', 'RichText fails');
    Add('ftTextFile', 'teksta fails');

    Add('prNotAssigned', '(nav atrasts)');
    Add('prInvProp', 'nepareizas nozimes ipasibas');
    Add('prDupl', 'nosaukumu atkartosana');
    Add('prPict', '(attels)');

    Add('mvExpr', 'izteicieni teksta');
    Add('mvStretch', 'izstiepjams');
    Add('mvStretchToMax', 'izstiepsana lidz maksimalajam augstumam');
    Add('mvShift', 'savietojams');
    Add('mvShiftOver', 'savietojams pie aizversanas');
    Add('mvVisible', 'redzams');
    Add('mvPrintable', 'drukats');
    Add('mvFont', 'fonts...');
    Add('mvFormat', 'formatesana...');
    Add('mvClear', 'attirit tekstu');
    Add('mvAutoWidth', 'auto platums');
    Add('mvWWrap', 'parnest vardus');
    Add('mvSuppress', 'slept atkartosanu');
    Add('mvHideZ', 'slept nulles');
    Add('mvHTML', 'HTML-atzimes teksta');
    Add('lvDiagonal', 'diagonala');
    Add('pvAutoSize', 'auto izmers');
    Add('pvCenter', 'centret');
    Add('pvAspect', 'saglabat proporcijas');
    Add('bvSplit', 'atlaut dalisanu');
    Add('bvKeepChild', 'turet Child kopa');
    Add('bvPrintChild', 'drukat Child, ja pec noklusejuma');
    Add('bvStartPage', 'formatet jaunu lappusi');
    Add('bvPrintIfEmpty', 'drukat, ja Detail ir tukss');
    Add('bvKeepDetail', 'turet Detail kopa');
    Add('bvKeepFooter', 'turet joslu kopa');
    Add('bvReprint', 'ievietot jauna lappuse');
    Add('bvOnFirst', 'drukat uz pirmas lappuses');
    Add('bvOnLast', 'drukat uz pedejas lappuses');
    Add('bvKeepGroup', 'turet kopa');
    Add('bvFooterAfterEach', 'Footer pec katra ieraksta');
    Add('srParent', 'drukat uz joslas');
    Add('bvKeepHeader', 'turet virsrakstu kopa');

    Add('obCatDraw', 'zimesana');
    Add('obCatOther', 'citi objekti');
    Add('obCatOtherControls', 'citi elementi');
    Add('obDiagLine', 'diagonala linija');
    Add('obRect', 'taisnsturis');
    Add('obRoundRect', 'noapalots taisnsturis');
    Add('obEllipse', 'elipse');
    Add('obTrian', 'trijsturis');
    Add('obDiamond', 'rombs');
    Add('obLabel', 'Label vadosais elements');
    Add('obEdit', 'Edit vadosais elements');
    Add('obMemoC', 'Memo vadosais elements');
    Add('obButton', 'Button vadosais elements');
    Add('obChBoxC', 'CheckBox vadosais elements');
    Add('obRButton', 'RadioButton vadosais elements');
    Add('obLBox', 'ListBox vadosais elements');
    Add('obCBox', 'ComboBox vadosais elements');
    Add('obDateEdit', 'DateEdit vadosais elements');
    Add('obImageC', 'Image vadosais elements');
    Add('obPanel', 'Panel vadosais elements');
    Add('obGrBox', 'GroupBox vadosais elements');
    Add('obBBtn', 'BitBtn vadosais elements');
    Add('obSBtn', 'SpeedButton vadosais elements');
    Add('obMEdit', 'MaskEdit vadosais elements');
    Add('obChLB', 'CheckListBox vadosais elements');
    Add('obDBLookup', 'DBLookupComboBox vadosais elements');
    Add('obBevel', 'Bevel vadosais elements');
    Add('obShape', 'Shape vadosais elements');
    Add('obText', 'objekts "teksts"');
    Add('obSysText', ' objekts "dienesta teksts"');
    Add('obLine', ' objekts "linija"');
    Add('obPicture', ' objekts "zimejums"');
    Add('obBand', ' objekts "josla"');
    Add('obDataBand', ' objekts "datu josla"');
    Add('obSubRep', ' objekts "ievietota atskaite"');
    Add('obDlgPage', 'dialoga forma');
    Add('obRepPage', 'atskaites lappuse');
    Add('obReport', ' objekts "atskaite"');
    Add('obRich', ' objekts "RichText"');
    Add('obOLE', ' objekts "OLE"');
    Add('obChBox', ' objekts "CheckBox"');
    Add('obChart', ' objekts "diagramma"');
    Add('obBarC', ' objekts "svitru kods"');
    Add('obCross', ' objekts "Cross-tab"');
    Add('obDBCross', ' objekts "DB Cross-tab"');
    Add('obGrad', ' objekts "gradients"');
    Add('obDMPText', ' objekts "matricas teksts"');
    Add('obDMPLine', ' objekts "matricas linija"');
    Add('obBDEDB', 'BDE datu baze');
    Add('obBDETb', ' BDE tabula');
    Add('obBDEQ', ' BDE pieteikums');
    Add('obBDEComps', 'BDE komponenti');
    Add('obIBXDB', 'IBX datu baze');
    Add('obIBXTb', ' IBX tabula');
    Add('obIBXQ', 'IBX pieteikums');
    Add('obIBXComps', ' IBX komponenti');
    Add('obADODB', 'ADO datu baze');
    Add('obADOTb', ' ADO tabula');
    Add('obADOQ', ' ADO pieteikums');
    Add('obADOComps', 'ADO komponenti');
    Add('obDBXDB', 'DBX datu baze');
    Add('obDBXTb', 'DBX tabula');
    Add('obDBXQ', ' DBX pieteikums');
    Add('obDBXComps', 'DBX komponenti ');

    Add('ctString', 'linijas');
    Add('ctDate', 'datums un laiks');
    Add('ctConv', 'konvertesana');
    Add('ctFormat', 'formatesana');
    Add('ctMath', 'matematiskie');
    Add('ctOther', 'parejie');

    Add('IntToStr', 'konverte veselu skaitli uz rindu');
    Add('FloatToStr', 'konverte mantisko skaitli uz rindu');
    Add('DateToStr', 'konverte datumu uz rindu');
    Add('TimeToStr', 'konverte laiku uz rindu');
    Add('DateTimeToStr', 'konverte datumu un laiku uz rindu ');
    Add('VarToStr', 'konverte variantu uz rindu');
    Add('StrToInt', 'konverte rindu uz veselu skaitli');
    Add('StrToFloat', 'konverte rindu uz mantisko skaitli');
    Add('StrToDate', 'konverte rindu uz datumu');
    Add('StrToTime', 'konverte rindu uz laiku');
    Add('StrToDateTime', 'konverte rindu uz datumu un laiku');
    Add('Format', 'atjauno formateto rindu');
    Add('FormatFloat', 'formate mantisko skaitli');
    Add('FormatDateTime', 'formate datumu un laiku');
    Add('FormatMaskText', 'formate tekstu, izmantojot aizsegmasku');
    Add('EncodeDate', 'atjauno nozimi TDateTime, kura atbilst iestatijumiem Year, Month, Day');
    Add('DecodeDate', 'dala nozimi TDateTime uz iestatijumiem Year, Month, Day');
    Add('EncodeTime', 'atjauno nozimi TDateTime, kura atbilst iestatijumiem Hour, Min, Sec, MSec');
    Add('DecodeTime', 'dala nozimi TDateTime uz iestatijumiem Hour, Min, Sec, MSec');
    Add('Date', 'atjauno tekoso datumu');
    Add('Time', 'atjauno tekoso laiku');
    Add('Now', 'atjauno tekoso datumu un laiku');
    Add('DayOfWeek', 'atjauno nedelas numuru, atbilst iestatitajam datumam');
    Add('IsLeapYear', 'atjauno True, ja iestatitais gads - ir garais');
    Add('DaysInMonth', 'atjauno dienu skaitu iestatitaja menesi');
    Add('Length', 'atjauno rindas garumu');
    Add('Copy', 'atjauno apaks rindu');
    Add('Pos', 'atjauno apaks rindas poziciju rinda');
    Add('Delete', 'dzes dalu no simboliem rinda');
    Add('Insert', 'ievieto apaks rindu rinda');
    Add('Uppercase', 'konverte visus rindas simbolus uz augsejo registru');
    Add('Lowercase', 'konverte visus rindas simbolus uz apaksejo registru');
    Add('Trim', 'dzes atstarpes rindas sakuma un beigas');
    Add('NameCase', 'konverte pirmo varda simbolu uz augsejo registru');
    Add('CompareText', 'izlidzina divas rindas neskaitot registru');
    Add('Chr', 'konverte veselu skaitli uz simbolu');
    Add('Ord', 'konverte simbolu uz veselu skaitli');
    Add('SetLength', 'uzstada rindas garumu');
    Add('Round', 'noapalo skaitli lidz tuvakajai veselajai nozimei');
    Add('Trunc', 'atmet skaitla dalu');
    Add('Int', 'atjauno mantiska skaitla veselo nozimi');
    Add('Frac', 'atjauno dalskaitla veselo nozimi');
    Add('Sqrt', 'atjauno kvadratsakni no skaitla');
    Add('Abs', 'atjauno skaitla moduli');
    Add('Sin', 'atjauno lenka sinusu (radinos)');
    Add('Cos', 'atjauno lenka kosinusu (radinos)');
    Add('ArcTan', 'atjauno arktangensu');
    Add('Tan', 'atjauno tangensu');
    Add('Exp', 'atjauno eksponentu');
    Add('Ln', 'atjauno logaritmu iestatitaja skaitli');
    Add('Pi', 'atjauno skaitli "pi"');
    Add('Inc', 'palielina veselo skaitli uz 1');
    Add('Dec', 'samazina veselo skaitli uz 1');
    Add('RaiseException', 'izsauc pielaujamos iestatijumus');
    Add('ShowMessage', 'rada pazinojuma logu');
    Add('Randomize', 'palaiz nejauso skaitlu generatoru');
    Add('Random', 'atjauno nejauso skaitli');
    Add('ValidInt', 'atjauno True, ja dota rinda var tikt parveidota par skaitli');
    Add('ValidFloat', 'atjauno True, ja dota rinda var tikt parveidota par mantisko skaitli');
    Add('ValidDate', 'atjauno True, ja dota rinda var tikt parveidota par datumu');
    Add('IIF', 'atjauno TrueValue, ja iestatita izteiksme vienada ar True, preteja gadijuma tiek atjaunota FalseValue');
    Add('Get', 'atjauno mainigo nozimi no mainigo saraksta');
    Add('Set', 'uzstada mainigo nozimi no mainigo saraksta');
    Add('InputBox', 'rada rindas ievades dialogu');
    Add('InputQuery', 'rada rindas ievades dialogu');
    Add('MessageDlg', 'rada pazinojuma logu');
    Add('CreateOleObject', 'izveido OLE objektu');
    Add('VarArrayCreate', 'izveido variantu masivu');
    Add('VarType', 'atjauno varianta veidu');
    Add('DayOf', 'atjauno dienu (1..31) datumus Date');
    Add('MonthOf', 'atjauno menesi (1..12) datumus Date');
    Add('YearOf', 'atjauno gada datumus Date');

    Add('ctAggregate', 'agregata');
    Add('Sum', 'atgriez izteiksmes summu Expr joslai Band');
    Add('Avg', 'atjauno videjo izteiksmes nozimi Expr joslai Band');
    Add('Min', 'atjauno izteiksmes minimalo nozimi Expr joslai Band');
    Add('Max', 'atjauno maksimalo izteiksmes nozimi Expr joslai Band');
    Add('Count', 'atjauno rindu daudzumu josla Band');
  end;
end;


initialization
  frAddDesignerRes;

end.