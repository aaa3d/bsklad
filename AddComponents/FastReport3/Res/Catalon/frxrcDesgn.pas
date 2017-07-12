
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
      'Caption=Inspector d''Objectes' + #13#10 +
      '');
    Add('oiProp', 'Propietats');
    Add('oiEvent', 'Successos');

    Add('TfrxDataTreeForm',
      'Caption=Arbre de Dades' + #13#10 +
      'DataTS.Caption=Dada' + #13#10 +
      'VariablesTS.Caption=Variables' + #13#10 +
      'FunctionsTS.Caption=Funcions' + #13#10 +
      'InsFieldCB.Caption=Crear Camp' + #13#10 +
      'InsCaptionCB.Caption=Crear títol' + #13#10 +
      '');
    Add('dtNoData', 'No hi ha cap dada');
    Add('dtData', 'Dada');
    Add('dtSysVar', 'Variables del Sistema');
    Add('dtVar', 'Variables');
    Add('dtFunc', 'Funcions');

    Add('TfrxReportTreeForm',
      'Caption=Informa' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Obrir Fitxer Script' + #13#10 +
      'SaveScriptB.Hint=Guardar Script a Fitxer' + #13#10 +
      'RunScriptB.Hint=Executar Script' + #13#10 +
      'StepScriptB.Hint=Seguir Script' + #13#10 +
      'StopScriptB.Hint=Acabar Script' + #13#10 +
      'EvaluateB.Hint=Avaluar' + #13#10 +
      'LangL.Caption=Llenguatge:' + #13#10 +
      'AlignTB.Caption=Alinear' + #13#10 +
      'AlignLeftsB.Hint=Alineat Esquerra' + #13#10 +
      'AlignHorzCentersB.Hint=Alineat Mig' + #13#10 +
      'AlignRightsB.Hint=Alineat Dreta' + #13#10 +
      'AlignTopsB.Hint=Alineat Superior' + #13#10 +
      'AlignVertCentersB.Hint=Alineat Centre' + #13#10 +
      'AlignBottomsB.Hint=Alineat Inferior' + #13#10 +
      'SpaceHorzB.Hint=Espai Horitzontal' + #13#10 +
      'SpaceVertB.Hint=Espai Vertical' + #13#10 +
      'CenterHorzB.Hint=Centrar Horitzontal en la Banda' + #13#10 +
      'CenterVertB.Hint=Centrar Vertical en la Banda' + #13#10 +
      'SameWidthB.Hint=Igual Amplada' + #13#10 +
      'SameHeightB.Hint=Igual Alçada' + #13#10 +
      'TextTB.Caption=Text' + #13#10 +
      'StyleCB.Hint=Estil' + #13#10 +
      'FontNameCB.Hint=Nom Lletra' + #13#10 +
      'FontSizeCB.Hint=Mida Lletra' + #13#10 +
      'BoldB.Hint=Negreta' + #13#10 +
      'ItalicB.Hint=Cursiva' + #13#10 +
      'UnderlineB.Hint=Subratllat' + #13#10 +
      'FontColorB.Hint=Color Lletra' + #13#10 +
      'HighlightB.Hint=Remarcar' + #13#10 +
      'RotateB.Hint=Rotació Text' + #13#10 +
      'TextAlignLeftB.Hint=Alineat Esquerra' + #13#10 +
      'TextAlignCenterB.Hint=Alineat Centre' + #13#10 +
      'TextAlignRightB.Hint=Alineat Dreta' + #13#10 +
      'TextAlignBlockB.Hint=Justificar' + #13#10 +
      'TextAlignTopB.Hint=Alineat Superior' + #13#10 +
      'TextAlignMiddleB.Hint=Alineat Mig' + #13#10 +
      'TextAlignBottomB.Hint=Alineat Inferior' + #13#10 +
      'FrameTB.Caption=Marc' + #13#10 +
      'FrameTopB.Hint=Línia Superior' + #13#10 +
      'FrameBottomB.Hint=Línia Inferior' + #13#10 +
      'FrameLeftB.Hint=Línia Esquerra' + #13#10 +
      'FrameRightB.Hint=Línia Dreta' + #13#10 +
      'FrameAllB.Hint=Línies a tot el Marc' + #13#10 +
      'FrameNoB.Hint=Sense Marc' + #13#10 +
      'ShadowB.Hint=Ombrejat' + #13#10 +
      'FillColorB.Hint=Color de Fons' + #13#10 +
      'FrameColorB.Hint=Color Marc' + #13#10 +
      'FrameStyleB.Hint=Estil Marc' + #13#10 +
      'FrameWidthCB.Hint=Amplada Marc' + #13#10 +
      'StandardTB.Caption=Tipus' + #13#10 +
      'NewB.Hint=Nou Informe' + #13#10 +
      'OpenB.Hint=Obrir Informe' + #13#10 +
      'SaveB.Hint=Gravar Informe' + #13#10 +
      'PreviewB.Hint=Vista prèvia' + #13#10 +
      'NewPageB.Hint=Afegir pàgina' + #13#10 +
      'NewDialogB.Hint=Afegir formulari de diàleg' + #13#10 +
      'DeletePageB.Hint=Esborrar Pàgina' + #13#10 +
      'PageSettingsB.Hint=Opcions de Pàgina' + #13#10 +
      'VariablesB.Hint=Variables' + #13#10 +
      'CutB.Hint=Tallar' + #13#10 +
      'CopyB.Hint=Copiar' + #13#10 +
      'PasteB.Hint=Enganxar' + #13#10 +
      'SampleFormatB.Hint=Copiar Format' + #13#10 +
      'UndoB.Hint=Desfer última acció' + #13#10 +
      'RedoB.Hint=Refer acció cancel·lada' + #13#10 +
      'ShowGridB.Hint=Mostrar Reixa' + #13#10 +
      'AlignToGridB.Hint=Alinear a Reixa' + #13#10 +
      'SetToGridB.Hint=Ajustar a Reixa' + #13#10 +
      'ScaleCB.Hint=Zoom' + #13#10 +
      'ExtraToolsTB.Caption=Eines Extra' + #13#10 +
      'ObjectSelectB.Hint=Selecció d''eines' + #13#10 +
      'HandToolB.Hint=Eines de manejament' + #13#10 +
      'ZoomToolB.Hint=Eines de Zoom' + #13#10 +
      'TextToolB.Hint=Eines d''Edició de Text' + #13#10 +
      'FormatToolB.Hint=Eines de Copia de formats' + #13#10 +
      'ObjectBandB.Hint=Afegir una Banda' + #13#10 +
      'FileMenu.Caption=&Arxiu' + #13#10 +
      'EditMenu.Caption=&Editar' + #13#10 +
      'FindMI.Caption=Cercar...' + #13#10 +
      'FindNextMI.Caption=Cercar Següent' + #13#10 +
      'ReplaceMI.Caption=Substituir...' + #13#10 +
      'ReportMenu.Caption=&Informa' + #13#10 +
      'ReportDataMI.Caption=Data...' + #13#10 +
      'ReportSettingsMI.Caption=Opcions...' + #13#10 +
      'ReportStylesMI.Caption=Estils...' + #13#10 +
      'ViewMenu.Caption=&Vista' + #13#10 +
      'ToolbarsMI.Caption=Barra d''Eines' + #13#10 +
      'StandardMI.Caption=Tipus' + #13#10 +
      'TextMI.Caption=Text' + #13#10 +
      'FrameMI.Caption=Marc' + #13#10 +
      'AlignmentMI.Caption=Paleta d''alineació' + #13#10 +
      'ToolsMI.Caption=Eines Extra' + #13#10 +
      'InspectorMI.Caption=Inspector d''Objectes' + #13#10 +
      'DataTreeMI.Caption=Arbre de Dades' + #13#10 +
      'ReportTreeMI.Caption=Arbre d''Informe' + #13#10 +
      'ShowRulersMI.Caption=Comandaments' + #13#10 +
      'ShowGuidesMI.Caption=Guies' + #13#10 +
      'DeleteGuidesMI.Caption=Esborrar Guies' + #13#10 +
      'OptionsMI.Caption=Opcions...' + #13#10 +
      'HelpMenu.Caption=&Ajuda' + #13#10 +
      'HelpContentsMI.Caption=Continguts de l''Ajuda...' + #13#10 +
      'AboutMI.Caption=Referent a FastReport...' + #13#10 +
      'TabOrderMI.Caption=Ordre Llengüetes...' + #13#10 +
      'UndoCmd.Caption=Desfer' + #13#10 +
      'RedoCmd.Caption=Refer' + #13#10 +
      'CutCmd.Caption=Tallar' + #13#10 +
      'CopyCmd.Caption=Copiar' + #13#10 +
      'PasteCmd.Caption=Enganxar' + #13#10 +
      'DeleteCmd.Caption=Esborrar' + #13#10 +
      'DeletePageCmd.Caption=Esborrar Pàgina' + #13#10 +
      'SelectAllCmd.Caption=Seleccionar-ho tot' + #13#10 +
      'EditCmd.Caption=Editar...' + #13#10 +
      'BringToFrontCmd.Caption=Portar al Front' + #13#10 +
      'SendToBackCmd.Caption=Enviar Endarrere' + #13#10 +
      'NewItemCmd.Caption=Nou...' + #13#10 +
      'NewReportCmd.Caption=Nou Informe' + #13#10 +
      'NewPageCmd.Caption=Nova Pàgina' + #13#10 +
      'NewDialogCmd.Caption=Nou formulari de Diàleg' + #13#10 +
      'OpenCmd.Caption=Obrir...' + #13#10 +
      'SaveCmd.Caption=Guardar' + #13#10 +
      'SaveAsCmd.Caption=Guardar Com...' + #13#10 +
      'VariablesCmd.Caption=Variables...' + #13#10 +
      'PageSettingsCmd.Caption=Opcions de Pàgina...' + #13#10 +
      'PreviewCmd.Caption=Vista Prèvia' + #13#10 +
      'ExitCmd.Caption=Sortir' + #13#10 +
      'ReportTitleMI.Caption=Títol de l''informe' + #13#10 +
      'ReportSummaryMI.Caption=Sumari de l''informe' + #13#10 +
      'PageHeaderMI.Caption=Capçalera de pàgina' + #13#10 +
      'PageFooterMI.Caption=Peu de pàgina' + #13#10 +
      'HeaderMI.Caption=Capçalera' + #13#10 +
      'FooterMI.Caption=Peu' + #13#10 +
      'MasterDataMI.Caption=Dades mestres' + #13#10 +
      'DetailDataMI.Caption=Dades de detall' + #13#10 +
      'SubdetailDataMI.Caption=Dades subdetall' + #13#10 +
      'Data4levelMI.Caption=Dades 4rt nivell' + #13#10 +
      'Data5levelMI.Caption=Dades 5è nivell' + #13#10 +
      'Data6levelMI.Caption=Dades 6è nivell' + #13#10 +
      'GroupHeaderMI.Caption=Capçalera de grup' + #13#10 +
      'GroupFooterMI.Caption=Peu de grup' + #13#10 +
      'ChildMI.Caption=Fill' + #13#10 +
      'ColumnHeaderMI.Caption=Capçalera columna' + #13#10 +
      'ColumnFooterMI.Caption=Peu de columna' + #13#10 +
      'OverlayMI.Caption=Sobreposat' + #13#10 +
      'VerticalbandsMI.Caption=Banda Vertical' + #13#10 +
      'HeaderMI1.Caption=Capçalera' + #13#10 +
      'FooterMI1.Caption=Peu' + #13#10 +
      'MasterDataMI1.Caption=Dades mestres' + #13#10 +
      'DetailDataMI1.Caption=Dades de detall' + #13#10 +
      'SubdetailDataMI1.Caption=Dades subdetall' + #13#10 +
      'GroupHeaderMI1.Caption=Capçalera de grup' + #13#10 +
      'GroupFooterMI1.Caption=Peu de grup' + #13#10 +
      'ChildMI1.Caption=Fill' + #13#10 +
      'R0MI.Caption=0°' + #13#10 +
      'R45MI.Caption=45°' + #13#10 +
      'R90MI.Caption=90°' + #13#10 +
      'R180MI.Caption=180°' + #13#10 +
      'R270MI.Caption=270°' + #13#10 +
      'FontB.Hint=Opcions Lletres' + #13#10 +
      'BoldMI.Caption=Negreta' + #13#10 +
      'ItalicMI.Caption=Cursiva' + #13#10 +
      'UnderlineMI.Caption=Subratllat' + #13#10 +
      'SuperScriptMI.Caption=Superíndex' + #13#10 +
      'SubScriptMI.Caption=Subíndex' + #13#10 +
      'CondensedMI.Caption=Condensat' + #13#10 +
      'WideMI.Caption=Mida' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'OpenDialog.Filter=Informe (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=Fitxers Pascal (*.pas)|*.pas|Fitxers C++ (*.cpp)|*.cpp|Fitxers JavaScript (*.js)|*.js|Fitxers Basic (*.vb)|*.vb|Tots els fitxers|*.*' + #13#10 +
      'SaveScriptDialog.Filter=Fitxers Pascal (*.pas)|*.pas|Fitxers C++ (*.cpp)|*.cpp|Fitxers JavaScript (*.js)|*.js|Fitxers Basic (*.vb)|*.vb|Tots els fitxers|*.*' + #13#10 +
      '');

    Add('dsCm', 'Centímetres');
    Add('dsInch', 'Polzades');
    Add('dsPix', 'Píxels');
    Add('dsChars', 'Caràcters');
    Add('dsCode', 'Codi');
    Add('dsPage', 'Pàgina');
    Add('dsRepFilter', 'Informe (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'Informe Comprimit (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', 'Guardar els canvis de la vista prèvia?');
    Add('dsSaveChangesTo', 'Guardar canvis a ');
    Add('dsCantLoad', 'No puc llegir el fitxer');
    Add('dsStyleFile', 'Estil');
    Add('dsCantFindProc', 'No puc trobar el procediment principal');
    Add('dsClearScript', 'Això netejarà tot el codi. Vols continuar?');
    Add('dsNoStyle', 'Sense estil');
    Add('dsStyleSample', 'Exemple d''estil');
    Add('dsTextNotFound', 'Text ''%s'' no trobat');
    Add('dsReplace', 'Canvia aquesta ocurrència de ''%s''?');

    Add('TfrxAboutForm',
      'Caption=Referent a FastReport' + #13#10 +
      'Label4.Caption=Visita la nostra web per més informació:' + #13#10 +
      'Label6.Caption=Vendes:' + #13#10 +
      'Label8.Caption=Suport:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Opcions de pàgina' + #13#10 +
      'OKB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel·lar' + #13#10 +
      'TabSheet1.Caption=Paper' + #13#10 +
      'Label1.Caption=Amplada' + #13#10 +
      'Label2.Caption=Alçada' + #13#10 +
      'Label11.Caption=Mida   ' + #13#10 +
      'Label12.Caption=Orientació   ' + #13#10 +
      'Label3.Caption=Esquerra' + #13#10 +
      'Label4.Caption=Superior' + #13#10 +
      'Label5.Caption=Dreta' + #13#10 +
      'Label6.Caption=Inferior' + #13#10 +
      'Label13.Caption=Marges   ' + #13#10 +
      'Label14.Caption=Origen Paper   ' + #13#10 +
      'Label9.Caption=Primera pàgina' + #13#10 +
      'Label10.Caption=Altres pàgines' + #13#10 +
      'PortraitRB.Caption=Vertical' + #13#10 +
      'LandscapeRB.Caption=Horitzontal' + #13#10 +
      'TabSheet3.Caption=Altres Opcions' + #13#10 +
      'Label7.Caption=Columnes   ' + #13#10 +
      'Label8.Caption=Número' + #13#10 +
      'Label15.Caption=Amplada' + #13#10 +
      'Label16.Caption=Posicions' + #13#10 +
      'Label17.Caption=Altres   ' + #13#10 +
      'Label18.Caption=Duplex' + #13#10 +
      'PrintOnPrevCB.Caption=Imprimir en pàgina anterior' + #13#10 +
      'MirrorMarginsCB.Caption=Marge menor' + #13#10 +
      'LargeHeightCB.Caption=Alçada en el mode de disseny' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Selecció Taules de l''Informe' + #13#10 +
      'OKB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel·lar' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Edició Variables' + #13#10 +
      'NewCategoryB.Caption=Categoria' + #13#10 +
      'NewVarB.Caption=Variable' + #13#10 +
      'EditB.Caption=Editar' + #13#10 +
      'DeleteB.Caption=Esborrar' + #13#10 +
      'EditListB.Caption=Llista' + #13#10 +
      'LoadB.Caption=Carregar' + #13#10 +
      'SaveB.Caption=Guardar' + #13#10 +
      'CancelB.Caption=Cancel·lar' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'ExprPanel.Caption= Expressió:' + #13#10 +
      'OpenDialog1.Filter=Diccionari (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Diccionari (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(no hi ha variables definides)');
    Add('vaVar', 'Variables');
    Add('vaDupName', 'Nom Repetit');

    Add('TfrxOptionsEditor',
      'Caption=Opcions' + #13#10 +
      'Label1.Caption=Reixa   ' + #13#10 +
      'Label2.Caption=Tipus' + #13#10 +
      'Label3.Caption=Mida' + #13#10 +
      'Label4.Caption=Formulari de diàleg:' + #13#10 +
      'Label5.Caption=Altres   ' + #13#10 +
      'Label6.Caption=Lletra   ' + #13#10 +
      'Label7.Caption=Finestra de Codi' + #13#10 +
      'Label8.Caption=Editor de Memo' + #13#10 +
      'Label9.Caption=Mida' + #13#10 +
      'Label10.Caption=Mida' + #13#10 +
      'Label11.Caption=Colors   ' + #13#10 +
      'Label12.Caption=Espai entre bandes:' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=in' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel·lar' + #13#10 +
      'CMRB.Caption=Centímetres:' + #13#10 +
      'InchesRB.Caption=Polzades:' + #13#10 +
      'PixelsRB.Caption=Píxels:' + #13#10 +
      'ShowGridCB.Caption=Mostrar reixa' + #13#10 +
      'AlignGridCB.Caption=Alineat a reixa' + #13#10 +
      'EditAfterInsCB.Caption=Mostrar editor després d''afegir' + #13#10 +
      'ObjectFontCB.Caption=Usa opcions de Lletra' + #13#10 +
      'WorkspaceB.Caption=Espai de treball' + #13#10 +
      'ToolB.Caption=Finestra d''eines' + #13#10 +
      'LCDCB.Caption=Color LCD reixa' + #13#10 +
      'FreeBandsCB.Caption=Espai lliure a les bandes' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Restaurar valors per defecte' + #13#10 +
      'BandsCaptionsCB.Caption=Mostrar títols de banda' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=Seleccionar Taules' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel·lar' + #13#10 +
      '');
    Add('dbNotAssigned', '[no assignat]');
    Add('dbSingleLine', 'Línia simple');

    Add('TfrxGroupEditorForm',
      'Caption=Grup' + #13#10 +
      'BreakOnL.Caption=Separar   ' + #13#10 +
      'OptionsL.Caption=Opcions   ' + #13#10 +
      'OKB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel·lar' + #13#10 +
      'DataFieldRB.Caption=Camp taula' + #13#10 +
      'ExpressionRB.Caption=Expressió' + #13#10 +
      'KeepGroupTogetherCB.Caption=Mantenir grup junt' + #13#10 +
      'StartNewPageCB.Caption=Iniciar nova pàgina' + #13#10 +
      'OutlineCB.Caption=Mostrar en el perfil' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=Editor de Text' + #13#10 +
      'DataBandL.Caption=Dades banda' + #13#10 +
      'DataSetL.Caption=Taules' + #13#10 +
      'DataFieldL.Caption=Camps' + #13#10 +
      'FunctionL.Caption=Funció' + #13#10 +
      'ExpressionL.Caption=Expressió' + #13#10 +
      'OKB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel·lar' + #13#10 +
      'AggregateRB.Caption=Afegir valor' + #13#10 +
      'SysVariableRB.Caption=Variable de sistema' + #13#10 +
      'CountInvisibleCB.Caption=Compte bandes invisibles' + #13#10 +
      'TextRB.Caption=Text' + #13#10 +
      'RunningTotalCB.Caption=Executar total' + #13#10 +
      '');
    Add('agAggregate', 'afegir');
    Add('vt1', '[DATE]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGES#]');
    Add('vt5', '[PAGE#] de [TOTALPAGES#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=Objectes OLE' + #13#10 +
      'InsertB.Caption=Afegir...' + #13#10 +
      'EditB.Caption=Editar...' + #13#10 +
      'CloseB.Caption=Tancar' + #13#10 +
      '');
    Add('olStretched', 'Ajustar');

    Add('TfrxBarcodeEditorForm',
      'Caption=Editor Codi de Barres ' + #13#10 +
      'CodeLbl.Caption=Codi' + #13#10 +
      'TypeLbl.Caption=Tipus de Codi de Barres' + #13#10 +
      'ZoomLbl.Caption=Zoom:' + #13#10 +
      'OptionsLbl.Caption=Opcions   ' + #13#10 +
      'RotationLbl.Caption=Rotació   ' + #13#10 +
      'CancelB.Caption=Cancel·lar' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'CalcCheckSumCB.Caption=Calcular Checksum ' + #13#10 +
      'ViewTextCB.Caption=Text' + #13#10 +
      'Rotation0RB.Caption=0°' + #13#10 +
      'Rotation90RB.Caption=90°' + #13#10 +
      'Rotation180RB.Caption=180°' + #13#10 +
      'Rotation270RB.Caption=270°' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Calcular CheckSum');
    Add('bcShowText', 'Mostrar Text');

    Add('TfrxAliasesEditorForm',
      'Caption=Editar Alies' + #13#10 +
      'HintL.Caption=Clicar Enter per editar ítem' + #13#10 +
      'DSAliasL.Caption=Alies Taula' + #13#10 +
      'FieldAliasesL.Caption=Alies camps' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel·lar' + #13#10 +
      'ResetB.Caption=Reset' + #13#10 +
      'UpdateB.Caption=Update' + #13#10 +
      '');
    Add('alUserName', 'Nom usuari');
    Add('alOriginal', 'Nom original');

    Add('TfrxParamsEditorForm',
      'Caption=Editor de Paràmetres' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel·lar' + #13#10 +
      '');
    Add('qpName', 'Nom');
    Add('qpDataType', 'Tipus Dades');
    Add('qpValue', 'Valor');

    Add('TfrxMDEditorForm',
      'Caption=Enllaç Mestra-Detall' + #13#10 +
      'Label1.Caption=Camps detall' + #13#10 +
      'Label2.Caption=Camps mestra' + #13#10 +
      'Label3.Caption=Camps enllaçats' + #13#10 +
      'AddB.Caption=Afegir' + #13#10 +
      'ClearB.Caption=Esborrar' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel·lar' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=Editor de Text' + #13#10 +
      'ExprB.Hint=Afegir Expressió' + #13#10 +
      'AggregateB.Hint=Afegir Agregat' + #13#10 +
      'LocalFormatB.Hint=Afegir Format' + #13#10 +
      'WordWrapB.Hint=Envoltar Paraules' + #13#10 +
      'CancelB.Hint=Cancel·lar' + #13#10 +
      'OkB.Hint=Acceptar' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=Imatge' + #13#10 +
      'LoadB.Hint=Llegir' + #13#10 +
      'CopyB.Hint=Copiar' + #13#10 +
      'PasteB.Hint=Enganxar' + #13#10 +
      'ClearB.Hint=Esborrar' + #13#10 +
      'CancelB.Hint=Cancel·lar' + #13#10 +
      'OkB.Hint=Acceptar' + #13#10 +
      '');
    Add('piEmpty', 'Buidar');

    Add('TfrxChartEditorForm',
      'Caption=Editor Gràfiques' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=Afegir Sèries' + #13#10 +
      'DeleteB.Hint=Esborrar Sèries' + #13#10 +
      'DBSourceRB.Caption=Dades des de DB' + #13#10 +
      'FixedDataRB.Caption=Fixar dades' + #13#10 +
      'DatasetLbl.Caption=Taula' + #13#10 +
      'X1Lbl.Caption=Valors X' + #13#10 +
      'Y1Lbl.Caption=Valors Y' + #13#10 +
      'X3Lbl.Caption=Valors X (per exemple, a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Valors Y (per exemple, 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Altres opcions   ' + #13#10 +
      'ShowTopLbl.Caption=Valors superiorsN' + #13#10 +
      'CaptionLbl.Caption=Títol superiorN' + #13#10 +
      'SortLbl.Caption=Ordre d''ordenació' + #13#10 +
      'LineMI.Caption=Línia' + #13#10 +
      'AreaMI.Caption=Area' + #13#10 +
      'PointMI.Caption=Punt' + #13#10 +
      'BarMI.Caption=Barra' + #13#10 +
      'HorizBarMI.Caption=Bar.Horitz.' + #13#10 +
      'PieMI.Caption=Pastís' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Línia Fast' + #13#10 +
      '');
    Add('ch3D', 'Vista 3D');
    Add('chAxis', 'Mostrar Eixos');
    Add('chsoNone', 'Res');
    Add('chsoAscending', 'Ascendent');
    Add('chsoDescending', 'Descendent');

    Add('TfrxRichEditorForm',
      'Caption=Editor Rich' + #13#10 +
      'OpenB.Hint=Obrir Fitxer' + #13#10 +
      'SaveB.Hint=Guardar Fitxer' + #13#10 +
      'UndoB.Hint=Desfer' + #13#10 +
      'TTB.Hint=Lletra' + #13#10 +
      'ExprB.Hint=Afegir Expressió' + #13#10 +
      'CancelB.Hint=Cancel·lar' + #13#10 +
      'OkB.Hint=Acceptar' + #13#10 +
      'BoldB.Hint=Negreta' + #13#10 +
      'ItalicB.Hint=Cursiva' + #13#10 +
      'UnderlineB.Hint=Subratllat' + #13#10 +
      'LeftAlignB.Hint=Ajust Esquerra' + #13#10 +
      'CenterAlignB.Hint=Centrat' + #13#10 +
      'RightAlignB.Hint=Ajust Dreta' + #13#10 +
      'BlockAlignB.Hint=Justificat' + #13#10 +
      'BulletsB.Hint=Llista' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Editor Llengüetes creuades' + #13#10 +
      'DatasetL.Caption=Origen dades   ' + #13#10 +
      'DimensionsL.Caption=Dimensions   ' + #13#10 +
      'RowsL.Caption=Files' + #13#10 +
      'ColumnsL.Caption=Columnes' + #13#10 +
      'CellsL.Caption=Cel·les' + #13#10 +
      'StructureL.Caption=Estructura Llengüetes creuades   ' + #13#10 +
      'RowHeaderCB.Caption=Capçalera fila' + #13#10 +
      'ColumnHeaderCB.Caption=Capçalera Columna' + #13#10 +
      'RowTotalCB.Caption=Gran total fila' + #13#10 +
      'ColumnTotalCB.Caption=Gran total columna' + #13#10 +
      'SwapB.Hint=Canviar files/columnes' + #13#10 +
      'StyleCB.Hint=Estil Llengüetes creuades' + #13#10 +
      'FontB.Hint=Opcions Lletra' + #13#10 +
      'AlignLeftB.Hint=Ajustar Esquerra' + #13#10 +
      'AlignCenterB.Hint=Ajustar Centre' + #13#10 +
      'AlignRightB.Hint=Ajustar Dreta' + #13#10 +
      'RotationB.Hint=Rotació Text' + #13#10 +
      'HighlightB.Hint=Remarcar' + #13#10 +
      'FormatB.Hint=Format' + #13#10 +
      'FrameB.Hint=Opcions Marc' + #13#10 +
      'FillColorB.Hint=Color farciment' + #13#10 +
      'Func1MI.Caption=Res' + #13#10 +
      'Func2MI.Caption=Sum' + #13#10 +
      'Func3MI.Caption=Min' + #13#10 +
      'Func4MI.Caption=Max' + #13#10 +
      'Func5MI.Caption=Averatge' + #13#10 +
      'Func6MI.Caption=Compte' + #13#10 +
      'Sort1MI.Caption=Ascendent (A-Z)' + #13#10 +
      'Sort2MI.Caption=Descendent (Z-A)' + #13#10 +
      'Sort3MI.Caption=No Ordenar' + #13#10 +
      'BoldMI.Caption=Negreta' + #13#10 +
      'ItalicMI.Caption=Cursiva' + #13#10 +
      'UnderlineMI.Caption=Subratllat' + #13#10 +
      'SuperScriptMI.Caption=Superíndex' + #13#10 +
      'SubScriptMI.Caption=Subíndex' + #13#10 +
      'CondensedMI.Caption=Condensat' + #13#10 +
      'WideMI.Caption=Mida' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=Cancel·lar' + #13#10 +
      'OkB.Hint=Acceptar' + #13#10 +
      '');
    Add('crSubtotal', 'Subtotal');
    Add('crNone', 'Res');
    Add('crSum', 'Sum');
    Add('crMin', 'Min');
    Add('crMax', 'Max');
    Add('crAvg', 'Avg');
    Add('crCount', 'Count');
    Add('crAsc', 'A-Z');
    Add('crDesc', 'Z-A');
    Add('crFillMx', 'Omplir Llengüetes creuades...');
    Add('crBuildMx', 'Fer Llengüetes creuades...');
    Add('crRepHdrs', 'Reimprimir Capçaleres');
    Add('crBorder', 'Vores');
    Add('crDown', 'Avall i a la dreta');
    Add('TfrxExprEditorForm',
      'Caption=Editor Expressió' + #13#10 +
      'ExprL.Caption=Expressió:' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel·lar' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=Mostrar Format' + #13#10 +
      'CategoryL.Caption=Categoria' + #13#10 +
      'FormatL.Caption=Format' + #13#10 +
      'FormatStrL.Caption=Format cadena:' + #13#10 +
      'SeparatorL.Caption=Separador Decimal:' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel·lar' + #13#10 +
      '');
    Add('fkText', 'Text (sense format)');
    Add('fkNumber', 'Número');
    Add('fkDateTime', 'Data/Hora');
    Add('fkBoolean', 'Booleà');
    Add('fkNumber1', '1234.5;%g');
    Add('fkNumber2', '1234.50;%2.2f');
    Add('fkNumber3', '1,234.50;%2.2n');
    Add('fkNumber4', '$1,234.50;%2.2m');
    Add('fkDateTime1', '11.28.2002;mm.dd.yyyy');
    Add('fkDateTime2', '28 nov 2002;dd mmm yyyy');
    Add('fkDateTime3', 'Novembre 28, 2002;mmmm dd, yyyy');
    Add('fkDateTime4', '02:14;hh:mm');
    Add('fkDateTime5', '02:14am;hh:mm am/pm');
    Add('fkDateTime6', '02:14:00;hh:mm:ss');
    Add('fkDateTime7', '02:14am, Novembre 28, 2002;hh:mm am/pm, mmmm dd, yyyy');
    Add('fkBoolean1', '0,1;0,1');
    Add('fkBoolean2', 'No,Yes;No,Yes');
    Add('fkBoolean3', '_,x;_,x');
    Add('fkBoolean4', 'False,True;False,True');

    Add('TfrxHighlightEditorForm',
      'Caption=Remarcar' + #13#10 +
      'FontColorB.Caption=Color...' + #13#10 +
      'BackColorB.Caption=Color...' + #13#10 +
      'ConditionL.Caption=Condició   ' + #13#10 +
      'FontL.Caption=Lletra   ' + #13#10 +
      'BackgroundL.Caption=Fons   ' + #13#10 +
      'OKB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel·lar' + #13#10 +
      'BoldCB.Caption=Negreta' + #13#10 +
      'ItalicCB.Caption=Cursiva' + #13#10 +
      'UnderlineCB.Caption=Subratllat' + #13#10 +
      'TransparentRB.Caption=Transparent' + #13#10 +
      'OtherRB.Caption=Altres' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Opcions Informe' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel·lar' + #13#10 +
      'GeneralTS.Caption=General' + #13#10 +
      'ReportSettingsL.Caption=Opcions Impressió   ' + #13#10 +
      'CopiesL.Caption=Còpies' + #13#10 +
      'GeneralL.Caption=General   ' + #13#10 +
      'PasswordL.Caption=Password' + #13#10 +
      'CollateCB.Caption=Confrontar còpies' + #13#10 +
      'DoublePassCB.Caption=Doble passada' + #13#10 +
      'PrintIfEmptyCB.Caption=Imprimir si és buit' + #13#10 +
      'DescriptionTS.Caption=Descripció' + #13#10 +
      'NameL.Caption=Nom' + #13#10 +
      'Description1L.Caption=Descripció' + #13#10 +
      'PictureL.Caption=Imatge' + #13#10 +
      'AuthorL.Caption=Autor' + #13#10 +
      'MajorL.Caption=Major' + #13#10 +
      'MinorL.Caption=Menor' + #13#10 +
      'ReleaseL.Caption=Release' + #13#10 +
      'BuildL.Caption=Build' + #13#10 +
      'CreatedL.Caption=Creat' + #13#10 +
      'ModifiedL.Caption=Modificat' + #13#10 +
      'DescriptionL.Caption=Descripció   ' + #13#10 +
      'VersionL.Caption=Versió   ' + #13#10 +
      'PictureB.Caption=Navegar...' + #13#10 +
      '');
    Add('rePrnOnPort', 'on');

    Add('TfrxStringsEditorForm',
      'Caption=Línies' + #13#10 +
      'CancelB.Hint=Cancel·lar' + #13#10 +
      'OkB.Hint=Acceptar' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=Cancel·lar' + #13#10 +
      'OkB.Hint=Acceptar' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=Password' + #13#10 +
      'PasswordL.Caption=Entra el password:' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel·lar' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=Editor Estils' + #13#10 +
      'ColorB.Caption=Color...' + #13#10 +
      'FontB.Caption=Lletra...' + #13#10 +
      'FrameB.Caption=Marc...' + #13#10 +
      'AddB.Hint=Afegir' + #13#10 +
      'DeleteB.Hint=Esborrar' + #13#10 +
      'EditB.Hint=Modificar' + #13#10 +
      'LoadB.Hint=Llegir' + #13#10 +
      'SaveB.Hint=Guardar' + #13#10 +
      'CancelB.Hint=Cancel·lar' + #13#10 +
      'OkB.Hint=Acceptar' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=Editor Marcs' + #13#10 +
      'FrameL.Caption=Marc' + #13#10 +
      'LineL.Caption=Línia marc' + #13#10 +
      'ShadowL.Caption=Ombrejat' + #13#10 +
      'FrameTopB.Hint=Línia Superior' + #13#10 +
      'FrameBottomB.Hint=Línia Inferior' + #13#10 +
      'FrameLeftB.Hint=Línia Esquerra' + #13#10 +
      'FrameRightB.Hint=Línia Dreta' + #13#10 +
      'FrameAllB.Hint=Totes les línies del marc' + #13#10 +
      'FrameNoB.Hint=Sense Marc' + #13#10 +
      'FrameColorB.Hint=Color Marc' + #13#10 +
      'FrameStyleB.Hint=Estil Marc' + #13#10 +
      'FrameWidthCB.Hint=Amplada Marc' + #13#10 +
      'ShadowB.Hint=Ombrejat' + #13#10 +
      'ShadowColorB.Hint=Color Ombrejat' + #13#10 +
      'ShadowWidthCB.Hint=Amplada ombra' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel·lar' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=Nou Ítem' + #13#10 +
      'ItemsTab.Caption=Ítems' + #13#10 +
      'TemplatesTab.Caption=Plantilles' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel·lar' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Llengüeta Ordre' + #13#10 +
      'Label1.Caption=Controls llistats en la llengüeta d''ordre:' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel·lar' + #13#10 +
      'UpB.Caption=Moure Amunt' + #13#10 +
      'DownB.Caption=Moure Avall' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Avaluar' + #13#10 +
      'Label1.Caption=Expressió' + #13#10 +
      'Label2.Caption=Resultat' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Informe Expert' + #13#10 +
      'DataTab.Caption=Dada' + #13#10 +
      'GroupsTab.Caption=Grups' + #13#10 +
      'LayoutTab.Caption=Capes' + #13#10 +
      'StyleTab.Caption=Estil' + #13#10 +
      'Step1L.Caption=Pas 1. Seleccionar la taula i camps a mostrar.' + #13#10 +
      'Step2L.Caption=Pas 2. Crear grups (opcional).' + #13#10 +
      'Step3L.Caption=Pas 3. Definir l''orientació de la pàgina i la capa de dades.' + #13#10 +
      'Step4L.Caption=Pas 4. Elegir l''estil de l''informe.' + #13#10 +
      'AddFieldB.Caption=Afegir >' + #13#10 +
      'AddAllFieldsB.Caption=Afegir tots >>' + #13#10 +
      'RemoveFieldB.Caption=< Treure' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Treure tots' + #13#10 +
      'AddGroupB.Caption=Afegir >' + #13#10 +
      'RemoveGroupB.Caption=< Treure' + #13#10 +
      'SelectedFieldsL.Caption=Seleccionar camps:' + #13#10 +
      'AvailableFieldsL.Caption=Camps útils:' + #13#10 +
      'GroupsL.Caption=Grups:' + #13#10 +
      'OrientationL.Caption=Orientació   ' + #13#10 +
      'LayoutL.Caption=Capa   ' + #13#10 +
      'PortraitRB.Caption=Vertical' + #13#10 +
      'LandscapeRB.Caption=Horitzontal' + #13#10 +
      'TabularRB.Caption=Tabular' + #13#10 +
      'ColumnarRB.Caption=Columnar' + #13#10 +
      'FitWidthCB.Caption=Ajustar camps a l''ampla de pàgina' + #13#10 +
      'CancelB.Caption=Cancel·lar' + #13#10 +
      'BackB.Caption=<< Anterior' + #13#10 +
      'NextB.Caption=Següent >>' + #13#10 +
      'FinishB.Caption=Final' + #13#10 +
      '');
    Add('wzStd', 'Informe Tipus Expert');
    Add('wzDMP', 'Informe per Impressora d''agulles Expert');
    Add('wzStdEmpty', 'Informe Tipus');
    Add('wzDMPEmpty', 'Informe per Impressora d''agulles');


    Add('ftAllFiles', 'Tots els Fitxers');
    Add('ftPictures', 'Imatges');
    Add('ftDB', 'Base de Dades');
    Add('ftRichFile', 'Fitxer RichText');
    Add('ftTextFile', 'Fitxer Text');

    Add('prNotAssigned', '(No assignat)');
    Add('prInvProp', 'Valor incorrecta per la propietat');
    Add('prDupl', 'Nom Repetit');
    Add('prPict', '(Imatge)');

    Add('mvExpr', 'Permetre Expressions');
    Add('mvStretch', 'Ajustar');
    Add('mvStretchToMax', 'Ajustar Màxima Alçada');
    Add('mvShift', 'Canvi');
    Add('mvShiftOver', 'Canvi quan coincideixi');
    Add('mvVisible', 'Visible');
    Add('mvPrintable', 'Imprimible');
    Add('mvFont', 'Lletra...');
    Add('mvFormat', 'Mostrar Format...');
    Add('mvClear', 'Esborrar Continguts');
    Add('mvAutoWidth', 'Amplada Automàtica');
    Add('mvWWrap', 'Ajustar Paraules');
    Add('mvSuppress', 'Eliminar Valors Repetits');
    Add('mvHideZ', 'Ocultar Zeros');
    Add('mvHTML', 'Permetre etiquetes HTML');
    Add('lvDiagonal', 'Diagonal');
    Add('pvAutoSize', 'Mida Automàtica');
    Add('pvCenter', 'Centre');
    Add('pvAspect', 'Mantenir Ràtio d''aspecte');
    Add('bvSplit', 'Permetre Divisió');
    Add('bvKeepChild', 'Mantenir el Fill Junt');
    Add('bvPrintChild', 'Imprimir si el Fill és Invisible');
    Add('bvStartPage', 'Iniciar Nova Pàgina');
    Add('bvPrintIfEmpty', 'Imprimir si el Detall és buit');
    Add('bvKeepDetail', 'Mantenir Detall Junt');
    Add('bvKeepFooter', 'Mantenir Peu Junt');
    Add('bvReprint', 'Reimprimir en nova pàgina');
    Add('bvOnFirst', 'Imprimir en la Primera Pàgina');
    Add('bvOnLast', 'Imprimir en l''Última Pàgina');
    Add('bvKeepGroup', 'Mantenir Junt');
    Add('bvFooterAfterEach', 'Peu després de cada fila');
    Add('srParent', 'Imprimir en el Pare');

    Add('obCatDraw', 'Dibuixa');
    Add('obCatOther', 'Altres objectes');
    Add('obCatOtherControls', 'Altres controls');
    Add('obDiagLine', 'Línia Diagonal');
    Add('obRect', 'Rectangle');
    Add('obRoundRect', 'Rectangle arrodonit');
    Add('obEllipse', 'El·lipse');
    Add('obTrian', 'Triangle');
    Add('obDiamond', 'Diamant');
    Add('obLabel', 'Control Etiqueta');
    Add('obEdit', 'Control Editor');
    Add('obMemoC', 'Control Memo');
    Add('obButton', 'Control Buttons');
    Add('obChBoxC', 'Control CheckBox');
    Add('obRButton', 'Control RadioButton');
    Add('obLBox', 'Control ListBox');
    Add('obCBox', 'Control ComboBox');
    Add('obDateEdit', 'Control DateEdit');
    Add('obImageC', 'Control Image');
    Add('obPanel', 'Control Panel');
    Add('obGrBox', 'Control GroupBox');
    Add('obBBtn', 'Control BitBtn');
    Add('obSBtn', 'Control SpeedButton');
    Add('obMEdit', 'Control MaskEdit');
    Add('obChLB', 'Control CheckListBox');
    Add('obDBLookup', 'Control DBLookupComboBox');
    Add('obBevel', 'Objecte Bevel');
    Add('obShape', 'Objecte Shape');
    Add('obText', 'Objecte Text');
    Add('obSysText', 'Text Sistema');
    Add('obLine', 'Objecte Line');
    Add('obPicture', 'Objecte Picture');
    Add('obBand', 'Objecte Band');
    Add('obDataBand', 'Dades banda');
    Add('obSubRep', 'Objecte Subreport');
    Add('obDlgPage', 'Formulari de Diàleg');
    Add('obRepPage', 'Pàgina Informe');
    Add('obReport', 'Objecte Informe');
    Add('obRich', 'Objecte RichText');
    Add('obOLE', 'Objecte OLE');
    Add('obChBox', 'Objecte CheckBox');
    Add('obChart', 'Objecte Chart');
    Add('obBarC', 'Objecte Barcode');
    Add('obCross', 'Objecte Cross-tab');
    Add('obDBCross', 'Objecte DB Cross-tab');
    Add('obGrad', 'Objecte Gradient');
    Add('obDMPText', 'Objecte Dot-matrix Text');
    Add('obDMPLine', 'Objecte Dot-matrix Line');
    Add('obBDEDB', 'Base de dades BDE');
    Add('obBDETb', 'Taula BDE');
    Add('obBDEQ', 'Query BDE');
    Add('obBDEComps', 'Components BDE');
    Add('obIBXDB', 'Base de dades IBX');
    Add('obIBXTb', 'Taula IBX');
    Add('obIBXQ', 'Query IBX');
    Add('obIBXComps', 'Components IBX');
    Add('obADODB', 'Base de dades ADO');
    Add('obADOTb', 'Taula ADO');
    Add('obADOQ', 'Query ADO');
    Add('obADOComps', 'Components ADO');
    Add('obDBXDB', 'Base de dades DBX');
    Add('obDBXTb', 'Taula DBX');
    Add('obDBXQ', 'Query DBX');
    Add('obDBXComps', 'Components DBX');

    Add('ctString', 'Cadena');
    Add('ctDate', 'Data i Hora');
    Add('ctConv', 'Conversions');
    Add('ctFormat', 'Format');
    Add('ctMath', 'Matemàtica');
    Add('ctOther', 'Altres');

    Add('IntToStr', 'Converteix un sencer a una cadena');
    Add('FloatToStr', 'Converteix un float a una cadena');
    Add('DateToStr', 'Converteix una data a una cadena');
    Add('TimeToStr', 'Converteix una hora a una cadena');
    Add('DateTimeToStr', 'Converteix una data i hora a una cadena');
    Add('VarToStr', 'Converteix un variant a una cadena');
    Add('StrToInt', 'Converteix una cadena a un sencer');
    Add('StrToFloat', 'Converteix una cadena a un float');
    Add('StrToDate', 'Converteix una cadena a una data');
    Add('StrToTime', 'Converteix una cadena a una hora');
    Add('StrToDateTime', 'Converteix una cadena a una data i hora');
    Add('Format', 'Retorna una cadena formatada per una sèrie d''arguments');
    Add('FormatFloat', 'Donar format a un float');
    Add('FormatDateTime', 'Donar format a una data i hora');
    Add('FormatMaskText', 'Retorna una cadena usant una màscara d''edició');
    Add('EncodeDate', 'Retorna un tipus TDateTime per un específic Any, Mes, i Dia');
    Add('DecodeDate', 'Parteix un TDateTime en Any, Mes, i Dia');
    Add('EncodeTime', 'Retorna un tipus TDateTime per una específica Hora, Minut, Segon, i MSegon');
    Add('DecodeTime', 'Parteix un TDateTime en hores, minuts, segons, i milisegons');
    Add('Date', 'Retorna la data actual');
    Add('Time', 'Retorna l''hora actual');
    Add('Now', 'Retorna la data i hora actual');
    Add('DayOfWeek', 'Retorna el dia de la setmana per una específica data');
    Add('IsLeapYear', 'Indica si un any específic és de traspàs');
    Add('DaysInMonth', 'Retorna el número de dies d''un mes específic');
    Add('Length', 'Retorna la longitud d''una cadena');
    Add('Copy', 'Retorna una subcadena d''una cadena');
    Add('Pos', 'Retorna la posició d''una subcadena dins d''una cadena');
    Add('Delete', 'Esborra una subcadena d''una cadena');
    Add('Insert', 'Afegeix una subcadena dins d''una cadena');
    Add('Uppercase', 'Converteix tots els caràcters d''una cadena a majúscules');
    Add('Lowercase', 'Converteix tots els caràcters d''una cadena a minúscules');
    Add('Trim', 'Treu tots els espais d''una cadena');
    Add('NameCase', 'Converteix el primer caràcter d''una paraula a majúscula');
    Add('CompareText', 'Compara dos cadenes');
    Add('Chr', 'Converteix un sencer a un caràcter');
    Add('Ord', 'Converteix un caràcter a un sencer');
    Add('SetLength', 'Assigna una longitud a una cadena');
    Add('Round', 'Arrodoneix un float al valor més pròxim');
    Add('Trunc', 'Retorna la part sencera d''un float');
    Add('Int', 'Retorna la part sencera d''un real');
    Add('Frac', 'Retorna la part fraccional d''un real');
    Add('Sqrt', 'Retorna l''arrel quadrada d''un número específic');
    Add('Abs', 'Retorna el valor absolut');
    Add('Sin', 'Retorna el sinus d''un angle (en radians)');
    Add('Cos', 'Retorna el cosinus d''un angle (en radians)');
    Add('ArcTan', 'Retorna l''arctangent');
    Add('Tan', 'Retorna la tangent');
    Add('Exp', 'Retorna l''exponencial');
    Add('Ln', 'Retorna el logaritme natural d''una expressió real');
    Add('Pi', 'Retorna el número 3.1415926... (pi)');
    Add('Inc', 'Incrementa un valor');
    Add('Dec', 'Decrementa un valor');
    Add('RaiseException', 'Crea una excepció');
    Add('ShowMessage', 'Mostra un missatge');
    Add('Randomize', 'Inicia el generador de números aleatoris');
    Add('Random', 'Retorna un número aleatori');
    Add('ValidInt', 'Retorna True si la cadena específica conté un sencer vàlid');
    Add('ValidFloat', 'Retorna True si la cadena específica conté un float vàlid');
    Add('ValidDate', 'Retorna True si la cadena específica conté una data vàlid');
    Add('IIF', 'Retorna True si Expr és True, en altres casos retorna False');
    Add('Get', 'Solament per us intern');
    Add('Set', 'Solament per us intern');
    Add('InputBox', 'Mostra una caixa de diàleg per què l''usuari pugi entrar una cadena');
    Add('InputQuery', 'Mostra una caixa de diàleg per què l''usuari pugi entrar una cadena');
    Add('MessageDlg', 'Mostra un missatge');
    Add('CreateOleObject', 'Crea un objecte OLE');
    Add('VarArrayCreate', 'Crea una matriu de variant');
    Add('VarType', 'Retorna un tipus de variant');

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