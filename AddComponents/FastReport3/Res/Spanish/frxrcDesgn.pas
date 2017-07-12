
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
      'Caption=Inspector de Objetos' + #13#10 +
      '');
    Add('oiProp', 'Propiedades');
    Add('oiEvent', 'Eventos');

    Add('TfrxDataTreeForm',
      'Caption=Arbol de datos' + #13#10 +
      'DataTS.Caption=Datos' + #13#10 +
      'VariablesTS.Caption=Variables' + #13#10 +
      'FunctionsTS.Caption=Funciones' + #13#10 +
      'InsFieldCB.Caption=Crear campo' + #13#10 +
      'InsCaptionCB.Caption=Crear título' + #13#10 +
      '');
    Add('dtNoData', 'Datos no disponibles');
    Add('dtData', 'Datos');
    Add('dtSysVar', 'Variables de sistema');
    Add('dtVar', 'Variables');
    Add('dtFunc', 'Funciones');

    Add('TfrxReportTreeForm',
      'Caption=Arbol del informe' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Abrir archivo de script' + #13#10 +
      'SaveScriptB.Hint=Guardar Script en archivo' + #13#10 +
      'RunScriptB.Hint=Ejecutar Script' + #13#10 +
      'StepScriptB.Hint=Depurar en' + #13#10 +
      'StopScriptB.Hint=Terminar Script' + #13#10 +
      'EvaluateB.Hint=Evaluar' + #13#10 +
      'LangL.Caption=Lenguaje:' + #13#10 +
      'AlignTB.Caption=Alineación' + #13#10 +
      'AlignLeftsB.Hint=Alinear al borde Izquierdo' + #13#10 +
      'AlignHorzCentersB.Hint=Alinear al centro' + #13#10 +
      'AlignRightsB.Hint=Alinear a la derecha' + #13#10 +
      'AlignTopsB.Hint=Alinear arriba' + #13#10 +
      'AlignVertCentersB.Hint=Alinear al Centro' + #13#10 +
      'AlignBottomsB.Hint=Alinear Abajo' + #13#10 +
      'SpaceHorzB.Hint=Mismo espacio horizontal' + #13#10 +
      'SpaceVertB.Hint=Mismo espacio vertical' + #13#10 +
      'CenterHorzB.Hint=Centrar horizontalmente en la banda' + #13#10 +
      'CenterVertB.Hint=Centrar Verticalmente en la banda' + #13#10 +
      'SameWidthB.Hint=Mismo ancho' + #13#10 +
      'SameHeightB.Hint=Mismo largo' + #13#10 +
      'TextTB.Caption=Texto' + #13#10 +
      'StyleCB.Hint=Estilo' + #13#10 +
      'FontNameCB.Hint=Fuente' + #13#10 +
      'FontSizeCB.Hint=Tamaño' + #13#10 +
      'BoldB.Hint=Negrita' + #13#10 +
      'ItalicB.Hint=Cursiva' + #13#10 +
      'UnderlineB.Hint=Subrayado' + #13#10 +
      'FontColorB.Hint=Color' + #13#10 +
      'HighlightB.Hint=Resaltar' + #13#10 +
      'RotateB.Hint=Rotación del Texto' + #13#10 +
      'TextAlignLeftB.Hint=Ajuste izquierda' + #13#10 +
      'TextAlignCenterB.Hint=Centrado' + #13#10 +
      'TextAlignRightB.Hint=Ajuste derecha' + #13#10 +
      'TextAlignBlockB.Hint=Justificado' + #13#10 +
      'TextAlignTopB.Hint=Ajuste arriba' + #13#10 +
      'TextAlignMiddleB.Hint=Centrado' + #13#10 +
      'TextAlignBottomB.Hint=Ajuste abajo' + #13#10 +
      'FrameTB.Caption=Marco' + #13#10 +
      'FrameTopB.Hint=Línea de arriba del marco' + #13#10 +
      'FrameBottomB.Hint=Línea de abajo del marco' + #13#10 +
      'FrameLeftB.Hint=Línea izquierda del marco' + #13#10 +
      'FrameRightB.Hint=Línea derecha del marco' + #13#10 +
      'FrameAllB.Hint=Todas las líneas del marco' + #13#10 +
      'FrameNoB.Hint=Sin marco' + #13#10 +
      'ShadowB.Hint=Sombra' + #13#10 +
      'FillColorB.Hint=Color de fondo' + #13#10 +
      'FrameColorB.Hint=Color del marco' + #13#10 +
      'FrameStyleB.Hint=Estilo de línea' + #13#10 +
      'FrameWidthCB.Hint=Grosor de líneas' + #13#10 +
      'StandardTB.Caption=Estandard' + #13#10 +
      'NewB.Hint=Nuevo informe' + #13#10 +
      'OpenB.Hint=Abrir informe' + #13#10 +
      'SaveB.Hint=Guardar informe' + #13#10 +
      'PreviewB.Hint=Vista previa' + #13#10 +
      'NewPageB.Hint=Añadir página' + #13#10 +
      'NewDialogB.Hint=Añadir diálogo' + #13#10 +
      'DeletePageB.Hint=Eliminar página' + #13#10 +
      'PageSettingsB.Hint=Opciones de página' + #13#10 +
      'VariablesB.Hint=Variables' + #13#10 +
      'CutB.Hint=Cortar' + #13#10 +
      'CopyB.Hint=Copiar' + #13#10 +
      'PasteB.Hint=Pegar' + #13#10 +
      'SampleFormatB.Hint=Formato de Copiado' + #13#10 +
      'UndoB.Hint=Deshacer' + #13#10 +
      'RedoB.Hint=Rehacer' + #13#10 +
      'ShowGridB.Hint=Mostrar rejilla' + #13#10 +
      'AlignToGridB.Hint=Alinear a rejilla' + #13#10 +
      'SetToGridB.Hint=Ajustar a rejilla' + #13#10 +
      'ScaleCB.Hint=Zoom' + #13#10 +
      'ExtraToolsTB.Caption=Herramientas Extra' + #13#10 +
      'ObjectSelectB.Hint=Seleccionar herramienta' + #13#10 +
      'HandToolB.Hint=Arrastrar' + #13#10 +
      'ZoomToolB.Hint=Zoom' + #13#10 +
      'TextToolB.Hint=Editar Texto' + #13#10 +
      'FormatToolB.Hint=Formato de copia' + #13#10 +
      'ObjectBandB.Hint=Insertar Banda' + #13#10 +
      'FileMenu.Caption=&Archivo' + #13#10 +
      'EditMenu.Caption=&Editar' + #13#10 +
      'FindMI.Caption=Buscar...' + #13#10 +
      'FindNextMI.Caption=Buscar siguiente' + #13#10 +
      'ReplaceMI.Caption=Reemplazar...' + #13#10 +
      'ReportMenu.Caption=&Informe' + #13#10 +
      'ReportDataMI.Caption=Datos...' + #13#10 +
      'ReportSettingsMI.Caption=Opciones...' + #13#10 +
      'ReportStylesMI.Caption=Estilos...' + #13#10 +
      'ViewMenu.Caption=&Ver' + #13#10 +
      'ToolbarsMI.Caption=Barras de Herramientas' + #13#10 +
      'StandardMI.Caption=Estandard' + #13#10 +
      'TextMI.Caption=Texto' + #13#10 +
      'FrameMI.Caption=Marco' + #13#10 +
      'AlignmentMI.Caption=Paleta de Alineación' + #13#10 +
      'ToolsMI.Caption=Herramientas Extra' + #13#10 +
      'InspectorMI.Caption=Inspector de Objetos' + #13#10 +
      'DataTreeMI.Caption=Arbol de Datos' + #13#10 +
      'ReportTreeMI.Caption=Arbol del Informe' + #13#10 +
      'ShowRulersMI.Caption=Reglas' + #13#10 +
      'ShowGuidesMI.Caption=Guias' + #13#10 +
      'DeleteGuidesMI.Caption=Eliminar Guias' + #13#10 +
      'OptionsMI.Caption=Opciones...' + #13#10 +
      'HelpMenu.Caption=A&yuda' + #13#10 +
      'HelpContentsMI.Caption=Contenido de la ayuda...' + #13#10 +
      'AboutMI.Caption=Sobre FastReport...' + #13#10 +
      'TabOrderMI.Caption=Orden de tabulación...' + #13#10 +
      'UndoCmd.Caption=Deshacer' + #13#10 +
      'RedoCmd.Caption=Rehacer' + #13#10 +
      'CutCmd.Caption=Cortar' + #13#10 +
      'CopyCmd.Caption=Copiar' + #13#10 +
      'PasteCmd.Caption=Pegar' + #13#10 +
      'DeleteCmd.Caption=Borrar' + #13#10 +
      'DeletePageCmd.Caption=Eliminar página' + #13#10 +
      'SelectAllCmd.Caption=Seleccionar Todo' + #13#10 +
      'EditCmd.Caption=Editar...' + #13#10 +
      'BringToFrontCmd.Caption=Traer al frente' + #13#10 +
      'SendToBackCmd.Caption=Enviar Atrás' + #13#10 +
      'NewItemCmd.Caption=Nuevo...' + #13#10 +
      'NewReportCmd.Caption=Nuevo informe' + #13#10 +
      'NewPageCmd.Caption=Añadir página' + #13#10 +
      'NewDialogCmd.Caption=Añadir diálogo' + #13#10 +
      'OpenCmd.Caption=Abrir...' + #13#10 +
      'SaveCmd.Caption=Guardar' + #13#10 +
      'SaveAsCmd.Caption=Guardar como...' + #13#10 +
      'VariablesCmd.Caption=Variables...' + #13#10 +
      'PageSettingsCmd.Caption=Opciones de página...' + #13#10 +
      'PreviewCmd.Caption=Vista Previa' + #13#10 +
      'ExitCmd.Caption=Salir' + #13#10 +
      'ReportTitleMI.Caption=Título del Informe' + #13#10 +
      'ReportSummaryMI.Caption=Sumario del Informe' + #13#10 +
      'PageHeaderMI.Caption=Cabecera de página' + #13#10 +
      'PageFooterMI.Caption=Pie de página' + #13#10 +
      'HeaderMI.Caption=Cabecera' + #13#10 +
      'FooterMI.Caption=Pie' + #13#10 +
      'MasterDataMI.Caption=Datos maestros' + #13#10 +
      'DetailDataMI.Caption=Datos de detalle' + #13#10 +
      'SubdetailDataMI.Caption=Datos de subdetalle' + #13#10 +
      'Data4levelMI.Caption=Datos de 4º nivel' + #13#10 +
      'Data5levelMI.Caption=Datos de 5º nivel' + #13#10 +
      'Data6levelMI.Caption=Datos de 6º nivel' + #13#10 +
      'GroupHeaderMI.Caption=Cabecera de grupo' + #13#10 +
      'GroupFooterMI.Caption=Pie de grupo' + #13#10 +
      'ChildMI.Caption=Hija' + #13#10 +
      'ColumnHeaderMI.Caption=Cabecera de columna' + #13#10 +
      'ColumnFooterMI.Caption=Pie de columna' + #13#10 +
      'OverlayMI.Caption=Superpuesto' + #13#10 +
      'VerticalbandsMI.Caption=Banda vertical' + #13#10 +
      'HeaderMI1.Caption=Cabecera' + #13#10 +
      'FooterMI1.Caption=Pie' + #13#10 +
      'MasterDataMI1.Caption=Datos maestros' + #13#10 +
      'DetailDataMI1.Caption=Datos de detalle' + #13#10 +
      'SubdetailDataMI1.Caption=Datos de subdetalle' + #13#10 +
      'GroupHeaderMI1.Caption=Cabecera de grupo' + #13#10 +
      'GroupFooterMI1.Caption=Pie de grupo' + #13#10 +
      'ChildMI1.Caption=Hija' + #13#10 +
      'R0MI.Caption=0°' + #13#10 +
      'R45MI.Caption=45°' + #13#10 +
      'R90MI.Caption=90°' + #13#10 +
      'R180MI.Caption=180°' + #13#10 +
      'R270MI.Caption=270°' + #13#10 +
      'FontB.Hint=Opciones de Fuentes' + #13#10 +
      'BoldMI.Caption=Negrita' + #13#10 +
      'ItalicMI.Caption=Cursiva' + #13#10 +
      'UnderlineMI.Caption=Subrayado' + #13#10 +
      'SuperScriptMI.Caption=SuperScript' + #13#10 +
      'SubScriptMI.Caption=SubScript' + #13#10 +
      'CondensedMI.Caption=Condensada' + #13#10 +
      'WideMI.Caption=Ancho' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'OpenDialog.Filter=Informe (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=Archivos Pascal (*.pas)|*.pas|C++ files (*.cpp)|*.cpp|JavaScript files (*.js)|*.js|Basic files (*.vb)|*.vb|All files|*.*' + #13#10 +
      'SaveScriptDialog.Filter=Archivos Pascal (*.pas)|*.pas|C++ files (*.cpp)|*.cpp|JavaScript files (*.js)|*.js|Basic files (*.vb)|*.vb|All files|*.*' + #13#10 +
      '');
    Add('dsCm', 'Centimetros');
    Add('dsInch', 'Pulgadas');
    Add('dsPix', 'Pixeles');
    Add('dsChars', 'Caracteres');
    Add('dsCode', 'Codigo');
    Add('dsPage', 'Página');
    Add('dsRepFilter', 'Informe (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'Informe Comprimido (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', '¿Guardar los cambios de la vista previa?');
    Add('dsSaveChangesTo', 'Guardar cambios en ');
    Add('dsCantLoad', 'No se puede cargar el archivo');
    Add('dsStyleFile', 'Estilo');
    Add('dsCantFindProc', 'No se puede localizar el procedimiento principal');
    Add('dsClearScript', 'Esto borrarrá todo el código ¿Desea continuar?');
    Add('dsNoStyle', 'Sin estilo');
    Add('dsStyleSample', 'Estilos de ejemplo');
    Add('dsTextNotFound', 'Texto ''%s'' no encontrado');
    Add('dsReplace', '¿Reemplazar ''%s''?');

    Add('TfrxAboutForm',
      'Caption=Acerca de FastReport' + #13#10 +
      'Label4.Caption=Visite nuestra página web para mas información:' + #13#10 +
      'Label6.Caption=Ventas:' + #13#10 +
      'Label8.Caption=Soporte:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Opciones de Página' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'TabSheet1.Caption=Papel' + #13#10 +
      'Label1.Caption=Ancho' + #13#10 +
      'Label2.Caption=Largo' + #13#10 +
      'Label11.Caption=Tamaño   ' + #13#10 +
      'Label12.Caption=Orientación   ' + #13#10 +
      'Label3.Caption=Izquierda' + #13#10 +
      'Label4.Caption=Arriba' + #13#10 +
      'Label5.Caption=Derecha' + #13#10 +
      'Label6.Caption=Abajo' + #13#10 +
      'Label13.Caption=Margenes   ' + #13#10 +
      'Label14.Caption=Origen del Papel   ' + #13#10 +
      'Label9.Caption=Primera página' + #13#10 +
      'Label10.Caption=Otras páginas' + #13#10 +
      'PortraitRB.Caption=Vertical' + #13#10 +
      'LandscapeRB.Caption=Horizontal' + #13#10 +
      'TabSheet3.Caption=Otras Opciones' + #13#10 +
      'Label7.Caption=Columnas   ' + #13#10 +
      'Label8.Caption=Número' + #13#10 +
      'Label15.Caption=Ancho' + #13#10 +
      'Label16.Caption=Posiciones' + #13#10 +
      'Label17.Caption=Otros   ' + #13#10 +
      'Label18.Caption=Duplex' + #13#10 +
      'PrintOnPrevCB.Caption=Imprimir la página previa' + #13#10 +
      'MirrorMarginsCB.Caption=Márgenes idénticos' + #13#10 +
      'LargeHeightCB.Caption=Large height in design mode' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Seleccionar Datos del Informe' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Editar Variables' + #13#10 +
      'NewCategoryB.Caption=Categoría' + #13#10 +
      'NewVarB.Caption=Variable' + #13#10 +
      'EditB.Caption=Editar' + #13#10 +
      'DeleteB.Caption=Borrar' + #13#10 +
      'EditListB.Caption=Lista' + #13#10 +
      'LoadB.Caption=Abrir' + #13#10 +
      'SaveB.Caption=Guardar' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'ExprPanel.Caption= Expresión:' + #13#10 +
      'OpenDialog1.Filter=Diccionario (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Diccionario (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(no hay variables definidas)');
    Add('vaVar', 'Variables');
    Add('vaDupName', 'Nombre Duplicado');

    Add('TfrxOptionsEditor',
      'Caption=Opciones del diseñador' + #13#10 +
      'Label1.Caption=Rejilla   ' + #13#10 +
      'Label2.Caption=Tipo' + #13#10 +
      'Label3.Caption=Tamaño' + #13#10 +
      'Label4.Caption=Ventana de diálogo:' + #13#10 +
      'Label5.Caption=Otros   ' + #13#10 +
      'Label6.Caption=Fuentes   ' + #13#10 +
      'Label7.Caption=Code window' + #13#10 +
      'Label8.Caption=Editor de Memo' + #13#10 +
      'Label9.Caption=Tamaño' + #13#10 +
      'Label10.Caption=Tamaño' + #13#10 +
      'Label11.Caption=Colores   ' + #13#10 +
      'Label12.Caption=Separación entre bandas:' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=in' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'CMRB.Caption=Centimetros:' + #13#10 +
      'InchesRB.Caption=Pulgadas:' + #13#10 +
      'PixelsRB.Caption=Pixeles:' + #13#10 +
      'ShowGridCB.Caption=Mostrar rejilla' + #13#10 +
      'AlignGridCB.Caption=Alinear a la Rejilla' + #13#10 +
      'EditAfterInsCB.Caption=Mostrar el editor después de insertar' + #13#10 +
      'ObjectFontCB.Caption=Usar las opciones de Fuentes' + #13#10 +
      'WorkspaceB.Caption=Area de trabajo' + #13#10 +
      'ToolB.Caption=Ventana de herramientas' + #13#10 +
      'LCDCB.Caption=Color LCD en rejilla' + #13#10 +
      'FreeBandsCB.Caption=Colocación libre de las bandas' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Restaura valores por defecto' + #13#10 +
      'BandsCaptionsCB.Caption=Mostrar el nombre de las bandas' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=Seleccionar DataSet' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');
    Add('dbNotAssigned', '[no asignado]');
    Add('dbSingleLine', 'Fila simple');

    Add('TfrxGroupEditorForm',
      'Caption=Grupo' + #13#10 +
      'BreakOnL.Caption=Romper en   ' + #13#10 +
      'OptionsL.Caption=Opciones   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'DataFieldRB.Caption=Campo' + #13#10 +
      'ExpressionRB.Caption=Expresión' + #13#10 +
      'KeepGroupTogetherCB.Caption=Unir grupos' + #13#10 +
      'StartNewPageCB.Caption=Empezar con página en blanco' + #13#10 +
      'OutlineCB.Caption=Mostrar resumen' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=Memo de sistema' + #13#10 +
      'DataBandL.Caption=Banda de Datos' + #13#10 +
      'DataSetL.Caption=DataSet' + #13#10 +
      'DataFieldL.Caption=Campo' + #13#10 +
      'FunctionL.Caption=Función' + #13#10 +
      'ExpressionL.Caption=Expresión' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'AggregateRB.Caption=Agregar valor' + #13#10 +
      'SysVariableRB.Caption=Variable de Sistema' + #13#10 +
      'CountInvisibleCB.Caption=Contar bandas no visibles' + #13#10 +
      'TextRB.Caption=Texto' + #13#10 +
      'RunningTotalCB.Caption=Ejecutar' + #13#10 +
      '');
    Add('agAggregate', 'Insertar Aggregate');
    Add('vt1', '[FECHA]');
    Add('vt2', '[HORA]');
    Add('vt3', '[PAGINA#]');
    Add('vt4', '[TOTALPAGINAS#]');
    Add('vt5', '[PAGINA#] of [TOTALPAGINAS#]');
    Add('vt6', '[LINEA#]');

    Add('TfrxOleEditorForm',
      'Caption=Objeto OLE' + #13#10 +
      'InsertB.Caption=Insertar...' + #13#10 +
      'EditB.Caption=Editar...' + #13#10 +
      'CloseB.Caption=Cerrar' + #13#10 +
      '');
    Add('olStretched', 'Ajustado');

    Add('TfrxBarcodeEditorForm',
      'Caption=Editor de códigos de barras' + #13#10 +
      'CodeLbl.Caption=Código' + #13#10 +
      'TypeLbl.Caption=Tipe de Barra' + #13#10 +
      'ZoomLbl.Caption=Zoom:' + #13#10 +
      'OptionsLbl.Caption=Opciones   ' + #13#10 +
      'RotationLbl.Caption=Rotación   ' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CalcCheckSumCB.Caption=Verificación ' + #13#10 +
      'ViewTextCB.Caption=Texto' + #13#10 +
      'Rotation0RB.Caption=0°' + #13#10 +
      'Rotation90RB.Caption=90°' + #13#10 +
      'Rotation180RB.Caption=180°' + #13#10 +
      'Rotation270RB.Caption=270°' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Verificación');
    Add('bcShowText', 'Mostrar Texto');

    Add('TfrxAliasesEditorForm',
      'Caption=Editar Alias' + #13#10 +
      'HintL.Caption=Presionar INTRO para editar el item' + #13#10 +
      'DSAliasL.Caption=Alias de Dataset' + #13#10 +
      'FieldAliasesL.Caption=Campos de alias' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'ResetB.Caption=Resetear' + #13#10 +
      'UpdateB.Caption=Update' + #13#10 +
      '');
    Add('alUserName', 'Nombre de Usuario');
    Add('alOriginal', 'Nombre Original');

    Add('TfrxParamsEditorForm',
      'Caption=Editor de Parametros' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');
    Add('qpName', 'Nombre');
    Add('qpDataType', 'Tipo de Dato');
    Add('qpValue', 'Valor');

    Add('TfrxMDEditorForm',
      'Caption=Union Maestro-Detalle' + #13#10 +
      'Label1.Caption=Campos de Detalle' + #13#10 +
      'Label2.Caption=Campos Maestros' + #13#10 +
      'Label3.Caption=Campos de Unión' + #13#10 +
      'AddB.Caption=Añadir' + #13#10 +
      'ClearB.Caption=Borrar' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=Memo' + #13#10 +
      'ExprB.Hint=Insertar Expresión' + #13#10 +
      'AggregateB.Hint=Insertar Agregate' + #13#10 +
      'LocalFormatB.Hint=Insertar Formateando' + #13#10 +
      'WordWrapB.Hint=Ajuste de palabras' + #13#10 +
      'CancelB.Hint=Cancelar' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=Imagen' + #13#10 +
      'LoadB.Hint=Cargar' + #13#10 +
      'CopyB.Hint=Copiar' + #13#10 +
      'PasteB.Hint=Pegar' + #13#10 +
      'ClearB.Hint=Limpiar' + #13#10 +
      'CancelB.Hint=Cancelar' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('piEmpty', 'Vacío');

    Add('TfrxChartEditorForm',
      'Caption=Editor de caracteres' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=Añadir Series' + #13#10 +
      'DeleteB.Hint=Borrar Series' + #13#10 +
      'DBSourceRB.Caption=Origen de datos' + #13#10 +
      'FixedDataRB.Caption=Datos fijos' + #13#10 +
      'DatasetLbl.Caption=Dataset' + #13#10 +
      'X1Lbl.Caption=Valores X' + #13#10 +
      'Y1Lbl.Caption=Valores Y' + #13#10 +
      'X3Lbl.Caption=Valores X (por ejemplo, a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Valores Y (por ejemplo, 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Otras opciones   ' + #13#10 +
      'ShowTopLbl.Caption=Valores TopN' + #13#10 +
      'CaptionLbl.Caption=Título TopN' + #13#10 +
      'SortLbl.Caption=Ordenado' + #13#10 +
      'LineMI.Caption=Lineas' + #13#10 +
      'AreaMI.Caption=Areas' + #13#10 +
      'PointMI.Caption=Puntos' + #13#10 +
      'BarMI.Caption=Barras' + #13#10 +
      'HorizBarMI.Caption=Barras Horiz.' + #13#10 +
      'PieMI.Caption=Tarta' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Lineas rápidas' + #13#10 +
      '');
    Add('ch3D', 'Ver en 3D');
    Add('chAxis', 'Mostrar ejes');
    Add('chsoNone', 'Ninguno');
    Add('chsoAscending', 'Ascendente');
    Add('chsoDescending', 'Descendente');

    Add('TfrxRichEditorForm',
      'Caption=Editor de texto enriquecido' + #13#10 +
      'OpenB.Hint=Abrir archivo' + #13#10 +
      'SaveB.Hint=Guardar en archivo' + #13#10 +
      'UndoB.Hint=Deshacer' + #13#10 +
      'TTB.Hint=Fuente' + #13#10 +
      'ExprB.Hint=Insertar Expresión' + #13#10 +
      'CancelB.Hint=Cancelar' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      'BoldB.Hint=Negrita' + #13#10 +
      'ItalicB.Hint=Cursiva' + #13#10 +
      'UnderlineB.Hint=Subrayado' + #13#10 +
      'LeftAlignB.Hint=Ajuste Izquierda' + #13#10 +
      'CenterAlignB.Hint=Centrado' + #13#10 +
      'RightAlignB.Hint=Ajuste derecha' + #13#10 +
      'BlockAlignB.Hint=Justificado' + #13#10 +
      'BulletsB.Hint=Viñetas' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Editor de datos cruzados' + #13#10 +
      'DatasetL.Caption=Origen de datos   ' + #13#10 +
      'DimensionsL.Caption=Dimensiones   ' + #13#10 +
      'RowsL.Caption=Filas' + #13#10 +
      'ColumnsL.Caption=Columnas' + #13#10 +
      'CellsL.Caption=Celdas' + #13#10 +
      'StructureL.Caption=Estructura de datos cruzados   ' + #13#10 +
      'RowHeaderCB.Caption=Cabecera de fila' + #13#10 +
      'ColumnHeaderCB.Caption=Cabecera de columna' + #13#10 +
      'RowTotalCB.Caption=Totales de la fila' + #13#10 +
      'ColumnTotalCB.Caption=Totales de la columna' + #13#10 +
      'SwapB.Hint=Intercambio filas/columnas' + #13#10 +
      'StyleCB.Hint=Estilo' + #13#10 +
      'FontB.Hint=Fuente' + #13#10 +
      'AlignLeftB.Hint=Ajuste izquierda' + #13#10 +
      'AlignCenterB.Hint=Centrado' + #13#10 +
      'AlignRightB.Hint=Ajuste derecha' + #13#10 +
      'RotationB.Hint=Rotación del texto' + #13#10 +
      'HighlightB.Hint=Resaltar' + #13#10 +
      'FormatB.Hint=Formato' + #13#10 +
      'FrameB.Hint=Opciones de marco' + #13#10 +
      'FillColorB.Hint=Color de relleno' + #13#10 +
      'Func1MI.Caption=Ninguno' + #13#10 +
      'Func2MI.Caption=Suma' + #13#10 +
      'Func3MI.Caption=Minimo' + #13#10 +
      'Func4MI.Caption=Máximo' + #13#10 +
      'Func5MI.Caption=Promedio' + #13#10 +
      'Func6MI.Caption=Contar' + #13#10 +
      'Sort1MI.Caption=Ascendente (A-Z)' + #13#10 +
      'Sort2MI.Caption=Descendente (Z-A)' + #13#10 +
      'Sort3MI.Caption=Ninguno' + #13#10 +
      'BoldMI.Caption=Negrita' + #13#10 +
      'ItalicMI.Caption=Cursiva' + #13#10 +
      'UnderlineMI.Caption=Subrayado' + #13#10 +
      'SuperScriptMI.Caption=Superíndice' + #13#10 +
      'SubScriptMI.Caption=Subíndice' + #13#10 +
      'CondensedMI.Caption=Condensada' + #13#10 +
      'WideMI.Caption=Wide' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=Cancelar' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('crSubtotal', 'Subtotal');
    Add('crNone', 'Ninguno');
    Add('crSum', 'Suma');
    Add('crMin', 'Mínimo');
    Add('crMax', 'Máximo');
    Add('crAvg', 'Promedio');
    Add('crCount', 'Contar');
    Add('crAsc', 'A-Z');
    Add('crDesc', 'Z-A');
    Add('crFillMx', 'Llenando los datos cruzados...');
    Add('crBuildMx', 'Construyendo datos cruzados...');
    Add('crRepHdrs', 'Reimprimir cabeceras');
    Add('crBorder', 'Bordes');
    Add('crDown', 'Down Then Across');

    Add('TfrxExprEditorForm',
      'Caption=Editor de expersiones' + #13#10 +
      'ExprL.Caption=Expresión:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=Formato de visualización' + #13#10 +
      'CategoryL.Caption=Categoría' + #13#10 +
      'FormatL.Caption=Formato' + #13#10 +
      'FormatStrL.Caption=Formato texto:' + #13#10 +
      'SeparatorL.Caption=Separador de decimales:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');
    Add('fkText', 'Texto (ninguno)');
    Add('fkNumber', 'Número');
    Add('fkDateTime', 'Fecha/Hora');
    Add('fkBoolean', 'Lógico');
    Add('fkNumber1', '1234.5;%g');
    Add('fkNumber2', '1234.50;%2.2f');
    Add('fkNumber3', '1,234.50;%2.2n');
    Add('fkNumber4', '$1,234.50;%2.2m');
    Add('fkDateTime1', '11.28.2002;mm.dd.aaaa');
    Add('fkDateTime2', '28 nov 2002;dd mmm aaaa');
    Add('fkDateTime3', 'Noviembre 28, 2002;mmmm dd, aaaa');
    Add('fkDateTime4', '02:14;hh:mm');
    Add('fkDateTime5', '02:14am;hh:mm am/pm');
    Add('fkDateTime6', '02:14:00;hh:mm:ss');
    Add('fkDateTime7', '02:14am, Noviembre 28, 2002;hh:mm am/pm, mmmm dd, aaaa');
    Add('fkBoolean1', '0,1;0,1');
    Add('fkBoolean2', 'No,Si;No,Si');
    Add('fkBoolean3', '_,x;_,x');
    Add('fkBoolean4', 'Falso,Verdadero;Falso,Verdadero');

    Add('TfrxHighlightEditorForm',
      'Caption=Resaltado' + #13#10 +
      'FontColorB.Caption=Color...' + #13#10 +
      'BackColorB.Caption=Color...' + #13#10 +
      'ConditionL.Caption=Condición   ' + #13#10 +
      'FontL.Caption=Fuente   ' + #13#10 +
      'BackgroundL.Caption=Fondo   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'BoldCB.Caption=Negrita' + #13#10 +
      'ItalicCB.Caption=Cursiva' + #13#10 +
      'UnderlineCB.Caption=Subrayado' + #13#10 +
      'TransparentRB.Caption=Transparente' + #13#10 +
      'OtherRB.Caption=Otros' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Opciones del informe' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'GeneralTS.Caption=General' + #13#10 +
      'ReportSettingsL.Caption=Impresora   ' + #13#10 +
      'CopiesL.Caption=Copias' + #13#10 +
      'GeneralL.Caption=General   ' + #13#10 +
      'PasswordL.Caption=Contraseña' + #13#10 +
      'CollateCB.Caption=Copias intercaladas' + #13#10 +
      'DoublePassCB.Caption=Doble pasada' + #13#10 +
      'PrintIfEmptyCB.Caption=Imprimir aunque esté en blanco' + #13#10 +
      'DescriptionTS.Caption=Descripción' + #13#10 +
      'NameL.Caption=Nombre' + #13#10 +
      'Description1L.Caption=Descripción' + #13#10 +
      'PictureL.Caption=Imagen' + #13#10 +
      'AuthorL.Caption=Autor' + #13#10 +
      'MajorL.Caption=Mayor' + #13#10 +
      'MinorL.Caption=Menor' + #13#10 +
      'ReleaseL.Caption=Revisión' + #13#10 +
      'BuildL.Caption=Acumulado' + #13#10 +
      'CreatedL.Caption=Creado' + #13#10 +
      'ModifiedL.Caption=Modificado' + #13#10 +
      'DescriptionL.Caption=Descripción   ' + #13#10 +
      'VersionL.Caption=Version   ' + #13#10 +
      'PictureB.Caption=Examinar...' + #13#10 +
      '');
    Add('rePrnOnPort', 'en');

    Add('TfrxStringsEditorForm',
      'Caption=Lineas' + #13#10 +
      'CancelB.Hint=Cancelar' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=Cancelar' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=Contraseña' + #13#10 +
      'PasswordL.Caption=Introduzca contraseña:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=Style Editor' + #13#10 +
      'ColorB.Caption=Color...' + #13#10 +
      'FontB.Caption=Fuente...' + #13#10 +
      'FrameB.Caption=Marco...' + #13#10 +
      'AddB.Hint=Añadir' + #13#10 +
      'DeleteB.Hint=Borrar' + #13#10 +
      'EditB.Hint=Editar' + #13#10 +
      'LoadB.Hint=Cargar' + #13#10 +
      'SaveB.Hint=Guardar' + #13#10 +
      'CancelB.Hint=Cancelar' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=Editor de Marcos' + #13#10 +
      'FrameL.Caption=Marco' + #13#10 +
      'LineL.Caption=Línea de Marco' + #13#10 +
      'ShadowL.Caption=Sombra' + #13#10 +
      'FrameTopB.Hint=Línea de arriba' + #13#10 +
      'FrameBottomB.Hint=Línea de abajo' + #13#10 +
      'FrameLeftB.Hint=Línea de la izquierda' + #13#10 +
      'FrameRightB.Hint=Línea de la derecha' + #13#10 +
      'FrameAllB.Hint=Marco completo' + #13#10 +
      'FrameNoB.Hint=Sin marco' + #13#10 +
      'FrameColorB.Hint=Color del marco' + #13#10 +
      'FrameStyleB.Hint=Estilo del marco' + #13#10 +
      'FrameWidthCB.Hint=Grosor de línea' + #13#10 +
      'ShadowB.Hint=Sombra' + #13#10 +
      'ShadowColorB.Hint=Color de sombra' + #13#10 +
      'ShadowWidthCB.Hint=Grosor de la sombra' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=Nuevo elemento' + #13#10 +
      'ItemsTab.Caption=Elementos' + #13#10 +
      'TemplatesTab.Caption=Plantillas' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Tab Order' + #13#10 +
      'Label1.Caption=Lista de Controles:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'UpB.Caption=Arriba' + #13#10 +
      'DownB.Caption=Abajo' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Evaluar' + #13#10 +
      'Label1.Caption=Expresión' + #13#10 +
      'Label2.Caption=Resultado' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Asistente de informes' + #13#10 +
      'DataTab.Caption=Datos' + #13#10 +
      'GroupsTab.Caption=Grupos' + #13#10 +
      'LayoutTab.Caption=Disposición' + #13#10 +
      'StyleTab.Caption=Estilo' + #13#10 +
      'Step1L.Caption=Paso 1. Seleccionar la tabla y campos a mostrar.' + #13#10 +
      'Step2L.Caption=Paso 2. Crear grupos (opcional).' + #13#10 +
      'Step3L.Caption=Paso 3. Definir la orientación de la página y la disposición de los datos.' + #13#10 +
      'Step4L.Caption=Paso 4. Elija el estilo del informe.' + #13#10 +
      'AddFieldB.Caption=Añadir >' + #13#10 +
      'AddAllFieldsB.Caption=Añadir todos >>' + #13#10 +
      'RemoveFieldB.Caption=< Quitar' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Quitar todos' + #13#10 +
      'AddGroupB.Caption=Añadir >' + #13#10 +
      'RemoveGroupB.Caption=< Quitar' + #13#10 +
      'SelectedFieldsL.Caption=Seleccionar campos:' + #13#10 +
      'AvailableFieldsL.Caption=Campos disponibles:' + #13#10 +
      'GroupsL.Caption=Grupos:' + #13#10 +
      'OrientationL.Caption=Orientación   ' + #13#10 +
      'LayoutL.Caption=Disposición   ' + #13#10 +
      'PortraitRB.Caption=Vertical' + #13#10 +
      'LandscapeRB.Caption=Horizontal' + #13#10 +
      'TabularRB.Caption=Datos tabulados' + #13#10 +
      'ColumnarRB.Caption=En Columnas' + #13#10 +
      'FitWidthCB.Caption=Ajustar los campos a la anchura de página' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'BackB.Caption=Atrás' + #13#10 +
      'NextB.Caption=Siguiente' + #13#10 +
      'FinishB.Caption=Finalizar' + #13#10 +
      '');
    Add('wzStd', 'Asistente para Informes Estandard');
    Add('wzDMP', 'Asistente para Informes en Matricial');
    Add('wzStdEmpty', 'Informe Estandard');
    Add('wzDMPEmpty', 'Informe para Matricial');


    Add('ftAllFiles', 'Todos los archivos');
    Add('ftPictures', 'Imágenes');
    Add('ftDB', 'Bases de datos');
    Add('ftRichFile', 'Texto enriquecido');
    Add('ftTextFile', 'Archivo de texto');

    Add('prNotAssigned', '(No asignado)');
    Add('prInvProp', 'Valor no válido');
    Add('prDupl', 'Nombre Duplicado');
    Add('prPict', '(Imagen)');

    Add('mvExpr', 'Allow Expressions');
    Add('mvStretch', 'Ajustado');
    Add('mvStretchToMax', 'Ajustar al ancho máximo');
    Add('mvShift', 'Shift');
    Add('mvShiftOver', 'Shift When Overlapped');
    Add('mvVisible', 'Visible');
    Add('mvPrintable', 'Imprimible');
    Add('mvFont', 'Fuente...');
    Add('mvFormat', 'Formato de visualización...');
    Add('mvClear', 'Borrar Contenido');
    Add('mvAutoWidth', 'Ancho Automático');
    Add('mvWWrap', 'Ajuste de palabras');
    Add('mvSuppress', 'Suprimir Valores Repetidos');
    Add('mvHideZ', 'Ocultar ceros');
    Add('mvHTML', 'Allow HTML Tags');
    Add('lvDiagonal', 'Diagonal');
    Add('pvAutoSize', 'Tamaño Automático');
    Add('pvCenter', 'Centrado');
    Add('pvAspect', 'Keep Aspect Ratio');
    Add('bvSplit', 'Permitir separación');
    Add('bvKeepChild', 'Keep Child Together');
    Add('bvPrintChild', 'Imprimir Hija si Invisible');
    Add('bvStartPage', 'Iniciar página nueva');
    Add('bvPrintIfEmpty', 'Imprimir si Detalle Vacío');
    Add('bvKeepDetail', 'Keep Detail Together');
    Add('bvKeepFooter', 'Keep Footer Together');
    Add('bvReprint', 'Reimprimir en Nueva Página');
    Add('bvOnFirst', 'Imprimir en Primera Página');
    Add('bvOnLast', 'Imprimir En Ultima Página');
    Add('bvKeepGroup', 'Keep Together');
    Add('bvFooterAfterEach', 'Pié después de cada fila');
    Add('srParent', 'Imprimir en Padre');

    Add('obCatDraw', 'Arrastrar');
    Add('obCatOther', 'Otros objetos');
    Add('obCatOtherControls', 'Otros controles');
    Add('obDiagLine', 'Línea Diagonal');
    Add('obRect', 'Rectangulo');
    Add('obRoundRect', 'Rectángulo Redondeado');
    Add('obEllipse', 'Elipse');
    Add('obTrian', 'Triangulo');
    Add('obDiamond', 'Diamante');
    Add('obLabel', 'Etiqueta');
    Add('obEdit', 'Control de Edición');
    Add('obMemoC', 'Memo');
    Add('obButton', 'Botón');
    Add('obChBoxC', 'Casilla de verificación');
    Add('obRButton', 'Botón de opción');
    Add('obLBox', 'Cuadro de Lista');
    Add('obCBox', 'Cuadro Combinado');
    Add('obDateEdit', 'Editor de Fechas');
    Add('obImageC', 'Imagen');
    Add('obPanel', 'Panel');
    Add('obGrBox', 'Grupo de opciones');
    Add('obBBtn', 'Botón con imagen');
    Add('obSBtn', 'Botón de menú');
    Add('obMEdit', 'Editor con Formato');
    Add('obChLB', 'Lista de verificación');
    Add('obDBLookup', 'Lista de selección de datos');
    Add('obBevel', 'Biselado');
    Add('obShape', 'Dibujo');
    Add('obText', 'Texto');
    Add('obSysText', 'Texto de Sistema');
    Add('obLine', 'Línea');
    Add('obPicture', 'Imagen');
    Add('obBand', 'Banda');
    Add('obDataBand', 'Banda de Datos');
    Add('obSubRep', 'SubInforme');
    Add('obDlgPage', 'Diálogo');
    Add('obRepPage', 'Página');
    Add('obReport', 'Informe');
    Add('obRich', 'Texto enriquecido');
    Add('obOLE', 'Objeto OLE');
    Add('obChBox', 'Casilla de verificación');
    Add('obChart', 'Gráfico');
    Add('obBarC', 'Código de Barras');
    Add('obCross', 'Informe cruzado');
    Add('obDBCross', 'Datos cruzados');
    Add('obGrad', 'Gradiente');
    Add('obDMPText', 'Texto para Matricial');
    Add('obDMPLine', 'Línea para Matricial');
    Add('obBDEDB', 'Base de Datos BDE');
    Add('obBDETb', 'Tabla BDE');
    Add('obBDEQ', 'Consulta BDE');
    Add('obBDEComps', 'Componentes BDE');
    Add('obIBXDB', 'Base de Datos IBX');
    Add('obIBXTb', 'Tabla IBX');
    Add('obIBXQ', 'Consulta IBX');
    Add('obIBXComps', 'Componentes IBX');
    Add('obADODB', 'Base de Datos ADO');
    Add('obADOTb', 'Tabla ADO');
    Add('obADOQ', 'Consulta ADO');
    Add('obADOComps', 'Componentes ADO');
    Add('obDBXDB', 'Base de Datos DBX');
    Add('obDBXTb', 'Tabla DBX');
    Add('obDBXQ', 'Consulta DBX');
    Add('obDBXComps', 'Componentes DBX');

    Add('ctString', 'Texto');
    Add('ctDate', 'Fecha y Hora');
    Add('ctConv', 'Conversiones');
    Add('ctFormat', 'Formato');
    Add('ctMath', 'Matemáticas');
    Add('ctOther', 'Otros');

    Add('IntToStr', 'Convertir un valor numérico entero en cadena alfanumérica');
    Add('FloatToStr', 'Convierte un valor decimal en cadena alfanumérica');
    Add('DateToStr', 'Convierte una fecha en cadena alfanumérica');
    Add('TimeToStr', 'Convierte un valor de hora en cadena alfanumérica');
    Add('DateTimeToStr', 'Convierte un valor fecha y hora en una cadena alfanumérica');
    Add('VarToStr', 'Convierte un valor variable en una cadena alfanumérica');
    Add('StrToInt', 'Convierte una cadena alfanumérica en un valor numérico entero');
    Add('StrToFloat', 'Convierte una cadena alfanumérica en un valor decimal');
    Add('StrToDate', 'Convierte una cadena alfanumérica en fecha');
    Add('StrToTime', 'Convierte una cadena alfanumérica en hora');
    Add('StrToDateTime', 'Convierte una cadena alfanumérica en fecha/hora');
    Add('Format', 'Aplica una máscara a un array de argumentos y devuelve una cadena formateada');
    Add('FormatFloat', 'Aplica un formato a un valor decimal');
    Add('FormatDateTime', 'Aplica un formato a un valor de Fecha/Hora');
    Add('FormatMaskText', 'Devuelve una cadena alfanumérica formateada');
    Add('EncodeDate', 'Devuelve la fecha del Año, Mes y Día especificados');
    Add('DecodeDate', 'Descompone una fecha especificada en el Año, Mes y Día');
    Add('EncodeTime', 'Devuelve la hora para la Horas, Minutos, Segundos y Milidegundos');
    Add('DecodeTime', 'Descompone la hora en Horas, Minutos, Segundos y Milisegundos');
    Add('Date', 'Devuelve la fecha actual');
    Add('Time', 'Devuelve la hora actual');
    Add('Now', 'Devuelve la fecha y la hora actual');
    Add('DayOfWeek', 'Devuelve el día de la semana de una fecha especificada');
    Add('IsLeapYear', 'Indica si el año especificado es bisiesto');
    Add('DaysInMonth', 'Devuelve el número de días de un més especificado');
    Add('Length', 'Devuelve la longitud de una cadena alfanumérica');
    Add('Copy', 'Devuelve una subcadena dentro de una cadena alfanumérica');
    Add('Pos', 'Devuelve la posición de una subcadena dentro de una cadena alfanumérica');
    Add('Delete', 'Borra una subcadena de una cadena alfanumérica');
    Add('Insert', 'Inserta una subcadena en una cadena alfanumérica');
    Add('Uppercase', 'Convierte todos los caracteres de una cadena en mayúsculas');
    Add('Lowercase', 'Convierte todos los caracteres de una cadena en minúsculas');
    Add('Trim', 'Descarta todos los espacios en blanco de una cadena');
    Add('NameCase', 'Convierte el primer caracter de cada palabra de una cadena en mayúscula. El resto lo pasa a minúscula');
    Add('CompareText', 'Compara dos Cadenas alfanuméricas');
    Add('Chr', 'Convierte valor numérico entero a caracter');
    Add('Ord', 'Convierte un caracter en un valor numérico entero');
    Add('SetLength', 'Establece la longitud para una cadena alfanumérica');
    Add('Round', 'Redondea un valor decimal');
    Add('Trunc', 'Trunca un valor decimal');
    Add('Int', 'Devuelve la parte entera de un valor decimal');
    Add('Frac', 'Devuelve la parte decimal de un valor decimal');
    Add('Sqrt', 'Devuelve la raiz cuadrada del número especificado');
    Add('Abs', 'Devuelve el valor absoluto');
    Add('Sin', 'Devuelve el Seno de un ángulo (en radianes)');
    Add('Cos', 'Devuelve el Coseno de un ángulo (en radianes)');
    Add('ArcTan', 'Devuelve la ArcoTangente');
    Add('Tan', 'Devuelve la Tangente');
    Add('Exp', 'Devuelve el Exponencial');
    Add('Ln', 'Returns the natural log of a real expression');
    Add('Pi', 'Devuelve 3.1415926...');
    Add('Inc', 'Incrementa un valor');
    Add('Dec', 'Decrementa un valor');
    Add('RaiseException', 'Lanza una excepción');
    Add('ShowMessage', 'Mostrar mensajes');
    Add('Randomize', 'Inicializar el generador de números aleatorios');
    Add('Random', 'Devuelve un número aleatorio');
    Add('ValidInt', 'Devuelve Verdadero si la cadena alfanumérica especificada contiene un número entero válido');
    Add('ValidFloat', 'Devuelve Verdadero si la cadena alfanumérica especificada contiene un número decimal válido');
    Add('ValidDate', 'Devuelve Verdadero si la cadena alfanumérica especificada contiene una fecha válida');
    Add('IIF', 'Devuelve el valor1 si la expresión es verdadera. En caso contrario devuelve el valor2');
    Add('Get', 'Solo para uso interno');
    Add('Set', 'Solo para uso interno');
    Add('InputBox', 'Muestra una ventana de diálogo para que el usuario introduzca una cadena');
    Add('InputQuery', 'Muestra una ventana de diálogo para que el usuario introduzca una cadena');
    Add('MessageDlg', 'Muestra una ventana con un mensaje');
    Add('CreateOleObject', 'Crea un objeto OLE');
    Add('VarArrayCreate', 'Crea un array de variantes');
    Add('VarType', 'Devuelve el tipo de valor contenido en un variante');

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