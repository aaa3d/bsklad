// German translation by Wolfgang Kleinrath 2004.09.03
// Weitere Anpassungen von Robert Wismet (www.rowisoft.de) 2004.10.10
// und Gerd Rech (www.iq-s.de)
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

unit frxrcClass;

interface

procedure frAddClassesRes;


implementation

uses frxRes;


procedure frAddClassesRes;
begin
  with frxResources do
  begin
    Add('TfrxPreviewForm',
      'Caption=Vorschau' + #13#10 +
      'PrintB.Caption=Drucken' + #13#10 +
      'PrintB.Hint=Drucken' + #13#10 +
      'OpenB.Caption=Öffnen' + #13#10 +
      'OpenB.Hint=Öffnen' + #13#10 +
      'SaveB.Caption=Speichern' + #13#10 +
      'SaveB.Hint=Speichern' + #13#10 +
      'ExportB.Caption=Export' + #13#10 +
      'ExportB.Hint=Export' + #13#10 +
      'FindB.Caption=Suchen' + #13#10 +
      'FindB.Hint=Suchen' + #13#10 +
      'ZoomWholePageB.Caption=Ganze Seite' + #13#10 +
      'ZoomWholePageB.Hint=Ganze Seite' + #13#10 +
      'ZoomPageWidthB.Caption=Seitenbreite' + #13#10 +
      'ZoomPageWidthB.Hint=Seitenbreite' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=Zwei Seiten' + #13#10 +
      'Zoom50B.Hint=Zwei Seiten' + #13#10 +
      'ZoomCB.Hint=Zoom' + #13#10 +
      'PageSettingsB.Caption=Ränder' + #13#10 +
      'PageSettingsB.Hint=Ränder' + #13#10 +
      'OutlineB.Caption=Baumansicht' + #13#10 +
      'OutlineB.Hint=Baumansicht' + #13#10 +
      'HandToolB.Caption=Ziehen' + #13#10 +
      'HandToolB.Hint=Ziehen Werkzeug' + #13#10 +
      'ZoomToolB.Caption=Zoom' + #13#10 +
      'ZoomToolB.Hint=Zoom Werkzeug' + #13#10 +
      'NewPageB.Caption=Seite hinzufügen' + #13#10 +
      'NewPageB.Hint=Seite hinzufügen' + #13#10 +
      'DelPageB.Caption=Löschen' + #13#10 +
      'DelPageB.Hint=Seite löschen' + #13#10 +
      'DesignerB.Caption=Bearbeiten' + #13#10 +
      'DesignerB.Hint=Seite bearbeiten' + #13#10 +
      'FirstB.Caption=Erste' + #13#10 +
      'FirstB.Hint=Erste Seite' + #13#10 +
      'PriorB.Caption=Vorige' + #13#10 +
      'PriorB.Hint=Vorige Seite' + #13#10 +
      'NextB.Caption=Nächste' + #13#10 +
      'NextB.Hint=Nächste Seite' + #13#10 +
      'LastB.Caption=Letzte' + #13#10 +
      'LastB.Hint=Letzte Seite' + #13#10 +
      'CancelB.Caption=Schließen' + #13#10 +
      'PageE.Hint=Seitennummer' + #13#10 +
      '');
    Add('zmPageWidth', 'Seitenbreite');
    Add('zmWholePage', 'Ganze Seite');

    Add('TfrxPrintDialog',
      'Caption=Drucken' + #13#10 +
      'Label12.Caption=Drucker   ' + #13#10 +
      'DescrL.Caption=Seitennummern und/oder Seitenbereiche durch Komma getrennt eingeben, z.B. 1,3,5-12' + #13#10 +
      'Label1.Caption=Seiten   ' + #13#10 +
      'CopiesL.Caption=Anzahl der Kopien' + #13#10 +
      'CollateL.Caption=Sortieren' + #13#10 +
      'Label2.Caption=Kopien   ' + #13#10 +
      'PrintL.Caption=Drucken' + #13#10 +
      'TypeL.Caption=Typ:' + #13#10 +
      'WhereL.Caption=Wobei:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      'PropButton.Caption=Eigenschaften...' + #13#10 +
      'AllRB.Caption=Alle' + #13#10 +
      'CurPageRB.Caption=Aktuelle Seite' + #13#10 +
      'PageNumbersRB.Caption=Seiten:' + #13#10 +
      'FileCB.Caption=In Datei drucken' + #13#10 +
      'ReverseCB.Caption=Umgekehrte Reihenfolge' + #13#10 +
      '');
    Add('ppAll', 'Alle Seiten');
    Add('ppOdd', 'Ungerade Seiten');
    Add('ppEven', 'Gerade Seiten');

    Add('TfrxSearchDialog',
      'Caption=Text suchen' + #13#10 +
      'TextL.Caption=Suchtext:' + #13#10 +
      'SearchL.Caption=Suchoptionen   ' + #13#10 +
      'ReplaceL.Caption=Ersetzen durch' + #13#10 +
      'TopCB.Caption=Ab Anfang' + #13#10 +
      'CaseCB.Caption=Groß/Klein' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Seiteneinstellungen' + #13#10 +
      'WidthL.Caption=Breite' + #13#10 +
      'HeightL.Caption=Höhe' + #13#10 +
      'SizeL.Caption=Größe   ' + #13#10 +
      'OrientationL.Caption=Ausrichtung   ' + #13#10 +
      'LeftL.Caption=Links' + #13#10 +
      'TopL.Caption=Oben' + #13#10 +
      'RightL.Caption=Rechts' + #13#10 +
      'BottomL.Caption=Unten' + #13#10 +
      'MarginsL.Caption=Ränder   ' + #13#10 +
      'PortraitRB.Caption=Hochformat' + #13#10 +
      'LandscapeRB.Caption=Querformat' + #13#10 +
      'cmL1.Caption=cm' + #13#10 +
      'cmL2.Caption=cm' + #13#10 +
      'cmL3.Caption=cm' + #13#10 +
      'cmL4.Caption=cm' + #13#10 +
      'cmL5.Caption=cm' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Abbruch' + #13#10 +
      'OtherL.Caption=Sontige   ' + #13#10 +
      'ApplyToCurRB.Caption=Auf aktuelle Seite anwenden' + #13#10 +
      'ApplyToAllRB.Caption=Auf alle Seiten anwenden' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Drucken' + #13#10 +
      'PrinterL.Caption=Drucker   ' + #13#10 +
      'PagesL.Caption=Seiten   ' + #13#10 +
      'CopiesL.Caption=Kopien   ' + #13#10 +
      'CopiesNL.Caption=Anzahl der Kopien' + #13#10 +
      'DescrL.Caption=Seitennummern oder Seitenbereiche durch Komma getrennt eingeben, z.B. 1,3,5-12' + #13#10 +
      'OptionsL.Caption=Optionen   ' + #13#10 +
      'EscL.Caption=Druckerbefehle   ' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Abbruch' + #13#10 +
      'SaveToFileCB.Caption=In Datei drucken' + #13#10 +
      'AllRB.Caption=Alle' + #13#10 +
      'CurPageRB.Caption=Aktuelle Seite' + #13#10 +
      'PageNumbersRB.Caption=Seiten:' + #13#10 +
      'PageBreaksCB.Caption=Seitenumbruch' + #13#10 +
      'OemCB.Caption=OEM Zeichensatz' + #13#10 +
      'PseudoCB.Caption=Pseudografik' + #13#10 +
      'SaveDialog1.Filter=Druckdatei (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Abbruch' + #13#10 +
      '');

    Add('mbConfirm', 'Bestätigen');
    Add('mbError', 'Fehler');
    Add('mbInfo', 'Information');
    Add('xrCantFindClass', 'Klasse wurde nicht gefunden');
    Add('prVirtual', 'Virtuell');
    Add('prDefault', 'Vorgabe');
    Add('prCustom', 'Benutzerdefiniert');
    Add('enUnconnHeader', 'Nicht verbunden Kopf/Fußzeile');
    Add('enUnconnGroup', 'Kein Datenband für die Gruppe');
    Add('enUnconnGFooter', 'Kein Gruppenkopf für');
    Add('enBandPos', 'Inkorrekte Bandposition:');
    Add('dbNotConn', 'DataSet %s ist nicht mit Daten verbunden');
    Add('dbFldNotFound', 'Feld nicht gefunden:');
    Add('clDSNotIncl', '(Dataset ist nicht in Report-DataSets enthalten)');
    Add('clUnknownVar', 'Unbekannte Variable oder Datenfeld:');
    Add('clScrError', 'Scriptfehler bei %s: %s');
    Add('clDSNotExist', 'Dataset "%s" existiert nicht');
    Add('clErrors', 'Folgende(r) Fehler trat(en) auf:');
    Add('clExprError', 'Fehler im Ausdruck');
    Add('clFP3files', 'Vorbereiteter Report');
    Add('clSaving', 'Speichere Datei...');
    Add('clCancel', 'Abbruch');
    Add('clClose', 'Schließen');
    Add('clPrinting', 'Drucke Seite');
    Add('clLoading', 'Lade Datei...');
    Add('clPageOf', 'Seite %d von %d');
    Add('clFirstPass', 'Erster Drucklauf: Seite ');
    Add('clNoPrinters', 'Kein Drucker im System installiert');
    Add('clDecompressError', 'Fehler bei Stream-Dekomprimierung');
    Add('crFillMx', 'Fülle Cross-tab...');
    Add('crBuildMx', 'Erzeuge Cross-tab...');

    Add('prRunningFirst', 'Erster Durchlauf: Seite %d');
    Add('prRunning', 'Bereite Seite %d');
    Add('prPrinting', 'Drucke Seite %d');
    Add('prExporting', 'Exportiere Seite %d');
    Add('uCm', 'cm');
    Add('uInch', 'in');
    Add('uPix', 'px');
    Add('uChar', 'Zch');
  end;
end;


initialization
  frAddClassesRes;

end.
