
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
      'Caption=Vista Previa' + #13#10 +
      'PrintB.Caption=Imprimir' + #13#10 +
      'PrintB.Hint=Imprimir' + #13#10 +
      'OpenB.Caption=Abrir' + #13#10 +
      'OpenB.Hint=Abrir' + #13#10 +
      'SaveB.Caption=Guardar' + #13#10 +
      'SaveB.Hint=Guardar' + #13#10 +
      'ExportB.Caption=Exportar' + #13#10 +
      'ExportB.Hint=Exportar' + #13#10 +
      'FindB.Caption=Buscar' + #13#10 +
      'FindB.Hint=Buscar' + #13#10 +
      'ZoomWholePageB.Caption=Ver página completa' + #13#10 +
      'ZoomWholePageB.Hint=Ver página completa' + #13#10 +
      'ZoomPageWidthB.Caption=Ajustar al ancho' + #13#10 +
      'ZoomPageWidthB.Hint=Ajustar al ancho' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=Dos páginas' + #13#10 +
      'Zoom50B.Hint=Dos páginas' + #13#10 +
      'ZoomCB.Hint=Zoom' + #13#10 +
      'PageSettingsB.Caption=Márgenes' + #13#10 +
      'PageSettingsB.Hint=Márgenes' + #13#10 +
      'OutlineB.Caption=Resumen' + #13#10 +
      'OutlineB.Hint=Resumen' + #13#10 +
      'HandToolB.Caption=Arrastrar' + #13#10 +
      'HandToolB.Hint=Herramientas de arrastrar' + #13#10 +
      'ZoomToolB.Caption=Zoom' + #13#10 +
      'ZoomToolB.Hint=Herramientas de Zoom' + #13#10 +
      'NewPageB.Caption=Añadir Página' + #13#10 +
      'NewPageB.Hint=Añadir Página' + #13#10 +
      'DelPageB.Caption=Borrar' + #13#10 +
      'DelPageB.Hint=Borrar página' + #13#10 +
      'DesignerB.Caption=Editar' + #13#10 +
      'DesignerB.Hint=Editar Página' + #13#10 +
      'FirstB.Caption=Primera' + #13#10 +
      'FirstB.Hint=Primera página' + #13#10 +
      'PriorB.Caption=Anterior' + #13#10 +
      'PriorB.Hint=Página anterior' + #13#10 +
      'NextB.Caption=Siguiente' + #13#10 +
      'NextB.Hint=Página siguiente' + #13#10 +
      'LastB.Caption=Ultima' + #13#10 +
      'LastB.Hint=Ultima página' + #13#10 +
      'CancelB.Caption=Cerrar' + #13#10 +
      'PageE.Hint=Ir a la página' + #13#10 +
      '');
    Add('zmPageWidth', 'Ajustar al ancho');
    Add('zmWholePage', 'Ver página completa');

    Add('TfrxPrintDialog',
      'Caption=Imprimir' + #13#10 +
      'Label12.Caption=Impresora   ' + #13#10 +
      'DescrL.Caption=Introduzca los números de página y/o un rango, separado por comas. Por ejemplo, 1,3,5-12' + #13#10 +
      'Label1.Caption=Páginas   ' + #13#10 +
      'CopiesL.Caption=Número de copias' + #13#10 +
      'CollateL.Caption=Intercalar' + #13#10 +
      'Label2.Caption=Copias   ' + #13#10 +
      'PrintL.Caption=Imprimir' + #13#10 +
      'TypeL.Caption=Tipo:' + #13#10 +
      'WhereL.Caption=Where:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'PropButton.Caption=Propiedades...' + #13#10 +
      'AllRB.Caption=Todo' + #13#10 +
      'CurPageRB.Caption=Página actual' + #13#10 +
      'PageNumbersRB.Caption=Páginas:' + #13#10 +
      'FileCB.Caption=Imprimir en fichero' + #13#10 +
      'ReverseCB.Caption=Imprimir en ambas caras' + #13#10 +
      '');
    Add('ppAll', 'Todas las páginas');
    Add('ppOdd', 'Páginas impares');
    Add('ppEven', 'Páginas impares');

    Add('TfrxSearchDialog',
      'Caption=Buscar texto' + #13#10 +
      'TextL.Caption=Texto a buscar:' + #13#10 +
      'SearchL.Caption=Opciones de búsqueda   ' + #13#10 +
      'TopCB.Caption=Desde el principio' + #13#10 +
      'CaseCB.Caption=Distinguir Mayus/Minus.' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Configurar página' + #13#10 +
      'WidthL.Caption=Ancho' + #13#10 +
      'HeightL.Caption=Largo' + #13#10 +
      'SizeL.Caption=Tamaño   ' + #13#10 +
      'OrientationL.Caption=Orientación   ' + #13#10 +
      'LeftL.Caption=Izquierda' + #13#10 +
      'TopL.Caption=Arriba' + #13#10 +
      'RightL.Caption=Derecha' + #13#10 +
      'BottomL.Caption=Abajo' + #13#10 +
      'MarginsL.Caption=Margenes   ' + #13#10 +
      'PortraitRB.Caption=Vertical' + #13#10 +
      'LandscapeRB.Caption=Horizontal' + #13#10 +
      'cmL1.Caption=cm' + #13#10 +
      'cmL2.Caption=cm' + #13#10 +
      'cmL3.Caption=cm' + #13#10 +
      'cmL4.Caption=cm' + #13#10 +
      'cmL5.Caption=cm' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancelar' + #13#10 +
      'OtherL.Caption=Otros   ' + #13#10 +
      'ApplyToCurRB.Caption=Aplicar a la página actual' + #13#10 +
      'ApplyToAllRB.Caption=Aplicar a todas las páginas' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Print' + #13#10 +
      'PrinterL.Caption=Impresora   ' + #13#10 +
      'PagesL.Caption=Páginas   ' + #13#10 +
      'CopiesL.Caption=Copias   ' + #13#10 +
      'CopiesNL.Caption=Número de copias' + #13#10 +
      'DescrL.Caption=Introduzca los números de página y/o un rango, separado por comas. Por ejemplo, 1,3,5-12' + #13#10 +
      'OptionsL.Caption=Opciones   ' + #13#10 +
      'EscL.Caption=Códigos de Escape   ' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Cancelar' + #13#10 +
      'SaveToFileCB.Caption=Imprimir en archivo' + #13#10 +
      'AllRB.Caption=Todo' + #13#10 +
      'CurPageRB.Caption=Página actual' + #13#10 +
      'PageNumbersRB.Caption=Páginas:' + #13#10 +
      'PageBreaksCB.Caption=Separador de páginas' + #13#10 +
      'OemCB.Caption=Códigos de página OEM' + #13#10 +
      'PseudoCB.Caption=Pseudo graficos' + #13#10 +
      'SaveDialog1.Filter=Archivos de impresora (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Cancelar' + #13#10 +
      '');

    Add('mbConfirm', 'Confirmar');
    Add('mbError', 'Error');
    Add('mbInfo', 'Información');
    Add('xrCantFindClass', 'Clase no encontrada');
    Add('prVirtual', 'Virtual');
    Add('prDefault', 'Por defecto');
    Add('prCustom', 'Personalizar');
    Add('enUnconnHeader', 'Cabecera/Pie no conectadas');
    Add('enUnconnGroup', 'No hay banda de datos para el grupo');
    Add('enUnconnGFooter', 'No hay cabecera de grupo para');
    Add('enBandPos', 'Posición incorrecta para la banda:');
    Add('dbNotConn', 'El DataSet %s no está conectado a datos');
    Add('dbFldNotFound', 'Campo no encontrado:');
    Add('clDSNotIncl', '(El Dataset no está incluido en los dataset del informe)');
    Add('clUnknownVar', 'Variable o campo desconocido:');
    Add('clScrError', 'Error en el script en %s: %s');
    Add('clDSNotExist', 'El Dataset "%s" no existe');
    Add('clErrors', 'Ha ocurrido el siguiente error:');
    Add('clExprError', 'Error en la expresión');
    Add('clFP3files', 'Preparando el informe');
    Add('clSaving', 'Guardando archivo...');
    Add('clCancel', 'Cancelar');
    Add('clClose', 'Cerrar');
    Add('clPrinting', 'Imprimiendo página');
    Add('clLoading', 'Cargando archivo...');
    Add('clPageOf', 'Página %d de %d');
    Add('clFirstPass', 'Primera pasada: página ');
    Add('clNoPrinters', 'No hay impresoras instaladas en su sistema');
    Add('clDecompressError', 'Stream decompress error');

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