
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
{    Romanian resource                     }
{    Translated by: Sorin Pohontu          }
{    www.frontline.ro                      }
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
      'Caption=Inspector de obiecte' + #13#10 +
      '');
    Add('oiProp', 'Proprietati');
    Add('oiEvent', 'Evenimente');

    Add('TfrxDataTreeForm',
      'Caption=Data Tree' + #13#10 +
      'DataTS.Caption=Date' + #13#10 +
      'VariablesTS.Caption=Variabile' + #13#10 +
      'FunctionsTS.Caption=Functii' + #13#10 +
      'InsFieldCB.Caption=Creeaza camp' + #13#10 +
      'InsCaptionCB.Caption=Creeaza titlu' + #13#10 +
      '');
    Add('dtNoData', 'Nu exista date disponibile');
    Add('dtData', 'Date');
    Add('dtSysVar', 'Variabile sistem');
    Add('dtVar', 'Variabile');
    Add('dtFunc', 'Functii');

    Add('TfrxReportTreeForm',
      'Caption=Report Tree' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Deschide fisier script' + #13#10 +
      'SaveScriptB.Hint=Salveaza script-ul in fisier' + #13#10 +
      'RunScriptB.Hint=Ruleaza script' + #13#10 +
      'StepScriptB.Hint=Trace Into' + #13#10 +
      'StopScriptB.Hint=Opreste script-ul' + #13#10 +
      'EvaluateB.Hint=Evaluare' + #13#10 +
      'LangL.Caption=Limbaj:' + #13#10 +
      'AlignTB.Caption=Aliniere' + #13#10 +
      'AlignLeftsB.Hint=Aliniere stanga' + #13#10 +
      'AlignHorzCentersB.Hint=Aliniere mijloc' + #13#10 +
      'AlignRightsB.Hint=Aliniere dreapta' + #13#10 +
      'AlignTopsB.Hint=Aliniere sus' + #13#10 +
      'AlignVertCentersB.Hint=Aliniere centru' + #13#10 +
      'AlignBottomsB.Hint=Aliniere jos' + #13#10 +
      'SpaceHorzB.Hint=Spatiere orizontala' + #13#10 +
      'SpaceVertB.Hint=Spatiere verticala' + #13#10 +
      'CenterHorzB.Hint=Centrare orizontala in banda' + #13#10 +
      'CenterVertB.Hint=Centrare verticala in banda' + #13#10 +
      'SameWidthB.Hint=Aceeasi latime' + #13#10 +
      'SameHeightB.Hint=Aceeasi inaltime' + #13#10 +
      'TextTB.Caption=Text' + #13#10 +
      'StyleCB.Hint=Stil' + #13#10 +
      'FontNameCB.Hint=Nume font' + #13#10 +
      'FontSizeCB.Hint=Dimensiune' + #13#10 +
      'BoldB.Hint=Bold' + #13#10 +
      'ItalicB.Hint=Italic' + #13#10 +
      'UnderlineB.Hint=Underline' + #13#10 +
      'FontColorB.Hint=Culoare font' + #13#10 +
      'HighlightB.Hint=Evidentiere' + #13#10 +
      'RotateB.Hint=Rotire text' + #13#10 +
      'TextAlignLeftB.Hint=Aliniere stanga' + #13#10 +
      'TextAlignCenterB.Hint=Aliniere centru' + #13#10 +
      'TextAlignRightB.Hint=Aliniere dreapta' + #13#10 +
      'TextAlignBlockB.Hint=Aliniere la margini' + #13#10 +
      'TextAlignTopB.Hint=Aliniere sus' + #13#10 +
      'TextAlignMiddleB.Hint=Aliniere mijloc' + #13#10 +
      'TextAlignBottomB.Hint=Aliniere jos' + #13#10 +
      'FrameTB.Caption=Cadru' + #13#10 +
      'FrameTopB.Hint=Linie sus' + #13#10 +
      'FrameBottomB.Hint=Linie jos' + #13#10 +
      'FrameLeftB.Hint=Linie stanga' + #13#10 +
      'FrameRightB.Hint=Linie dreapta' + #13#10 +
      'FrameAllB.Hint=Toate liniile cadrului' + #13#10 +
      'FrameNoB.Hint=Fara cadru' + #13#10 +
      'ShadowB.Hint=Umbra' + #13#10 +
      'FillColorB.Hint=Culoare de fond' + #13#10 +
      'FrameColorB.Hint=Culoare cadru' + #13#10 +
      'FrameStyleB.Hint=Stil cadru' + #13#10 +
      'FrameWidthCB.Hint=Latime cadru' + #13#10 +
      'StandardTB.Caption=Standard' + #13#10 +
      'NewB.Hint=Raport nou' + #13#10 +
      'OpenB.Hint=Deschide raport' + #13#10 +
      'SaveB.Hint=Salveaza raport' + #13#10 +
      'PreviewB.Hint=Previzualizare' + #13#10 +
      'NewPageB.Hint=Pagina noua' + #13#10 +
      'NewDialogB.Hint=Dialog nou' + #13#10 +
      'DeletePageB.Hint=Sterge pagina' + #13#10 +
      'PageSettingsB.Hint=Setari pagina' + #13#10 +
      'VariablesB.Hint=Variabile' + #13#10 +
      'CutB.Hint=Decupeaza' + #13#10 +
      'CopyB.Hint=Copie' + #13#10 +
      'PasteB.Hint=Lipeste' + #13#10 +
      'SampleFormatB.Hint=Formatare copie' + #13#10 +
      'UndoB.Hint=Anuleaza ultima actiune' + #13#10 +
      'RedoB.Hint=Refacere operatiune anulata' + #13#10 +
      'GroupB.Hint=Grupare' + #13#10 +
      'UngroupB.Hint=Degrupare' + #13#10 +
      'ShowGridB.Hint=Arata grid' + #13#10 +
      'AlignToGridB.Hint=Aliniere la grid' + #13#10 +
      'SetToGridB.Hint=Potrivire la grid' + #13#10 +
      'ScaleCB.Hint=Scalare' + #13#10 +
      'ExtraToolsTB.Caption=Unelte extra' + #13#10 +
      'ObjectSelectB.Hint=Unealta selectare' + #13#10 +
      'HandToolB.Hint=Unealta mana' + #13#10 +
      'ZoomToolB.Hint=Unealta scalare' + #13#10 +
      'TextToolB.Hint=Unealta editare text' + #13#10 +
      'FormatToolB.Hint=Unealta formatare copiere' + #13#10 +
      'ObjectBandB.Hint=Insereaza banda' + #13#10 +
      'FileMenu.Caption=&Fisiere' + #13#10 +
      'EditMenu.Caption=&Editare' + #13#10 +
      'FindMI.Caption=Cautare...' + #13#10 +
      'FindNextMI.Caption=Cauta urmatorul' + #13#10 +
      'ReplaceMI.Caption=Inlocuire...' + #13#10 +
      'ReportMenu.Caption=&Raport' + #13#10 +
      'ReportDataMI.Caption=Data...' + #13#10 +
      'ReportSettingsMI.Caption=Optiuni...' + #13#10 +
      'ReportStylesMI.Caption=Stiluri...' + #13#10 +
      'ViewMenu.Caption=&Vizualizare' + #13#10 +
      'ToolbarsMI.Caption=Bara de unelte' + #13#10 +
      'StandardMI.Caption=Standard' + #13#10 +
      'TextMI.Caption=Text' + #13#10 +
      'FrameMI.Caption=Cadru' + #13#10 +
      'AlignmentMI.Caption=Paleta de aliniere' + #13#10 +
      'ToolsMI.Caption=Unelte extra' + #13#10 +
      'InspectorMI.Caption=Inspector de obiecte' + #13#10 +
      'DataTreeMI.Caption=Data Tree' + #13#10 +
      'ReportTreeMI.Caption=Report Tree' + #13#10 +
      'ShowRulersMI.Caption=Rigla' + #13#10 +
      'ShowGuidesMI.Caption=Linii de ghidare' + #13#10 +
      'DeleteGuidesMI.Caption=Sterge linii de ghidare' + #13#10 +
      'OptionsMI.Caption=Optiuni...' + #13#10 +
      'HelpMenu.Caption=&Ajutor' + #13#10 +
      'HelpContentsMI.Caption=Continut...' + #13#10 +
      'AboutMI.Caption=Despre FastReport...' + #13#10 +
      'TabOrderMI.Caption=Ordine tab...' + #13#10 +
      'UndoCmd.Caption=Anuleaza ultima actiune' + #13#10 +
      'RedoCmd.Caption=Refacere operatiune anulata' + #13#10 +
      'CutCmd.Caption=Decupeaza' + #13#10 +
      'CopyCmd.Caption=Copie' + #13#10 +
      'PasteCmd.Caption=Lipeste' + #13#10 +
      'GroupCmd.Caption=Grupare' + #13#10 +
      'UngroupCmd.Caption=Degrupare' + #13#10 +
      'DeleteCmd.Caption=Stergere' + #13#10 +
      'DeletePageCmd.Caption=Stergere pagina' + #13#10 +
      'SelectAllCmd.Caption=Selecteaza tot' + #13#10 +
      'EditCmd.Caption=Editare...' + #13#10 +
      'BringToFrontCmd.Caption=Trimitere in fata' + #13#10 +
      'SendToBackCmd.Caption=Trimitere in spate' + #13#10 +
      'NewItemCmd.Caption=Nou...' + #13#10 +
      'NewReportCmd.Caption=Raport nou' + #13#10 +
      'NewPageCmd.Caption=Pagina noua' + #13#10 +
      'NewDialogCmd.Caption=Dialog nou' + #13#10 +
      'OpenCmd.Caption=Deschide...' + #13#10 +
      'SaveCmd.Caption=Salveaza' + #13#10 +
      'SaveAsCmd.Caption=Salveaza ca...' + #13#10 +
      'VariablesCmd.Caption=Variabile...' + #13#10 +
      'PageSettingsCmd.Caption=Setari pagina...' + #13#10 +
      'PreviewCmd.Caption=Previzualizare' + #13#10 +
      'ExitCmd.Caption=Iesire' + #13#10 +
      'ReportTitleMI.Caption=Report Title' + #13#10 +
      'ReportSummaryMI.Caption=Report Summary' + #13#10 +
      'PageHeaderMI.Caption=Page Header' + #13#10 +
      'PageFooterMI.Caption=Page Footer' + #13#10 +
      'HeaderMI.Caption=Header' + #13#10 +
      'FooterMI.Caption=Footer' + #13#10 +
      'MasterDataMI.Caption=Master Data' + #13#10 +
      'DetailDataMI.Caption=Detail Data' + #13#10 +
      'SubdetailDataMI.Caption=Subdetail Data' + #13#10 +
      'Data4levelMI.Caption=Data 4th level' + #13#10 +
      'Data5levelMI.Caption=Data 5th level' + #13#10 +
      'Data6levelMI.Caption=Data 6th level' + #13#10 +
      'GroupHeaderMI.Caption=Group Header' + #13#10 +
      'GroupFooterMI.Caption=Group Footer' + #13#10 +
      'ChildMI.Caption=Child' + #13#10 +
      'ColumnHeaderMI.Caption=Column Header' + #13#10 +
      'ColumnFooterMI.Caption=Column Footer' + #13#10 +
      'OverlayMI.Caption=Overlay' + #13#10 +
      'VerticalbandsMI.Caption=Vertical bands' + #13#10 +
      'HeaderMI1.Caption=Header' + #13#10 +
      'FooterMI1.Caption=Footer' + #13#10 +
      'MasterDataMI1.Caption=Master Data' + #13#10 +
      'DetailDataMI1.Caption=Detail Data' + #13#10 +
      'SubdetailDataMI1.Caption=Subdetail Data' + #13#10 +
      'GroupHeaderMI1.Caption=Group Header' + #13#10 +
      'GroupFooterMI1.Caption=Group Footer' + #13#10 +
      'ChildMI1.Caption=Child' + #13#10 +
      'R0MI.Caption=0°' + #13#10 +
      'R45MI.Caption=45°' + #13#10 +
      'R90MI.Caption=90°' + #13#10 +
      'R180MI.Caption=180°' + #13#10 +
      'R270MI.Caption=270°' + #13#10 +
      'FontB.Hint=Setari font' + #13#10 +
      'BoldMI.Caption=Bold' + #13#10 +
      'ItalicMI.Caption=Italic' + #13#10 +
      'UnderlineMI.Caption=Underline' + #13#10 +
      'SuperScriptMI.Caption=SuperScript' + #13#10 +
      'SubScriptMI.Caption=SubScript' + #13#10 +
      'CondensedMI.Caption=Condensed' + #13#10 +
      'WideMI.Caption=Wide' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'OpenDialog.Filter=Raport (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=Fisiere Pascal (*.pas)|*.pas|Fisiere C++ (*.cpp)|*.cpp|Fisiere JavaScript  (*.js)|*.js|Fisiere Basic (*.vb)|*.vb|Toate fisierele|*.*' + #13#10 +
      'SaveScriptDialog.Filter=Fisiere Pascal (*.pas)|*.pas|Fisiere C++ (*.cpp)|*.cpp|Fisiere JavaScript  (*.js)|*.js|Fisiere Basic (*.vb)|*.vb|Toate fisierele|*.*' + #13#10 +
      '');
    Add('dsCm', 'Centimetri');
    Add('dsInch', 'Inchi');
    Add('dsPix', 'Pixeli');
    Add('dsChars', 'Caractere');
    Add('dsCode', 'Code');
    Add('dsPage', 'Page');
    Add('dsRepFilter', 'Raport (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'Raport compresat (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', 'Salvati modificarile facute paginii de previzualizare?');
    Add('dsSaveChangesTo', 'Salveaza modificarile in ');
    Add('dsCantLoad', 'Nu pot incarca fisierul');
    Add('dsStyleFile', 'Stil');
    Add('dsCantFindProc', 'Nu pot localiza procedura principala');
    Add('dsClearScript', 'Aceasta operatiune va sterge toate instructiunile. Doriti sa continuati ?');
    Add('dsNoStyle', 'Fara stil');
    Add('dsStyleSample', 'Exemplu stil');
    Add('dsTextNotFound', 'Textul ''%s'' nu a fost gasit');
    Add('dsReplace', 'Inlocuiti aceasta aparitie a ''%s''?');

    Add('TfrxAboutForm',
      'Caption=Despre FastReport' + #13#10 +
      'Label4.Caption=Vizitati pagina noastra pe Internet:' + #13#10 +
      'Label6.Caption=Vanzari:' + #13#10 +
      'Label8.Caption=Suport:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Optiuni pagina' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      'TabSheet1.Caption=Hartie' + #13#10 +
      'Label1.Caption=Latime' + #13#10 +
      'Label2.Caption=Inaltime' + #13#10 +
      'Label11.Caption=Dimensiune' + #13#10 +
      'Label12.Caption=Orientare     ' + #13#10 +
      'Label3.Caption=Stanga' + #13#10 +
      'Label4.Caption=Sus' + #13#10 +
      'Label5.Caption=Dreapta' + #13#10 +
      'Label6.Caption=Jos' + #13#10 +
      'Label13.Caption=Margini   ' + #13#10 +
      'Label14.Caption=Sursa hartie' + #13#10 +
      'Label9.Caption=Prima pagina' + #13#10 +
      'Label10.Caption=Restul paginilor' + #13#10 +
      'PortraitRB.Caption=Portret' + #13#10 +
      'LandscapeRB.Caption=Peisaj' + #13#10 +
      'TabSheet3.Caption=Alte optiuni' + #13#10 +
      'Label7.Caption=Coloane   ' + #13#10 +
      'Label8.Caption=Numar' + #13#10 +
      'Label15.Caption=Latime' + #13#10 +
      'Label16.Caption=Pozitii' + #13#10 +
      'Label17.Caption=Alte   ' + #13#10 +
      'Label18.Caption=Duplex' + #13#10 +
      'PrintOnPrevCB.Caption=Listeaza pe pagina anterioara' + #13#10 +
      'MirrorMarginsCB.Caption=Margini oglinda' + #13#10 +
      'LargeHeightCB.Caption=Inaltime mare in mod design' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Selectare dataset-uri raport' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Editare variabile' + #13#10 +
      'NewCategoryB.Caption=Categorie' + #13#10 +
      'NewVarB.Caption=Variabila' + #13#10 +
      'EditB.Caption=Editare' + #13#10 +
      'DeleteB.Caption=Stergere' + #13#10 +
      'EditListB.Caption=Lista' + #13#10 +
      'LoadB.Caption=Incarca' + #13#10 +
      'SaveB.Caption=Salveaza' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'ExprPanel.Caption= Expresie:' + #13#10 +
      'OpenDialog1.Filter=Dictionar (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Dictionar (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(nici o variabila definita)');
    Add('vaVar', 'Variabile');
    Add('vaDupName', 'Nume duplicat');

    Add('TfrxOptionsEditor',
      'Caption=Optiuni designer' + #13#10 +
      'Label1.Caption=Grid   ' + #13#10 +
      'Label2.Caption=Tip' + #13#10 +
      'Label3.Caption=Dimensiune' + #13#10 +
      'Label4.Caption=Forma dialog:' + #13#10 +
      'Label5.Caption=Altele  ' + #13#10 +
      'Label6.Caption=Fonturi ' + #13#10 +
      'Label7.Caption=Editor cod' + #13#10 +
      'Label8.Caption=Editor memo' + #13#10 +
      'Label9.Caption=Dimensiune' + #13#10 +
      'Label10.Caption=Dimensiune' + #13#10 +
      'Label11.Caption=Culori   ' + #13#10 +
      'Label12.Caption=Spatiu intre benzi:' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=in' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      'CMRB.Caption=Centimetri:' + #13#10 +
      'InchesRB.Caption=Inchi:' + #13#10 +
      'PixelsRB.Caption=Pixeli:' + #13#10 +
      'ShowGridCB.Caption=Arata grid' + #13#10 +
      'AlignGridCB.Caption=Aliniere la grid' + #13#10 +
      'EditAfterInsCB.Caption=Afiseaza editorul dupa inserare' + #13#10 +
      'ObjectFontCB.Caption=Foloseste setarile de font ale obiectului' + #13#10 +
      'WorkspaceB.Caption=Spatiu de lucru' + #13#10 +
      'ToolB.Caption=Ferestre de unelte' + #13#10 +
      'LCDCB.Caption=Culoare LCD grid' + #13#10 +
      'FreeBandsCB.Caption=Plasare nerestrictionata a benzilor' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Restaurare valori implicite' + #13#10 +
      'BandsCaptionsCB.Caption=Arata titlurile benzilor' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=Selectare dataSet' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      '');
    Add('dbNotAssigned', '[neasignat]');
    Add('dbSingleLine', 'Single row');

    Add('TfrxGroupEditorForm',
      'Caption=Grup' + #13#10 +
      'BreakOnL.Caption=Break on   ' + #13#10 +
      'OptionsL.Caption=Optiuni   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      'DataFieldRB.Caption=Camp date' + #13#10 +
      'ExpressionRB.Caption=Expresie' + #13#10 +
      'KeepGroupTogetherCB.Caption=Pastreaza grupul impreuna' + #13#10 +
      'StartNewPageCB.Caption=Incepe pagina noua' + #13#10 +
      'OutlineCB.Caption=Arata in contur' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=Memo sistem' + #13#10 +
      'DataBandL.Caption=Banda de date' + #13#10 +
      'DataSetL.Caption=DataSet' + #13#10 +
      'DataFieldL.Caption=DataField' + #13#10 +
      'FunctionL.Caption=Functie' + #13#10 +
      'ExpressionL.Caption=Expresie' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      'AggregateRB.Caption=Valoare totalizatoare' + #13#10 +
      'SysVariableRB.Caption=Variabile sistem' + #13#10 +
      'CountInvisibleCB.Caption=Numara benzile invizibile' + #13#10 +
      'TextRB.Caption=Text' + #13#10 +
      'RunningTotalCB.Caption=Total neintrerupt' + #13#10 +
      '');
    Add('agAggregate', 'Adaugare totalizator');
    Add('vt1', '[DATE]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGES#]');
    Add('vt5', '[PAGE#] din [TOTALPAGES#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=Obiect OLE' + #13#10 +
      'InsertB.Caption=Inserare...' + #13#10 +
      'EditB.Caption=Editare...' + #13#10 +
      'CloseB.Caption=Inchide' + #13#10 +
      '');
    Add('olStretched', 'Stretched');

    Add('TfrxBarcodeEditorForm',
      'Caption=Editor coduri de bare' + #13#10 +
      'CodeLbl.Caption=Cod' + #13#10 +
      'TypeLbl.Caption=Tip bara' + #13#10 +
      'ZoomLbl.Caption=Scalare:' + #13#10 +
      'OptionsLbl.Caption=Optiuni  ' + #13#10 +
      'RotationLbl.Caption=Rotire     ' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CalcCheckSumCB.Caption=Calculeaza Checksum ' + #13#10 +
      'ViewTextCB.Caption=Text' + #13#10 +
      'Rotation0RB.Caption=0°' + #13#10 +
      'Rotation90RB.Caption=90°' + #13#10 +
      'Rotation180RB.Caption=180°' + #13#10 +
      'Rotation270RB.Caption=270°' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Calculeaza CheckSum');
    Add('bcShowText', 'Arata text');

    Add('TfrxAliasesEditorForm',
      'Caption=Editare aliasuri' + #13#10 +
      'HintL.Caption=Apasa Enter pentru a edita obiectul' + #13#10 +
      'DSAliasL.Caption=Alias dataset' + #13#10 +
      'FieldAliasesL.Caption=Alias campuri' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      'ResetB.Caption=Reseteaza' + #13#10 +
      'UpdateB.Caption=Update' + #13#10 +
      '');
    Add('alUserName', 'Nume utilizator');
    Add('alOriginal', 'Nume original');

    Add('TfrxParamsEditorForm',
      'Caption=Editor parametri' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      '');
    Add('qpName', 'Nume');
    Add('qpDataType', 'Tip date');
    Add('qpValue', 'Valoare');

    Add('TfrxMDEditorForm',
      'Caption=Legatura Master-Detail' + #13#10 +
      'Label1.Caption=Campuri detalii' + #13#10 +
      'Label2.Caption=Campuri master' + #13#10 +
      'Label3.Caption=Campuri legate' + #13#10 +
      'AddB.Caption=Adauga' + #13#10 +
      'ClearB.Caption=Sterge' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=Memo' + #13#10 +
      'ExprB.Hint=Insereaza expresie' + #13#10 +
      'AggregateB.Hint=Insereaza totalizator' + #13#10 +
      'LocalFormatB.Hint=Insereaza formatare' + #13#10 +
      'WordWrapB.Hint=Word Wrap' + #13#10 +
      'CancelB.Hint=Anuleaza' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=Imagine' + #13#10 +
      'LoadB.Hint=Incarca' + #13#10 +
      'CopyB.Hint=Copie' + #13#10 +
      'PasteB.Hint=Lipeste' + #13#10 +
      'ClearB.Hint=Sterge' + #13#10 +
      'CancelB.Hint=Anuleaza' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('piEmpty', 'Gol');

    Add('TfrxChartEditorForm',
      'Caption=Editor Chart' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=Adauga Serie' + #13#10 +
      'DeleteB.Hint=Sterge Serie' + #13#10 +
      'DBSourceRB.Caption=Date din DB' + #13#10 +
      'BandSourceRB.Caption=Sursa banda' + #13#10 +
      'FixedDataRB.Caption=Date fixe' + #13#10 +
      'DatasetLbl.Caption=Dataset' + #13#10 +
      'BandLbl.Caption=Data band' + #13#10 +
      'X1Lbl.Caption=Valori X' + #13#10 +
      'Y1Lbl.Caption=Valori Y' + #13#10 +
      'X2Lbl.Caption=Valori X' + #13#10 +
      'Y2Lbl.Caption=Valori Y' + #13#10 +
      'X3Lbl.Caption=Valori X (de exemplu, a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Valori Y (de exemplu, 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Alte optiuni   ' + #13#10 +
      'ShowTopLbl.Caption=Valori TopN' + #13#10 +
      'CaptionLbl.Caption=Titluri TopN' + #13#10 +
      'SortLbl.Caption=Ordine de sortare' + #13#10 +
      'LineMI.Caption=Linie' + #13#10 +
      'AreaMI.Caption=Arie' + #13#10 +
      'PointMI.Caption=Punct' + #13#10 +
      'BarMI.Caption=Dreptunghi' + #13#10 +
      'HorizBarMI.Caption=Dreptunghi oriz.' + #13#10 +
      'PieMI.Caption=Pie' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Fast Line' + #13#10 +
      '');
    Add('ch3D', 'Vizualizare 3D');
    Add('chAxis', 'Arata axe');
    Add('chsoNone', 'Nici una');
    Add('chsoAscending', 'Crescator');
    Add('chsoDescending', 'Descrescator');

    Add('TfrxRichEditorForm',
      'Caption=Editor Rich' + #13#10 +
      'OpenB.Hint=Deschidere fisier' + #13#10 +
      'SaveB.Hint=Salveaza fisier' + #13#10 +
      'UndoB.Hint=Anuleaza' + #13#10 +
      'TTB.Hint=Font' + #13#10 +
      'ExprB.Hint=Insereaza expresie' + #13#10 +
      'CancelB.Hint=Anuleaza' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      'BoldB.Hint=Bold' + #13#10 +
      'ItalicB.Hint=Italic' + #13#10 +
      'UnderlineB.Hint=Underline' + #13#10 +
      'LeftAlignB.Hint=Aliniere stanga' + #13#10 +
      'CenterAlignB.Hint=Aliniere centru' + #13#10 +
      'RightAlignB.Hint=Aliniere dreapta' + #13#10 +
      'BlockAlignB.Hint=Justify' + #13#10 +
      'BulletsB.Hint=Bullets' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Editor Cross-tab' + #13#10 +
      'DatasetL.Caption=Sursa de date ' + #13#10 +
      'DimensionsL.Caption=Dimensiuni   ' + #13#10 +
      'RowsL.Caption=Randuri' + #13#10 +
      'ColumnsL.Caption=Coloane' + #13#10 +
      'CellsL.Caption=Celule' + #13#10 +
      'StructureL.Caption=Structura Cross-tab  ' + #13#10 +
      'RowHeaderCB.Caption=Rand antet' + #13#10 +
      'ColumnHeaderCB.Caption=Coloana antet' + #13#10 +
      'RowTotalCB.Caption=Rand total general' + #13#10 +
      'ColumnTotalCB.Caption=Coloana total general' + #13#10 +
      'SwapB.Hint=Inverseaza randuri/coloane' + #13#10 +
      'StyleCB.Hint=Stil Cross-tab' + #13#10 +
      'FontB.Hint=Font Settings' + #13#10 +
      'AlignLeftB.Hint=Aliniere stanga' + #13#10 +
      'AlignCenterB.Hint=Aliniere centru' + #13#10 +
      'AlignRightB.Hint=Aliniere dreapta' + #13#10 +
      'RotationB.Hint=Rotire text' + #13#10 +
      'HighlightB.Hint=Evidentiere' + #13#10 +
      'FormatB.Hint=Format' + #13#10 +
      'FrameB.Hint=Setari cadru' + #13#10 +
      'FillColorB.Hint=Culoare de umplere' + #13#10 +
      'Func1MI.Caption=Nici una' + #13#10 +
      'Func2MI.Caption=Sum' + #13#10 +
      'Func3MI.Caption=Min' + #13#10 +
      'Func4MI.Caption=Max' + #13#10 +
      'Func5MI.Caption=Average' + #13#10 +
      'Func6MI.Caption=Count' + #13#10 +
      'Sort1MI.Caption=Crescator (A-Z)' + #13#10 +
      'Sort2MI.Caption=Descrescator (Z-A)' + #13#10 +
      'Sort3MI.Caption=Fara sortare' + #13#10 +
      'BoldMI.Caption=Bold' + #13#10 +
      'ItalicMI.Caption=Italic' + #13#10 +
      'UnderlineMI.Caption=Underline' + #13#10 +
      'SuperScriptMI.Caption=SuperScript' + #13#10 +
      'SubScriptMI.Caption=SubScript' + #13#10 +
      'CondensedMI.Caption=Condensed' + #13#10 +
      'WideMI.Caption=Wide' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=Anuleaza' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('crSubtotal', 'Subtotal');
    Add('crNone', 'Nici una');
    Add('crSum', 'Sum');
    Add('crMin', 'Min');
    Add('crMax', 'Max');
    Add('crAvg', 'Avg');
    Add('crCount', 'Count');
    Add('crAsc', 'A-Z');
    Add('crDesc', 'Z-A');
    Add('crRepHdrs', 'Relistare antet');
    Add('crBorder', 'Bordura');
    Add('crDown', 'In jos apoi transversal');

    Add('TfrxExprEditorForm',
      'Caption=Editor expresii' + #13#10 +
      'ExprL.Caption=Expresie:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=Format de afisare' + #13#10 +
      'CategoryL.Caption=Categorie' + #13#10 +
      'FormatL.Caption=Format' + #13#10 +
      'FormatStrL.Caption=Format text:' + #13#10 +
      'SeparatorL.Caption=Separator zecimal:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      '');
    Add('fkText', 'Text (fara formatare)');
    Add('fkNumber', 'Numar');
    Add('fkDateTime', 'Data/Timp');
    Add('fkBoolean', 'Boolean');
    Add('fkNumber1', '1234.5;%g');
    Add('fkNumber2', '1234.50;%2.2f');
    Add('fkNumber3', '1,234.50;%2.2n');
    Add('fkNumber4', '$1,234.50;%2.2m');
    Add('fkDateTime1', '11.28.2002;mm.dd.yyyy');
    Add('fkDateTime2', '28 nov 2002;dd mmm yyyy');
    Add('fkDateTime3', 'Noiembrie 28, 2002;mmmm dd, yyyy');
    Add('fkDateTime4', '02:14;hh:mm');
    Add('fkDateTime5', '02:14am;hh:mm am/pm');
    Add('fkDateTime6', '02:14:00;hh:mm:ss');
    Add('fkDateTime7', '02:14am, Noiembrie 28, 2002;hh:mm am/pm, mmmm dd, yyyy');
    Add('fkBoolean1', '0,1;0,1');
    Add('fkBoolean2', 'No,Yes;No,Yes');
    Add('fkBoolean3', '_,x;_,x');
    Add('fkBoolean4', 'False,True;False,True');

    Add('TfrxHighlightEditorForm',
      'Caption=Evidentiere' + #13#10 +
      'FontColorB.Caption=Culoare...' + #13#10 +
      'BackColorB.Caption=Culoare...' + #13#10 +
      'ConditionL.Caption=Conditie   ' + #13#10 +
      'FontL.Caption=Font   ' + #13#10 +
      'BackgroundL.Caption=Culoare fond ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      'BoldCB.Caption=Bold' + #13#10 +
      'ItalicCB.Caption=Italic' + #13#10 +
      'UnderlineCB.Caption=Underline' + #13#10 +
      'TransparentRB.Caption=Transparent' + #13#10 +
      'OtherRB.Caption=Altele' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Setari raport' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      'GeneralTS.Caption=General' + #13#10 +
      'ReportSettingsL.Caption=Setari imprimanta  ' + #13#10 +
      'CopiesL.Caption=Copii' + #13#10 +
      'GeneralL.Caption=General   ' + #13#10 +
      'PasswordL.Caption=Parola' + #13#10 +
      'CollateCB.Caption=Copii odronate' + #13#10 +
      'DoublePassCB.Caption=Doua treceri' + #13#10 +
      'PrintIfEmptyCB.Caption=Listeaza daca e gol' + #13#10 +
      'DescriptionTS.Caption=Descriere' + #13#10 +
      'NameL.Caption=Nume' + #13#10 +
      'Description1L.Caption=Descriere' + #13#10 +
      'PictureL.Caption=Imagine' + #13#10 +
      'AuthorL.Caption=Autor' + #13#10 +
      'MajorL.Caption=Major' + #13#10 +
      'MinorL.Caption=Minor' + #13#10 +
      'ReleaseL.Caption=Release' + #13#10 +
      'BuildL.Caption=Build' + #13#10 +
      'CreatedL.Caption=Creat' + #13#10 +
      'ModifiedL.Caption=Modificat' + #13#10 +
      'DescriptionL.Caption=Descriere     ' + #13#10 +
      'VersionL.Caption=Versiune' + #13#10 +
      'PictureB.Caption=Alege...' + #13#10 +
      '');
    Add('rePrnOnPort', 'on');

    Add('TfrxStringsEditorForm',
      'Caption=Linii' + #13#10 +
      'CancelB.Hint=Anuleaza' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=Anuleaza' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=Parola' + #13#10 +
      'PasswordL.Caption=Introduceti parola:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=Editor stil' + #13#10 +
      'ColorB.Caption=Culoare...' + #13#10 +
      'FontB.Caption=Font...' + #13#10 +
      'FrameB.Caption=Cadru...' + #13#10 +
      'AddB.Hint=Adauga' + #13#10 +
      'DeleteB.Hint=Sterge' + #13#10 +
      'EditB.Hint=Editeaza' + #13#10 +
      'LoadB.Hint=Incarca' + #13#10 +
      'SaveB.Hint=Salveaza' + #13#10 +
      'CancelB.Hint=Anuleaza' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=Editor cadru' + #13#10 +
      'FrameL.Caption=Cadru' + #13#10 +
      'LineL.Caption=Linie cadru' + #13#10 +
      'ShadowL.Caption=Umbra' + #13#10 +
      'FrameTopB.Hint=Linie sus' + #13#10 +
      'FrameBottomB.Hint=Linie jos' + #13#10 +
      'FrameLeftB.Hint=Linie stanga' + #13#10 +
      'FrameRightB.Hint=Linie dreapta' + #13#10 +
      'FrameAllB.Hint=Toate liniile cadru' + #13#10 +
      'FrameNoB.Hint=Fara cadru' + #13#10 +
      'FrameColorB.Hint=Culoare cadru' + #13#10 +
      'FrameStyleB.Hint=Stil cadru' + #13#10 +
      'FrameWidthCB.Hint=Latime cadru' + #13#10 +
      'ShadowB.Hint=Umbra' + #13#10 +
      'ShadowColorB.Hint=Culoare umbra' + #13#10 +
      'ShadowWidthCB.Hint=Latime umbra' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=Obiect nou' + #13#10 +
      'ItemsTab.Caption=Obiecte' + #13#10 +
      'TemplatesTab.Caption=Sabloane' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Ordine tab-uri' + #13#10 +
      'Label1.Caption=Lista controale in ordinea tab-urilor:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      'UpB.Caption=Muta in sus' + #13#10 +
      'DownB.Caption=Muta in jos' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Evaluare' + #13#10 +
      'Label1.Caption=Expresie' + #13#10 +
      'Label2.Caption=Rezultat' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Report Wizard' + #13#10 +
      'DataTab.Caption=Date' + #13#10 +
      'GroupsTab.Caption=Grupuri' + #13#10 +
      'LayoutTab.Caption=Asezare' + #13#10 +
      'StyleTab.Caption=Stil' + #13#10 +
      'Step1L.Caption=Pas 1. Selectati dataset-ul si campurile de afisat.' + #13#10 +
      'Step2L.Caption=Pas 2. Creati grupurile (optional).' + #13#10 +
      'Step3L.Caption=Pas 3. Definiti orientarea paginii si asezarea datelor.' + #13#10 +
      'Step4L.Caption=Pas 4. Alegeti stilul raportului.' + #13#10 +
      'AddFieldB.Caption=Adauga >' + #13#10 +
      'AddAllFieldsB.Caption=Adauga toate >>' + #13#10 +
      'RemoveFieldB.Caption=< Sterge' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Sterge toate' + #13#10 +
      'AddGroupB.Caption=Adauga >' + #13#10 +
      'RemoveGroupB.Caption=< Sterge' + #13#10 +
      'SelectedFieldsL.Caption=Campuri selectate:' + #13#10 +
      'AvailableFieldsL.Caption=Campuri disponibile:' + #13#10 +
      'GroupsL.Caption=Grupuri:' + #13#10 +
      'OrientationL.Caption=Orientare     ' + #13#10 +
      'LayoutL.Caption=Asezare  ' + #13#10 +
      'PortraitRB.Caption=Portret' + #13#10 +
      'LandscapeRB.Caption=Peisaj' + #13#10 +
      'TabularRB.Caption=Tabular' + #13#10 +
      'ColumnarRB.Caption=Columnar' + #13#10 +
      'FitWidthCB.Caption=Aliniere campuri la latimea paginii' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      'BackB.Caption=<< Inapoi' + #13#10 +
      'NextB.Caption=Inainte >>' + #13#10 +
      'FinishB.Caption=Finalizare' + #13#10 +
      '');
    Add('wzStd', 'Standard Report Wizard');
    Add('wzDMP', 'Dot-Matrix Report Wizard');
    Add('wzStdEmpty', 'Standard Report');
    Add('wzDMPEmpty', 'Dot-Matrix Report');


    Add('ftAllFiles', 'Toate fisierele');
    Add('ftPictures', 'Imagini');
    Add('ftDB', 'Baze de date');
    Add('ftRichFile', 'Fisiere RichText');
    Add('ftTextFile', 'Fisiere text');

    Add('prNotAssigned', '(neasignat)');
    Add('prInvProp', 'Valoare invalida a proprietatii');
    Add('prDupl', 'Nume duplicat');
    Add('prPict', '(Imagine)');

    Add('mvExpr', 'Permite expresii');
    Add('mvStretch', 'Redimensionare');
    Add('mvStretchToMax', 'Redimensionare la max inaltime');
    Add('mvShift', 'Schimbare');
    Add('mvShiftOver', 'Schimbare la intrepatrundere');
    Add('mvVisible', 'Vizibil');
    Add('mvPrintable', 'Printabil');
    Add('mvFont', 'Font...');
    Add('mvFormat', 'Format de afisare...');
    Add('mvClear', 'Goleste continutul');
    Add('mvAutoWidth', 'Latime automata');
    Add('mvWWrap', 'Incadrare cuvinte');
    Add('mvSuppress', 'Elimina valorile repetate');
    Add('mvHideZ', 'Ascunde zero-urile');
    Add('mvHTML', 'Permite tag-uri HTML');
    Add('lvDiagonal', 'Diagonal');
    Add('pvAutoSize', 'Auto-dimensionare');
    Add('pvCenter', 'Centru');
    Add('pvAspect', 'Pastreaza proportiile de aspect');
    Add('bvSplit', 'Permite impartire');
    Add('bvKeepChild', 'Pastreaza fiii impreuna');
    Add('bvPrintChild', 'Tipareste fiul daca e invizibil');
    Add('bvStartPage', 'Incepe pagina noua');
    Add('bvPrintIfEmpty', 'Tipareste detaliul daca e invizibil');
    Add('bvKeepDetail', 'Pastreaza detaliile impreuna');
    Add('bvKeepFooter', 'Pastreaza subsolul la un loc');
    Add('bvReprint', 'Retipareste pe pagina noua');
    Add('bvOnFirst', 'Tipareste pe prima pagina');
    Add('bvOnLast', 'Tipareste pe ultima pagina');
    Add('bvKeepGroup', 'Pastreaza imipreuna');
    Add('bvFooterAfterEach', 'Subsol dupa fiecare rand');
    Add('srParent', 'Tipareste in parinte');
    Add('bvKeepHeader', 'Pastreaza antetul la un loc');

    Add('obCatDraw', 'Deseneaza');
    Add('obCatOther', 'Alte obiecte');
    Add('obCatOtherControls', 'Alte controale');
    Add('obDiagLine', 'Linie diagonala');
    Add('obRect', 'Dreptunghi');
    Add('obRoundRect', 'Dreptunghi rotunjit');
    Add('obEllipse', 'Elipsa');
    Add('obTrian', 'Triunghi');
    Add('obDiamond', 'Diamant');
    Add('obLabel', 'Control eticheta');
    Add('obEdit', 'Control editare');
    Add('obMemoC', 'Control memo');
    Add('obButton', 'Control buton');
    Add('obChBoxC', 'Control CheckBox');
    Add('obRButton', 'Control RadioButton');
    Add('obLBox', 'Control ListBox');
    Add('obCBox', 'Control ComboBox');
    Add('obDateEdit', 'Control DateEdit');
    Add('obImageC', 'Control imagine');
    Add('obPanel', 'Control Panel');
    Add('obGrBox', 'Control GroupBox');
    Add('obBBtn', 'Control BitBtn');
    Add('obSBtn', 'Control SpeedButton');
    Add('obMEdit', 'Control MaskEdit');
    Add('obChLB', 'Control CheckListBox');
    Add('obDBLookup', 'Control DBLookupComboBox');
    Add('obBevel', 'Obiect Bevel');
    Add('obShape', 'Obiect Shape');
    Add('obText', 'Obiect Text');
    Add('obSysText', 'Text System');
    Add('obLine', 'Obiect linie');
    Add('obPicture', 'Obiect imagine');
    Add('obBand', 'Obiect Band');
    Add('obDataBand', 'Banda de date');
    Add('obSubRep', 'Obiect Subreport');
    Add('obDlgPage', 'Forma Dialog');
    Add('obRepPage', 'Pagina raport');
    Add('obReport', 'Obiect raport');
    Add('obRich', 'Obiect RichText');
    Add('obOLE', 'Obiect OLE');
    Add('obChBox', 'Obiect CheckBox');
    Add('obChart', 'Obiect Chart');
    Add('obBarC', 'Obiect cod de bare');
    Add('obCross', 'Obiect Cross-tab');
    Add('obDBCross', 'Obiect DB Cross-tab');
    Add('obGrad', 'Obiect gradient');
    Add('obDMPText', 'Obiect text Dot-matrix');
    Add('obDMPLine', 'Obiect linie Dot-matrix');
    Add('obBDEDB', 'Baza de date BDE');
    Add('obBDETb', 'Tabela BDE');
    Add('obBDEQ', 'Interogare BDE');
    Add('obBDEComps', 'Componente BDE');
    Add('obIBXDB', 'Baza de date IBX');
    Add('obIBXTb', 'Tabela IBX');
    Add('obIBXQ', 'Interogare IBX');
    Add('obIBXComps', 'Componente IBX');
    Add('obADODB', 'Baza de date ADO');
    Add('obADOTb', 'Tabela ADO');
    Add('obADOQ', 'Interogare ADO');
    Add('obADOComps', 'Componente ADO');
    Add('obDBXDB', 'Baza de date DBX');
    Add('obDBXTb', 'Tabela DBX');
    Add('obDBXQ', 'Interogare DBX');
    Add('obDBXComps', 'Componente DBX');

    Add('ctString', 'Text');
    Add('ctDate', 'Data si ora');
    Add('ctConv', 'Conversii');
    Add('ctFormat', 'Formatare');
    Add('ctMath', 'Matematic');
    Add('ctOther', 'Altele');

    Add('IntToStr', 'Converteste o valoare intreaga la un sir de caractere');
    Add('FloatToStr', 'Converteste o valoare reala la un sir de caractere');
    Add('DateToStr', 'Converteste o valoare tip data la un sir de caractere');
    Add('TimeToStr', 'Converteste o valoare tip ora la un sir de caractere');
    Add('DateTimeToStr', 'Converteste o valoare tip data-ora la un sir de caractere');
    Add('VarToStr', 'Converteste un variant la un sir de caractere');
    Add('StrToInt', 'Converteste un sir de caractere la o valoare intreaga');
    Add('StrToFloat', 'Converteste un sir de caractere la o valoare reala cu zecimale');
    Add('StrToDate', 'Converteste un sir de caractere la o valoare tip data');
    Add('StrToTime', 'Converteste un sir de caractere la o valoare tip ora');
    Add('StrToDateTime', 'Converteste un sir de caractere la o valoare tip data-ora');
    Add('Format', 'Returneaza un sir de caractere format dintr-o serie de argumente matrice');
    Add('FormatFloat', 'Formateaza o valoare reala cu zecimale');
    Add('FormatDateTime', 'Formateaza o valoare data-ora');
    Add('FormatMaskText', 'Returneaza un sir de caractere formatat utilizand o masca de editare');
    Add('EncodeDate', 'Returneaza o valoare de tip TDateTime pentru Anul, Luna si Ziua specificate');
    Add('DecodeDate', 'Desparte o valoare de tip TDateTime in Anul, Luna si Ziua corespunzatoare');
    Add('EncodeTime', 'Returneaza o valoare de tip TDateTime pentru Ora, Minutul, Secunda si Milisecunda specificate');
    Add('DecodeTime', 'Desparte o valoare de tip TDateTime in Ore, Minute, Secunde si Milisecunde');
    Add('Date', 'Returneaza data curenta');
    Add('Time', 'Returneaza ora curenta');
    Add('Now', 'Returneaza data si ora curenta');
    Add('DayOfWeek', 'Returneaza ziua saptamanii pentru o data specificata');
    Add('IsLeapYear', 'Indica daca anul specificat este bisect');
    Add('DaysInMonth', 'Returneaza numarul de zile din luna specificata');
    Add('Length', 'Returneaza lungimea unui sir de caractere');
    Add('Copy', 'Returneaza un sub-sir al unui sir de caractere');
    Add('Pos', 'Returneaza pozitia unui sub-sir intr-un sir de caractere');
    Add('Delete', 'Elimina un sub-sir dintr-un sir de caractere');
    Add('Insert', 'Insereaza un sub-sir intr-un sir de caractere');
    Add('Uppercase', 'Converteste toate caracterele dintr-un sir la litere mari');
    Add('Lowercase', 'Converteste toate caracterele dintr-un sir la litere mici');
    Add('Trim', 'Elimina spatiile de la inceputul si sfarsitul unui sir de caractere');
    Add('NameCase', 'Converteste primul caracter al unui cuvant la litera mare');
    Add('CompareText', 'Compara doua siruri de caractere');
    Add('Chr', 'Converteste o valoare intraga la un caracter');
    Add('Ord', 'Converteste un caracter la o valoare intreaga');
    Add('SetLength', 'Seteaza lungimea unui sir de caractere');
    Add('Round', 'Rotunjeste o valoare reala cu zecimale la cea mai apropiata valoare intreaga');
    Add('Trunc', 'Trunchiaza o valoare reala cu zecimale la o valoare intreaga');
    Add('Int', 'Returneaza partea intreaga a unui numar real');
    Add('Frac', 'Returneaza partea fractionala a unui numar real');
    Add('Sqrt', 'Returneaza radical din numarul specificat');
    Add('Abs', 'Returneaza o valoare absoluta');
    Add('Sin', 'Returneaza sinusul unui unghi (in radiani)');
    Add('Cos', 'Returneaza cosinusul unui unghi (in radiani)');
    Add('ArcTan', 'Returneaza tangenta unui arc');
    Add('Tan', 'Returneaza tangenta');
    Add('Exp', 'Returneaza valoarea exponentiala');
    Add('Ln', 'Returneaza logaritmul unei expresii reale');
    Add('Pi', 'Returneaza valoarea constantei PI 3.1415926...');
    Add('Inc', 'Incrementeaza o valoare');
    Add('Dec', 'Decrementeaza o valoare');
    Add('RaiseException', 'Produce o exceptie');
    Add('ShowMessage', 'Afiseaza o fereastra de mesaje');
    Add('Randomize', 'Porneste generatorul de de numere aleatoare');
    Add('Random', 'Returneaza un numar aleator');
    Add('ValidInt', 'Returneaza True daca sirul specificat contine o valoare intreaga valida');
    Add('ValidFloat', 'Returneaza True daca sirul specificat contine o valoare reala valida');
    Add('ValidDate', 'Returneaza True daca sirul specificat contine o valoare tip data valida');
    Add('IIF', 'Returneaza valoarea True daca expresia Expr este valida, altfel returneaza valoarea False');
    Add('Get', 'Doar pentru utilizare interna');
    Add('Set', 'Doar pentru utilizare interna');
    Add('InputBox', 'Afiseaza o fereastra de dialog care permite utilizatorului introducerea unui sir de caractere');
    Add('InputQuery', 'Afiseaza o fereastra de dialog care permite utilizatorului introducerea unui sir de caractere');
    Add('MessageDlg', 'Afiseaza o fereastra de dialog');
    Add('CreateOleObject', 'Creeza un obiect OLE');
    Add('VarArrayCreate', 'Creeaza o matrice de valori variant');
    Add('VarType', 'Returneaza tipul unei valori variant');
    Add('DayOf', 'Returneaza numarul zilei (1..31) al unei date specificate');
    Add('MonthOf', 'Returneaza numarul lunii (1..12) al unei date specificate');
    Add('YearOf', 'Returneaza anul unei date specificate');
    
    Add('ctAggregate', 'Totalizatoare');
    Add('Sum', 'Calculeaza suma expresiei Expr pentru randul de date al benzii');
    Add('Avg', 'Calculeaza media expresiei Expr pentru randul de date al benzii');
    Add('Min', 'Calculeaza minimul expresiei Expr pentru randul de date al benzii');
    Add('Max', 'Calculeaza maximul expresiei Expr pentru randul de date al benzii');
    Add('Count', 'Calculeaza numarul de randuri de date');
  end;
end;


initialization
  frAddDesignerRes;

end.