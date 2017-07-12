
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
      'Caption=Inspetor de Objetos' + #13#10 +
      '');
    Add('oiProp', 'Propriedades');
    Add('oiEvent', 'Eventos');

    Add('TfrxDataTreeForm',
      'Caption=�rvore de Dados' + #13#10 +
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
      'Caption=�rvore de Relat�rio' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Abrir Arquivo de Script' + #13#10 +
      'SaveScriptB.Hint=Salvar Script para Arquivo' + #13#10 +
      'RunScriptB.Hint=Executar Script' + #13#10 +
      'StepScriptB.Hint=Seguir Dentro' + #13#10 +
      'StopScriptB.Hint=Finalizar Script' + #13#10 +
      'EvaluateB.Hint=Avaliar' + #13#10 +
      'LangL.Caption=Linguagem:' + #13#10 +
      'AlignTB.Caption=Alinhar' + #13#10 +
      'AlignLeftsB.Hint=Alinhar � Esquerda' + #13#10 +
      'AlignHorzCentersB.Hint=Centralizar' + #13#10 +
      'AlignRightsB.Hint=Alinhar � Direita' + #13#10 +
      'AlignTopsB.Hint=Alinhar Acima' + #13#10 +
      'AlignVertCentersB.Hint=Centralizar Verticalmente' + #13#10 +
      'AlignBottomsB.Hint=Alinhar Abaixo' + #13#10 +
      'SpaceHorzB.Hint=Espa�amento Horizontal' + #13#10 +
      'SpaceVertB.Hint=Espa�amento Vertical' + #13#10 +
      'CenterHorzB.Hint=Centralizar Horizontalmente na Banda' + #13#10 +
      'CenterVertB.Hint=Centralizar Verticalmente na Banda' + #13#10 +
      'SameWidthB.Hint=Mesma Largura' + #13#10 +
      'SameHeightB.Hint=Mesma Altura' + #13#10 +
      'TextTB.Caption=Texto' + #13#10 +
      'StyleCB.Hint=Estilo' + #13#10 +
      'FontNameCB.Hint=Nome da Fonte' + #13#10 +
      'FontSizeCB.Hint=Tamanho da Fonte' + #13#10 +
      'BoldB.Hint=Negrito' + #13#10 +
      'ItalicB.Hint=It�lico' + #13#10 +
      'UnderlineB.Hint=Sublinhado' + #13#10 +
      'FontColorB.Hint=Cor da Fonte' + #13#10 +
      'HighlightB.Hint=Destaque' + #13#10 +
      'RotateB.Hint=Rota��o do Texto' + #13#10 +
      'TextAlignLeftB.Hint=Alinhar � Esquerda' + #13#10 +
      'TextAlignCenterB.Hint=Centralizar' + #13#10 +
      'TextAlignRightB.Hint=Alinhar � Direita' + #13#10 +
      'TextAlignBlockB.Hint=Justificar' + #13#10 +
      'TextAlignTopB.Hint=Alinhar Acima' + #13#10 +
      'TextAlignMiddleB.Hint=Centralizar Verticalmente' + #13#10 +
      'TextAlignBottomB.Hint=Alinhar Abaixo' + #13#10 +
      'FrameTB.Caption=Borda' + #13#10 +
      'FrameTopB.Hint=Linha Acima' + #13#10 +
      'FrameBottomB.Hint=Linha Abaixo' + #13#10 +
      'FrameLeftB.Hint=Linha � Esquerda' + #13#10 +
      'FrameRightB.Hint=Linha � Direita' + #13#10 +
      'FrameAllB.Hint=Todas as Linhas da Borda' + #13#10 +
      'FrameNoB.Hint=Sem Borda' + #13#10 +
      'ShadowB.Hint=Sombra' + #13#10 +
      'FillColorB.Hint=Cor de Fundo' + #13#10 +
      'FrameColorB.Hint=Cor da Borda' + #13#10 +
      'FrameStyleB.Hint=Estilo da Borda' + #13#10 +
      'FrameWidthCB.Hint=Largura da Borda' + #13#10 +
      'StandardTB.Caption=Padr�o' + #13#10 +
      'NewB.Hint=Novo Relat�rio' + #13#10 +
      'OpenB.Hint=Abrir Relat�rio' + #13#10 +
      'SaveB.Hint=Salvar Relat�rio' + #13#10 +
      'PreviewB.Hint=Visualizar' + #13#10 +
      'NewPageB.Hint=Nova P�gina de Relat�rio' + #13#10 +
      'NewDialogB.Hint=Nova P�gina de Di�logo' + #13#10 +
      'DeletePageB.Hint=Remover P�gina' + #13#10 +
      'PageSettingsB.Hint=Configura��es da P�gina' + #13#10 +
      'VariablesB.Hint=Vari�veis' + #13#10 +
      'CutB.Hint=Recortar' + #13#10 +
      'CopyB.Hint=Copiar' + #13#10 +
      'PasteB.Hint=Colar' + #13#10 +
      'SampleFormatB.Hint=Copiar Formata��o' + #13#10 +
      'UndoB.Hint=Desfazer' + #13#10 +
      'RedoB.Hint=Refazer' + #13#10 +
      'ShowGridB.Hint=Mostrar Grade' + #13#10 +
      'AlignToGridB.Hint=Alinhar na Grade' + #13#10 +
      'SetToGridB.Hint=Ajustar � Grade' + #13#10 +
      'ScaleCB.Hint=Zoom' + #13#10 +
      'ExtraToolsTB.Caption=Ferramentas Extra' + #13#10 +
      'ObjectSelectB.Hint=Selecionar Ferramenta' + #13#10 +
      'HandToolB.Hint=Ferramenta M�o' + #13#10 +
      'ZoomToolB.Hint=Ferramenta Zoom' + #13#10 +
      'TextToolB.Hint=Ferramenta Editar Texto' + #13#10 +
      'FormatToolB.Hint=Ferramenta Copiar Formata��o' + #13#10 +
      'ObjectBandB.Hint=Inserir Banda' + #13#10 +
      'FileMenu.Caption=&Arquivo' + #13#10 +
      'EditMenu.Caption=&Editar' + #13#10 +
      'FindMI.Caption=Localizar...' + #13#10 +
      'FindNextMI.Caption=Localizar Pr�ximo' + #13#10 +
      'ReplaceMI.Caption=Substituir...' + #13#10 +
      'ReportMenu.Caption=&Relat�rio' + #13#10 +
      'ReportDataMI.Caption=Dados...' + #13#10 +
      'ReportSettingsMI.Caption=Op��es...' + #13#10 +
      'ReportStylesMI.Caption=Estilo...' + #13#10 +
      'ViewMenu.Caption=E&xibir' + #13#10 +
      'ToolbarsMI.Caption=Barras de Ferramentas' + #13#10 +
      'StandardMI.Caption=Padr�o' + #13#10 +
      'TextMI.Caption=Texto' + #13#10 +
      'FrameMI.Caption=Borda' + #13#10 +
      'AlignmentMI.Caption=Paleta de Alinhamento' + #13#10 +
      'ToolsMI.Caption=Ferramentas Extra' + #13#10 +
      'InspectorMI.Caption=Inspetor de Objetos' + #13#10 +
      'DataTreeMI.Caption=�rvore de Dados' + #13#10 +
      'ReportTreeMI.Caption=�rvore de Relat�rio' + #13#10 +
      'ShowRulersMI.Caption=R�guas' + #13#10 +
      'ShowGuidesMI.Caption=Guias' + #13#10 +
      'DeleteGuidesMI.Caption=Remover Guias' + #13#10 +
      'OptionsMI.Caption=Op��es...' + #13#10 +
      'HelpMenu.Caption=Aj&uda' + #13#10 +
      'HelpContentsMI.Caption=Conte�do da Ajuda...' + #13#10 +
      'AboutMI.Caption=Sobre o FastReport...' + #13#10 +
      'TabOrderMI.Caption=Ordem de Tabula��o...' + #13#10 +
      'UndoCmd.Caption=Desfazer' + #13#10 +
      'RedoCmd.Caption=Refazer' + #13#10 +
      'CutCmd.Caption=Recortar' + #13#10 +
      'CopyCmd.Caption=Copiar' + #13#10 +
      'PasteCmd.Caption=Colar' + #13#10 +
      'DeleteCmd.Caption=Remover' + #13#10 +
      'DeletePageCmd.Caption=Remover P�gina' + #13#10 +
      'SelectAllCmd.Caption=Selecionar Tudo' + #13#10 +
      'EditCmd.Caption=Editar...' + #13#10 +
      'BringToFrontCmd.Caption=Trazer para Frente' + #13#10 +
      'SendToBackCmd.Caption=Enviar para Tr�s' + #13#10 +
      'NewItemCmd.Caption=Novo...' + #13#10 +
      'NewReportCmd.Caption=Novo Relat�rio' + #13#10 +
      'NewPageCmd.Caption=Nova P�gina' + #13#10 +
      'NewDialogCmd.Caption=Novo Di�logo' + #13#10 +
      'OpenCmd.Caption=Abrir...' + #13#10 +
      'SaveCmd.Caption=Salvar' + #13#10 +
      'SaveAsCmd.Caption=Salvar como...' + #13#10 +
      'VariablesCmd.Caption=Vari�veis...' + #13#10 +
      'PageSettingsCmd.Caption=Configura��es da P�gina...' + #13#10 +
      'PreviewCmd.Caption=Visualizar' + #13#10 +
      'ExitCmd.Caption=Sair' + #13#10 +
      'ReportTitleMI.Caption=T�tulo do Relat�rio' + #13#10 +
      'ReportSummaryMI.Caption=Sum�rio do Relat�rio' + #13#10 +
      'PageHeaderMI.Caption=Cabe�alho da P�gina' + #13#10 +
      'PageFooterMI.Caption=Rodap� da P�gina' + #13#10 +
      'HeaderMI.Caption=Cabe�alho' + #13#10 +
      'FooterMI.Caption=Rodap�' + #13#10 +
      'MasterDataMI.Caption=Dados Mestre' + #13#10 +
      'DetailDataMI.Caption=Dados de Detalhe' + #13#10 +
      'SubdetailDataMI.Caption=Dados de Sub-detalhe' + #13#10 +
      'Data4levelMI.Caption=Dados 4o. n�vel' + #13#10 +
      'Data5levelMI.Caption=Dados 5o. n�vel' + #13#10 +
      'Data6levelMI.Caption=Dados 6o. n�vel' + #13#10 +
      'GroupHeaderMI.Caption=Cabe�alho de Grupo' + #13#10 +
      'GroupFooterMI.Caption=Rodap� de Grupo' + #13#10 +
      'ChildMI.Caption=Filha' + #13#10 +
      'ColumnHeaderMI.Caption=Cabe�alho de Coluna' + #13#10 +
      'ColumnFooterMI.Caption=Rodap� de Coluna' + #13#10 +
      'OverlayMI.Caption=Overlay' + #13#10 +
      'VerticalbandsMI.Caption=Bandas Vericais' + #13#10 +
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
      'FontB.Hint=Configura��es da Fonte' + #13#10 +
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
      'OpenScriptDialog.Filter=Arquivos Pascal (*.pas)|*.pas|Arquivos C++ (*.cpp)|*.cpp|Arquivos JavaScript (*.js)|*.js|Arquivos Basic (*.vb)|*.vb|Todos os arquivos|*.*' + #13#10 +
      'SaveScriptDialog.Filter=Arquivos Pascal (*.pas)|*.pas|Arquivos C++ (*.cpp)|*.cpp|Arquivos JavaScript (*.js)|*.js|Arquivos Basic (*.vb)|*.vb|Todos os arquivos|*.*' + #13#10 +
      'GroupB.Hint=Group' + #13#10 +
      'UngroupB.Hint=Ungroup' + #13#10 +
      'GroupCmd.Caption=Group' + #13#10 +
      'UngroupCmd.Caption=Ungroup' + #13#10 +
      '');
    Add('dsCm', 'Cent�metros');
    Add('dsInch', 'Polegadas');
    Add('dsPix', 'Pixels');
    Add('dsChars', 'Caracteres');
    Add('dsCode', 'C�digo');
    Add('dsPage', 'P�gina');
    Add('dsRepFilter', 'Relat�rio (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'Relat�rio compactado (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', 'Salvar altera��es para a p�gina de visualiza��o?');
    Add('dsSaveChangesTo', 'Salvar altera��es para ');
    Add('dsCantLoad', 'Imposs�vel carregar arquivo');
    Add('dsStyleFile', 'Estilo');
    Add('dsCantFindProc', 'Imposs�vel localizar o procedimento principal.');
    Add('dsClearScript', 'Isso limpar� todo o c�digo. Deseja continuar?');
    Add('dsNoStyle', 'Nenhum estilo');
    Add('dsStyleSample', 'Exemplo de estilo');
    Add('dsTextNotFound', 'Texto ''%s'' n�o encontrado');
    Add('dsReplace', 'Substituir esta ocorr�ncia de ''%s''?');

    Add('TfrxAboutForm',
      'Caption=Sobre o FastReport' + #13#10 +
      'Label4.Caption=Visite nossa p�gina para mais informa��es:' + #13#10 +
      'Label6.Caption=Vendas:' + #13#10 +
      'Label8.Caption=Suporte:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Op��es da P�gina' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'TabSheet1.Caption=Papel' + #13#10 +
      'Label1.Caption=Largura' + #13#10 +
      'Label2.Caption=Altura' + #13#10 +
      'Label11.Caption=Tamanho   ' + #13#10 +
      'Label12.Caption=Orienta��o   ' + #13#10 +
      'Label3.Caption=Esquerda' + #13#10 +
      'Label4.Caption=Superior' + #13#10 +
      'Label5.Caption=Direita' + #13#10 +
      'Label6.Caption=Inferior' + #13#10 +
      'Label13.Caption=Margens   ' + #13#10 +
      'Label14.Caption=Origem do Papel   ' + #13#10 +
      'Label9.Caption=Primeira p�gina' + #13#10 +
      'Label10.Caption=Outras p�ginas' + #13#10 +
      'PortraitRB.Caption=Retrato' + #13#10 +
      'LandscapeRB.Caption=Paisagem' + #13#10 +
      'TabSheet3.Caption=Outras Op��es' + #13#10 +
      'Label7.Caption=Colunas   ' + #13#10 +
      'Label8.Caption=N�mero' + #13#10 +
      'Label15.Caption=Largura' + #13#10 +
      'Label16.Caption=Posi��es' + #13#10 +
      'Label17.Caption=Outros   ' + #13#10 +
      'Label18.Caption=Duplex' + #13#10 +
      'PrintOnPrevCB.Caption=Imprimir para p�gina anterior' + #13#10 +
      'MirrorMarginsCB.Caption=Margens espelho' + #13#10 +
      'LargeHeightCB.Caption=Altura extensa em modo de design' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Escolha os Datasets do Relat�rio' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Editar Vari�veis' + #13#10 +
      'NewCategoryB.Caption=Categoria' + #13#10 +
      'NewVarB.Caption=Vari�vel' + #13#10 +
      'EditB.Caption=Editar' + #13#10 +
      'DeleteB.Caption=Remover' + #13#10 +
      'EditListB.Caption=Lista' + #13#10 +
      'LoadB.Caption=Carregar' + #13#10 +
      'SaveB.Caption=Salvar' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'ExprPanel.Caption= Express�o:' + #13#10 +
      'OpenDialog1.Filter=Dicion�rio (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Dicion�rio (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(nenhuma vari�vel definida)');
    Add('vaVar', 'Vari�veis');
    Add('vaDupName', 'Nome duplicado');

    Add('TfrxOptionsEditor',
      'Caption=Op��es do Designer' + #13#10 +
      'Label1.Caption=Grade   ' + #13#10 +
      'Label2.Caption=Tipo' + #13#10 +
      'Label3.Caption=Tamanho' + #13#10 +
      'Label4.Caption=Formul�rio de di�logo:' + #13#10 +
      'Label5.Caption=Outros   ' + #13#10 +
      'Label6.Caption=Fontes   ' + #13#10 +
      'Label7.Caption=Janela de C�digo' + #13#10 +
      'Label8.Caption=Editor de Memo' + #13#10 +
      'Label9.Caption=Tamanho' + #13#10 +
      'Label10.Caption=Tamanho' + #13#10 +
      'Label11.Caption=Cores   ' + #13#10 +
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
      'ShowGridCB.Caption=Mostrar grade' + #13#10 +
      'AlignGridCB.Caption=Alinhar na grade' + #13#10 +
      'EditAfterInsCB.Caption=Mostrar o editor ap�s inserir' + #13#10 +
      'ObjectFontCB.Caption=Usar as configura��es de fonte do objeto' + #13#10 +
      'WorkspaceB.Caption=Espa�o de trabalho' + #13#10 +
      'ToolB.Caption=Janelas de Ferramenta' + #13#10 +
      'LCDCB.Caption=Cor da grade LCD' + #13#10 +
      'FreeBandsCB.Caption=Coloca��o livre de bandas' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Restaurar padr�es' + #13#10 +
      'BandsCaptionsCB.Caption=Mostrar r�tulo das bandas' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=Selecionar DataSet' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');
    Add('dbNotAssigned', '[n�o designado]');
    Add('dbSingleLine', 'Linha �nica');

    Add('TfrxGroupEditorForm',
      'Caption=Grupo' + #13#10 +
      'BreakOnL.Caption=Quebrar em   ' + #13#10 +
      'OptionsL.Caption=Op��es   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'DataFieldRB.Caption=Campo de Dados' + #13#10 +
      'ExpressionRB.Caption=Express�es' + #13#10 +
      'KeepGroupTogetherCB.Caption=Manter grupo unido' + #13#10 +
      'StartNewPageCB.Caption=Iniciar nova p�gina' + #13#10 +
      'OutlineCB.Caption=Mostrar no resumo' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=Memo do Sistema' + #13#10 +
      'DataBandL.Caption=Banda de Dados' + #13#10 +
      'DataSetL.Caption=DataSet' + #13#10 +
      'DataFieldL.Caption=Campo' + #13#10 +
      'FunctionL.Caption=Fun��o' + #13#10 +
      'ExpressionL.Caption=Express�o' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'AggregateRB.Caption=Valor agregado' + #13#10 +
      'SysVariableRB.Caption=Vari�vel do sistema' + #13#10 +
      'CountInvisibleCB.Caption=Contar bandas invis�veis' + #13#10 +
      'TextRB.Caption=Texto' + #13#10 +
      'RunningTotalCB.Caption=Total de execu��o' + #13#10 +
      '');
    Add('agAggregate', 'Inserir Agregado');
    Add('vt1', '[DATE]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGES#]');
    Add('vt5', '[PAGE#] de [TOTALPAGES#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=Objeto OLE' + #13#10 +
      'InsertB.Caption=Inserir...' + #13#10 +
      'EditB.Caption=Editar...' + #13#10 +
      'CloseB.Caption=Fechar' + #13#10 +
      '');
    Add('olStretched', 'Esticado');

    Add('TfrxBarcodeEditorForm',
      'Caption=Editor de C�digo de Barras' + #13#10 +
      'CodeLbl.Caption=C�digo' + #13#10 +
      'TypeLbl.Caption=Tipo de Barra' + #13#10 +
      'ZoomLbl.Caption=Zoom:' + #13#10 +
      'OptionsLbl.Caption=Op��es   ' + #13#10 +
      'RotationLbl.Caption=Rota��o   ' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CalcCheckSumCB.Caption=Calcular Soma de Controle ' + #13#10 +
      'ViewTextCB.Caption=Texto' + #13#10 +
      'Rotation0RB.Caption=0�' + #13#10 +
      'Rotation90RB.Caption=90�' + #13#10 +
      'Rotation180RB.Caption=180�' + #13#10 +
      'Rotation270RB.Caption=270�' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Calcular Soma de Controle');
    Add('bcShowText', 'Mostrar Texto');

    Add('TfrxAliasesEditorForm',
      'Caption=Editar Apelidos' + #13#10 +
      'HintL.Caption=Pressione Enter para editar o item' + #13#10 +
      'DSAliasL.Caption=Apelido do Dataset' + #13#10 +
      'FieldAliasesL.Caption=Apelidos dos campos' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'ResetB.Caption=Redefinir' + #13#10 +
      'UpdateB.Caption=Update' + #13#10 +
      '');
    Add('alUserName', 'Nome do usu�rio');
    Add('alOriginal', 'Nome original');

    Add('TfrxParamsEditorForm',
      'Caption=Editor de Par�metros' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');
    Add('qpName', 'Nome');
    Add('qpDataType', 'Tipo de Dado');
    Add('qpValue', 'Valor');

    Add('TfrxMDEditorForm',
      'Caption=Liga��o Mestre-Detalhe' + #13#10 +
      'Label1.Caption=Campos Detalhe' + #13#10 +
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
      'WordWrapB.Hint=Quebrar linhas' + #13#10 +
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
      'Caption=Editor de Gr�fico' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=Adicionar S�rie' + #13#10 +
      'DeleteB.Hint=Remover S�rie' + #13#10 +
      'DBSourceRB.Caption=Dados do BD' + #13#10 +
      'BandSourceRB.Caption=Band source' + #13#10 +
      'FixedDataRB.Caption=Dados fixos' + #13#10 +
      'DatasetLbl.Caption=Dataset' + #13#10 +
      'BandLbl.Caption=Data band' + #13#10 +
      'X1Lbl.Caption=Valores X' + #13#10 +
      'Y1Lbl.Caption=Valores Y' + #13#10 +
      'X2Lbl.Caption=Valores X' + #13#10 +
      'Y2Lbl.Caption=Valores Y' + #13#10 +
      'X3Lbl.Caption=Valores X (por exemplo, a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Valores Y (por exemplo, 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Outras op��es   ' + #13#10 +
      'ShowTopLbl.Caption=TopoN valores' + #13#10 +
      'CaptionLbl.Caption=TopoN r�tulo' + #13#10 +
      'SortLbl.Caption=Ordena��o' + #13#10 +
      'LineMI.Caption=Linha' + #13#10 +
      'AreaMI.Caption=�rea' + #13#10 +
      'PointMI.Caption=Ponto' + #13#10 +
      'BarMI.Caption=Barra' + #13#10 +
      'HorizBarMI.Caption=Barra Horiz.' + #13#10 +
      'PieMI.Caption=Torta' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Linha R�pida' + #13#10 +
      '');
    Add('ch3D', 'Vis�o 3D');
    Add('chAxis', 'Mostrar Eixo');
    Add('chsoNone', 'Nenhum');
    Add('chsoAscending', 'Crescente');
    Add('chsoDescending', 'Decrescente');

    Add('TfrxRichEditorForm',
      'Caption=Editor Rich Text' + #13#10 +
      'OpenB.Hint=Abrir Arquivo' + #13#10 +
      'SaveB.Hint=Salvar Arquivo' + #13#10 +
      'UndoB.Hint=Desfazer' + #13#10 +
      'TTB.Hint=Fonte' + #13#10 +
      'ExprB.Hint=Inserir Express�o' + #13#10 +
      'CancelB.Hint=Cancelar' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      'BoldB.Hint=Negrito' + #13#10 +
      'ItalicB.Hint=It�lico' + #13#10 +
      'UnderlineB.Hint=Sublinhado' + #13#10 +
      'LeftAlignB.Hint=Alinhar � esquerda' + #13#10 +
      'CenterAlignB.Hint=Centralizar' + #13#10 +
      'RightAlignB.Hint=Alinha � direita' + #13#10 +
      'BlockAlignB.Hint=Justificar' + #13#10 +
      'BulletsB.Hint=Marcadores' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Editor Cross-tab' + #13#10 +
      'DatasetL.Caption=Fonte de Dados   ' + #13#10 +
      'DimensionsL.Caption=Dimens�es   ' + #13#10 +
      'RowsL.Caption=Linhas' + #13#10 +
      'ColumnsL.Caption=Colunas' + #13#10 +
      'CellsL.Caption=C�lulas' + #13#10 +
      'StructureL.Caption=Estrutura Cross-tab   ' + #13#10 +
      'RowHeaderCB.Caption=Cabe�alho de Linha' + #13#10 +
      'ColumnHeaderCB.Caption=Cabe�alho de Coluna' + #13#10 +
      'RowTotalCB.Caption=Total geral linha' + #13#10 +
      'ColumnTotalCB.Caption=Total geral coluna' + #13#10 +
      'SwapB.Hint=Trocar linhas/colunas' + #13#10 +
      'StyleCB.Hint=Estilo Cross-tab' + #13#10 +
      'FontB.Hint=Configura��es da Fonte' + #13#10 +
      'AlignLeftB.Hint=Alinhar � esquerda' + #13#10 +
      'AlignCenterB.Hint=Centralizar' + #13#10 +
      'AlignRightB.Hint=Alinhar � direita' + #13#10 +
      'RotationB.Hint=Rota��o do texto' + #13#10 +
      'HighlightB.Hint=Destaque' + #13#10 +
      'FormatB.Hint=Formatar' + #13#10 +
      'FrameB.Hint=Configura��es da Borda' + #13#10 +
      'FillColorB.Hint=Cor de Preenchimento' + #13#10 +
      'Func1MI.Caption=Nenhum' + #13#10 +
      'Func2MI.Caption=Soma' + #13#10 +
      'Func3MI.Caption=Min' + #13#10 +
      'Func4MI.Caption=Max' + #13#10 +
      'Func5MI.Caption=M�dia' + #13#10 +
      'Func6MI.Caption=Contar' + #13#10 +
      'Sort1MI.Caption=Crescente (A-Z)' + #13#10 +
      'Sort2MI.Caption=Decrescente (Z-A)' + #13#10 +
      'Sort3MI.Caption=Sem Ordena��o' + #13#10 +
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
    Add('crSubtotal', 'Sub-total');
    Add('crNone', 'Nenhum');
    Add('crSum', 'Soma');
    Add('crMin', 'Min');
    Add('crMax', 'Max');
    Add('crAvg', 'M�dia');
    Add('crCount', 'Contar');
    Add('crAsc', 'A-Z');
    Add('crDesc', 'Z-A');
    Add('crRepHdrs', 'Imprimir Novamente Cabe�alhos');
    Add('crBorder', 'Limite');
    Add('crDown', 'Para baixo e ent�o transversalmente');

    Add('TfrxExprEditorForm',
      'Caption=Editor de Express�es' + #13#10 +
      'ExprL.Caption=Express�o:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=Formato de Exibi��o' + #13#10 +
      'CategoryL.Caption=Categoria' + #13#10 +
      'FormatL.Caption=Formato' + #13#10 +
      'FormatStrL.Caption=String de formata��o:' + #13#10 +
      'SeparatorL.Caption=Separador decimal:' + #13#10 +
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
      'ConditionL.Caption=Condi��o   ' + #13#10 +
      'FontL.Caption=Fonte   ' + #13#10 +
      'BackgroundL.Caption=Fundo   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'BoldCB.Caption=Negrito' + #13#10 +
      'ItalicCB.Caption=It�lico' + #13#10 +
      'UnderlineCB.Caption=Sublinhado' + #13#10 +
      'TransparentRB.Caption=Transparente' + #13#10 +
      'OtherRB.Caption=Outro' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Configura��o do Relat�rio' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'GeneralTS.Caption=Geral' + #13#10 +
      'ReportSettingsL.Caption=Configura��es da impressora   ' + #13#10 +
      'CopiesL.Caption=C�pias' + #13#10 +
      'GeneralL.Caption=Geral   ' + #13#10 +
      'PasswordL.Caption=Senha' + #13#10 +
      'CollateCB.Caption=Agrupar c�pias' + #13#10 +
      'DoublePassCB.Caption=Dois Passos' + #13#10 +
      'PrintIfEmptyCB.Caption=Imprimir se vazio' + #13#10 +
      'DescriptionTS.Caption=Descri��o' + #13#10 +
      'NameL.Caption=Nome' + #13#10 +
      'Description1L.Caption=Descri��o' + #13#10 +
      'PictureL.Caption=Figura' + #13#10 +
      'AuthorL.Caption=Autor' + #13#10 +
      'MajorL.Caption=Maior' + #13#10 +
      'MinorL.Caption=Menor' + #13#10 +
      'ReleaseL.Caption=Libera��o' + #13#10 +
      'BuildL.Caption=Compila��o' + #13#10 +
      'CreatedL.Caption=Criado' + #13#10 +
      'ModifiedL.Caption=Modificado' + #13#10 +
      'DescriptionL.Caption=Descri��o   ' + #13#10 +
      'VersionL.Caption=Vers�o   ' + #13#10 +
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
      'Caption=Senha' + #13#10 +
      'PasswordL.Caption=Entre com a senha:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=Editor de Estilos' + #13#10 +
      'ColorB.Caption=Cor...' + #13#10 +
      'FontB.Caption=Fonte...' + #13#10 +
      'FrameB.Caption=Borda...' + #13#10 +
      'AddB.Hint=Adicionar' + #13#10 +
      'DeleteB.Hint=Remover' + #13#10 +
      'EditB.Hint=Editar' + #13#10 +
      'LoadB.Hint=Carregar' + #13#10 +
      'SaveB.Hint=Salvar' + #13#10 +
      'CancelB.Hint=Cancelar' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=Editor de Borda' + #13#10 +
      'FrameL.Caption=Borda' + #13#10 +
      'LineL.Caption=Linha da Borda' + #13#10 +
      'ShadowL.Caption=Sombra' + #13#10 +
      'FrameTopB.Hint=Linha Acima' + #13#10 +
      'FrameBottomB.Hint=Linha Abaixo' + #13#10 +
      'FrameLeftB.Hint=Linha � Esquerda' + #13#10 +
      'FrameRightB.Hint=Linha � Direita' + #13#10 +
      'FrameAllB.Hint=Todas as linhas da borda' + #13#10 +
      'FrameNoB.Hint=Sem Borda' + #13#10 +
      'FrameColorB.Hint=Cor da Borda' + #13#10 +
      'FrameStyleB.Hint=Estilo da Borda' + #13#10 +
      'FrameWidthCB.Hint=Largura da Borda' + #13#10 +
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
      'Caption=Ordem de Tabula��o' + #13#10 +
      'Label1.Caption=Controles listados na ordem de tabula��o:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'UpB.Caption=Mover para Cima' + #13#10 +
      'DownB.Caption=Mover para Baixo' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Avaliar' + #13#10 +
      'Label1.Caption=Express�o' + #13#10 +
      'Label2.Caption=Resultado' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Assistente de Relat�rio' + #13#10 +
      'DataTab.Caption=Dados' + #13#10 +
      'GroupsTab.Caption=Grupos' + #13#10 +
      'LayoutTab.Caption=Layout' + #13#10 +
      'StyleTab.Caption=Estilo' + #13#10 +
      'Step1L.Caption=Passo 1. Selecione o conjunto de dados e campos para exibi��o.' + #13#10 +
      'Step2L.Caption=Passo 2. Crie os grupos (opcional).' + #13#10 +
      'Step3L.Caption=Passo 3. Defina a orienta��o da p�gina e posicionamento dos dados.' + #13#10 +
      'Step4L.Caption=Passo 4. Escolha o estilo de relat�rio.' + #13#10 +
      'AddFieldB.Caption=Adicionar >' + #13#10 +
      'AddAllFieldsB.Caption=Adicionar todos >>' + #13#10 +
      'RemoveFieldB.Caption=< Remover' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Remover todos' + #13#10 +
      'AddGroupB.Caption=Adicionar >' + #13#10 +
      'RemoveGroupB.Caption=< Remover' + #13#10 +
      'SelectedFieldsL.Caption=Campos selecionados:' + #13#10 +
      'AvailableFieldsL.Caption=Campos dispon�veis:' + #13#10 +
      'GroupsL.Caption=Grupos:' + #13#10 +
      'OrientationL.Caption=Orienta��o   ' + #13#10 +
      'LayoutL.Caption=Layout   ' + #13#10 +
      'PortraitRB.Caption=Retrato' + #13#10 +
      'LandscapeRB.Caption=Paisagem' + #13#10 +
      'TabularRB.Caption=Tabular' + #13#10 +
      'ColumnarRB.Caption=Em Colunas' + #13#10 +
      'FitWidthCB.Caption=Ajustar campos � largura da p�gina' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'BackB.Caption=<< Voltar' + #13#10 +
      'NextB.Caption=Pr�ximo >>' + #13#10 +
      'FinishB.Caption=Finalizar' + #13#10 +
      '');
    Add('wzStd', 'Assistente de Relat�rio Padr�o');
    Add('wzDMP', 'Assistente de Relat�rio Matricial');
    Add('wzStdEmpty', 'Relat�rio Padr�o');
    Add('wzDMPEmpty', 'Relat�rio Matricial');


    Add('ftAllFiles', 'Todos os arquivos');
    Add('ftPictures', 'Figuras');
    Add('ftDB', 'Bancos de Dados');
    Add('ftRichFile', 'Arquivo RichText');
    Add('ftTextFile', 'Arquivo de Texto');

    Add('prNotAssigned', '(N�o designado)');
    Add('prInvProp', 'Valor de propriedade inv�lido');
    Add('prDupl', 'Nome duplicado');
    Add('prPict', '(Figura)');

    Add('mvExpr', 'Permitir Express�es');
    Add('mvStretch', 'Esticar');
    Add('mvStretchToMax', 'Esticar at� Altura M�xima');
    Add('mvShift', 'Deslocar');
    Add('mvShiftOver', 'Deslocar Quando Sobreposto');
    Add('mvVisible', 'Vis�vel');
    Add('mvPrintable', 'Imprimir');
    Add('mvFont', 'Fonte...');
    Add('mvFormat', 'Formato de Exibi��o...');
    Add('mvClear', 'Limpar Conte�do');
    Add('mvAutoWidth', 'Largura Autom�tica');
    Add('mvWWrap', 'Quebrar Linhas');
    Add('mvSuppress', 'Suprimir Valores Repetidos');
    Add('mvHideZ', 'Esconder Zeros');
    Add('mvHTML', 'Permitir Tags HTML');
    Add('lvDiagonal', 'Diagonal');
    Add('pvAutoSize', 'Tamanho Autom�tico');
    Add('pvCenter', 'Centro');
    Add('pvAspect', 'Manter Proporcionalidade');
    Add('bvSplit', 'Permitir Divis�o');
    Add('bvKeepChild', 'Manter Filha Junto');
    Add('bvPrintChild', 'Imprimir Filha Se Invis�vel');
    Add('bvStartPage', 'Iniciar Nova P�gina');
    Add('bvPrintIfEmpty', 'Imprimir Se Detalhe Vazio');
    Add('bvKeepDetail', 'Manter Detalhe Junto');
    Add('bvKeepFooter', 'Manter Rodap� Junto');
    Add('bvReprint', 'Reimprimir Em Nova P�gina');
    Add('bvOnFirst', 'Imprimir Na Primeira P�gina');
    Add('bvOnLast', 'Imprimir Na �ltima P�gina');
    Add('bvKeepGroup', 'Manter Junto');
    Add('bvFooterAfterEach', 'Rodap� ap�s cada linha');
    Add('srParent', 'Imprimir em Pai');
    Add('bvKeepHeader', 'Keep Header Together');

    Add('obCatDraw', 'Desenhar');
    Add('obCatOther', 'Outros objetos');
    Add('obCatOtherControls', 'Outros controles');
    Add('obDiagLine', 'Linha diagonal');
    Add('obRect', 'Ret�ngulo');
    Add('obRoundRect', 'Ret�ngulo redondo');
    Add('obEllipse', 'Elipse');
    Add('obTrian', 'Tri�ngulo');
    Add('obDiamond', 'Diamante');
    Add('obLabel', 'Controle Label');
    Add('obEdit', 'Controle Edit');
    Add('obMemoC', 'Controle Memo');
    Add('obButton', 'Controle Button');
    Add('obChBoxC', 'Controle CheckBox');
    Add('obRButton', 'Controle RadioButton');
    Add('obLBox', 'Controle ListBox');
    Add('obCBox', 'Controle ComboBox');
    Add('obDateEdit', 'Controle DateEdit');
    Add('obImageC', 'Controle Imagem');
    Add('obPanel', 'Controle Panel');
    Add('obGrBox', 'Controle GroupBox');
    Add('obBBtn', 'Controle BitBtn');
    Add('obSBtn', 'Controle SpeedButton');
    Add('obMEdit', 'Controle MaskEdit');
    Add('obChLB', 'Controle CheckListBox');
    Add('obDBLookup', 'Controle DBLookupComboBox');
    Add('obBevel', 'Objeto Bevel');
    Add('obShape', 'Objeto Forma');
    Add('obText', 'Objeto Texto');
    Add('obSysText', 'Texto do Sistema');
    Add('obLine', 'Objeto Linha');
    Add('obPicture', 'Objeto Figura');
    Add('obBand', 'Objeto Banda');
    Add('obDataBand', 'Banda de Dados');
    Add('obSubRep', 'Objeto Sub-relat�rio');
    Add('obDlgPage', 'Formul�rio de Dialogo');
    Add('obRepPage', 'P�gina de Relat�rio');
    Add('obReport', 'Objeto Relat�rio');
    Add('obRich', 'Objeto RichText');
    Add('obOLE', 'Objeto OLE');
    Add('obChBox', 'Objeto CheckBox');
    Add('obChart', 'Objeto Gr�fico');
    Add('obBarC', 'Objeto C�digo de Barras');
    Add('obCross', 'Objeto Cross-tab');
    Add('obDBCross', 'Objeto DB Cross-tab');
    Add('obGrad', 'Objeto Gradiente');
    Add('obDMPText', 'Texto Matricial');
    Add('obDMPLine', 'Objeto Linha Matricial');
    Add('obBDEDB', 'Banco de Dados BDE');
    Add('obBDETb', 'Tabela BDE');
    Add('obBDEQ', 'Query BDE');
    Add('obBDEComps', 'Componentes BDE');
    Add('obIBXDB', 'Banco de Dados IBX');
    Add('obIBXTb', 'Tabela IBX');
    Add('obIBXQ', 'Query IBX');
    Add('obIBXComps', 'Componentes IBX');
    Add('obADODB', 'Banco de Dados ADO');
    Add('obADOTb', 'Tabela ADO');
    Add('obADOQ', 'Query ADO');
    Add('obADOComps', 'Compoenentes ADO');
    Add('obDBXDB', 'Banco de Dados DBX');
    Add('obDBXTb', 'Tabela DBX');
    Add('obDBXQ', 'Query DBX');
    Add('obDBXComps', 'Componentes DBX');

    Add('ctString', 'String');
    Add('ctDate', 'Data e Hora');
    Add('ctConv', 'Convers�es');
    Add('ctFormat', 'Formata��o');
    Add('ctMath', 'Matem�tico');
    Add('ctOther', 'Outro');

    Add('IntToStr', 'Converte um valor inteiro em string');
    Add('FloatToStr', 'Converte um valor float em string');
    Add('DateToStr', 'Converte uma data em string');
    Add('TimeToStr', 'Converte um hor�rio em string');
    Add('DateTimeToStr', 'Converte um valor data-e-hora em string');
    Add('VarToStr', 'Converte um valor variant em string');
    Add('StrToInt', 'Converte uma string em valor inteiro');
    Add('StrToFloat', 'Converte uma string em valor de ponto flutuante');
    Add('StrToDate', 'Converte uma string em data');
    Add('StrToTime', 'Converte uma string em hora');
    Add('StrToDateTime', 'Converte uma string em formato data-e-hora');
    Add('Format', 'Retorna uma string formatada montada de uma s�rie de argumentos em vetor');
    Add('FormatFloat', 'Formata um valor de ponto flutuante');
    Add('FormatDateTime', 'Formata um valor de data-e-hora');
    Add('FormatMaskText', 'Retorna uma string formatada usando uma m�scara de edi��o');
    Add('EncodeDate', 'Retorna um tipo TDateTime para um Ano, M�s e Dia especificados');
    Add('DecodeDate', 'Quebra um TDateTime em valores de Ano, M�s e Dia');
    Add('EncodeTime', 'Retorna um tipo TDateTime para uma Hora, Min., Seg. e MSeg. especificados');
    Add('DecodeTime', 'Quebra um TDateTime em horas, minutos, segundos e milisegundos');
    Add('Date', 'Retorna a data atual');
    Add('Time', 'Retorna a hora atual');
    Add('Now', 'Retorna a data e a hora atual');
    Add('DayOfWeek', 'Retorna o dia da semana para a data especificada');
    Add('IsLeapYear', 'Indica se o ano especificado � bissexto');
    Add('DaysInMonth', 'Retorna o n�mero de dias no m�s especificado');
    Add('Length', 'Retorna o tamanho de uma string');
    Add('Copy', 'Retorna uma sub-string de uma string');
    Add('Pos', 'Retorna uma posi��o de uma sub-string de uma string');
    Add('Delete', 'Remove uma sub-string de uma string');
    Add('Insert', 'Insere uma  sub-string em uma string');
    Add('Uppercase', 'Converte todos os caracteres em uma string para mai�sculo');
    Add('Lowercase', 'Converte todos os caracteres em uma string para min�sculo');
    Add('Trim', 'Retira os espa�os no in�cio e no fim de uma string');
    Add('NameCase', 'Converte o primeiro caractere de uma palavra em mai�sculo');
    Add('CompareText', 'Compara duas strings');
    Add('Chr', 'Converte um valor inteiro em caractere(char)');
    Add('Ord', 'Converte um valor caractere(char) em inteiro');
    Add('SetLength', 'Determina o tamanho de uma string');
    Add('Round', 'Arredonda um valor em ponto flutuante ao n�mero inteiro mais pr�ximo');
    Add('Trunc', 'Trunca um valor em ponto flutuante para inteiro');
    Add('Int', 'Retorna a parte inteira de uma n�mero real');
    Add('Frac', 'Retorna a parte fracion�ria de um n�mero real');
    Add('Sqrt', 'Retorna a raiz quadrada do n�mero especificado');
    Add('Abs', 'Retorna o valor absoluto');
    Add('Sin', 'Retorna o seno de um �ngulo (em radianos)');
    Add('Cos', 'Retorna o coseno de um �ngulo (em radianos)');
    Add('ArcTan', 'Retorna o arcotangente');
    Add('Tan', 'Retorna a tangente');
    Add('Exp', 'Retorna o exponencial');
    Add('Ln', 'Retorna o logaritmo natural de uma express�o real');
    Add('Pi', 'Retorna o n�mero 3.1415926...');
    Add('Inc', 'Incrementa um valor');
    Add('Dec', 'Decrementa um valor');
    Add('RaiseException', 'Cria uma exce��o');
    Add('ShowMessage', 'Mostra uma caixa de mensagem');
    Add('Randomize', 'Inicia o gerador de n�meros aleat�rios');
    Add('Random', 'Retorna um n�mero aleat�rio');
    Add('ValidInt', 'Retorna Verdadeiro se a string especificada cont�um um inteiro v�lido');
    Add('ValidFloat', 'Retorna Verdadeiro se a string especificada cont�m uma valor em ponto flutuante');
    Add('ValidDate', 'Retorna Verdadeiro se a string especificada cont�m uma data v�lida');
    Add('IIF', 'Retorna TrueValue se a Expr especificada � Verdadeira, caso contr�rio retorna FalseValue');
    Add('Get', 'Somente para uso interno');
    Add('Set', 'Somente para uso interno');
    Add('InputBox', 'Mostra uma caixa de di�logo de entrada que permite ao usu�rio fornecer uma string');
    Add('InputQuery', 'Mostra uma caixa de di�logo de entrada que permite ao usu�rio fornecer uma string');
    Add('MessageDlg', 'Mostra uma caixa de mensagem');
    Add('CreateOleObject', 'Cria um objeto OLE');
    Add('VarArrayCreate', 'Cria um vetor variante');
    Add('VarType', 'Retorna o tipo de um valor variante');
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