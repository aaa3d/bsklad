
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
    Add('oiProp', 'Tulajdonságok');
    Add('oiEvent', 'Események');

    Add('TfrxDataTreeForm',
      'Caption=Adatfa' + #13#10 +
      'DataTS.Caption=Adat' + #13#10 +
      'VariablesTS.Caption=Változók' + #13#10 +
      'FunctionsTS.Caption=Függvények' + #13#10 +
      'InsFieldCB.Caption=Mezõ létrehozása' + #13#10 +
      'InsCaptionCB.Caption=Cím létrehozása' + #13#10 +
      '');
    Add('dtNoData', 'Nincs adat');
    Add('dtData', 'Adat');
    Add('dtSysVar', 'Rendszerváltozók');
    Add('dtVar', 'Változók');
    Add('dtFunc', 'Függvények');

    Add('TfrxReportTreeForm',
      'Caption=Jelentés fa' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Scriptfájl megnyitása' + #13#10 +
      'SaveScriptB.Hint=Scriptfájl mentése' + #13#10 +
      'RunScriptB.Hint=Script futtatása' + #13#10 +
      'StepScriptB.Hint=Nyomkövetés' + #13#10 +
      'StopScriptB.Hint=Script bezárása' + #13#10 +
      'EvaluateB.Hint=Kiértékel' + #13#10 +
      'LangL.Caption=Nyelv:' + #13#10 +
      'AlignTB.Caption=Igazítás' + #13#10 +
      'AlignLeftsB.Hint=Igazítás balra' + #13#10 +
      'AlignHorzCentersB.Hint=Igazítás középre' + #13#10 +
      'AlignRightsB.Hint=Igazítás jobbra' + #13#10 +
      'AlignTopsB.Hint=Igazítás fentre' + #13#10 +
      'AlignVertCentersB.Hint=Igazítás középre' + #13#10 +
      'AlignBottomsB.Hint=Igazítás lentre' + #13#10 +
      'SpaceHorzB.Hint=Tér vizszintesen' + #13#10 +
      'SpaceVertB.Hint=Tér függõlegesen' + #13#10 +
      'CenterHorzB.Hint=Vízszintesen sávközépre' + #13#10 +
      'CenterVertB.Hint=Függõlegesen sávközépre' + #13#10 +
      'SameWidthB.Hint=Azonos szélesség' + #13#10 +
      'SameHeightB.Hint=Azonos magasság' + #13#10 +
      'TextTB.Caption=Szöveg' + #13#10 +
      'StyleCB.Hint=Stílus' + #13#10 +
      'FontNameCB.Hint=Betû neve' + #13#10 +
      'FontSizeCB.Hint=Betû mérete' + #13#10 +
      'BoldB.Hint=Félkövér' + #13#10 +
      'ItalicB.Hint=Dõlt' + #13#10 +
      'UnderlineB.Hint=Aláhúzott' + #13#10 +
      'FontColorB.Hint=Betû színe' + #13#10 +
      'HighlightB.Hint=Kiemelés' + #13#10 +
      'RotateB.Hint=Szöveg forgatása' + #13#10 +
      'TextAlignLeftB.Hint=Balra igazít' + #13#10 +
      'TextAlignCenterB.Hint=Középre igazít' + #13#10 +
      'TextAlignRightB.Hint=Jobbra igazít' + #13#10 +
      'TextAlignBlockB.Hint=Sorkizár' + #13#10 +
      'TextAlignTopB.Hint=Felülre igazít' + #13#10 +
      'TextAlignMiddleB.Hint=Középre igazít' + #13#10 +
      'TextAlignBottomB.Hint=Alulra igazít' + #13#10 +
      'FrameTB.Caption=Keret' + #13#10 +
      'FrameTopB.Hint=Felsõ vonal' + #13#10 +
      'FrameBottomB.Hint=Alsó vonal' + #13#10 +
      'FrameLeftB.Hint=Bal vonal' + #13#10 +
      'FrameRightB.Hint=Jobb vonal' + #13#10 +
      'FrameAllB.Hint=Minden keretvonal' + #13#10 +
      'FrameNoB.Hint=Nincs keret' + #13#10 +
      'ShadowB.Hint=Árnyék' + #13#10 +
      'FillColorB.Hint=Háttérszín' + #13#10 +
      'FrameColorB.Hint=Keretszín' + #13#10 +
      'FrameStyleB.Hint=Keret stílusa' + #13#10 +
      'FrameWidthCB.Hint=Keret vastagsága' + #13#10 +
      'StandardTB.Caption=Normál' + #13#10 +
      'NewB.Hint=Új riport' + #13#10 +
      'OpenB.Hint=Riport megnyitása' + #13#10 +
      'SaveB.Hint=Riport mentése' + #13#10 +
      'PreviewB.Hint=Elõkép' + #13#10 +
      'NewPageB.Hint=Új riportlap' + #13#10 +
      'NewDialogB.Hint=Új párbeszédlap' + #13#10 +
      'DeletePageB.Hint=Lap törlése' + #13#10 +
      'PageSettingsB.Hint=Oldalbeállítás' + #13#10 +
      'VariablesB.Hint=Változók' + #13#10 +
      'CutB.Hint=Kivág' + #13#10 +
      'CopyB.Hint=Másol' + #13#10 +
      'PasteB.Hint=Beilleszt' + #13#10 +
      'SampleFormatB.Hint=Formázás másolása' + #13#10 +
      'UndoB.Hint=Vissza' + #13#10 +
      'RedoB.Hint=Mégis' + #13#10 +
      'ShowGridB.Hint=Rácsot mutat' + #13#10 +
      'AlignToGridB.Hint=Rácsra illeszt' + #13#10 +
      'SetToGridB.Hint=Rácshoz igazít' + #13#10 +
      'ScaleCB.Hint=Nagyít' + #13#10 +
      'ExtraToolsTB.Caption=Extra eszközök' + #13#10 +
      'ObjectSelectB.Hint=Kiválasztás eszközei' + #13#10 +
      'HandToolB.Hint=Kéz eszköz' + #13#10 +
      'ZoomToolB.Hint=Nagyító' + #13#10 +
      'TextToolB.Hint=Szövegszerkesztõ' + #13#10 +
      'FormatToolB.Hint=Formátummásoló' + #13#10 +
      'ObjectBandB.Hint=Sáv beszúrása' + #13#10 +
      'FileMenu.Caption=&Fájl' + #13#10 +
      'EditMenu.Caption=&Szerkeszt' + #13#10 +
      'FindMI.Caption=Keres...' + #13#10 +
      'FindNextMI.Caption=Következõ' + #13#10 +
      'ReplaceMI.Caption=Cserél...' + #13#10 +
      'ReportMenu.Caption=&Riport' + #13#10 +
      'ReportDataMI.Caption=Adat...' + #13#10 +
      'ReportSettingsMI.Caption=Opciók...' + #13#10 +
      'ReportStylesMI.Caption=Stílusok...' + #13#10 +
      'ViewMenu.Caption=&Nézet' + #13#10 +
      'ToolbarsMI.Caption=Eszköztárak' + #13#10 +
      'StandardMI.Caption=Normál' + #13#10 +
      'TextMI.Caption=Szöveg' + #13#10 +
      'FrameMI.Caption=Keret' + #13#10 +
      'AlignmentMI.Caption=Igazítás paletta' + #13#10 +
      'ToolsMI.Caption=Extra eszközök' + #13#10 +
      'InspectorMI.Caption=Object Inspector' + #13#10 +
      'DataTreeMI.Caption=Adatfa' + #13#10 +
      'ReportTreeMI.Caption=Riportfa' + #13#10 +
      'ShowRulersMI.Caption=Vonalzók' + #13#10 +
      'ShowGuidesMI.Caption=Vezetõk' + #13#10 +
      'DeleteGuidesMI.Caption=Vezetõk törlése' + #13#10 +
      'OptionsMI.Caption=Opciók...' + #13#10 +
      'HelpMenu.Caption=&Súgó' + #13#10 +
      'HelpContentsMI.Caption=Tartalomjegyzék...' + #13#10 +
      'AboutMI.Caption=Névjegy...' + #13#10 +
      'TabOrderMI.Caption=Tab sorrend...' + #13#10 +
      'UndoCmd.Caption=Vissza' + #13#10 +
      'RedoCmd.Caption=Mégis' + #13#10 +
      'CutCmd.Caption=Kivág' + #13#10 +
      'CopyCmd.Caption=Másol' + #13#10 +
      'PasteCmd.Caption=Beilleszt' + #13#10 +
      'DeleteCmd.Caption=Töröl' + #13#10 +
      'DeletePageCmd.Caption=Oldalt töröl' + #13#10 +
      'SelectAllCmd.Caption=Mindent kijelöl' + #13#10 +
      'EditCmd.Caption=Szerkeszt...' + #13#10 +
      'BringToFrontCmd.Caption=Elõrehoz' + #13#10 +
      'SendToBackCmd.Caption=Hátraküld' + #13#10 +
      'NewItemCmd.Caption=Új...' + #13#10 +
      'NewReportCmd.Caption=Új riport' + #13#10 +
      'NewPageCmd.Caption=Új lap' + #13#10 +
      'NewDialogCmd.Caption=Új párbeszéd' + #13#10 +
      'OpenCmd.Caption=Megnyit...' + #13#10 +
      'SaveCmd.Caption=Ment' + #13#10 +
      'SaveAsCmd.Caption=Másként ment...' + #13#10 +
      'VariablesCmd.Caption=Változók...' + #13#10 +
      'PageSettingsCmd.Caption=Oldalbeállítás...' + #13#10 +
      'PreviewCmd.Caption=Elõkép' + #13#10 +
      'ExitCmd.Caption=Kilép' + #13#10 +
      'ReportTitleMI.Caption=Riport címe' + #13#10 +
      'ReportSummaryMI.Caption=Riport összesítõ' + #13#10 +
      'PageHeaderMI.Caption=Oldal fejléc' + #13#10 +
      'PageFooterMI.Caption=Oldal lábléc' + #13#10 +
      'HeaderMI.Caption=Fejléc' + #13#10 +
      'FooterMI.Caption=Lábléc' + #13#10 +
      'MasterDataMI.Caption=Master adat' + #13#10 +
      'DetailDataMI.Caption=Detail adat' + #13#10 +
      'SubdetailDataMI.Caption=Subdetail adat' + #13#10 +
      'Data4levelMI.Caption=4, adatszint' + #13#10 +
      'Data5levelMI.Caption=5. adatszint' + #13#10 +
      'Data6levelMI.Caption=6. adatszint' + #13#10 +
      'GroupHeaderMI.Caption=Csoport fejléc' + #13#10 +
      'GroupFooterMI.Caption=Csoport lábléc' + #13#10 +
      'ChildMI.Caption=Gyerek' + #13#10 +
      'ColumnHeaderMI.Caption=Oszlop fejléc' + #13#10 +
      'ColumnFooterMI.Caption=Oszlop lábléc' + #13#10 +
      'OverlayMI.Caption=Úsztatás' + #13#10 +
      'VerticalbandsMI.Caption=Függõleges sávok' + #13#10 +
      'HeaderMI1.Caption=Fejléc' + #13#10 +
      'FooterMI1.Caption=Lábléc' + #13#10 +
      'MasterDataMI1.Caption=Master adat' + #13#10 +
      'DetailDataMI1.Caption=Detail adat' + #13#10 +
      'SubdetailDataMI1.Caption=Subdetail adat' + #13#10 +
      'GroupHeaderMI1.Caption=Csoport fejléc' + #13#10 +
      'GroupFooterMI1.Caption=Csoport lábléc' + #13#10 +
      'ChildMI1.Caption=Gyerek' + #13#10 +
      'R0MI.Caption=0°' + #13#10 +
      'R45MI.Caption=45°' + #13#10 +
      'R90MI.Caption=90°' + #13#10 +
      'R180MI.Caption=180°' + #13#10 +
      'R270MI.Caption=270°' + #13#10 +
      'FontB.Hint=Betûbeállítások' + #13#10 +
      'BoldMI.Caption=Félkövér' + #13#10 +
      'ItalicMI.Caption=Dõlt' + #13#10 +
      'UnderlineMI.Caption=Aláhúzott' + #13#10 +
      'SuperScriptMI.Caption=Felsõ index' + #13#10 +
      'SubScriptMI.Caption=Alsó index' + #13#10 +
      'CondensedMI.Caption=Sûrített' + #13#10 +
      'WideMI.Caption=Széles' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'OpenDialog.Filter=Riport (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=Pascal fájlok (*.pas)|*.pas|C++ fájlok (*.cpp)|*.cpp|JavaScript fájlok (*.js)|*.js|Basic fájlok (*.vb)|*.vb|Minden fájl|*.*' + #13#10 +
      'SaveScriptDialog.Filter=Pascal fájlok (*.pas)|*.pas|C++ fájlok (*.cpp)|*.cpp|JavaScript fájlok (*.js)|*.js|Basic fájlok (*.vb)|*.vb|Minden fájl|*.*' + #13#10 +
      'GroupB.Hint=Group' + #13#10 +
      'UngroupB.Hint=Ungroup' + #13#10 +
      'GroupCmd.Caption=Group' + #13#10 +
      'UngroupCmd.Caption=Ungroup' + #13#10 +
      '');
    Add('dsCm', 'Centiméter');
    Add('dsInch', 'Hüvelyk');
    Add('dsPix', 'Pixel');
    Add('dsChars', 'Karakter');
    Add('dsCode', 'Kód');
    Add('dsPage', 'Lap');
    Add('dsRepFilter', 'Riport (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'Tömörített riport (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', 'Mentsem a változásokat az elõképbe?');
    Add('dsSaveChangesTo', 'Változások mentése ');
    Add('dsCantLoad', 'Nem lehet a fájlt betölteni');
    Add('dsStyleFile', 'Stílus');
    Add('dsCantFindProc', 'Nem található a fõ eljárás');
    Add('dsClearScript', 'Minden kód törlõdik. Folytassam?');
    Add('dsNoStyle', 'Nincs stílus');
    Add('dsStyleSample', 'Stílusminta');
    Add('dsTextNotFound', 'A ''%s'' szöveg nem található');
    Add('dsReplace', 'Cseréljem a ''%s'' szöveget?');

    Add('TfrxAboutForm',
      'Caption=About FastReport' + #13#10 +
      'Label4.Caption=További információért keresse fel honlapunkat:' + #13#10 +
      'Label6.Caption=Értékesítés:' + #13#10 +
      'Label8.Caption=Támogatás:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Oldal opciók' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      'TabSheet1.Caption=Papír' + #13#10 +
      'Label1.Caption=Szélesség' + #13#10 +
      'Label2.Caption=Magasság' + #13#10 +
      'Label11.Caption=Méret  ' + #13#10 +
      'Label12.Caption=Irány         ' + #13#10 +
      'Label3.Caption=Bal' + #13#10 +
      'Label4.Caption=Felsõ' + #13#10 +
      'Label5.Caption=Jobb' + #13#10 +
      'Label6.Caption=Alsó' + #13#10 +
      'Label13.Caption=Margók    ' + #13#10 +
      'Label14.Caption=Papírforrás    ' + #13#10 +
      'Label9.Caption=Elsõ oldal' + #13#10 +
      'Label10.Caption=Többi oldal' + #13#10 +
      'PortraitRB.Caption=Portré' + #13#10 +
      'LandscapeRB.Caption=Tájkép' + #13#10 +
      'TabSheet3.Caption=Egyéb opciók' + #13#10 +
      'Label7.Caption=Oszlopok  ' + #13#10 +
      'Label8.Caption=Szám' + #13#10 +
      'Label15.Caption=Szélesség' + #13#10 +
      'Label16.Caption=Pozició' + #13#10 +
      'Label17.Caption=Egyéb   ' + #13#10 +
      'Label18.Caption=Kétoldalas' + #13#10 +
      'PrintOnPrevCB.Caption=Elõzõ oldalra nyomtat' + #13#10 +
      'MirrorMarginsCB.Caption=Margók tükrözése' + #13#10 +
      'LargeHeightCB.Caption=Nagy magasság tervezõmódban' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Riport DataSet-ek kiválasztása' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Változók szerkesztése' + #13#10 +
      'NewCategoryB.Caption=Kategória' + #13#10 +
      'NewVarB.Caption=Változó' + #13#10 +
      'EditB.Caption=Szerkeszt' + #13#10 +
      'DeleteB.Caption=Töröl' + #13#10 +
      'EditListB.Caption=Listáz' + #13#10 +
      'LoadB.Caption=Betölt' + #13#10 +
      'SaveB.Caption=Ment' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'ExprPanel.Caption= Kifejezés:' + #13#10 +
      'OpenDialog1.Filter=Szótár (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Szótár (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(nincs definiált változó)');
    Add('vaVar', 'Változók');
    Add('vaDupName', 'Duplikált név');

    Add('TfrxOptionsEditor',
      'Caption=Tervezõ opciók' + #13#10 +
      'Label1.Caption=Rács   ' + #13#10 +
      'Label2.Caption=Típus' + #13#10 +
      'Label3.Caption=Méret' + #13#10 +
      'Label4.Caption=Párbeszéd:' + #13#10 +
      'Label5.Caption=Egyéb   ' + #13#10 +
      'Label6.Caption=Betûk   ' + #13#10 +
      'Label7.Caption=Kód ablak' + #13#10 +
      'Label8.Caption=Memo szerkesztõ' + #13#10 +
      'Label9.Caption=Méret' + #13#10 +
      'Label10.Caption=Méret' + #13#10 +
      'Label11.Caption=Színek   ' + #13#10 +
      'Label12.Caption=Hézag a sávok között:' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=in' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      'CMRB.Caption=Centiméter:' + #13#10 +
      'InchesRB.Caption=Hüvelyk:' + #13#10 +
      'PixelsRB.Caption=Pixel:' + #13#10 +
      'ShowGridCB.Caption=Rácsot mutat' + #13#10 +
      'AlignGridCB.Caption=Rácshoz igazít' + #13#10 +
      'EditAfterInsCB.Caption=Beszúrás után szerkeszt' + #13#10 +
      'ObjectFontCB.Caption=Objektum betûbeállítását használja' + #13#10 +
      'WorkspaceB.Caption=Munkahely' + #13#10 +
      'ToolB.Caption=Eszközablakok' + #13#10 +
      'LCDCB.Caption=LCD rács színe' + #13#10 +
      'FreeBandsCB.Caption=Szabad sávok elhelyezése' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Alapértelmezések visszaállítása' + #13#10 +
      'BandsCaptionsCB.Caption=Sávcímeket mutat' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=DataSet kiválasztása' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégse' + #13#10 +
      '');
    Add('dbNotAssigned', '[nincs hozzárendelve]');
    Add('dbSingleLine', 'Egy sor');

    Add('TfrxGroupEditorForm',
      'Caption=Group' + #13#10 +
      'BreakOnL.Caption=Töréspont   ' + #13#10 +
      'OptionsL.Caption=Opciók    ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      'DataFieldRB.Caption=Adatmezõ' + #13#10 +
      'ExpressionRB.Caption=Kifejezés' + #13#10 +
      'KeepGroupTogetherCB.Caption=Csoportokat együttart' + #13#10 +
      'StartNewPageCB.Caption=Új oldalt kezd' + #13#10 +
      'OutlineCB.Caption=Körvonalasan mutat' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=Rendszer memo' + #13#10 +
      'DataBandL.Caption=Adatsáv' + #13#10 +
      'DataSetL.Caption=DataSet' + #13#10 +
      'DataFieldL.Caption=Adatmezõ' + #13#10 +
      'FunctionL.Caption=Függvény' + #13#10 +
      'ExpressionL.Caption=Kifejezés' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      'AggregateRB.Caption=Halmozott érték' + #13#10 +
      'SysVariableRB.Caption=Rendszerváltozó' + #13#10 +
      'CountInvisibleCB.Caption=Láthatatlan sávokat számol' + #13#10 +
      'TextRB.Caption=Szöveg' + #13#10 +
      'RunningTotalCB.Caption=Futó összesen' + #13#10 +
      '');
    Add('agAggregate', 'Halmozót beszúr');
    Add('vt1', '[DÁTUM]');
    Add('vt2', '[IDÕ]');
    Add('vt3', '[OLDAL#]');
    Add('vt4', '[ÖSSZES OLDAL#]');
    Add('vt5', '[OLDAL#] [ÖSSZES OLDALBÓL#]');
    Add('vt6', '[SOR#]');

    Add('TfrxOleEditorForm',
      'Caption=OLE objektum' + #13#10 +
      'InsertB.Caption=Beszúrás...' + #13#10 +
      'EditB.Caption=Szerkesztés...' + #13#10 +
      'CloseB.Caption=Bezár' + #13#10 +
      '');
    Add('olStretched', 'Nyújtott');

    Add('TfrxBarcodeEditorForm',
      'Caption=Vonalkódszerkesztõ' + #13#10 +
      'CodeLbl.Caption=Kód' + #13#10 +
      'TypeLbl.Caption=Vonalkód típusa' + #13#10 +
      'ZoomLbl.Caption=Nagyítás:' + #13#10 +
      'OptionsLbl.Caption=Opciók    ' + #13#10 +
      'RotationLbl.Caption=Elforgatás ' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CalcCheckSumCB.Caption=Ellenörzõ összeget számol' + #13#10 +
      'ViewTextCB.Caption=Szöveg' + #13#10 +
      'Rotation0RB.Caption=0°' + #13#10 +
      'Rotation90RB.Caption=90°' + #13#10 +
      'Rotation180RB.Caption=180°' + #13#10 +
      'Rotation270RB.Caption=270°' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Ellenörzõ összeget számol');
    Add('bcShowText', 'Szöveget mutatja');

    Add('TfrxAliasesEditorForm',
      'Caption=Álnevek szerkesztése' + #13#10 +
      'HintL.Caption=Nyomjon entert a szerkesztéshez' + #13#10 +
      'DSAliasL.Caption=Dataset álnév' + #13#10 +
      'FieldAliasesL.Caption=Mezõ álnevek' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      'ResetB.Caption=Alaphelyzet' + #13#10 +
      'UpdateB.Caption=Update' + #13#10 +
      '');
    Add('alUserName', 'Felhasználó neve');
    Add('alOriginal', 'Eredeti név');

    Add('TfrxParamsEditorForm',
      'Caption=Paraméterszerkesztõ' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      '');
    Add('qpName', 'Név');
    Add('qpDataType', 'Adattípus');
    Add('qpValue', 'Érték');

    Add('TfrxMDEditorForm',
      'Caption=Master-Detail link' + #13#10 +
      'Label1.Caption=Detail mezõk' + #13#10 +
      'Label2.Caption=Master mezõk' + #13#10 +
      'Label3.Caption=Csatolt mezõk' + #13#10 +
      'AddB.Caption=Hozzáad' + #13#10 +
      'ClearB.Caption=Töröl' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=Memo' + #13#10 +
      'ExprB.Hint=Kifejezés beszúrása' + #13#10 +
      'AggregateB.Hint=Halmozó beszúrása' + #13#10 +
      'LocalFormatB.Hint=Formázás beszúrása' + #13#10 +
      'WordWrapB.Hint=Szótörés' + #13#10 +
      'CancelB.Hint=Mégsem' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=Kép' + #13#10 +
      'LoadB.Hint=Betölt' + #13#10 +
      'CopyB.Hint=Másol' + #13#10 +
      'PasteB.Hint=Beilleszt' + #13#10 +
      'ClearB.Hint=Töröl' + #13#10 +
      'CancelB.Hint=Mégsem' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('piEmpty', 'Üres');

    Add('TfrxChartEditorForm',
      'Caption=Grafikonszerkesztõ' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=Sorozat hozzáadása' + #13#10 +
      'DeleteB.Hint=Sorozat törlése' + #13#10 +
      'DBSourceRB.Caption=Adat az adatbázisból' + #13#10 +
      'BandSourceRB.Caption=Band source' + #13#10 +
      'FixedDataRB.Caption=Rögzített adat' + #13#10 +
      'DatasetLbl.Caption=Dataset' + #13#10 +
      'BandLbl.Caption=Data band' + #13#10 +
      'X1Lbl.Caption=X értékek' + #13#10 +
      'Y1Lbl.Caption=Y értékek' + #13#10 +
      'X2Lbl.Caption=X értékek' + #13#10 +
      'Y2Lbl.Caption=Y értékek' + #13#10 +
      'X3Lbl.Caption=X értékek (például a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Y értékek (például 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Egyéb opciók   ' + #13#10 +
      'ShowTopLbl.Caption=TopN értékek' + #13#10 +
      'CaptionLbl.Caption=TopN címek' + #13#10 +
      'SortLbl.Caption=Sorrend' + #13#10 +
      'LineMI.Caption=Vonal' + #13#10 +
      'AreaMI.Caption=Terület' + #13#10 +
      'PointMI.Caption=Pont' + #13#10 +
      'BarMI.Caption=Oszlop' + #13#10 +
      'HorizBarMI.Caption=Vízszintes oszlop' + #13#10 +
      'PieMI.Caption=Torta' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Gyorsvonal' + #13#10 +
      '');
    Add('ch3D', '3D nézet');
    Add('chAxis', 'Tengelyt mutat');
    Add('chsoNone', 'Semilyen');
    Add('chsoAscending', 'Növekvõ');
    Add('chsoDescending', 'Csökkenõ');

    Add('TfrxRichEditorForm',
      'Caption=Rich Text szerkesztõ' + #13#10 +
      'OpenB.Hint=Fájlt megnyit' + #13#10 +
      'SaveB.Hint=Fájlt ment' + #13#10 +
      'UndoB.Hint=Vissza' + #13#10 +
      'TTB.Hint=Betû' + #13#10 +
      'ExprB.Hint=Kifejezést beszúr' + #13#10 +
      'CancelB.Hint=Mégsem' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      'BoldB.Hint=Félkövér' + #13#10 +
      'ItalicB.Hint=Dõlt' + #13#10 +
      'UnderlineB.Hint=Aláhúzott' + #13#10 +
      'LeftAlignB.Hint=Balra igazított' + #13#10 +
      'CenterAlignB.Hint=Középre igazított' + #13#10 +
      'RightAlignB.Hint=Jobbra igazított' + #13#10 +
      'BlockAlignB.Hint=Sorkizárt' + #13#10 +
      'BulletsB.Hint=Felsorolásjelek' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Kereszttábla-szerkesztõ' + #13#10 +
      'DatasetL.Caption=Forrásadatok  ' + #13#10 +
      'DimensionsL.Caption=Dimenziók    ' + #13#10 +
      'RowsL.Caption=Sorok' + #13#10 +
      'ColumnsL.Caption=Oszlopok' + #13#10 +
      'CellsL.Caption=Cellák' + #13#10 +
      'StructureL.Caption=Kereszttábla struktúra' + #13#10 +
      'RowHeaderCB.Caption=Sor fejléc' + #13#10 +
      'ColumnHeaderCB.Caption=Oszlop fejléc' + #13#10 +
      'RowTotalCB.Caption=Sor grand total' + #13#10 +
      'ColumnTotalCB.Caption=Oszlop grand total' + #13#10 +
      'SwapB.Hint=Sor/oszlop csere' + #13#10 +
      'StyleCB.Hint=Kereszttábla stílusa' + #13#10 +
      'FontB.Hint=Betû beállítások' + #13#10 +
      'AlignLeftB.Hint=Balra igazít' + #13#10 +
      'AlignCenterB.Hint=Középre igazít' + #13#10 +
      'AlignRightB.Hint=Jobbra igazít' + #13#10 +
      'RotationB.Hint=Forgat' + #13#10 +
      'HighlightB.Hint=Kiemel' + #13#10 +
      'FormatB.Hint=Formáz' + #13#10 +
      'FrameB.Hint=Keretbeállítások' + #13#10 +
      'FillColorB.Hint=Kitöltõszín' + #13#10 +
      'Func1MI.Caption=Nincs' + #13#10 +
      'Func2MI.Caption=Összeg' + #13#10 +
      'Func3MI.Caption=Minimum' + #13#10 +
      'Func4MI.Caption=Maximum' + #13#10 +
      'Func5MI.Caption=Átlag' + #13#10 +
      'Func6MI.Caption=Darab' + #13#10 +
      'Sort1MI.Caption=Növekvõ (A-Z)' + #13#10 +
      'Sort2MI.Caption=Csökkenõ (Z-A)' + #13#10 +
      'Sort3MI.Caption=Rendezetlen' + #13#10 +
      'BoldMI.Caption=Félkövér' + #13#10 +
      'ItalicMI.Caption=Dõlt' + #13#10 +
      'UnderlineMI.Caption=Aláhúzott' + #13#10 +
      'SuperScriptMI.Caption=Felsõ index' + #13#10 +
      'SubScriptMI.Caption=Alsó index' + #13#10 +
      'CondensedMI.Caption=Sûrített' + #13#10 +
      'WideMI.Caption=Széles' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=Mégsem' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('crSubtotal', 'Részösszeg');
    Add('crNone', 'Nincs');
    Add('crSum', 'Összeg');
    Add('crMin', 'Minimum');
    Add('crMax', 'Maximum');
    Add('crAvg', 'Átlag');
    Add('crCount', 'Darab');
    Add('crAsc', 'A-Z');
    Add('crDesc', 'Z-A');
    Add('crRepHdrs', 'Fejlécek újranyomtatása');
    Add('crBorder', 'Keret');
    Add('crDown', 'Le aztán keresztbe');

    Add('TfrxExprEditorForm',
      'Caption=Kifejezésszerkesztõ' + #13#10 +
      'ExprL.Caption=Kifejezés:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=Képernyõformátum' + #13#10 +
      'CategoryL.Caption=Kategória' + #13#10 +
      'FormatL.Caption=Formátum' + #13#10 +
      'FormatStrL.Caption=Formátumsztring:' + #13#10 +
      'SeparatorL.Caption=Tizedes elválasztó:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      '');
    Add('fkText', 'Szöveg (formázatlan)');
    Add('fkNumber', 'Szám');
    Add('fkDateTime', 'Dátum/idõ');
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
      'Caption=Kiemelés' + #13#10 +
      'FontColorB.Caption=Szín...' + #13#10 +
      'BackColorB.Caption=Szín...' + #13#10 +
      'ConditionL.Caption=Feltétel   ' + #13#10 +
      'FontL.Caption=Betû   ' + #13#10 +
      'BackgroundL.Caption=Háttér       ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      'BoldCB.Caption=Félkövér' + #13#10 +
      'ItalicCB.Caption=Dõlt' + #13#10 +
      'UnderlineCB.Caption=Aláhúzott' + #13#10 +
      'TransparentRB.Caption=Átlátszó' + #13#10 +
      'OtherRB.Caption=Egyéb' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Riport beállítások' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      'GeneralTS.Caption=Általános' + #13#10 +
      'ReportSettingsL.Caption=Nyomtatóbeállítások' + #13#10 +
      'CopiesL.Caption=Másolatok' + #13#10 +
      'GeneralL.Caption=Általános ' + #13#10 +
      'PasswordL.Caption=Jelszó' + #13#10 +
      'CollateCB.Caption=Gyûjtött másolatok' + #13#10 +
      'DoublePassCB.Caption=Kétmenetes' + #13#10 +
      'PrintIfEmptyCB.Caption=Üreset is nyomtat' + #13#10 +
      'DescriptionTS.Caption=Leírás' + #13#10 +
      'NameL.Caption=Név' + #13#10 +
      'Description1L.Caption=Leírás' + #13#10 +
      'PictureL.Caption=Kép' + #13#10 +
      'AuthorL.Caption=Szerzõ' + #13#10 +
      'MajorL.Caption=Nagyobb' + #13#10 +
      'MinorL.Caption=Kisebb' + #13#10 +
      'ReleaseL.Caption=Kibocsátás' + #13#10 +
      'BuildL.Caption=Fordítás' + #13#10 +
      'CreatedL.Caption=Létrehozva' + #13#10 +
      'ModifiedL.Caption=Módosítva' + #13#10 +
      'DescriptionL.Caption=Leírás        ' + #13#10 +
      'VersionL.Caption=Verzió    ' + #13#10 +
      'PictureB.Caption=Böngész...' + #13#10 +
      '');
    Add('rePrnOnPort', '-on');

    Add('TfrxStringsEditorForm',
      'Caption=Sorok' + #13#10 +
      'CancelB.Hint=Mégsem' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=Mégsem' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=Jelszó' + #13#10 +
      'PasswordL.Caption=Kérem a jelszót:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=Stílusszerkesztõ' + #13#10 +
      'ColorB.Caption=Szín...' + #13#10 +
      'FontB.Caption=Betû...' + #13#10 +
      'FrameB.Caption=Keret...' + #13#10 +
      'AddB.Hint=Hozzáad' + #13#10 +
      'DeleteB.Hint=Töröl' + #13#10 +
      'EditB.Hint=Szerkeszt' + #13#10 +
      'LoadB.Hint=Betölt' + #13#10 +
      'SaveB.Hint=Ment' + #13#10 +
      'CancelB.Hint=Mégsem' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=Keretszerkesztõ' + #13#10 +
      'FrameL.Caption=Keret' + #13#10 +
      'LineL.Caption=Keretvonal' + #13#10 +
      'ShadowL.Caption=Árnyék' + #13#10 +
      'FrameTopB.Hint=Felsõ vonal' + #13#10 +
      'FrameBottomB.Hint=Alsó vonal' + #13#10 +
      'FrameLeftB.Hint=Bal vonal' + #13#10 +
      'FrameRightB.Hint=Jobb vonal' + #13#10 +
      'FrameAllB.Hint=Az összes keretvonal' + #13#10 +
      'FrameNoB.Hint=Nincs keret' + #13#10 +
      'FrameColorB.Hint=Keretszín' + #13#10 +
      'FrameStyleB.Hint=Keretstílus' + #13#10 +
      'FrameWidthCB.Hint=Keretvastagság' + #13#10 +
      'ShadowB.Hint=Árnyék' + #13#10 +
      'ShadowColorB.Hint=Árnyékszín' + #13#10 +
      'ShadowWidthCB.Hint=Árnyék szélessége' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=Új elem' + #13#10 +
      'ItemsTab.Caption=Elemek' + #13#10 +
      'TemplatesTab.Caption=Minták' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Tab sorrend' + #13#10 +
      'Label1.Caption=Tab sorrendben felsorolt kontrolok:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      'UpB.Caption=Fel' + #13#10 +
      'DownB.Caption=Le' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Kiértékel' + #13#10 +
      'Label1.Caption=Kifejezés' + #13#10 +
      'Label2.Caption=Eredmény' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Jelentésvarázsló' + #13#10 +
      'DataTab.Caption=Adat' + #13#10 +
      'GroupsTab.Caption=Csoportok' + #13#10 +
      'LayoutTab.Caption=Elrendezés' + #13#10 +
      'StyleTab.Caption=Stílus' + #13#10 +
      'Step1L.Caption=Step 1. Megjelenítendõ Dataset és mezõk kiválasztása.' + #13#10 +
      'Step2L.Caption=Step 2. Csoportok létrehozása (opcionális).' + #13#10 +
      'Step3L.Caption=Step 3. Laporientáció és adatelrendezés kiválasztása.' + #13#10 +
      'Step4L.Caption=Step 4. Riportstílus választása.' + #13#10 +
      'AddFieldB.Caption=Hozzáad >' + #13#10 +
      'AddAllFieldsB.Caption=Mindet hozzáadja >>' + #13#10 +
      'RemoveFieldB.Caption=< Eltávolít' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Mindet eltávolítja' + #13#10 +
      'AddGroupB.Caption=Hozzáad >' + #13#10 +
      'RemoveGroupB.Caption=< Eltávolít' + #13#10 +
      'SelectedFieldsL.Caption=Kiválasztott mezõk:' + #13#10 +
      'AvailableFieldsL.Caption=Elérhetõ mezõk:' + #13#10 +
      'GroupsL.Caption=Csoportok:' + #13#10 +
      'OrientationL.Caption=Irány         ' + #13#10 +
      'LayoutL.Caption=Elrendezés' + #13#10 +
      'PortraitRB.Caption=Portré' + #13#10 +
      'LandscapeRB.Caption=Tájkép' + #13#10 +
      'TabularRB.Caption=Táblázatos' + #13#10 +
      'ColumnarRB.Caption=Oszlopos' + #13#10 +
      'FitWidthCB.Caption=Mezõk illeszkedjenek az oldalmérethez' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      'BackB.Caption=<< Vissza' + #13#10 +
      'NextB.Caption=Következõ >>' + #13#10 +
      'FinishB.Caption=Befejez' + #13#10 +
      '');
    Add('wzStd', 'Standard Riport Varázsló');
    Add('wzDMP', 'Mátrix Riport Varázsló');
    Add('wzStdEmpty', 'Standard Riport');
    Add('wzDMPEmpty', 'Mátrix Riport');


    Add('ftAllFiles', 'Minden fájl');
    Add('ftPictures', 'Képek');
    Add('ftDB', 'Adatbázisok');
    Add('ftRichFile', 'RichText fájlok');
    Add('ftTextFile', 'Szövegfájlok');

    Add('prNotAssigned', '(Nincs hozzárendelve)');
    Add('prInvProp', 'Érvénytelen érték');
    Add('prDupl', 'Duplikált név');
    Add('prPict', '(Kép)');

    Add('mvExpr', 'Kifejezéseket enged');
    Add('mvStretch', 'Nyújt');
    Add('mvStretchToMax', 'Teljes magasságra nyújt');
    Add('mvShift', 'Eltol');
    Add('mvShiftOver', 'Átlapoltat eltolja');
    Add('mvVisible', 'Látható');
    Add('mvPrintable', 'Nyomtatható');
    Add('mvFont', 'Betû...');
    Add('mvFormat', 'Képernyõformátum...');
    Add('mvClear', 'Tartalmat töröl');
    Add('mvAutoWidth', 'Automatikus szélesség');
    Add('mvWWrap', 'Szótörés');
    Add('mvSuppress', 'Ismétlõdõ értékek elnyomása');
    Add('mvHideZ', 'Nullák rejtése');
    Add('mvHTML', 'HTML Tag-ek engedélyezése');
    Add('lvDiagonal', 'Átlós');
    Add('pvAutoSize', 'Automatikus méret');
    Add('pvCenter', 'Közép');
    Add('pvAspect', 'Arányosan');
    Add('bvSplit', 'Osztható');
    Add('bvKeepChild', 'Gyerekeket együttartja');
    Add('bvPrintChild', 'Gyerek nyomtatása ha láthatatlan');
    Add('bvStartPage', 'Új oldalra');
    Add('bvPrintIfEmpty', 'Nyomtat, ha a részletezõ üres');
    Add('bvKeepDetail', 'Részleteket együttartja');
    Add('bvKeepFooter', 'Lábléceket együttartja');
    Add('bvReprint', 'Új lapon újranyomtatja');
    Add('bvOnFirst', 'Elsõ oldalon nyomtatja');
    Add('bvOnLast', 'Utolsó oldalon nyomtatja');
    Add('bvKeepGroup', 'Együttartja');
    Add('bvFooterAfterEach', 'Minden sor után lábléc');
    Add('srParent', 'Szülõn nyomtatja');
    Add('bvKeepHeader', 'Keep Header Together');

    Add('obCatDraw', 'Rajz');
    Add('obCatOther', 'Egyéb objektumok');
    Add('obCatOtherControls', 'Egyéb kontrolok');
    Add('obDiagLine', 'Átlós vonal');
    Add('obRect', 'Téglalalp');
    Add('obRoundRect', 'Lekerekített téglalap');
    Add('obEllipse', 'Ellipszis');
    Add('obTrian', 'Háromszög');
    Add('obDiamond', 'Gyémánt');
    Add('obLabel', 'Cimke kontrol');
    Add('obEdit', 'Szerkesztõdoboz kontrol');
    Add('obMemoC', 'Memo kontrol');
    Add('obButton', 'Gomb kontrol');
    Add('obChBoxC', 'Pipa kontrol');
    Add('obRButton', 'Rádiógomb kontrol');
    Add('obLBox', 'Lista kontrol');
    Add('obCBox', 'Combo kontrol');
    Add('obDateEdit', 'Dátumszerkesztõ kontrol');
    Add('obImageC', 'Kép kontrol');
    Add('obPanel', 'Panel kontrol');
    Add('obGrBox', 'CsoportDoboz kontrol');
    Add('obBBtn', 'Képes gomb kontrol');
    Add('obSBtn', 'Gyorsgomb kontrol');
    Add('obMEdit', 'Maszkolt szövegszerkesztõ kontrol');
    Add('obChLB', 'PipaLista kontrol');
    Add('obDBLookup', 'DBLookupComboBox kontrol');
    Add('obBevel', 'Keret objektum');
    Add('obShape', 'Alakzat objektum');
    Add('obText', 'Szöveg objektum');
    Add('obSysText', 'Rendszer szöveg');
    Add('obLine', 'Vonal objektum');
    Add('obPicture', 'Kép objektum');
    Add('obBand', 'Sáv objektum');
    Add('obDataBand', 'Adatsáv');
    Add('obSubRep', 'Alriport objektum');
    Add('obDlgPage', 'Párbeszéd');
    Add('obRepPage', 'Riport lap');
    Add('obReport', 'Riport objektum');
    Add('obRich', 'RichText objektum');
    Add('obOLE', 'OLE objektum');
    Add('obChBox', 'Pipadoboz objektum');
    Add('obChart', 'Grafikon objektum');
    Add('obBarC', 'Vonalkód objektum');
    Add('obCross', 'Kereszttábla objektum');
    Add('obDBCross', 'DB kereszttábla objektum');
    Add('obGrad', 'Átmenet objektum');
    Add('obDMPText', 'Mátrix szöveg objektum');
    Add('obDMPLine', 'Mátrix vonal objektum');
    Add('obBDEDB', 'BDE adatbázis');
    Add('obBDETb', 'BDE tábla');
    Add('obBDEQ', 'BDE Query');
    Add('obBDEComps', 'BDE komponensek');
    Add('obIBXDB', 'IBX adatbázis');
    Add('obIBXTb', 'IBX tábla');
    Add('obIBXQ', 'IBX Query');
    Add('obIBXComps', 'IBX komponensek');
    Add('obADODB', 'ADO adatbázis');
    Add('obADOTb', 'ADO tábla');
    Add('obADOQ', 'ADO Query');
    Add('obADOComps', 'ADO komponensek');
    Add('obDBXDB', 'DBX adatbázis');
    Add('obDBXTb', 'DBX tábla');
    Add('obDBXQ', 'DBX Query');
    Add('obDBXComps', 'DBX komponensek');

    Add('ctString', 'Sztring');
    Add('ctDate', 'Dátum és idõ');
    Add('ctConv', 'Átalakítások');
    Add('ctFormat', 'Formázás');
    Add('ctMath', 'Matematikai');
    Add('ctOther', 'Egyéb');

    Add('IntToStr', 'Átalakít egy egész értéket szöveggé');
    Add('FloatToStr', 'Átalakít egy lebegõpontos értéket szöveggé');
    Add('DateToStr', 'Átalakít egy dátumot szöveggé');
    Add('TimeToStr', 'Átalakít egy idõt szöveggé');
    Add('DateTimeToStr', 'Átalakít egy dátum-és-idõ értéket szöveggé');
    Add('VarToStr', 'Átalakít egy variant értéket szöveggé');
    Add('StrToInt', 'Átalakít egy szöveget egésszé');
    Add('StrToFloat', 'Átalakít egy szöveget lebegõpontossá');
    Add('StrToDate', 'Átalakít egy szöveget dátummá');
    Add('StrToTime', 'Átalakít egy szöveget idõvé');
    Add('StrToDateTime', 'Átalakít egy szöveget dátum-és-idõ-vé');
    Add('Format', 'Visszaad egy tömbbõl összerakott formázott szöveget');
    Add('FormatFloat', 'Formáz egy lebegõpontos értéket');
    Add('FormatDateTime', 'Formáz egy dátum-és-idõ értéket');
    Add('FormatMaskText', 'Maszkkal formázott szöveget ad vissza');
    Add('EncodeDate', 'Visszaad egy TDateTime típust adott Év, Hó, és Nap-ból');
    Add('DecodeDate', 'Felbont egy TDateTime-ot Év, Hó, és Nap értékekké');
    Add('EncodeTime', 'Visszaad egy TDateTime-ot Óra, Perc, Másodperc, és ezredmásodpercbõl');
    Add('DecodeTime', 'Felbont egy TDateTime-ot Óra, Perc, Másodperc, és ezredmásodperccé');
    Add('Date', 'Visszaadja a jelenlegi dátumot');
    Add('Time', 'Visszaadja a jelenlegi idõt');
    Add('Now', 'Visszaadja a jelenlegi dátumot és idõt');
    Add('DayOfWeek', 'Dátumból a hét napját adja vissza');
    Add('IsLeapYear', 'Jelzi, ha az év szökõév');
    Add('DaysInMonth', 'Adott hónap napjainak számát adja vissza');
    Add('Length', 'Szöveg hosszát adja vissza');
    Add('Copy', 'Résszöveget ad vissza');
    Add('Pos', 'Résszöveg szövegen belüli pozicióját adja vissza');
    Add('Delete', 'Résszöveget eltávolít');
    Add('Insert', 'Résszöveget hozzáad');
    Add('Uppercase', 'Nagybetûsre alakít');
    Add('Lowercase', 'Kisbetûsre alakít');
    Add('Trim', 'Bevezetõ és lezáró szóközöket eltávolítja');
    Add('NameCase', 'Nagykezdõbetûsre alakít');
    Add('CompareText', 'Két szöveget hasonlít');
    Add('Chr', 'Egészet karakterré alakít');
    Add('Ord', 'Karaktert egésszé alakít');
    Add('SetLength', 'Szöveg hosszát állítja be');
    Add('Round', 'Törtet a legközelebbi egészre alakítja');
    Add('Trunc', 'Tört egész részét adja vissza');
    Add('Int', 'Tört egész részét adja vissza');
    Add('Frac', 'Tört törtrészét adja vissza');
    Add('Sqrt', 'Négyzetgyököt von');
    Add('Abs', 'Abszolút értéket ad vissza');
    Add('Sin', 'Színusz (radiánban)');
    Add('Cos', 'Koszínusz (radiánban)');
    Add('ArcTan', 'Arkusz tangens');
    Add('Tan', 'Tangens');
    Add('Exp', 'Kitevõ');
    Add('Ln', 'e alapú logaritmus');
    Add('Pi', 'PI');
    Add('Inc', 'Értéket növeli');
    Add('Dec', 'Értéket csökkenti');
    Add('RaiseException', 'Kivételt generál');
    Add('ShowMessage', 'Üzenetdoboz');
    Add('Randomize', 'Véletlenszámgenerátort indítja');
    Add('Random', 'Véletlenszám');
    Add('ValidInt', 'Igaz, ha érvényes egész a szöveg');
    Add('ValidFloat', 'Igaz, érvényes lebegõpontos szám a szöveg');
    Add('ValidDate', 'Igaz, ha érvényes dátum a szöveg');
    Add('IIF', 'TrueValue, ha a kifejezés igaz, egyébként FalseValue');
    Add('Get', 'Belsõ használatra');
    Add('Set', 'Belsõ használatra');
    Add('InputBox', 'Szövegbeviteli doboz');
    Add('InputQuery', 'Szövegbeviteli doboz');
    Add('MessageDlg', 'Üzenetdoboz');
    Add('CreateOleObject', 'OLE objektum létrehozása');
    Add('VarArrayCreate', 'Variant tömb létrehozása');
    Add('VarType', 'Variant típusát adja vissza');
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
