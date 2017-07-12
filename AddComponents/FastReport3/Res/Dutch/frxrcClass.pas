
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
      'Caption=Afdrukvoorbeeld' + #13#10 +
      'PrintB.Caption=Afdrukken' + #13#10 +
      'PrintB.Hint=Afdrukken' + #13#10 +
      'OpenB.Caption=Openen' + #13#10 +
      'OpenB.Hint=Openen' + #13#10 +
      'SaveB.Caption=Opslaan' + #13#10 +
      'SaveB.Hint=Opslaan' + #13#10 +
      'ExportB.Caption=Exporteren' + #13#10 +
      'ExportB.Hint=Exporteren' + #13#10 +
      'FindB.Caption=Zoeken' + #13#10 +
      'FindB.Hint=Zoeken' + #13#10 +
      'ZoomWholePageB.Caption=Hele pagina' + #13#10 +
      'ZoomWholePageB.Hint=Hele pagina' + #13#10 +
      'ZoomPageWidthB.Caption=Pagina breedte' + #13#10 +
      'ZoomPageWidthB.Hint=Pagina breedte' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=Twee pagina''s' + #13#10 +
      'Zoom50B.Hint=Twee pagina''s' + #13#10 +
      'ZoomCB.Hint=Zoom' + #13#10 +
      'PageSettingsB.Caption=Pagina instellingen' + #13#10 +
      'PageSettingsB.Hint=Pagina instellingen' + #13#10 +
      'OutlineB.Caption=Inhoudsopgave' + #13#10 +
      'OutlineB.Hint=Inhoudsopgave' + #13#10 +
      'HandToolB.Caption=Slepen' + #13#10 +
      'HandToolB.Hint=Sleep hulpmiddel' + #13#10 +
      'ZoomToolB.Caption=Zoom' + #13#10 +
      'ZoomToolB.Hint=Zoom hulpmiddel' + #13#10 +
      'NewPageB.Caption=Pagina toevoegen' + #13#10 +
      'NewPageB.Hint=Pagina toevoegen' + #13#10 +
      'DelPageB.Caption=Verwijderen' + #13#10 +
      'DelPageB.Hint=Pagina verwijderen' + #13#10 +
      'DesignerB.Caption=Bewerken' + #13#10 +
      'DesignerB.Hint=Pagina bewerken' + #13#10 +
      'FirstB.Caption=Eerste' + #13#10 +
      'FirstB.Hint=Eerste pagina' + #13#10 +
      'PriorB.Caption=Vorige' + #13#10 +
      'PriorB.Hint=Vorige pagina' + #13#10 +
      'NextB.Caption=Volgende' + #13#10 +
      'NextB.Hint=Volgende pagina' + #13#10 +
      'LastB.Caption=Laatste' + #13#10 +
      'LastB.Hint=Laatste pagina' + #13#10 +
      'CancelB.Caption=Sluiten' + #13#10 +
      'PageE.Hint=Paginanummer' + #13#10 +
      '');
    Add('zmPageWidth', 'Pagina breedte');
    Add('zmWholePage', 'Hele pagina');

    Add('TfrxPrintDialog',
      'Caption=Afdrukken' + #13#10 +
      'Label12.Caption=Afdrukken   ' + #13#10 +
      'DescrL.Caption=Vul paginanummers en/of pagina ranges in, gescheiden door komma''s. Bijvoorbeeld: 1,3,5-12' + #13#10 +
      'Label1.Caption=Pagina''s   ' + #13#10 +
      'CopiesL.Caption=Aantal kopieën' + #13#10 +
      'CollateL.Caption=Verzamelen' + #13#10 +
      'Label2.Caption=Kopieën   ' + #13#10 +
      'PrintL.Caption=Afdrukken' + #13#10 +
      'TypeL.Caption=Type:' + #13#10 +
      'WhereL.Caption=Waar:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      'PropButton.Caption=Eigenschappen...' + #13#10 +
      'AllRB.Caption=Alles' + #13#10 +
      'CurPageRB.Caption=Huidige pagina' + #13#10 +
      'PageNumbersRB.Caption=Pagina''s:' + #13#10 +
      'FileCB.Caption=Afdrukken naar bestand' + #13#10 +
      'ReverseCB.Caption=Van achter naar voren' + #13#10 +
      '');
    Add('ppAll', 'Alle pagina''s');
    Add('ppOdd', 'Oneven pagina''s');
    Add('ppEven', 'Even pagina''s');

    Add('TfrxSearchDialog',
      'Caption=Zoek tekst' + #13#10 +
      'TextL.Caption=Zoektekst:' + #13#10 +
      'SearchL.Caption=Zoek opties   ' + #13#10 +
      'ReplaceL.Caption=Vervangen door' + #13#10 +
      'TopCB.Caption=Zoeken vanaf het begin' + #13#10 +
      'CaseCB.Caption=Hoofdletters/kleine letters' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Pagina instellingen' + #13#10 +
      'WidthL.Caption=Breedte' + #13#10 +
      'HeightL.Caption=Hoogte' + #13#10 +
      'SizeL.Caption=Formaat   ' + #13#10 +
      'OrientationL.Caption=Oriëntatie   ' + #13#10 +
      'LeftL.Caption=Links' + #13#10 +
      'TopL.Caption=Boven' + #13#10 +
      'RightL.Caption=Rechts' + #13#10 +
      'BottomL.Caption=Onder' + #13#10 +
      'MarginsL.Caption=Marges   ' + #13#10 +
      'PortraitRB.Caption=Staand' + #13#10 +
      'LandscapeRB.Caption=Liggend' + #13#10 +
      'cmL1.Caption=cm' + #13#10 +
      'cmL2.Caption=cm' + #13#10 +
      'cmL3.Caption=cm' + #13#10 +
      'cmL4.Caption=cm' + #13#10 +
      'cmL5.Caption=cm' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuleren' + #13#10 +
      'OtherL.Caption=Overig   ' + #13#10 +
      'ApplyToCurRB.Caption=Toepassen op de huidige pagina' + #13#10 +
      'ApplyToAllRB.Caption=Toepassen op alle pagina''s' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Afdrukken' + #13#10 +
      'PrinterL.Caption=Printer   ' + #13#10 +
      'PagesL.Caption=Pagina''s   ' + #13#10 +
      'CopiesL.Caption=Kopieën   ' + #13#10 +
      'CopiesNL.Caption=Aantal kopieën' + #13#10 +
      'DescrL.Caption=Vul paginanummers en/of pagina ranges in, gescheiden door komma''s. Bijvoorbeeld: 1,3,5-12' + #13#10 +
      'OptionsL.Caption=Opties   ' + #13#10 +
      'EscL.Caption=Escape commando''s   ' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Annuleren' + #13#10 +
      'SaveToFileCB.Caption=Afdrukken naar bestand' + #13#10 +
      'AllRB.Caption=Alles' + #13#10 +
      'CurPageRB.Caption=Huidige pagina''s' + #13#10 +
      'PageNumbersRB.Caption=Pagina''s:' + #13#10 +
      'PageBreaksCB.Caption=Pagina scheidingen' + #13#10 +
      'OemCB.Caption=OEM codepage' + #13#10 +
      'PseudoCB.Caption=Pseudo grafisch' + #13#10 +
      'SaveDialog1.Filter=Afdrukbestand (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Annuleren' + #13#10 +
      '');

    Add('mbConfirm', 'Bevestigen');
    Add('mbError', 'Fout');
    Add('mbInfo', 'Informatie');
    Add('xrCantFindClass', 'Kan de klasse niet vinden');
    Add('prVirtual', 'Virtueel');
    Add('prDefault', 'Default');
    Add('prCustom', 'Aangepast');
    Add('enUnconnHeader', 'Zwevende kopregel/voetregel');
    Add('enUnconnGroup', 'Geen gegevens band voor deze groep');
    Add('enUnconnGFooter', 'Geen groepskop voor');
    Add('enBandPos', 'Onjuiste band positie:');
    Add('dbNotConn', 'DataSet %s is niet met gegevens verbonden');
    Add('dbFldNotFound', 'Veld niet gevonden:');
    Add('clDSNotIncl', '(dataset is niet opgenomen in de Report.DataSets)');
    Add('clUnknownVar', 'Onbekende variabele of gegevensveld:');
    Add('clScrError', 'Script fout op %s: %s');
    Add('clDSNotExist', 'Dataset "%s" bestaat niet');
    Add('clErrors', 'De volgende fout(en) is/zijn opgetreden:');
    Add('clExprError', 'Fout in expressie');
    Add('clFP3files', 'Bestaand rapport');
    Add('clSaving', 'Bestand wordt opgeslagen...');
    Add('clCancel', 'Annuleren');
    Add('clClose', 'Sluiten');
    Add('clPrinting', 'Pagina wordt afgedrukt');
    Add('clLoading', 'Bestand wordt opgehaald...');
    Add('clPageOf', 'Pagina %d van %d');
    Add('clFirstPass', 'Eerste bewerking: page ');
    Add('clNoPrinters', 'Er op deze computer geen printers geinstalleerd');
    Add('clDecompressError', 'Stream decompress error');
    Add('crFillMx', 'Kruistabel wordt gevuld...');
    Add('crBuildMx', 'Kruistabel wordt samengesteld...');

    Add('prRunningFirst', 'First pass: page %d');
    Add('prRunning', 'Preparing page %d');
    Add('prPrinting', 'Printing page %d');
    Add('prExporting', 'Exporting page %d');
    Add('uCm', 'cm');
    Add('uInch', 'in');
    Add('uPix', 'px');
    Add('uChar', 'chr');
  end;
end;


initialization
  frAddClassesRes;

end.