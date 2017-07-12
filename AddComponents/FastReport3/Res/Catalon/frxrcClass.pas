
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
      'Caption=Vista Prèvia' + #13#10 +
      'PrintB.Caption=Imprimir' + #13#10 +
      'PrintB.Hint=Imprimir' + #13#10 +
      'OpenB.Caption=Obrir' + #13#10 +
      'OpenB.Hint=Obrir' + #13#10 +
      'SaveB.Caption=Guardar' + #13#10 +
      'SaveB.Hint=Guardar' + #13#10 +
      'ExportB.Caption=Exportar' + #13#10 +
      'ExportB.Hint=Exportar' + #13#10 +
      'FindB.Caption=Cercar' + #13#10 +
      'FindB.Hint=Cercar' + #13#10 +
      'ZoomWholePageB.Caption=Pàgina Completa' + #13#10 +
      'ZoomWholePageB.Hint=Pàgina Completa' + #13#10 +
      'ZoomPageWidthB.Caption=Ampla de Pàgina' + #13#10 +
      'ZoomPageWidthB.Hint=Ampla de Pàgina' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=Dos Pàgines' + #13#10 +
      'Zoom50B.Hint=Dos Pàgines' + #13#10 +
      'ZoomCB.Hint=Zoom' + #13#10 +
      'PageSettingsB.Caption=Marges' + #13#10 +
      'PageSettingsB.Hint=Marges' + #13#10 +
      'OutlineB.Caption=Perfil' + #13#10 +
      'OutlineB.Hint=Perfil' + #13#10 +
      'HandToolB.Caption=Arrossegar' + #13#10 +
      'HandToolB.Hint=Eines d''arrossegar' + #13#10 +
      'ZoomToolB.Caption=Zoom' + #13#10 +
      'ZoomToolB.Hint=Eina de Zoom' + #13#10 +
      'NewPageB.Caption=Afegir Pàgina' + #13#10 +
      'NewPageB.Hint=Afegir Pàgina' + #13#10 +
      'DelPageB.Caption=Esborrar' + #13#10 +
      'DelPageB.Hint=Esborrar Pàgina' + #13#10 +
      'DesignerB.Caption=Editar' + #13#10 +
      'DesignerB.Hint=Editar Pàgina' + #13#10 +
      'FirstB.Caption=Primera' + #13#10 +
      'FirstB.Hint=Primera Pàgina' + #13#10 +
      'PriorB.Caption=Anterior' + #13#10 +
      'PriorB.Hint=Pàgina Anterior' + #13#10 +
      'NextB.Caption=Següent' + #13#10 +
      'NextB.Hint=Pàgina Següent' + #13#10 +
      'LastB.Caption=Última' + #13#10 +
      'LastB.Hint=Última Pàgina' + #13#10 +
      'CancelB.Caption=Tancar' + #13#10 +
      'PageE.Hint=Número de Pàgina' + #13#10 +
      '');
    Add('zmPageWidth', 'Ampla de Pàgina');
    Add('zmWholePage', 'Pàgina  Completa');

    Add('TfrxPrintDialog',
      'Caption=Imprimir' + #13#10 +
      'Label12.Caption=Impressora   ' + #13#10 +
      'DescrL.Caption=Entre el número de pàgina i/o rang de pàgines, separat per comes. Per exemple, 1,3,5-12' + #13#10 +
      'Label1.Caption=Pàgines   ' + #13#10 +
      'CopiesL.Caption=Numero de còpies' + #13#10 +
      'CollateL.Caption=Confrontar' + #13#10 +
      'Label2.Caption=Còpies   ' + #13#10 +
      'PrintL.Caption=Imprimir' + #13#10 +
      'TypeL.Caption=Tipus:' + #13#10 +
      'WhereL.Caption=On:' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel·lar' + #13#10 +
      'PropButton.Caption=Propietats...' + #13#10 +
      'AllRB.Caption=Tot' + #13#10 +
      'CurPageRB.Caption=Pàgina actual' + #13#10 +
      'PageNumbersRB.Caption=Pàgines:' + #13#10 +
      'FileCB.Caption=Imprimir a fitxer' + #13#10 +
      'ReverseCB.Caption=Invertir pàgines' + #13#10 +
      '');
    Add('ppAll', 'Totes les pàgines');
    Add('ppOdd', 'Pàgines imparells');
    Add('ppEven', 'Pàgines parells');

    Add('TfrxSearchDialog',
      'Caption=Cercar Text' + #13#10 +
      'TextL.Caption=Text a cercar:' + #13#10 +
      'SearchL.Caption=Opcions ' + #13#10 +
      'TopCB.Caption=Cercar des de l''''inici' + #13#10 +
      'CaseCB.Caption=Diferent maj./minus.' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel·lar' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Format de Pàgina' + #13#10 +
      'WidthL.Caption=Amplada' + #13#10 +
      'HeightL.Caption=Alçada' + #13#10 +
      'SizeL.Caption=Mida   ' + #13#10 +
      'OrientationL.Caption=Orientació   ' + #13#10 +
      'LeftL.Caption=Esquerra' + #13#10 +
      'TopL.Caption=Superior' + #13#10 +
      'RightL.Caption=Dreta' + #13#10 +
      'BottomL.Caption=Inferior' + #13#10 +
      'MarginsL.Caption=Marges   ' + #13#10 +
      'PortraitRB.Caption=Vertical' + #13#10 +
      'LandscapeRB.Caption=Horitzontal' + #13#10 +
      'cmL1.Caption=cm' + #13#10 +
      'cmL2.Caption=cm' + #13#10 +
      'cmL3.Caption=cm' + #13#10 +
      'cmL4.Caption=cm' + #13#10 +
      'cmL5.Caption=cm' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel·lar' + #13#10 +
      'OtherL.Caption=Altres   ' + #13#10 +
      'ApplyToCurRB.Caption=Aplicar a la pàgina actual' + #13#10 +
      'ApplyToAllRB.Caption=Aplicar a totes les pàgines' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Imprimir' + #13#10 +
      'PrinterL.Caption=Impressora   ' + #13#10 +
      'PagesL.Caption=Pàgines   ' + #13#10 +
      'CopiesL.Caption=Còpies   ' + #13#10 +
      'CopiesNL.Caption=Número de còpies' + #13#10 +
      'DescrL.Caption=Entre el número de pàgina i/o rang de pàgines, separat per comes. Per exemple, 1,3,5-12' + #13#10 +
      'OptionsL.Caption=Opcions   ' + #13#10 +
      'EscL.Caption=Comandes Escape   ' + #13#10 +
      'OK.Caption=Acceptar' + #13#10 +
      'Cancel.Caption=Cancel·lar' + #13#10 +
      'SaveToFileCB.Caption=Imprimir a fitxer' + #13#10 +
      'AllRB.Caption=Tot' + #13#10 +
      'CurPageRB.Caption=Pàgina actual' + #13#10 +
      'PageNumbersRB.Caption=Pàgines:' + #13#10 +
      'PageBreaksCB.Caption=Partir pàgina' + #13#10 +
      'OemCB.Caption=Codi OEM' + #13#10 +
      'PseudoCB.Caption=Pseudogràfic' + #13#10 +
      'SaveDialog1.Filter=Fitxer (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Cancel·lar' + #13#10 +
      '');

    Add('mbConfirm', 'Confirmar');
    Add('mbError', 'Error');
    Add('mbInfo', 'Informació');
    Add('xrCantFindClass', 'No es pot trobar la classe');
    Add('prVirtual', 'Virtual');
    Add('prDefault', 'Defecte');
    Add('prCustom', 'Habitual');
    Add('enUnconnHeader', 'No connectats la capçalera/peu');
    Add('enUnconnGroup', 'No hi ha una banda pel grup');
    Add('enUnconnGFooter', 'No hi ha capçalera pel grup');
    Add('enBandPos', 'Posició incorrecta de la banda:');
    Add('dbNotConn', 'Taula %s no està connectat a la data');
    Add('dbFldNotFound', 'Camp no trobat:');
    Add('clDSNotIncl', '(taula no està inclòs en el Report.DataSets)');
    Add('clUnknownVar', 'Camp o variable desconeguts:');
    Add('clScrError', 'Script error a %s: %s');
    Add('clDSNotExist', 'La taula "%s" no existeix');
    Add('clErrors', 'Ha ocorregut el següent error(s):');
    Add('clExprError', 'Error en l''''expressió');
    Add('clFP3files', 'Informe preparat');
    Add('clSaving', 'Guardant fitxer...');
    Add('clCancel', 'Cancel·lar');
    Add('clClose', 'Tancar');
    Add('clPrinting', 'Imprimint pàgina');
    Add('clLoading', 'Llegint fitxer...');
    Add('clPageOf', 'Pàgina %d de %d');
    Add('clFirstPass', 'Primera passada: pàgina ');
    Add('clNoPrinters', 'No hi ha impressores instal·lades en el teu sistema');
    Add('clDecompressError', 'Error de descompressió');

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