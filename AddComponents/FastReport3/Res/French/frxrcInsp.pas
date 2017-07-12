
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

unit frxrcInsp;

interface

procedure frAddInspectorRes;


implementation

uses frxRes;


procedure frAddInspectorRes;
begin
  with frxResources do
  begin
    Add('propActive', 'D�termine si un ensemble de donn�es est ouvert ou pas');
    Add('propActive.TfrxHighlight', 'D�termine si le surlignement est actif ou pas');
    Add('propAliasName', 'Le nom de l''alias BDE');
    Add('propAlign', 'D�termine l''alignement de l''objet relativement � la bande ou � la page');
    Add('propAlignment', 'D�termine l''alignement du texte de l''objet');
    Add('propAllowAllUp', 'D�termine si tous les SpeedButtons du groupe peuvent �tre d�s�lectionn�s en m�me temps');
    Add('propAllowEdit', 'D�termine si l''utilisateur peut modifier les pages du rapport pr�par�');
    Add('propAllowExpressions', 'D�termine si le texte de l''objet texte peut contenir des expressions');
    Add('propAllowGrayed', 'Autorise l''�tat gris� des contr�les cases � cocher');
    Add('propAllowHTMLTags', 'D�termine si le texte de l''objet texte peut contenir du HTML');
    Add('propAllowSplit', 'D�termine si le contenu de la bande peut �tre imprim� sur plusieurs pages');
    Add('propAuthor', 'L''auteur du rapport');
    Add('propAutoSize', 'D�termine si l''image doit g�rer sa taille automatiquement');
    Add('propAutoWidth', 'D�termine si l''objet texte peut g�rer sa largeur automatiquement');
    Add('propBackPicture', 'L''image de fond de la page');
    Add('propBarType', 'Le type du code � barres');
    Add('propBevelInner', 'Le type de l''effet de profondeur int�rieur');
    Add('propBevelOuter', 'Le type de l''effet de profondeur ext�rieur');
    Add('propBevelWidth', 'La taille de l''effet de profondeur');
    Add('propBorder', 'D�termine si l''on doit voir la bordure ext�rieure ou pas');
    Add('propBorderStyle', 'Le style de la fen�tre');
    Add('propBottomMargin', 'La hauteur de la marge de bas de page');
    Add('propBrushStyle', 'La style de la brosse utilis�e pour peindre le fond de l''objet');
    Add('propButtons', 'L''ensemble des boutons visibles dans la fen�tre d''aper�u avant impression');
    Add('propCacheSize', 'Quantit� de m�moire maximum utilis�e par le moteur de rapport. Si cette valeur est d�pass�e, les pages d�j� pr�par�es seront mises en cache dans un fichier sur le disque');
    Add('propCalcCheckSum', 'D�termine si le code � barres doit calculer automatiquement sa somme de contr�le');
    Add('propCancel', 'D�termine si le bouton doit �tre activ� lorsque la touche ESC est press�e');
    Add('propCaption', 'Le titre du contr�le');
    Add('propCellFields', 'Noms des champs de la base de donn�es qui repr�sentes les cellules crois�es');
    Add('propCellLevels', 'Nombre de niveaux de cellules');
    Add('propCenter', 'D�termine si l''image doit �tre centr�e � l''int�rieur du contr�le');
    Add('propCharset', 'Le jeu de caract�res de la police');
    Add('propCharSpacing', 'Nombre de pixels entre deux caract�res');
    Add('propCheckColor', 'La couleur de la marque de s�lection');
    Add('propChecked', 'D�termine si le contr�le est s�lectionn�');
    Add('propCheckStyle', 'Le style de la marque de s�lection');
    Add('propChild', 'Bande enfant connect�e � cette bande');
    Add('propCollate', 'Ordre de tri par d�faut');
    Add('propColor.TFont', 'La couleur du texte');
    Add('propColor', 'La couleur de l''objet');
    Add('propColor.TfrxFrame', 'La couleur de la bordure');
    Add('propColor.TfrxHighlight', 'La couleur de l''objet si le surlignement est actif');
    Add('propColumnFields', 'Noms des champs de la base de donn�es qui repr�sentent les colonnes crois�es');
    Add('propColumnGap', 'L''espace entre les colonnes dans les bandes');
    Add('propColumnLevels', 'Nombre de niveaux en colonnes');
    Add('propColumns', 'Nombre de colonnes dans la bande');
    Add('propColumnWidth', 'la largeur des colonnes dans les bandes');
    Add('propCondition', 'La condition de groupement. Le groupe change lorsque la valeur de cette expression change');
    Add('propCondition.TfrxHighlight', 'Cha�ne d''expression. Si cette valeur est vraie, le surlignement est activ�');
    Add('propConnected', 'Indique si la connexion � la base de donn�es est active');
    Add('propConvertNulls', 'D�termine si les valeurs NULL de la base de donn�es seront converties en 0, en valeur "fausse" ou en cha�ne vide');
    Add('propCopies', 'Le nombre de copies par d�faut');
    Add('propCursor', 'Le curseur de l''objet');
    Add('propDatabaseName', 'Le nom de la base de donn�es');
    Add('propDataField', 'Indique le champ depuis lequel l''objet r�cup�re ses donn�es');
    Add('propDataSet', 'Lie l''objet � un ensemble de donn�es qui contient les champs qu''il utilise');
    Add('propDate', 'La valeur date du contr�le');
    Add('propDateFormat', 'D�termine le format dans lequel la date est repr�sent�e');
    Add('propDecimalSeparator', 'Le s�parateur d�cimal');
    Add('propDefault', 'D�termine si ce bouton est le bouton par d�faut');
    Add('propDefHeight', 'Hauteur par d�faut de la ligne');
    Add('propDescription', 'La description du rapport');
    Add('propDiagonal', 'Indique que la ligne est une diagonale');
    Add('propDisplayFormat', 'Le format de la valeur affich�e');
    Add('propDoubleBuffered', 'D�termine si la fen�tre d''aper�u utilise la technique du double buffering (tampon double). Activer le double buffering emp�che le scintillement mais il est plus lent');
    Add('propDoublePass', 'D�termine si le moteur de rapports doit effectuer la deuxi�me passe');
    Add('propDown', 'D�termine si le SpeedButton est enfonc� ou pas');
    Add('propDownThenAcross', 'D�termine comment les grand tableaux crois�s seront d�coup�s en pages');
    Add('propDriverName', 'Le nom du driver BDE');
    Add('propDropShadow', 'D�termine si les objets ont une ombre');
    Add('propDuplex', 'Indique l''utilisation du mode duplex pour la page');
    Add('propEditMask', 'D�termine le masque qui permet de valider le texte d''un contr�le � masque d''�dition');
    Add('propEnabled', 'D�termine si le contr�le est actif');
    Add('propEngineOptions', 'Les options du moteur de rapport');
    Add('propExpression', 'La valeur de cette expression sera affich� dans l''objet');
    Add('propExpressionDelimiters', 'Les caract�res qui seront utilis�s pour d�limiter les expressions contenues dans le texte');
    Add('propFieldAliases', 'Les alias des champs de l''ensemble de donn�es');
    Add('propFilter', 'La condition de filtrage de l''ensemble de donn�es');
    Add('propFiltered', 'D�termine si les enregistrements de l''ensemble de donn�es doivent �tre filtr�s en utilisant la condition de la propri�t� Filter');
    Add('propFlowTo', 'L''objet texte qui permettra d''afficher le texte qui d�passe de l''objet');
    Add('propFont', 'Les attributs de la police de l''objet');
    Add('propFooterAfterEach', 'D�termine si la bande pied doit �tre affich�e apr�s chaque ligne de donn�es');
    Add('propFormatStr', 'La cha�ne de formatage');
    Add('propFrame', 'Les attributs de la bordure de l''objet');
    Add('propGapX', 'L''espace vide � gauche du texte de l''objet');
    Add('propGapY', 'L''espace vide au dessus du texte de l''objet');
    Add('propGlyph', 'L''image du contr�le');
    Add('propGroupIndex', 'Permet aux SpeedButtons de fonctionner ensemble dans un groupe');
    Add('propHAlign', 'L''alignement horizontal du texte');
    Add('propHeight', 'La hauteur de l''objet');
    Add('propHGuides', 'Les guides horizontaux de la page');
    Add('propHideZeros', 'D�termine si l''objet texte doit cacher les valeurs � z�ro');
    Add('propHighlight', 'Les attributs du surlignement conditionnel');
    Add('propIndexName', 'Le nom de l''index');
    Add('propInitString', 'La cha�ne d''initialisation pour les rapports � destination d''une imprimante � aiguilles');
    Add('propItems', 'Liste de valeurs de l''objet');
    Add('propKeepAspectRatio', 'Conserver l''aspect de l''image originale');
    Add('propKeepChild', 'D�termine si la bande doit �tre imprim�e sans �tre s�par�e de ses enfants');
    Add('propKeepFooter', 'D�termine si la bande doit �tre imprim�e sans �tre s�par�e de ses pieds');
    Add('propKeepTogether', 'D�termine si la bande doit �tre imprim�e sans �tre s�par�e de ses sous-bandes');
    Add('propKind.TfrxFormat', 'L''aspect du formatage');
    Add('propKind', 'L''aspect du bouton');
    Add('propLargeDesignHeight', 'D�termine si les pages auront une grande hauteur en mode conception');
    Add('propLayout', 'La disposition de l''image sur le bouton');
    Add('propLeft', 'La coordonn�e gauche de l''objet');
    Add('propLeftMargin', 'La taille de la marge de gauche de la page');
    Add('propLines', 'Le texte de l''objet');
    Add('propLineSpacing', 'Le nombre de pixels entre deux lignes de texte');
    Add('propLoginPrompt', 'D�termine si il faut afficher le dialogue de connexion');
    Add('propMargin', 'D�termine le nombre de pixels entre le bord de l''image et le bord du bouton');
    Add('propMaster', 'L''ensemble de donn�es ma�tre');
    Add('propMasterFields', 'Les champs li�s par la relation ma�tre-d�tail');
    Add('propMaximized', 'D�termine si la fen�tre d''aper�u sera maximis�e');
    Add('propMaxLength', 'La longueur maximale du texte');
    Add('propMaxPages', 'Nombre maximum de pages dans le rapport pr�par�');
    Add('propMaxWidth', 'Largeur maximum de la colonne');
    Add('propMDIChild', 'D�termine si la fen�tre d''aper�u sera un enfant MDI');
    Add('propMemo', 'Le texte de l''objet');
    Add('propMinWidth', 'La largeur minimale de la colonne');
    Add('propMirrorMargins', 'Mettre les marges des pages impaires en mirroir de celles des pages paires');
    Add('propModal', 'D�termine si la fen�tre d''aper�u sera modale');
    Add('propModalResult', 'D�termine si et comment le bouton a ferm� la fen�tre modale');
    Add('propName.TFont', 'Le nom de la police');
    Add('propName.TfrxReportOptions', 'Le nom du rapport');
    Add('propName', 'Le nom de l''objet');
    Add('propNumGlyphs', 'Indique le nombre d''images qui sont dans l''objet graphic de la propri�t� Glyph');
    Add('propOpenDataSource', 'Indique si il faut ouvrir la source de donn�es automatiquement ou pas');
    Add('propOrientation', 'L''orientation de la page');
    Add('propOutlineText', 'Le texte qui sera affich� dans le profil de l''aper�u avant impression');
    Add('propOutlineVisible', 'La visibilit� du contr�le profil dans l''aper�u avant impression');
    Add('propOutlineWidth', 'La largeur du contr�le profil dans l''aper�u avant impression');
    Add('propPageNumbers.TfrxPrintOptions', 'Le nombre de pages qui seront imprim�es');
    Add('propPaperHeight', 'La hauteur de la page');
    Add('propPaperWidth', 'La largeur de la page');
    Add('propParagraphGap', 'L''espace avant la premi�re ligne des paragraphes');
    Add('propParams.TfrxBDEDatabase', 'Les param�tres de la connexion');
    Add('propParams', 'Les param�tres de la requ�te');
    Add('propParentFont', 'D�termine si l''objet utilisera la police de son parent');
    Add('propPassword', 'Le mot de passe du rapport');
    Add('propPasswordChar', 'Indique le caract�re, si besoin, qui sera affich� � la place des caract�res tap�s dans le contr�le');
    Add('propPicture', 'L''image');
    Add('propPicture.TfrxReportOptions', 'L''image d�crivant le rapport');
    Add('propPosition', 'La position initiale de la fen�tre');
    Add('propPreviewOptions', 'Les options de l''aper�u avant impression du rapport');
    Add('propPrintable', 'D�termine si l''objet est imprimable. Les objets dont la propri�t� Printable est � False seront affich�s dans l''aper�u avant impression mais ne seront pas imprim�s');
    Add('propPrintChildIfInvisible', 'D�termine si la bande enfant doit �tre imprim�e lorsque sa bande parent est invisible');
    Add('propPrinter', 'Le nom de l''imprimante qui sera s�lectionn�e lorsque ce rapport sera ouvert ou imprim�');
    Add('propPrintIfDetailEmpty', 'D�termine si la bande de donn�es doit �tre imprim�e m�me si ses sous-bandes sont vides');
    Add('propPrintIfEmpty', 'D�termine si la page doit �tre imprim�e m�me si tous ses ensembles de donn�es sont vides');
    Add('propPrintOnFirstPage', 'D�termine si la bande doit �tre imprim�e sur la premi�re page');
    Add('propPrintOnLastPage', 'D�termine si la bande doit �tre imprim�e sur la derni�re page');
    Add('propPrintOnParent', 'D�termine si le sous-rapport peut s''imprimer sur la bande parente');
    Add('propPrintOnPreviousPage', 'D�termine si la page peut �tre g�n�r�e sur l''espace libre de la page pr�c�dente');
    Add('propPrintOptions', 'Imprime les options du rapport');
    Add('propPrintPages', 'D�termine quelles pages doivent �tre imprim�es : toutes, seulement les pages impaires ou seulement les pages paires');
    Add('propRangeBegin', 'D�termine le point de d�part de la navigation dans l''ensemble de donn�es');
    Add('propRangeEnd', 'D�termine le point d''arriv�e de la navigation dans l''ensemble de donn�es');
    Add('propRangeEndCount', 'D�termine le nombre d''enregistrements � lire dans l''ensemble de donn�es si la propri�t� RangeEnd est � reCount');
    Add('propReadOnly', 'D�termine si l''objet texte est en lecture seule');
    Add('propRepeatHeaders', 'D�termine si les ent�tes des lignes et des colonnes doivent �tre r�imprim�s sur chaque nouvelle page');
    Add('propReportOptions', 'Les options du rapport');
    Add('propReprintOnNewPage', 'D�termine si la bande doit �tre r�imprim�e sur chaque nouvelle page');
    Add('propRestrictions', 'Ensemble des restrictions');
    Add('propRightMargin', 'La largeur de la marge de droite de la page');
    Add('propRotation.TfrxBarCodeView', 'L''orientation du code � barres');
    Add('propRotation', 'La rotation du texte');
    Add('propRowCount', 'Nombre d''enregistrements virtuels dans la bande de donn�es');
    Add('propRowFields', 'Noms des champs de la base de donn�es qui repr�sentent les cellules crois�es');
    Add('propRowLevels', 'Nombre de niveaux de lignes');
    Add('propRTLReading', 'D�termine si l''objet texte doit �tre imprim� de droite � gauche');
    Add('propScriptLanguage', 'Le nom du langage de script utilis� pour le rapport');
    Add('propSessionName', 'Le nom de la session BDE');
    Add('propShadowColor', 'La couleur de l''ombre');
    Add('propShadowWidth', 'La profondeur de l''ombre');
    Add('propShape', 'Le type de forme');
    Add('propShiftMode', 'La capacit� de l''objet � �tre d�plac�');
    Add('propShowCaptions', 'D�termine si l''on doit voir le texte des boutons de l''aper�u avant impression');
    Add('propShowColumnHeader', 'D�termine si l''on doit voir les ent�tes des colonnes des tableaux crois�s');
    Add('propShowColumnTotal', 'D�termine si l''on doit voir le grand-total en colonne des tableaux crois�s');
    Add('propShowRowHeader', 'D�termine si l''on doit voir les ent�tes des lignes des tableaux crois�s');
    Add('propShowRowTotal', 'D�termine si l''on doit voir le grand-total en ligne des tableaux crois�s');
    Add('propShowDialog', 'D�termine si le dialogue d''impression doit �tre affich� dans l''aper�u avant impression');
    Add('propShowText', 'D�termine si l''on doit voir le texte sous le code � barres');
    Add('propSize', 'La taille de la police de caract�res');
    Add('propSorted', 'D�termine si les items sont tri�s ou non');
    Add('propSpacing', 'D�termine le nombre de pixels entre l''image et le texte');
    Add('propSQL', 'La commande SQL');
    Add('propStartNewPage', 'Commence une nouvelle page avant d''imprimer une bande');
    Add('propStretch', 'Etire l''image pour qu''elle s''ajuste dans les limites de l''objet');
    Add('propStretched', 'D�termine si l''objet peut �tre �tir�');
    Add('propStretchMode', 'La capacit� de l''objet � �tre �tir�');
    Add('propStyle.TFont', 'Le style de la police de caract�res');
    Add('propStyle', 'Le style du contr�le');
    Add('propStyle.TfrxFrame', 'Le style de la bordure de l''objet');
    Add('propSuppressRepeated', 'Enl�ve les valeurs en doublon');
    Add('propTableName', 'Le nom de la table de donn�es');
    Add('propTag', 'La propri�t� Tag num�rique de l''objet');
    Add('propTagStr', 'La propri�t� Tag "cha�ne de caract�res" de l''objet');
    Add('propText', 'Le texte de l''objet');
    Add('propTitleBeforeHeader', 'D�termine si l''on doit voir le titre du rapport avant l''ent�te de page');
    Add('propTop', 'La coordonn�es du bord haut de l''objet');
    Add('propTopMargin', 'La hauteur de la marge du haut de la page');
    Add('propTyp', 'Le type de bordure');
    Add('propUnderlines', 'D�termine si l''on doit voir des lignes de grille apr�s chaque ligne de texte de l''objet texte');
    Add('propURL', 'L''URL de l''objet');
    Add('propUserName', 'Le nom de l''utilisateur pour l''objet donn�es. Ce nom sera affich� dans l''arbre des donn�es');
    Add('propVAlign', 'L''alignement vertical du texte');
    Add('propVersionBuild', 'Informations de version : Num�ro de construction (Build)');
    Add('propVersionMajor', 'Informations de version : Num�ro majeur (Major)');
    Add('propVersionMinor', 'Informations de version : Num�ro mineur (Minor)');
    Add('propVersionRelease', 'Informations de version : Num�ro de version (Release)');
    Add('propVGuides', 'Les guides de construction verticaux de la page');
    Add('propVisible', 'Visibilit� de l''objet');
    Add('propWidth', 'Largeur de l''objet');
    Add('propWidth.TfrxFrame', 'Largeur de la bordure');
    Add('propWindowState', 'Etat initial de la fen�tre');
    Add('propWordBreak', 'C�sure des mots russes');
    Add('propWordWrap', 'D�termine si l''on doit ins�rer des sauts de ligne logiciels pour que le texte ne d�passe pas de la marge de droite');
    Add('propZoom.TfrxBarCodeView', 'Zoom du code � barres');
    Add('propZoom', 'Facteur de zoom initial de la fen�tre de d''aper�u avant impression');
    Add('propZoomMode', 'Type de zoom initial de la fen�tre d''aper�u avant impression');
  end;
end;


initialization
  frAddInspectorRes;

end.
