
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
      'Caption=Object Inspector' + #13#10 +
      '');
    Add('oiProp', 'Tulajdons�gok');
    Add('oiEvent', 'Esem�nyek');

    Add('TfrxDataTreeForm',
      'Caption=Adatfa' + #13#10 +
      'DataTS.Caption=Adat' + #13#10 +
      'VariablesTS.Caption=V�ltoz�k' + #13#10 +
      'FunctionsTS.Caption=F�ggv�nyek' + #13#10 +
      'InsFieldCB.Caption=Mez� l�trehoz�sa' + #13#10 +
      'InsCaptionCB.Caption=C�m l�trehoz�sa' + #13#10 +
      '');
    Add('dtNoData', 'Nincs adat');
    Add('dtData', 'Adat');
    Add('dtSysVar', 'Rendszerv�ltoz�k');
    Add('dtVar', 'V�ltoz�k');
    Add('dtFunc', 'F�ggv�nyek');

    Add('TfrxReportTreeForm',
      'Caption=Jelent�s fa' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Scriptf�jl megnyit�sa' + #13#10 +
      'SaveScriptB.Hint=Scriptf�jl ment�se' + #13#10 +
      'RunScriptB.Hint=Script futtat�sa' + #13#10 +
      'StepScriptB.Hint=Nyomk�vet�s' + #13#10 +
      'StopScriptB.Hint=Script bez�r�sa' + #13#10 +
      'EvaluateB.Hint=Ki�rt�kel' + #13#10 +
      'LangL.Caption=Nyelv:' + #13#10 +
      'AlignTB.Caption=Igaz�t�s' + #13#10 +
      'AlignLeftsB.Hint=Igaz�t�s balra' + #13#10 +
      'AlignHorzCentersB.Hint=Igaz�t�s k�z�pre' + #13#10 +
      'AlignRightsB.Hint=Igaz�t�s jobbra' + #13#10 +
      'AlignTopsB.Hint=Igaz�t�s fentre' + #13#10 +
      'AlignVertCentersB.Hint=Igaz�t�s k�z�pre' + #13#10 +
      'AlignBottomsB.Hint=Igaz�t�s lentre' + #13#10 +
      'SpaceHorzB.Hint=T�r vizszintesen' + #13#10 +
      'SpaceVertB.Hint=T�r f�gg�legesen' + #13#10 +
      'CenterHorzB.Hint=V�zszintesen s�vk�z�pre' + #13#10 +
      'CenterVertB.Hint=F�gg�legesen s�vk�z�pre' + #13#10 +
      'SameWidthB.Hint=Azonos sz�less�g' + #13#10 +
      'SameHeightB.Hint=Azonos magass�g' + #13#10 +
      'TextTB.Caption=Sz�veg' + #13#10 +
      'StyleCB.Hint=St�lus' + #13#10 +
      'FontNameCB.Hint=Bet� neve' + #13#10 +
      'FontSizeCB.Hint=Bet� m�rete' + #13#10 +
      'BoldB.Hint=F�lk�v�r' + #13#10 +
      'ItalicB.Hint=D�lt' + #13#10 +
      'UnderlineB.Hint=Al�h�zott' + #13#10 +
      'FontColorB.Hint=Bet� sz�ne' + #13#10 +
      'HighlightB.Hint=Kiemel�s' + #13#10 +
      'RotateB.Hint=Sz�veg forgat�sa' + #13#10 +
      'TextAlignLeftB.Hint=Balra igaz�t' + #13#10 +
      'TextAlignCenterB.Hint=K�z�pre igaz�t' + #13#10 +
      'TextAlignRightB.Hint=Jobbra igaz�t' + #13#10 +
      'TextAlignBlockB.Hint=Sorkiz�r' + #13#10 +
      'TextAlignTopB.Hint=Fel�lre igaz�t' + #13#10 +
      'TextAlignMiddleB.Hint=K�z�pre igaz�t' + #13#10 +
      'TextAlignBottomB.Hint=Alulra igaz�t' + #13#10 +
      'FrameTB.Caption=Keret' + #13#10 +
      'FrameTopB.Hint=Fels� vonal' + #13#10 +
      'FrameBottomB.Hint=Als� vonal' + #13#10 +
      'FrameLeftB.Hint=Bal vonal' + #13#10 +
      'FrameRightB.Hint=Jobb vonal' + #13#10 +
      'FrameAllB.Hint=Minden keretvonal' + #13#10 +
      'FrameNoB.Hint=Nincs keret' + #13#10 +
      'ShadowB.Hint=�rny�k' + #13#10 +
      'FillColorB.Hint=H�tt�rsz�n' + #13#10 +
      'FrameColorB.Hint=Keretsz�n' + #13#10 +
      'FrameStyleB.Hint=Keret st�lusa' + #13#10 +
      'FrameWidthCB.Hint=Keret vastags�ga' + #13#10 +
      'StandardTB.Caption=Norm�l' + #13#10 +
      'NewB.Hint=�j riport' + #13#10 +
      'OpenB.Hint=Riport megnyit�sa' + #13#10 +
      'SaveB.Hint=Riport ment�se' + #13#10 +
      'PreviewB.Hint=El�k�p' + #13#10 +
      'NewPageB.Hint=�j riportlap' + #13#10 +
      'NewDialogB.Hint=�j p�rbesz�dlap' + #13#10 +
      'DeletePageB.Hint=Lap t�rl�se' + #13#10 +
      'PageSettingsB.Hint=Oldalbe�ll�t�s' + #13#10 +
      'VariablesB.Hint=V�ltoz�k' + #13#10 +
      'CutB.Hint=Kiv�g' + #13#10 +
      'CopyB.Hint=M�sol' + #13#10 +
      'PasteB.Hint=Beilleszt' + #13#10 +
      'SampleFormatB.Hint=Form�z�s m�sol�sa' + #13#10 +
      'UndoB.Hint=Vissza' + #13#10 +
      'RedoB.Hint=M�gis' + #13#10 +
      'ShowGridB.Hint=R�csot mutat' + #13#10 +
      'AlignToGridB.Hint=R�csra illeszt' + #13#10 +
      'SetToGridB.Hint=R�cshoz igaz�t' + #13#10 +
      'ScaleCB.Hint=Nagy�t' + #13#10 +
      'ExtraToolsTB.Caption=Extra eszk�z�k' + #13#10 +
      'ObjectSelectB.Hint=Kiv�laszt�s eszk�zei' + #13#10 +
      'HandToolB.Hint=K�z eszk�z' + #13#10 +
      'ZoomToolB.Hint=Nagy�t�' + #13#10 +
      'TextToolB.Hint=Sz�vegszerkeszt�' + #13#10 +
      'FormatToolB.Hint=Form�tumm�sol�' + #13#10 +
      'ObjectBandB.Hint=S�v besz�r�sa' + #13#10 +
      'FileMenu.Caption=&F�jl' + #13#10 +
      'EditMenu.Caption=&Szerkeszt' + #13#10 +
      'FindMI.Caption=Keres...' + #13#10 +
      'FindNextMI.Caption=K�vetkez�' + #13#10 +
      'ReplaceMI.Caption=Cser�l...' + #13#10 +
      'ReportMenu.Caption=&Riport' + #13#10 +
      'ReportDataMI.Caption=Adat...' + #13#10 +
      'ReportSettingsMI.Caption=Opci�k...' + #13#10 +
      'ReportStylesMI.Caption=St�lusok...' + #13#10 +
      'ViewMenu.Caption=&N�zet' + #13#10 +
      'ToolbarsMI.Caption=Eszk�zt�rak' + #13#10 +
      'StandardMI.Caption=Norm�l' + #13#10 +
      'TextMI.Caption=Sz�veg' + #13#10 +
      'FrameMI.Caption=Keret' + #13#10 +
      'AlignmentMI.Caption=Igaz�t�s paletta' + #13#10 +
      'ToolsMI.Caption=Extra eszk�z�k' + #13#10 +
      'InspectorMI.Caption=Object Inspector' + #13#10 +
      'DataTreeMI.Caption=Adatfa' + #13#10 +
      'ReportTreeMI.Caption=Riportfa' + #13#10 +
      'ShowRulersMI.Caption=Vonalz�k' + #13#10 +
      'ShowGuidesMI.Caption=Vezet�k' + #13#10 +
      'DeleteGuidesMI.Caption=Vezet�k t�rl�se' + #13#10 +
      'OptionsMI.Caption=Opci�k...' + #13#10 +
      'HelpMenu.Caption=&S�g�' + #13#10 +
      'HelpContentsMI.Caption=Tartalomjegyz�k...' + #13#10 +
      'AboutMI.Caption=N�vjegy...' + #13#10 +
      'TabOrderMI.Caption=Tab sorrend...' + #13#10 +
      'UndoCmd.Caption=Vissza' + #13#10 +
      'RedoCmd.Caption=M�gis' + #13#10 +
      'CutCmd.Caption=Kiv�g' + #13#10 +
      'CopyCmd.Caption=M�sol' + #13#10 +
      'PasteCmd.Caption=Beilleszt' + #13#10 +
      'DeleteCmd.Caption=T�r�l' + #13#10 +
      'DeletePageCmd.Caption=Oldalt t�r�l' + #13#10 +
      'SelectAllCmd.Caption=Mindent kijel�l' + #13#10 +
      'EditCmd.Caption=Szerkeszt...' + #13#10 +
      'BringToFrontCmd.Caption=El�rehoz' + #13#10 +
      'SendToBackCmd.Caption=H�trak�ld' + #13#10 +
      'NewItemCmd.Caption=�j...' + #13#10 +
      'NewReportCmd.Caption=�j riport' + #13#10 +
      'NewPageCmd.Caption=�j lap' + #13#10 +
      'NewDialogCmd.Caption=�j p�rbesz�d' + #13#10 +
      'OpenCmd.Caption=Megnyit...' + #13#10 +
      'SaveCmd.Caption=Ment' + #13#10 +
      'SaveAsCmd.Caption=M�sk�nt ment...' + #13#10 +
      'VariablesCmd.Caption=V�ltoz�k...' + #13#10 +
      'PageSettingsCmd.Caption=Oldalbe�ll�t�s...' + #13#10 +
      'PreviewCmd.Caption=El�k�p' + #13#10 +
      'ExitCmd.Caption=Kil�p' + #13#10 +
      'ReportTitleMI.Caption=Riport c�me' + #13#10 +
      'ReportSummaryMI.Caption=Riport �sszes�t�' + #13#10 +
      'PageHeaderMI.Caption=Oldal fejl�c' + #13#10 +
      'PageFooterMI.Caption=Oldal l�bl�c' + #13#10 +
      'HeaderMI.Caption=Fejl�c' + #13#10 +
      'FooterMI.Caption=L�bl�c' + #13#10 +
      'MasterDataMI.Caption=Master adat' + #13#10 +
      'DetailDataMI.Caption=Detail adat' + #13#10 +
      'SubdetailDataMI.Caption=Subdetail adat' + #13#10 +
      'Data4levelMI.Caption=4, adatszint' + #13#10 +
      'Data5levelMI.Caption=5. adatszint' + #13#10 +
      'Data6levelMI.Caption=6. adatszint' + #13#10 +
      'GroupHeaderMI.Caption=Csoport fejl�c' + #13#10 +
      'GroupFooterMI.Caption=Csoport l�bl�c' + #13#10 +
      'ChildMI.Caption=Gyerek' + #13#10 +
      'ColumnHeaderMI.Caption=Oszlop fejl�c' + #13#10 +
      'ColumnFooterMI.Caption=Oszlop l�bl�c' + #13#10 +
      'OverlayMI.Caption=�sztat�s' + #13#10 +
      'VerticalbandsMI.Caption=F�gg�leges s�vok' + #13#10 +
      'HeaderMI1.Caption=Fejl�c' + #13#10 +
      'FooterMI1.Caption=L�bl�c' + #13#10 +
      'MasterDataMI1.Caption=Master adat' + #13#10 +
      'DetailDataMI1.Caption=Detail adat' + #13#10 +
      'SubdetailDataMI1.Caption=Subdetail adat' + #13#10 +
      'GroupHeaderMI1.Caption=Csoport fejl�c' + #13#10 +
      'GroupFooterMI1.Caption=Csoport l�bl�c' + #13#10 +
      'ChildMI1.Caption=Gyerek' + #13#10 +
      'R0MI.Caption=0�' + #13#10 +
      'R45MI.Caption=45�' + #13#10 +
      'R90MI.Caption=90�' + #13#10 +
      'R180MI.Caption=180�' + #13#10 +
      'R270MI.Caption=270�' + #13#10 +
      'FontB.Hint=Bet�be�ll�t�sok' + #13#10 +
      'BoldMI.Caption=F�lk�v�r' + #13#10 +
      'ItalicMI.Caption=D�lt' + #13#10 +
      'UnderlineMI.Caption=Al�h�zott' + #13#10 +
      'SuperScriptMI.Caption=Fels� index' + #13#10 +
      'SubScriptMI.Caption=Als� index' + #13#10 +
      'CondensedMI.Caption=S�r�tett' + #13#10 +
      'WideMI.Caption=Sz�les' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'OpenDialog.Filter=Riport (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=Pascal f�jlok (*.pas)|*.pas|C++ f�jlok (*.cpp)|*.cpp|JavaScript f�jlok (*.js)|*.js|Basic f�jlok (*.vb)|*.vb|Minden f�jl|*.*' + #13#10 +
      'SaveScriptDialog.Filter=Pascal f�jlok (*.pas)|*.pas|C++ f�jlok (*.cpp)|*.cpp|JavaScript f�jlok (*.js)|*.js|Basic f�jlok (*.vb)|*.vb|Minden f�jl|*.*' + #13#10 +
      'GroupB.Hint=Group' + #13#10 +
      'UngroupB.Hint=Ungroup' + #13#10 +
      'GroupCmd.Caption=Group' + #13#10 +
      'UngroupCmd.Caption=Ungroup' + #13#10 +
      '');
    Add('dsCm', 'Centim�ter');
    Add('dsInch', 'H�velyk');
    Add('dsPix', 'Pixel');
    Add('dsChars', 'Karakter');
    Add('dsCode', 'K�d');
    Add('dsPage', 'Lap');
    Add('dsRepFilter', 'Riport (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'T�m�r�tett riport (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', 'Mentsem a v�ltoz�sokat az el�k�pbe?');
    Add('dsSaveChangesTo', 'V�ltoz�sok ment�se ');
    Add('dsCantLoad', 'Nem lehet a f�jlt bet�lteni');
    Add('dsStyleFile', 'St�lus');
    Add('dsCantFindProc', 'Nem tal�lhat� a f� elj�r�s');
    Add('dsClearScript', 'Minden k�d t�rl�dik. Folytassam?');
    Add('dsNoStyle', 'Nincs st�lus');
    Add('dsStyleSample', 'St�lusminta');
    Add('dsTextNotFound', 'A ''%s'' sz�veg nem tal�lhat�');
    Add('dsReplace', 'Cser�ljem a ''%s'' sz�veget?');

    Add('TfrxAboutForm',
      'Caption=About FastReport' + #13#10 +
      'Label4.Caption=Tov�bbi inform�ci��rt keresse fel honlapunkat:' + #13#10 +
      'Label6.Caption=�rt�kes�t�s:' + #13#10 +
      'Label8.Caption=T�mogat�s:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Oldal opci�k' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      'TabSheet1.Caption=Pap�r' + #13#10 +
      'Label1.Caption=Sz�less�g' + #13#10 +
      'Label2.Caption=Magass�g' + #13#10 +
      'Label11.Caption=M�ret  ' + #13#10 +
      'Label12.Caption=Ir�ny         ' + #13#10 +
      'Label3.Caption=Bal' + #13#10 +
      'Label4.Caption=Fels�' + #13#10 +
      'Label5.Caption=Jobb' + #13#10 +
      'Label6.Caption=Als�' + #13#10 +
      'Label13.Caption=Marg�k    ' + #13#10 +
      'Label14.Caption=Pap�rforr�s    ' + #13#10 +
      'Label9.Caption=Els� oldal' + #13#10 +
      'Label10.Caption=T�bbi oldal' + #13#10 +
      'PortraitRB.Caption=Portr�' + #13#10 +
      'LandscapeRB.Caption=T�jk�p' + #13#10 +
      'TabSheet3.Caption=Egy�b opci�k' + #13#10 +
      'Label7.Caption=Oszlopok  ' + #13#10 +
      'Label8.Caption=Sz�m' + #13#10 +
      'Label15.Caption=Sz�less�g' + #13#10 +
      'Label16.Caption=Pozici�' + #13#10 +
      'Label17.Caption=Egy�b   ' + #13#10 +
      'Label18.Caption=K�toldalas' + #13#10 +
      'PrintOnPrevCB.Caption=El�z� oldalra nyomtat' + #13#10 +
      'MirrorMarginsCB.Caption=Marg�k t�kr�z�se' + #13#10 +
      'LargeHeightCB.Caption=Nagy magass�g tervez�m�dban' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Riport DataSet-ek kiv�laszt�sa' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=V�ltoz�k szerkeszt�se' + #13#10 +
      'NewCategoryB.Caption=Kateg�ria' + #13#10 +
      'NewVarB.Caption=V�ltoz�' + #13#10 +
      'EditB.Caption=Szerkeszt' + #13#10 +
      'DeleteB.Caption=T�r�l' + #13#10 +
      'EditListB.Caption=List�z' + #13#10 +
      'LoadB.Caption=Bet�lt' + #13#10 +
      'SaveB.Caption=Ment' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'ExprPanel.Caption= Kifejez�s:' + #13#10 +
      'OpenDialog1.Filter=Sz�t�r (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Sz�t�r (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(nincs defini�lt v�ltoz�)');
    Add('vaVar', 'V�ltoz�k');
    Add('vaDupName', 'Duplik�lt n�v');

    Add('TfrxOptionsEditor',
      'Caption=Tervez� opci�k' + #13#10 +
      'Label1.Caption=R�cs   ' + #13#10 +
      'Label2.Caption=T�pus' + #13#10 +
      'Label3.Caption=M�ret' + #13#10 +
      'Label4.Caption=P�rbesz�d:' + #13#10 +
      'Label5.Caption=Egy�b   ' + #13#10 +
      'Label6.Caption=Bet�k   ' + #13#10 +
      'Label7.Caption=K�d ablak' + #13#10 +
      'Label8.Caption=Memo szerkeszt�' + #13#10 +
      'Label9.Caption=M�ret' + #13#10 +
      'Label10.Caption=M�ret' + #13#10 +
      'Label11.Caption=Sz�nek   ' + #13#10 +
      'Label12.Caption=H�zag a s�vok k�z�tt:' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=in' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      'CMRB.Caption=Centim�ter:' + #13#10 +
      'InchesRB.Caption=H�velyk:' + #13#10 +
      'PixelsRB.Caption=Pixel:' + #13#10 +
      'ShowGridCB.Caption=R�csot mutat' + #13#10 +
      'AlignGridCB.Caption=R�cshoz igaz�t' + #13#10 +
      'EditAfterInsCB.Caption=Besz�r�s ut�n szerkeszt' + #13#10 +
      'ObjectFontCB.Caption=Objektum bet�be�ll�t�s�t haszn�lja' + #13#10 +
      'WorkspaceB.Caption=Munkahely' + #13#10 +
      'ToolB.Caption=Eszk�zablakok' + #13#10 +
      'LCDCB.Caption=LCD r�cs sz�ne' + #13#10 +
      'FreeBandsCB.Caption=Szabad s�vok elhelyez�se' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Alap�rtelmez�sek vissza�ll�t�sa' + #13#10 +
      'BandsCaptionsCB.Caption=S�vc�meket mutat' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=DataSet kiv�laszt�sa' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gse' + #13#10 +
      '');
    Add('dbNotAssigned', '[nincs hozz�rendelve]');
    Add('dbSingleLine', 'Egy sor');

    Add('TfrxGroupEditorForm',
      'Caption=Group' + #13#10 +
      'BreakOnL.Caption=T�r�spont   ' + #13#10 +
      'OptionsL.Caption=Opci�k    ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      'DataFieldRB.Caption=Adatmez�' + #13#10 +
      'ExpressionRB.Caption=Kifejez�s' + #13#10 +
      'KeepGroupTogetherCB.Caption=Csoportokat egy�ttart' + #13#10 +
      'StartNewPageCB.Caption=�j oldalt kezd' + #13#10 +
      'OutlineCB.Caption=K�rvonalasan mutat' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=Rendszer memo' + #13#10 +
      'DataBandL.Caption=Adats�v' + #13#10 +
      'DataSetL.Caption=DataSet' + #13#10 +
      'DataFieldL.Caption=Adatmez�' + #13#10 +
      'FunctionL.Caption=F�ggv�ny' + #13#10 +
      'ExpressionL.Caption=Kifejez�s' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      'AggregateRB.Caption=Halmozott �rt�k' + #13#10 +
      'SysVariableRB.Caption=Rendszerv�ltoz�' + #13#10 +
      'CountInvisibleCB.Caption=L�thatatlan s�vokat sz�mol' + #13#10 +
      'TextRB.Caption=Sz�veg' + #13#10 +
      'RunningTotalCB.Caption=Fut� �sszesen' + #13#10 +
      '');
    Add('agAggregate', 'Halmoz�t besz�r');
    Add('vt1', '[D�TUM]');
    Add('vt2', '[ID�]');
    Add('vt3', '[OLDAL#]');
    Add('vt4', '[�SSZES OLDAL#]');
    Add('vt5', '[OLDAL#] [�SSZES OLDALB�L#]');
    Add('vt6', '[SOR#]');

    Add('TfrxOleEditorForm',
      'Caption=OLE objektum' + #13#10 +
      'InsertB.Caption=Besz�r�s...' + #13#10 +
      'EditB.Caption=Szerkeszt�s...' + #13#10 +
      'CloseB.Caption=Bez�r' + #13#10 +
      '');
    Add('olStretched', 'Ny�jtott');

    Add('TfrxBarcodeEditorForm',
      'Caption=Vonalk�dszerkeszt�' + #13#10 +
      'CodeLbl.Caption=K�d' + #13#10 +
      'TypeLbl.Caption=Vonalk�d t�pusa' + #13#10 +
      'ZoomLbl.Caption=Nagy�t�s:' + #13#10 +
      'OptionsLbl.Caption=Opci�k    ' + #13#10 +
      'RotationLbl.Caption=Elforgat�s ' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CalcCheckSumCB.Caption=Ellen�rz� �sszeget sz�mol' + #13#10 +
      'ViewTextCB.Caption=Sz�veg' + #13#10 +
      'Rotation0RB.Caption=0�' + #13#10 +
      'Rotation90RB.Caption=90�' + #13#10 +
      'Rotation180RB.Caption=180�' + #13#10 +
      'Rotation270RB.Caption=270�' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Ellen�rz� �sszeget sz�mol');
    Add('bcShowText', 'Sz�veget mutatja');

    Add('TfrxAliasesEditorForm',
      'Caption=�lnevek szerkeszt�se' + #13#10 +
      'HintL.Caption=Nyomjon entert a szerkeszt�shez' + #13#10 +
      'DSAliasL.Caption=Dataset �ln�v' + #13#10 +
      'FieldAliasesL.Caption=Mez� �lnevek' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      'ResetB.Caption=Alaphelyzet' + #13#10 +
      'UpdateB.Caption=Update' + #13#10 +
      '');
    Add('alUserName', 'Felhaszn�l� neve');
    Add('alOriginal', 'Eredeti n�v');

    Add('TfrxParamsEditorForm',
      'Caption=Param�terszerkeszt�' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      '');
    Add('qpName', 'N�v');
    Add('qpDataType', 'Adatt�pus');
    Add('qpValue', '�rt�k');

    Add('TfrxMDEditorForm',
      'Caption=Master-Detail link' + #13#10 +
      'Label1.Caption=Detail mez�k' + #13#10 +
      'Label2.Caption=Master mez�k' + #13#10 +
      'Label3.Caption=Csatolt mez�k' + #13#10 +
      'AddB.Caption=Hozz�ad' + #13#10 +
      'ClearB.Caption=T�r�l' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=Memo' + #13#10 +
      'ExprB.Hint=Kifejez�s besz�r�sa' + #13#10 +
      'AggregateB.Hint=Halmoz� besz�r�sa' + #13#10 +
      'LocalFormatB.Hint=Form�z�s besz�r�sa' + #13#10 +
      'WordWrapB.Hint=Sz�t�r�s' + #13#10 +
      'CancelB.Hint=M�gsem' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=K�p' + #13#10 +
      'LoadB.Hint=Bet�lt' + #13#10 +
      'CopyB.Hint=M�sol' + #13#10 +
      'PasteB.Hint=Beilleszt' + #13#10 +
      'ClearB.Hint=T�r�l' + #13#10 +
      'CancelB.Hint=M�gsem' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('piEmpty', '�res');

    Add('TfrxChartEditorForm',
      'Caption=Grafikonszerkeszt�' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=Sorozat hozz�ad�sa' + #13#10 +
      'DeleteB.Hint=Sorozat t�rl�se' + #13#10 +
      'DBSourceRB.Caption=Adat az adatb�zisb�l' + #13#10 +
      'BandSourceRB.Caption=Band source' + #13#10 +
      'FixedDataRB.Caption=R�gz�tett adat' + #13#10 +
      'DatasetLbl.Caption=Dataset' + #13#10 +
      'BandLbl.Caption=Data band' + #13#10 +
      'X1Lbl.Caption=X �rt�kek' + #13#10 +
      'Y1Lbl.Caption=Y �rt�kek' + #13#10 +
      'X2Lbl.Caption=X �rt�kek' + #13#10 +
      'Y2Lbl.Caption=Y �rt�kek' + #13#10 +
      'X3Lbl.Caption=X �rt�kek (p�ld�ul a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Y �rt�kek (p�ld�ul 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Egy�b opci�k   ' + #13#10 +
      'ShowTopLbl.Caption=TopN �rt�kek' + #13#10 +
      'CaptionLbl.Caption=TopN c�mek' + #13#10 +
      'SortLbl.Caption=Sorrend' + #13#10 +
      'LineMI.Caption=Vonal' + #13#10 +
      'AreaMI.Caption=Ter�let' + #13#10 +
      'PointMI.Caption=Pont' + #13#10 +
      'BarMI.Caption=Oszlop' + #13#10 +
      'HorizBarMI.Caption=V�zszintes oszlop' + #13#10 +
      'PieMI.Caption=Torta' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Gyorsvonal' + #13#10 +
      '');
    Add('ch3D', '3D n�zet');
    Add('chAxis', 'Tengelyt mutat');
    Add('chsoNone', 'Semilyen');
    Add('chsoAscending', 'N�vekv�');
    Add('chsoDescending', 'Cs�kken�');

    Add('TfrxRichEditorForm',
      'Caption=Rich Text szerkeszt�' + #13#10 +
      'OpenB.Hint=F�jlt megnyit' + #13#10 +
      'SaveB.Hint=F�jlt ment' + #13#10 +
      'UndoB.Hint=Vissza' + #13#10 +
      'TTB.Hint=Bet�' + #13#10 +
      'ExprB.Hint=Kifejez�st besz�r' + #13#10 +
      'CancelB.Hint=M�gsem' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      'BoldB.Hint=F�lk�v�r' + #13#10 +
      'ItalicB.Hint=D�lt' + #13#10 +
      'UnderlineB.Hint=Al�h�zott' + #13#10 +
      'LeftAlignB.Hint=Balra igaz�tott' + #13#10 +
      'CenterAlignB.Hint=K�z�pre igaz�tott' + #13#10 +
      'RightAlignB.Hint=Jobbra igaz�tott' + #13#10 +
      'BlockAlignB.Hint=Sorkiz�rt' + #13#10 +
      'BulletsB.Hint=Felsorol�sjelek' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Keresztt�bla-szerkeszt�' + #13#10 +
      'DatasetL.Caption=Forr�sadatok  ' + #13#10 +
      'DimensionsL.Caption=Dimenzi�k    ' + #13#10 +
      'RowsL.Caption=Sorok' + #13#10 +
      'ColumnsL.Caption=Oszlopok' + #13#10 +
      'CellsL.Caption=Cell�k' + #13#10 +
      'StructureL.Caption=Keresztt�bla strukt�ra' + #13#10 +
      'RowHeaderCB.Caption=Sor fejl�c' + #13#10 +
      'ColumnHeaderCB.Caption=Oszlop fejl�c' + #13#10 +
      'RowTotalCB.Caption=Sor grand total' + #13#10 +
      'ColumnTotalCB.Caption=Oszlop grand total' + #13#10 +
      'SwapB.Hint=Sor/oszlop csere' + #13#10 +
      'StyleCB.Hint=Keresztt�bla st�lusa' + #13#10 +
      'FontB.Hint=Bet� be�ll�t�sok' + #13#10 +
      'AlignLeftB.Hint=Balra igaz�t' + #13#10 +
      'AlignCenterB.Hint=K�z�pre igaz�t' + #13#10 +
      'AlignRightB.Hint=Jobbra igaz�t' + #13#10 +
      'RotationB.Hint=Forgat' + #13#10 +
      'HighlightB.Hint=Kiemel' + #13#10 +
      'FormatB.Hint=Form�z' + #13#10 +
      'FrameB.Hint=Keretbe�ll�t�sok' + #13#10 +
      'FillColorB.Hint=Kit�lt�sz�n' + #13#10 +
      'Func1MI.Caption=Nincs' + #13#10 +
      'Func2MI.Caption=�sszeg' + #13#10 +
      'Func3MI.Caption=Minimum' + #13#10 +
      'Func4MI.Caption=Maximum' + #13#10 +
      'Func5MI.Caption=�tlag' + #13#10 +
      'Func6MI.Caption=Darab' + #13#10 +
      'Sort1MI.Caption=N�vekv� (A-Z)' + #13#10 +
      'Sort2MI.Caption=Cs�kken� (Z-A)' + #13#10 +
      'Sort3MI.Caption=Rendezetlen' + #13#10 +
      'BoldMI.Caption=F�lk�v�r' + #13#10 +
      'ItalicMI.Caption=D�lt' + #13#10 +
      'UnderlineMI.Caption=Al�h�zott' + #13#10 +
      'SuperScriptMI.Caption=Fels� index' + #13#10 +
      'SubScriptMI.Caption=Als� index' + #13#10 +
      'CondensedMI.Caption=S�r�tett' + #13#10 +
      'WideMI.Caption=Sz�les' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=M�gsem' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('crSubtotal', 'R�sz�sszeg');
    Add('crNone', 'Nincs');
    Add('crSum', '�sszeg');
    Add('crMin', 'Minimum');
    Add('crMax', 'Maximum');
    Add('crAvg', '�tlag');
    Add('crCount', 'Darab');
    Add('crAsc', 'A-Z');
    Add('crDesc', 'Z-A');
    Add('crRepHdrs', 'Fejl�cek �jranyomtat�sa');
    Add('crBorder', 'Keret');
    Add('crDown', 'Le azt�n keresztbe');

    Add('TfrxExprEditorForm',
      'Caption=Kifejez�sszerkeszt�' + #13#10 +
      'ExprL.Caption=Kifejez�s:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=K�perny�form�tum' + #13#10 +
      'CategoryL.Caption=Kateg�ria' + #13#10 +
      'FormatL.Caption=Form�tum' + #13#10 +
      'FormatStrL.Caption=Form�tumsztring:' + #13#10 +
      'SeparatorL.Caption=Tizedes elv�laszt�:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      '');
    Add('fkText', 'Sz�veg (form�zatlan)');
    Add('fkNumber', 'Sz�m');
    Add('fkDateTime', 'D�tum/id�');
    Add('fkBoolean', 'Logikai');
    Add('fkNumber1', '1234.5;%g');
    Add('fkNumber2', '1234.50;%2.2f');
    Add('fkNumber3', '1,234.50;%2.2n');
    Add('fkNumber4', '$1,234.50;%2.2m');
    Add('fkDateTime1', '11.28.2002;mm.dd.yyyy');
    Add('fkDateTime2', '28 nov 2002;dd mmm yyyy');
    Add('fkDateTime3', 'November 28, 2002;mmmm dd, yyyy');
    Add('fkDateTime4', '02:14;hh:mm');
    Add('fkDateTime5', '02:14am;hh:mm am/pm');
    Add('fkDateTime6', '02:14:00;hh:mm:ss');
    Add('fkDateTime7', '02:14am, November 28, 2002;hh:mm am/pm, mmmm dd, yyyy');
    Add('fkBoolean1', '0,1;0,1');
    Add('fkBoolean2', 'Nem,Igen;Nem,Igen');
    Add('fkBoolean3', '_,x;_,x');
    Add('fkBoolean4', 'Hamis,Igaz;Hamis,Igaz');

    Add('TfrxHighlightEditorForm',
      'Caption=Kiemel�s' + #13#10 +
      'FontColorB.Caption=Sz�n...' + #13#10 +
      'BackColorB.Caption=Sz�n...' + #13#10 +
      'ConditionL.Caption=Felt�tel   ' + #13#10 +
      'FontL.Caption=Bet�   ' + #13#10 +
      'BackgroundL.Caption=H�tt�r       ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      'BoldCB.Caption=F�lk�v�r' + #13#10 +
      'ItalicCB.Caption=D�lt' + #13#10 +
      'UnderlineCB.Caption=Al�h�zott' + #13#10 +
      'TransparentRB.Caption=�tl�tsz�' + #13#10 +
      'OtherRB.Caption=Egy�b' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Riport be�ll�t�sok' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      'GeneralTS.Caption=�ltal�nos' + #13#10 +
      'ReportSettingsL.Caption=Nyomtat�be�ll�t�sok' + #13#10 +
      'CopiesL.Caption=M�solatok' + #13#10 +
      'GeneralL.Caption=�ltal�nos ' + #13#10 +
      'PasswordL.Caption=Jelsz�' + #13#10 +
      'CollateCB.Caption=Gy�jt�tt m�solatok' + #13#10 +
      'DoublePassCB.Caption=K�tmenetes' + #13#10 +
      'PrintIfEmptyCB.Caption=�reset is nyomtat' + #13#10 +
      'DescriptionTS.Caption=Le�r�s' + #13#10 +
      'NameL.Caption=N�v' + #13#10 +
      'Description1L.Caption=Le�r�s' + #13#10 +
      'PictureL.Caption=K�p' + #13#10 +
      'AuthorL.Caption=Szerz�' + #13#10 +
      'MajorL.Caption=Nagyobb' + #13#10 +
      'MinorL.Caption=Kisebb' + #13#10 +
      'ReleaseL.Caption=Kibocs�t�s' + #13#10 +
      'BuildL.Caption=Ford�t�s' + #13#10 +
      'CreatedL.Caption=L�trehozva' + #13#10 +
      'ModifiedL.Caption=M�dos�tva' + #13#10 +
      'DescriptionL.Caption=Le�r�s        ' + #13#10 +
      'VersionL.Caption=Verzi�    ' + #13#10 +
      'PictureB.Caption=B�ng�sz...' + #13#10 +
      '');
    Add('rePrnOnPort', '-on');

    Add('TfrxStringsEditorForm',
      'Caption=Sorok' + #13#10 +
      'CancelB.Hint=M�gsem' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=M�gsem' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=Jelsz�' + #13#10 +
      'PasswordL.Caption=K�rem a jelsz�t:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=St�lusszerkeszt�' + #13#10 +
      'ColorB.Caption=Sz�n...' + #13#10 +
      'FontB.Caption=Bet�...' + #13#10 +
      'FrameB.Caption=Keret...' + #13#10 +
      'AddB.Hint=Hozz�ad' + #13#10 +
      'DeleteB.Hint=T�r�l' + #13#10 +
      'EditB.Hint=Szerkeszt' + #13#10 +
      'LoadB.Hint=Bet�lt' + #13#10 +
      'SaveB.Hint=Ment' + #13#10 +
      'CancelB.Hint=M�gsem' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=Keretszerkeszt�' + #13#10 +
      'FrameL.Caption=Keret' + #13#10 +
      'LineL.Caption=Keretvonal' + #13#10 +
      'ShadowL.Caption=�rny�k' + #13#10 +
      'FrameTopB.Hint=Fels� vonal' + #13#10 +
      'FrameBottomB.Hint=Als� vonal' + #13#10 +
      'FrameLeftB.Hint=Bal vonal' + #13#10 +
      'FrameRightB.Hint=Jobb vonal' + #13#10 +
      'FrameAllB.Hint=Az �sszes keretvonal' + #13#10 +
      'FrameNoB.Hint=Nincs keret' + #13#10 +
      'FrameColorB.Hint=Keretsz�n' + #13#10 +
      'FrameStyleB.Hint=Keretst�lus' + #13#10 +
      'FrameWidthCB.Hint=Keretvastags�g' + #13#10 +
      'ShadowB.Hint=�rny�k' + #13#10 +
      'ShadowColorB.Hint=�rny�ksz�n' + #13#10 +
      'ShadowWidthCB.Hint=�rny�k sz�less�ge' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=�j elem' + #13#10 +
      'ItemsTab.Caption=Elemek' + #13#10 +
      'TemplatesTab.Caption=Mint�k' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Tab sorrend' + #13#10 +
      'Label1.Caption=Tab sorrendben felsorolt kontrolok:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      'UpB.Caption=Fel' + #13#10 +
      'DownB.Caption=Le' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Ki�rt�kel' + #13#10 +
      'Label1.Caption=Kifejez�s' + #13#10 +
      'Label2.Caption=Eredm�ny' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Jelent�svar�zsl�' + #13#10 +
      'DataTab.Caption=Adat' + #13#10 +
      'GroupsTab.Caption=Csoportok' + #13#10 +
      'LayoutTab.Caption=Elrendez�s' + #13#10 +
      'StyleTab.Caption=St�lus' + #13#10 +
      'Step1L.Caption=Step 1. Megjelen�tend� Dataset �s mez�k kiv�laszt�sa.' + #13#10 +
      'Step2L.Caption=Step 2. Csoportok l�trehoz�sa (opcion�lis).' + #13#10 +
      'Step3L.Caption=Step 3. Laporient�ci� �s adatelrendez�s kiv�laszt�sa.' + #13#10 +
      'Step4L.Caption=Step 4. Riportst�lus v�laszt�sa.' + #13#10 +
      'AddFieldB.Caption=Hozz�ad >' + #13#10 +
      'AddAllFieldsB.Caption=Mindet hozz�adja >>' + #13#10 +
      'RemoveFieldB.Caption=< Elt�vol�t' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Mindet elt�vol�tja' + #13#10 +
      'AddGroupB.Caption=Hozz�ad >' + #13#10 +
      'RemoveGroupB.Caption=< Elt�vol�t' + #13#10 +
      'SelectedFieldsL.Caption=Kiv�lasztott mez�k:' + #13#10 +
      'AvailableFieldsL.Caption=El�rhet� mez�k:' + #13#10 +
      'GroupsL.Caption=Csoportok:' + #13#10 +
      'OrientationL.Caption=Ir�ny         ' + #13#10 +
      'LayoutL.Caption=Elrendez�s' + #13#10 +
      'PortraitRB.Caption=Portr�' + #13#10 +
      'LandscapeRB.Caption=T�jk�p' + #13#10 +
      'TabularRB.Caption=T�bl�zatos' + #13#10 +
      'ColumnarRB.Caption=Oszlopos' + #13#10 +
      'FitWidthCB.Caption=Mez�k illeszkedjenek az oldalm�rethez' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      'BackB.Caption=<< Vissza' + #13#10 +
      'NextB.Caption=K�vetkez� >>' + #13#10 +
      'FinishB.Caption=Befejez' + #13#10 +
      '');
    Add('wzStd', 'Standard Riport Var�zsl�');
    Add('wzDMP', 'M�trix Riport Var�zsl�');
    Add('wzStdEmpty', 'Standard Riport');
    Add('wzDMPEmpty', 'M�trix Riport');


    Add('ftAllFiles', 'Minden f�jl');
    Add('ftPictures', 'K�pek');
    Add('ftDB', 'Adatb�zisok');
    Add('ftRichFile', 'RichText f�jlok');
    Add('ftTextFile', 'Sz�vegf�jlok');

    Add('prNotAssigned', '(Nincs hozz�rendelve)');
    Add('prInvProp', '�rv�nytelen �rt�k');
    Add('prDupl', 'Duplik�lt n�v');
    Add('prPict', '(K�p)');

    Add('mvExpr', 'Kifejez�seket enged');
    Add('mvStretch', 'Ny�jt');
    Add('mvStretchToMax', 'Teljes magass�gra ny�jt');
    Add('mvShift', 'Eltol');
    Add('mvShiftOver', '�tlapoltat eltolja');
    Add('mvVisible', 'L�that�');
    Add('mvPrintable', 'Nyomtathat�');
    Add('mvFont', 'Bet�...');
    Add('mvFormat', 'K�perny�form�tum...');
    Add('mvClear', 'Tartalmat t�r�l');
    Add('mvAutoWidth', 'Automatikus sz�less�g');
    Add('mvWWrap', 'Sz�t�r�s');
    Add('mvSuppress', 'Ism�tl�d� �rt�kek elnyom�sa');
    Add('mvHideZ', 'Null�k rejt�se');
    Add('mvHTML', 'HTML Tag-ek enged�lyez�se');
    Add('lvDiagonal', '�tl�s');
    Add('pvAutoSize', 'Automatikus m�ret');
    Add('pvCenter', 'K�z�p');
    Add('pvAspect', 'Ar�nyosan');
    Add('bvSplit', 'Oszthat�');
    Add('bvKeepChild', 'Gyerekeket egy�ttartja');
    Add('bvPrintChild', 'Gyerek nyomtat�sa ha l�thatatlan');
    Add('bvStartPage', '�j oldalra');
    Add('bvPrintIfEmpty', 'Nyomtat, ha a r�szletez� �res');
    Add('bvKeepDetail', 'R�szleteket egy�ttartja');
    Add('bvKeepFooter', 'L�bl�ceket egy�ttartja');
    Add('bvReprint', '�j lapon �jranyomtatja');
    Add('bvOnFirst', 'Els� oldalon nyomtatja');
    Add('bvOnLast', 'Utols� oldalon nyomtatja');
    Add('bvKeepGroup', 'Egy�ttartja');
    Add('bvFooterAfterEach', 'Minden sor ut�n l�bl�c');
    Add('srParent', 'Sz�l�n nyomtatja');
    Add('bvKeepHeader', 'Keep Header Together');

    Add('obCatDraw', 'Rajz');
    Add('obCatOther', 'Egy�b objektumok');
    Add('obCatOtherControls', 'Egy�b kontrolok');
    Add('obDiagLine', '�tl�s vonal');
    Add('obRect', 'T�glalalp');
    Add('obRoundRect', 'Lekerek�tett t�glalap');
    Add('obEllipse', 'Ellipszis');
    Add('obTrian', 'H�romsz�g');
    Add('obDiamond', 'Gy�m�nt');
    Add('obLabel', 'Cimke kontrol');
    Add('obEdit', 'Szerkeszt�doboz kontrol');
    Add('obMemoC', 'Memo kontrol');
    Add('obButton', 'Gomb kontrol');
    Add('obChBoxC', 'Pipa kontrol');
    Add('obRButton', 'R�di�gomb kontrol');
    Add('obLBox', 'Lista kontrol');
    Add('obCBox', 'Combo kontrol');
    Add('obDateEdit', 'D�tumszerkeszt� kontrol');
    Add('obImageC', 'K�p kontrol');
    Add('obPanel', 'Panel kontrol');
    Add('obGrBox', 'CsoportDoboz kontrol');
    Add('obBBtn', 'K�pes gomb kontrol');
    Add('obSBtn', 'Gyorsgomb kontrol');
    Add('obMEdit', 'Maszkolt sz�vegszerkeszt� kontrol');
    Add('obChLB', 'PipaLista kontrol');
    Add('obDBLookup', 'DBLookupComboBox kontrol');
    Add('obBevel', 'Keret objektum');
    Add('obShape', 'Alakzat objektum');
    Add('obText', 'Sz�veg objektum');
    Add('obSysText', 'Rendszer sz�veg');
    Add('obLine', 'Vonal objektum');
    Add('obPicture', 'K�p objektum');
    Add('obBand', 'S�v objektum');
    Add('obDataBand', 'Adats�v');
    Add('obSubRep', 'Alriport objektum');
    Add('obDlgPage', 'P�rbesz�d');
    Add('obRepPage', 'Riport lap');
    Add('obReport', 'Riport objektum');
    Add('obRich', 'RichText objektum');
    Add('obOLE', 'OLE objektum');
    Add('obChBox', 'Pipadoboz objektum');
    Add('obChart', 'Grafikon objektum');
    Add('obBarC', 'Vonalk�d objektum');
    Add('obCross', 'Keresztt�bla objektum');
    Add('obDBCross', 'DB keresztt�bla objektum');
    Add('obGrad', '�tmenet objektum');
    Add('obDMPText', 'M�trix sz�veg objektum');
    Add('obDMPLine', 'M�trix vonal objektum');
    Add('obBDEDB', 'BDE adatb�zis');
    Add('obBDETb', 'BDE t�bla');
    Add('obBDEQ', 'BDE Query');
    Add('obBDEComps', 'BDE komponensek');
    Add('obIBXDB', 'IBX adatb�zis');
    Add('obIBXTb', 'IBX t�bla');
    Add('obIBXQ', 'IBX Query');
    Add('obIBXComps', 'IBX komponensek');
    Add('obADODB', 'ADO adatb�zis');
    Add('obADOTb', 'ADO t�bla');
    Add('obADOQ', 'ADO Query');
    Add('obADOComps', 'ADO komponensek');
    Add('obDBXDB', 'DBX adatb�zis');
    Add('obDBXTb', 'DBX t�bla');
    Add('obDBXQ', 'DBX Query');
    Add('obDBXComps', 'DBX komponensek');

    Add('ctString', 'Sztring');
    Add('ctDate', 'D�tum �s id�');
    Add('ctConv', '�talak�t�sok');
    Add('ctFormat', 'Form�z�s');
    Add('ctMath', 'Matematikai');
    Add('ctOther', 'Egy�b');

    Add('IntToStr', '�talak�t egy eg�sz �rt�ket sz�vegg�');
    Add('FloatToStr', '�talak�t egy lebeg�pontos �rt�ket sz�vegg�');
    Add('DateToStr', '�talak�t egy d�tumot sz�vegg�');
    Add('TimeToStr', '�talak�t egy id�t sz�vegg�');
    Add('DateTimeToStr', '�talak�t egy d�tum-�s-id� �rt�ket sz�vegg�');
    Add('VarToStr', '�talak�t egy variant �rt�ket sz�vegg�');
    Add('StrToInt', '�talak�t egy sz�veget eg�ssz�');
    Add('StrToFloat', '�talak�t egy sz�veget lebeg�pontoss�');
    Add('StrToDate', '�talak�t egy sz�veget d�tumm�');
    Add('StrToTime', '�talak�t egy sz�veget id�v�');
    Add('StrToDateTime', '�talak�t egy sz�veget d�tum-�s-id�-v�');
    Add('Format', 'Visszaad egy t�mbb�l �sszerakott form�zott sz�veget');
    Add('FormatFloat', 'Form�z egy lebeg�pontos �rt�ket');
    Add('FormatDateTime', 'Form�z egy d�tum-�s-id� �rt�ket');
    Add('FormatMaskText', 'Maszkkal form�zott sz�veget ad vissza');
    Add('EncodeDate', 'Visszaad egy TDateTime t�pust adott �v, H�, �s Nap-b�l');
    Add('DecodeDate', 'Felbont egy TDateTime-ot �v, H�, �s Nap �rt�kekk�');
    Add('EncodeTime', 'Visszaad egy TDateTime-ot �ra, Perc, M�sodperc, �s ezredm�sodpercb�l');
    Add('DecodeTime', 'Felbont egy TDateTime-ot �ra, Perc, M�sodperc, �s ezredm�sodpercc�');
    Add('Date', 'Visszaadja a jelenlegi d�tumot');
    Add('Time', 'Visszaadja a jelenlegi id�t');
    Add('Now', 'Visszaadja a jelenlegi d�tumot �s id�t');
    Add('DayOfWeek', 'D�tumb�l a h�t napj�t adja vissza');
    Add('IsLeapYear', 'Jelzi, ha az �v sz�k��v');
    Add('DaysInMonth', 'Adott h�nap napjainak sz�m�t adja vissza');
    Add('Length', 'Sz�veg hossz�t adja vissza');
    Add('Copy', 'R�ssz�veget ad vissza');
    Add('Pos', 'R�ssz�veg sz�vegen bel�li pozici�j�t adja vissza');
    Add('Delete', 'R�ssz�veget elt�vol�t');
    Add('Insert', 'R�ssz�veget hozz�ad');
    Add('Uppercase', 'Nagybet�sre alak�t');
    Add('Lowercase', 'Kisbet�sre alak�t');
    Add('Trim', 'Bevezet� �s lez�r� sz�k�z�ket elt�vol�tja');
    Add('NameCase', 'Nagykezd�bet�sre alak�t');
    Add('CompareText', 'K�t sz�veget hasonl�t');
    Add('Chr', 'Eg�szet karakterr� alak�t');
    Add('Ord', 'Karaktert eg�ssz� alak�t');
    Add('SetLength', 'Sz�veg hossz�t �ll�tja be');
    Add('Round', 'T�rtet a legk�zelebbi eg�szre alak�tja');
    Add('Trunc', 'T�rt eg�sz r�sz�t adja vissza');
    Add('Int', 'T�rt eg�sz r�sz�t adja vissza');
    Add('Frac', 'T�rt t�rtr�sz�t adja vissza');
    Add('Sqrt', 'N�gyzetgy�k�t von');
    Add('Abs', 'Abszol�t �rt�ket ad vissza');
    Add('Sin', 'Sz�nusz (radi�nban)');
    Add('Cos', 'Kosz�nusz (radi�nban)');
    Add('ArcTan', 'Arkusz tangens');
    Add('Tan', 'Tangens');
    Add('Exp', 'Kitev�');
    Add('Ln', 'e alap� logaritmus');
    Add('Pi', 'PI');
    Add('Inc', '�rt�ket n�veli');
    Add('Dec', '�rt�ket cs�kkenti');
    Add('RaiseException', 'Kiv�telt gener�l');
    Add('ShowMessage', '�zenetdoboz');
    Add('Randomize', 'V�letlensz�mgener�tort ind�tja');
    Add('Random', 'V�letlensz�m');
    Add('ValidInt', 'Igaz, ha �rv�nyes eg�sz a sz�veg');
    Add('ValidFloat', 'Igaz, �rv�nyes lebeg�pontos sz�m a sz�veg');
    Add('ValidDate', 'Igaz, ha �rv�nyes d�tum a sz�veg');
    Add('IIF', 'TrueValue, ha a kifejez�s igaz, egy�bk�nt FalseValue');
    Add('Get', 'Bels� haszn�latra');
    Add('Set', 'Bels� haszn�latra');
    Add('InputBox', 'Sz�vegbeviteli doboz');
    Add('InputQuery', 'Sz�vegbeviteli doboz');
    Add('MessageDlg', '�zenetdoboz');
    Add('CreateOleObject', 'OLE objektum l�trehoz�sa');
    Add('VarArrayCreate', 'Variant t�mb l�trehoz�sa');
    Add('VarType', 'Variant t�pus�t adja vissza');
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
