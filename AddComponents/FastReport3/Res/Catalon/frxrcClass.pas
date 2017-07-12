
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
      'Caption=Vista Pr�via' + #13#10 +
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
      'ZoomWholePageB.Caption=P�gina Completa' + #13#10 +
      'ZoomWholePageB.Hint=P�gina Completa' + #13#10 +
      'ZoomPageWidthB.Caption=Ampla de P�gina' + #13#10 +
      'ZoomPageWidthB.Hint=Ampla de P�gina' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=Dos P�gines' + #13#10 +
      'Zoom50B.Hint=Dos P�gines' + #13#10 +
      'ZoomCB.Hint=Zoom' + #13#10 +
      'PageSettingsB.Caption=Marges' + #13#10 +
      'PageSettingsB.Hint=Marges' + #13#10 +
      'OutlineB.Caption=Perfil' + #13#10 +
      'OutlineB.Hint=Perfil' + #13#10 +
      'HandToolB.Caption=Arrossegar' + #13#10 +
      'HandToolB.Hint=Eines d''arrossegar' + #13#10 +
      'ZoomToolB.Caption=Zoom' + #13#10 +
      'ZoomToolB.Hint=Eina de Zoom' + #13#10 +
      'NewPageB.Caption=Afegir P�gina' + #13#10 +
      'NewPageB.Hint=Afegir P�gina' + #13#10 +
      'DelPageB.Caption=Esborrar' + #13#10 +
      'DelPageB.Hint=Esborrar P�gina' + #13#10 +
      'DesignerB.Caption=Editar' + #13#10 +
      'DesignerB.Hint=Editar P�gina' + #13#10 +
      'FirstB.Caption=Primera' + #13#10 +
      'FirstB.Hint=Primera P�gina' + #13#10 +
      'PriorB.Caption=Anterior' + #13#10 +
      'PriorB.Hint=P�gina Anterior' + #13#10 +
      'NextB.Caption=Seg�ent' + #13#10 +
      'NextB.Hint=P�gina Seg�ent' + #13#10 +
      'LastB.Caption=�ltima' + #13#10 +
      'LastB.Hint=�ltima P�gina' + #13#10 +
      'CancelB.Caption=Tancar' + #13#10 +
      'PageE.Hint=N�mero de P�gina' + #13#10 +
      '');
    Add('zmPageWidth', 'Ampla de P�gina');
    Add('zmWholePage', 'P�gina  Completa');

    Add('TfrxPrintDialog',
      'Caption=Imprimir' + #13#10 +
      'Label12.Caption=Impressora   ' + #13#10 +
      'DescrL.Caption=Entre el n�mero de p�gina i/o rang de p�gines, separat per comes. Per exemple, 1,3,5-12' + #13#10 +
      'Label1.Caption=P�gines   ' + #13#10 +
      'CopiesL.Caption=Numero de c�pies' + #13#10 +
      'CollateL.Caption=Confrontar' + #13#10 +
      'Label2.Caption=C�pies   ' + #13#10 +
      'PrintL.Caption=Imprimir' + #13#10 +
      'TypeL.Caption=Tipus:' + #13#10 +
      'WhereL.Caption=On:' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel�lar' + #13#10 +
      'PropButton.Caption=Propietats...' + #13#10 +
      'AllRB.Caption=Tot' + #13#10 +
      'CurPageRB.Caption=P�gina actual' + #13#10 +
      'PageNumbersRB.Caption=P�gines:' + #13#10 +
      'FileCB.Caption=Imprimir a fitxer' + #13#10 +
      'ReverseCB.Caption=Invertir p�gines' + #13#10 +
      '');
    Add('ppAll', 'Totes les p�gines');
    Add('ppOdd', 'P�gines imparells');
    Add('ppEven', 'P�gines parells');

    Add('TfrxSearchDialog',
      'Caption=Cercar Text' + #13#10 +
      'TextL.Caption=Text a cercar:' + #13#10 +
      'SearchL.Caption=Opcions ' + #13#10 +
      'TopCB.Caption=Cercar des de l''''inici' + #13#10 +
      'CaseCB.Caption=Diferent maj./minus.' + #13#10 +
      'OkB.Caption=Acceptar' + #13#10 +
      'CancelB.Caption=Cancel�lar' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Format de P�gina' + #13#10 +
      'WidthL.Caption=Amplada' + #13#10 +
      'HeightL.Caption=Al�ada' + #13#10 +
      'SizeL.Caption=Mida   ' + #13#10 +
      'OrientationL.Caption=Orientaci�   ' + #13#10 +
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
      'CancelB.Caption=Cancel�lar' + #13#10 +
      'OtherL.Caption=Altres   ' + #13#10 +
      'ApplyToCurRB.Caption=Aplicar a la p�gina actual' + #13#10 +
      'ApplyToAllRB.Caption=Aplicar a totes les p�gines' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Imprimir' + #13#10 +
      'PrinterL.Caption=Impressora   ' + #13#10 +
      'PagesL.Caption=P�gines   ' + #13#10 +
      'CopiesL.Caption=C�pies   ' + #13#10 +
      'CopiesNL.Caption=N�mero de c�pies' + #13#10 +
      'DescrL.Caption=Entre el n�mero de p�gina i/o rang de p�gines, separat per comes. Per exemple, 1,3,5-12' + #13#10 +
      'OptionsL.Caption=Opcions   ' + #13#10 +
      'EscL.Caption=Comandes Escape   ' + #13#10 +
      'OK.Caption=Acceptar' + #13#10 +
      'Cancel.Caption=Cancel�lar' + #13#10 +
      'SaveToFileCB.Caption=Imprimir a fitxer' + #13#10 +
      'AllRB.Caption=Tot' + #13#10 +
      'CurPageRB.Caption=P�gina actual' + #13#10 +
      'PageNumbersRB.Caption=P�gines:' + #13#10 +
      'PageBreaksCB.Caption=Partir p�gina' + #13#10 +
      'OemCB.Caption=Codi OEM' + #13#10 +
      'PseudoCB.Caption=Pseudogr�fic' + #13#10 +
      'SaveDialog1.Filter=Fitxer (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Cancel�lar' + #13#10 +
      '');

    Add('mbConfirm', 'Confirmar');
    Add('mbError', 'Error');
    Add('mbInfo', 'Informaci�');
    Add('xrCantFindClass', 'No es pot trobar la classe');
    Add('prVirtual', 'Virtual');
    Add('prDefault', 'Defecte');
    Add('prCustom', 'Habitual');
    Add('enUnconnHeader', 'No connectats la cap�alera/peu');
    Add('enUnconnGroup', 'No hi ha una banda pel grup');
    Add('enUnconnGFooter', 'No hi ha cap�alera pel grup');
    Add('enBandPos', 'Posici� incorrecta de la banda:');
    Add('dbNotConn', 'Taula %s no est� connectat a la data');
    Add('dbFldNotFound', 'Camp no trobat:');
    Add('clDSNotIncl', '(taula no est� incl�s en el Report.DataSets)');
    Add('clUnknownVar', 'Camp o variable desconeguts:');
    Add('clScrError', 'Script error a %s: %s');
    Add('clDSNotExist', 'La taula "%s" no existeix');
    Add('clErrors', 'Ha ocorregut el seg�ent error(s):');
    Add('clExprError', 'Error en l''''expressi�');
    Add('clFP3files', 'Informe preparat');
    Add('clSaving', 'Guardant fitxer...');
    Add('clCancel', 'Cancel�lar');
    Add('clClose', 'Tancar');
    Add('clPrinting', 'Imprimint p�gina');
    Add('clLoading', 'Llegint fitxer...');
    Add('clPageOf', 'P�gina %d de %d');
    Add('clFirstPass', 'Primera passada: p�gina ');
    Add('clNoPrinters', 'No hi ha impressores instal�lades en el teu sistema');
    Add('clDecompressError', 'Error de descompressi�');

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