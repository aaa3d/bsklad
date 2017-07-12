// German translation by Wolfgang Kleinrath 2004.09.03
// Weitere Anpassungen von Robert Wismet (www.rowisoft.de) 2004.10.10
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
      'Caption=Objektinspector' + #13#10 +
      '');
    Add('oiProp', 'Eigenschaften');
    Add('oiEvent', 'Ereignisse');

    Add('TfrxDataTreeForm',
      'Caption=Datenbaum' + #13#10 +
      'DataTS.Caption=Daten' + #13#10 +
      'VariablesTS.Caption=Variablen' + #13#10 +
      'FunctionsTS.Caption=Funktionen' + #13#10 +
      'InsFieldCB.Caption=Erzeuge Feld' + #13#10 +
      'InsCaptionCB.Caption=Erzeuge Beschriftung' + #13#10 +
      '');
    Add('dtNoData', 'Keine Daten verfügbar');
    Add('dtData', 'Daten');
    Add('dtSysVar', 'Systemvariablen');
    Add('dtVar', 'Variablen');
    Add('dtFunc', 'Funktionen');

    Add('TfrxReportTreeForm',
      'Caption=Reportbaum' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Scriptdatei öffnen' + #13#10 +
      'SaveScriptB.Hint=Scriptdatei speichern' + #13#10 +
      'RunScriptB.Hint=Script ausführen' + #13#10 +
      'StepScriptB.Hint=Einzelne Anweisung' + #13#10 +
      'StopScriptB.Hint=Script beenden' + #13#10 +
      'EvaluateB.Hint=Auswerten' + #13#10 +
      'LangL.Caption=Sprache:' + #13#10 +
      'AlignTB.Caption=Ausrichtung' + #13#10 +
      'AlignLeftsB.Hint=Ausrichtung links' + #13#10 +
      'AlignHorzCentersB.Hint=Ausrichtung zentriert' + #13#10 +
      'AlignRightsB.Hint=Ausrichtung rechts' + #13#10 +
      'AlignTopsB.Hint=Ausrichtung Oben' + #13#10 +
      'AlignVertCentersB.Hint=Ausrichtung Mitte' + #13#10 +
      'AlignBottomsB.Hint=Ausrichtung unten' + #13#10 +
      'SpaceHorzB.Hint=Abstand horizontal' + #13#10 +
// und Gerd Rech (www.iq-s.de) 
      'SpaceVertB.Hint=Abstand vertikal' + #13#10 +
      'CenterHorzB.Hint=Horizontal im Band zentrieren' + #13#10 +
      'CenterVertB.Hint=Vertikal im Band zentrieren' + #13#10 +
      'SameWidthB.Hint=Gleiche Breite' + #13#10 +
      'SameHeightB.Hint=Gleiche Höhe' + #13#10 +
      'TextTB.Caption=Text' + #13#10 +
      'StyleCB.Hint=Stil' + #13#10 +
      'FontNameCB.Hint=Schriftname' + #13#10 +
      'FontSizeCB.Hint=Schriftgröße' + #13#10 +
      'BoldB.Hint=Fett' + #13#10 +
      'ItalicB.Hint=Kursiv' + #13#10 +
      'UnderlineB.Hint=Unterstrichen' + #13#10 +
      'FontColorB.Hint=Schriftfarbe' + #13#10 +
      'HighlightB.Hint=Hervorheben' + #13#10 +
      'RotateB.Hint=Textdrehung' + #13#10 +
      'TextAlignLeftB.Hint=Ausrichtund links' + #13#10 +
      'TextAlignCenterB.Hint=Ausrichtung zentriert' + #13#10 +
      'TextAlignRightB.Hint=Ausrichtung rechts' + #13#10 +
      'TextAlignBlockB.Hint=Blocksatz' + #13#10 +
      'TextAlignTopB.Hint=Ausrichtung oben' + #13#10 +
      'TextAlignMiddleB.Hint=Ausrichtung Mitte' + #13#10 +
      'TextAlignBottomB.Hint=Ausrichtung unten' + #13#10 +
      'FrameTB.Caption=Rahmen' + #13#10 +
      'FrameTopB.Hint=Linie oben' + #13#10 +
      'FrameBottomB.Hint=Linie unten' + #13#10 +
      'FrameLeftB.Hint=Linie links' + #13#10 +
      'FrameRightB.Hint=Linie rechts' + #13#10 +
      'FrameAllB.Hint=Alle Rahmenlinien' + #13#10 +
      'FrameNoB.Hint=Kein Rahmen' + #13#10 +
      'ShadowB.Hint=Schatten' + #13#10 +
      'FillColorB.Hint=Hintergrundfarbe' + #13#10 +
      'FrameColorB.Hint=Rahmenfarbe' + #13#10 +
      'FrameStyleB.Hint=Rahmenstil' + #13#10 +
      'FrameWidthCB.Hint=Rahmenbreite' + #13#10 +
      'StandardTB.Caption=Standard' + #13#10 +
      'NewB.Hint=Neuer Report' + #13#10 +
      'OpenB.Hint=Report öffnen' + #13#10 +
      'SaveB.Hint=Report speichern' + #13#10 +
      'PreviewB.Hint=Vorschau' + #13#10 +
      'NewPageB.Hint=Neue Reportseite' + #13#10 +
      'NewDialogB.Hint=Neue Dialogseite' + #13#10 +
      'DeletePageB.Hint=Seite löschen' + #13#10 +
      'PageSettingsB.Hint=Seiteneinstellungen' + #13#10 +
      'VariablesB.Hint=Variablen' + #13#10 +
      'CutB.Hint=Ausschneiden' + #13#10 +
      'CopyB.Hint=Kopieren' + #13#10 +
      'PasteB.Hint=Einfügen' + #13#10 +
      'SampleFormatB.Hint=Format kopieren' + #13#10 +
      'UndoB.Hint=Rückgängig' + #13#10 +
      'RedoB.Hint=Wiederherstellen' + #13#10 +
      'ShowGridB.Hint=Gitter anzeigen' + #13#10 +
      'AlignToGridB.Hint=Am Gitter ausrichten' + #13#10 +
      'SetToGridB.Hint=An Gitter anpassen' + #13#10 +
      'ScaleCB.Hint=Zoom' + #13#10 +
      'ExtraToolsTB.Caption=Extrawerkzeuge' + #13#10 +
      'ObjectSelectB.Hint=Auswahlwerkzeug' + #13#10 +
      'HandToolB.Hint=Hand' + #13#10 +
      'ZoomToolB.Hint=Zoom' + #13#10 +
      'TextToolB.Hint=Textbearbeitung' + #13#10 +
      'FormatToolB.Hint=Format kopieren' + #13#10 +
      'ObjectBandB.Hint=Band einfügen' + #13#10 +
      'FileMenu.Caption=&Datei' + #13#10 +
      'EditMenu.Caption=&Bearbeiten' + #13#10 +
      'FindMI.Caption=Suchen...' + #13#10 +
      'FindNextMI.Caption=Weitersuchen' + #13#10 +
      'ReplaceMI.Caption=Ersetzen...' + #13#10 +
      'ReportMenu.Caption=&Report' + #13#10 +
      'ReportDataMI.Caption=Daten...' + #13#10 +
      'ReportSettingsMI.Caption=Optionen...' + #13#10 +
      'ReportStylesMI.Caption=Stile...' + #13#10 +
      'ViewMenu.Caption=&Ansicht' + #13#10 +
      'ToolbarsMI.Caption=Symbolleisten' + #13#10 +
      'StandardMI.Caption=Standard' + #13#10 +
      'TextMI.Caption=Text' + #13#10 +
      'FrameMI.Caption=Rahmen' + #13#10 +
      'AlignmentMI.Caption=Ausrichtungspalette' + #13#10 +
      'ToolsMI.Caption=Extrawerkzeuge' + #13#10 +
      'InspectorMI.Caption=Objektinspektor' + #13#10 +
      'DataTreeMI.Caption=Datenbaum' + #13#10 +
      'ReportTreeMI.Caption=Reportbaum' + #13#10 +
      'ShowRulersMI.Caption=Lineale' + #13#10 +
      'ShowGuidesMI.Caption=Führungslinien' + #13#10 +
      'DeleteGuidesMI.Caption=Führungslinien löschen' + #13#10 +
      'OptionsMI.Caption=Optionen...' + #13#10 +
      'HelpMenu.Caption=&Hilfe' + #13#10 +
      'HelpContentsMI.Caption=Inhalt...' + #13#10 +
      'AboutMI.Caption=Über FastReport...' + #13#10 +
      'TabOrderMI.Caption=Tabreihenfolge...' + #13#10 +
      'UndoCmd.Caption=Rückgängig' + #13#10 +
      'RedoCmd.Caption=Wiederherstellen' + #13#10 +
      'CutCmd.Caption=Ausschneiden' + #13#10 +
      'CopyCmd.Caption=Kopieren' + #13#10 +
      'PasteCmd.Caption=Einfügen' + #13#10 +
      'DeleteCmd.Caption=Löschen' + #13#10 +
      'DeletePageCmd.Caption=Seite löschen' + #13#10 +
      'SelectAllCmd.Caption=Alles auswählen' + #13#10 +
      'EditCmd.Caption=Bearbeiten...' + #13#10 +
      'BringToFrontCmd.Caption=Nach vorne setzen' + #13#10 +
      'SendToBackCmd.Caption=Nach hinten setzen' + #13#10 +
      'NewItemCmd.Caption=Neu...' + #13#10 +
      'NewReportCmd.Caption=Neuer Report' + #13#10 +
      'NewPageCmd.Caption=Neue Seite' + #13#10 +
      'NewDialogCmd.Caption=Neuer Dialog' + #13#10 +
      'OpenCmd.Caption=Öffnen...' + #13#10 +
      'SaveCmd.Caption=Speichern' + #13#10 +
      'SaveAsCmd.Caption=Speichern unter...' + #13#10 +
      'VariablesCmd.Caption=Variablen...' + #13#10 +
      'PageSettingsCmd.Caption=Seiteneinstellungen...' + #13#10 +
      'PreviewCmd.Caption=Vorschau' + #13#10 +
      'ExitCmd.Caption=Beenden' + #13#10 +
      'ReportTitleMI.Caption=Reporttitel' + #13#10 +
      'ReportSummaryMI.Caption=Reportzusammenfassung' + #13#10 +
      'PageHeaderMI.Caption=Seitenkopf' + #13#10 +
      'PageFooterMI.Caption=Seitenfuß' + #13#10 +
      'HeaderMI.Caption=Kopf' + #13#10 +
      'FooterMI.Caption=Fuß' + #13#10 +
      'MasterDataMI.Caption=Masterdaten' + #13#10 +
      'DetailDataMI.Caption=Detaildaten' + #13#10 +
      'SubdetailDataMI.Caption=Subdetaildaten' + #13#10 +
      'Data4levelMI.Caption=Daten 4. Ebene' + #13#10 +
      'Data5levelMI.Caption=Daten 5. Ebene' + #13#10 +
      'Data6levelMI.Caption=Daten 6. Ebene' + #13#10 +
      'GroupHeaderMI.Caption=Gruppenkopf' + #13#10 +
      'GroupFooterMI.Caption=Gruppenfuß' + #13#10 +
      'ChildMI.Caption=Child' + #13#10 +
      'ColumnHeaderMI.Caption=Spaltenkopf' + #13#10 +
      'ColumnFooterMI.Caption=Spaltenfuß' + #13#10 +
      'OverlayMI.Caption=Overlay' + #13#10 +
      'VerticalbandsMI.Caption=Vertikale Bänder' + #13#10 +
      'HeaderMI1.Caption=Kopf' + #13#10 +
      'FooterMI1.Caption=Fuß' + #13#10 +
      'MasterDataMI1.Caption=Masterdaten' + #13#10 +
      'DetailDataMI1.Caption=Detaildaten' + #13#10 +
      'SubdetailDataMI1.Caption=Subdetaildaten' + #13#10 +
      'GroupHeaderMI1.Caption=Gruppenkopf' + #13#10 +
      'GroupFooterMI1.Caption=Gruppenfuß' + #13#10 +
      'ChildMI1.Caption=Child' + #13#10 +
      'R0MI.Caption=0°' + #13#10 +
      'R45MI.Caption=45°' + #13#10 +
      'R90MI.Caption=90°' + #13#10 +
      'R180MI.Caption=180°' + #13#10 +
      'R270MI.Caption=270°' + #13#10 +
      'FontB.Hint=Schrifteinstellungen' + #13#10 +
      'BoldMI.Caption=Fett' + #13#10 +
      'ItalicMI.Caption=Kursiv' + #13#10 +
      'UnderlineMI.Caption=Unterstrichen' + #13#10 +
      'SuperScriptMI.Caption=Hochgestellt' + #13#10 +
      'SubScriptMI.Caption=Tiefgestellt' + #13#10 +
      'CondensedMI.Caption=Eng' + #13#10 +
      'WideMI.Caption=Weit' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'OpenDialog.Filter=Report (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=Pascaldateien (*.pas)|*.pas|C++ Dateien (*.cpp)|*.cpp|JavaScriptdateien (*.js)|*.js|Basicdateien (*.vb)|*.vb|Alle Dateien|*.*' + #13#10 +
      'SaveScriptDialog.Filter=Pascaldateien (*.pas)|*.pas|C++ Dateien (*.cpp)|*.cpp|JavaScriptdateien (*.js)|*.js|Basicdateien (*.vb)|*.vb|Alle Dateien|*.*' + #13#10 +
      'GroupB.Hint=Gruppieren' + #13#10 +
      'UngroupB.Hint=Gruppierung aufheben' + #13#10 +
      'GroupCmd.Caption=Gruppieren' + #13#10 +
      'UngroupCmd.Caption=Gruppierung aufheben' + #13#10 +
      '');
    Add('dsCm', 'Zentimeter');
    Add('dsInch', 'Zoll');
    Add('dsPix', 'Pixel');
    Add('dsChars', 'Zeichen');
    Add('dsCode', 'Code');
    Add('dsPage', 'Seite');
    Add('dsRepFilter', 'Report (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'Komprimierter Report (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', 'Änderungen an der Vorschau speichern?');
    Add('dsSaveChangesTo', 'Änderungen speichern ');
    Add('dsCantLoad', 'Datei kann nicht geladen werden');
    Add('dsStyleFile', 'Stil');
    Add('dsCantFindProc', 'Hauptprozedur kann nicht gefunden werden');
    Add('dsClearScript', 'Gesamter Code wird gelöscht. Fortfahren?');
    Add('dsNoStyle', 'Kein Stil');
    Add('dsStyleSample', 'Stilbeispiel');
    Add('dsTextNotFound', 'Text ''%s'' nicht gefunden');
    Add('dsReplace', 'Dieses Vorkommen von ''%s'' ersetzen?');

    Add('TfrxAboutForm',
      'Caption=Über FastReport' + #13#10 +
      'Label4.Caption=Weitere Informationen unter:' + #13#10 +
      'Label6.Caption=Verkauf:' + #13#10 +
      'Label8.Caption=Support:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Page Optionen' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      'TabSheet1.Caption=Papier' + #13#10 +
      'Label1.Caption=Breite' + #13#10 +
      'Label2.Caption=Höhe' + #13#10 +
      'Label11.Caption=Größe   ' + #13#10 +
      'Label12.Caption=Ausrichtung   ' + #13#10 +
      'Label3.Caption=Links' + #13#10 +
      'Label4.Caption=Oben' + #13#10 +
      'Label5.Caption=Rechts' + #13#10 +
      'Label6.Caption=Unten' + #13#10 +
      'Label13.Caption=Ränder   ' + #13#10 +
      'Label14.Caption=Papierzufuhr   ' + #13#10 +
      'Label9.Caption=Erste Seite' + #13#10 +
      'Label10.Caption=Andere Seiten' + #13#10 +
      'PortraitRB.Caption=Hochformat' + #13#10 +
      'LandscapeRB.Caption=Querformat' + #13#10 +
      'TabSheet3.Caption=Andere Optionen' + #13#10 +
      'Label7.Caption=Spalten   ' + #13#10 +
      'Label8.Caption=Nummer' + #13#10 +
      'Label15.Caption=Breite' + #13#10 +
      'Label16.Caption=Positionen' + #13#10 +
      'Label17.Caption=Sonst   ' + #13#10 +
      'Label18.Caption=Duplex' + #13#10 +
      'PrintOnPrevCB.Caption=Auf vorige Seite drucken' + #13#10 +
      'MirrorMarginsCB.Caption=Ränder spiegeln' + #13#10 +
      'LargeHeightCB.Caption=Seitenhöhe im Entwurfsmodus vergrößern' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Datasets für Report auswählen' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Variablen' + #13#10 +
      'NewCategoryB.Caption=Kategorie' + #13#10 +
      'NewVarB.Caption=Variable' + #13#10 +
      'EditB.Caption=Bearbeiten' + #13#10 +
      'DeleteB.Caption=Löschen' + #13#10 +
      'EditListB.Caption=Liste' + #13#10 +
      'LoadB.Caption=Öffnen' + #13#10 +
      'SaveB.Caption=Speichern' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'ExprPanel.Caption= Ausdruck:' + #13#10 +
      'OpenDialog1.Filter=Dictionary (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Dictionary (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(Keine Variablen definiert)');
    Add('vaVar', 'Variablen');
    Add('vaDupName', 'Doppelter Name');

    Add('TfrxOptionsEditor',
      'Caption=Entwurfsoptionen' + #13#10 +
      'Label1.Caption=Gitter   ' + #13#10 +
      'Label2.Caption=Typ' + #13#10 +
      'Label3.Caption=Größe' + #13#10 +
      'Label4.Caption=Dialogformular:' + #13#10 +
      'Label5.Caption=Sonst   ' + #13#10 +
      'Label6.Caption=Schriften   ' + #13#10 +
      'Label7.Caption=Codefenster' + #13#10 +
      'Label8.Caption=Memoeditor' + #13#10 +
      'Label9.Caption=Größe' + #13#10 +
      'Label10.Caption=Größe' + #13#10 +
      'Label11.Caption=Farben   ' + #13#10 +
      'Label12.Caption=Abstand zwischen Bändern:' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=Zoll' + #13#10 +
      'Label15.Caption=Punkt' + #13#10 +
      'Label16.Caption=Punkt' + #13#10 +
      'Label17.Caption=Punkt' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      'CMRB.Caption=Zentimeter:' + #13#10 +
      'InchesRB.Caption=Zoll:' + #13#10 +
      'PixelsRB.Caption=Pixel:' + #13#10 +
      'ShowGridCB.Caption=Gitter anzeigen' + #13#10 +
      'AlignGridCB.Caption=Am Gitter ausrichten' + #13#10 +
      'EditAfterInsCB.Caption=Editor nach dem Einfügen anzeigen' + #13#10 +
      'ObjectFontCB.Caption=Schrift des Objekts verwenden' + #13#10 +
      'WorkspaceB.Caption=Arbeitsbereich' + #13#10 +
      'ToolB.Caption=Werkzeugfenster' + #13#10 +
      'LCDCB.Caption=LCD Gitterfarbe' + #13#10 +
      'FreeBandsCB.Caption=Freie Bandpositionierung' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Vorgaben wiederherstellen' + #13#10 +
      'BandsCaptionsCB.Caption=Bandbezeichnungen anzeigen' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=DataSet wählen' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      '');
    Add('dbNotAssigned', '[nicht zugeordnet]');
    Add('dbSingleLine', 'Einzelne Zeile');

    Add('TfrxGroupEditorForm',
      'Caption=Gruppe' + #13#10 +
      'BreakOnL.Caption=Umbruch bei   ' + #13#10 +
      'OptionsL.Caption=Optionen   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      'DataFieldRB.Caption=Datenfeld' + #13#10 +
      'ExpressionRB.Caption=Ausdruck' + #13#10 +
      'KeepGroupTogetherCB.Caption=Gruppe zusammenhalten' + #13#10 +
      'StartNewPageCB.Caption=Neue Seite beginnen' + #13#10 +
      'OutlineCB.Caption=Im Baum zeigen' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=System Memo' + #13#10 +
      'DataBandL.Caption=Datenband' + #13#10 +
      'DataSetL.Caption=DataSet' + #13#10 +
      'DataFieldL.Caption=Datenfeld' + #13#10 +
      'FunctionL.Caption=Funktion' + #13#10 +
      'ExpressionL.Caption=Ausdruck' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      'AggregateRB.Caption=Aggregatwert' + #13#10 +
      'SysVariableRB.Caption=Systemvariable' + #13#10 +
      'CountInvisibleCB.Caption=Unsichtbare Bänder zählen' + #13#10 +
      'TextRB.Caption=Text' + #13#10 +
      'RunningTotalCB.Caption=Kumulative Summe' + #13#10 +
      '');
    Add('agAggregate', 'Aggregat einfügen');
    Add('vt1', '[DATE]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGES#]');
    Add('vt5', '[PAGE#] of [TOTALPAGES#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=OLE Objekt' + #13#10 +
      'InsertB.Caption=Einfügen...' + #13#10 +
      'EditB.Caption=Bearbeiten...' + #13#10 +
      'CloseB.Caption=Schließen' + #13#10 +
      '');
    Add('olStretched', 'Gedehnt');

    Add('TfrxBarcodeEditorForm',
      'Caption=Barcodeeditor' + #13#10 +
      'CodeLbl.Caption=Code' + #13#10 +
      'TypeLbl.Caption=Typ des Barcodes' + #13#10 +
      'ZoomLbl.Caption=Zoom:' + #13#10 +
      'OptionsLbl.Caption=Optionen   ' + #13#10 +
      'RotationLbl.Caption=Drehung   ' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CalcCheckSumCB.Caption=Checksumme berechnen ' + #13#10 +
      'ViewTextCB.Caption=Text' + #13#10 +
      'Rotation0RB.Caption=0°' + #13#10 +
      'Rotation90RB.Caption=90°' + #13#10 +
      'Rotation180RB.Caption=180°' + #13#10 +
      'Rotation270RB.Caption=270°' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Checksumme berechnen');
    Add('bcShowText', 'Text anzeigen');

    Add('TfrxAliasesEditorForm',
      'Caption=Aliase bearbeiten' + #13#10 +
      'HintL.Caption=Enter drücken zum Bearbeiten' + #13#10 +
      'DSAliasL.Caption=Datasetalias' + #13#10 +
      'FieldAliasesL.Caption=Feldaliase' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      'ResetB.Caption=Zurücksetzen' + #13#10 +
      'UpdateB.Caption=Update' + #13#10 +
      '');
    Add('alUserName', 'Benutzername');
    Add('alOriginal', 'Originalname');

    Add('TfrxParamsEditorForm',
      'Caption=Parametereditor' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      '');
    Add('qpName', 'Name');
    Add('qpDataType', 'Datentyp');
    Add('qpValue', 'Wert');

    Add('TfrxMDEditorForm',
      'Caption=Master-Detailverknüpfung' + #13#10 +
      'Label1.Caption=Detailfelder' + #13#10 +
      'Label2.Caption=Masterfelder' + #13#10 +
      'Label3.Caption=Verknüpfte Felder' + #13#10 +
      'AddB.Caption=Hinzufügen' + #13#10 +
      'ClearB.Caption=Löschen' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=Memo' + #13#10 +
      'ExprB.Hint=Ausdruck einfügen' + #13#10 +
      'AggregateB.Hint=Aggregat einfügen' + #13#10 +
      'LocalFormatB.Hint=Formatierung einfügen' + #13#10 +
      'WordWrapB.Hint=Zeilenumbruch' + #13#10 +
      'CancelB.Hint=Abbruch' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=Bild' + #13#10 +
      'LoadB.Hint=Öffnen' + #13#10 +
      'CopyB.Hint=Kopieren' + #13#10 +
      'PasteB.Hint=Einfügen' + #13#10 +
      'ClearB.Hint=Löschen' + #13#10 +
      'CancelB.Hint=Abbruch' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('piEmpty', 'Leer');

    Add('TfrxChartEditorForm',
      'Caption=Diagrammeditor' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=Serien hinzufügen' + #13#10 +
      'DeleteB.Hint=Serien löschen' + #13#10 +
      'DBSourceRB.Caption=Daten von DB' + #13#10 +
      'BandSourceRB.Caption=Band Quelle' + #13#10 +
      'FixedDataRB.Caption=Fixe Daten' + #13#10 +
      'DatasetLbl.Caption=Dataset' + #13#10 +
      'BandLbl.Caption=Daten-Band' + #13#10 +
      'X1Lbl.Caption=X Werte' + #13#10 +
      'Y1Lbl.Caption=Y Werte' + #13#10 +
      'X2Lbl.Caption=X Werte' + #13#10 +
      'Y2Lbl.Caption=Y Werte' + #13#10 +
      'X3Lbl.Caption=X Werte (z.B. a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Y werte (z.B. 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Sonstige Optionen   ' + #13#10 +
      'ShowTopLbl.Caption=ErsteN Werte' + #13#10 +
      'CaptionLbl.Caption=ErsteN Beschriftung' + #13#10 +
      'SortLbl.Caption=Sortierfolge' + #13#10 +
      'LineMI.Caption=Linie' + #13#10 +
      'AreaMI.Caption=Fläche' + #13#10 +
      'PointMI.Caption=Punkt' + #13#10 +
      'BarMI.Caption=Balken' + #13#10 +
      'HorizBarMI.Caption=Horiz. Balken' + #13#10 +
      'PieMI.Caption=Kuchen' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Fast Line' + #13#10 +
      '');
    Add('ch3D', '3D Ansicht');
    Add('chAxis', 'Achsen anzeigen');
    Add('chsoNone', 'Kein');
    Add('chsoAscending', 'Aufsteigend');
    Add('chsoDescending', 'Absteigend');

    Add('TfrxRichEditorForm',
      'Caption=RichText Editor' + #13#10 +
      'OpenB.Hint=Datei öffnen' + #13#10 +
      'SaveB.Hint=Datei speichern' + #13#10 +
      'UndoB.Hint=Rückgängig' + #13#10 +
      'TTB.Hint=Schrift' + #13#10 +
      'ExprB.Hint=Ausdruck einfügen' + #13#10 +
      'CancelB.Hint=Abbruch' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      'BoldB.Hint=Fett' + #13#10 +
      'ItalicB.Hint=Kursiv' + #13#10 +
      'UnderlineB.Hint=Unterstrichen' + #13#10 +
      'LeftAlignB.Hint=Linksbündig' + #13#10 +
      'CenterAlignB.Hint=Zentriert' + #13#10 +
      'RightAlignB.Hint=Rechtsbündig' + #13#10 +
      'BlockAlignB.Hint=Blocksatz' + #13#10 +
      'BulletsB.Hint=Aufzählung' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Cross-tab Editor' + #13#10 +
      'DatasetL.Caption=Quelldaten   ' + #13#10 +
      'DimensionsL.Caption=Dimensionen   ' + #13#10 +
      'RowsL.Caption=Zeilen' + #13#10 +
      'ColumnsL.Caption=Spalten' + #13#10 +
      'CellsL.Caption=Zellen' + #13#10 +
      'StructureL.Caption=Cross-tab Struktur   ' + #13#10 +
      'RowHeaderCB.Caption=Zeilenkopf' + #13#10 +
      'ColumnHeaderCB.Caption=Spaltenkopf' + #13#10 +
      'RowTotalCB.Caption=Zeilengesamtsumme' + #13#10 +
      'ColumnTotalCB.Caption=Spaltengesamtsumme' + #13#10 +
      'SwapB.Hint=Zeilen/Spalten vertauschen' + #13#10 +
      'StyleCB.Hint=Cross-tab Stil' + #13#10 +
      'FontB.Hint=Schrifteinstellungen' + #13#10 +
      'AlignLeftB.Hint=Ausrichtung links' + #13#10 +
      'AlignCenterB.Hint=Ausrichtung Mitte' + #13#10 +
      'AlignRightB.Hint=Ausrichtung rechts' + #13#10 +
      'RotationB.Hint=Textdrehung' + #13#10 +
      'HighlightB.Hint=Hervorheben' + #13#10 +
      'FormatB.Hint=Format' + #13#10 +
      'FrameB.Hint=Rahmeneinstellungen' + #13#10 +
      'FillColorB.Hint=Füllfarbe' + #13#10 +
      'Func1MI.Caption=Kein' + #13#10 +
      'Func2MI.Caption=Summe' + #13#10 +
      'Func3MI.Caption=Minimum' + #13#10 +
      'Func4MI.Caption=Maximum' + #13#10 +
      'Func5MI.Caption=Mittelwert' + #13#10 +
      'Func6MI.Caption=Anzahl' + #13#10 +
      'Sort1MI.Caption=Aufsteigend (A-Z)' + #13#10 +
      'Sort2MI.Caption=Absteigend (Z-A)' + #13#10 +
      'Sort3MI.Caption=Keine Sortierung' + #13#10 +
      'BoldMI.Caption=Fett' + #13#10 +
      'ItalicMI.Caption=Kursiv' + #13#10 +
      'UnderlineMI.Caption=Unterstrichen' + #13#10 +
      'SuperScriptMI.Caption=Hochgestellt' + #13#10 +
      'SubScriptMI.Caption=Tiefgestellt' + #13#10 +
      'CondensedMI.Caption=Eng' + #13#10 +
      'WideMI.Caption=Weit' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=Abbruch' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('crSubtotal', 'Zwischensumme');
    Add('crNone', 'Kein');
    Add('crSum', 'Summe');
    Add('crMin', 'Minimum');
    Add('crMax', 'Maximum');
    Add('crAvg', 'Mittelwert');
    Add('crCount', 'Anzahl');
    Add('crAsc', 'A-Z');
    Add('crDesc', 'Z-A');
    Add('crRepHdrs', 'Kopf wiederholen');
    Add('crBorder', 'Rand');
    Add('crDown', 'Nach unten, dann nach rechts');

    Add('TfrxExprEditorForm',
      'Caption=Ausdruckseditor' + #13#10 +
      'ExprL.Caption=Ausdruck:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=Anzeigeformat' + #13#10 +
      'CategoryL.Caption=Kategorie' + #13#10 +
      'FormatL.Caption=Format' + #13#10 +
      'FormatStrL.Caption=Formatstring:' + #13#10 +
      'SeparatorL.Caption=Dezimaltrenner:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      '');
    Add('fkText', 'Text (ohne Format)');
    Add('fkNumber', 'Zahl');
    Add('fkDateTime', 'Datum/Zeit');
    Add('fkBoolean', 'Wahrheitswert');
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
    Add('fkBoolean2', 'Nein,Ja;Nein,Ja');
    Add('fkBoolean3', '_,x;_,x');
    Add('fkBoolean4', 'False,True;False,True');

    Add('TfrxHighlightEditorForm',
      'Caption=Hervorheben' + #13#10 +
      'FontColorB.Caption=Farbe...' + #13#10 +
      'BackColorB.Caption=Farbe...' + #13#10 +
      'ConditionL.Caption=Bedingung   ' + #13#10 +
      'FontL.Caption=Schrift   ' + #13#10 +
      'BackgroundL.Caption=Hintergrund   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      'BoldCB.Caption=Fett' + #13#10 +
      'ItalicCB.Caption=Kursiv' + #13#10 +
      'UnderlineCB.Caption=Unterstrichen' + #13#10 +
      'TransparentRB.Caption=Transparent' + #13#10 +
      'OtherRB.Caption=Sonst' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Reporteinstellungen' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      'GeneralTS.Caption=Allgemein' + #13#10 +
      'ReportSettingsL.Caption=Druckereinstellungen   ' + #13#10 +
      'CopiesL.Caption=Kopien' + #13#10 +
      'GeneralL.Caption=Allgemein   ' + #13#10 +
      'PasswordL.Caption=Passwort' + #13#10 +
      'CollateCB.Caption=Kopien sortieren' + #13#10 +
      'DoublePassCB.Caption=Zweipass' + #13#10 +
      'PrintIfEmptyCB.Caption=Drucken wenn leer' + #13#10 +
      'DescriptionTS.Caption=Beschreibung' + #13#10 +
      'NameL.Caption=Name' + #13#10 +
      'Description1L.Caption=Beschreibung' + #13#10 +
      'PictureL.Caption=Bild' + #13#10 +
      'AuthorL.Caption=Autor' + #13#10 +
      'MajorL.Caption=Major' + #13#10 +
      'MinorL.Caption=Minor' + #13#10 +
      'ReleaseL.Caption=Release' + #13#10 +
      'BuildL.Caption=Build' + #13#10 +
      'CreatedL.Caption=Erzeugt' + #13#10 +
      'ModifiedL.Caption=Geändert' + #13#10 +
      'DescriptionL.Caption=Beschreibung   ' + #13#10 +
      'VersionL.Caption=Version   ' + #13#10 +
      'PictureB.Caption=Wählen...' + #13#10 +
      '');
    Add('rePrnOnPort', 'an');

    Add('TfrxStringsEditorForm',
      'Caption=Zeilen' + #13#10 +
      'CancelB.Hint=Abbruch' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=Abbruch' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=Passwort' + #13#10 +
      'PasswordL.Caption=Passwort eingeben:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=Stileditor' + #13#10 +
      'ColorB.Caption=Farbe...' + #13#10 +
      'FontB.Caption=Schrift...' + #13#10 +
      'FrameB.Caption=Rahmen...' + #13#10 +
      'AddB.Hint=Hinzufügen' + #13#10 +
      'DeleteB.Hint=Löschen' + #13#10 +
      'EditB.Hint=Bearbeiten' + #13#10 +
      'LoadB.Hint=Öffnen' + #13#10 +
      'SaveB.Hint=Speichern' + #13#10 +
      'CancelB.Hint=Abbruch' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=Rahmenditor' + #13#10 +
      'FrameL.Caption=Rahmen' + #13#10 +
      'LineL.Caption=Rahmenlinie' + #13#10 +
      'ShadowL.Caption=Schatten' + #13#10 +
      'FrameTopB.Hint=Linie oben' + #13#10 +
      'FrameBottomB.Hint=Linie unten' + #13#10 +
      'FrameLeftB.Hint=Linie links' + #13#10 +
      'FrameRightB.Hint=Linie rechts' + #13#10 +
      'FrameAllB.Hint=Alle Rahmenlinien' + #13#10 +
      'FrameNoB.Hint=Kein Rahmen' + #13#10 +
      'FrameColorB.Hint=Rahmenfarbe' + #13#10 +
      'FrameStyleB.Hint=Rahmenstil' + #13#10 +
      'FrameWidthCB.Hint=Rahmenbreite' + #13#10 +
      'ShadowB.Hint=Schatten' + #13#10 +
      'ShadowColorB.Hint=Schattenfarbe' + #13#10 +
      'ShadowWidthCB.Hint=Schattentiefe' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=Neues Element' + #13#10 +
      'ItemsTab.Caption=Elemente' + #13#10 +
      'TemplatesTab.Caption=Vorlagen' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Tabreihenfolge' + #13#10 +
      'Label1.Caption=Elemente in Tabreihenfolge:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      'UpB.Caption=Nach oben' + #13#10 +
      'DownB.Caption=Nach unten' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Auswerten' + #13#10 +
      'Label1.Caption=Ausdruck' + #13#10 +
      'Label2.Caption=Ergebnis' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Report Wizard' + #13#10 +
      'DataTab.Caption=Daten' + #13#10 +
      'GroupsTab.Caption=Gruppen' + #13#10 +
      'LayoutTab.Caption=Layout' + #13#10 +
      'StyleTab.Caption=Stil' + #13#10 +
      'Step1L.Caption=Schritt 1. Dataset und Felder für Anzeige wählen.' + #13#10 +
      'Step2L.Caption=Schritt 2. Gruppen anlegen (optional).' + #13#10 +
      'Step3L.Caption=Schritt 3. Seitenausrichtung und Datenlayout festlegen.' + #13#10 +
      'Step4L.Caption=Schritt 4. Reportstil wählen.' + #13#10 +
      'AddFieldB.Caption= >' + #13#10 +
      'AddAllFieldsB.Caption= >>' + #13#10 +
      'RemoveFieldB.Caption=<' + #13#10 +
      'RemoveAllFieldsB.Caption=<<' + #13#10 +
      'AddGroupB.Caption=Gruppe >' + #13#10 +
      'RemoveGroupB.Caption=< Gruppe' + #13#10 +
      'SelectedFieldsL.Caption=Gewählte Felder:' + #13#10 +
      'AvailableFieldsL.Caption=Verfügbare Felder:' + #13#10 +
      'GroupsL.Caption=Gruppen:' + #13#10 +
      'OrientationL.Caption=Ausrichtung   ' + #13#10 +
      'LayoutL.Caption=Layout   ' + #13#10 +
      'PortraitRB.Caption=Hochformat' + #13#10 +
      'LandscapeRB.Caption=Querformat' + #13#10 +
      'TabularRB.Caption=Tabellenform' + #13#10 +
      'ColumnarRB.Caption=in Spalten' + #13#10 +
      'FitWidthCB.Caption=Felder an Seitenbreite anpassen' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      'BackB.Caption=<< Zurück' + #13#10 +
      'NextB.Caption=Weiter >>' + #13#10 +
      'FinishB.Caption=Fertig' + #13#10 +
      '');
    Add('wzStd', 'Standard Report Assistent');
    Add('wzDMP', 'Dot-Matrix Report Assistent');
    Add('wzStdEmpty', 'Standard Report');
    Add('wzDMPEmpty', 'Dot-Matrix Report');


    Add('ftAllFiles', 'Alle Dateien');
    Add('ftPictures', 'Bilder');
    Add('ftDB', 'Datenbanken');
    Add('ftRichFile', 'RichText-Datei');
    Add('ftTextFile', 'Textdatei');

    Add('prNotAssigned', '(Nicht zugeordnet)');
    Add('prInvProp', 'Ungültiger Eigenschaftswert');
    Add('prDupl', 'Doppelter Name');
    Add('prPict', '(Bild)');

    Add('mvExpr', 'Ausdrücke erlauben');
    Add('mvStretch', 'Dehnen');
    Add('mvStretchToMax', 'Auf Maximalhöhe dehnen');
    Add('mvShift', 'Verschieben');
    Add('mvShiftOver', 'Verschieben wenn Überlappung');
    Add('mvVisible', 'Sichtbar');
    Add('mvPrintable', 'Druckbar');
    Add('mvFont', 'Schrift...');
    Add('mvFormat', 'Anzeigeformat...');
    Add('mvClear', 'Inhalt löschen');
    Add('mvAutoWidth', 'Breite automatisch');
    Add('mvWWrap', 'Zeilenumbruch');
    Add('mvSuppress', 'Wiederholte Werte unterdrücken');
    Add('mvHideZ', 'Nullen verbergen');
    Add('mvHTML', 'HTML Tags erlauben');
    Add('lvDiagonal', 'Diagonal');
    Add('pvAutoSize', 'Größe automatisch');
    Add('pvCenter', 'Zentrieren');
    Add('pvAspect', 'Seitenverhältnis behalten');
    Add('bvSplit', 'Aufteilung erlauben');
    Add('bvKeepChild', 'Child zusammenhalten');
    Add('bvPrintChild', 'Child drucken wenn unsichtbar');
    Add('bvStartPage', 'Neue Seite');
    Add('bvPrintIfEmpty', 'Drucken wenn Detail leer');
    Add('bvKeepDetail', 'Detail zusammenhalten');
    Add('bvKeepFooter', 'Fuß zusammenhalten');
    Add('bvReprint', 'Auf neuer Seite wiederholen');
    Add('bvOnFirst', 'Auf erster Seite drucken');
    Add('bvOnLast', 'Auf letzer Seite drucken');
    Add('bvKeepGroup', 'Zusammenhalten');
    Add('bvFooterAfterEach', 'Fuß nach jeder Zeile');
    Add('srParent', 'Druck auf Parent');
    Add('bvKeepHeader', 'Kopf zusammenhalten');

    Add('obCatDraw', 'Zeichnen');
    Add('obCatOther', 'Andere Objekte');
    Add('obCatOtherControls', 'Andere Elemente');
    Add('obDiagLine', 'Diagonale Linie');
    Add('obRect', 'Rechteck');
    Add('obRoundRect', 'Abgerundetes Rechteck');
    Add('obEllipse', 'Ellipse');
    Add('obTrian', 'Dreieck');
    Add('obDiamond', 'Raute');
    Add('obLabel', 'Fixtext');
    Add('obEdit', 'Eingabefeld');
    Add('obMemoC', 'Memo');
    Add('obButton', 'Schaltfläche');
    Add('obChBoxC', 'Kontrollkästchen');
    Add('obRButton', 'Optionsfeld');
    Add('obLBox', 'Listenfeld');
    Add('obCBox', 'Kombinationsfeld');
    Add('obDateEdit', 'Datumseingabefeld');
    Add('obImageC', 'Bild');
    Add('obPanel', 'Panel');
    Add('obGrBox', 'Optionsgruppe');
    Add('obBBtn', 'Schaltfläche mit Bild');
    Add('obSBtn', 'Schalter');
    Add('obMEdit', 'Eingabefeld mit Maske');
    Add('obChLB', 'Liste mit Kontrollkästchen');
    Add('obDBLookup', 'Nachschlagefeld');
    Add('obBevel', 'Rahmen');
    Add('obShape', 'Figur');
    Add('obText', 'Text');
    Add('obSysText', 'Systemtext');
    Add('obLine', 'Linie');
    Add('obPicture', 'Grafik');
    Add('obBand', 'Band');
    Add('obDataBand', 'Datenband');
    Add('obSubRep', 'Unterreport');
    Add('obDlgPage', 'Dialogformular');
    Add('obRepPage', 'Reportseite');
    Add('obReport', 'Report');
    Add('obRich', 'RichText');
    Add('obOLE', 'OLE Objekt');
    Add('obChBox', 'Kontrollkästchen');
    Add('obChart', 'Diagramm');
    Add('obBarC', 'Barcode');
    Add('obCross', 'Cross-tab Objekt');
    Add('obDBCross', 'Datenbank Cross-tab Objekt');
    Add('obGrad', 'Verlauf');
    Add('obDMPText', 'Dot-matrix Text');
    Add('obDMPLine', 'Dot-matrix Linie');
    Add('obBDEDB', 'BDE Datenbank');
    Add('obBDETb', 'BDE Tabelle');
    Add('obBDEQ', 'BDE Abfrage');
    Add('obBDEComps', 'BDE Komponenten');
    Add('obIBXDB', 'IBX Datenbank');
    Add('obIBXTb', 'IBX Tabelle');
    Add('obIBXQ', 'IBX Abfrage');
    Add('obIBXComps', 'IBX Komponenten');
    Add('obADODB', 'ADO Datenbank');
    Add('obADOTb', 'ADO Tabelle');
    Add('obADOQ', 'ADO Abfrage');
    Add('obADOComps', 'ADO Komponenten');
    Add('obDBXDB', 'DBX Datenbank');
    Add('obDBXTb', 'DBX Tabelle');
    Add('obDBXQ', 'DBX Abfrage');
    Add('obDBXComps', 'DBX Komponenten');

    Add('ctString', 'Zeichenkette');
    Add('ctDate', 'Datum/Zeit');
    Add('ctConv', 'Konvertierung');
    Add('ctFormat', 'Formatierung');
    Add('ctMath', 'Mathematisch');
    Add('ctOther', 'Andere');

    Add('IntToStr', 'Konvertiert einen Ganzzahlwert in eine Zeichenkette');
    Add('FloatToStr', 'Konvertiert einen Fließkommawert in eine Zeichenkette');
    Add('DateToStr', 'Konvertiert einen Datumswert in eine Zeichenkette');
    Add('TimeToStr', 'Konvertiert einen Zeitwert in eine Zeichenkette');
    Add('DateTimeToStr', 'Konvertiert einen Datums-und-Zeitwert in eine Zeichenkette');
    Add('VarToStr', 'Konvertiert einen Variantwert in eine Zeichenkette');
    Add('StrToInt', 'Konvertiert eine Zeichenkette in einen Ganzzahlwert');
    Add('StrToFloat', 'Konvertiert eine Zeichenkette in einen Fließkommawert');
    Add('StrToDate', 'Konvertiert eine Zeichenkette in einen Datumswert');
    Add('StrToTime', 'Konvertiert eine Zeichenkette in einen Zeitwert');
    Add('StrToDateTime', 'Konvertiert eine Zeichenkette in einen Datums-und-Zeitwert');
    Add('Format', 'Liefert aus einer Reihe von Arrayargumenten eine formatierte Zeichenkette');
    Add('FormatFloat', 'Formatiert einen Fließkommawert');
    Add('FormatDateTime', 'Formatiert einen Datums-und-Zeitwert');
    Add('FormatMaskText', 'Liefert eine gemäß edit-mask formatierte Zeichenkette');
    Add('EncodeDate', 'Liefert einen Datums-/Zeittyp für angegebenes Jahr, Monat und TaG');
    Add('DecodeDate', 'Zerlegt Datums-/Zeittyp in Jahr, Monat und Tag');
    Add('EncodeTime', 'Liefert einen Datums-/Zeittyp für angegebene Stunde, Minute, Sekunde und MilliSekunde');
    Add('DecodeTime', 'Zerlegt Datums-/Zeittyp in Stunde, Minute, Sekunde und MilliSekunde');
    Add('Date', 'Liefert aktuelles Datum');
    Add('Time', 'Liefert aktuelle Zeit');
    Add('Now', 'Liefert aktuelles Datum und Zeit');
    Add('DayOfWeek', 'Liefert Wochentag für angegebens Datum');
    Add('IsLeapYear', 'Zeigt an, ob angegebenes Jahr ein Schaltjahr ist');
    Add('DaysInMonth', 'Liefert Anzahl der Tage für angegebenen Monat');
    Add('Length', 'Liefert Länge einer Zeichenkette');
    Add('Copy', 'Liefert eine Teilzeichenkette einer Zeichenkette');
    Add('Pos', 'Liefert Position eine Teilzeichenkette in einer Zeichenkette');
    Add('Delete', 'Entfernt eine Teilzeichenkette aus einer Zeichenkette');
    Add('Insert', 'Fügt eine Teilzeichenkette in eine Zeichenkette ein');
    Add('Uppercase', 'Konvertiert alle Zeichen einer Zeichenkette in Großbuchstaben');
    Add('Lowercase', 'Konvertiert alle Zeichen einer Zeichenkette in Kleinbuchstaben');
    Add('Trim', 'Entfernt alle führenden und nachfolgenden Leerzeichen aus einer Zeichenkette');
    Add('NameCase', 'Konvertiert den ersten Buchstaben eines Wortes in Großbuchstaben');
    Add('CompareText', 'Vergleicht zwei Zeichenketten');
    Add('Chr', 'Konvertiert einen Ganzzahlwert in einen Buchstaben');
    Add('Ord', 'Konvertiert einen Buchstaben in einen Ganzzahlwert');
    Add('SetLength', 'Setzt die Länge einer Zeichenkette');
    Add('Round', 'Rundet einen Fließkommawert zum nächsten Ganzzahlwert');
    Add('Trunc', 'Schneidet Nachkommastellen eines Fließkommawerts ab');
    Add('Int', 'Liefert den Ganzzahlanteil eines Fließkommawerts');
    Add('Frac', 'Liefert den Nachkommaanteil eines Fließkommawerts');
    Add('Sqrt', 'Liefert die Quadratwurzel einer angegebenen Zahl');
    Add('Abs', 'Liefert einen Absolutwert');
    Add('Sin', 'Liefert den Sinus eines Winkels (in radians)');
    Add('Cos', 'Liefert den Cosinus eines Winkels (in radians)');
    Add('ArcTan', 'Liefert den Arcustangens');
    Add('Tan', 'Liefert den Tangens');
    Add('Exp', 'Liefert den Exponent');
    Add('Ln', 'Liefert den natürlichen Logarithmus eines Fließkommaausdrucks');
    Add('Pi', 'Liefert 3.1415926... (Pi)');
    Add('Inc', 'Erhöht einen Wert');
    Add('Dec', 'Vermindert einen Wert');
    Add('RaiseException', 'Löst eine exception aus');
    Add('ShowMessage', 'Zeigt ein Meldungsfenster');
    Add('Randomize', 'Startete den Zufallsgenerator');
    Add('Random', 'Liefert eine Zufallszahl');
    Add('ValidInt', 'Liefert True wenn die angegenbene Zeichenkette einen gültigen Ganzzahlwert enthält');
    Add('ValidFloat', 'Liefert True wenn die angegenbene Zeichenkette einen gültigen Fließkommawert enthält');
    Add('ValidDate', 'Liefert True wenn die angegenbene Zeichenkette einen gültigen Datumswert enthält');
    Add('IIF', 'Liefert TrueValue wenn angegebener Ausdruck wahr ist, ansonsten FalseValue');
    Add('Get', 'Zum internen Gebrauch');
    Add('Set', 'Zum internen Gebrauch');
    Add('InputBox', 'Zeigt ein Eingabefenster zur Eingabe einer Zeichenkette an');
    Add('InputQuery', 'Zeigt ein Eingabefenster zur Eingabe einer Zeichenkette an');
    Add('MessageDlg', 'Zeigt ein Meldungsfenster');
    Add('CreateOleObject', 'Erzeugt ein OLE Objekt');
    Add('VarArrayCreate', 'Erzeugt ein Variantarray');
    Add('VarType', 'Liefert den Typ eines Varinatwertes');
    Add('DayOf', 'Liefert den Tag (1..31) eines Datums');
    Add('MonthOf', 'Liefert den Monat (1..12) eines Datums');
    Add('YearOf', 'Liefert das Jahr eines Datums');

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
