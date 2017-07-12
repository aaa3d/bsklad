
{******************************************}
{                                          }
{             FastReport v3.0              }
{         Language resource file           }
{                                          }
{         Copyright (c) 1998-2005          }
{         by Alexander Tzyganenko,         }
{            Fast Reports Inc.             }
{                                          }
{     French Translation by Pierre Y.      }
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
      'Caption=Pr�visualisation' + #13#10 +
      'PrintB.Caption=Imprimer' + #13#10 +
      'PrintB.Hint=Imprimer' + #13#10 +
      'OpenB.Caption=Ouvrir' + #13#10 +
      'OpenB.Hint=Ouvrir' + #13#10 +
      'SaveB.Caption=Enregistrer' + #13#10 +
      'SaveB.Hint=Enregistrer' + #13#10 +
      'ExportB.Caption=Exporter' + #13#10 +
      'ExportB.Hint=Exporter' + #13#10 +
      'FindB.Caption=Chercher' + #13#10 +
      'FindB.Hint=Chercher' + #13#10 +
      'ZoomWholePageB.Caption=Page enti�re' + #13#10 +
      'ZoomWholePageB.Hint=Page enti�re' + #13#10 +
      'ZoomPageWidthB.Caption=Largeur de la page' + #13#10 +
      'ZoomPageWidthB.Hint=Largeur de la page' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=Deux pages' + #13#10 +
      'Zoom50B.Hint=Deux pages' + #13#10 +
      'ZoomCB.Hint=Zoom' + #13#10 +
      'PageSettingsB.Caption=Marges' + #13#10 +
      'PageSettingsB.Hint=Marges' + #13#10 +
      'OutlineB.Caption=Profil' + #13#10 +
      'OutlineB.Hint=Profil' + #13#10 +
      'HandToolB.Caption=D�placement' + #13#10 +
      'HandToolB.Hint=Outil de d�placement' + #13#10 +
      'ZoomToolB.Caption=Zoom' + #13#10 +
      'ZoomToolB.Hint=Loupe' + #13#10 +
      'NewPageB.Caption=Ajouter' + #13#10 +
      'NewPageB.Hint=Ajouter une page' + #13#10 +
      'DelPageB.Caption=Supprimer' + #13#10 +
      'DelPageB.Hint=Supprimer la page' + #13#10 +
      'DesignerB.Caption=Modifier' + #13#10 +
      'DesignerB.Hint=Modifier la page' + #13#10 +
      'FirstB.Caption=D�but' + #13#10 +
      'FirstB.Hint=Premi�re page' + #13#10 +
      'PriorB.Caption=Pr�c�dente' + #13#10 +
      'PriorB.Hint=Page pr�c�dente' + #13#10 +
      'NextB.Caption=Suivante' + #13#10 +
      'NextB.Hint=Page suivante' + #13#10 +
      'LastB.Caption=Fin' + #13#10 +
      'LastB.Hint=Derni�re page' + #13#10 +
      'CancelB.Caption=Fermer' + #13#10 +
      'PageE.Hint=Num�ro de page' + #13#10 +
      '');
    Add('zmPageWidth', 'Largeur de la page');
    Add('zmWholePage', 'Page enti�re');

    Add('TfrxPrintDialog',
      'Caption=Imprimer' + #13#10 +
      'Label12.Caption=Imprimante   ' + #13#10 +
      'DescrL.Caption=Tapez les n� des pages et/ou des �tendues de pages � imprimer s�par�es par des virgules (1,3,5-12).' + #13#10 +
      'Label1.Caption=Pages   ' + #13#10 +
      'CopiesL.Caption=Nombre de copies' + #13#10 +
      'CollateL.Caption=Assembl�es' + #13#10 +
      'Label2.Caption=Copies   ' + #13#10 +
      'PrintL.Caption=Imprimer' + #13#10 +
      'TypeL.Caption=Type :' + #13#10 +
      'WhereL.Caption=O� :' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      'PropButton.Caption=Propri�t�s...' + #13#10 +
      'AllRB.Caption=Tout' + #13#10 +
      'CurPageRB.Caption=Page en cours' + #13#10 +
      'PageNumbersRB.Caption=Pages :' + #13#10 +
      'FileCB.Caption=Imprimer dans un fichier' + #13#10 +
      'ReverseCB.Caption=Inverser les pages' + #13#10 +
      '');
    Add('ppAll', 'Pages paires et impaires');
    Add('ppOdd', 'Pages impaires');
    Add('ppEven', 'Pages paires');

    Add('TfrxSearchDialog',
      'Caption=Chercher du texte' + #13#10 +
      'TextL.Caption=Texte � chercher :' + #13#10 +
      'SearchL.Caption=Options de recherche   ' + #13#10 +
      'ReplaceL.Caption=Remplacer par   ' + #13#10 +
      'TopCB.Caption=Chercher depuis le d�but' + #13#10 +
      'CaseCB.Caption=Respecter la casse' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Mise en page' + #13#10 +
      'WidthL.Caption=Largeur' + #13#10 +
      'HeightL.Caption=Hauteur' + #13#10 +
      'SizeL.Caption=Taille   ' + #13#10 +
      'OrientationL.Caption=Orientation   ' + #13#10 +
      'LeftL.Caption=Gauche' + #13#10 +
      'TopL.Caption=Hauteur' + #13#10 +
      'RightL.Caption=Droite' + #13#10 +
      'BottomL.Caption=Bas' + #13#10 +
      'MarginsL.Caption=Marges   ' + #13#10 +
      'PortraitRB.Caption=Portrait' + #13#10 +
      'LandscapeRB.Caption=Paysage' + #13#10 +
      'cmL1.Caption=cm' + #13#10 +
      'cmL2.Caption=cm' + #13#10 +
      'cmL3.Caption=cm' + #13#10 +
      'cmL4.Caption=cm' + #13#10 +
      'cmL5.Caption=cm' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      'OtherL.Caption=Autres   ' + #13#10 +
      'ApplyToCurRB.Caption=Appliquer � la page en cours' + #13#10 +
      'ApplyToAllRB.Caption=Appliquer � toutes les pages' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Imprimer' + #13#10 +
      'PrinterL.Caption=Imprimante   ' + #13#10 +
      'PagesL.Caption=Pages   ' + #13#10 +
      'CopiesL.Caption=Copies   ' + #13#10 +
      'CopiesNL.Caption=Nombre de copies' + #13#10 +
      'DescrL.Caption=Tapez le n� des pages ou des �tendues de pages � imprimer s�par�s par des virgules (1,3,5-12).' + #13#10 +
      'OptionsL.Caption=Options   ' + #13#10 +
      'EscL.Caption=Commandes d''�chappement   ' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Annuler' + #13#10 +
      'SaveToFileCB.Caption=Imprimer dans un fichier' + #13#10 +
      'AllRB.Caption=Tout' + #13#10 +
      'CurPageRB.Caption=Page en cours' + #13#10 +
      'PageNumbersRB.Caption=Pages:' + #13#10 +
      'PageBreaksCB.Caption=Sauts de pages' + #13#10 +
      'OemCB.Caption=Page de code OEM' + #13#10 +
      'PseudoCB.Caption=Pseudo-graphique' + #13#10 +
      'SaveDialog1.Filter=Fichier d''impression (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Annuler' + #13#10 +
      '');

    Add('mbConfirm', 'Confirmer');
    Add('mbError', 'Erreur');
    Add('mbInfo', 'Information');
    Add('xrCantFindClass', 'Ne peut pas trouver la classe');
    Add('prVirtual', 'Virtuel');
    Add('prDefault', 'Par d�faut');
    Add('prCustom', 'Personnalis�');
    Add('enUnconnHeader', 'L''ent�te ou le pied de page ne sont pas connect�s');
    Add('enUnconnGroup', 'Il n''y a pas de bande de donn�es pour ce groupe');
    Add('enUnconnGFooter', 'Il n''y a pas d''ent�te de groupe pour');
    Add('enBandPos', 'Position de la bande incorrecte :');
    Add('dbNotConn', 'L''ensemble de donn�es %s n''est pas connect� � des donn�es');
    Add('dbFldNotFound', 'Le champ n''a pas �t� trouv� :');
    Add('clDSNotIncl', '(l''ensemble de donn�es n''est pas inclus dans Report.DataSets)');
    Add('clUnknownVar', 'Variable ou champ de donn�es inconnu :');
    Add('clScrError', 'Erreur dans le script � la ligne %s: %s');
    Add('clDSNotExist', 'L''ensemble de donn�es "%s" n''existe pas');
    Add('clErrors', 'La ou les erreur(s) suivante(s) se sont produites :');
    Add('clExprError', 'Erreur dans l''expression');
    Add('clFP3files', 'Rapport pr�par�');
    Add('clSaving', 'Enregistre le fichier...');
    Add('clCancel', 'Annuler');
    Add('clClose', 'Fermer');
    Add('clPrinting', 'Imprime la page');
    Add('clLoading', 'Charge le fichier...');
    Add('clPageOf', 'Page %d sur %d');
    Add('clFirstPass', 'Premi�re passe : page ');
    Add('clNoPrinters', 'Il n''y a pas d''imprimante install�e dans votre syst�me');
    Add('clDecompressError', 'Erreur lors de la d�compression du Flux de donn�es');
    Add('crFillMx', 'Remplissage du tableau crois�...');
    Add('crBuildMx', 'Fabrication du tableau crois�...');

    Add('prRunningFirst', 'Premi�re passe : page %d');
    Add('prRunning', 'Pr�pare la page %d');
    Add('prPrinting', 'Imprime la page %d');
    Add('prExporting', 'Exporte la page %d');
    Add('uCm', 'cm');
    Add('uInch', 'in');
    Add('uPix', 'px');
    Add('uChar', 'chr');
  end;
end;


initialization
  frAddClassesRes;

end.