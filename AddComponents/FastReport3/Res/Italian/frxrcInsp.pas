
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

unit frxrcInsp;

interface

procedure frAddInspectorRes;


implementation

uses frxRes;


procedure frAddInspectorRes;
begin
  with frxResources do
  begin
    Add('propActive', 'Indica se un DataSet è aperto o meno');
    Add('propActive.TfrxHighlight', 'Indica se il testo selezionato è attivo o meno');
    Add('propAliasName', 'Il nome dell''alias BDE');
    Add('propAlign', 'Determina l''allineamento dell''oggetto relativamente alla Banda o alla pagina');
    Add('propAlignment', 'Allineamento Oggetto testo');
    Add('propAllowAllUp', 'Determina se tutti gli Speed Button di uno stesso gruppo possono essere deselezionati nello stesso momento');
    Add('propAllowEdit', 'Determina se l''utente può modificare le pagine del report preparato');
    Add('propAllowExpressions', 'Determina se l''oggetto testo può contenere espressioni nel testo');
    Add('propAllowGrayed', 'Permetti lo stato disattivato dei controlli Checkbox');
    Add('propAllowHTMLTags', 'Determina se l''oggetto testo può contenere dei Tag HTML nel testo');
    Add('propAllowSplit', 'Determina se la banda può spezzare il suo contenuto su più pagine'); 
    Add('propAuthor', 'L''autore del report');
    Add('propAutoSize', 'Determina se l''immagine debba gestire automaticamente la sua dimensione');
    Add('propAutoWidth', 'Determina se l''oggetto testo debba gestire automaticamente la sua larghezza');
    Add('propBackPicture', 'Immagine di sfondo della pagina');
    Add('propBarType', 'Tipo di codice a barre');
    Add('propBevelInner', 'Tipo di bordo interno');
    Add('propBevelOuter', 'Tipo di bordo esterno');
    Add('propBevelWidth', 'Larghezza della smussatura');
    Add('propBorder', 'Determina se mostrare il bordo esterno o meno');
    Add('propBorderStyle', 'Stile della finestra');
    Add('propBottomMargin', 'Il formato del margine inferiore della pagina');
    Add('propBrushStyle', 'Stile del pennello usato per lo sfondo dell''oggetto');
    Add('propButtons', 'Serie di bottoni visibili nell''anteprima');
    Add('propCacheSize', 'Quantità massima di memoria usata dal motore dei Report. Se l''uso di memoria eccede questo valore, le pagine preparate saranno memorizzate in un file su disco');
    Add('propCalcCheckSum', 'Determina se la cifra di controllo del codice a barre debba essere calcolata automaticamente');
    Add('propCancel', 'Determina se il pulsante debba essere attivato quando viene premuto il tasto Esc');
    Add('propCaption', 'Il titolo del controllo');
    Add('propCellFields', 'I nome dei campi DB rappresenta le celle trasversali');
    Add('propCellLevels', 'Numero di livelli delle celle');
    Add('propCenter', 'Determina se l''immagine dove essere centrata all''interno del controllo');
    Add('propCharset', 'Set di caratteri');
    Add('propCharSpacing', 'Quantità di pixel fra due caratteri');
    Add('propCheckColor', 'Colore dei Check Mark');
    Add('propChecked', 'Indica se il controllo è contrassegnato');
    Add('propCheckStyle', 'Stile dei Check Mark');
    Add('propChild', 'Banda Figlio connessa a questa Banda');
    Add('propCollate', 'Impostazioni di default della Collazione');
    Add('propColor.TFont', 'Colore del testo');
    Add('propColor', 'Colore dell''oggetto');
    Add('propColor.TfrxFrame', 'Colore della cornice');
    Add('propColor.TfrxHighlight', 'Determina il colore dell''oggetto se è evidenziato');
    Add('propColumnFields', 'I nomi dei campi DB rappresenta le colonne trasverali');
    Add('propColumnGap', 'Spazio tra le colonne della Banda');
    Add('propColumnLevels', 'Numero di livelli della colonna');
    Add('propColumns', 'Numero di colonne nella Banda');
    Add('propColumnWidth', 'Larghezza della colonna della Banda');
    Add('propCondition', 'Condizioni di raggruppamento. Il gruppo verrà spezzato se il valore di questa espressione cambiasse');
    Add('propCondition.TfrxHighlight', 'Espressione. Se questa espressione è Vera, l''evidenziatore sarà attivo');
    Add('propConnected', 'Indica se la connessione al Database è attiva');
    Add('propConvertNulls', 'Determina se i valori nulli DB saranno convertiti a 0, Falso o stringa vuota');
    Add('propCopies', 'Numero di copie di default ');
    Add('propCursor', 'Il cursore dell''oggetto');
    Add('propDatabaseName', 'Nome del Database');
    Add('propDataField', 'Specifica il campo dal quale l''oggetto ottiene i dati');
    Add('propDataSet', 'Collega l''oggetto al Dataset che contiene il campo che lo rappresenta');
    Add('propDate', 'Valore del controllo in formato Data');
    Add('propDateFormat', 'Specifica il formato nel quale la data sarà rappresentata');
    Add('propDecimalSeparator', 'Separatore decimale');
    Add('propDefault', 'Determina se il pulsante è il pulsante di default');
    Add('propDefHeight', 'Altezza di default della riga');
    Add('propDescription', 'Descrizione del Report');
    Add('propDiagonal', 'Indica che la linea è diagonale');
    Add('propDisplayFormat', 'Formato del valore visualizzato');
    Add('propDoubleBuffered', 'Determina se finestra di anteprima usa il Double Buffering. Se il Double Buffering è permesso si evita lo sfarfallamento, ma è più lento');
    Add('propDoublePass', 'Determina se il motore del report deve effettuare una seconda passata');
    Add('propDown', 'Determina se lo Speed Button è premuto o no');
    Add('propDownThenAcross', 'Determina come una grande tabella trasversale sarà spezzata attraverso le pagine');
    Add('propDriverName', 'Nome del driver BDE');
    Add('propDropShadow', 'Determina se gli oggetti avranno un''ombra');
    Add('propDuplex', 'Indica la visualizzazione in doppia pagina');
    Add('propEditMask', 'Specifica la maschera che rappresenta un testo valido per il controllo Masked Edit');
    Add('propEnabled', 'Determina se il controllo è disabilitato');
    Add('propEngineOptions', 'Opzioni motore del Report');
    Add('propExpression', 'Il valore di questa espressione sarà indicato nell''oggetto');
    Add('propExpressionDelimiters', 'I caratteri che saranno usati per delimitare un testo');
    Add('propFieldAliases', 'Gli Aliases del campo del Dataset');
    Add('propFilter', 'Condizioni di filtro per il Dataset');
    Add('propFiltered', 'Determina se il Dataset dovrebbe filtrare i Record usando le condizioni nelle Proprietà Filtro');
    Add('propFlowTo', 'L''oggetto testo mostrerà il testo anche se non ci sta nell''oggetto');
    Add('propFont', 'Attributi del carattere dell''oggetto');
    Add('propFooterAfterEach', 'Determina se la Banda Piede dovrebbe essere mostrata dopo ogni fila di dati');
    Add('propFormatStr', 'Stringa formattata');
    Add('propFrame', 'Attributi della cornice dell''oggetto');
    Add('propGapX', 'Rientranza di sinistra del testo');
    Add('propGapY', 'Rientranza superiore del testo');
    Add('propGlyph', 'Immagine del controllo');
    Add('propGroupIndex', 'Permetti che gli Speed Button funzionino insieme come gruppo');
    Add('propHAlign', 'Allineamento orizzonatale del testo');
    Add('propHeight', 'Altezza dell''oggetto');
    Add('propHGuides', 'Linee giuda orizzontali della pagina');
    Add('propHideZeros', 'Determina se l''oggetto testo deve nascondere i valori a zero');
    Add('propHighlight', 'Gli attributi condizionali per evidenziare');
    Add('propIndexName', 'Nome dell''indice');
    Add('propInitString', 'Stringa di inizializzazione per Report per stampanti ad aghi');
    Add('propItems', 'Lista di voci nell''oggetto');
    Add('propKeepAspectRatio', 'Mantieni le proporzioni originali dell''immagine');
    Add('propKeepChild', 'Determina se la Banda verrà stampata insieme con il Figlio');
    Add('propKeepFooter', 'Determina se la Banda verrà stampata insieme con il Piede');
    Add('propKeepTogether', 'Determina se la Banda verrà stampata insieme con tutte le sotto-Bande');
    Add('propKind.TfrxFormat', 'Tipo di formattazione');
    Add('propKind', 'Tipo di pulsante');
    Add('propLargeDesignHeight', 'Determina se la pagina abbia un''altezza maggiorata nella modalità Design');
    Add('propLayout', 'Allineamento immagine nel pulsante');
    Add('propLeft', 'Coordinate di sinistra dell''oggetto');
    Add('propLeftMargin', 'Dimensione del margine sinistro della pagina');
    Add('propLines', 'Testo dell''oggetto');
    Add('propLineSpacing', 'Quantità di pixel fra due linee di testo');
    Add('propLoginPrompt', 'Determina se mostrare la finestra di Login');
    Add('propMargin', 'Determina il numero di pixel fra il bordo dell''immagine ed il bordo del bottone');
    Add('propMaster', 'Database principale');
    Add('propMasterFields', 'Campi collegati da relazione master-detail');
    Add('propMaximized', 'Determina se la finestra di anteprima sarà a tutto schermo');
    Add('propMaxLength', 'Lunghezza massima del testo');
    Add('propMaxPages', 'Numero massimo di pagine nel report preparato');
    Add('propMaxWidth', 'Lunghezza massima della colonna');
    Add('propMDIChild', 'Determina se la finestra di anteprima sarà una finestra MDI Figlia');
    Add('propMemo', 'Testo dell''oggetto');
    Add('propMinWidth', 'Larghezza minima della colonna');
    Add('propMirrorMargins', 'Margini della pagina speculari su ogni pagina');
    Add('propModal', 'Determina se la finestra di anteprima sarà mostrata come finestra modale');
    Add('propModalResult', 'Determina se e come il bottone chiude la relativa finestra modale');
    Add('propName.TFont', 'Nome del font');
    Add('propName.TfrxReportOptions', 'Nome del report');
    Add('propName', 'Nome dell''oggetto');
    Add('propNumGlyphs', 'Indica il numero di immagini');
    Add('propOpenDataSource', 'Determina se aprire il datasource automaticamente o no');
    Add('propOrientation', 'Orientamento della pagina');
    Add('propOutlineText', 'Testo che sarà mostrato nell''outline');
    Add('propOutlineVisible', 'Visibilità dell''outline');
    Add('propOutlineWidth', 'Larghezza dell''outline');
    Add('propPageNumbers.TfrxPrintOptions', 'Numeri delle pagine da stampare');
    Add('propPaperHeight', 'Altezza della pagina');
    Add('propPaperWidth', 'Larghezza della pagina');
    Add('propParagraphGap', 'Rientranza della prima linea del paragrafo');
    Add('propParams.TfrxBDEDatabase', 'Parametri di connessione');
    Add('propParams', 'Parametri della Query');
    Add('propParentFont', 'Determina se l''oggetto userà il carattere del Padre');
    Add('propPassword', 'Password del Report');
    Add('propPasswordChar', 'Indica il carattere da visualizzare per mascherare la password');
    Add('propPicture', 'Immagine');
    Add('propPicture.TfrxReportOptions', 'Descrizione dell''immagine del Report');
    Add('propPosition', 'Posizione iniziale della finestra');
    Add('propPreviewOptions', 'Opzioni di anteprima del Report');
    Add('propPrintable', 'Stampabilità dell''oggetto. Gli oggetti con Printable=False saranno mostrati in anteprima, ma non saranno stampati');
    Add('propPrintChildIfInvisible', 'Determina se verrà stampata la Banda Figlia nel caso in cui la Banda Padre sia invisibile');
    Add('propPrinter', 'Nome della stampante che sarà selezionata quando aprirai o eseguirai questo Report');
    Add('propPrintIfDetailEmpty', 'Determina se i dati della Banda saranno stampati se la sottobanda è vuota');
    Add('propPrintIfEmpty', 'Determina se la pagina sarà stampata se tutti i Dataset sono vuoti');
    Add('propPrintOnFirstPage', 'Determina se la banda sarà stampata sulla prima pagina');
    Add('propPrintOnLastPage', 'Determina se la banda sarà stampata sull''ultima pagina');
    Add('propPrintOnParent', 'Determina se il sub-Report può stamparsi sulla Banda Padre');
    Add('propPrintOnPreviousPage', 'Determina se la pagina può essere generata sullo spazio libero della pagina precedentemente generata');
    Add('propPrintOptions', 'Opzioni di stampa del Report');
    Add('propPrintPages', 'Determina se stampare tutto o solo le pagine pari o dispari');
    Add('propRangeBegin', 'Determina il punto iniziale di navigazione del Dataset');
    Add('propRangeEnd', 'Determina il punto finale di navigazione del Dataset');
    Add('propRangeEndCount', 'Determina il numero di Record nel Dataset se RangeEnd è reCount');
    Add('propReadOnly', 'Determina se l''oggetto testo è a sola lettura');
    Add('propRepeatHeaders', 'Determina se le intestazioni delle colonne e delle righe saranno ristampate sulla nuova pagina');
    Add('propReportOptions', 'Opzioni del Report');
    Add('propReprintOnNewPage', 'Determina se la Banda sarà ristampata sulla nuova pagina');
    Add('propRestrictions', 'Imposta le restrizioni');
    Add('propRightMargin', 'Dimensione del margine destro della pagina');
    Add('propRotation.TfrxBarCodeView', 'Orientamento del condice a barre');
    Add('propRotation', 'Rotazione del testo');
    Add('propRowCount', 'Numero di Record virtuali nel Databand');
    Add('propRowFields', 'Nomi dei campi DB che sono rappresentati nelle righe trasversali');
    Add('propRowLevels', 'Numero di livelli di righe');
    Add('propRTLReading', 'Determina se l''oggetto testo mostrerà il testo da destra verso sinistra');
    Add('propScriptLanguage', 'Nome del linguaggio dello script usato nel Report');
    Add('propSessionName', 'Nome della sessione BDE');
    Add('propShadowColor', 'Colore dell''ombra');
    Add('propShadowWidth', 'Larghezza dell''ombra');
    Add('propShape', 'Tipo di forma');
    Add('propShiftMode', 'Metodo di Shift dell''oggetto');
    Add('propShowCaptions', 'Mostra i titoli');
    Add('propShowColumnHeader', 'Mostra le intestazioni della colonna');
    Add('propShowColumnTotal', 'Mostra l''importo totale della colonna');
    Add('propShowRowHeader', 'Mostra le intestazioni della riga');
    Add('propShowRowTotal', 'Mostra il totale della riga');
    Add('propShowDialog', 'Mostra la finestra di dialogo di Stampa durante l''anteprima');
    Add('propShowText', 'Determina se l''oggetto codice a barre sarà mostrato come testo leggibile');
    Add('propSize', 'Dimensione del carattere');
    Add('propSorted', 'Determina se le righe sono ordinate oppure no');
    Add('propSpacing', 'Determina il numero di pixel tra l''immagine ed il testo');
    Add('propSQL', 'Istruzione SQL');
    Add('propStartNewPage', 'Inizia una nuova pagina prima della stampa della Banda');
    Add('propStretch', 'Allunga l''immagine fino ai margini dell''oggetto');
    Add('propStretched', 'Determina se l''oggetto può essere allungato');
    Add('propStretchMode', 'Tipo di allungamento dell''oggetto');
    Add('propStyle.TFont', 'Stile del carattere');
    Add('propStyle', 'Stile del controllo');
    Add('propStyle.TfrxFrame', 'Stile della cornice dell''oggetto');
    Add('propSuppressRepeated', 'Sopprimi valori ripetuti');
    Add('propTableName', 'Nome tabella');
    Add('propTag', 'Numero di Tag dell''oggetto');
    Add('propTagStr', 'Stringa di Tag dell''oggetto');
    Add('propText', 'Testo dell''oggetto');
    Add('propTitleBeforeHeader', 'Determina se mostrare il titolo del report prima dell''intestazione della pagina');
    Add('propTop', 'Coordinate superiori dell''oggetto');
    Add('propTopMargin', 'Dimensione del margine superiore della pagina');
    Add('propTyp', 'Tipo di cornice');
    Add('propUnderlines', 'Determina se l''oggetto testo mosterà linee della griglia dopo ogni linea di testo');
    Add('propURL', 'URL dell''oggetto');
    Add('propUserName', 'Nome utente. Questo nome sarà mostrato nell''elenco degli archivi');
    Add('propVAlign', 'Allineamento verticale del testo');
    Add('propVersionBuild', 'Informazioni sulla versione, Build');
    Add('propVersionMajor', 'Informazioni sulla versione, Major Version');
    Add('propVersionMinor', 'Informazioni sulla versione, Minor Version');
    Add('propVersionRelease', 'Informazioni sulla versione, Release');
    Add('propVGuides', 'Guide linea verticali della pagina');
    Add('propVisible', 'Visibilità dell''oggetto');
    Add('propWidth', 'Larghezza dell''oggetto');
    Add('propWidth.TfrxFrame', 'Larghezza della cornice');
    Add('propWindowState', 'Condizione iniziale della finestra');
    Add('propWordBreak', 'Sillabazione');
    Add('propWordWrap', 'A capo automatico');
    Add('propZoom.TfrxBarCodeView', 'Ingrandisci il codice a barre');
    Add('propZoom', 'Fattore iniziale dello zoom nell''anteprima');
    Add('propZoomMode', 'Modo iniziale dello zoom dell''anteprima');
  end;
end;


initialization
  frAddInspectorRes;

end.
