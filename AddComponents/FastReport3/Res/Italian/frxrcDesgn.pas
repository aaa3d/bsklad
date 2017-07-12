
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
      'Caption=Proprietà dell''oggetto' + #13#10 +
      '');
    Add('oiProp', 'Proprietà');
    Add('oiEvent', 'Eventi');

    Add('TfrxDataTreeForm',
      'Caption=Albero dei dati' + #13#10 +
      'DataTS.Caption=Dati' + #13#10 +
      'VariablesTS.Caption=Variabili' + #13#10 +
      'FunctionsTS.Caption=Funzioni' + #13#10 +
      'InsFieldCB.Caption=Crea campo' + #13#10 +
      'InsCaptionCB.Caption=Crea Titolo' + #13#10 +
      '');
    Add('dtNoData', 'Nessun dato disponibile');
    Add('dtData', 'Dati');
    Add('dtSysVar', 'Variabili di sistema');
    Add('dtVar', 'Variabili');
    Add('dtFunc', 'Funzioni');

    Add('TfrxReportTreeForm',
      'Caption=Albero del Report' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Apri il file di Script' + #13#10 +
      'SaveScriptB.Hint=Salva lo Script nel file' + #13#10 +
      'RunScriptB.Hint=Esegui Script' + #13#10 +
      'StepScriptB.Hint=Traccia dentro' + #13#10 +
      'StopScriptB.Hint=Termina Script' + #13#10 +
      'EvaluateB.Hint=Valuta' + #13#10 +
      'LangL.Caption=Linguaggio:' + #13#10 +
      'AlignTB.Caption=Allineamento' + #13#10 +
      'AlignLeftsB.Hint=Allinea a sinistra' + #13#10 +
      'AlignHorzCentersB.Hint=Allinea al centro' + #13#10 +
      'AlignRightsB.Hint=Allinea a destra' + #13#10 +
      'AlignTopsB.Hint=Allinea in alto' + #13#10 +
      'AlignVertCentersB.Hint=Allinea al centro' + #13#10 +
      'AlignBottomsB.Hint=Allinea in fondo' + #13#10 +
      'SpaceHorzB.Hint=Spazia orizzontalmente' + #13#10 +
      'SpaceVertB.Hint=Spazia verticalmente' + #13#10 +
      'CenterHorzB.Hint=Centra orizzontalmente nella Banda' + #13#10 +
      'CenterVertB.Hint=Centra verticalmente nella Banda' + #13#10 +
      'SameWidthB.Hint=Stessa larghezza' + #13#10 +
      'SameHeightB.Hint=Stessa altezza' + #13#10 +
      'TextTB.Caption=Testo' + #13#10 +
      'StyleCB.Hint=Stile' + #13#10 +
      'FontNameCB.Hint=Nome del carattere' + #13#10 +
      'FontSizeCB.Hint=Dimensioni del carattere' + #13#10 +
      'BoldB.Hint=Grassetto' + #13#10 +
      'ItalicB.Hint=Corsivo' + #13#10 +
      'UnderlineB.Hint=Sottolineato' + #13#10 +
      'FontColorB.Hint=Colore del carattere' + #13#10 +
      'HighlightB.Hint=Evidenziato' + #13#10 +
      'RotateB.Hint=Rotazione del testo' + #13#10 +
      'TextAlignLeftB.Hint=Allinea a sinistra' + #13#10 +
      'TextAlignCenterB.Hint=Allinea al centro' + #13#10 +
      'TextAlignRightB.Hint=Allinea a destra' + #13#10 +
      'TextAlignBlockB.Hint=Giustificato' + #13#10 +
      'TextAlignTopB.Hint=Allinea in alto' + #13#10 +
      'TextAlignMiddleB.Hint=Allinea al centro' + #13#10 +
      'TextAlignBottomB.Hint=Allinea in fondo' + #13#10 +
      'FrameTB.Caption=Cornice' + #13#10 +
      'FrameTopB.Hint=Linea alta' + #13#10 +
      'FrameBottomB.Hint=Linea bassa' + #13#10 +
      'FrameLeftB.Hint=Linea sinistra' + #13#10 +
      'FrameRightB.Hint=Linea destra' + #13#10 +
      'FrameAllB.Hint=Linee su tutta la Cornice' + #13#10 +
      'FrameNoB.Hint=Nessuna cornice' + #13#10 +
      'ShadowB.Hint=Ombra' + #13#10 +
      'FillColorB.Hint=Colore di sfondo' + #13#10 +
      'FrameColorB.Hint=Colore della cornice' + #13#10 +
      'FrameStyleB.Hint=Stile della cornice' + #13#10 +
      'FrameWidthCB.Hint=Larghezza della cornice' + #13#10 +
      'StandardTB.Caption=Standard' + #13#10 +
      'NewB.Hint=Nuovo Report' + #13#10 +
      'OpenB.Hint=Apri Report' + #13#10 +
      'SaveB.Hint=Salva Report' + #13#10 +
      'PreviewB.Hint=Anteprima' + #13#10 +
      'NewPageB.Hint=Nuova pagina Report' + #13#10 +
      'NewDialogB.Hint=Nuova finestra di dialogo' + #13#10 +
      'DeletePageB.Hint=Elimina pagina' + #13#10 +
      'PageSettingsB.Hint=Impostazioni della pagina' + #13#10 +
      'VariablesB.Hint=Variabili' + #13#10 +
      'CutB.Hint=Taglia' + #13#10 +
      'CopyB.Hint=Copia' + #13#10 +
      'PasteB.Hint=Incolla' + #13#10 +
      'SampleFormatB.Hint=Copia formattazione' + #13#10 +
      'UndoB.Hint=Annulla' + #13#10 +
      'RedoB.Hint=Ripeti' + #13#10 +
      'GroupB.Hint=Raggruppa' + #13#10 +
      'UngroupB.Hint=Annulla raggruppamento' + #13#10 +
      'ShowGridB.Hint=Mostra Griglia' + #13#10 +
      'AlignToGridB.Hint=Allinea alla griglia' + #13#10 +
      'SetToGridB.Hint=Dimensiona alla griglia' + #13#10 +
      'ScaleCB.Hint=Zoom' + #13#10 +
      'ExtraToolsTB.Caption=Strumenti aggiuntivi' + #13#10 +
      'ObjectSelectB.Hint=Seleziona Strumento' + #13#10 +
      'HandToolB.Hint=Strumento Mano' + #13#10 +
      'ZoomToolB.Hint=Strumento Zoom' + #13#10 +
      'TextToolB.Hint=Strumento Testo' + #13#10 +
      'FormatToolB.Hint=Strumento Copia formato' + #13#10 +
      'ObjectBandB.Hint=Inserisci Banda' + #13#10 +
      'FileMenu.Caption=&File' + #13#10 +
      'EditMenu.Caption=&Modifica' + #13#10 +
      'FindMI.Caption=Trova...' + #13#10 +
      'FindNextMI.Caption=Trova successivo' + #13#10 +
      'ReplaceMI.Caption=Sostituisci...' + #13#10 +
      'ReportMenu.Caption=&Report' + #13#10 +
      'ReportDataMI.Caption=Dati...' + #13#10 +
      'ReportSettingsMI.Caption=Opzioni...' + #13#10 +
      'ReportStylesMI.Caption=Stili...' + #13#10 +
      'ViewMenu.Caption=&Anteprima' + #13#10 +
      'ToolbarsMI.Caption=Barra degli strumenti' + #13#10 +
      'StandardMI.Caption=Standard' + #13#10 +
      'TextMI.Caption=Testo' + #13#10 +
      'FrameMI.Caption=Cornice' + #13#10 +
      'AlignmentMI.Caption=Strumenti di allineamento' + #13#10 +
      'ToolsMI.Caption=Strumenti aggiuntivi' + #13#10 +
      'InspectorMI.Caption=Proprietà dell''oggetto' + #13#10 +
      'DataTreeMI.Caption=Albero dei dati' + #13#10 +
      'ReportTreeMI.Caption=Albero del report' + #13#10 +
      'ShowRulersMI.Caption=Righelli' + #13#10 +
      'ShowGuidesMI.Caption=Guide' + #13#10 +
      'DeleteGuidesMI.Caption=Elimina le guide' + #13#10 +
      'OptionsMI.Caption=Opzioni...' + #13#10 +
      'HelpMenu.Caption=&Help' + #13#10 +
      'HelpContentsMI.Caption=Indice dell''Help ...' + #13#10 +
      'AboutMI.Caption=Informazioni su FastReport...' + #13#10 +
      'TabOrderMI.Caption=Ordine di Tabulazione...' + #13#10 +
      'UndoCmd.Caption=Annulla' + #13#10 +
      'RedoCmd.Caption=Ripeti' + #13#10 +
      'CutCmd.Caption=Taglia' + #13#10 +
      'CopyCmd.Caption=Copia' + #13#10 +
      'PasteCmd.Caption=Incolla' + #13#10 +
      'GroupCmd.Caption=Raggruppa' + #13#10 +
      'UngroupCmd.Caption=Annulla raggruppamento' + #13#10 +
      'DeleteCmd.Caption=Elimina' + #13#10 +
      'DeletePageCmd.Caption=Elimina pagina' + #13#10 +
      'SelectAllCmd.Caption=Seleziona tutto' + #13#10 +
      'EditCmd.Caption=Modifica...' + #13#10 +
      'BringToFrontCmd.Caption=Porta in primo piano' + #13#10 +
      'SendToBackCmd.Caption=Metti in secondo piano' + #13#10 +
      'NewItemCmd.Caption=Nuovo...' + #13#10 +
      'NewReportCmd.Caption=Nuovo Report' + #13#10 +
      'NewPageCmd.Caption=Nuova pagina' + #13#10 +
      'NewDialogCmd.Caption=Nuovo Dialogo' + #13#10 +
      'OpenCmd.Caption=Apri...' + #13#10 +
      'SaveCmd.Caption=Salva' + #13#10 +
      'SaveAsCmd.Caption=Salva come...' + #13#10 +
      'VariablesCmd.Caption=Variabili...' + #13#10 +
      'PageSettingsCmd.Caption=Impostazioni della pagina...' + #13#10 +
      'PreviewCmd.Caption=Anteprima' + #13#10 +
      'ExitCmd.Caption=Esci' + #13#10 +
      'ReportTitleMI.Caption=Titolo del Report' + #13#10 +
      'ReportSummaryMI.Caption=Sommario del Report' + #13#10 +
      'PageHeaderMI.Caption=Intestazione della pagina' + #13#10 +
      'PageFooterMI.Caption=Pié pagina' + #13#10 +
      'HeaderMI.Caption=Intestazione' + #13#10 +
      'FooterMI.Caption=Piede' + #13#10 +
      'MasterDataMI.Caption=Database principale' + #13#10 +
      'DetailDataMI.Caption=Database dettaglio' + #13#10 +
      'SubdetailDataMI.Caption=Sub-dettaglio dei dati' + #13#10 +
      'Data4levelMI.Caption=Dati 4° livello' + #13#10 +
      'Data5levelMI.Caption=Dati 5° livello' + #13#10 +
      'Data6levelMI.Caption=Dati 6° livello' + #13#10 +
      'GroupHeaderMI.Caption=Intestazione del gruppo' + #13#10 +
      'GroupFooterMI.Caption=Piede del gruppo' + #13#10 +
      'ChildMI.Caption=Figlio' + #13#10 +
      'ColumnHeaderMI.Caption=Intestazione della colonna' + #13#10 +
      'ColumnFooterMI.Caption=Piede della colonna' + #13#10 +
      'OverlayMI.Caption=Sfondo' + #13#10 +
      'VerticalbandsMI.Caption=Banda verticale' + #13#10 +
      'HeaderMI1.Caption=Intestazione' + #13#10 +
      'FooterMI1.Caption=Piede' + #13#10 +
      'MasterDataMI1.Caption=Database principale' + #13#10 +
      'DetailDataMI1.Caption=Database dettaglio' + #13#10 +
      'SubdetailDataMI1.Caption=Sub-dettaglio dei dati' + #13#10 +
      'GroupHeaderMI1.Caption=Intestazione del gruppo' + #13#10 +
      'GroupFooterMI1.Caption=Piede del gruppo' + #13#10 +
      'ChildMI1.Caption=Figlio' + #13#10 +
      'R0MI.Caption=0°' + #13#10 +
      'R45MI.Caption=45°' + #13#10 +
      'R90MI.Caption=90°' + #13#10 +
      'R180MI.Caption=180°' + #13#10 +
      'R270MI.Caption=270°' + #13#10 +
      'FontB.Hint=Impostazioni del carattere' + #13#10 +
      'BoldMI.Caption=Grassetto' + #13#10 +
      'ItalicMI.Caption=Corsivo' + #13#10 +
      'UnderlineMI.Caption=Sottolineato' + #13#10 +
      'SuperScriptMI.Caption=Apice' + #13#10 +
      'SubScriptMI.Caption=Pedice' + #13#10 +
      'CondensedMI.Caption=Condensato' + #13#10 +
      'WideMI.Caption=Largo' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'OpenDialog.Filter=Report (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=File Pascal(*.pas)|*.pas|file C++ (*.cpp)|*.cpp|File JavaScript (*.js)|*.js|File Basic (*.vb)|*.vb|Tutti i file|*.*' + #13#10 +
      'SaveScriptDialog.Filter=File Pascal (*.pas)|*.pas|file C++ (*.cpp)|*.cpp|File JavaScript (*.js)|*.js|File Basic (*.vb)|*.vb|Tutti i file|*.*' + #13#10 +
      '');
    Add('dsCm', 'Centimetri');
    Add('dsInch', 'Pollici');
    Add('dsPix', 'Pixel');
    Add('dsChars', 'Caratteri');
    Add('dsCode', 'Codice');
    Add('dsPage', 'Pagina');
    Add('dsRepFilter', 'Report (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'Report compresso (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', 'Salvo le modifiche nell''anteprima ?');
    Add('dsSaveChangesTo', 'Salvo le modifiche in ');
    Add('dsCantLoad', 'Impossibile caricare il file');
    Add('dsStyleFile', 'Stile');
    Add('dsCantFindProc', 'Impossibile trovare la procedura principale');
    Add('dsClearScript', 'Questo cancellerà tutto il codice. Sei sicuro di continuare ?');
    Add('dsNoStyle', 'Nessun stile');
    Add('dsStyleSample', 'Stile di esempio');
    Add('dsTextNotFound', 'Testo ''%s'' non trovato');
    Add('dsReplace', 'Sostituisci l''occorrenza di ''%s''?');

    Add('TfrxAboutForm',
      'Caption=Informazioni su FastReport' + #13#10 +
      'Label4.Caption=Visita la nostra pagina web:' + #13#10 +
      'Label6.Caption=Vendite:' + #13#10 +
      'Label8.Caption=Assistenza:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Impostazioni della pagina' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      'TabSheet1.Caption=Carta' + #13#10 +
      'Label1.Caption=Larghezza' + #13#10 +
      'Label2.Caption=Altezza' + #13#10 +
      'Label11.Caption=Dimensione   ' + #13#10 +
      'Label12.Caption=Orientamento   ' + #13#10 +
      'Label3.Caption=Sinistra' + #13#10 +
      'Label4.Caption=Alto' + #13#10 +
      'Label5.Caption=Destra' + #13#10 +
      'Label6.Caption=Basso' + #13#10 +
      'Label13.Caption=Margini   ' + #13#10 +
      'Label14.Caption=Origine carta   ' + #13#10 +
      'Label9.Caption=Prima pagina' + #13#10 +
      'Label10.Caption=Altre pagine' + #13#10 +
      'PortraitRB.Caption=Verticale' + #13#10 +
      'LandscapeRB.Caption=Orizzontale' + #13#10 +
      'TabSheet3.Caption=Altre opzioni' + #13#10 +
      'Label7.Caption=Colonne   ' + #13#10 +
      'Label8.Caption=Numeri' + #13#10 +
      'Label15.Caption=Larghezza' + #13#10 +
      'Label16.Caption=Posizione' + #13#10 +
      'Label17.Caption=Altro   ' + #13#10 +
      'Label18.Caption=Doppia' + #13#10 +
      'PrintOnPrevCB.Caption=Stampa nella pagina precedente' + #13#10 +
      'MirrorMarginsCB.Caption=Margini speculari' + #13#10 +
      'LargeHeightCB.Caption=Incrementa l''altezza durante la creazione' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Seleziona i dati del Report' + #13#10 + 
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Modifica le variabili' + #13#10 +
      'NewCategoryB.Caption=Categoria' + #13#10 +
      'NewVarB.Caption=Variabili' + #13#10 +
      'EditB.Caption=Modifica' + #13#10 +
      'DeleteB.Caption=Elimina' + #13#10 +
      'EditListB.Caption=Elenca' + #13#10 +
      'LoadB.Caption=Carica' + #13#10 +
      'SaveB.Caption=Salva' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'ExprPanel.Caption= Espressione:' + #13#10 +
      'OpenDialog1.Filter=Dizionario (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Dizionario (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(nessuna variabile definita)');
    Add('vaVar', 'Variabili');
    Add('vaDupName', 'Duplica il nome');

    Add('TfrxOptionsEditor',
      'Caption=Opzioni designer' + #13#10 +
      'Label1.Caption=Griglia   ' + #13#10 +
      'Label2.Caption=Tipo' + #13#10 +
      'Label3.Caption=Dimensione' + #13#10 +
      'Label4.Caption=Finestra di dialogo:' + #13#10 + 
      'Label5.Caption=Altro   ' + #13#10 +
      'Label6.Caption=Caratteri   ' + #13#10 +
      'Label7.Caption=Finestra codice' + #13#10 +
      'Label8.Caption=Finestra del testo' + #13#10 + 
      'Label9.Caption=Dimensione' + #13#10 +
      'Label10.Caption=Dimensione' + #13#10 +
      'Label11.Caption=Colori   ' + #13#10 +
      'Label12.Caption=Gap tra le Bande:' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=po' + #13#10 +
      'Label15.Caption=pt' + #13#10 + 
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      'CMRB.Caption=Centimetri:' + #13#10 +
      'InchesRB.Caption=Pollici:' + #13#10 +
      'PixelsRB.Caption=Pixel:' + #13#10 +
      'ShowGridCB.Caption=Mostra griglia' + #13#10 +
      'AlignGridCB.Caption=Allinea alla griglia' + #13#10 +
      'EditAfterInsCB.Caption=Mostra Editor dopo l''inserimento' + #13#10 + 
      'ObjectFontCB.Caption=Usa il carattere dell''oggetto' + #13#10 + 
      'WorkspaceB.Caption=Area di lavoro' + #13#10 + 
      'ToolB.Caption=Finestra degli strumenti' + #13#10 + 
      'LCDCB.Caption=Colore della griglia LCD' + #13#10 +
      'FreeBandsCB.Caption=Disposizione libera delle Bande' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Ripristina i valori di default' + #13#10 +
      'BandsCaptionsCB.Caption=Mostra i titoli delle Bande' + #13#10 +  
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=Seleziona origine dati' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      '');
    Add('dbNotAssigned', '[non assegnato]');
    Add('dbSingleLine', 'Linea singola'); 

    Add('TfrxGroupEditorForm',
      'Caption=Gruppo' + #13#10 +
      'BreakOnL.Caption=Suddividi per' + #13#10 +
      'OptionsL.Caption=Opzioni   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      'DataFieldRB.Caption=Campo dati' + #13#10 +
      'ExpressionRB.Caption=Espressione' + #13#10 +
      'KeepGroupTogetherCB.Caption=Tieni assieme i gruppi' + #13#10 + 
      'StartNewPageCB.Caption=Inizia in una nuova pagina' + #13#10 +
      'OutlineCB.Caption=Mostra nell''indice' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=Variabili di sistema' + #13#10 +
      'DataBandL.Caption=Banda dei dati' + #13#10 +
      'DataSetL.Caption=Gruppo di archivi' + #13#10 +
      'DataFieldL.Caption=Campo' + #13#10 +
      'FunctionL.Caption=Funzione' + #13#10 +
      'ExpressionL.Caption=Espressione' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      'AggregateRB.Caption=Valore aggregato' + #13#10 +
      'SysVariableRB.Caption=Variabile del sistema' + #13#10 +
      'CountInvisibleCB.Caption=Conta le bande invisibili' + #13#10 +
      'TextRB.Caption=Testo' + #13#10 +
      'RunningTotalCB.Caption=Esegui completamente' + #13#10 +
      '');
    Add('agAggregate', 'Inserisci aggregato');
    Add('vt1', '[DATA]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGE#]');
    Add('vt5', '[PAGE#] of [TOTALPAGE#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=Oggetto OLE' + #13#10 +
      'InsertB.Caption=Inserisci...' + #13#10 +
      'EditB.Caption=Modifica...' + #13#10 +
      'CloseB.Caption=Chiudi' + #13#10 +
      '');
    Add('olStretched', 'Allungato');

    Add('TfrxBarcodeEditorForm',
      'Caption=Editor codici a barre' + #13#10 +
      'CodeLbl.Caption=Codice' + #13#10 +
      'TypeLbl.Caption=Tipo di codice a barre' + #13#10 +
      'ZoomLbl.Caption=Zoom:' + #13#10 +
      'OptionsLbl.Caption=Opzioni   ' + #13#10 +
      'RotationLbl.Caption=Rotazione   ' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CalcCheckSumCB.Caption=Calcola Checksum ' + #13#10 +
      'ViewTextCB.Caption=Testo' + #13#10 +
      'Rotation0RB.Caption=0°' + #13#10 +
      'Rotation90RB.Caption=90°' + #13#10 +
      'Rotation180RB.Caption=180°' + #13#10 +
      'Rotation270RB.Caption=270°' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Calcola CheckSum');
    Add('bcShowText', 'Mostra testo');

    Add('TfrxAliasesEditorForm',
      'Caption=Modifica Aliases' + #13#10 +
      'HintL.Caption=Premi INVIO per modificare' + #13#10 +
      'DSAliasL.Caption=Gruppo di dati degli alias' + #13#10 +
      'FieldAliasesL.Caption=Alias dei campi' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      'ResetB.Caption=Cancella' + #13#10 +
      'UpdateB.Caption=Update' + #13#10 +
      '');
    Add('alUserName', 'Nome utente');
    Add('alOriginal', 'Nome originali');

    Add('TfrxParamsEditorForm',
      'Caption=Editor parametri' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      '');
    Add('qpName', 'Nome');
    Add('qpDataType', 'Tipo di dato');
    Add('qpValue', 'Valore');

    Add('TfrxMDEditorForm',
      'Caption=Master-Dettaglio collegamento' + #13#10 +
      'Label1.Caption=Archivio dettaglio' + #13#10 +
      'Label2.Caption=Archivio master' + #13#10 + 
      'Label3.Caption=Campi collegati' + #13#10 +
      'AddB.Caption=Aggiungi' + #13#10 +
      'ClearB.Caption=Cancella' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=Editor di testo' + #13#10 +
      'ExprB.Hint=Inserisci espressione' + #13#10 +
      'AggregateB.Hint=Inserisci aggregato' + #13#10 +  
      'LocalFormatB.Hint=Inserisci formattato' + #13#10 + 
      'WordWrapB.Hint=A capo automatico' + #13#10 +
      'CancelB.Hint=Annulla' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=Immagine' + #13#10 +
      'LoadB.Hint=Carica' + #13#10 +
      'CopyB.Hint=Copia' + #13#10 +
      'PasteB.Hint=Incolla' + #13#10 +
      'ClearB.Hint=Cancella' + #13#10 +
      'CancelB.Hint=Annulla' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('piEmpty', 'Vuoto');

    Add('TfrxChartEditorForm',
      'Caption=Editor Grafico' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=Aggiungi serie' + #13#10 +
      'DeleteB.Hint=Cancella serie' + #13#10 +
      'DBSourceRB.Caption=Dati da DB' + #13#10 +
      'BandSourceRB.Caption=Sorgente Banda' + #13#10 + 
      'FixedDataRB.Caption=Dati fissi' + #13#10 +
      'DatasetLbl.Caption=Archivio' + #13#10 +
      'BandLbl.Caption=Banda dati' + #13#10 +
      'X1Lbl.Caption=Valori X' + #13#10 +
      'Y1Lbl.Caption=Valori Y' + #13#10 +
      'X2Lbl.Caption=Valori X' + #13#10 +
      'Y2Lbl.Caption=Valori Y' + #13#10 +
      'X3Lbl.Caption=Valori X (per esempio, a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Valori Y (per esempio, 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Altre opzioni   ' + #13#10 +
      'ShowTopLbl.Caption=Max N Valori' + #13#10 +
      'CaptionLbl.Caption=Etichetta Max N Valori' + #13#10 +
      'SortLbl.Caption=Ordine' + #13#10 + 
      'LineMI.Caption=Linea' + #13#10 +
      'AreaMI.Caption=Area' + #13#10 +
      'PointMI.Caption=Punto' + #13#10 +
      'BarMI.Caption=Barre' + #13#10 +
      'HorizBarMI.Caption=Barre orizzontali' + #13#10 +
      'PieMI.Caption=Torta' + #13#10 +
      'GanttMI.Caption=Grafico Gantt' + #13#10 +
      'FastLineMI.Caption=Linea veloce' + #13#10 +
      '');
    Add('ch3D', 'Vista 3D');
    Add('chAxis', 'Mostra assi');
    Add('chsoNone', 'Nessuno');
    Add('chsoAscending', 'Ascendente');
    Add('chsoDescending', 'Discendente');

    Add('TfrxRichEditorForm',
      'Caption= Editor RTF' + #13#10 +
      'OpenB.Hint=Apri file' + #13#10 +
      'SaveB.Hint=Salva file' + #13#10 +
      'UndoB.Hint=Annulla' + #13#10 +
      'TTB.Hint=Carattere' + #13#10 +
      'ExprB.Hint=Inserisci espressione' + #13#10 +
      'CancelB.Hint=Annulla' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      'BoldB.Hint=Grassetto' + #13#10 +
      'ItalicB.Hint=Corsivo' + #13#10 +
      'UnderlineB.Hint=Sottolineato' + #13#10 +
      'LeftAlignB.Hint=Allinea a sinistra' + #13#10 +
      'CenterAlignB.Hint=Allinea al centro' + #13#10 +
      'RightAlignB.Hint=Allinea a destra' + #13#10 +
      'BlockAlignB.Hint=Giustificato' + #13#10 +
      'BulletsB.Hint=Elenco puntato' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Editor Cross-tab' + #13#10 +
      'DatasetL.Caption=Sorgente dati   ' + #13#10 +
      'DimensionsL.Caption=Dimensioni   ' + #13#10 +
      'RowsL.Caption=Righe' + #13#10 +
      'ColumnsL.Caption=Colonne' + #13#10 +
      'CellsL.Caption=Celle' + #13#10 +
      'StructureL.Caption=Struttura della Cross-tab   ' + #13#10 +
      'RowHeaderCB.Caption=Intestazione della riga' + #13#10 +
      'ColumnHeaderCB.Caption=Intestazione della colonna' + #13#10 +
      'RowTotalCB.Caption=Importo totale della riga' + #13#10 +
      'ColumnTotalCB.Caption=Importo totale della colonna' + #13#10 +
      'SwapB.Hint=Scambia righe/colonne' + #13#10 +
      'StyleCB.Hint=Stile della Cross-tab' + #13#10 +
      'FontB.Hint=Impostazioni del carattere' + #13#10 +
      'AlignLeftB.Hint=Allinea a sinistra' + #13#10 +
      'AlignCenterB.Hint=Allinea al centro' + #13#10 +
      'AlignRightB.Hint=Allinea a destra' + #13#10 +
      'RotationB.Hint=Rotazione del testo' + #13#10 +
      'HighlightB.Hint=Evidenziato' + #13#10 +
      'FormatB.Hint=Formato' + #13#10 +
      'FrameB.Hint=Impostazioni della cornice' + #13#10 +
      'FillColorB.Hint=Colore di riempimento' + #13#10 +
      'Func1MI.Caption=Nessuno' + #13#10 +
      'Func2MI.Caption=Somma' + #13#10 +
      'Func3MI.Caption=Minimo' + #13#10 +
      'Func4MI.Caption=Massimo' + #13#10 +
      'Func5MI.Caption=Media' + #13#10 +
      'Func6MI.Caption=Conta' + #13#10 +
      'Sort1MI.Caption=Ascendente (A-Z)' + #13#10 +
      'Sort2MI.Caption=Discendente (Z-A)' + #13#10 +
      'Sort3MI.Caption=Non ordinare' + #13#10 +
      'BoldMI.Caption=Grassetto' + #13#10 +
      'ItalicMI.Caption=Corsivo' + #13#10 +
      'UnderlineMI.Caption=Sottolineato' + #13#10 +
      'SuperScriptMI.Caption=Apice' + #13#10 +
      'SubScriptMI.Caption=Pedice' + #13#10 +
      'CondensedMI.Caption=Condensato' + #13#10 +
      'WideMI.Caption=Largo' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=Annulla' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('crSubtotal', 'Subtotale');
    Add('crNone', 'Nessuno');
    Add('crSum', 'Somma');
    Add('crMin', 'Minimo');
    Add('crMax', 'Massimo');
    Add('crAvg', 'Media');
    Add('crCount', 'Conta');
    Add('crAsc', 'A-Z');
    Add('crDesc', 'Z-A');
    Add('crRepHdrs', 'Ristampa intestazione');
    Add('crBorder', 'Cornice');
    Add('crDown', 'Down Then Across');

    Add('TfrxExprEditorForm',
      'Caption=Editor espressione' + #13#10 +
      'ExprL.Caption=Espressione:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=Formattazione' + #13#10 + 
      'CategoryL.Caption=Categoria' + #13#10 +
      'FormatL.Caption=Formato' + #13#10 +
      'FormatStrL.Caption=Formato:' + #13#10 +
      'SeparatorL.Caption=Separatore decimale:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      '');
    Add('fkText', 'Testo (non formattato)');
    Add('fkNumber', 'Numero');
    Add('fkDateTime', 'Data/Ora');
    Add('fkBoolean', 'Booleano');
    Add('fkNumber1', '1234.5;%g');
    Add('fkNumber2', '1234.50;%2.2f');
    Add('fkNumber3', '1,234.50;%2.2n');
    Add('fkNumber4', '$1,234.50;%2.2m');
    Add('fkDateTime1', '28.11.2002;dd.mm.yyyy');
    Add('fkDateTime2', '28 nov 2002;dd mmm yyyy');
    Add('fkDateTime3', '28 Novembre, 2002;dd mmmm, yyyy');
    Add('fkDateTime4', '02:14;hh:mm');
    Add('fkDateTime5', '02:14am;hh:mm am/pm');
    Add('fkDateTime6', '02:14:00;hh:mm:ss');
    Add('fkDateTime7', '02:14am, 28 Novembre, 2002;hh:mm am/pm, dd mmmm, yyyy');
    Add('fkBoolean1', '0,1;0,1');
    Add('fkBoolean2', 'No,Sì;No,Sì');
    Add('fkBoolean3', '_,x;_,x');
    Add('fkBoolean4', 'Falso,Vero;Falso,Vero');

    Add('TfrxHighlightEditorForm',
      'Caption=Evidenziato' + #13#10 +
      'FontColorB.Caption=Colore...' + #13#10 +
      'BackColorB.Caption=Colore...' + #13#10 +
      'ConditionL.Caption=Condizione   ' + #13#10 +
      'FontL.Caption=Carattere   ' + #13#10 +
      'BackgroundL.Caption=Sfondo   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      'BoldCB.Caption=Grassetto' + #13#10 +
      'ItalicCB.Caption=Corsivo' + #13#10 +
      'UnderlineCB.Caption=Sottolineato' + #13#10 +
      'TransparentRB.Caption=Trasparente' + #13#10 +
      'OtherRB.Caption=Altro' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Impostazioni del report' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      'GeneralTS.Caption=Generale' + #13#10 +
      'ReportSettingsL.Caption=Impostazioni stampante   ' + #13#10 +
      'CopiesL.Caption=Copie' + #13#10 +
      'GeneralL.Caption=Generale   ' + #13#10 +
      'PasswordL.Caption=Password' + #13#10 +
      'CollateCB.Caption=Fascicola pagine' + #13#10 +
      'DoublePassCB.Caption=Doppio passaggio' + #13#10 + 
      'PrintIfEmptyCB.Caption=Stampa se vuoto' + #13#10 + 
      'DescriptionTS.Caption=Descrizione' + #13#10 +
      'NameL.Caption=Nome' + #13#10 +
      'Description1L.Caption=Descrizione' + #13#10 +
      'PictureL.Caption=Immagine' + #13#10 +
      'AuthorL.Caption=Autore' + #13#10 +
      'MajorL.Caption=Maggiore' + #13#10 +
      'MinorL.Caption=Minore' + #13#10 +
      'ReleaseL.Caption=Versione' + #13#10 +
      'BuildL.Caption=Configurazione' + #13#10 +
      'CreatedL.Caption=Creato' + #13#10 +
      'ModifiedL.Caption=Modificato' + #13#10 +
      'DescriptionL.Caption=Descrizione   ' + #13#10 +
      'VersionL.Caption=Versione   ' + #13#10 +
      'PictureB.Caption=Collegamento...' + #13#10 +
      '');
    Add('rePrnOnPort', 'on');

    Add('TfrxStringsEditorForm',
      'Caption=Linee' + #13#10 +
      'CancelB.Hint=Annulla' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=Annulla' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=Password' + #13#10 +
      'PasswordL.Caption=Inserisci la password:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=Editor stile' + #13#10 +
      'ColorB.Caption=Colore...' + #13#10 +
      'FontB.Caption=Carattere...' + #13#10 +
      'FrameB.Caption=Cornice...' + #13#10 +
      'AddB.Hint=Aggiungi' + #13#10 +
      'DeleteB.Hint=Cancella' + #13#10 +
      'EditB.Hint=Modifica' + #13#10 +
      'LoadB.Hint=Carica' + #13#10 +
      'SaveB.Hint=Salva' + #13#10 +
      'CancelB.Hint=Annulla' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=Editor cornice' + #13#10 +
      'FrameL.Caption=Cornice' + #13#10 +
      'LineL.Caption=Linea della cornice' + #13#10 +
      'ShadowL.Caption=Ombra' + #13#10 +
      'FrameTopB.Hint=Linea superiore' + #13#10 +
      'FrameBottomB.Hint=Linea inferiore' + #13#10 +
      'FrameLeftB.Hint=Linea sinistra' + #13#10 +
      'FrameRightB.Hint=Linea destra' + #13#10 +
      'FrameAllB.Hint=Tutte le linee della cornice' + #13#10 +
      'FrameNoB.Hint=Nessuna cornice' + #13#10 +
      'FrameColorB.Hint=Colore cornice' + #13#10 +
      'FrameStyleB.Hint=Stile cornice' + #13#10 +
      'FrameWidthCB.Hint=Larghezza cornice' + #13#10 +
      'ShadowB.Hint=Ombra' + #13#10 +
      'ShadowColorB.Hint=Colore ombra' + #13#10 +
      'ShadowWidthCB.Hint=Larghezza ombra' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=Nuovo report da modello' + #13#10 +
      'ItemsTab.Caption=Modello' + #13#10 +
      'TemplatesTab.Caption=Templates' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Ordine di Tabulazione' + #13#10 +
      'Label1.Caption=Controlla oggetti nell''ordine di tabulazione:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      'UpB.Caption=Sposta sù' + #13#10 +
      'DownB.Caption=Sposta giù' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Valuta' + #13#10 +
      'Label1.Caption=Espressione' + #13#10 +
      'Label2.Caption=Risultato' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Autocomposizione Report' + #13#10 +
      'DataTab.Caption=Dati' + #13#10 +
      'GroupsTab.Caption=Gruppi' + #13#10 +
      'LayoutTab.Caption=Disposizione' + #13#10 +
      'StyleTab.Caption=Stile' + #13#10 +
      'Step1L.Caption=Punto 1. Selezionare il gruppo di dati ed i campi da mostrare.' + #13#10 +
      'Step2L.Caption=Punto 2. Crea i gruppi (opzionale).' + #13#10 +
      'Step3L.Caption=Punto 3. Definisci l''orientamento della pagina e la disposizione dei dati.' + #13#10 +
      'Step4L.Caption=Punto 4. Scegli lo stile del report.' + #13#10 +
      'AddFieldB.Caption=Aggiungi >' + #13#10 +
      'AddAllFieldsB.Caption=Aggiungi tutti >>' + #13#10 +
      'RemoveFieldB.Caption=< Rimuovi' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Rimuovi tutti' + #13#10 +
      'AddGroupB.Caption=Aggiungi >' + #13#10 +
      'RemoveGroupB.Caption=< Rimuovi' + #13#10 +
      'SelectedFieldsL.Caption=Campi selezionati:' + #13#10 +
      'AvailableFieldsL.Caption=Campi disponibili:' + #13#10 +
      'GroupsL.Caption=Gruppi:' + #13#10 +
      'OrientationL.Caption=Orientamento   ' + #13#10 +
      'LayoutL.Caption=Disposizione   ' + #13#10 +
      'PortraitRB.Caption=Verticale' + #13#10 +
      'LandscapeRB.Caption=Orizzontale' + #13#10 +
      'TabularRB.Caption=Tabulare' + #13#10 +
      'ColumnarRB.Caption=Verticale' + #13#10 +
      'FitWidthCB.Caption=Predisponi i campi in base alla larghezza della pagina' + #13#10 +
      'CancelB.Caption=Annulla' + #13#10 +
      'BackB.Caption=<< Indietro' + #13#10 +
      'NextB.Caption=Successivo >>' + #13#10 +
      'FinishB.Caption=Fine' + #13#10 +
      '');
    Add('wzStd', 'Autocomposizione standard del Report');
    Add('wzDMP', 'Autocomposizione report per stampanti ad aghi');
    Add('wzStdEmpty', 'Report standard');
    Add('wzDMPEmpty', 'Report per stampanti ad aghi');


    Add('ftAllFiles', 'Tutti i file');
    Add('ftPictures', 'Immagini');
    Add('ftDB', 'Database');
    Add('ftRichFile', 'File RichText');
    Add('ftTextFile', 'File di testo');

    Add('prNotAssigned', '(Non assegnato)');
    Add('prInvProp', 'Valore non valido');
    Add('prDupl', 'Nome duplicato');
    Add('prPict', '(Immagine)');

    Add('mvExpr', 'Permetti espressioni');
    Add('mvStretch', 'Allunga');
    Add('mvStretchToMax', 'Allunga fino alla massima altezza');
    Add('mvShift', 'Sposta');
    Add('mvShiftOver', 'Sposta quando coincidono');
    Add('mvVisible', 'Visibile');
    Add('mvPrintable', 'Stampabile');
    Add('mvFont', 'Carattere...');
    Add('mvFormat', 'Formattazione...');
    Add('mvClear', 'Cancella contenuti');
    Add('mvAutoWidth', 'Larghezza automatica');
    Add('mvWWrap', 'A capo automatico');
    Add('mvSuppress', 'Sopprimi i valori ripetuti');
    Add('mvHideZ', 'Nascondi gli zeri');
    Add('mvHTML', 'Permetti Tag HTML');
    Add('lvDiagonal', 'Diagonale');
    Add('pvAutoSize', 'Autodimensiona');
    Add('pvCenter', 'Centra');
    Add('pvAspect', 'Mantieni rapporto');
    Add('bvSplit', 'Permetti divisione'); 
    Add('bvKeepChild', 'Tieni Figlio insieme');
    Add('bvPrintChild', 'Stampa Figlio se invisibile');
    Add('bvStartPage', 'Inizia in una nuova pagina');
    Add('bvPrintIfEmpty', 'Stampa il dettaglio se è vuoto');
    Add('bvKeepDetail', 'Tieni dettaglio insieme');
    Add('bvKeepFooter', 'Tiene piede insieme');
    Add('bvReprint', 'Ristampa su una nuova pagina');
    Add('bvOnFirst', 'Stampa la prima pagina');
    Add('bvOnLast', 'stampa l''ultima pagina');
    Add('bvKeepGroup', 'Tieni insieme');
    Add('bvFooterAfterEach', 'Piede dopo ogni riga');
    Add('srParent', 'Stampa sul Padre');

    Add('obCatDraw', 'Disegna');
    Add('obCatOther', 'Altri oggetti');
    Add('obCatOtherControls', 'Altri controlli');
    Add('obDiagLine', 'Linea diagonale');
    Add('obRect', 'Rettangolo');
    Add('obRoundRect', 'Rettangolo arrotondato');
    Add('obEllipse', 'Ellisse');
    Add('obTrian', 'Triangolo');
    Add('obDiamond', 'Diamante');
    Add('obLabel', 'Controllo Etichetta');
    Add('obEdit', 'Controllo Edit');
    Add('obMemoC', 'Controllo Memo');
    Add('obButton', 'Controllo Pulsante');
    Add('obChBoxC', 'Controllo Checkbox');
    Add('obRButton', 'Controllo Radiobutton');
    Add('obLBox', 'Controllo ListBox');
    Add('obCBox', 'Controllo Combobox');
    Add('obDateEdit', 'Controllo DateEdit');
    Add('obImageC', 'Controllo Immagine');
    Add('obPanel', 'Controllo Pannello');
    Add('obGrBox', 'Controllo Groupbox');
    Add('obBBtn', 'Controllo BitBtn');
    Add('obSBtn', 'Controllo SpeedButton');
    Add('obMEdit', 'Controllo MaskEdit');
    Add('obChLB', 'Controllo CheckListBox');
    Add('obDBLookup', 'Controllo DBLookupComboBox');
    Add('obBevel', 'Smussatura oggetto');
    Add('obShape', 'Forma oggetto');
    Add('obText', 'Testo');
    Add('obSysText', 'Variabili di sistema');
    Add('obLine', 'Linea');
    Add('obPicture', 'Immagine');
    Add('obBand', 'Banda');
    Add('obDataBand', 'Oggetto Banda dati');
    Add('obSubRep', 'Subreport');
    Add('obDlgPage', 'Finestra di dialogo');
    Add('obRepPage', 'Pagina del report');
    Add('obReport', 'Report');
    Add('obRich', 'RichText');
    Add('obOLE', 'Oggetto OLE');
    Add('obChBox', 'Oggetto CheckBox');
    Add('obChart', 'Oggetto grafico');
    Add('obBarC', 'Oggetto codice a barre');
    Add('obCross', 'Oggetto Cross-tab');
    Add('obDBCross', 'Oggetto DB Cross-tab');
    Add('obGrad', 'Oggetto gradiente');
    Add('obDMPText', 'Testo per stampante ad aghi');
    Add('obDMPLine', 'Linea per stampante ad aghi');
    Add('obBDEDB', 'BDE Database');
    Add('obBDETb', 'Tabella BDE');
    Add('obBDEQ', 'BDE Query');
    Add('obBDEComps', 'Componenti BDE');
    Add('obIBXDB', 'Database IBX');
    Add('obIBXTb', 'Tabella IBX');
    Add('obIBXQ', 'Query IBX');
    Add('obIBXComps', 'Componenti IBX');
    Add('obADODB', 'Database ADO');
    Add('obADOTb', 'Tabella ADO');
    Add('obADOQ', 'Query ADO');
    Add('obADOComps', 'Componenti ADO');
    Add('obDBXDB', 'Database DBX');
    Add('obDBXTb', 'Tabella DBX');
    Add('obDBXQ', 'Query DBX');
    Add('obDBXComps', 'Componenti DBX');

    Add('ctString', 'Stringa');
    Add('ctDate', 'Data e Ora');
    Add('ctConv', 'Conversioni');
    Add('ctFormat', 'Formattazione');
    Add('ctMath', 'Matematico');
    Add('ctOther', 'Altro');

    Add('IntToStr', 'Converti il valore intero in stringa');
    Add('FloatToStr', 'Converti il valore reale in stringa');
    Add('DateToStr', 'Converti la data in stringa');
    Add('TimeToStr', 'Converti l''ora in stringa');
    Add('DateTimeToStr', 'Converti data e ora in stringa');
    Add('VarToStr', 'Converti il Variant in stringa');
    Add('StrToInt', 'Converti una stringa in valore intero');
    Add('StrToFloat', 'Converti una stringa in valore reale');
    Add('StrToDate', 'Converti una stringa in formato data');
    Add('StrToTime', 'Converti una stringa in formato ora');
    Add('StrToDateTime', 'Converti una stringa in formato data/ora');
    Add('Format', 'Restituisci una stringa formattata da un vettore');
    Add('FormatFloat', 'Formatta un valore reale');
    Add('FormatDateTime', 'Formatta un valore data e ora');
    Add('FormatMaskText', 'Restituisci una stringa formattata usando una maschera di input');
    Add('EncodeDate', 'Restituisci data e ora in Anno, Mese, e Giorno');
    Add('DecodeDate', 'Spezza data e ora in valori Anno, Mese, e Giorno');
    Add('EncodeTime', 'Restituisci data e ora in Ore, Min, Sec, e MSec');
    Add('DecodeTime', 'Restituisci data e ora in ore, minuti, secondi, e millisecondi');
    Add('Date', 'Restituisci la data corrente');
    Add('Time', 'Restituisci l''ora corrente');
    Add('Now', 'Restituisci data e ora correnti');
    Add('DayOfWeek', 'Restituisci il giorno della settimana per una data specifica');
    Add('IsLeapYear', 'Indica se un anno specificato è un anno bisestile');
    Add('DaysInMonth', 'Restituisci il numero di giorni in un mese specifico');
    Add('Length', 'Restituisci la lunghezza della stringa');
    Add('Copy', 'Restituisci la substringa della stringa');
    Add('Pos', 'Restituisci la posizione della substringa nella stringa');
    Add('Delete', 'Rimuovi la substringa dalla stringa');
    Add('Insert', 'Inserisci una substringa nella stringa');
    Add('Uppercase', 'Converti tutti i caratteri nella stringa in maiuscolo');
    Add('Lowercase', 'Converti tutti i caratteri nella stringa in minuscolo');
    Add('Trim', 'Elimina tutti gli spazi prima e dopo la stringa');
    Add('NameCase', 'Converti il primo carattere di una parola in maiuscolo');
    Add('CompareText', 'Compara due stringhe');
    Add('Chr', 'Converti un valore intero in char'); 
    Add('Ord', 'Converti un valore char in valore intero');
    Add('SetLength', 'Regola la lunghezza della stringa');
    Add('Round', 'Arrotonda il valore reale al numero intero più vicino');
    Add('Trunc', 'Tronca il valore reale ad un numero intero');
    Add('Int', 'Restituisci la parte intera di un numero reale');
    Add('Frac', 'Restituisci la parte frazionaria di un numero reale');
    Add('Sqrt', 'Restituisci la radice quadrata di un numero specificato');
    Add('Abs', 'Restituisci il valore assoluto');
    Add('Sin', 'Restituisci il seno di un angolo (in radianti)');
    Add('Cos', 'Restituisci il coseno di un angolo (in radianti)');
    Add('ArcTan', 'Restituisci l''arcotangente');
    Add('Tan', 'Restituisci la tangente');
    Add('Exp', 'Restituisci l''esponenziale');
    Add('Ln', 'Restituisci il logaritmo naturale di un''espressione reale');
    Add('Pi', 'Restituisci il pi-greco');
    Add('Inc', 'Incrementa il valore');
    Add('Dec', 'Decrementa il valore');
    Add('RaiseException', 'Solleva un''eccezione');
    Add('ShowMessage', 'Mostra una finestra di messaggio');
    Add('Randomize', 'Avvia il generatore di numeri causuali');
    Add('Random', 'Restituisci un numero casuale');
    Add('ValidInt', 'Restituisci Vero se la stringa specificata contiene un valore intero valido');
    Add('ValidFloat', 'Restituisci Vero se la stringa specificata contiene un valore reale valido');
    Add('ValidDate', 'Restituisci Vero se la stringa specificata contiene una data valida');
    Add('IIF', 'Restituisci Valore Vero se Expr specificata è vera, altrimenti ritorna un Valore Falso');
    Add('Get', 'Solo per uso interno');
    Add('Set', 'Solo per uso interno');
    Add('InputBox', 'Visualizza una finestra di dialogo che permetta all''utente di inserire una stringa');
    Add('InputQuery', 'Visualizza una finestra di dialogo che permetta all''utente di inserire una query');
    Add('MessageDlg', 'Mostra una finestra di messaggio');
    Add('CreateOleObject', 'Crea un oggetto OLE');
    Add('VarArrayCreate', 'Crea un variant array');
    Add('VarType', 'Restituisci il tipo di una variabile');
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