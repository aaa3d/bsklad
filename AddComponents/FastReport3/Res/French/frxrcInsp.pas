
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
    Add('propActive', 'Détermine si un ensemble de données est ouvert ou pas');
    Add('propActive.TfrxHighlight', 'Détermine si le surlignement est actif ou pas');
    Add('propAliasName', 'Le nom de l''alias BDE');
    Add('propAlign', 'Détermine l''alignement de l''objet relativement à la bande ou à la page');
    Add('propAlignment', 'Détermine l''alignement du texte de l''objet');
    Add('propAllowAllUp', 'Détermine si tous les SpeedButtons du groupe peuvent être désélectionnés en même temps');
    Add('propAllowEdit', 'Détermine si l''utilisateur peut modifier les pages du rapport préparé');
    Add('propAllowExpressions', 'Détermine si le texte de l''objet texte peut contenir des expressions');
    Add('propAllowGrayed', 'Autorise l''état grisé des contrôles cases à cocher');
    Add('propAllowHTMLTags', 'Détermine si le texte de l''objet texte peut contenir du HTML');
    Add('propAllowSplit', 'Détermine si le contenu de la bande peut être imprimé sur plusieurs pages');
    Add('propAuthor', 'L''auteur du rapport');
    Add('propAutoSize', 'Détermine si l''image doit gérer sa taille automatiquement');
    Add('propAutoWidth', 'Détermine si l''objet texte peut gérer sa largeur automatiquement');
    Add('propBackPicture', 'L''image de fond de la page');
    Add('propBarType', 'Le type du code à barres');
    Add('propBevelInner', 'Le type de l''effet de profondeur intérieur');
    Add('propBevelOuter', 'Le type de l''effet de profondeur extérieur');
    Add('propBevelWidth', 'La taille de l''effet de profondeur');
    Add('propBorder', 'Détermine si l''on doit voir la bordure extérieure ou pas');
    Add('propBorderStyle', 'Le style de la fenêtre');
    Add('propBottomMargin', 'La hauteur de la marge de bas de page');
    Add('propBrushStyle', 'La style de la brosse utilisée pour peindre le fond de l''objet');
    Add('propButtons', 'L''ensemble des boutons visibles dans la fenêtre d''aperçu avant impression');
    Add('propCacheSize', 'Quantité de mémoire maximum utilisée par le moteur de rapport. Si cette valeur est dépassée, les pages déjà préparées seront mises en cache dans un fichier sur le disque');
    Add('propCalcCheckSum', 'Détermine si le code à barres doit calculer automatiquement sa somme de contrôle');
    Add('propCancel', 'Détermine si le bouton doit être activé lorsque la touche ESC est pressée');
    Add('propCaption', 'Le titre du contrôle');
    Add('propCellFields', 'Noms des champs de la base de données qui représentes les cellules croisées');
    Add('propCellLevels', 'Nombre de niveaux de cellules');
    Add('propCenter', 'Détermine si l''image doit être centrée à l''intérieur du contrôle');
    Add('propCharset', 'Le jeu de caractères de la police');
    Add('propCharSpacing', 'Nombre de pixels entre deux caractères');
    Add('propCheckColor', 'La couleur de la marque de sélection');
    Add('propChecked', 'Détermine si le contrôle est sélectionné');
    Add('propCheckStyle', 'Le style de la marque de sélection');
    Add('propChild', 'Bande enfant connectée à cette bande');
    Add('propCollate', 'Ordre de tri par défaut');
    Add('propColor.TFont', 'La couleur du texte');
    Add('propColor', 'La couleur de l''objet');
    Add('propColor.TfrxFrame', 'La couleur de la bordure');
    Add('propColor.TfrxHighlight', 'La couleur de l''objet si le surlignement est actif');
    Add('propColumnFields', 'Noms des champs de la base de données qui représentent les colonnes croisées');
    Add('propColumnGap', 'L''espace entre les colonnes dans les bandes');
    Add('propColumnLevels', 'Nombre de niveaux en colonnes');
    Add('propColumns', 'Nombre de colonnes dans la bande');
    Add('propColumnWidth', 'la largeur des colonnes dans les bandes');
    Add('propCondition', 'La condition de groupement. Le groupe change lorsque la valeur de cette expression change');
    Add('propCondition.TfrxHighlight', 'Chaîne d''expression. Si cette valeur est vraie, le surlignement est activé');
    Add('propConnected', 'Indique si la connexion à la base de données est active');
    Add('propConvertNulls', 'Détermine si les valeurs NULL de la base de données seront converties en 0, en valeur "fausse" ou en chaîne vide');
    Add('propCopies', 'Le nombre de copies par défaut');
    Add('propCursor', 'Le curseur de l''objet');
    Add('propDatabaseName', 'Le nom de la base de données');
    Add('propDataField', 'Indique le champ depuis lequel l''objet récupère ses données');
    Add('propDataSet', 'Lie l''objet à un ensemble de données qui contient les champs qu''il utilise');
    Add('propDate', 'La valeur date du contrôle');
    Add('propDateFormat', 'Détermine le format dans lequel la date est représentée');
    Add('propDecimalSeparator', 'Le séparateur décimal');
    Add('propDefault', 'Détermine si ce bouton est le bouton par défaut');
    Add('propDefHeight', 'Hauteur par défaut de la ligne');
    Add('propDescription', 'La description du rapport');
    Add('propDiagonal', 'Indique que la ligne est une diagonale');
    Add('propDisplayFormat', 'Le format de la valeur affichée');
    Add('propDoubleBuffered', 'Détermine si la fenêtre d''aperçu utilise la technique du double buffering (tampon double). Activer le double buffering empêche le scintillement mais il est plus lent');
    Add('propDoublePass', 'Détermine si le moteur de rapports doit effectuer la deuxième passe');
    Add('propDown', 'Détermine si le SpeedButton est enfoncé ou pas');
    Add('propDownThenAcross', 'Détermine comment les grand tableaux croisés seront découpés en pages');
    Add('propDriverName', 'Le nom du driver BDE');
    Add('propDropShadow', 'Détermine si les objets ont une ombre');
    Add('propDuplex', 'Indique l''utilisation du mode duplex pour la page');
    Add('propEditMask', 'Détermine le masque qui permet de valider le texte d''un contrôle à masque d''édition');
    Add('propEnabled', 'Détermine si le contrôle est actif');
    Add('propEngineOptions', 'Les options du moteur de rapport');
    Add('propExpression', 'La valeur de cette expression sera affiché dans l''objet');
    Add('propExpressionDelimiters', 'Les caractères qui seront utilisés pour délimiter les expressions contenues dans le texte');
    Add('propFieldAliases', 'Les alias des champs de l''ensemble de données');
    Add('propFilter', 'La condition de filtrage de l''ensemble de données');
    Add('propFiltered', 'Détermine si les enregistrements de l''ensemble de données doivent être filtrés en utilisant la condition de la propriété Filter');
    Add('propFlowTo', 'L''objet texte qui permettra d''afficher le texte qui dépasse de l''objet');
    Add('propFont', 'Les attributs de la police de l''objet');
    Add('propFooterAfterEach', 'Détermine si la bande pied doit être affichée après chaque ligne de données');
    Add('propFormatStr', 'La chaîne de formatage');
    Add('propFrame', 'Les attributs de la bordure de l''objet');
    Add('propGapX', 'L''espace vide à gauche du texte de l''objet');
    Add('propGapY', 'L''espace vide au dessus du texte de l''objet');
    Add('propGlyph', 'L''image du contrôle');
    Add('propGroupIndex', 'Permet aux SpeedButtons de fonctionner ensemble dans un groupe');
    Add('propHAlign', 'L''alignement horizontal du texte');
    Add('propHeight', 'La hauteur de l''objet');
    Add('propHGuides', 'Les guides horizontaux de la page');
    Add('propHideZeros', 'Détermine si l''objet texte doit cacher les valeurs à zéro');
    Add('propHighlight', 'Les attributs du surlignement conditionnel');
    Add('propIndexName', 'Le nom de l''index');
    Add('propInitString', 'La chaîne d''initialisation pour les rapports à destination d''une imprimante à aiguilles');
    Add('propItems', 'Liste de valeurs de l''objet');
    Add('propKeepAspectRatio', 'Conserver l''aspect de l''image originale');
    Add('propKeepChild', 'Détermine si la bande doit être imprimée sans être séparée de ses enfants');
    Add('propKeepFooter', 'Détermine si la bande doit être imprimée sans être séparée de ses pieds');
    Add('propKeepTogether', 'Détermine si la bande doit être imprimée sans être séparée de ses sous-bandes');
    Add('propKind.TfrxFormat', 'L''aspect du formatage');
    Add('propKind', 'L''aspect du bouton');
    Add('propLargeDesignHeight', 'Détermine si les pages auront une grande hauteur en mode conception');
    Add('propLayout', 'La disposition de l''image sur le bouton');
    Add('propLeft', 'La coordonnée gauche de l''objet');
    Add('propLeftMargin', 'La taille de la marge de gauche de la page');
    Add('propLines', 'Le texte de l''objet');
    Add('propLineSpacing', 'Le nombre de pixels entre deux lignes de texte');
    Add('propLoginPrompt', 'Détermine si il faut afficher le dialogue de connexion');
    Add('propMargin', 'Détermine le nombre de pixels entre le bord de l''image et le bord du bouton');
    Add('propMaster', 'L''ensemble de données maître');
    Add('propMasterFields', 'Les champs liés par la relation maître-détail');
    Add('propMaximized', 'Détermine si la fenêtre d''aperçu sera maximisée');
    Add('propMaxLength', 'La longueur maximale du texte');
    Add('propMaxPages', 'Nombre maximum de pages dans le rapport préparé');
    Add('propMaxWidth', 'Largeur maximum de la colonne');
    Add('propMDIChild', 'Détermine si la fenêtre d''aperçu sera un enfant MDI');
    Add('propMemo', 'Le texte de l''objet');
    Add('propMinWidth', 'La largeur minimale de la colonne');
    Add('propMirrorMargins', 'Mettre les marges des pages impaires en mirroir de celles des pages paires');
    Add('propModal', 'Détermine si la fenêtre d''aperçu sera modale');
    Add('propModalResult', 'Détermine si et comment le bouton a fermé la fenêtre modale');
    Add('propName.TFont', 'Le nom de la police');
    Add('propName.TfrxReportOptions', 'Le nom du rapport');
    Add('propName', 'Le nom de l''objet');
    Add('propNumGlyphs', 'Indique le nombre d''images qui sont dans l''objet graphic de la propriété Glyph');
    Add('propOpenDataSource', 'Indique si il faut ouvrir la source de données automatiquement ou pas');
    Add('propOrientation', 'L''orientation de la page');
    Add('propOutlineText', 'Le texte qui sera affiché dans le profil de l''aperçu avant impression');
    Add('propOutlineVisible', 'La visibilité du contrôle profil dans l''aperçu avant impression');
    Add('propOutlineWidth', 'La largeur du contrôle profil dans l''aperçu avant impression');
    Add('propPageNumbers.TfrxPrintOptions', 'Le nombre de pages qui seront imprimées');
    Add('propPaperHeight', 'La hauteur de la page');
    Add('propPaperWidth', 'La largeur de la page');
    Add('propParagraphGap', 'L''espace avant la première ligne des paragraphes');
    Add('propParams.TfrxBDEDatabase', 'Les paramètres de la connexion');
    Add('propParams', 'Les paramètres de la requête');
    Add('propParentFont', 'Détermine si l''objet utilisera la police de son parent');
    Add('propPassword', 'Le mot de passe du rapport');
    Add('propPasswordChar', 'Indique le caractère, si besoin, qui sera affiché à la place des caractères tapés dans le contrôle');
    Add('propPicture', 'L''image');
    Add('propPicture.TfrxReportOptions', 'L''image décrivant le rapport');
    Add('propPosition', 'La position initiale de la fenêtre');
    Add('propPreviewOptions', 'Les options de l''aperçu avant impression du rapport');
    Add('propPrintable', 'Détermine si l''objet est imprimable. Les objets dont la propriété Printable est à False seront affichés dans l''aperçu avant impression mais ne seront pas imprimés');
    Add('propPrintChildIfInvisible', 'Détermine si la bande enfant doit être imprimée lorsque sa bande parent est invisible');
    Add('propPrinter', 'Le nom de l''imprimante qui sera sélectionnée lorsque ce rapport sera ouvert ou imprimé');
    Add('propPrintIfDetailEmpty', 'Détermine si la bande de données doit être imprimée même si ses sous-bandes sont vides');
    Add('propPrintIfEmpty', 'Détermine si la page doit être imprimée même si tous ses ensembles de données sont vides');
    Add('propPrintOnFirstPage', 'Détermine si la bande doit être imprimée sur la première page');
    Add('propPrintOnLastPage', 'Détermine si la bande doit être imprimée sur la dernière page');
    Add('propPrintOnParent', 'Détermine si le sous-rapport peut s''imprimer sur la bande parente');
    Add('propPrintOnPreviousPage', 'Détermine si la page peut être générée sur l''espace libre de la page précédente');
    Add('propPrintOptions', 'Imprime les options du rapport');
    Add('propPrintPages', 'Détermine quelles pages doivent être imprimées : toutes, seulement les pages impaires ou seulement les pages paires');
    Add('propRangeBegin', 'Détermine le point de départ de la navigation dans l''ensemble de données');
    Add('propRangeEnd', 'Détermine le point d''arrivée de la navigation dans l''ensemble de données');
    Add('propRangeEndCount', 'Détermine le nombre d''enregistrements à lire dans l''ensemble de données si la propriété RangeEnd est à reCount');
    Add('propReadOnly', 'Détermine si l''objet texte est en lecture seule');
    Add('propRepeatHeaders', 'Détermine si les entêtes des lignes et des colonnes doivent être réimprimés sur chaque nouvelle page');
    Add('propReportOptions', 'Les options du rapport');
    Add('propReprintOnNewPage', 'Détermine si la bande doit être réimprimée sur chaque nouvelle page');
    Add('propRestrictions', 'Ensemble des restrictions');
    Add('propRightMargin', 'La largeur de la marge de droite de la page');
    Add('propRotation.TfrxBarCodeView', 'L''orientation du code à barres');
    Add('propRotation', 'La rotation du texte');
    Add('propRowCount', 'Nombre d''enregistrements virtuels dans la bande de données');
    Add('propRowFields', 'Noms des champs de la base de données qui représentent les cellules croisées');
    Add('propRowLevels', 'Nombre de niveaux de lignes');
    Add('propRTLReading', 'Détermine si l''objet texte doit être imprimé de droite à gauche');
    Add('propScriptLanguage', 'Le nom du langage de script utilisé pour le rapport');
    Add('propSessionName', 'Le nom de la session BDE');
    Add('propShadowColor', 'La couleur de l''ombre');
    Add('propShadowWidth', 'La profondeur de l''ombre');
    Add('propShape', 'Le type de forme');
    Add('propShiftMode', 'La capacité de l''objet à être déplacé');
    Add('propShowCaptions', 'Détermine si l''on doit voir le texte des boutons de l''aperçu avant impression');
    Add('propShowColumnHeader', 'Détermine si l''on doit voir les entêtes des colonnes des tableaux croisés');
    Add('propShowColumnTotal', 'Détermine si l''on doit voir le grand-total en colonne des tableaux croisés');
    Add('propShowRowHeader', 'Détermine si l''on doit voir les entêtes des lignes des tableaux croisés');
    Add('propShowRowTotal', 'Détermine si l''on doit voir le grand-total en ligne des tableaux croisés');
    Add('propShowDialog', 'Détermine si le dialogue d''impression doit être affiché dans l''aperçu avant impression');
    Add('propShowText', 'Détermine si l''on doit voir le texte sous le code à barres');
    Add('propSize', 'La taille de la police de caractères');
    Add('propSorted', 'Détermine si les items sont triés ou non');
    Add('propSpacing', 'Détermine le nombre de pixels entre l''image et le texte');
    Add('propSQL', 'La commande SQL');
    Add('propStartNewPage', 'Commence une nouvelle page avant d''imprimer une bande');
    Add('propStretch', 'Etire l''image pour qu''elle s''ajuste dans les limites de l''objet');
    Add('propStretched', 'Détermine si l''objet peut être étiré');
    Add('propStretchMode', 'La capacité de l''objet à être étiré');
    Add('propStyle.TFont', 'Le style de la police de caractères');
    Add('propStyle', 'Le style du contrôle');
    Add('propStyle.TfrxFrame', 'Le style de la bordure de l''objet');
    Add('propSuppressRepeated', 'Enlève les valeurs en doublon');
    Add('propTableName', 'Le nom de la table de données');
    Add('propTag', 'La propriété Tag numérique de l''objet');
    Add('propTagStr', 'La propriété Tag "chaîne de caractères" de l''objet');
    Add('propText', 'Le texte de l''objet');
    Add('propTitleBeforeHeader', 'Détermine si l''on doit voir le titre du rapport avant l''entête de page');
    Add('propTop', 'La coordonnées du bord haut de l''objet');
    Add('propTopMargin', 'La hauteur de la marge du haut de la page');
    Add('propTyp', 'Le type de bordure');
    Add('propUnderlines', 'Détermine si l''on doit voir des lignes de grille après chaque ligne de texte de l''objet texte');
    Add('propURL', 'L''URL de l''objet');
    Add('propUserName', 'Le nom de l''utilisateur pour l''objet données. Ce nom sera affiché dans l''arbre des données');
    Add('propVAlign', 'L''alignement vertical du texte');
    Add('propVersionBuild', 'Informations de version : Numéro de construction (Build)');
    Add('propVersionMajor', 'Informations de version : Numéro majeur (Major)');
    Add('propVersionMinor', 'Informations de version : Numéro mineur (Minor)');
    Add('propVersionRelease', 'Informations de version : Numéro de version (Release)');
    Add('propVGuides', 'Les guides de construction verticaux de la page');
    Add('propVisible', 'Visibilité de l''objet');
    Add('propWidth', 'Largeur de l''objet');
    Add('propWidth.TfrxFrame', 'Largeur de la bordure');
    Add('propWindowState', 'Etat initial de la fenêtre');
    Add('propWordBreak', 'Césure des mots russes');
    Add('propWordWrap', 'Détermine si l''on doit insérer des sauts de ligne logiciels pour que le texte ne dépasse pas de la marge de droite');
    Add('propZoom.TfrxBarCodeView', 'Zoom du code à barres');
    Add('propZoom', 'Facteur de zoom initial de la fenêtre de d''aperçu avant impression');
    Add('propZoomMode', 'Type de zoom initial de la fenêtre d''aperçu avant impression');
  end;
end;


initialization
  frAddInspectorRes;

end.
