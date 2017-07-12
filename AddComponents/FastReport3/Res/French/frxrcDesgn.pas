
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
      'Caption=Inspecteur d''objets' + #13#10 +
      '');
    Add('oiProp', 'Propri�t�s');
    Add('oiEvent', 'Ev�nements');

    Add('TfrxDataTreeForm',
      'Caption=Arbre des donn�es' + #13#10 +
      'DataTS.Caption=Donn�es' + #13#10 +
      'VariablesTS.Caption=Variables' + #13#10 +
      'FunctionsTS.Caption=Fonctions' + #13#10 +
      'InsFieldCB.Caption=Cr�er le champ' + #13#10 +
      'InsCaptionCB.Caption=Cr�er le libell�' + #13#10 +
      '');
    Add('dtNoData', 'Pas de donn�e disponible');
    Add('dtData', 'Donn�es');
    Add('dtSysVar', 'Variables syst�me');
    Add('dtVar', 'Variables');
    Add('dtFunc', 'Fonctions');

    Add('TfrxReportTreeForm',
      'Caption=Arbre du rapport' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Ouvrir un fichier de script' + #13#10 +
      'SaveScriptB.Hint=Enregistrer le script dans un fichier' + #13#10 +
      'RunScriptB.Hint=Ex�cuter le script' + #13#10 +
      'StepScriptB.Hint=Pas � pas' + #13#10 +
      'StopScriptB.Hint=Terminer le script' + #13#10 +
      'EvaluateB.Hint=Evaluer' + #13#10 +
      'LangL.Caption=Langage:' + #13#10 +
      'AlignTB.Caption=Alignement' + #13#10 +
      'AlignLeftsB.Hint=Aligner � gauche' + #13#10 +
      'AlignHorzCentersB.Hint=Aligner au milieu' + #13#10 +
      'AlignRightsB.Hint=Aligner � droite' + #13#10 +
      'AlignTopsB.Hint=Aligner au dessus' + #13#10 +
      'AlignVertCentersB.Hint=Aligner au centre' + #13#10 +
      'AlignBottomsB.Hint=Aligner en bas' + #13#10 +
      'SpaceHorzB.Hint=Espacer horizontalement' + #13#10 +
      'SpaceVertB.Hint=Espacer verticalement' + #13#10 +
      'CenterHorzB.Hint=Centrer horizontalement dans la bande' + #13#10 +
      'CenterVertB.Hint=Centrer verticalement dans la bande' + #13#10 +
      'SameWidthB.Hint=M�me largeur' + #13#10 +
      'SameHeightB.Hint=M�me hauteur' + #13#10 +
      'TextTB.Caption=Texte' + #13#10 +
      'StyleCB.Hint=Style' + #13#10 +
      'FontNameCB.Hint=Nom de la police' + #13#10 +
      'FontSizeCB.Hint=Taille du texte' + #13#10 +
      'BoldB.Hint=Gras' + #13#10 +
      'ItalicB.Hint=Italique' + #13#10 +
      'UnderlineB.Hint=Soulign�' + #13#10 +
      'FontColorB.Hint=Couleur du texte' + #13#10 +
      'HighlightB.Hint=Surligner' + #13#10 +
      'RotateB.Hint=Rotation du texte' + #13#10 +
      'TextAlignLeftB.Hint=Aligner � gauche' + #13#10 +
      'TextAlignCenterB.Hint=Aligner au centre' + #13#10 +
      'TextAlignRightB.Hint=Aligner � droite' + #13#10 +
      'TextAlignBlockB.Hint=Justifier' + #13#10 +
      'TextAlignTopB.Hint=Aligner au dessus' + #13#10 +
      'TextAlignMiddleB.Hint=Aligner au milieu' + #13#10 +
      'TextAlignBottomB.Hint=Aligner en bas' + #13#10 +
      'FrameTB.Caption=Bordure' + #13#10 +
      'FrameTopB.Hint=Bordure du dessus' + #13#10 +
      'FrameBottomB.Hint=Bordure en dessous' + #13#10 +
      'FrameLeftB.Hint=Bordure � gauche' + #13#10 +
      'FrameRightB.Hint=Bordure � droite' + #13#10 +
      'FrameAllB.Hint=Toutes les bordures' + #13#10 +
      'FrameNoB.Hint=Aucune bordure' + #13#10 +
      'ShadowB.Hint=Ombre' + #13#10 +
      'FillColorB.Hint=Couleur de l''arri�re plan' + #13#10 +
      'FrameColorB.Hint=Couleur de la bordure' + #13#10 +
      'FrameStyleB.Hint=Style de la bordure' + #13#10 +
      'FrameWidthCB.Hint=Epaisseur de la bordure' + #13#10 +
      'StandardTB.Caption=Standard' + #13#10 +
      'NewB.Hint=Nouveau rapport' + #13#10 +
      'OpenB.Hint=Ouvrir un rapport' + #13#10 +
      'SaveB.Hint=Enregistrer le rapport' + #13#10 +
      'PreviewB.Hint=Aper�u avant impression' + #13#10 +
      'NewPageB.Hint=Nouvelle page de rapport' + #13#10 +
      'NewDialogB.Hint=Nouvelle page de dialogue' + #13#10 +
      'DeletePageB.Hint=Supprimer la page en cours' + #13#10 +
      'PageSettingsB.Hint=Mise en page' + #13#10 +
      'VariablesB.Hint=Variables' + #13#10 +
      'CutB.Hint=Couper' + #13#10 +
      'CopyB.Hint=Copier' + #13#10 +
      'PasteB.Hint=Coller' + #13#10 +
      'SampleFormatB.Hint=Copier la mise en forme' + #13#10 +
      'UndoB.Hint=Annuler' + #13#10 +
      'RedoB.Hint=Refaire' + #13#10 +
      'ShowGridB.Hint=Voir la grille' + #13#10 +
      'AlignToGridB.Hint=Aligner sur la grille' + #13#10 +
      'SetToGridB.Hint=Arranger sur la grille' + #13#10 +
      'ScaleCB.Hint=Zoom' + #13#10 +
      'ExtraToolsTB.Caption=Outils suppl�mentaires' + #13#10 +
      'ObjectSelectB.Hint=Outil de s�lection' + #13#10 +
      'HandToolB.Hint=Outil de d�placement' + #13#10 +
      'ZoomToolB.Hint=Loupe' + #13#10 +
      'TextToolB.Hint=Outil d''�dition du texte' + #13#10 +
      'FormatToolB.Hint=Outil de copie de la mise en forme' + #13#10 +
      'ObjectBandB.Hint=Ins�rer une bande' + #13#10 +
      'FileMenu.Caption=&Fichier' + #13#10 +
      'EditMenu.Caption=&Edition' + #13#10 +
      'FindMI.Caption=Chercher...' + #13#10 +
      'FindNextMI.Caption=Chercher suivant' + #13#10 +
      'ReplaceMI.Caption=Remplacer...' + #13#10 +
      'ReportMenu.Caption=&Rapport' + #13#10 +
      'ReportDataMI.Caption=Donn�es...' + #13#10 +
      'ReportSettingsMI.Caption=Options...' + #13#10 +
      'ReportStylesMI.Caption=Styles...' + #13#10 +
      'ViewMenu.Caption=&Voir' + #13#10 +
      'ToolbarsMI.Caption=Barres d''outils' + #13#10 +
      'StandardMI.Caption=Standard' + #13#10 +
      'TextMI.Caption=Texte' + #13#10 +
      'FrameMI.Caption=Bordure' + #13#10 +
      'AlignmentMI.Caption=Palette d''alignement' + #13#10 +
      'ToolsMI.Caption=Outils supppl�mentaies' + #13#10 +
      'InspectorMI.Caption=Inspecteur d''objets' + #13#10 +
      'DataTreeMI.Caption=Arbre des donn�es' + #13#10 +
      'ReportTreeMI.Caption=Arbre du rapport' + #13#10 +
      'ShowRulersMI.Caption=R�gles' + #13#10 +
      'ShowGuidesMI.Caption=Guides' + #13#10 +
      'DeleteGuidesMI.Caption=Enlever les guides' + #13#10 +
      'OptionsMI.Caption=Options...' + #13#10 +
      'HelpMenu.Caption=&Aide' + #13#10 +
      'HelpContentsMI.Caption=Aide...' + #13#10 +
      'AboutMI.Caption=A propos de FastReport...' + #13#10 +
      'TabOrderMI.Caption=Ordre de tabulation...' + #13#10 +
      'UndoCmd.Caption=Annuler' + #13#10 +
      'RedoCmd.Caption=Refaire' + #13#10 +
      'CutCmd.Caption=Couper' + #13#10 +
      'CopyCmd.Caption=Copier' + #13#10 +
      'PasteCmd.Caption=Coller' + #13#10 +
      'DeleteCmd.Caption=Supprimer' + #13#10 +
      'DeletePageCmd.Caption=Supprimer la page en cours' + #13#10 +
      'SelectAllCmd.Caption=S�lectionner tout' + #13#10 +
      'EditCmd.Caption=Editer...' + #13#10 +
      'BringToFrontCmd.Caption=Mettre au premier plan' + #13#10 +
      'SendToBackCmd.Caption=Mettre � l''arri�re plan' + #13#10 +
      'NewItemCmd.Caption=Nouveau...' + #13#10 +
      'NewReportCmd.Caption=Nouveau rapport' + #13#10 +
      'NewPageCmd.Caption=Nouvelle page' + #13#10 +
      'NewDialogCmd.Caption=Nouvelle page de dialogue' + #13#10 +
      'OpenCmd.Caption=Ouvrir...' + #13#10 +
      'SaveCmd.Caption=Enregistrer' + #13#10 +
      'SaveAsCmd.Caption=Enregistrer sous...' + #13#10 +
      'VariablesCmd.Caption=Variables...' + #13#10 +
      'PageSettingsCmd.Caption=Mise en page...' + #13#10 +
      'PreviewCmd.Caption=Aper�u avant impression' + #13#10 +
      'ExitCmd.Caption=Quitter' + #13#10 +
      'ReportTitleMI.Caption=Titre du rapport' + #13#10 +
      'ReportSummaryMI.Caption=R�sum� du rapport' + #13#10 +
      'PageHeaderMI.Caption=Ent�te de page' + #13#10 +
      'PageFooterMI.Caption=Pied de page' + #13#10 +
      'HeaderMI.Caption=Ent�te' + #13#10 +
      'FooterMI.Caption=Pied' + #13#10 +
      'MasterDataMI.Caption=Donn�es : Ma�tre' + #13#10 +
      'DetailDataMI.Caption=Donn�es : D�tail' + #13#10 +
      'SubdetailDataMI.Caption=Donn�es : Sous-d�tail' + #13#10 +
      'Data4levelMI.Caption=Donn�es : 4i�me niveau' + #13#10 +
      'Data5levelMI.Caption=Donn�es : 5i�me niveau' + #13#10 +
      'Data6levelMI.Caption=Donn�es : 6i�me niveau' + #13#10 +
      'GroupHeaderMI.Caption=Ent�te de groupe' + #13#10 +
      'GroupFooterMI.Caption=Pied de groupe' + #13#10 +
      'ChildMI.Caption=Enfant' + #13#10 +
      'ColumnHeaderMI.Caption=Ent�te de colonne' + #13#10 +
      'ColumnFooterMI.Caption=Pied de colonne' + #13#10 +
      'OverlayMI.Caption=Surimpression' + #13#10 +
      'VerticalbandsMI.Caption=Bandes verticales' + #13#10 +
      'HeaderMI1.Caption=Ent�te' + #13#10 +
      'FooterMI1.Caption=Pied' + #13#10 +
      'MasterDataMI1.Caption=Donn�es : Ma�tre' + #13#10 +
      'DetailDataMI1.Caption=Donn�es : D�tail' + #13#10 +
      'SubdetailDataMI1.Caption=Donn�es : Sous-d�tail' + #13#10 +
      'GroupHeaderMI1.Caption=Ent�te de groupe' + #13#10 +
      'GroupFooterMI1.Caption=Pied de groupe' + #13#10 +
      'ChildMI1.Caption=Enfant' + #13#10 +
      'R0MI.Caption=0�' + #13#10 +
      'R45MI.Caption=45�' + #13#10 +
      'R90MI.Caption=90�' + #13#10 +
      'R180MI.Caption=180�' + #13#10 +
      'R270MI.Caption=270�' + #13#10 +
      'FontB.Hint=Police' + #13#10 +
      'BoldMI.Caption=Gras' + #13#10 +
      'ItalicMI.Caption=Italique' + #13#10 +
      'UnderlineMI.Caption=Soulign�' + #13#10 +
      'SuperScriptMI.Caption=Exposant' + #13#10 +
      'SubScriptMI.Caption=Indice' + #13#10 +
      'CondensedMI.Caption=Condens�' + #13#10 +
      'WideMI.Caption=Large' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'OpenDialog.Filter=Rapport (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=Fichiers pascal (*.pas)|*.pas|Fichiers C++ (*.cpp)|*.cpp|Fichiers JavaScript (*.js)|*.js|Fichiers Basic (*.vb)|*.vb|Tous les fichiers (*.*)|*.*' + #13#10 +
      'SaveScriptDialog.Filter=Fichiers pascal (*.pas)|*.pas|Fichiers C++ (*.cpp)|*.cpp|Fichiers JavaScript (*.js)|*.js|Fichiers Basic (*.vb)|*.vb|Tous les fichiers (*.*)|*.*' + #13#10 +
      'GroupB.Hint=Grouper' + #13#10 +
      'UngroupB.Hint=D�grouper' + #13#10 +
      'GroupCmd.Caption=Grouper' + #13#10 +
      'UngroupCmd.Caption=D�grouper' + #13#10 +
      '');
    Add('dsCm', 'Centim�tres');
    Add('dsInch', 'Pouces');
    Add('dsPix', 'Pixels');
    Add('dsChars', 'Caract�res');
    Add('dsCode', 'Code');
    Add('dsPage', 'Page');
    Add('dsRepFilter', 'Rapport (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'Rapport compress� (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', 'Enregistrer les changements de l''aper�u avant impression ?');
    Add('dsSaveChangesTo', 'Enregistrer les changements dans ');
    Add('dsCantLoad', 'Ne peut pas charger le fichier');
    Add('dsStyleFile', 'Style');
    Add('dsCantFindProc', 'Ne peut pas trouver le point d''entr�e');
    Add('dsClearScript', 'Ceci va effacer tout le code du script. Voulez-vous continuer ?');
    Add('dsNoStyle', 'Pas de style');
    Add('dsStyleSample', 'Exemple de style');
    Add('dsTextNotFound', 'Le texte ''%s'' n''a pas �t� trouv�');
    Add('dsReplace', 'Remplacer cette occurence de ''%s''?');

    Add('TfrxAboutForm',
      'Caption=A propos de FastReport' + #13#10 +
      'Label4.Caption=Visitez notre page web :' + #13#10 +
      'Label6.Caption=Commercial :' + #13#10 +
      'Label8.Caption=Support :' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Page Options' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      'TabSheet1.Caption=Papier' + #13#10 +
      'Label1.Caption=Largeur' + #13#10 +
      'Label2.Caption=Hauteur' + #13#10 +
      'Label11.Caption=Taille   ' + #13#10 +
      'Label12.Caption=Orientation   ' + #13#10 +
      'Label3.Caption=Gauche' + #13#10 +
      'Label4.Caption=Haut' + #13#10 +
      'Label5.Caption=Droite' + #13#10 +
      'Label6.Caption=Bas' + #13#10 +
      'Label13.Caption=Marges   ' + #13#10 +
      'Label14.Caption=Sources de papier   ' + #13#10 +
      'Label9.Caption=Premi�re page' + #13#10 +
      'Label10.Caption=Autres pages' + #13#10 +
      'PortraitRB.Caption=Portrait' + #13#10 +
      'LandscapeRB.Caption=Paysage' + #13#10 +
      'TabSheet3.Caption=Autres options' + #13#10 +
      'Label7.Caption=Colonnes   ' + #13#10 +
      'Label8.Caption=Nombre' + #13#10 +
      'Label15.Caption=Largeur' + #13#10 +
      'Label16.Caption=Positions' + #13#10 +
      'Label17.Caption=Autres   ' + #13#10 +
      'Label18.Caption=Duplex' + #13#10 +
      'PrintOnPrevCB.Caption=Imprimer sur la page pr�c�dente' + #13#10 +
      'MirrorMarginsCB.Caption=Marges "miroir" (pour reliure)' + #13#10 +
      'LargeHeightCB.Caption=Grande hauteur en mode conception' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=S�lectionnez les ensembles de donn�es du rapport' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Editer les variables' + #13#10 +
      'NewCategoryB.Caption=Cat�gories' + #13#10 +
      'NewVarB.Caption=Variable' + #13#10 +
      'EditB.Caption=Editer' + #13#10 +
      'DeleteB.Caption=Supprimer' + #13#10 +
      'EditListB.Caption=Liste' + #13#10 +
      'LoadB.Caption=Charger' + #13#10 +
      'SaveB.Caption=Sauver' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'ExprPanel.Caption= Expression :' + #13#10 +
      'OpenDialog1.Filter=Dictionnaire (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Dictionnaire (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(aucune variable n''est d�finie)');
    Add('vaVar', 'Variables');
    Add('vaDupName', 'Nom en double');

    Add('TfrxOptionsEditor',
      'Caption=Designer Options' + #13#10 +
      'Label1.Caption=Grille   ' + #13#10 +
      'Label2.Caption=Type' + #13#10 +
      'Label3.Caption=Taille' + #13#10 +
      'Label4.Caption=Fiche de dialogue :' + #13#10 +
      'Label5.Caption=Autres   ' + #13#10 +
      'Label6.Caption=Polices   ' + #13#10 +
      'Label7.Caption=Fen�tre de code' + #13#10 +
      'Label8.Caption=Editeur de m�mo' + #13#10 +
      'Label9.Caption=Taille' + #13#10 +
      'Label10.Caption=Taille' + #13#10 +
      'Label11.Caption=Couleurs   ' + #13#10 +
      'Label12.Caption=Espace entre les bandes :' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=in' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      'CMRB.Caption=Centim�tres :' + #13#10 +
      'InchesRB.Caption=Pouces :' + #13#10 +
      'PixelsRB.Caption=Pixels :' + #13#10 +
      'ShowGridCB.Caption=Voir la grille' + #13#10 +
      'AlignGridCB.Caption=Aligner sur la grille' + #13#10 +
      'EditAfterInsCB.Caption=Montrer l''�diteur apr�s insertion' + #13#10 +
      'ObjectFontCB.Caption=Utiliser les polices des objets' + #13#10 +
      'WorkspaceB.Caption=Espace de travail' + #13#10 +
      'ToolB.Caption=Fen�tres d''outils' + #13#10 +
      'LCDCB.Caption=Grille de couleurs LCD' + #13#10 +
      'FreeBandsCB.Caption=Positionnement libre des bandes' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Param�tres par d�faut' + #13#10 +
      'BandsCaptionsCB.Caption=Voir le nom des bandes' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=S�lectionnez un ensemble de donn�es' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      '');
    Add('dbNotAssigned', '[non assign�]');
    Add('dbSingleLine', 'Une seule ligne');

    Add('TfrxGroupEditorForm',
      'Caption=Groupe' + #13#10 +
      'BreakOnL.Caption=Grouper sur   ' + #13#10 +
      'OptionsL.Caption=Options   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      'DataFieldRB.Caption=Champ de donn�es' + #13#10 +
      'ExpressionRB.Caption=Expression' + #13#10 +
      'KeepGroupTogetherCB.Caption=Conserver les groupes ensemble' + #13#10 +
      'StartNewPageCB.Caption=Commencer une nouvelle page' + #13#10 +
      'OutlineCB.Caption=Voir dans le profil' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=M�mo syst�me' + #13#10 +
      'DataBandL.Caption=Bande de donn�es' + #13#10 +
      'DataSetL.Caption=Dataset' + #13#10 +
      'DataFieldL.Caption=Champ' + #13#10 +
      'FunctionL.Caption=Fonction' + #13#10 +
      'ExpressionL.Caption=Expression' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      'AggregateRB.Caption=Agr�gat' + #13#10 +
      'SysVariableRB.Caption=Variable syst�me' + #13#10 +
      'CountInvisibleCB.Caption=Compter les bandes invisibles' + #13#10 +
      'TextRB.Caption=Texte' + #13#10 +
      'RunningTotalCB.Caption=Running total' + #13#10 +
      '');
    Add('agAggregate', 'Ins�rer un agr�gat');
    Add('vt1', '[DATE]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGES#]');
    Add('vt5', '[PAGE#] of [TOTALPAGES#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=Objet OLE' + #13#10 +
      'InsertB.Caption=Ins�rer...' + #13#10 +
      'EditB.Caption=Editer...' + #13#10 +
      'CloseB.Caption=Fermer' + #13#10 +
      '');
    Add('olStretched', 'Etir�');

    Add('TfrxBarcodeEditorForm',
      'Caption=Editeur de codes � barres' + #13#10 +
      'CodeLbl.Caption=Code' + #13#10 +
      'TypeLbl.Caption=Type de code' + #13#10 +
      'ZoomLbl.Caption=Zoom:' + #13#10 +
      'OptionsLbl.Caption=Options   ' + #13#10 +
      'RotationLbl.Caption=Rotation   ' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CalcCheckSumCB.Caption=Calculer le code de contr�le' + #13#10 +
      'ViewTextCB.Caption=Voir le texte' + #13#10 +
      'Rotation0RB.Caption=0�' + #13#10 +
      'Rotation90RB.Caption=90�' + #13#10 +
      'Rotation180RB.Caption=180�' + #13#10 +
      'Rotation270RB.Caption=270�' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Calculer le code contr�le');
    Add('bcShowText', 'Voir le texte');

    Add('TfrxAliasesEditorForm',
      'Caption=Editer les alias' + #13#10 +
      'HintL.Caption=Appuyez sur entr�e pour editer un alias' + #13#10 +
      'DSAliasL.Caption=Alias de l''ensemble de donn�es' + #13#10 +
      'FieldAliasesL.Caption=Alias des champs' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      'ResetB.Caption=Recommencer' + #13#10 +
      'UpdateB.Caption=Update' + #13#10 +
      '');
    Add('alUserName', 'Nom de l''utilisateur');
    Add('alOriginal', 'Nom d''origine');

    Add('TfrxParamsEditorForm',
      'Caption=Editeur de param�tres' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      '');
    Add('qpName', 'Nom');
    Add('qpDataType', 'Type de donn�e');
    Add('qpValue', 'Valeur');

    Add('TfrxMDEditorForm',
      'Caption=Lien ma�tre-d�tail' + #13#10 +
      'Label1.Caption=Champs d�tail' + #13#10 +
      'Label2.Caption=Champs ma�tre' + #13#10 +
      'Label3.Caption=Champs li�s' + #13#10 +
      'AddB.Caption=Ajouter' + #13#10 +
      'ClearB.Caption=Effacer' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=M�mo' + #13#10 +
      'ExprB.Hint=Ins�rer une expression' + #13#10 +
      'AggregateB.Hint=Ins�rer un agr�gat' + #13#10 +
      'LocalFormatB.Hint=Ins�rer une valeur format�e' + #13#10 +
      'WordWrapB.Hint=Retour � la ligne' + #13#10 +
      'CancelB.Hint=Annuler' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=Image' + #13#10 +
      'LoadB.Hint=Charger' + #13#10 +
      'CopyB.Hint=Copier' + #13#10 +
      'PasteB.Hint=Coller' + #13#10 +
      'ClearB.Hint=Effacer' + #13#10 +
      'CancelB.Hint=Annuler' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('piEmpty', 'Vide');

    Add('TfrxChartEditorForm',
      'Caption=Editeur de graphes' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=Ajouter des s�ries' + #13#10 +
      'DeleteB.Hint=Supprimer des s�ries' + #13#10 +
      'DBSourceRB.Caption=Donn�es depuis BDD' + #13#10 +
      'BandSourceRB.Caption=Band source' + #13#10 +
      'FixedDataRB.Caption=Donn�es fig�es' + #13#10 +
      'DatasetLbl.Caption=Dataset' + #13#10 +
      'BandLbl.Caption=Data band' + #13#10 +
      'X1Lbl.Caption=Valeurs X' + #13#10 +
      'Y1Lbl.Caption=Valeurs Y' + #13#10 +
      'X2Lbl.Caption=Valeurs X' + #13#10 +
      'Y2Lbl.Caption=Valeurs Y' + #13#10 +
      'X3Lbl.Caption=Valeurs X (par exemple a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Valeurs Y (par exemple 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Autres options   ' + #13#10 +
      'ShowTopLbl.Caption=TopN values' + #13#10 +
      'CaptionLbl.Caption=TopN caption' + #13#10 +
      'SortLbl.Caption=Ordre de tri' + #13#10 +
      'LineMI.Caption=Lignes' + #13#10 +
      'AreaMI.Caption=Aires' + #13#10 +
      'PointMI.Caption=Points' + #13#10 +
      'BarMI.Caption=Barres' + #13#10 +
      'HorizBarMI.Caption=Barres horiz.' + #13#10 +
      'PieMI.Caption=Camembert' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Ligne rapide' + #13#10 +
      '');
    Add('ch3D', 'En 3D');
    Add('chAxis', 'Voir les axes');
    Add('chsoNone', 'Aucun');
    Add('chsoAscending', 'Ascendant');
    Add('chsoDescending', 'Descendant');

    Add('TfrxRichEditorForm',
      'Caption=Editeur RTF' + #13#10 +
      'OpenB.Hint=Ouvrir un fichier' + #13#10 +
      'SaveB.Hint=Enregistrer dans un fichier' + #13#10 +
      'UndoB.Hint=Annuler' + #13#10 +
      'TTB.Hint=Police' + #13#10 +
      'ExprB.Hint=Ins�rer une expression' + #13#10 +
      'CancelB.Hint=Annuler' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      'BoldB.Hint=Gras' + #13#10 +
      'ItalicB.Hint=Italique' + #13#10 +
      'UnderlineB.Hint=Soulign�' + #13#10 +
      'LeftAlignB.Hint=Aligner � gauche' + #13#10 +
      'CenterAlignB.Hint=Aligner au centre' + #13#10 +
      'RightAlignB.Hint=Aligner � droite' + #13#10 +
      'BlockAlignB.Hint=Justifier' + #13#10 +
      'BulletsB.Hint=Puces' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Editeur de tableau crois�' + #13#10 +
      'DatasetL.Caption=Donn�es source   ' + #13#10 +
      'DimensionsL.Caption=Dimensions   ' + #13#10 +
      'RowsL.Caption=Lignes' + #13#10 +
      'ColumnsL.Caption=Colonnes' + #13#10 +
      'CellsL.Caption=Cellules' + #13#10 +
      'StructureL.Caption=Structure du tableau crois�   ' + #13#10 +
      'RowHeaderCB.Caption=Ent�te en ligne' + #13#10 +
      'ColumnHeaderCB.Caption=Ent�te en colonne' + #13#10 +
      'RowTotalCB.Caption=Grand total en ligne' + #13#10 +
      'ColumnTotalCB.Caption=Grand total en colonne' + #13#10 +
      'SwapB.Hint=Echanger les lignes et les colonnes' + #13#10 +
      'StyleCB.Hint=Style du tableau crois�' + #13#10 +
      'FontB.Hint=Police' + #13#10 +
      'AlignLeftB.Hint=Aligner � gauche' + #13#10 +
      'AlignCenterB.Hint=Centrer' + #13#10 +
      'AlignRightB.Hint=Aligner � droite' + #13#10 +
      'RotationB.Hint=Rotation du texte' + #13#10 +
      'HighlightB.Hint=Surlignement' + #13#10 +
      'FormatB.Hint=Format' + #13#10 +
      'FrameB.Hint=Bordures' + #13#10 +
      'FillColorB.Hint=Couleur de remplissage' + #13#10 +
      'Func1MI.Caption=Aucune' + #13#10 +
      'Func2MI.Caption=Somme' + #13#10 +
      'Func3MI.Caption=Min' + #13#10 +
      'Func4MI.Caption=Max' + #13#10 +
      'Func5MI.Caption=Moyenne' + #13#10 +
      'Func6MI.Caption=Nombre' + #13#10 +
      'Sort1MI.Caption=Ascendant (A-Z)' + #13#10 +
      'Sort2MI.Caption=Descendant (Z-A)' + #13#10 +
      'Sort3MI.Caption=Pas de tri' + #13#10 +
      'BoldMI.Caption=Gras' + #13#10 +
      'ItalicMI.Caption=Italique' + #13#10 +
      'UnderlineMI.Caption=Soulign�' + #13#10 +
      'SuperScriptMI.Caption=Exposant' + #13#10 +
      'SubScriptMI.Caption=Indice' + #13#10 +
      'CondensedMI.Caption=Condens�' + #13#10 +
      'WideMI.Caption=Large' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=Annuler' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('crSubtotal', 'Sous-total');
    Add('crNone', 'Aucun');
    Add('crSum', 'Somme');
    Add('crMin', 'Min');
    Add('crMax', 'Max');
    Add('crAvg', 'Moyenne');
    Add('crCount', 'Nombre');
    Add('crAsc', 'A-Z');
    Add('crDesc', 'Z-A');
    Add('crRepHdrs', 'R�imprimer les ent�tes');
    Add('crBorder', 'Encadrement');
    Add('crDown', 'Vers le bas puis vers la droite');

    Add('TfrxExprEditorForm',
      'Caption=Editeur d''expression' + #13#10 +
      'ExprL.Caption=Expression :' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=Format d''affichage' + #13#10 +
      'CategoryL.Caption=Cat�gorie' + #13#10 +
      'FormatL.Caption=Format' + #13#10 +
      'FormatStrL.Caption=Cha�ne format :' + #13#10 +
      'SeparatorL.Caption=S�parateur d�cimal :' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      '');
    Add('fkText', 'Texte (sans formattage)');
    Add('fkNumber', 'Nombre');
    Add('fkDateTime', 'Date/Heure');
    Add('fkBoolean', 'Bool�en');
    Add('fkNumber1', '1234.5;%g');
    Add('fkNumber2', '1234.50;%2.2f');
    Add('fkNumber3', '1 234.50;%2.2n');
    Add('fkNumber4', '1 234.50 �;%2.2m');
    Add('fkDateTime1', '28.11.2002;dd.mm.yyyy');
    Add('fkDateTime2', '28 nov 2002;dd mmm yyyy');
    Add('fkDateTime3', '28 novembre 2002;dd mmmm yyyy');
    Add('fkDateTime4', '02:14;hh:mm');
    Add('fkDateTime5', '02:14am;hh:mm am/pm');
    Add('fkDateTime6', '02:14:00;hh:mm:ss');
    Add('fkDateTime7', '02:14, 28 novembre 2002;hh:mm, dd mmmm yyyy');
    Add('fkBoolean1', '0,1;0,1');
    Add('fkBoolean2', 'Non,Oui;No,Yes');
    Add('fkBoolean3', '_,x;_,x');
    Add('fkBoolean4', 'Faux,Vrai;False,True');

    Add('TfrxHighlightEditorForm',
      'Caption=Surlignage' + #13#10 +
      'FontColorB.Caption=Couleur...' + #13#10 +
      'BackColorB.Caption=Couleur...' + #13#10 +
      'ConditionL.Caption=Condition   ' + #13#10 +
      'FontL.Caption=Police   ' + #13#10 +
      'BackgroundL.Caption=Fond   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      'BoldCB.Caption=Gras' + #13#10 +
      'ItalicCB.Caption=Italique' + #13#10 +
      'UnderlineCB.Caption=Soulign�' + #13#10 +
      'TransparentRB.Caption=Transparent' + #13#10 +
      'OtherRB.Caption=Autre' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Param�tres du rapport' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      'GeneralTS.Caption=G�n�ral' + #13#10 +
      'ReportSettingsL.Caption=Param�trage de l''imprimante   ' + #13#10 +
      'CopiesL.Caption=Copies' + #13#10 +
      'GeneralL.Caption=G�n�ral   ' + #13#10 +
      'PasswordL.Caption=Password' + #13#10 +
      'CollateCB.Caption=Copies assembl�es' + #13#10 +
      'DoublePassCB.Caption=Double passe' + #13#10 +
      'PrintIfEmptyCB.Caption=Imprimer s''il est vide' + #13#10 +
      'DescriptionTS.Caption=Description' + #13#10 +
      'NameL.Caption=Nom' + #13#10 +
      'Description1L.Caption=Description' + #13#10 +
      'PictureL.Caption=Image' + #13#10 +
      'AuthorL.Caption=Auteur' + #13#10 +
      'MajorL.Caption=Majeure' + #13#10 +
      'MinorL.Caption=Mineure' + #13#10 +
      'ReleaseL.Caption=Release' + #13#10 +
      'BuildL.Caption=Build' + #13#10 +
      'CreatedL.Caption=Cr�ation' + #13#10 +
      'ModifiedL.Caption=Modification' + #13#10 +
      'DescriptionL.Caption=Description   ' + #13#10 +
      'VersionL.Caption=Version   ' + #13#10 +
      'PictureB.Caption=Parcourir...' + #13#10 +
      '');
    Add('rePrnOnPort', 'sur');

    Add('TfrxStringsEditorForm',
      'Caption=Lignes' + #13#10 +
      'CancelB.Hint=Annuler' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=Annuler' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=Mot de passe' + #13#10 +
      'PasswordL.Caption=Entrez le mot de passe :' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=Editeur de styles' + #13#10 +
      'ColorB.Caption=Couleur...' + #13#10 +
      'FontB.Caption=Police...' + #13#10 +
      'FrameB.Caption=Bordures...' + #13#10 +
      'AddB.Hint=Ajouter' + #13#10 +
      'DeleteB.Hint=Supprimer' + #13#10 +
      'EditB.Hint=Editer' + #13#10 +
      'LoadB.Hint=Charger' + #13#10 +
      'SaveB.Hint=Enregistrer' + #13#10 +
      'CancelB.Hint=Annuler' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=Editeur de bordures' + #13#10 +
      'FrameL.Caption=Bordure' + #13#10 +
      'LineL.Caption=Lignes' + #13#10 +
      'ShadowL.Caption=Ombre' + #13#10 +
      'FrameTopB.Hint=Ligne du haut' + #13#10 +
      'FrameBottomB.Hint=Ligne du bas' + #13#10 +
      'FrameLeftB.Hint=Ligne de gauche' + #13#10 +
      'FrameRightB.Hint=Ligne de droite' + #13#10 +
      'FrameAllB.Hint=Atoutes les lignes de la bordure' + #13#10 +
      'FrameNoB.Hint=Pas de bordure' + #13#10 +
      'FrameColorB.Hint=Couleur de la bordure' + #13#10 +
      'FrameStyleB.Hint=Style de la bordure' + #13#10 +
      'FrameWidthCB.Hint=Epaisseur de la bordure' + #13#10 +
      'ShadowB.Hint=Ombre' + #13#10 +
      'ShadowColorB.Hint=Couleur de l''ombre' + #13#10 +
      'ShadowWidthCB.Hint=Epaisseur de l''ombre' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=Nouvel item' + #13#10 +
      'ItemsTab.Caption=Items' + #13#10 +
      'TemplatesTab.Caption=Mod�les' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Ordre de tabulation' + #13#10 +
      'Label1.Caption=Contr�les dans l''ordre de tabulation :' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      'UpB.Caption=Monter' + #13#10 +
      'DownB.Caption=Descendre' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Evaluer' + #13#10 +
      'Label1.Caption=Expression' + #13#10 +
      'Label2.Caption=R�sultat' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Assistant de rapport' + #13#10 +
      'DataTab.Caption=Donn�es' + #13#10 +
      'GroupsTab.Caption=Groupes' + #13#10 +
      'LayoutTab.Caption=Disposition' + #13#10 +
      'StyleTab.Caption=Style' + #13#10 +
      'Step1L.Caption=Etape 1. S�lectionnez l''ensemble de donn�es et les champs � afficher.' + #13#10 +
      'Step2L.Caption=Etape 2. Cr�ez des groupes (facultatif).' + #13#10 +
      'Step3L.Caption=Etape 3. Choisissez l''orientation de la page et la disposition des donn�es.' + #13#10 +
      'Step4L.Caption=Etape 4. Choisissez le style du rapport.' + #13#10 +
      'AddFieldB.Caption=Ajouter >' + #13#10 +
      'AddAllFieldsB.Caption=Ajouter tout >>' + #13#10 +
      'RemoveFieldB.Caption=< Enlever' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Enlever tout' + #13#10 +
      'AddGroupB.Caption=Ajouter >' + #13#10 +
      'RemoveGroupB.Caption=< Enlever' + #13#10 +
      'SelectedFieldsL.Caption=Champs s�lectionn�s :' + #13#10 +
      'AvailableFieldsL.Caption=Champs disponibles :' + #13#10 +
      'GroupsL.Caption=Groupes :' + #13#10 +
      'OrientationL.Caption=Orientation   ' + #13#10 +
      'LayoutL.Caption=Disposition   ' + #13#10 +
      'PortraitRB.Caption=Portrait' + #13#10 +
      'LandscapeRB.Caption=Payasage' + #13#10 +
      'TabularRB.Caption=Tableau' + #13#10 +
      'ColumnarRB.Caption=Colonnes' + #13#10 +
      'FitWidthCB.Caption=Ajuster les champs � la largeur de la page' + #13#10 +
      'CancelB.Caption=Annuler' + #13#10 +
      'BackB.Caption=<< Pr�c�dent' + #13#10 +
      'NextB.Caption=Suivant >>' + #13#10 +
      'FinishB.Caption=Termin�' + #13#10 +
      '');
    Add('wzStd', 'Assistant rapport imprimante standard');
    Add('wzDMP', 'Assistant rapport imprimante � aiguilles');
    Add('wzStdEmpty', 'Rapport pour imprimante standard');
    Add('wzDMPEmpty', 'Rapport pour imprimante � aiguilles');


    Add('ftAllFiles', 'Tous les fichiers');
    Add('ftPictures', 'Images');
    Add('ftDB', 'Bases de donn�es');
    Add('ftRichFile', 'Fichier texte mis en forme');
    Add('ftTextFile', 'Fichier texte');

    Add('prNotAssigned', '(Non assign�)');
    Add('prInvProp', 'Valeur de propri�t� invalide');
    Add('prDupl', 'Nom en double');
    Add('prPict', '(Image)');

    Add('mvExpr', 'Autoriser les expressions');
    Add('mvStretch', 'Etirer');
    Add('mvStretchToMax', 'Etirer � la hauteur maximum');
    Add('mvShift', 'D�placer');
    Add('mvShiftOver', 'D�placer quand il est recouvert');
    Add('mvVisible', 'Visible');
    Add('mvPrintable', 'Imprimable');
    Add('mvFont', 'Police...');
    Add('mvFormat', 'Format d''affichage...');
    Add('mvClear', 'Effacer le contenu');
    Add('mvAutoWidth', 'Largeur automatique');
    Add('mvWWrap', 'Retour � la ligne');
    Add('mvSuppress', 'Enlever les valeurs r�p�t�es');
    Add('mvHideZ', 'Cacher les z�ros');
    Add('mvHTML', 'Autoriser le HTML');
    Add('lvDiagonal', 'Diagonale');
    Add('pvAutoSize', 'Ajuster automatiquement');
    Add('pvCenter', 'Centrer');
    Add('pvAspect', 'Conserver l''aspect');
    Add('bvSplit', 'Autoriser le d�coupage');
    Add('bvKeepChild', 'Ne pas s�parer des enfants');
    Add('bvPrintChild', 'Imprimer les enfants si invisible');
    Add('bvStartPage', 'Commencer une nouvelle page');
    Add('bvPrintIfEmpty', 'Imprimer si d�tail vide');
    Add('bvKeepDetail', 'Ne pas s�parer des d�tails');
    Add('bvKeepFooter', 'Ne pas s�parer des pieds');
    Add('bvReprint', 'R�imprimer si nouvelle page');
    Add('bvOnFirst', 'Imprimer sur la premi�re page');
    Add('bvOnLast', 'Imprimer sur la derni�re page');
    Add('bvKeepGroup', 'Ne pas s�parer');
    Add('bvFooterAfterEach', 'Imprimer le pied apr�s chaque ligne');
    Add('srParent', 'Imprimer sur le parent');

    Add('obCatDraw', 'Formes');
    Add('obCatOther', 'Autres objets');
    Add('obCatOtherControls', 'Autres contr�les');
    Add('obDiagLine', 'Ligne diagonale');
    Add('obRect', 'Rectangle');
    Add('obRoundRect', 'Rectangle arrondi');
    Add('obEllipse', 'Ellipse');
    Add('obTrian', 'Triangle');
    Add('obDiamond', 'Diamant');
    Add('obLabel', 'Contr�le texte');
    Add('obEdit', 'Contr�le d''�dition');
    Add('obMemoC', 'Contr�le m�mo');
    Add('obButton', 'Contr�le bouton');
    Add('obChBoxC', 'Contr�le case � cocher');
    Add('obRButton', 'Contr�le bouton radio');
    Add('obLBox', 'Contr�le liste');
    Add('obCBox', 'Contr�le liste d�roulante');
    Add('obDateEdit', 'Contr�le date');
    Add('obImageC', 'Contr�le image');
    Add('obPanel', 'Contr�le panel');
    Add('obGrBox', 'Contr�le groupe d''options');
    Add('obBBtn', 'Contr�le BitBtn');
    Add('obSBtn', 'Contr�le SpeedButton');
    Add('obMEdit', 'Contr�le masque d''�dition');
    Add('obChLB', 'Contr�le liste avec cases � cocher');
    Add('obDBLookup', 'Contr�le liste d�roulante de recherche BDD');
    Add('obBevel', 'Objet profondeur');
    Add('obShape', 'Objet forme');
    Add('obText', 'Objet texte');
    Add('obSysText', 'Objet texte syst�me');
    Add('obLine', 'Objet ligne');
    Add('obPicture', 'Objet image');
    Add('obBand', 'Objet bande');
    Add('obDataBand', 'Bande de donn�es');
    Add('obSubRep', 'Objet sous-rapport');
    Add('obDlgPage', 'Fiche de dialogue');
    Add('obRepPage', 'Page de rapport');
    Add('obReport', 'Objet rapport');
    Add('obRich', 'Objet texte mis en forme');
    Add('obOLE', 'Objet OLE');
    Add('obChBox', 'Objet case � cocher');
    Add('obChart', 'Objet graphique');
    Add('obBarC', 'Objet code � barres');
    Add('obCross', 'Objet tableau crois�');
    Add('obDBCross', 'Objet tableau crois� BDD');
    Add('obGrad', 'Objet d�grad�');
    Add('obDMPText', 'Objet texte pour imprimante � aiguilles');
    Add('obDMPLine', 'Objet ligne pour imprimante � aiguilles');
    Add('obBDEDB', 'Base de donn�es BDE');
    Add('obBDETb', 'Table BDE');
    Add('obBDEQ', 'Requ�te BDE');
    Add('obBDEComps', 'Composants BDE');
    Add('obIBXDB', 'Base de donn�es IBX');
    Add('obIBXTb', 'Table IBX');
    Add('obIBXQ', 'Requ�te IBX');
    Add('obIBXComps', 'Composants IBX');
    Add('obADODB', 'Base de donn�es ADO');
    Add('obADOTb', 'Table ADO');
    Add('obADOQ', 'Requ�te ADO');
    Add('obADOComps', 'Composants ADO');
    Add('obDBXDB', 'Base de don�es DBX');
    Add('obDBXTb', 'Table DBX');
    Add('obDBXQ', 'Requ�te DBX');
    Add('obDBXComps', 'Composants DBX');

    Add('ctString', 'Cha�nes');
    Add('ctDate', 'Dates et heures');
    Add('ctConv', 'Conversions');
    Add('ctFormat', 'Mise en forme');
    Add('ctMath', 'Math�matiques');
    Add('ctOther', 'Autres');

    Add('IntToStr', 'Convertit une valeur enti�re en une cha�ne');
    Add('FloatToStr', 'Convertit une valeur num�rique � virgule flottante en une cha�ne');
    Add('DateToStr', 'Convertit une date en une cha�ne');
    Add('TimeToStr', 'Convertit une heure en une chaine');
    Add('DateTimeToStr', 'Convertit une valeur date et heure en une cha�ne');
    Add('VarToStr', 'Convertit une valeur variant en une cha�ne');
    Add('StrToInt', 'Convertit une cha�ne en une valeur enti�re');
    Add('StrToFloat', 'Convertit une cha�ne en une valeur num�rique � virgule flottante');
    Add('StrToDate', 'Convertit une cha�ne en une date');
    Add('StrToTime', 'Convertit une cha�ne en une heure');
    Add('StrToDateTime', 'Convertit une cha�ne en une date et heure');
    Add('Format', 'Renvoie une cha�ne formatt�e � partir d''une s�rie d''arguments pass�s dans un tableau');
    Add('FormatFloat', 'Formate une valeur num�rique � virgule flottante');
    Add('FormatDateTime', 'Formate une valeur date et heure');
    Add('FormatMaskText', 'Renvoie une cha�ne format�e en utilisant un masque d''�dition');
    Add('EncodeDate', 'Renvoie une valeur TDateTime pour l''Ann�e, le Mois et le Jour sp�cifi�s');
    Add('DecodeDate', 'Extrait l''Ann�e, le Mois et le Jour d''une valeur TDateTime sp�cifi�');
    Add('EncodeTime', 'Renvoie une valeur TDateTime pour les heures, les minutes, les secondes et les millisecondes sp�cifi�s');
    Add('DecodeTime', 'Extrait les heures, les minutes, les secondes et les millisecondes d''une valeur TDateTime');
    Add('Date', 'Renvoie la date courante');
    Add('Time', 'Renvoie l''heure courante');
    Add('Now', 'Renvoie l''heure et la date courantes');
    Add('DayOfWeek', 'Renvoie le jour de la semaine pour la date sp�cifi�e');
    Add('IsLeapYear', 'Indique si l''ann�e sp�cifi�e est bissextile');
    Add('DaysInMonth', 'Renvoie le nombre de jours pour le mois sp�cifi�');
    Add('Length', 'Renvoie la longueur d''une cha�ne');
    Add('Copy', 'Renvoie une sous-cha�ne d''une cha�ne');
    Add('Pos', 'Renvoie la position d''une sous-cha�ne dans une cha�ne');
    Add('Delete', 'Enl�ve une sous-cha�ne d''une cha�ne');
    Add('Insert', 'Ins�re une sous-cha�ne dans une cha�ne');
    Add('Uppercase', 'Convertit tous les caract�res d''une cha�ne en majuscules');
    Add('Lowercase', 'Convertit tous les caract�res d''une cha�ne en minuscules');
    Add('Trim', 'Supprime les espaces se trouvant en d�but et en fin d''une cha�ne');
    Add('NameCase', 'Convertit le premier caract�re d''un mot en majuscule');
    Add('CompareText', 'Compare deux cha�nes');
    Add('Chr', 'Convertit un entier en un caract�re');
    Add('Ord', 'Convertit un caract�re en un entier');
    Add('SetLength', 'D�finit la longueur d''une cha�ne');
    Add('Round', 'Arrondit une valeur num�rique � virgule flottante au nombre entier le plus proche');
    Add('Trunc', 'Tronque une valeur num�rique � virgule flottante en un entier');
    Add('Int', 'Renvoie la partie enti�re d''un nombre r�el');
    Add('Frac', 'Renvoie la partie fractionnaire d''un nombre r�el');
    Add('Sqrt', 'Renvoie la racine carr�e d''un nombre sp�cifi�');
    Add('Abs', 'Renvoie la valeur absolue d''un nombre sp�cifi�');
    Add('Sin', 'Renvoie le sinus d''un angle (en radians)');
    Add('Cos', 'Renvoie le cosinus d''un angle (en radians)');
    Add('ArcTan', 'Renvoie l''arc-tangente d''un angle (en radians)');
    Add('Tan', 'Renvoie la tangente d''un angle (en radians)');
    Add('Exp', 'Renvoie l''exponentielle d''un nombre');
    Add('Ln', 'Renvoie la logarithme naturel d''une expression r�elle');
    Add('Pi', 'Renvoie le nombre 3.1415926...');
    Add('Inc', 'Incr�mente une valeur');
    Add('Dec', 'D�cr�mente une valeur');
    Add('RaiseException', 'L�ve une exception');
    Add('ShowMessage', 'Montre une bo�te de message');
    Add('Randomize', 'Initialise le g�n�rateur de nombres pseudo-al�atoires');
    Add('Random', 'Renvoie un nombre al�atoire');
    Add('ValidInt', 'Renvoie Vrai si la cha�ne sp�cifi�e contient un nombre entier valide');
    Add('ValidFloat', 'Renvoie Vrai si la cha�ne sp�cifi�e contient un nombre � virgule flottante valide');
    Add('ValidDate', 'Renvoie Vrai si la cha�ne sp�cifi�e contient une date valide');
    Add('IIF', 'Renvoie ValeurSiVrai si l''expression Expr sp�cifi�e est vraie, sinon renvoie ValeurSiFaux');
    Add('Get', 'Pour utilisation interne uniquement');
    Add('Set', 'Pour utilisation interne uniquement');
    Add('InputBox', 'Montre une bo�te de saisie qui permet � l''utilisateur de saisir une cha�ne');
    Add('InputQuery', 'Montre une bo�te de saisie qui permet � l''utilisateur de saisir une cha�ne');
    Add('MessageDlg', 'Montre une bo�te de message');
    Add('CreateOleObject', 'Cr�e un objet OLE');
    Add('VarArrayCreate', 'Cr�e un tableau de variants');
    Add('VarType', 'Renvoie le type d''une valeur variant');
    Add('DayOf', 'Renvoie le num�ro du jour (1..31) de la date donn�e');
    Add('MonthOf', 'Renvoie le num�ro du mois (1..12) de la date donn�e');
    Add('YearOf', 'Renvoie l''ann�e de la date donn�e');

    Add('ctAggregate', 'Agr�gat');
    Add('Sum', 'Calcule la somme des valeurs de Expr pour les lignes de la bande de donn�es');
    Add('Avg', 'Calcule la moyenne des valeurs de Expr pour les lignes de la bande de donn�es');
    Add('Min', 'Calcule le minimum des valeurs de Expr pour les lignes de la bande de donn�es');
    Add('Max', 'Calcule le maximum des valeurs de Expr pour les lignes de la bande de donn�es');
    Add('Count', 'Calcule le nombre de lignes de la bande de donn�es');
  end;
end;


initialization
  frAddDesignerRes;

end.