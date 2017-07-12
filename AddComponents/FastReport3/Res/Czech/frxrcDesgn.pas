
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
      'Caption=Objekt inspektor' + #13#10 +
      '');
    Add('oiProp', 'Vlastnosti');
    Add('oiEvent', 'Ud�losti');

    Add('TfrxDataTreeForm',
      'Caption=Strom dat' + #13#10 +
      'DataTS.Caption=Data' + #13#10 +
      'VariablesTS.Caption=Prom�nn�' + #13#10 +
      'FunctionsTS.Caption=Funkce' + #13#10 +
      'InsFieldCB.Caption=Vytvo�it pole' + #13#10 +
      'InsCaptionCB.Caption=Vytvo�it nadpis' + #13#10 +
      '');
    Add('dtNoData', 'Nedostupn� data');
    Add('dtData', 'Data');
    Add('dtSysVar', 'Syst�mov� prom�nn�');
    Add('dtVar', 'Prom�nn�');
    Add('dtFunc', 'Funkce');

    Add('TfrxReportTreeForm',
      'Caption=Strom Reportu' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Otev��t soubor skriptu' + #13#10 +
      'SaveScriptB.Hint=Ulo�it soubor skriptu' + #13#10 +
      'RunScriptB.Hint=Spustit skript' + #13#10 +
      'StepScriptB.Hint=Trasovat do' + #13#10 +
      'StopScriptB.Hint=P�eru�it skript' + #13#10 +
      'EvaluateB.Hint=Vyhodnotit' + #13#10 +
      'LangL.Caption=Jazyk:' + #13#10 +
      'AlignTB.Caption=Zarovn�n�' + #13#10 +
      'AlignLeftsB.Hint=Zarovnat vlevo' + #13#10 +
      'AlignHorzCentersB.Hint=Vyst�edit vodorovn�' + #13#10 +
      'AlignRightsB.Hint=Zarovnat Vpravo' + #13#10 +
      'AlignTopsB.Hint=Zarovnat nahoru' + #13#10 +
      'AlignVertCentersB.Hint=Vyst�edit svisle' + #13#10 +
      'AlignBottomsB.Hint=Zarovnat dol�' + #13#10 +
      'SpaceHorzB.Hint=Vodorovn� mezera' + #13#10 +
      'SpaceVertB.Hint=Svisle mezera' + #13#10 +
      'CenterHorzB.Hint=Vyst�edit vodorovn� v pruhu' + #13#10 +
      'CenterVertB.Hint=Vyst�edit svisle v pruhu' + #13#10 +
      'SameWidthB.Hint=Stejn� ���ka' + #13#10 +
      'SameHeightB.Hint=Stejn� v��ka' + #13#10 +
      'TextTB.Caption=Text' + #13#10 +
      'StyleCB.Hint=Styl' + #13#10 +
      'FontNameCB.Hint=N�zev p�sma' + #13#10 +
      'FontSizeCB.Hint=Velikost p�sma' + #13#10 +
      'BoldB.Hint=Tu�n�' + #13#10 +
      'ItalicB.Hint=Kurz�va' + #13#10 +
      'UnderlineB.Hint=Podtr�en�' + #13#10 +
      'FontColorB.Hint=Barva p�sma' + #13#10 +
      'HighlightB.Hint=Zv�razn�n�' + #13#10 +
      'RotateB.Hint=Oto�en� textu' + #13#10 +
      'TextAlignLeftB.Hint=Zarovnat vlevo' + #13#10 +
      'TextAlignCenterB.Hint=Vyst�edit vodorovn�' + #13#10 +
      'TextAlignRightB.Hint=Zarovnat Vpravo' + #13#10 +
      'TextAlignBlockB.Hint=Form�tovat' + #13#10 +
      'TextAlignTopB.Hint=Zarovnat nahoru' + #13#10 +
      'TextAlignMiddleB.Hint=Vyst�edit svisle' + #13#10 +
      'TextAlignBottomB.Hint=Zarovnat dol�' + #13#10 +
      'FrameTB.Caption=R�me�ek' + #13#10 +
      'FrameTopB.Hint=��ra naho�e' + #13#10 +
      'FrameBottomB.Hint=��ra dole' + #13#10 +
      'FrameLeftB.Hint=��ra vlevo' + #13#10 +
      'FrameRightB.Hint=��ra vpravo' + #13#10 +
      'FrameAllB.Hint=V�echny ��ry r�me�ku' + #13#10 +
      'FrameNoB.Hint=Bez r�me�ku' + #13#10 +
      'ShadowB.Hint=St�n' + #13#10 +
      'FillColorB.Hint=Barva pozad�' + #13#10 +
      'FrameColorB.Hint=Barva r�me�ku' + #13#10 +
      'FrameStyleB.Hint=Barva stylu' + #13#10 +
      'FrameWidthCB.Hint=���ka r�me�ku' + #13#10 +
      'StandardTB.Caption=Standardn�' + #13#10 +
      'NewB.Hint=Nov� Report' + #13#10 +
      'OpenB.Hint=Otev��t Report' + #13#10 +
      'SaveB.Hint=Ulo�it Report' + #13#10 +
      'PreviewB.Hint=P�edtisk' + #13#10 +
      'NewPageB.Hint=Nov� str�nka Reportu' + #13#10 +
      'NewDialogB.Hint=Nov� str�nka dialogu' + #13#10 +
      'DeletePageB.Hint=Odstranit str�nku' + #13#10 +
      'PageSettingsB.Hint=Nastaven� str�nky' + #13#10 +
      'VariablesB.Hint=Prom�nn�' + #13#10 +
      'CutB.Hint=Vyst�ihnout' + #13#10 +
      'CopyB.Hint=Kop�rovat' + #13#10 +
      'PasteB.Hint=Vlo�it' + #13#10 +
      'SampleFormatB.Hint=Kop�rovat form�tov�n�' + #13#10 +
      'UndoB.Hint=Zp�t' + #13#10 +
      'RedoB.Hint=Vp�ed' + #13#10 +
      'ShowGridB.Hint=Zobrazit m��ku' + #13#10 +
      'AlignToGridB.Hint=Zarovnat na m��ku' + #13#10 +
      'SetToGridB.Hint=P�izp�sobit k m��ce' + #13#10 +
      'ScaleCB.Hint=Zv�t�en�' + #13#10 +
      'ExtraToolsTB.Caption=Zvl�tn� n�stroje' + #13#10 +
      'ObjectSelectB.Hint=Vybrat n�stroj' + #13#10 +
      'HandToolB.Hint=N�stroj uchopen�' + #13#10 +
      'ZoomToolB.Hint=N�stroj zv�t�en�' + #13#10 +
      'TextToolB.Hint=N�stroj �pravy textu' + #13#10 +
      'FormatToolB.Hint=N�stroj kop�rov�n� form�tu' + #13#10 +
      'ObjectBandB.Hint=Vlo�it pruh' + #13#10 +
      'FileMenu.Caption=&Soubor' + #13#10 +
      'EditMenu.Caption=�&prava' + #13#10 +
      'FindMI.Caption=Naj�t...' + #13#10 +
      'FindNextMI.Caption=Naj�t dal��' + #13#10 +
      'ReplaceMI.Caption=Nahradit...' + #13#10 +
      'ReportMenu.Caption=&Report' + #13#10 +
      'ReportDataMI.Caption=Data...' + #13#10 +
      'ReportSettingsMI.Caption=Nastaven�...' + #13#10 +
      'ReportStylesMI.Caption=Styly...' + #13#10 +
      'ViewMenu.Caption=&Zobrazit' + #13#10 +
      'ToolbarsMI.Caption=N�strojov� li�ty' + #13#10 +
      'StandardMI.Caption=Standardn�' + #13#10 +
      'TextMI.Caption=Text' + #13#10 +
      'FrameMI.Caption=R�me�ek' + #13#10 +
      'AlignmentMI.Caption=Sada zarovn�n�' + #13#10 +
      'ToolsMI.Caption=Zvl�tn� n�stroje' + #13#10 +
      'InspectorMI.Caption=Inspektor objekt�' + #13#10 +
      'DataTreeMI.Caption=Strom dat' + #13#10 +
      'ReportTreeMI.Caption=Strom Reportu' + #13#10 +
      'ShowRulersMI.Caption=M���tka' + #13#10 +
      'ShowGuidesMI.Caption=Vod�tka' + #13#10 +
      'DeleteGuidesMI.Caption=Odstranit vod�tka' + #13#10 +
      'OptionsMI.Caption=Nastaven�...' + #13#10 +
      'HelpMenu.Caption=&N�pov�da' + #13#10 +
      'HelpContentsMI.Caption=Obsah n�pov�dy...' + #13#10 +
      'AboutMI.Caption=O FastReportu...' + #13#10 +
      'TabOrderMI.Caption=Z�lo�ka se�azen�...' + #13#10 +
      'UndoCmd.Caption=Zp�t' + #13#10 +
      'RedoCmd.Caption=Vp�ed' + #13#10 +
      'CutCmd.Caption=Vyst�ihnout' + #13#10 +
      'CopyCmd.Caption=Kop�rovat' + #13#10 +
      'PasteCmd.Caption=Vlo�it' + #13#10 +
      'DeleteCmd.Caption=Odstranit' + #13#10 +
      'DeletePageCmd.Caption=Odstranit str�nku' + #13#10 +
      'SelectAllCmd.Caption=Vybrat v�e' + #13#10 +
      'EditCmd.Caption=Upravit...' + #13#10 +
      'BringToFrontCmd.Caption=P�en�st dop�edu' + #13#10 +
      'SendToBackCmd.Caption=Odeslat dozadu' + #13#10 +
      'NewItemCmd.Caption=Nov�...' + #13#10 +
      'NewReportCmd.Caption=Nov� Report' + #13#10 +
      'NewPageCmd.Caption=Nov� str�nka' + #13#10 +
      'NewDialogCmd.Caption=Nov� dialog' + #13#10 +
      'OpenCmd.Caption=Otev��t...' + #13#10 +
      'SaveCmd.Caption=Ulo�it' + #13#10 +
      'SaveAsCmd.Caption=Ulo�it jako...' + #13#10 +
      'VariablesCmd.Caption=Prom�nn�...' + #13#10 +
      'PageSettingsCmd.Caption=Nastaven� str�nky...' + #13#10 +
      'PreviewCmd.Caption=P�edtisk' + #13#10 +
      'ExitCmd.Caption=Ukon�it' + #13#10 +
      'ReportTitleMI.Caption=N�zev Reportu' + #13#10 +
      'ReportSummaryMI.Caption=Souhrn Reportu' + #13#10 +
      'PageHeaderMI.Caption=Z�hlav� str�nky' + #13#10 +
      'PageFooterMI.Caption=Z�pat� str�nky' + #13#10 +
      'HeaderMI.Caption=Z�hlav�' + #13#10 +
      'FooterMI.Caption=Z�pat�' + #13#10 +
      'MasterDataMI.Caption=Hlavn� data' + #13#10 +
      'DetailDataMI.Caption=Podrobn� data' + #13#10 +
      'SubdetailDataMI.Caption=Pod�azen� data' + #13#10 +
      'Data4levelMI.Caption=Data 4. �rovn�' + #13#10 +
      'Data5levelMI.Caption=Data 5. �rovn�' + #13#10 +
      'Data6levelMI.Caption=Data 6. �rovn�' + #13#10 +
      'GroupHeaderMI.Caption=Z�hlav� skupiny' + #13#10 +
      'GroupFooterMI.Caption=Z�pat� skupiny' + #13#10 +
      'ChildMI.Caption=Pod�azen�' + #13#10 +
      'ColumnHeaderMI.Caption=Z�hlav� sloupce' + #13#10 +
      'ColumnFooterMI.Caption=Z�pat� sloupce' + #13#10 +
      'OverlayMI.Caption=P�ekryt�' + #13#10 +
      'VerticalbandsMI.Caption=Svisl� pruh' + #13#10 +
      'HeaderMI1.Caption=Z�hlav�' + #13#10 +
      'FooterMI1.Caption=Z�pat�' + #13#10 +
      'MasterDataMI1.Caption=Hlavn� data' + #13#10 +
      'DetailDataMI1.Caption=Podrobn� data' + #13#10 +
      'SubdetailDataMI1.Caption=Pod�azen� data' + #13#10 +
      'GroupHeaderMI1.Caption=Z�hlav� skupiny' + #13#10 +
      'GroupFooterMI1.Caption=Z�pat� skupiny' + #13#10 +
      'ChildMI1.Caption=Pod�azen�' + #13#10 +
      'R0MI.Caption=0�' + #13#10 +
      'R45MI.Caption=45�' + #13#10 +
      'R90MI.Caption=90�' + #13#10 +
      'R180MI.Caption=180�' + #13#10 +
      'R270MI.Caption=270�' + #13#10 +
      'FontB.Hint=Nastaven� p�sma' + #13#10 +
      'BoldMI.Caption=Tu�n�' + #13#10 +
      'ItalicMI.Caption=Kurz�va' + #13#10 +
      'UnderlineMI.Caption=Podtr�en�' + #13#10 +
      'SuperScriptMI.Caption=Horn� index' + #13#10 +
      'SubScriptMI.Caption=Doln� index' + #13#10 +
      'CondensedMI.Caption=Stla�en�' + #13#10 +
      'WideMI.Caption=�irok�' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'OpenDialog.Filter=Report (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=Soubory Pascal (*.pas)|*.pas|Soubory C++ (*.cpp)|*.cpp|Soubory JavaScript (*.js)|*.js|Soubory Basic (*.vb)|*.vb|V�echny soubory|*.*' + #13#10 +
      'SaveScriptDialog.Filter=Soubory Pascal (*.pas)|*.pas|Soubory C++ (*.cpp)|*.cpp|Soubory JavaScript (*.js)|*.js|Soubory Basic (*.vb)|*.vb|V�echny soubory|*.*' + #13#10 +
      '');
    Add('dsCm', 'Centimetry');
    Add('dsInch', 'Palce');
    Add('dsPix', 'Pixely');
    Add('dsChars', 'Znaky');
    Add('dsCode', 'K�d');
    Add('dsPage', 'Strana');
    Add('dsRepFilter', 'Report (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'Komprimovan� report (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', 'Ulo�it zm�ny do str�nky p�edtisku?');
    Add('dsSaveChangesTo', 'Ulo�it zm�ny do ');
    Add('dsCantLoad', 'Nelze na��st soubor');
    Add('dsStyleFile', 'Styl');
    Add('dsCantFindProc', 'Nelze nal�zt hlavn� proceduru');
    Add('dsClearScript', 'Toto vyma�e cel� k�d. Chcete pokra�ovat?');
    Add('dsNoStyle', '��dn� styl');
    Add('dsStyleSample', 'Uk�zka stylu');
    Add('dsTextNotFound', 'Text ''%s'' nenalezen');
    Add('dsReplace', 'Nahradit tuto ud�lost ''%s''?');

    Add('TfrxAboutForm',
      'Caption=O FastReportu' + #13#10 +
      'Label4.Caption=Nav�tivte na�i webstr�nku' + #13#10 +
      'pro v�ce informac�:' + #13#10 +
      'Label6.Caption=Prodej:' + #13#10 +
      'Label8.Caption=Podpora:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Nastaven� str�nky' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      'TabSheet1.Caption=Pap�r' + #13#10 +
      'Label1.Caption=���ka' + #13#10 +
      'Label2.Caption=V��ka' + #13#10 +
      'Label11.Caption=Velikost   ' + #13#10 +
      'Label12.Caption=Orientace   ' + #13#10 +
      'Label3.Caption=Vlevo' + #13#10 +
      'Label4.Caption=Naho�e' + #13#10 +
      'Label5.Caption=Vpravo' + #13#10 +
      'Label6.Caption=Dole' + #13#10 +
      'Label13.Caption=Okraje   ' + #13#10 +
      'Label14.Caption=Zdroj pap�ru   ' + #13#10 +
      'Label9.Caption=Prvn� str�nka' + #13#10 +
      'Label10.Caption=Dal�� str�nky' + #13#10 +
      'PortraitRB.Caption=Na v��ku' + #13#10 +
      'LandscapeRB.Caption=Na ���ku' + #13#10 +
      'TabSheet3.Caption=Dal�� nastaven�' + #13#10 +
      'Label7.Caption=Sloupce   ' + #13#10 +
      'Label8.Caption=Po�et' + #13#10 +
      'Label15.Caption=���ka' + #13#10 +
      'Label16.Caption=Pozice' + #13#10 +
      'Label17.Caption=Dal��   ' + #13#10 +
      'Label18.Caption=Duplex' + #13#10 +
      'PrintOnPrevCB.Caption=Tisk do p�edtisku' + #13#10 +
      'MirrorMarginsCB.Caption=Zrcadlit okraje' + #13#10 +
      'LargeHeightCB.Caption=Velk� v��ka v m�du �prav' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Vybrat Datasety Reportu' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Upravit prom�nn�' + #13#10 +
      'NewCategoryB.Caption=Kategorie' + #13#10 +
      'NewVarB.Caption=Prom�nn�' + #13#10 +
      'EditB.Caption=Upravit' + #13#10 +
      'DeleteB.Caption=Odstranit' + #13#10 +
      'EditListB.Caption=Seznam' + #13#10 +
      'LoadB.Caption=Na��st' + #13#10 +
      'SaveB.Caption=Ulo�it' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'ExprPanel.Caption= V�raz:' + #13#10 +
      'OpenDialog1.Filter=Slovn�k (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Slovn�k (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(Nedefinovan� prom�nn�)');
    Add('vaVar', 'Prom�nn�');
    Add('vaDupName', 'Zdvojen� n�zev');

    Add('TfrxOptionsEditor',
      'Caption=Nastaven� N�vrh��e' + #13#10 +
      'Label1.Caption=M��ka   ' + #13#10 +
      'Label2.Caption=Typ' + #13#10 +
      'Label3.Caption=Velikost' + #13#10 +
      'Label4.Caption=Formul�� dialogu:' + #13#10 +
      'Label5.Caption=Dal��   ' + #13#10 +
      'Label6.Caption=P�sma   ' + #13#10 +
      'Label7.Caption=Okno k�du' + #13#10 +
      'Label8.Caption=Editor memo' + #13#10 +
      'Label9.Caption=Velikost' + #13#10 +
      'Label10.Caption=Velikost' + #13#10 +
      'Label11.Caption=Barvy   ' + #13#10 +
      'Label12.Caption=Prostor mezi pruhy:' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=in' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      'CMRB.Caption=Centimetr�:' + #13#10 +
      'InchesRB.Caption=Palc�:' + #13#10 +
      'PixelsRB.Caption=Pixel�:' + #13#10 +
      'ShowGridCB.Caption=Zobrazit m��ku' + #13#10 +
      'AlignGridCB.Caption=Zarovnat do m��ky' + #13#10 +
      'EditAfterInsCB.Caption=Po vlo�en� zobrazit editor' + #13#10 +
      'ObjectFontCB.Caption=Pou��t nastaven� p�sma objektu' + #13#10 +
      'WorkspaceB.Caption=Pracovn� plocha' + #13#10 +
      'ToolB.Caption=Okna n�stroj�' + #13#10 +
      'LCDCB.Caption=Barva m��ky LCD' + #13#10 +
      'FreeBandsCB.Caption=Voln� um�s�ov�n� pruh�' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Obnovit z�kladn�' + #13#10 +
      'BandsCaptionsCB.Caption=Zobrazit n�zvy pruh�' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=Vybrat DataSet' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      '');
    Add('dbNotAssigned', '[nep�i�azeno]');
    Add('dbSingleLine', 'Jednoduch� ��dek');

    Add('TfrxGroupEditorForm',
      'Caption=Skupina' + #13#10 +
      'BreakOnL.Caption=Break on   ' + #13#10 +
      'OptionsL.Caption=Nastaven�   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      'DataFieldRB.Caption=Datov� pole' + #13#10 +
      'ExpressionRB.Caption=V�raz' + #13#10 +
      'KeepGroupTogetherCB.Caption=Udr�et skupinu pohromad�' + #13#10 +
      'StartNewPageCB.Caption=Spustit novou str�nku' + #13#10 +
      'OutlineCB.Caption=Zobrazit uvnit� or�mov�n�' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=Syst�mov� Memo' + #13#10 +
      'DataBandL.Caption=Pruh dat' + #13#10 +
      'DataSetL.Caption=DataSet' + #13#10 +
      'DataFieldL.Caption=Datov� pole' + #13#10 +
      'FunctionL.Caption=Funkce' + #13#10 +
      'ExpressionL.Caption=V�raz' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      'AggregateRB.Caption=Agreg�tn� hodnota' + #13#10 +
      'SysVariableRB.Caption=Syst�mov� prom�nn�' + #13#10 +
      'CountInvisibleCB.Caption=Po�et neviditeln�ch pruh�' + #13#10 +
      'TextRB.Caption=Text' + #13#10 +
      'RunningTotalCB.Caption=Sou�ty' + #13#10 +
      '');
    Add('agAggregate', 'Vlo�it agreg�tn� prom�nnou');
    Add('vt1', '[DATE]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGES#]');
    Add('vt5', '[PAGE#] z [TOTALPAGES#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=Objekt OLE' + #13#10 +
      'InsertB.Caption=Vlo�it...' + #13#10 +
      'EditB.Caption=Upravit...' + #13#10 +
      'CloseB.Caption=Zav��t' + #13#10 +
      '');
    Add('olStretched', 'P�izp�sobit');

    Add('TfrxBarcodeEditorForm',
      'Caption=Editor ��rov�ho k�du' + #13#10 +
      'CodeLbl.Caption=K�d' + #13#10 +
      'TypeLbl.Caption=Typ ��rov�ho k�du' + #13#10 +
      'ZoomLbl.Caption=Zv�t�en�:' + #13#10 +
      'OptionsLbl.Caption=Nastaven�   ' + #13#10 +
      'RotationLbl.Caption=Oto�en�   ' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CalcCheckSumCB.Caption=Vypo��tat kontroln� sou�et ' + #13#10 +
      'ViewTextCB.Caption=Text' + #13#10 +
      'Rotation0RB.Caption=0�' + #13#10 +
      'Rotation90RB.Caption=90�' + #13#10 +
      'Rotation180RB.Caption=180�' + #13#10 +
      'Rotation270RB.Caption=270�' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Vypo��tat kontroln� sou�et');
    Add('bcShowText', 'Zobrazit text');

    Add('TfrxAliasesEditorForm',
      'Caption=Upravit aliasy' + #13#10 +
      'HintL.Caption=Pro �pravu polo�ky stiskn�te Enter' + #13#10 +
      'DSAliasL.Caption=Alias Datasetu' + #13#10 +
      'FieldAliasesL.Caption=Aliasy pol�' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      'ResetB.Caption=Vynulovat' + #13#10 +
      'UpdateB.Caption=Update' + #13#10 +
      '');
    Add('alUserName', 'U�ivatelsk� jm�no');
    Add('alOriginal', 'Origin�ln� jm�no');

    Add('TfrxParamsEditorForm',
      'Caption=Editor parametr�' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      '');
    Add('qpName', 'N�zev');
    Add('qpDataType', 'Typ dat');
    Add('qpValue', 'Hodnota');

    Add('TfrxMDEditorForm',
      'Caption=Master-Odkaz na detail' + #13#10 +
      'Label1.Caption=Pole detail�' + #13#10 +
      'Label2.Caption=Pole hlavn�ch dat' + #13#10 +
      'Label3.Caption=Odkazovan� pole' + #13#10 +
      'AddB.Caption=P�idat' + #13#10 +
      'ClearB.Caption=Odstranit' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=Memo' + #13#10 +
      'ExprB.Hint=Vlo�it v�raz' + #13#10 +
      'AggregateB.Hint=Vlo�it agreg�tn� prom�nnou' + #13#10 +
      'LocalFormatB.Hint=Vlo�it form�tov�n�' + #13#10 +
      'WordWrapB.Hint=Zalamov�n� slov' + #13#10 +
      'CancelB.Hint=Zru�it' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=Obr�zek' + #13#10 +
      'LoadB.Hint=Na��st' + #13#10 +
      'CopyB.Hint=Kop�rovat' + #13#10 +
      'PasteB.Hint=Vlo�it' + #13#10 +
      'ClearB.Hint=Odstranit' + #13#10 +
      'CancelB.Hint=Zru�it' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('piEmpty', 'Pr�zdn�');

    Add('TfrxChartEditorForm',
      'Caption=Editor graf�' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=P�idat s�rie' + #13#10 +
      'DeleteB.Hint=Odstranit s�rie' + #13#10 +
      'DBSourceRB.Caption=Data z DB' + #13#10 +
      'FixedDataRB.Caption=Pevn� data' + #13#10 +
      'DatasetLbl.Caption=Dataset' + #13#10 +
      'X1Lbl.Caption=X hodnoty' + #13#10 +
      'Y1Lbl.Caption=Y hodnoty' + #13#10 +
      'X3Lbl.Caption=X hodnoty (nap�. a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Y hodnoty (nap�. 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Dal�� nastaven�   ' + #13#10 +
      'ShowTopLbl.Caption=TopN hodnoty' + #13#10 +
      'CaptionLbl.Caption=TopN n�zev' + #13#10 +
      'SortLbl.Caption=Se�azen�' + #13#10 +
      'LineMI.Caption=��ra' + #13#10 +
      'AreaMI.Caption=Plocha' + #13#10 +
      'PointMI.Caption=Bod' + #13#10 +
      'BarMI.Caption=Ty�' + #13#10 +
      'HorizBarMI.Caption=Vodor. ty�' + #13#10 +
      'PieMI.Caption=Kol��' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Rychl� ��ra' + #13#10 +
      '');
    Add('ch3D', '3D zobrazen�');
    Add('chAxis', 'Zobrazit osy');
    Add('chsoNone', '��dn�');
    Add('chsoAscending', 'Vzestupn�');
    Add('chsoDescending', 'Sestupn�');

    Add('TfrxRichEditorForm',
      'Caption=Textov� editor' + #13#10 +
      'OpenB.Hint=Otev��t soubor' + #13#10 +
      'SaveB.Hint=Ulo�it soubor' + #13#10 +
      'UndoB.Hint=Zp�t' + #13#10 +
      'TTB.Hint=P�smo' + #13#10 +
      'ExprB.Hint=Vlo�it v�raz' + #13#10 +
      'CancelB.Hint=Zru�it' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      'BoldB.Hint=Tu�n�' + #13#10 +
      'ItalicB.Hint=Kurz�va' + #13#10 +
      'UnderlineB.Hint=Podtr�en�' + #13#10 +
      'LeftAlignB.Hint=Zarovnat vlevo' + #13#10 +
      'CenterAlignB.Hint=Vyst�edit' + #13#10 +
      'RightAlignB.Hint=Zarovnat vpravo' + #13#10 +
      'BlockAlignB.Hint=Form�tovat' + #13#10 +
      'BulletsB.Hint=Kuli�ky' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Editor k��ov�ch tabulek' + #13#10 +
      'DatasetL.Caption=Zdrojov� data   ' + #13#10 +
      'DimensionsL.Caption=Rozm�ry   ' + #13#10 +
      'RowsL.Caption=��dky' + #13#10 +
      'ColumnsL.Caption=Sloupce' + #13#10 +
      'CellsL.Caption=Bu�ky' + #13#10 +
      'StructureL.Caption=Struktura k��ov� tabulky   ' + #13#10 +
      'RowHeaderCB.Caption=��dka z�hlav�' + #13#10 +
      'ColumnHeaderCB.Caption=Sloupec z�hlav�' + #13#10 +
      'RowTotalCB.Caption=��dka celkov�ho sou�tu' + #13#10 +
      'ColumnTotalCB.Caption=Sloupec celkov�ho sou�tu' + #13#10 +
      'SwapB.Hint=P�epnout ��dky/sloupce' + #13#10 +
      'StyleCB.Hint=Styl k��ov� tabulky' + #13#10 +
      'FontB.Hint=Nastaven� p�sma' + #13#10 +
      'AlignLeftB.Hint=Zarovnat vlevo' + #13#10 +
      'AlignCenterB.Hint=Vyst�edit' + #13#10 +
      'AlignRightB.Hint=Zarovnat vpravo' + #13#10 +
      'RotationB.Hint=Ot��en� textu' + #13#10 +
      'HighlightB.Hint=Zv�razn�n�' + #13#10 +
      'FormatB.Hint=Form�t' + #13#10 +
      'FrameB.Hint=Nastaven� r�me�ku' + #13#10 +
      'FillColorB.Hint=Barva v�pln�' + #13#10 +
      'Func1MI.Caption=��dn�' + #13#10 +
      'Func2MI.Caption=Sou�et' + #13#10 +
      'Func3MI.Caption=Min' + #13#10 +
      'Func4MI.Caption=Max' + #13#10 +
      'Func5MI.Caption=Pr�m�r' + #13#10 +
      'Func6MI.Caption=Po�et' + #13#10 +
      'Sort1MI.Caption=Vzestupn� (A-Z)' + #13#10 +
      'Sort2MI.Caption=Sestupn� (Z-A)' + #13#10 +
      'Sort3MI.Caption=Bez �azen�' + #13#10 +
      'BoldMI.Caption=Tu�n�' + #13#10 +
      'ItalicMI.Caption=Kurz�va' + #13#10 +
      'UnderlineMI.Caption=Podtr�en�' + #13#10 +
      'SuperScriptMI.Caption=Horn� index' + #13#10 +
      'SubScriptMI.Caption=Spodn� index' + #13#10 +
      'CondensedMI.Caption=Stla�en�' + #13#10 +
      'WideMI.Caption=�irok�' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=Zru�it' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('crSubtotal', 'Mezisou�et');
    Add('crNone', '��dn�');
    Add('crSum', 'Sou�et');
    Add('crMin', 'Min');
    Add('crMax', 'Max');
    Add('crAvg', 'Pr�m�r');
    Add('crCount', 'Po�et');
    Add('crAsc', 'A-Z');
    Add('crDesc', 'Z-A');
    Add('crFillMx', 'Pln�n� k��ov� tabulky...');
    Add('crBuildMx', 'Sestavov�n� k��ov� tabulky...');
    Add('crRepHdrs', 'P�etisk z�hlav�');
    Add('crBorder', 'Okraj');
    Add('crDown', 'Dol� potom nap���');

    Add('TfrxExprEditorForm',
      'Caption=Editor v�raz�' + #13#10 +
      'ExprL.Caption=V�raz:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=Form�t zobrazen�' + #13#10 +
      'CategoryL.Caption=Kategorie' + #13#10 +
      'FormatL.Caption=Form�t' + #13#10 +
      'FormatStrL.Caption=Retezec formatu:' + #13#10 +
      'SeparatorL.Caption=Oddelovac des.cisel:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      '');
    Add('fkText', 'Text (neformatovano)');
    Add('fkNumber', 'Cislo');
    Add('fkDateTime', 'Datum/Cas');
    Add('fkBoolean', 'Boolean');
    Add('fkNumber1', '1234.5;%g');
    Add('fkNumber2', '1234.50;%2.2f');
    Add('fkNumber3', '1,234.50;%2.2n');
    Add('fkNumber4', '$1,234.50;%2.2m');
    Add('fkDateTime1', '11.28.2002;mm.dd.yyyy');
    Add('fkDateTime2', '28 lis 2002;dd mmm yyyy');
    Add('fkDateTime3', 'Listopad 28, 2002;mmmm dd, yyyy');
    Add('fkDateTime4', '02:14;hh:mm');
    Add('fkDateTime5', '02:14am;hh:mm am/pm');
    Add('fkDateTime6', '02:14:00;hh:mm:ss');
    Add('fkDateTime7', '02:14am, Listopad 28, 2002;hh:mm am/pm, mmmm dd, yyyy');
    Add('fkBoolean1', '0,1;0,1');
    Add('fkBoolean2', 'Ne,Ano;Ne,Ano');
    Add('fkBoolean3', '_,x;_,x');
    Add('fkBoolean4', 'False,True;False,True');

    Add('TfrxHighlightEditorForm',
      'Caption=Zv�razn�n�' + #13#10 +
      'FontColorB.Caption=Barva...' + #13#10 +
      'BackColorB.Caption=Barva...' + #13#10 +
      'ConditionL.Caption=Podm�nka   ' + #13#10 +
      'FontL.Caption=P�smo   ' + #13#10 +
      'BackgroundL.Caption=Pozad�   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      'BoldCB.Caption=Tu�n�' + #13#10 +
      'ItalicCB.Caption=Kurz�va' + #13#10 +
      'UnderlineCB.Caption=Podtr�en�' + #13#10 +
      'TransparentRB.Caption=Transparentn�' + #13#10 +
      'OtherRB.Caption=Dal��' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Nastaven� Reportu' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      'GeneralTS.Caption=V�eobecn�' + #13#10 +
      'ReportSettingsL.Caption=Nastaven� tisk�rny   ' + #13#10 +
      'CopiesL.Caption=Kopi�' + #13#10 +
      'GeneralL.Caption=V�eobecn�   ' + #13#10 +
      'PasswordL.Caption=Heslo' + #13#10 +
      'CollateCB.Caption=Se�adit kopie' + #13#10 +
      'DoublePassCB.Caption=Dvoj� pr�chod' + #13#10 +
      'PrintIfEmptyCB.Caption=Tisknout i pr�zdn�' + #13#10 +
      'DescriptionTS.Caption=Popis' + #13#10 +
      'NameL.Caption=N�zev' + #13#10 +
      'Description1L.Caption=Popis' + #13#10 +
      'PictureL.Caption=Obr�zek' + #13#10 +
      'AuthorL.Caption=Autor' + #13#10 +
      'MajorL.Caption=Major' + #13#10 +
      'MinorL.Caption=Minor' + #13#10 +
      'ReleaseL.Caption=Vyd�n�' + #13#10 +
      'BuildL.Caption=Sestav.' + #13#10 +
      'CreatedL.Caption=Vytvo�eno' + #13#10 +
      'ModifiedL.Caption=Upraveno' + #13#10 +
      'DescriptionL.Caption=Popis   ' + #13#10 +
      'VersionL.Caption=Verze   ' + #13#10 +
      'PictureB.Caption=Proch�zet...' + #13#10 +
      '');
    Add('rePrnOnPort', 'na');

    Add('TfrxStringsEditorForm',
      'Caption=Polo�ky' + #13#10 +
      'CancelB.Hint=Zru�it' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=Zru�it' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=Heslo' + #13#10 +
      'PasswordL.Caption=Vlo�te heslo:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=Editor stylu' + #13#10 +
      'ColorB.Caption=Barva...' + #13#10 +
      'FontB.Caption=P�smo...' + #13#10 +
      'FrameB.Caption=R�me�ek...' + #13#10 +
      'AddB.Hint=P�idat' + #13#10 +
      'DeleteB.Hint=Odstranit' + #13#10 +
      'EditB.Hint=Upravit' + #13#10 +
      'LoadB.Hint=Na��st' + #13#10 +
      'SaveB.Hint=Ulo�it' + #13#10 +
      'CancelB.Hint=Zru�it' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=Editor r�me�ku' + #13#10 +
      'FrameL.Caption=R�me�ek' + #13#10 +
      'LineL.Caption=��ra r�me�ku' + #13#10 +
      'ShadowL.Caption=St�n' + #13#10 +
      'FrameTopB.Hint=Horn� ��ra' + #13#10 +
      'FrameBottomB.Hint=Spodn� ��ra' + #13#10 +
      'FrameLeftB.Hint=Lev� ��ra' + #13#10 +
      'FrameRightB.Hint=Prav� ��ra' + #13#10 +
      'FrameAllB.Hint=V�echny ��ry r�me�ku' + #13#10 +
      'FrameNoB.Hint=Bez r�me�ku' + #13#10 +
      'FrameColorB.Hint=Barva r�me�ku' + #13#10 +
      'FrameStyleB.Hint=Styl r�me�ku' + #13#10 +
      'FrameWidthCB.Hint=���ka r�me�ku' + #13#10 +
      'ShadowB.Hint=St�n' + #13#10 +
      'ShadowColorB.Hint=Barva st�nu' + #13#10 +
      'ShadowWidthCB.Hint=���ka st�nu' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=Nov� polo�ka' + #13#10 +
      'ItemsTab.Caption=Polo�ky' + #13#10 +
      'TemplatesTab.Caption=�ablony' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Z�lo�ky se�azov�n�' + #13#10 +
      'Label1.Caption=Ovl�d�n� uveden� v z�lo�ce se�azen�:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      'UpB.Caption=Nahoru' + #13#10 +
      'DownB.Caption=Dol�' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Vyhodnocen�' + #13#10 +
      'Label1.Caption=V�raz' + #13#10 +
      'Label2.Caption=V�sledek' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Pr�vodce reportem' + #13#10 +
      'DataTab.Caption=Data' + #13#10 +
      'GroupsTab.Caption=Skupiny' + #13#10 +
      'LayoutTab.Caption=Plocha' + #13#10 +
      'StyleTab.Caption=Styl' + #13#10 +
      'Step1L.Caption=Step 1. Vyberte zobrazovan� dataset a pole.' + #13#10 +
      'Step2L.Caption=Step 2. Vytvo�te skupiny (voliteln�).' + #13#10 +
      'Step3L.Caption=Step 3. Zadejte orientaci str�nky a plochu pro data.' + #13#10 +
      'Step4L.Caption=Step 4. Vyberte styl reportu.' + #13#10 +
      'AddFieldB.Caption=P�idat >' + #13#10 +
      'AddAllFieldsB.Caption=P�idat v�e >>' + #13#10 +
      'RemoveFieldB.Caption=< Odstranit' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Odstranit v�e' + #13#10 +
      'AddGroupB.Caption=P�idat >' + #13#10 +
      'RemoveGroupB.Caption=< Odstranit' + #13#10 +
      'SelectedFieldsL.Caption=Vybran� pole:' + #13#10 +
      'AvailableFieldsL.Caption=Dostupn� pole:' + #13#10 +
      'GroupsL.Caption=Skupiny:' + #13#10 +
      'OrientationL.Caption=Orientace   ' + #13#10 +
      'LayoutL.Caption=Plocha   ' + #13#10 +
      'PortraitRB.Caption=Na v��ku' + #13#10 +
      'LandscapeRB.Caption=Na ���ku' + #13#10 +
      'TabularRB.Caption=Tabulkov�' + #13#10 +
      'ColumnarRB.Caption=Sloupcov�' + #13#10 +
      'FitWidthCB.Caption=P�izp�sobit pole ���ce str�nky' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      'BackB.Caption=<< Zp�t' + #13#10 +
      'NextB.Caption=Dal�� >>' + #13#10 +
      'FinishB.Caption=Dokon�it' + #13#10 +
      '');
    Add('wzStd', 'Standardn� pr�vodce reportem');
    Add('wzDMP', 'Pr�vodce reportem pro jehl. tisk.');
    Add('wzStdEmpty', 'Standardn� report');
    Add('wzDMPEmpty', 'Report pro jehl. tisk.');


    Add('ftAllFiles', 'V�echny soubory');
    Add('ftPictures', 'Obr�zky');
    Add('ftDB', 'Datab�ze');
    Add('ftRichFile', 'Soubor �pravy textu');
    Add('ftTextFile', 'Textov� soubor');

    Add('prNotAssigned', '(Nep�i�azeno)');
    Add('prInvProp', 'Neplatn� hodnota vlastnosti');
    Add('prDupl', 'Zdvojen� n�zev');
    Add('prPict', '(Obr�zek)');

    Add('mvExpr', 'Povolit v�razy');
    Add('mvStretch', 'P�izp�sobit velikost');
    Add('mvStretchToMax', 'P�izp�sobit max. v��ce');
    Add('mvShift', 'Posunout');
    Add('mvShiftOver', 'Posunout p�i p�esahu');
    Add('mvVisible', 'Viditeln�');
    Add('mvPrintable', 'Tisknuteln�');
    Add('mvFont', 'P�smo...');
    Add('mvFormat', 'Form�t zobrazen�...');
    Add('mvClear', 'Odstranit obsah');
    Add('mvAutoWidth', 'Autom. ���ka');
    Add('mvWWrap', 'Zalamov�n�');
    Add('mvSuppress', 'Potla�it opakovan� hodnoty');
    Add('mvHideZ', 'Skr�t nuly');
    Add('mvHTML', 'Povolit HTML tagy');
    Add('lvDiagonal', '�hlop���n�');
    Add('pvAutoSize', 'Autom. velikost');
    Add('pvCenter', 'Vyst�edit');
    Add('pvAspect', 'Dodr�et stran. pom�r');
    Add('bvSplit', 'Povolit rozd�len�');
    Add('bvKeepChild', 'Dr�et pod�azen� u sebe');
    Add('bvPrintChild', 'Tisknout neviditeln� pod�azen�');
    Add('bvStartPage', 'Za��t novou str�nku');
    Add('bvPrintIfEmpty', 'Tisknout i pr�zdn� detaily');
    Add('bvKeepDetail', 'Dr�et detaily u sebe');
    Add('bvKeepFooter', 'Dr�et z�pat� u sebe');
    Add('bvReprint', 'Znova tisknout na novou stranu');
    Add('bvOnFirst', 'Tisknout na prvn� stranu');
    Add('bvOnLast', 'Tisknout na posledn� stranu');
    Add('bvKeepGroup', 'Dr�et spolu');
    Add('bvFooterAfterEach', 'Z�pat� po ka�d� ��dce');
    Add('srParent', 'Tisknout do nad�azen�');
    Add('bvKeepHeader', 'Keep Header Together');

    Add('obCatDraw', 'Kresba');
    Add('obCatOther', 'Jin� objekty');
    Add('obCatOtherControls', 'Jin� ovl�d�n�');
    Add('obDiagLine', '�ikm� ��ra');
    Add('obRect', '�ty��heln�k');
    Add('obRoundRect', 'Zaoblen� �ty��heln�k');
    Add('obEllipse', 'Elipsa');
    Add('obTrian', 'Troj�heln�k');
    Add('obDiamond', 'Diamant');
    Add('obLabel', 'Nadpis');
    Add('obEdit', 'Edita�n� pole');
    Add('obMemoC', 'Memo');
    Add('obButton', 'Tla��tko');
    Add('obChBoxC', 'Zatr��tko');
    Add('obRButton', 'P�ep�nac� pol��ko');
    Add('obLBox', 'Rolovac� seznam');
    Add('obCBox', 'V�suvn� seznam');
    Add('obDateEdit', 'Editace dat');
    Add('obImageC', 'Obr�zek');
    Add('obPanel', 'Panel');
    Add('obGrBox', 'Skupinov� panel');
    Add('obBBtn', 'Grafick� tla��tko');
    Add('obSBtn', 'Rychl� tla��tko');
    Add('obMEdit', 'Maskov� editace');
    Add('obChLB', 'Panel seznamu zatr��tek');
    Add('obDBLookup', 'V�suvn� panel DB');
    Add('obBevel', 'Objekt zkosen�');
    Add('obShape', 'Objekt tvaru');
    Add('obText', 'Objekt textu');
    Add('obSysText', 'Syst�mov� text');
    Add('obLine', 'Objekt ��ry');
    Add('obPicture', 'Objekt obr�zku');
    Add('obBand', 'Objekt pruhu');
    Add('obDataBand', 'Pruh dat');
    Add('obSubRep', 'Objekt Subreportu');
    Add('obDlgPage', 'Formul�� dialogu');
    Add('obRepPage', 'Str�nka reportu');
    Add('obReport', 'Objekt reportu');
    Add('obRich', 'Objekt RichTextu');
    Add('obOLE', 'Objekt OLE');
    Add('obChBox', 'Objekt zatr��tka');
    Add('obChart', 'Objekt grafu');
    Add('obBarC', 'Objekt ��r.k�du');
    Add('obCross', 'Objekt k��.tabulky');
    Add('obDBCross', 'Objekt DB k��.tab.');
    Add('obGrad', 'Objekt gradientu');
    Add('obDMPText', 'Objekt textu jehl.tisk.');
    Add('obDMPLine', 'Objekt ��ry jehl.tisk.');
    Add('obBDEDB', 'BDE datab�ze');
    Add('obBDETb', 'BDE tabulka');
    Add('obBDEQ', 'BDE Query');
    Add('obBDEComps', 'BDE komponenty');
    Add('obIBXDB', 'IBX datab�ze');
    Add('obIBXTb', 'IBX tabulka');
    Add('obIBXQ', 'IBX Query');
    Add('obIBXComps', 'IBX komponenty');
    Add('obADODB', 'ADO datab�ze');
    Add('obADOTb', 'ADO tabulka');
    Add('obADOQ', 'ADO Query');
    Add('obADOComps', 'ADO komponenty');
    Add('obDBXDB', 'DBX datab�ze');
    Add('obDBXTb', 'DBX tabulka');
    Add('obDBXQ', 'DBX Query');
    Add('obDBXComps', 'DBX komponenty');

    Add('ctString', '�et�zec');
    Add('ctDate', 'Datum a �as');
    Add('ctConv', 'Konverze');
    Add('ctFormat', 'Form�tov�n�');
    Add('ctMath', 'Matematick�');
    Add('ctOther', 'Jin�');

    Add('IntToStr', 'P�evede hodnotu integer na �et�zec');
    Add('FloatToStr', 'P�evede hodnotu float na �et�zec');
    Add('DateToStr', 'P�evede datum na �et�zec');
    Add('TimeToStr', 'P�evede �as na �et�zec');
    Add('DateTimeToStr', 'P�evede hodnotu datum-a-�as na �et�zec');
    Add('VarToStr', 'P�evede hodnotu variant na �et�zec');
    Add('StrToInt', 'P�evede �et�zec na hodnotu integer');
    Add('StrToFloat', 'P�evede �et�zec na hodnotu floating-point');
    Add('StrToDate', 'P�evede �et�zec na form�t datum');
    Add('StrToTime', 'P�evede �et�zec na form�t �as');
    Add('StrToDateTime', 'P�evede �et�zec na form�t datum-a-�as');
    Add('Format', 'Vr�t� form�tovan� �et�zec sestaven� z �ad argument� pole');
    Add('FormatFloat', 'Form�tuje hodnotu floating-point');
    Add('FormatDateTime', 'Form�tuje hodnotu datum-a-�as');
    Add('FormatMaskText', 'Vr�t� �et�zec form�tovan� s pou�it�m upraven� masky');
    Add('EncodeDate', 'Vr�t� typ TDateTime pro zadan� rok, m�s�c a den');
    Add('DecodeDate', 'Rozd�l� TDateTime na hodnoty rok, m�s�c a den');
    Add('EncodeTime', 'Vr�t� typ TDateTime pro zadanou hodinu, min., sek. a milisek.');
    Add('DecodeTime', 'Rozd�l� TDateTime na hodnoty hodiny, min., sek. a milisek.');
    Add('Date', 'Vr�t� aktu�ln� datum');
    Add('Time', 'Vr�t� aktu�ln� �as');
    Add('Now', 'Vr�t� aktu�ln� datum a �as');
    Add('DayOfWeek', 'Vr�t� den v m�s�ci zadan�ho datumu');
    Add('IsLeapYear', 'Indikuje zda je zadan� rok p�estupn�');
    Add('DaysInMonth', 'Vr�t� po�et dn� zadan�ho m�s�ce');
    Add('Length', 'Vr�t� d�lku �et�zce');
    Add('Copy', 'Vr�t� pod�et�zec �et�zce');
    Add('Pos', 'Vr�t� pozici pod�et�zce v �et�zci');
    Add('Delete', 'Odstran� pod�et�zec z �et�zce');
    Add('Insert', 'Vlo�� pod�et�zec do �et�zce');
    Add('Uppercase', 'P�evede v�echny znaky v �et�zci na velk� p�smena');
    Add('Lowercase', 'P�evede v�echny znaky v �et�zci na mal� p�smena');
    Add('Trim', 'Odstran� v�echny po��te�n� a koncov� mezery z �et�zce');
    Add('NameCase', 'P�evede prvn� p�smeno slova na velk�');
    Add('CompareText', 'Porovn� dva �et�zce');
    Add('Chr', 'P�evede hodnotu integer na char');
    Add('Ord', 'P�evede hodnotu char na integer');
    Add('SetLength', 'Nastav� d�lku �et�zce');
    Add('Round', 'Zaokrouhl� hodnotu floating-point na nejbli��� cel� ��slo');
    Add('Trunc', 'O��zne hodnotu floating-point na integer');
    Add('Int', 'Vr�t� integer ��st re�ln�ho ��sla');
    Add('Frac', 'Vr�t� desetinou ��st re�ln�ho ��sla');
    Add('Sqrt', 'Vr�t� ko�en mocniny zadan�ho ��sla');
    Add('Abs', 'Vr�t� absolutn� hodnotu');
    Add('Sin', 'Vr�t� sinus �hlu (v radi�nech)');
    Add('Cos', 'Vr�t� cosinus �hlu (v radi�nech)');
    Add('ArcTan', 'Vr�t� arctangent');
    Add('Tan', 'Vr�t� tangent');
    Add('Exp', 'Vr�t� exponenci�l');
    Add('Ln', 'Vr�t� p�irozen� logaritmus re�ln�ho ��sla');
    Add('Pi', 'Vr�t� ��slo 3.1415926...');
    Add('Inc', 'Zv��� hodnotu');
    Add('Dec', 'Sn�� hodnotu');
    Add('RaiseException', 'Vyvol� vyj�mku');
    Add('ShowMessage', 'Zobraz� okno zpr�vy');
    Add('Randomize', 'Spust� gener�tor n�hodn�ch ��sel');
    Add('Random', 'Vr�t� n�hodn� ��slo');
    Add('ValidInt', 'Vr�t� hodnotu True pokud zadan� ��slo obsahuje platn� integer');
    Add('ValidFloat', 'Vr�t� hodnotu True pokud zadan� ��slo obsahuje platn� float');
    Add('ValidDate', 'Vr�t� hodnotu True pokud zadan� ��slo obsahuje platn� datum');
    Add('IIF', 'Vr�t� hodnotu True pokud je zadan� v�raz pravdiv�, jinak vr�t� False');
    Add('Get', 'Pouze pro intern� pou�it�');
    Add('Set', 'Pouze pro intern� pou�it�');
    Add('InputBox', 'Zobraz� vstupn� dialogov� okno umo��uj�c� zadat u�ivateli �et�zec');
    Add('InputQuery', 'Zobraz� vstupn� dialogov� okno umo��uj�c� zadat u�ivateli �et�zec');
    Add('MessageDlg', 'Zobraz� okno zpr�vy');
    Add('CreateOleObjekt ', 'Vytvo�� OLE objekt');
    Add('VarArrayCreate', 'Vytvo�� variant pole');
    Add('VarType', 'Vr�t� typ hodnoty variant');
    Add('DayOf', 'Returns day number (1..31) of given Date');
    Add('MonthOf', 'Returns month number (1..12) of given Date');
    Add('YearOf', 'Returns year of given Date');

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