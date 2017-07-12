
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
      'Caption=Anteprima' + #13#10 +
      'PrintB.Caption=Stampa' + #13#10 +
      'PrintB.Hint=Stampa' + #13#10 +
      'OpenB.Caption=Apri' + #13#10 +
      'OpenB.Hint=Apri' + #13#10 +
      'SaveB.Caption=Salva' + #13#10 +
      'SaveB.Hint=Salva' + #13#10 +
      'ExportB.Caption=Esporta' + #13#10 +
      'ExportB.Hint=Esporta' + #13#10 +
      'FindB.Caption=Trova' + #13#10 +
      'FindB.Hint=Trova' + #13#10 +
      'ZoomWholePageB.Caption=Pagina intera' + #13#10 +
      'ZoomWholePageB.Hint=Pagina intera' + #13#10 +
      'ZoomPageWidthB.Caption=Larghezza pagina' + #13#10 +
      'ZoomPageWidthB.Hint=Larghezza pagina' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=Due Pagine' + #13#10 +
      'Zoom50B.Hint=Due Pagine' + #13#10 +
      'ZoomCB.Hint=Zoom' + #13#10 +
      'PageSettingsB.Caption=Margini' + #13#10 +
      'PageSettingsB.Hint=Margini' + #13#10 +
      'OutlineB.Caption=Profilo' + #13#10 +
      'OutlineB.Hint=Profilo' + #13#10 +
      'HandToolB.Caption=Trascina' + #13#10 +
      'HandToolB.Hint=Strumento Trascina' + #13#10 +
      'ZoomToolB.Caption=Zoom' + #13#10 +
      'ZoomToolB.Hint=Strumento Zoom' + #13#10 +
      'NewPageB.Caption=Aggiungi pagina' + #13#10 +
      'NewPageB.Hint=Aggiungi pagina' + #13#10 +
      'DelPageB.Caption=Elimina' + #13#10 +
      'DelPageB.Hint=Elimina pagina' + #13#10 +
      'DesignerB.Caption=Modifica' + #13#10 +
      'DesignerB.Hint=Modifica pagina' + #13#10 +
      'FirstB.Caption=Prima' + #13#10 +
      'FirstB.Hint=Prima pagina' + #13#10 +
      'PriorB.Caption=Precedente' + #13#10 +
      'PriorB.Hint=Pagina precedente' + #13#10 +
      'NextB.Caption=Successivo' + #13#10 +
      'NextB.Hint=Pagina successiva' + #13#10 +
      'LastB.Caption=Ultima' + #13#10 +
      'LastB.Hint=Ultima pagina' + #13#10 +
      'CancelB.Caption=Chiudi' + #13#10 +
      'PageE.Hint=Numero pagina' + #13#10 +
      '');
    Add('zmPageWidth', 'Larghezza pagina');
    Add('zmWholePage', 'Pagina intera');

    Add('TfrxPrintDialog',
      'Caption=Stampa' + #13#10 +
      'Label12.Caption=Stampante   ' + #13#10 +
      'DescrL.Caption=Inserire i numeri di pagina e/o l''intervallo di pagine, separati da virgola. Per esempio, 1,3,5-12' + #13#10 +
      'Label1.Caption=Pagine   ' + #13#10 +
      'CopiesL.Caption=Numero di copie' + #13#10 +
      'CollateL.Caption=Ordina' + #13#10 +
      'Label2.Caption=Copie   ' + #13#10 +
      'PrintL.Caption=stampa' + #13#10 +
      'TypeL.Caption=Tipo:' + #13#10 +
      'WhereL.Caption=Dove:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      'PropButton.Caption=Proprietà...' + #13#10 +
      'AllRB.Caption=Tutte' + #13#10 +
      'CurPageRB.Caption=Pagina corrente' + #13#10 +
      'PageNumbersRB.Caption=Pagine:' + #13#10 +
      'FileCB.Caption=stampa su file' + #13#10 +
      'ReverseCB.Caption=Pagine inverse' + #13#10 +
      '');
    Add('ppAll', 'Tutte le pagine');
    Add('ppOdd', 'Pagine pari');
    Add('ppEven', 'Pagine dispari');

    Add('TfrxSearchDialog',
      'Caption=Trova testo' + #13#10 +
      'TextL.Caption=Testo da trovare:' + #13#10 +
      'SearchL.Caption=Opzioni di ricerca   ' + #13#10 +
      'ReplaceL.Caption=Sostituisci con' + #13#10 +
      'TopCB.Caption=Cerca dall''inizio' + #13#10 +
      'CaseCB.Caption=Differenzia maiuscole/minuscole' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Impostazioni della pagina' + #13#10 +
      'WidthL.Caption=Larghezza' + #13#10 +
      'HeightL.Caption=Altezza' + #13#10 +
      'SizeL.Caption=Dimensione   ' + #13#10 +
      'OrientationL.Caption=Orientamento   ' + #13#10 +
      'LeftL.Caption=Sinistra' + #13#10 +
      'TopL.Caption=Alto' + #13#10 +
      'RightL.Caption=Destra' + #13#10 +
      'BottomL.Caption=Basso' + #13#10 +
      'MarginsL.Caption=Margini   ' + #13#10 +
      'PortraitRB.Caption=Orizzontale' + #13#10 +
      'LandscapeRB.Caption=Verticale' + #13#10 +
      'cmL1.Caption=cm' + #13#10 +
      'cmL2.Caption=cm' + #13#10 +
      'cmL3.Caption=cm' + #13#10 +
      'cmL4.Caption=cm' + #13#10 +
      'cmL5.Caption=cm' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      'OtherL.Caption=Altro   ' + #13#10 +
      'ApplyToCurRB.Caption=Applica alla pagina corrente' + #13#10 +
      'ApplyToAllRB.Caption=Applica a tutte le pagine' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Stampa' + #13#10 +
      'PrinterL.Caption=Stampante   ' + #13#10 +
      'PagesL.Caption=Pagine   ' + #13#10 +
      'CopiesL.Caption=Copie   ' + #13#10 +
      'CopiesNL.Caption=Numero di copie' + #13#10 +
      'DescrL.Caption=Inserire i numeri di pagina e/o l''intervallo di pagine, separati da virgola. Per esempio, 1,3,5-12' + #13#10 +
      'OptionsL.Caption=Opzioni   ' + #13#10 +
      'EscL.Caption=Comandi di escape   ' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Annulla' + #13#10 +
      'SaveToFileCB.Caption=Stampa su file' + #13#10 +
      'AllRB.Caption=Tutte' + #13#10 +
      'CurPageRB.Caption=Pagina corrente' + #13#10 +
      'PageNumbersRB.Caption=Pagine:' + #13#10 +
      'PageBreaksCB.Caption=Interruzioni di pagina' + #13#10 +
      'OemCB.Caption=Set di caratteri OEM' + #13#10 +
      'PseudoCB.Caption=Pseudografica' + #13#10 +
      'SaveDialog1.Filter=File di stampa (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Annulla' + #13#10 +
      '');

    Add('mbConfirm', 'Conferma');
    Add('mbError', 'Errore');
    Add('mbInfo', 'Informazione');
    Add('xrCantFindClass', 'Non posso trovare le classi');
    Add('prVirtual', 'Virtuale');
    Add('prDefault', 'Default');
    Add('prCustom', 'Custom');
    Add('enUnconnHeader', 'Testata/piede non collegati');
    Add('enUnconnGroup', 'Nessuna Banda di dati per il gruppo');
    Add('enUnconnGFooter', 'Nessuna intestazione di gruppo per');
    Add('enBandPos', 'Posizione errata della Banda:');
    Add('dbNotConn', 'Il DataSet %s non è connesso ai dati');
    Add('dbFldNotFound', 'Campo non trovato:');
    Add('clDSNotIncl', '(il Dataset non è incluso nel Report.DataSets)');
    Add('clUnknownVar', 'Variabile o campo sconosciuto:');
    Add('clScrError', 'Errore di script %s: %s');
    Add('clDSNotExist', 'Il Dataset "%s" non esiste');
    Add('clErrors', 'Sono successi i seguenti errori:');
    Add('clExprError', 'Errore nell''espressione');
    Add('clFP3files', 'Report preparato');
    Add('clSaving', 'Salvataggio file...');
    Add('clCancel', 'Annulla');
    Add('clClose', 'Chiudi');
    Add('clPrinting', 'Stampa pagina in corso');
    Add('clLoading', 'Caricamento file...');
    Add('clPageOf', 'Pagina %d di %d');
    Add('clFirstPass', 'Primo passaggio: pagina ');
    Add('clNoPrinters', 'Non ci sono stampanti installate nel computer');
    Add('clDecompressError', 'Errore di decompressione dello stream');
    Add('crFillMx', 'Riempire il cross-tab...');
    Add('crBuildMx', 'Costruire il cross-tab...');

    Add('prRunningFirst', 'First pass: page %d');
    Add('prRunning', 'Preparing page %d');
    Add('prPrinting', 'Printing page %d');
    Add('prExporting', 'Exporting page %d');
    Add('uCm', 'cm');
    Add('uInch', 'in');
    Add('uPix', 'px');
    Add('uChar', 'car');
  end;
end;


initialization
  frAddClassesRes;

end.