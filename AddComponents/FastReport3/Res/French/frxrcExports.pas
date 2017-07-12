
{******************************************}
{                                          }
{             FastReport v3.0              }
{         Language resource file           }
{                                          }
{            Copyright (c) 2004            }
{          by Alexander Fediachov,         }
{             Fast Reports, Inc.           }
{                                          }
{     French Translation by Pierre Y.      }
{                                          }
{******************************************}

unit frxrcExports;

interface

procedure frAddExportsRes;

implementation

uses frxRes;

procedure frAddExportsRes;
begin
  with frxResources do
  begin
    frxResources.Add('TfrxXLSExportDialog',
      'Caption=Exporter vers Excel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      'GroupPageRange.Caption= Etendue des pages ' + #13#10 +
      'AllRB.Caption=Toutes' + #13#10 +
      'CurPageRB.Caption=Page courante' + #13#10 +
      'PageNumbersRB.Caption=Pages :' + #13#10 +
      'DescrL.Caption=Entrez un n° de page ou d''étendue à exporter séparés par des virgules (1,3,5-12).' + #13#10 +
      'GroupQuality.Caption= Paramètres de l''exportation ' + #13#10 +
      'StylesCB.Caption=Styles' + #13#10 +
      'PicturesCB.Caption=Images' + #13#10 +
      'MergeCB.Caption=Fusionner les cellules' + #13#10 +
      'PageBreaksCB.Caption=Sauts de page' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Ouvrir Excel après l''exportation' + #13#10 +
      'SaveDialog1.Filter=Fichiers Excel (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=Exporter vers Excel en XML' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      'GroupPageRange.Caption= Etendue des pages ' + #13#10 +
      'AllRB.Caption=Toutes' + #13#10 +
      'CurPageRB.Caption=Page courante' + #13#10 +
      'PageNumbersRB.Caption=Pages:' + #13#10 +
      'DescrL.Caption=Entrez un n° de page ou d''étendue à exporter séparés par des virgules (1,3,5-12).' + #13#10 +
      'GroupQuality.Caption= Paramètres de l''exportation ' + #13#10 +
      'StylesCB.Caption=Styles' + #13#10 +
      'PageBreaksCB.Caption=Sauts de page' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Ouvrir Excel après l''exportation' + #13#10 +
      'SaveDialog1.Filter=Fichiers XML Excel (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=Exporter en tableau HTML' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      'GroupPageRange.Caption= Etendue des pages ' + #13#10 +
      'AllRB.Caption=Toutes' + #13#10 +
      'CurPageRB.Caption=Page courante' + #13#10 +
      'PageNumbersRB.Caption=Pages :' + #13#10 +
      'DescrL.Caption=Entrez un n° de page ou d''étendue à exporter séparés par des virgules (1,3,5-12).' + #13#10 +
      'GroupQuality.Caption= Paramètres de l''exportation ' + #13#10 +
      'OpenAfterCB.Caption=Ouvrir le fichier après l''exportation' + #13#10 +
      'StylesCB.Caption=Styles' + #13#10 +
      'PicturesCB.Caption=Images' + #13#10 +
      'PicsSameCB.Caption=Tout dans un seul dossier' + #13#10 +
      'FixWidthCB.Caption=Largeur fixe' + #13#10 +
      'NavigatorCB.Caption=Navigateur de pages' + #13#10 +
      'MultipageCB.Caption=Multi-pages' + #13#10 +
      'MozillaCB.Caption=Navigateur Mozilla' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=Fichiers HTML (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Exporter en texte (pour les imprimantes à aiguilles)' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Annuler' + #13#10 +
      'BtnPreview.Hint=Aperçu oui/non' + #13#10 +
      'GroupCellProp.Caption= Propriétés de l''exportation ' + #13#10 +
      'CB_PageBreaks.Caption=Sauts de page' + #13#10 +
      'CB_OEM.Caption=Page de code OEM' + #13#10 +
      'CB_EmptyLines.Caption=Lignes vides' + #13#10 +
      'CB_LeadSpaces.Caption=Espaces de début de ligne' + #13#10 +
      'GroupPageRange.Caption= Etendue des pages ' + #13#10 +
      'Pages.Caption=Pages :' + #13#10 +
      'Descr.Caption=Entrez un n° de page ou d''étendue à exporter séparés par des virgules (1,3,5-12).' + #13#10 +
      'GroupScaleSettings.Caption= Echelle ' + #13#10 +
      'ScX.Caption=Dimensionnement en X' + #13#10 +
      'ScY.Caption=Dimensionnement en Y' + #13#10 +
      'GroupFramesSettings.Caption= Bordures ' + #13#10 +
      'RB_NoneFrames.Caption=Aucune' + #13#10 +
      'RB_Simple.Caption=Simples' + #13#10 +
      'RB_Graph.Caption=Graphiques' + #13#10 +
      'RB_Graph.Hint=Seulement avec les pages de code OEM' + #13#10 +
      'CB_PrintAfter.Caption=Imprimer après l''exportation' + #13#10 +
      'CB_Save.Caption=Enregistrer les paramètres' + #13#10 +
      'GroupBox1.Caption= Aperçu ' + #13#10 +
      'Label1.Caption=Largeur :' + #13#10 +
      'Label3.Caption=Hauteur :' + #13#10 +
      'LBPage.Caption=Page' + #13#10 +
      'ToolButton1.Hint=Zoom avant' + #13#10 +
      'ToolButton2.Hint=Zoom arrière' + #13#10 +
      'SaveDialog1.Filter=Fichiers texte (pour les imprimantes à aiguilles)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Imprimer' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Annuler' + #13#10 +
      'GroupBox1.Caption=Imprimante' + #13#10 +
      'Label4.Caption=Nom' + #13#10 +
      'PropButton.Caption=Paramètres...' + #13#10 +
      'GroupBox3.Caption=Copies' + #13#10 +
      'Label2.Caption=Nombre de copies' + #13#10 +
      'GroupBox2.Caption= Paramètres d''initialisation de l''imprimante ' + #13#10 +
      'Label1.Caption=Type d''imprimante' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Modèles d''initialisation de l''imprimante (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=Modèles d''initialisation de l''imprimante (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=Exporter en RTF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      'GroupPageRange.Caption= Etendue des pages ' + #13#10 +
      'AllRB.Caption=Toutes' + #13#10 +
      'CurPageRB.Caption=Page courante' + #13#10 +
      'PageNumbersRB.Caption=Pages :' + #13#10 +
      'DescrL.Caption=Entrez un n° de page ou d''étendue à exporter séparés par des virgules (1,3,5-12).' + #13#10 +
      'GroupQuality.Caption= Paramètres de l''exportation ' + #13#10 +
      'PicturesCB.Caption=Images' + #13#10 +
      'PageBreaksCB.Caption=Sauts de page' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenCB.Caption=Ouvrir le fichier après l''exportation' + #13#10 +
      'SaveDialog1.Filter=Fichiers RTF (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Paramètrage de l''exportation' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Annuler' + #13#10 +
      'GroupPageRange.Caption= Etendue des pages  ' + #13#10 +
      'AllRB.Caption=Toutes' + #13#10 +
      'CurPageRB.Caption=Page courante' + #13#10 +
      'PageNumbersRB.Caption=Pages:' + #13#10 +
      'DescrL.Caption=Entrez un n° de page ou d''étendue à exporter séparés par des virgules (1,3,5-12).' + #13#10 +
      'GroupBox1.Caption= Paramètres de l''image ' + #13#10 +
      'Label2.Caption=Qualité JPEG' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=Découper les pages' + #13#10 +
      'Mono.Caption=Monochrome' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=Exporter en PDF' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      'GroupPageRange.Caption= Etendue des pages ' + #13#10 +
      'AllRB.Caption=Toutes' + #13#10 +
      'CurPageRB.Caption=Page courante' + #13#10 +
      'PageNumbersRB.Caption=Pages :' + #13#10 +
      'DescrL.Caption=Entrez un n° de page ou d''étendue à exporter séparés par des virgules (1,3,5-12).' + #13#10 +
      'GroupQuality.Caption= Paramètres de l''exportation ' + #13#10 +
      'CompressedCB.Caption=Compressé' + #13#10 +
      'EmbeddedCB.Caption=Inclure les polices' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenCB.Caption=Ouvrir le fichier après l''exportation' + #13#10 +
      'SaveDialog1.Filter=Fichier Adobe PDF (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'Fichier RTF');
    Add('BMPexport', 'Image BMP');
    Add('JPEGexport', 'Image JPEG');
    Add('TIFFexport', 'Image TIFF');
    Add('TextExport', 'Texte (imprimante à aiguilles)');
    Add('XlsOLEexport', 'Tableau Excel (OLE)');
    Add('HTMLexport', 'Fichier HTML');
    Add('XlsXMLexport', 'Tableau Excel (XML)');
    Add('PDFexport', 'Fichier PDF');

    Add('ProgressWait', 'Patientez');
    Add('ProgressRows', 'Mise en forme des lignes');
    Add('ProgressColumns', 'Mise en forme des colonnes');
    Add('ProgressStyles', 'Mise en forme des styles');
    Add('ProgressObjects', 'Mise en forme des objets');


    Add('TIFFexportFilter', 'Image TIFF (*.tif)|*.tif');
    Add('BMPexportFilter', 'Image BMP (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Image JPEG (*.jpg)|*.jpg');

    Add('HTMLNavFirst', 'First');
    Add('HTMLNavPrev', 'Prev');
    Add('HTMLNavNext', 'Next');
    Add('HTMLNavLast', 'Last');
    Add('HTMLNavRefresh', 'Refresh');
    Add('HTMLNavPrint', 'Print');
    Add('HTMLNavTotal', 'Total pages');
  end;
end;

initialization
  frAddExportsRes;

end.
