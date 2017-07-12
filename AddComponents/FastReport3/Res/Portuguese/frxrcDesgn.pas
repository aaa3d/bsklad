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
      'Caption=Inspector de Objectos' + #13#10 +
      '');
    Add('oiProp', 'Propriedades');
    Add('oiEvent', 'Eventos');

    Add('TfrxDataTreeForm',
      'Caption=�rvore de dados' + #13#10 +
      'DataTS.Caption=Dados' + #13#10 +
      'VariablesTS.Caption=Vari�veis' + #13#10 +
      'FunctionsTS.Caption=Fun��es' + #13#10 +
      'InsFieldCB.Caption=Criar campo' + #13#10 +
      'InsCaptionCB.Caption=Criar r�tulo' + #13#10 +
      '');
    Add('dtNoData', 'Sem dados dispon�veis');
    Add('dtData', 'Dados');
    Add('dtSysVar', 'Vari�veis do Sistema');
    Add('dtVar', 'Vari�veis');
    Add('dtFunc', 'Fun��es');

    Add('TfrxReportTreeForm',
      'Caption=�rvore do Relat�rio' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Abrir ficheiro de Script' + #13#10 +
      'SaveScriptB.Hint=Guardar Script para ficheiro' + #13#10 +
      'RunScriptB.Hint=Executar Script' + #13#10 +
      'StepScriptB.Hint=Passo a passo' + #13#10 +
      'StopScriptB.Hint=Terminar Script' + #13#10 +
      'EvaluateB.Hint=Avaliar' + #13#10 +
      'LangL.Caption=Language:' + #13#10 +
      'AlignTB.Caption=Alinhar' + #13#10 +
      'AlignLeftsB.Hint=Alinhar � esquerda' + #13#10 +
      'AlignHorzCentersB.Hint=Centrar' + #13#10 +
      'AlignRightsB.Hint=Alinhar � direita' + #13#10 +
      'AlignTopsB.Hint=Alinhar em cima' + #13#10 +
      'AlignVertCentersB.Hint=Centrar' + #13#10 +
      'AlignBottomsB.Hint=Alinhar em baixo' + #13#10 +
      'SpaceHorzB.Hint=Espa�ar Horizontalmente' + #13#10 +
      'SpaceVertB.Hint=Espa�ar Verticalmente' + #13#10 +
      'CenterHorzB.Hint=Centrar Horizontalmente na Banda' + #13#10 +
      'CenterVertB.Hint=Centrar Verticalmente na Banda' + #13#10 +
      'SameWidthB.Hint=Mesma Largura' + #13#10 +
      'SameHeightB.Hint=Mesma Altura' + #13#10 +
      'TextTB.Caption=Texto' + #13#10 +
      'StyleCB.Hint=Estilo' + #13#10 +
      'FontNameCB.Hint=Tipo de Letra' + #13#10 +
      'FontSizeCB.Hint=Tamanho de Letra' + #13#10 +
      'BoldB.Hint=Negrito' + #13#10 +
      'ItalicB.Hint=It�lico' + #13#10 +
      'UnderlineB.Hint=Sublinhado' + #13#10 +
      'FontColorB.Hint=Cor da Letra' + #13#10 +
      'HighlightB.Hint=Destacar' + #13#10 +
      'RotateB.Hint=Rota��o do Texto' + #13#10 +
      'TextAlignLeftB.Hint=Alinhar � esquerda' + #13#10 +
      'TextAlignCenterB.Hint=Centrar' + #13#10 +
      'TextAlignRightB.Hint=Alinhar � direita' + #13#10 +
      'TextAlignBlockB.Hint=Alinhar tudo' + #13#10 +
      'TextAlignTopB.Hint=Alinhar em cima' + #13#10 +
      'TextAlignMiddleB.Hint=Alinhar ao centro' + #13#10 +
      'TextAlignBottomB.Hint=Alinhar em baixo' + #13#10 +
      'FrameTB.Caption=Limites' + #13#10 +
      'FrameTopB.Hint=Linha Superior' + #13#10 +
      'FrameBottomB.Hint=Linha Inferior' + #13#10 +
      'FrameLeftB.Hint=Linha � Esquerda' + #13#10 +
      'FrameRightB.Hint=Linha � Direita' + #13#10 +
      'FrameAllB.Hint=Todas as linhas' + #13#10 +
      'FrameNoB.Hint=Sem linhas' + #13#10 +
      'ShadowB.Hint=Sombra' + #13#10 +
      'FillColorB.Hint=Cor do fundo' + #13#10 +
      'FrameColorB.Hint=Cor dos limites' + #13#10 +
      'FrameStyleB.Hint=Estilo dos limites' + #13#10 +
      'FrameWidthCB.Hint=Largura dos limites' + #13#10 +
      'StandardTB.Caption=Padr�o' + #13#10 +
      'NewB.Hint=Novo Relat�rio' + #13#10 +
      'OpenB.Hint=Abrir Relat�rio' + #13#10 +
      'SaveB.Hint=Guardar Relat�rio' + #13#10 +
      'PreviewB.Hint=Pr�-Visualizar' + #13#10 +
      'NewPageB.Hint=Nova P�gina de Relat�rio' + #13#10 +
      'NewDialogB.Hint=Nova P�gina de Di�logo' + #13#10 +
      'DeletePageB.Hint=Eliminar P�gina' + #13#10 +
      'PageSettingsB.Hint=Configura��o da P�gina' + #13#10 +
      'VariablesB.Hint=Vari�veis' + #13#10 +
      'CutB.Hint=Cortar' + #13#10 +
      'CopyB.Hint=Copiar' + #13#10 +
      'PasteB.Hint=Colar' + #13#10 +
      'SampleFormatB.Hint=Copiar formata��o' + #13#10 +
      'UndoB.Hint=Desfazer' + #13#10 +
      'RedoB.Hint=Refazer' + #13#10 +
      'GroupB.Hint=Agrupar' + #13#10 +
      'UngroupB.Hint=Desagregar' + #13#10 +
      'ShowGridB.Hint=Mostrar Grelha' + #13#10 +
      'AlignToGridB.Hint=Alinhar � Grelha' + #13#10 +
      'SetToGridB.Hint=Ajustar � Grelha' + #13#10 +
      'ScaleCB.Hint=Zoom' + #13#10 +
      'ExtraToolsTB.Caption=Ferramentas Extra' + #13#10 +
      'ObjectSelectB.Hint=Ferramenta Seleccionar' + #13#10 +
      'HandToolB.Hint=Ferramenta Mover' + #13#10 +
      'ZoomToolB.Hint=Ferramenta Zoom' + #13#10 +
      'TextToolB.Hint=Ferramenta Editar Texto' + #13#10 +
      'FormatToolB.Hint=Ferramenta Copiar Formata��o' + #13#10 +
      'ObjectBandB.Hint=Inserir Banda' + #13#10 +
      'FileMenu.Caption=&Ficheiro' + #13#10 +
      'EditMenu.Caption=&Editar' + #13#10 +
      'FindMI.Caption=Localizar...' + #13#10 +
      'FindNextMI.Caption=Localizar Pr�ximo' + #13#10 +
      'ReplaceMI.Caption=Substituir...' + #13#10 +
      'ReportMenu.Caption=&Relat�rio' + #13#10 +
      'ReportDataMI.Caption=Dados...' + #13#10 +
      'ReportSettingsMI.Caption=Op��es...' + #13#10 +
      'ReportStylesMI.Caption=Estilos...' + #13#10 +
      'ViewMenu.Caption=&Ver' + #13#10 +
      'ToolbarsMI.Caption=Barras de Ferramentas' + #13#10 +
      'StandardMI.Caption=Padr�o' + #13#10 +
      'TextMI.Caption=Texto' + #13#10 +
      'FrameMI.Caption=Limites' + #13#10 +
      'AlignmentMI.Caption=Paleta de Alinhamento' + #13#10 +
      'ToolsMI.Caption=Ferramentas Extra' + #13#10 +
      'InspectorMI.Caption=Inspector de Objectos' + #13#10 +
      'DataTreeMI.Caption=�rvore de Dados' + #13#10 +
      'ReportTreeMI.Caption=�rvore do Relat�rio' + #13#10 +
      'ShowRulersMI.Caption=R�guas' + #13#10 +
      'ShowGuidesMI.Caption=Guias' + #13#10 +
      'DeleteGuidesMI.Caption=Apagar Guias' + #13#10 +
      'OptionsMI.Caption=Op��es...' + #13#10 +
      'HelpMenu.Caption=&Ajuda' + #13#10 +
      'HelpContentsMI.Caption=Conte�do da Ajuda...' + #13#10 +
      'AboutMI.Caption=Sobre o FastReport...' + #13#10 +
      'TabOrderMI.Caption=Ordem das Tabula��es...' + #13#10 +
      'UndoCmd.Caption=Desfazer' + #13#10 +
      'RedoCmd.Caption=Refazer' + #13#10 +
      'CutCmd.Caption=Cortar' + #13#10 +
      'CopyCmd.Caption=Copiar' + #13#10 +
      'PasteCmd.Caption=Colar' + #13#10 +
      'GroupCmd.Caption=Agrupar' + #13#10 +
      'UngroupCmd.Caption=Desagregar' + #13#10 +
      'DeleteCmd.Caption=Apagar' + #13#10 +
      'DeletePageCmd.Caption=Apagar P�gina' + #13#10 +
      'SelectAllCmd.Caption=Seleccionar Tudo' + #13#10 +
      'EditCmd.Caption=Editar...' + #13#10 +
      'BringToFrontCmd.Caption=Trazer para a Frente' + #13#10 +
      'SendToBackCmd.Caption=Enviar para Tr�s' + #13#10 +
      'NewItemCmd.Caption=Novo...' + #13#10 +
      'NewReportCmd.Caption=Novo Relat�rio' + #13#10 +
      'NewPageCmd.Caption=Nova P�gina' + #13#10 +
      'NewDialogCmd.Caption=Novo Di�logo' + #13#10 +
      'OpenCmd.Caption=Abrir...' + #13#10 +
      'SaveCmd.Caption=Guardar' + #13#10 +
      'SaveAsCmd.Caption=Guardar Como...' + #13#10 +
      'VariablesCmd.Caption=Vari�veis...' + #13#10 +
      'PageSettingsCmd.Caption=Configura��o da P�gina...' + #13#10 +
      'PreviewCmd.Caption=Pr�-Visualizar' + #13#10 +
      'ExitCmd.Caption=Sair' + #13#10 +
      'ReportTitleMI.Caption=T�tulo do Relat�rio' + #13#10 +
      'ReportSummaryMI.Caption=Sum�rio do Relat�rio' + #13#10 +
      'PageHeaderMI.Caption=Cabe�alho de P�gina' + #13#10 +
      'PageFooterMI.Caption=Rodap� de P�gina' + #13#10 +
      'HeaderMI.Caption=Cabe�alho' + #13#10 +
      'FooterMI.Caption=Rodap�' + #13#10 +
      'MasterDataMI.Caption=Dados Mestre' + #13#10 +
      'DetailDataMI.Caption=Dados de Detalhe' + #13#10 +
      'SubdetailDataMI.Caption=Dados de Sub-detalhe' + #13#10 +
      'Data4levelMI.Caption=Dados de 4� n�vel' + #13#10 +
      'Data5levelMI.Caption=Dados de 5� n�vel' + #13#10 +
      'Data6levelMI.Caption=Dados de 6� n�vel' + #13#10 +
      'GroupHeaderMI.Caption=Cabe�alho de Grupo' + #13#10 +
      'GroupFooterMI.Caption=Rodap� de Grupo' + #13#10 +
      'ChildMI.Caption=Filha' + #13#10 +
      'ColumnHeaderMI.Caption=Cabe�alho de Coluna' + #13#10 +
      'ColumnFooterMI.Caption=Rodap� de Coluna' + #13#10 +
      'OverlayMI.Caption=Overlay' + #13#10 +
      'VerticalbandsMI.Caption=Bandas verticais' + #13#10 +
      'HeaderMI1.Caption=Cabe�alho' + #13#10 +
      'FooterMI1.Caption=Rodap�' + #13#10 +
      'MasterDataMI1.Caption=Dados Mestre' + #13#10 +
      'DetailDataMI1.Caption=Dados de Detalhe' + #13#10 +
      'SubdetailDataMI1.Caption=Dados de Sub-detalhe' + #13#10 +
      'GroupHeaderMI1.Caption=Cabe�alho de Grupo' + #13#10 +
      'GroupFooterMI1.Caption=Rodap� de Grupo' + #13#10 +
      'ChildMI1.Caption=Filha' + #13#10 +
      'R0MI.Caption=0�' + #13#10 +
      'R45MI.Caption=45�' + #13#10 +
      'R90MI.Caption=90�' + #13#10 +
      'R180MI.Caption=180�' + #13#10 +
      'R270MI.Caption=270�' + #13#10 +
      'FontB.Hint=Configura��o da Letra' + #13#10 +
      'BoldMI.Caption=Negrito' + #13#10 +
      'ItalicMI.Caption=It�lico' + #13#10 +
      'UnderlineMI.Caption=Sublinhado' + #13#10 +
      'SuperScriptMI.Caption=Sobrescrito' + #13#10 +
      'SubScriptMI.Caption=Subscrito' + #13#10 +
      'CondensedMI.Caption=Condensado' + #13#10 +
      'WideMI.Caption=Largo' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'OpenDialog.Filter=Relat�rio (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=Ficheiros Pascal (*.pas)|*.pas|Ficheiros C++ (*.cpp)|*.cpp|Ficheiros JavaScript (*.js)|*.js|Ficheiros Basic (*.vb)|*.vb|Todos |*.*' + #13#10 +
      'SaveScriptDialog.Filter=Ficheiros Pascal (*.pas)|*.pas|Ficheiros C++ (*.cpp)|*.cpp|Ficheiros JavaScript (*.js)|*.js|Ficheiros Basic (*.vb)|*.vb|Todos |*.*' + #13#10 +
      '');
    Add('dsCm', 'Cent�metros');
    Add('dsInch', 'Polegadas');
    Add('dsPix', 'Pixels');
    Add('dsChars', 'Caracteres');
    Add('dsCode', 'C�digo');
    Add('dsPage', 'P�gina');
    Add('dsRepFilter', 'Relat�rio (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'Relat�rio comprimido (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', 'Guardar altera��es na p�gina de pr�-visualiza��o?');
    Add('dsSaveChangesTo', 'Guardar altera��es para ');
    Add('dsCantLoad', 'Imposs�vel carregar ficheiro');
    Add('dsStyleFile', 'Estilo');
    Add('dsCantFindProc', 'Imposs�vel localizar o procedimento principal');
    Add('dsClearScript', 'Ir� apagar todo o c�digo. Quer continuar?');
    Add('dsNoStyle', 'Sem estilo');
    Add('dsStyleSample', 'Exemplo de estilo');
    Add('dsTextNotFound', 'Texto ''%s'' n�o encontrado');
    Add('dsReplace', 'Substituir esta ocorr�ncia de ''%s''?');

    Add('TfrxAboutForm',
      'Caption=Sobre o FastReport' + #13#10 +
      'Label4.Caption=Visite a nossa p�gina:' + #13#10 +
      'Label6.Caption=Vendas:' + #13#10 +
      'Label8.Caption=Suporte:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Op��es de P�gina' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'TabSheet1.Caption=Papel' + #13#10 +
      'Label1.Caption=Largura' + #13#10 +
      'Label2.Caption=Altura' + #13#10 +
      'Label11.Caption= Tamanho ' + #13#10 +
      'Label12.Caption= Orienta��o ' + #13#10 +
      'Label3.Caption=Esquerda' + #13#10 +
      'Label4.Caption=Superior' + #13#10 +
      'Label5.Caption=Direita' + #13#10 +
      'Label6.Caption=Inferior' + #13#10 +
      'Label13.Caption= Margens ' + #13#10 +
      'Label14.Caption= Origem do Papel ' + #13#10 +
      'Label9.Caption=Primeira P�gina' + #13#10 +
      'Label10.Caption=Outras p�ginas' + #13#10 +
      'PortraitRB.Caption=Retrato' + #13#10 +
      'LandscapeRB.Caption=Paisagem' + #13#10 +
      'TabSheet3.Caption=Outras Op��es' + #13#10 +
      'Label7.Caption= Colunas ' + #13#10 +
      'Label8.Caption=N�mero' + #13#10 +
      'Label15.Caption=Largura' + #13#10 +
      'Label16.Caption=Posi��es' + #13#10 +
      'Label17.Caption= Outros ' + #13#10 +
      'Label18.Caption=Duplex' + #13#10 +
      'PrintOnPrevCB.Caption=Imprimir na p�gina anterior' + #13#10 +
      'MirrorMarginsCB.Caption=Espelhar margens' + #13#10 +
      'LargeHeightCB.Caption=Altura grande em modo de Desenho' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Seleccione os Datasets do Relat�rio' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Editar Vari�veis' + #13#10 +
      'NewCategoryB.Caption=Categoria' + #13#10 +
      'NewVarB.Caption=Vari�vel' + #13#10 +
      'EditB.Caption=Editar' + #13#10 +
      'DeleteB.Caption=Apagar' + #13#10 +
      'EditListB.Caption=Listar' + #13#10 +
      'LoadB.Caption=Carregar' + #13#10 +
      'SaveB.Caption=Guardar' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'ExprPanel.Caption= Express�o:' + #13#10 +
      'OpenDialog1.Filter=Dicion�rio (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Dicion�rio (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(sem vari�veis definidas)');
    Add('vaVar', 'Vari�veis');
    Add('vaDupName', 'Nome Duplicado');

    Add('TfrxOptionsEditor',
      'Caption=Op��es do Desenhador' + #13#10 +
      'Label1.Caption= Grelha ' + #13#10 +
      'Label2.Caption=Tipo' + #13#10 +
      'Label3.Caption=Tamanho' + #13#10 +
      'Label4.Caption=Formul�rio de Di�logo:' + #13#10 +
      'Label5.Caption= Outro ' + #13#10 +
      'Label6.Caption= Tipos de Letra ' + #13#10 +
      'Label7.Caption=Janela de c�digo' + #13#10 +
      'Label8.Caption=Editor de texto' + #13#10 +
      'Label9.Caption=Tamanho' + #13#10 +
      'Label10.Caption=Tamanho' + #13#10 +
      'Label11.Caption= Cores ' + #13#10 +
      'Label12.Caption=Espa�o entre bandas:' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=pol' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'CMRB.Caption=Cent�metros:' + #13#10 +
      'InchesRB.Caption=Polegadas:' + #13#10 +
      'PixelsRB.Caption=Pixels:' + #13#10 +
      'ShowGridCB.Caption=Mostrar Grelha' + #13#10 +
      'AlignGridCB.Caption=Alinhar � grelha' + #13#10 +
      'EditAfterInsCB.Caption=Mostrar editor ap�s inserir' + #13#10 +
      'ObjectFontCB.Caption=Usar tipo de letra do objecto' + #13#10 +
      'WorkspaceB.Caption=Espa�o de trabalho' + #13#10 +
      'ToolB.Caption=Janelas de Ferramentas' + #13#10 +
      'LCDCB.Caption=Cor da grelha LCD' + #13#10 +
      'FreeBandsCB.Caption=Coloca��o livre das bandas' + #13#10 +
      'DropFieldsCB.Caption=Mostrar lista de campos' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Restaurar valores padr�o' + #13#10 +
      'BandsCaptionsCB.Caption=Mostrar r�tulos das bandas' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=Seleccionar DataSet' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');
    Add('dbNotAssigned', '[n�o atribu�do]');
    Add('dbSingleLine', 'Linha �nica');

    Add('TfrxGroupEditorForm',
      'Caption=Grupo' + #13#10 +
      'BreakOnL.Caption= Quebrar em ' + #13#10 +
      'OptionsL.Caption= Op��es ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'DataFieldRB.Caption=Campo de dados' + #13#10 +
      'ExpressionRB.Caption=Express�o' + #13#10 +
      'KeepGroupTogetherCB.Caption=Manter agrupado' + #13#10 +
      'StartNewPageCB.Caption=Iniciar nova p�gina' + #13#10 +
      'OutlineCB.Caption=Mostrar no resumo' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=Memo do Sistema' + #13#10 +
      'DataBandL.Caption=Banda de dados' + #13#10 +
      'DataSetL.Caption=DataSet' + #13#10 +
      'DataFieldL.Caption=Campo' + #13#10 +
      'FunctionL.Caption=Fun��o' + #13#10 +
      'ExpressionL.Caption=Express�o' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'AggregateRB.Caption=Valor agregado' + #13#10 +
      'SysVariableRB.Caption=Vari�vel de Sistema' + #13#10 +
      'CountInvisibleCB.Caption=Contar bandas invis�veis' + #13#10 +
      'TextRB.Caption=Texto' + #13#10 +
      'RunningTotalCB.Caption=Total Geral' + #13#10 +
      '');
    Add('agAggregate', 'Inserir Agregado');
    Add('vt1', '[DATE]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGES#]');
    Add('vt5', '[PAGE#] de [TOTALPAGES#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=Objecto OLE' + #13#10 +
      'InsertB.Caption=Inserir...' + #13#10 +
      'EditB.Caption=Editar...' + #13#10 +
      'CloseB.Caption=Fechar' + #13#10 +
      '');
    Add('olStretched', 'Esticado');

    Add('TfrxBarcodeEditorForm',
      'Caption=Editor de C�digos de Barras' + #13#10 +
      'CodeLbl.Caption=C�digo' + #13#10 +
      'TypeLbl.Caption=Tipo de Barras' + #13#10 +
      'ZoomLbl.Caption=Zoom:' + #13#10 +
      'OptionsLbl.Caption= Op��es ' + #13#10 +
      'RotationLbl.Caption= Rota��o ' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CalcCheckSumCB.Caption=Calc. D�gito de Controlo' + #13#10 +
      'ViewTextCB.Caption=Texto' + #13#10 +
      'Rotation0RB.Caption=0�' + #13#10 +
      'Rotation90RB.Caption=90�' + #13#10 +
      'Rotation180RB.Caption=180�' + #13#10 +
      'Rotation270RB.Caption=270�' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Calc. D�gito de Controlo');
    Add('bcShowText', 'Mostrar Texto');

    Add('TfrxAliasesEditorForm',
      'Caption=Editar Aliases' + #13#10 +
      'HintL.Caption=Carregue em Enter para editar o item' + #13#10 +
      'DSAliasL.Caption=Nome do Dataset' + #13#10 +
      'FieldAliasesL.Caption=Nomes dos Campos' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'ResetB.Caption=Limpar' + #13#10 +
      'UpdateB.Caption=Actualizar' + #13#10 +
      '');
    Add('alUserName', 'Utilizador');
    Add('alOriginal', 'Nome Original');

    Add('TfrxParamsEditorForm',
      'Caption=Editor de Par�metros' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');
    Add('qpName', 'Nome');
    Add('qpDataType', 'Tipo');
    Add('qpValue', 'Valor');

    Add('TfrxMDEditorForm',
      'Caption=Liga��o Mestre-Detalhe' + #13#10 +
      'Label1.Caption=Campos de Detalhe' + #13#10 +
      'Label2.Caption=Campos Mestre' + #13#10 +
      'Label3.Caption=Campos Ligados' + #13#10 +
      'AddB.Caption=Adicionar' + #13#10 +
      'ClearB.Caption=Limpar' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=Memo' + #13#10 +
      'ExprB.Hint=Inserir Express�o' + #13#10 +
      'AggregateB.Hint=Inserir Agregado' + #13#10 +
      'LocalFormatB.Hint=Inserir Formata��o' + #13#10 +
      'WordWrapB.Hint=Quebrar Linhas' + #13#10 +
      'CancelB.Hint=Cancelar' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=Figura' + #13#10 +
      'LoadB.Hint=Carregar' + #13#10 +
      'CopyB.Hint=Copiar' + #13#10 +
      'PasteB.Hint=Colar' + #13#10 +
      'ClearB.Hint=Limpar' + #13#10 +
      'CancelB.Hint=Cancelar' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('piEmpty', 'Vazio');

    Add('TfrxChartEditorForm',
      'Caption=Editor de Gr�ficos' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'AddB.Hint=Adicionar S�ries' + #13#10 +
      'DeleteB.Hint=Apagar S�ries' + #13#10 +
      'DBSourceRB.Caption=Dados da BD' + #13#10 +
      'BandSourceRB.Caption=Origem da Banda' + #13#10 +
      'FixedDataRB.Caption=Dados Fixos' + #13#10 +
      'DatasetLbl.Caption=Dataset' + #13#10 +
      'BandLbl.Caption=Banda de Dados' + #13#10 +
      'X1Lbl.Caption=Valores X' + #13#10 +
      'Y1Lbl.Caption=Valores Y' + #13#10 +
      'X2Lbl.Caption=Valores X' + #13#10 +
      'Y2Lbl.Caption=Valores Y' + #13#10 +
      'X3Lbl.Caption=Valores X (por exemplo, a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Valores Y (por exemplo, 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption= Outras Op��es ' + #13#10 +
      'ShowTopLbl.Caption=TopoN Valores' + #13#10 +
      'CaptionLbl.Caption=TopoN R�tulo' + #13#10 +
      'SortLbl.Caption=Ordem' + #13#10 +
      'LineMI.Caption=Linhas' + #13#10 +
      'AreaMI.Caption=�reas' + #13#10 +
      'PointMI.Caption=Pontos' + #13#10 +
      'BarMI.Caption=Barras' + #13#10 +
      'HorizBarMI.Caption=Barras Horiz.' + #13#10 +
      'PieMI.Caption=Sectograma' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Linhas R�pido' + #13#10 +
      '');
    Add('ch3D', 'Vista 3D');
    Add('chAxis', 'Mostrar Eixos');
    Add('chsoNone', 'Nenhuma');
    Add('chsoAscending', 'Crescente');
    Add('chsoDescending', 'Decrescente');

    Add('TfrxRichEditorForm',
      'Caption=Editor de Texto' + #13#10 +
      'OpenB.Hint=Abrir Ficheiro' + #13#10 +
      'SaveB.Hint=Guardar Ficheiro' + #13#10 +
      'UndoB.Hint=Desfazer' + #13#10 +
      'TTB.Hint=Tipo de Letra' + #13#10 +
      'ExprB.Hint=Inserir Express�o' + #13#10 +
      'CancelB.Hint=Cancelar' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      'BoldB.Hint=Negrito' + #13#10 +
      'ItalicB.Hint=Italico' + #13#10 +
      'UnderlineB.Hint=Sublinhado' + #13#10 +
      'LeftAlignB.Hint=Alinhar � Esquerda' + #13#10 +
      'CenterAlignB.Hint=Centrar' + #13#10 +
      'RightAlignB.Hint=Alinhar � Direita' + #13#10 +
      'BlockAlignB.Hint=Alinhar Tudo' + #13#10 +
      'BulletsB.Hint=Marcadores' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Editor de Grelhas' + #13#10 +
      'DatasetL.Caption= Fonte de Dados ' + #13#10 +
      'DimensionsL.Caption= Dimens�es ' + #13#10 +
      'RowsL.Caption=Linhas' + #13#10 +
      'ColumnsL.Caption=Colunas' + #13#10 +
      'CellsL.Caption=C�lulas' + #13#10 +
      'StructureL.Caption= Estrutura da Grelha ' + #13#10 +
      'RowHeaderCB.Caption=Cabe�alho da Linha' + #13#10 +
      'ColumnHeaderCB.Caption=Cabe�alho da Coluna' + #13#10 +
      'RowTotalCB.Caption=Total Geral da Linha' + #13#10 +
      'ColumnTotalCB.Caption=Total Geral da Coluna' + #13#10 +
      'SwapB.Hint=Trocar Linhas/Colunas' + #13#10 +
      'StyleCB.Hint=Estilo da Grelha' + #13#10 +
      'FontB.Hint=Tipo de Letra' + #13#10 +
      'AlignLeftB.Hint=Alinhar � Esquerda' + #13#10 +
      'AlignCenterB.Hint=Centrar' + #13#10 +
      'AlignRightB.Hint=Alinhar � Direita' + #13#10 +
      'RotationB.Hint=Rota��o do Texto' + #13#10 +
      'HighlightB.Hint=Destaque' + #13#10 +
      'FormatB.Hint=Formato' + #13#10 +
      'FrameB.Hint=Limites' + #13#10 +
      'FillColorB.Hint=Cor de preenchimento' + #13#10 +
      'Func1MI.Caption=Nenhum' + #13#10 +
      'Func2MI.Caption=Soma' + #13#10 +
      'Func3MI.Caption=Min' + #13#10 +
      'Func4MI.Caption=Max' + #13#10 +
      'Func5MI.Caption=M�dia' + #13#10 +
      'Func6MI.Caption=Contagem' + #13#10 +
      'Sort1MI.Caption=Crescente (A-Z)' + #13#10 +
      'Sort2MI.Caption=Decrescente (Z-A)' + #13#10 +
      'Sort3MI.Caption=Sem ordem' + #13#10 +
      'BoldMI.Caption=Negrito' + #13#10 +
      'ItalicMI.Caption=It�lico' + #13#10 +
      'UnderlineMI.Caption=Sublinhado' + #13#10 +
      'SuperScriptMI.Caption=Sobrescrito' + #13#10 +
      'SubScriptMI.Caption=Subscrito' + #13#10 +
      'CondensedMI.Caption=Condensado' + #13#10 +
      'WideMI.Caption=Largo' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=Cancelar' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('crSubtotal', 'Subtotal');
    Add('crNone', 'Nenhum');
    Add('crSum', 'Soma');
    Add('crMin', 'Min');
    Add('crMax', 'Max');
    Add('crAvg', 'M�dia');
    Add('crCount', 'Contagem');
    Add('crAsc', 'A-Z');
    Add('crDesc', 'Z-A');
    Add('crRepHdrs', 'Reimprimir Cabe�alhos');
    Add('crBorder', 'Limites');
    Add('crDown', 'Para baixo, depois transversalmente');

    Add('TfrxExprEditorForm',
      'Caption=Editor de Express�es' + #13#10 +
      'ExprL.Caption=Express�o:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=Display Formato' + #13#10 +
      'CategoryL.Caption=Categoria' + #13#10 +
      'FormatL.Caption=Formato' + #13#10 +
      'FormatStrL.Caption=Formato(string):' + #13#10 +
      'SeparatorL.Caption=Separador Decimal:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');
    Add('fkText', 'Texto (sem formata��o)');
    Add('fkNumber', 'N�mero');
    Add('fkDateTime', 'Data/Hora');
    Add('fkBoolean', 'L�gico');
    Add('fkNumber1', '1234.5;%g');
    Add('fkNumber2', '1234.50;%2.2f');
    Add('fkNumber3', '1,234.50;%2.2n');
    Add('fkNumber4', '$1,234.50;%2.2m');
    Add('fkDateTime1', '11.28.2002;mm.dd.yyyy');
    Add('fkDateTime2', '28 nov 2002;dd mmm yyyy');
    Add('fkDateTime3', 'Novembro 28, 2002;mmmm dd, yyyy');
    Add('fkDateTime4', '02:14;hh:mm');
    Add('fkDateTime5', '02:14am;hh:mm am/pm');
    Add('fkDateTime6', '02:14:00;hh:mm:ss');
    Add('fkDateTime7', '02:14am, Novembro 28, 2002;hh:mm am/pm, mmmm dd, yyyy');
    Add('fkBoolean1', '0,1;0,1');
    Add('fkBoolean2', 'N�o,Sim;N�o,Sim');
    Add('fkBoolean3', '_,x;_,x');
    Add('fkBoolean4', 'Falso,Verdadeiro;Falso,Verdadeiro');

    Add('TfrxHighlightEditorForm',
      'Caption=Destaque' + #13#10 +
      'FontColorB.Caption=Cor...' + #13#10 +
      'BackColorB.Caption=Cor...' + #13#10 +
      'ConditionL.Caption= Condi��o ' + #13#10 +
      'FontL.Caption= Letra ' + #13#10 +
      'BackgroundL.Caption= Fundo ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'BoldCB.Caption=Negrito' + #13#10 +
      'ItalicCB.Caption=Italico' + #13#10 +
      'UnderlineCB.Caption=Sublinhado' + #13#10 +
      'TransparentRB.Caption=Transparente' + #13#10 +
      'OtherRB.Caption=Outro' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Configura��o do Relat�rio' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'GeneralTS.Caption=Geral' + #13#10 +
      'ReportSettingsL.Caption= Configura��o da Impressora ' + #13#10 +
      'CopiesL.Caption=C�pias' + #13#10 +
      'GeneralL.Caption= Geral ' + #13#10 +
      'PasswordL.Caption=Password' + #13#10 +
      'CollateCB.Caption=Agrupar c�pias' + #13#10 +
      'DoublePassCB.Caption=Duplo passo' + #13#10 +
      'PrintIfEmptyCB.Caption=Imprimir mesmo vazio' + #13#10 +
      'DescriptionTS.Caption=Descri��o' + #13#10 +
      'NameL.Caption=Nome' + #13#10 +
      'Description1L.Caption=Descri��o' + #13#10 +
      'PictureL.Caption=Figura' + #13#10 +
      'AuthorL.Caption=Autor' + #13#10 +
      'MajorL.Caption=Maior' + #13#10 +
      'MinorL.Caption=Menor' + #13#10 +
      'ReleaseL.Caption=Release' + #13#10 +
      'BuildL.Caption=Compila��o' + #13#10 +
      'CreatedL.Caption=Criado' + #13#10 +
      'ModifiedL.Caption=Modificado' + #13#10 +
      'DescriptionL.Caption= Descri��o ' + #13#10 +
      'VersionL.Caption= Vers�o ' + #13#10 +
      'PictureB.Caption=Procurar...' + #13#10 +
      '');
    Add('rePrnOnPort', 'on');

    Add('TfrxStringsEditorForm',
      'Caption=Linhas' + #13#10 +
      'CancelB.Hint=Cancelar' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=Cancelar' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=Password' + #13#10 +
      'PasswordL.Caption=Escreva a password:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=Editor de Estilos' + #13#10 +
      'ColorB.Caption=Cor...' + #13#10 +
      'FontB.Caption=Letra...' + #13#10 +
      'FrameB.Caption=Limites...' + #13#10 +
      'AddB.Hint=Adicionar' + #13#10 +
      'DeleteB.Hint=Apagar' + #13#10 +
      'EditB.Hint=Editar' + #13#10 +
      'LoadB.Hint=Carregar' + #13#10 +
      'SaveB.Hint=Guardar' + #13#10 +
      'CancelB.Hint=Cancelar' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=Editor de Limites' + #13#10 +
      'FrameL.Caption=Limites' + #13#10 +
      'LineL.Caption=Linha' + #13#10 +
      'ShadowL.Caption=Sombra' + #13#10 +
      'FrameTopB.Hint=Linha Superior' + #13#10 +
      'FrameBottomB.Hint=Linha Inferior' + #13#10 +
      'FrameLeftB.Hint=Linha Esquerda' + #13#10 +
      'FrameRightB.Hint=Linha Direita' + #13#10 +
      'FrameAllB.Hint=Todas as linhas' + #13#10 +
      'FrameNoB.Hint=Sem limites' + #13#10 +
      'FrameColorB.Hint=Cor dos limites' + #13#10 +
      'FrameStyleB.Hint=Estilo de Limites' + #13#10 +
      'FrameWidthCB.Hint=Largura dos Limites' + #13#10 +
      'ShadowB.Hint=Sombra' + #13#10 +
      'ShadowColorB.Hint=Cor da Sombra' + #13#10 +
      'ShadowWidthCB.Hint=Largura da Sombra' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=Novo Item' + #13#10 +
      'ItemsTab.Caption=Itens' + #13#10 +
      'TemplatesTab.Caption=Modelos' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Ordem das Tabula��es' + #13#10 +
      'Label1.Caption=Controlos listados por ordem de tabula��o:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'UpB.Caption=Para cima' + #13#10 +
      'DownB.Caption=Para baixo' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Avaliar' + #13#10 +
      'Label1.Caption=Express�o' + #13#10 +
      'Label2.Caption=Resultado' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Assistente de Relat�rios' + #13#10 +
      'DataTab.Caption=Dados' + #13#10 +
      'GroupsTab.Caption=Grupos' + #13#10 +
      'LayoutTab.Caption=Configura��o' + #13#10 +
      'StyleTab.Caption=Estilo' + #13#10 +
      'Step1L.Caption=Step 1. Seleccione o conjunto de dados e campos a apresentar.' + #13#10 +
      'Step2L.Caption=Step 2. Crie os grupos (opcional).' + #13#10 +
      'Step3L.Caption=Step 3. Defina a orienta��o da p�gina e o posicionamento dos dados.' + #13#10 +
      'Step4L.Caption=Step 4. Escolha o estilo de relat�rio.' + #13#10 +
      'AddFieldB.Caption=Adicionar >' + #13#10 +
      'AddAllFieldsB.Caption=Adicionar todos>>' + #13#10 +
      'RemoveFieldB.Caption=< Remover' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Remover todos' + #13#10 +
      'AddGroupB.Caption=Adicionar >' + #13#10 +
      'RemoveGroupB.Caption=< Remover' + #13#10 +
      'SelectedFieldsL.Caption=Campos seleccionados:' + #13#10 +
      'AvailableFieldsL.Caption=Campos dispon�veis:' + #13#10 +
      'GroupsL.Caption=Grupos:' + #13#10 +
      'OrientationL.Caption= Orienta��o ' + #13#10 +
      'LayoutL.Caption=Layout   ' + #13#10 +
      'PortraitRB.Caption=Retrato' + #13#10 +
      'LandscapeRB.Caption=Paisagem' + #13#10 +
      'TabularRB.Caption=Tabular' + #13#10 +
      'ColumnarRB.Caption=Em colunas' + #13#10 +
      'FitWidthCB.Caption=Ajustar campos � largura da p�gina' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'BackB.Caption=<< Anterior' + #13#10 +
      'NextB.Caption=Seguinte >>' + #13#10 +
      'FinishB.Caption=Terminar' + #13#10 +
      '');
    Add('wzStd', 'Assistente Padr�o de Relat�rios');
    Add('wzDMP', 'Assistente de Relat�rios para Imp. Matricial');
    Add('wzStdEmpty', 'Relat�rio Padr�o');
    Add('wzDMPEmpty', 'Relat�rio Matricial');


    Add('ftAllFiles', 'Todos os Ficheiros');
    Add('ftPictures', 'Figuras');
    Add('ftDB', 'Bases de Dados');
    Add('ftRichFile', 'Ficheiro RichText');
    Add('ftTextFile', 'Ficheiro de texto');

    Add('prNotAssigned', '(N�o atribu�do)');
    Add('prInvProp', 'Valor inv�lido da propriedade');
    Add('prDupl', 'Nome duplicado');
    Add('prPict', '(Figura)');

    Add('mvExpr', 'Permitir Express�es');
    Add('mvStretch', 'Esticar');
    Add('mvStretchToMax', 'Esticar at� Altura M�xima');
    Add('mvShift', 'Deslocar');
    Add('mvShiftOver', 'Deslocar quando sobreposto');
    Add('mvVisible', 'Vis�vel');
    Add('mvPrintable', 'Imprim�vel');
    Add('mvFont', 'Letra...');
    Add('mvFormat', 'Formato...');
    Add('mvClear', 'Limpar conte�do');
    Add('mvAutoWidth', 'Largura auto');
    Add('mvWWrap', 'Quebrar linhas');
    Add('mvSuppress', 'Suprimir valores repetidos');
    Add('mvHideZ', 'Esconder zeros');
    Add('mvHTML', 'Permitir HTML');
    Add('lvDiagonal', 'Diagonal');
    Add('pvAutoSize', 'Tamanho auto');
    Add('pvCenter', 'Centrar');
    Add('pvAspect', 'Manter proporcionalidade');
    Add('bvSplit', 'Permitir separa��o');
    Add('bvKeepChild', 'Manter filha unida');
    Add('bvPrintChild', 'Imprimir filha se invis�vel');
    Add('bvStartPage', 'Iniciar nova p�gina');
    Add('bvPrintIfEmpty', 'Imprimir se detalhe vazio');
    Add('bvKeepDetail', 'Manter detalhe unido');
    Add('bvKeepFooter', 'Manter rodap� unido');
    Add('bvReprint', 'Reimprimir na nova p�gina');
    Add('bvOnFirst', 'Imprimir na primeira p�gina');
    Add('bvOnLast', 'Imprimir na �ltima p�gina');
    Add('bvKeepGroup', 'Manter Junto');
    Add('bvFooterAfterEach', 'Rodap� depois de cada linha');
    Add('srParent', 'Imprimir no Pai');
    Add('bvKeepHeader', 'Manter Cabe�alho Junto');

    Add('obCatDraw', 'Desenho');
    Add('obCatOther', 'Outros objectos');
    Add('obCatOtherControls', 'Outros Controlos');
    Add('obDiagLine', 'Linha Diagonal');
    Add('obRect', 'Rect�ngulo');
    Add('obRoundRect', 'Rect�ngulo Arredondado');
    Add('obEllipse', 'Elipse');
    Add('obTrian', 'Tri�ngulo');
    Add('obDiamond', 'Diamante');
    Add('obLabel', 'R�tulo');
    Add('obEdit', 'Caixa de Texto');
    Add('obMemoC', 'Notas');
    Add('obButton', 'Bot�o');
    Add('obChBoxC', 'Caixa de verifica��o');
    Add('obRButton', 'Bot�o de op��o');
    Add('obLBox', 'Lista');
    Add('obCBox', 'Caixa de combina��o');
    Add('obDateEdit', 'Editor de datas');
    Add('obImageC', 'Imagem');
    Add('obPanel', 'Painel');
    Add('obGrBox', 'Caixa de Grupo');
    Add('obBBtn', 'Bot�o com imagem');
    Add('obSBtn', 'Bot�o r�pido');
    Add('obMEdit', 'M�scara de edi��o');
    Add('obChLB', 'Lista de Verifica��o');
    Add('obDBLookup', 'Caixa de pesquisa BD');
    Add('obBevel', 'Cercadura');
    Add('obShape', 'Forma');
    Add('obText', 'Texto');
    Add('obSysText', 'Texto do Sistema');
    Add('obLine', 'Linha');
    Add('obPicture', 'Figura');
    Add('obBand', 'Banda');
    Add('obDataBand', 'Banda de dados');
    Add('obSubRep', 'Sub-Relat�rio');
    Add('obDlgPage', 'Formul�rio de Di�logo');
    Add('obRepPage', 'P�gina de Relat�rio');
    Add('obReport', 'Relat�rio');
    Add('obRich', 'Texto com formata��o');
    Add('obOLE', 'Objecto OLE');
    Add('obChBox', 'Caixa de Verifica��o');
    Add('obChart', 'Gr�fico');
    Add('obBarC', 'C�digo de Barras');
    Add('obCross', 'Grelha Cross-tab');
    Add('obDBCross', 'Grelha Cross-tab BD');
    Add('obGrad', 'Gradiente');
    Add('obDMPText', 'Texto Matricial');
    Add('obDMPLine', 'Linha Matricial');
    Add('obBDEDB', 'Base de Dados BDE');
    Add('obBDETb', 'Tabela BDE');
    Add('obBDEQ', 'Query BDE');
    Add('obBDEComps', 'Componentes BDE');
    Add('obIBXDB', 'Base de Dados IBX');
    Add('obIBXTb', 'Tabela IBX');
    Add('obIBXQ', 'Query IBX');
    Add('obIBXComps', 'Componentes IBX');
    Add('obADODB', 'Base de Dados ADO');
    Add('obADOTb', 'Tabela ADO');
    Add('obADOQ', 'Query ADO');
    Add('obADOComps', 'Componentes ADO');
    Add('obDBXDB', 'Base de Dados DBX');
    Add('obDBXTb', 'Tabelas DBX');
    Add('obDBXQ', 'Query DBX');
    Add('obDBXComps', 'Componentes DBX');

    Add('ctString', 'Texto');
    Add('ctDate', 'Data e Hora');
    Add('ctConv', 'Convers�o');
    Add('ctFormat', 'Formata��o');
    Add('ctMath', 'Matem�ticas');
    Add('ctOther', 'Outras');

    Add('IntToStr', 'Converte um n�mero inteiro para texto');
    Add('FloatToStr', 'Converte um n�mero para texto');
    Add('DateToStr', 'Converte uma data para texto');
    Add('TimeToStr', 'Converte uma hora para texto');
    Add('DateTimeToStr', 'Converte uma data-e-hora para texto');
    Add('VarToStr', 'Converte um valor "variant" para texto');
    Add('StrToInt', 'Converte texto num n�mero inteiro');
    Add('StrToFloat', 'Converte texto num n�mero');
    Add('StrToDate', 'Converte texto numa data');
    Add('StrToTime', 'Converte texto numa hora');
    Add('StrToDateTime', 'Converte texto para uma data-e-hora');
    Add('Format', 'Devolve texto formatado a partir de uma lista de argumentos');
    Add('FormatFloat', 'Formata n�meros em ponto flutuante');
    Add('FormatDateTime', 'Formata valores data-e-hora');
    Add('FormatMaskText', 'Devolve texto formatado usando uma m�scara de edi��o');
    Add('EncodeDate', 'Devolve um valor TDateTime a partir do Ano, M�s, Dia');
    Add('DecodeDate', 'Separa um valor TDateTime em Ano, M�s, Dia');
    Add('EncodeTime', 'Devolve um valor TDateTime a partir de Hora, Min, Seg, MSeg');
    Add('DecodeTime', 'Separa um valor TDateTime em horas, minutos, segundos, e milisegundos');
    Add('Date', 'Devolve a data actual');
    Add('Time', 'Devolve a hora actual');
    Add('Now', 'Devolve a data e hora actuais');
    Add('DayOfWeek', 'Devolve o dia da semana para a data especificada');
    Add('IsLeapYear', 'Indica se um ano � bissexto');
    Add('DaysInMonth', 'Devolve o n�mero de dias de um m�s');
    Add('Length', 'Devolve o comprimento do texto');
    Add('Copy', 'Devolve uma parte de uma cadeia de caracteres');
    Add('Pos', 'Devolve a posi��o de um texto dentro de outro');
    Add('Delete', 'Remove um texto de outro');
    Add('Insert', 'Insere um texto em outro');
    Add('Uppercase', 'Converte todos os caracteres para mai�sculas');
    Add('Lowercase', 'Converte todos os caracteres para min�sculas');
    Add('Trim', 'Remove os espa�os iniciais e finais de um texto');
    Add('NameCase', 'Converte o primeiro car�cter de cada palavra para mai�scula');
    Add('CompareText', 'Compara dois textos');
    Add('Chr', 'Converte um n�mero inteiro para um car�cter');
    Add('Ord', 'Converte um car�cter para um n�mero inteiro');
    Add('SetLength', 'Especifica o comprimento de um texto');
    Add('Round', 'Arredonda um n�mero para o valor inteiro mais pr�ximo');
    Add('Trunc', 'Trunca um n�mero para o inteiro imediatamente inferior');
    Add('Int', 'Devolve a parte inteira de um n�mero');
    Add('Frac', 'Devolve a parte fraccion�ria de um n�mero');
    Add('Sqrt', 'Devolve a ra�z quadrada de um n�mero');
    Add('Abs', 'Devolve o valor absoluto');
    Add('Sin', 'Devolve o seno de um �ngulo (em radianos)');
    Add('Cos', 'Devolve o coseno de um �ngulo (em radianos)');
    Add('ArcTan', 'Devolve o arco-tangente');
    Add('Tan', 'Devolve a tangente de um �ngulo');
    Add('Exp', 'Devolve o exponencial');
    Add('Ln', 'Devolve o logaritmo natural de um n�mero');
    Add('Pi', 'Devolve o valor 3.1415926...');
    Add('Inc', 'Incrementa um valor');
    Add('Dec', 'Decrementa um valor');
    Add('RaiseException', 'Gera uma excep��o');
    Add('ShowMessage', 'Mostra uma mensagem');
    Add('Randomize', 'Inicializa o gerador de n�meros aleat�rios');
    Add('Random', 'Devolve um n�mero aleat�rio');
    Add('ValidInt', 'Devolve "Verdadeiro" se o texto cont�m um n�mero inteiro v�lido');
    Add('ValidFloat', 'Devolve "Verdadeiro" se o texto cont�m um n�mero v�lido');
    Add('ValidDate', 'Devolve "Verdadeiro" se o texto cont�m uma data v�lida');
    Add('IIF', 'Devolve "Verdadeiro" se a express�o � verdadeira, caso contr�rio devolve "Falso"');
    Add('Get', 'Apenas para uso interno');
    Add('Set', 'Apenas para uso interno');
    Add('InputBox', 'Mostra uma caixa que permite digitar um texto');
    Add('InputQuery', 'Mostra uma caixa que permite digitar um texto');
    Add('MessageDlg', 'Mostra uma mensagem');
    Add('CreateOleObject', 'Cria um objecto OLE');
    Add('VarArrayCreate', 'Cria um "variant array"');
    Add('VarType', 'Devolve o tipo de um valor "variant"');
    Add('DayOf', 'Devolve o dia (1..31) de uma data');
    Add('MonthOf', 'Devolve o m�s (1..12) de uma data');
    Add('YearOf', 'Devolve o ano de uma data');

    Add('ctAggregate', 'Estat�sticas');
    Add('Sum', 'Calcula a soma de <Expr> para a linha de dados da banda');
    Add('Avg', 'Calcula a m�dia de <Expr> para a linha de dados da banda');
    Add('Min', 'Calcula o m�nimo de <Expr> para a linha de dados da banda');
    Add('Max', 'Calcula o m�ximo de <Expr> para a linha de dados da banda');
    Add('Count', 'Calcula o n�mero de linhas de dados');
  end;
end;


initialization
  frAddDesignerRes;

end.