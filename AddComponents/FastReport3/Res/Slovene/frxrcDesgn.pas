
{******************************************}
{                                          }
{             FastReport v3.0              }
{         Language resource file           }
{                                          }
{         Copyright (c) 1998-2005          }
{         by Alexander Tzyganenko,         }
{            Fast Reports Inc.             }
{                                          }
{         Slovene translation by:          }
{         Primoz Planinc, Planles s.p.     }
{         mail: info@planles.net           }
{         made in October, 2004            }
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
      'Caption=Preglednik predmetov' + #13#10 +
      '');
    Add('oiProp', 'Lastnosti');
    Add('oiEvent', 'Dogodki');

    Add('TfrxDataTreeForm',
      'Caption=Podatkovno drevo' + #13#10 +
      'DataTS.Caption=Podatki' + #13#10 +
      'VariablesTS.Caption=Spremenljivke' + #13#10 +
      'FunctionsTS.Caption=Funkcije' + #13#10 +
      'InsFieldCB.Caption=Ustvari polje' + #13#10 +
      'InsCaptionCB.Caption=Ustvari napis' + #13#10 +
      '');
    Add('dtNoData', 'Ni razpolo�ljivih podatkov');
    Add('dtData', 'Podatki');
    Add('dtSysVar', 'Sistmske spremenljivke');
    Add('dtVar', 'Spremenljivke');
    Add('dtFunc', 'Funkcije');

    Add('TfrxReportTreeForm',
      'Caption=Drevo poro�ila' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Odpri datoteko skripta' + #13#10 +
      'SaveScriptB.Hint=Shrani skript v datoteko' + #13#10 +
      'RunScriptB.Hint=Po�eni skript' + #13#10 +
      'StepScriptB.Hint=Sledi v' + #13#10 +
      'StopScriptB.Hint=Prekini skript' + #13#10 +
      'EvaluateB.Hint=Ovrednoti' + #13#10 +
      'LangL.Caption=Jezik:' + #13#10 +
      'AlignTB.Caption=Poravnava' + #13#10 +
      'AlignLeftsB.Hint=Poravnaj levo' + #13#10 +
      'AlignHorzCentersB.Hint=Poravnaj sredinsko vodoravno' + #13#10 +
      'AlignRightsB.Hint=Poravnaj desno' + #13#10 +
      'AlignTopsB.Hint=Poravnaj zgoraj' + #13#10 +
      'AlignVertCentersB.Hint=Poravnaj sredinsko navpi�no' + #13#10 +
      'AlignBottomsB.Hint=Poravnaj spodaj' + #13#10 +
      'SpaceHorzB.Hint=Enaki razmiki, vodoravno' + #13#10 +
      'SpaceVertB.Hint=Enaki razmiki, navpi�no' + #13#10 +
      'CenterHorzB.Hint=Sredinsko horizontalno v traku' + #13#10 +
      'CenterVertB.Hint=Sredinsko vertikalno v traku' + #13#10 +
      'SameWidthB.Hint=Enaka �irina' + #13#10 +
      'SameHeightB.Hint=Enaka vi�ina' + #13#10 +
      'TextTB.Caption=Tekst' + #13#10 +
      'StyleCB.Hint=Stil' + #13#10 +
      'FontNameCB.Hint=Vrsta pisave' + #13#10 +
      'FontSizeCB.Hint=Velikost pisave' + #13#10 +
      'BoldB.Hint=Krepko' + #13#10 +
      'ItalicB.Hint=Le�e�e' + #13#10 +
      'UnderlineB.Hint=Pod�rtano' + #13#10 +
      'FontColorB.Hint=Barva pisave' + #13#10 +
      'HighlightB.Hint=Povdarki' + #13#10 +
      'RotateB.Hint=Vrtenje teksta' + #13#10 +
      'TextAlignLeftB.Hint=Poravnaj levo' + #13#10 +
      'TextAlignCenterB.Hint=Na sredino' + #13#10 +
      'TextAlignRightB.Hint=Poravnaj desno' + #13#10 +
      'TextAlignBlockB.Hint=Obojestransko' + #13#10 +
      'TextAlignTopB.Hint=Poravnaj zgoraj' + #13#10 +
      'TextAlignMiddleB.Hint=Na sredino' + #13#10 +
      'TextAlignBottomB.Hint=Poravnaj spodaj' + #13#10 +
      'FrameTB.Caption=Okvir' + #13#10 +
      'FrameTopB.Hint=Zgornja �rta' + #13#10 +
      'FrameBottomB.Hint=Spodnja �rta' + #13#10 +
      'FrameLeftB.Hint=Leva �rta' + #13#10 +
      'FrameRightB.Hint=Desna �rta' + #13#10 +
      'FrameAllB.Hint=Vse �rte okvira' + #13#10 +
      'FrameNoB.Hint=Brez okvira' + #13#10 +
      'ShadowB.Hint=Senca' + #13#10 +
      'FillColorB.Hint=Barva ozadja' + #13#10 +
      'FrameColorB.Hint=Barva okvira' + #13#10 +
      'FrameStyleB.Hint=Stil okvira' + #13#10 +
      'FrameWidthCB.Hint=�irina okvira' + #13#10 +
      'StandardTB.Caption=Standardno' + #13#10 +
      'NewB.Hint=Novo poro�ilo' + #13#10 +
      'OpenB.Hint=Odpri poro�ilo' + #13#10 +
      'SaveB.Hint=Shrani poro�ilo' + #13#10 +
      'PreviewB.Hint=Predogled' + #13#10 +
      'NewPageB.Hint=Nova stran poro�ila' + #13#10 +
      'NewDialogB.Hint=Novo pogovorno okno' + #13#10 +
      'DeletePageB.Hint=Izbri�i stran' + #13#10 +
      'PageSettingsB.Hint=Nastavitev strani' + #13#10 +
      'VariablesB.Hint=Spremenljivke' + #13#10 +
      'CutB.Hint=Izre�i' + #13#10 +
      'CopyB.Hint=Kopiraj' + #13#10 +
      'PasteB.Hint=Prilepi' + #13#10 +
      'SampleFormatB.Hint=Kopiraj oblikovanje' + #13#10 +
      'UndoB.Hint=Razveljavi' + #13#10 +
      'RedoB.Hint=Uveljavi' + #13#10 +
      'GroupB.Hint=Daj v grupo' + #13#10 +
      'UngroupB.Hint=Razbij grupo' + #13#10 +
      'ShowGridB.Hint=Prika�i mre�o' + #13#10 +
      'AlignToGridB.Hint=Poravnaj na mre�o' + #13#10 +
      'SetToGridB.Hint=Prilagodi na mre�o' + #13#10 +
      'ScaleCB.Hint=Zoom' + #13#10 +
      'ExtraToolsTB.Caption=Posebna orodja' + #13#10 +
      'ObjectSelectB.Hint=Izbiranje' + #13#10 +
      'HandToolB.Hint=Pomikanje' + #13#10 +
      'ZoomToolB.Hint=Zoom' + #13#10 +
      'TextToolB.Hint=Uredi tekst' + #13#10 +
      'FormatToolB.Hint=Kopiraj oblikovanje' + #13#10 +
      'ObjectBandB.Hint=Vstavi trak' + #13#10 +
      'FileMenu.Caption=&Datoteka' + #13#10 +
      'EditMenu.Caption=&Urejanje' + #13#10 +
      'FindMI.Caption=Najdi...' + #13#10 +
      'FindNextMI.Caption=Najdi naslednje' + #13#10 +
      'ReplaceMI.Caption=Zamenjaj...' + #13#10 +
      'ReportMenu.Caption=&Poro�ilo' + #13#10 +
      'ReportDataMI.Caption=Podatki...' + #13#10 +
      'ReportSettingsMI.Caption=Mo�nosti...' + #13#10 +
      'ReportStylesMI.Caption=Stili...' + #13#10 +
      'ViewMenu.Caption=&Pogled' + #13#10 +
      'ToolbarsMI.Caption=Orodne vrstice' + #13#10 +
      'StandardMI.Caption=Standardno' + #13#10 +
      'TextMI.Caption=Tekst' + #13#10 +
      'FrameMI.Caption=Okvir' + #13#10 +
      'AlignmentMI.Caption=Poravnava' + #13#10 +
      'ToolsMI.Caption=Posebna orodja' + #13#10 +
      'InspectorMI.Caption=Preglednik predmetov' + #13#10 +
      'DataTreeMI.Caption=Podatkovno drevo' + #13#10 +
      'ReportTreeMI.Caption=Drevo poro�ila' + #13#10 +
      'ShowRulersMI.Caption=Ravnila' + #13#10 +
      'ShowGuidesMI.Caption=Vodila' + #13#10 +
      'DeleteGuidesMI.Caption=Izbri�i vodila' + #13#10 +
      'OptionsMI.Caption=Mo�nosti...' + #13#10 +
      'HelpMenu.Caption=&Pomo�' + #13#10 +
      'HelpContentsMI.Caption=Vsebina pomo�i...' + #13#10 +
      'AboutMI.Caption=O FastReport-u...' + #13#10 +
      'TabOrderMI.Caption=Vrstni red Tab-ov...' + #13#10 +
      'UndoCmd.Caption=Razveljavi' + #13#10 +
      'RedoCmd.Caption=Uveljavi' + #13#10 +
      'CutCmd.Caption=Izre�i' + #13#10 +
      'CopyCmd.Caption=Kopiraj' + #13#10 +
      'PasteCmd.Caption=Prilepi' + #13#10 +
      'GroupCmd.Caption=Daj v grupo' + #13#10 +
      'UngroupCmd.Caption=Razbij grupo' + #13#10 +
      'DeleteCmd.Caption=Izbri�i' + #13#10 +
      'DeletePageCmd.Caption=Izbri�i stran' + #13#10 +
      'SelectAllCmd.Caption=Izberi vse' + #13#10 +
      'EditCmd.Caption=Urejanje...' + #13#10 +
      'BringToFrontCmd.Caption=Daj v ospredje' + #13#10 +
      'SendToBackCmd.Caption=Po�lji v ozadje' + #13#10 +
      'NewItemCmd.Caption=Novo...' + #13#10 +
      'NewReportCmd.Caption=Novo poro�ilo' + #13#10 +
      'NewPageCmd.Caption=Nova stran' + #13#10 +
      'NewDialogCmd.Caption=Novo pogovorno okno' + #13#10 +
      'OpenCmd.Caption=Odpri...' + #13#10 +
      'SaveCmd.Caption=Shrani' + #13#10 +
      'SaveAsCmd.Caption=Shrani kot...' + #13#10 +
      'VariablesCmd.Caption=Spremenljivke...' + #13#10 +
      'PageSettingsCmd.Caption=Nastavitev strani...' + #13#10 +
      'PreviewCmd.Caption=Predogled' + #13#10 +
      'ExitCmd.Caption=Izhod' + #13#10 +
      'ReportTitleMI.Caption=Naslov poro�ila' + #13#10 +
      'ReportSummaryMI.Caption=Povzetek poro�ila' + #13#10 +
      'PageHeaderMI.Caption=Glava strani' + #13#10 +
      'PageFooterMI.Caption=Noga strani' + #13#10 +
      'HeaderMI.Caption=Glava' + #13#10 +
      'FooterMI.Caption=Noga' + #13#10 +
      'MasterDataMI.Caption=Master podatki' + #13#10 +
      'DetailDataMI.Caption=Detail podatki' + #13#10 +
      'SubdetailDataMI.Caption=Subdetail podatki' + #13#10 +
      'Data4levelMI.Caption=Podatki 4. nivo' + #13#10 +
      'Data5levelMI.Caption=Podatki 5. nivo' + #13#10 +
      'Data6levelMI.Caption=Podatki 6. nivo' + #13#10 +
      'GroupHeaderMI.Caption=Glava skupine' + #13#10 +
      'GroupFooterMI.Caption=Noga skupine' + #13#10 +
      'ChildMI.Caption=Child' + #13#10 +
      'ColumnHeaderMI.Caption=Glava stolpca' + #13#10 +
      'ColumnFooterMI.Caption=Noga stolpca' + #13#10 +
      'OverlayMI.Caption=Overlay' + #13#10 +
      'VerticalbandsMI.Caption=Vertikalni trakovi' + #13#10 +
      'HeaderMI1.Caption=Glava' + #13#10 +
      'FooterMI1.Caption=Noga' + #13#10 +
      'MasterDataMI1.Caption=Master podatki' + #13#10 +
      'DetailDataMI1.Caption=Detail podatki' + #13#10 +
      'SubdetailDataMI1.Caption=Subdetail podatki' + #13#10 +
      'GroupHeaderMI1.Caption=Glava skupine' + #13#10 +
      'GroupFooterMI1.Caption=Noga skupine' + #13#10 +
      'ChildMI1.Caption=Child' + #13#10 +
      'R0MI.Caption=0�' + #13#10 +
      'R45MI.Caption=45�' + #13#10 +
      'R90MI.Caption=90�' + #13#10 +
      'R180MI.Caption=180�' + #13#10 +
      'R270MI.Caption=270�' + #13#10 +
      'FontB.Hint=Nastavitev pisave' + #13#10 +
      'BoldMI.Caption=Krepko' + #13#10 +
      'ItalicMI.Caption=Le�e�e' + #13#10 +
      'UnderlineMI.Caption=Pod�rtano' + #13#10 +
      'SuperScriptMI.Caption=Nadpisano' + #13#10 +
      'SubScriptMI.Caption=Podpisano' + #13#10 +
      'CondensedMI.Caption=Zgo��eno' + #13#10 +
      'WideMI.Caption=�iroko' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'OpenDialog.Filter=Poro�ilo (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=Pascal datoteke (*.pas)|*.pas|C++ datoteke (*.cpp)|*.cpp|JavaScript datoteke (*.js)|*.js|Basic datoteke (*.vb)|*.vb|Vse datoteke|*.*' + #13#10 +
      'SaveScriptDialog.Filter=Pascal datoteke (*.pas)|*.pas|C++ datoteke (*.cpp)|*.cpp|JavaScript datoteke (*.js)|*.js|Basic datoteke (*.vb)|*.vb|Vse datoteke|*.*' + #13#10 +
      '');
    Add('dsCm', 'Centimetri');
    Add('dsInch', 'Palci');
    Add('dsPix', 'To�ke');
    Add('dsChars', 'Znaki');
    Add('dsCode', 'Koda');
    Add('dsPage', 'Stran');
    Add('dsRepFilter', 'Poro�ilo (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'Stisnjeno poro�ilo (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', 'Shranim spremembe v stran predogleda?');
    Add('dsSaveChangesTo', 'Shrani spremembe v ');
    Add('dsCantLoad', 'Ne morem odpreti datoteke');
    Add('dsStyleFile', 'Stil');
    Add('dsCantFindProc', 'Glavnega procesa ni mogo�e najti');
    Add('dsClearScript', 'To bo izbrisalo vso kodo. �elite nadaljevati?');
    Add('dsNoStyle', 'Brez stila');
    Add('dsStyleSample', 'Primer stila');
    Add('dsTextNotFound', 'Tekst ''%s'' ni bil najden');
    Add('dsReplace', 'Zamenjam ta nastop ''%s''?');

    Add('TfrxAboutForm',
      'Caption=O FastReport-u' + #13#10 +
      'Label4.Caption=Za ve� informacij nas obi��ite:' + #13#10 +
      'Label6.Caption=Prodaja:' + #13#10 +
      'Label8.Caption=Podpora:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Mo�nosti strani' + #13#10 +
      'OKB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Prekli�i' + #13#10 +
      'TabSheet1.Caption=Papir' + #13#10 +
      'Label1.Caption=�irina' + #13#10 +
      'Label2.Caption=Vi�ina' + #13#10 +
      'Label11.Caption=Velikost   ' + #13#10 +
      'Label12.Caption=Usmerjenost   ' + #13#10 +
      'Label3.Caption=Levo' + #13#10 +
      'Label4.Caption=Zgoraj' + #13#10 +
      'Label5.Caption=Desno' + #13#10 +
      'Label6.Caption=Spodaj' + #13#10 +
      'Label13.Caption=Robovi   ' + #13#10 +
      'Label14.Caption=Izvor papirja   ' + #13#10 +
      'Label9.Caption=Prva stran' + #13#10 +
      'Label10.Caption=Ostale strani' + #13#10 +
      'PortraitRB.Caption=Pokon�no' + #13#10 +
      'LandscapeRB.Caption=Le�e�e' + #13#10 +
      'TabSheet3.Caption=Druge mo�nosti' + #13#10 +
      'Label7.Caption=Stolpci   ' + #13#10 +
      'Label8.Caption=�tevilo' + #13#10 +
      'Label15.Caption=�irina' + #13#10 +
      'Label16.Caption=Polo�aj' + #13#10 +
      'Label17.Caption=Drugo   ' + #13#10 +
      'Label18.Caption=Dvostransko' + #13#10 +
      'PrintOnPrevCB.Caption=Natisni na prej�njo stran' + #13#10 +
      'MirrorMarginsCB.Caption=Zrcalni robovi' + #13#10 +
      'LargeHeightCB.Caption=Velika vi�ina v oblikovalnem na�inu' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Izbor podatkovnih izvorov poro�ila' + #13#10 +
      'OKB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Prekli�i' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Urejanje spremenljivk' + #13#10 +
      'NewCategoryB.Caption=Katergorija' + #13#10 +
      'NewVarB.Caption=Spremenljivka' + #13#10 +
      'EditB.Caption=Uredi' + #13#10 +
      'DeleteB.Caption=Izbri�i' + #13#10 +
      'EditListB.Caption=Seznam' + #13#10 +
      'LoadB.Caption=Odpri' + #13#10 +
      'SaveB.Caption=Shrani' + #13#10 +
      'CancelB.Caption=Prekli�i' + #13#10 +
      'OkB.Caption=V redu' + #13#10 +
      'ExprPanel.Caption= Izraz:' + #13#10 +
      'OpenDialog1.Filter=Slovar (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Slovar (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(ni� dolo�enih spremenljivk)');
    Add('vaVar', 'Spremenljivke');
    Add('vaDupName', 'Dvojnik imena');

    Add('TfrxOptionsEditor',
      'Caption=Mo�nosti oblikovalca' + #13#10 +
      'Label1.Caption=Mre�a   ' + #13#10 +
      'Label2.Caption=Tip' + #13#10 +
      'Label3.Caption=Velikost' + #13#10 +
      'Label4.Caption=Form za dialoge:' + #13#10 +
      'Label5.Caption=Drugo   ' + #13#10 +
      'Label6.Caption=Pisave   ' + #13#10 +
      'Label7.Caption=Okno kode' + #13#10 +
      'Label8.Caption=Memo urejevalnik' + #13#10 +
      'Label9.Caption=Velikost' + #13#10 +
      'Label10.Caption=Velikost' + #13#10 +
      'Label11.Caption=Barve   ' + #13#10 +
      'Label12.Caption=Razmik med trakovi:' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=pal' + #13#10 +
      'Label15.Caption=t�' + #13#10 +
      'Label16.Caption=t�' + #13#10 +
      'Label17.Caption=t�' + #13#10 +
      'OkB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Prekli�i' + #13#10 +
      'CMRB.Caption=Centimetri:' + #13#10 +
      'InchesRB.Caption=Palci:' + #13#10 +
      'PixelsRB.Caption=To�ke:' + #13#10 +
      'ShowGridCB.Caption=Prika�i mre�o' + #13#10 +
      'AlignGridCB.Caption=Poravnaj na mre�o' + #13#10 +
      'EditAfterInsCB.Caption=Po vnosu prika�i urejevalnik' + #13#10 +
      'ObjectFontCB.Caption=Uporabi nastavitev pisave predmeta' + #13#10 +
      'WorkspaceB.Caption=Delovno podro�je' + #13#10 +
      'ToolB.Caption=Okna orodij' + #13#10 +
      'LCDCB.Caption=LCD barva mre�e' + #13#10 +
      'FreeBandsCB.Caption=Prosta postavitev trakov' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Ponastavi privzeto' + #13#10 +
      'BandsCaptionsCB.Caption=Prika�i nazive trakov' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=Izberi izvor podatkov' + #13#10 +
      'OkB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Prekli�i' + #13#10 +
      '');
    Add('dbNotAssigned', '[ni dodeljeno]');
    Add('dbSingleLine', 'Samostojna vrstica');

    Add('TfrxGroupEditorForm',
      'Caption=Skupina' + #13#10 +
      'BreakOnL.Caption=Prelom na   ' + #13#10 +
      'OptionsL.Caption=Mo�nosti   ' + #13#10 +
      'OKB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Prekli�i' + #13#10 +
      'DataFieldRB.Caption=Podatkovno polje' + #13#10 +
      'ExpressionRB.Caption=Izraz' + #13#10 +
      'KeepGroupTogetherCB.Caption=Obdr�i skupino skupaj' + #13#10 +
      'StartNewPageCB.Caption=Za�ni novo stran' + #13#10 +
      'OutlineCB.Caption=Prika�i v obrisu' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=Sistemski Memo' + #13#10 +
      'DataBandL.Caption=Podatkovni trak' + #13#10 +
      'DataSetL.Caption=DataSet' + #13#10 +
      'DataFieldL.Caption=Podatkovno polje' + #13#10 +
      'FunctionL.Caption=Funkcija' + #13#10 +
      'ExpressionL.Caption=Izraz' + #13#10 +
      'OKB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Prekli�i' + #13#10 +
      'AggregateRB.Caption=Vrednost zdru�evanja' + #13#10 +
      'SysVariableRB.Caption=Sistemska spremenljivka' + #13#10 +
      'CountInvisibleCB.Caption=Upo�tevaj nevidne trakove' + #13#10 +
      'TextRB.Caption=Tekst' + #13#10 +
      'RunningTotalCB.Caption=Teko�a skupna vrednost' + #13#10 +
      '');
    Add('agAggregate', 'Vnesi');
    Add('vt1', '[DATE]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGES#]');
    Add('vt5', '[PAGE#] od [TOTALPAGES#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=OLE predmet' + #13#10 +
      'InsertB.Caption=Vnesi...' + #13#10 +
      'EditB.Caption=Uredi...' + #13#10 +
      'CloseB.Caption=Zapri' + #13#10 +
      '');
    Add('olStretched', 'Raztegnjeno');

    Add('TfrxBarcodeEditorForm',
      'Caption=Urejevalnik �rtne kode' + #13#10 +
      'CodeLbl.Caption=Koda' + #13#10 +
      'TypeLbl.Caption=Tip �rtne kode' + #13#10 +
      'ZoomLbl.Caption=Zoom:' + #13#10 +
      'OptionsLbl.Caption=Mo�nosti   ' + #13#10 +
      'RotationLbl.Caption=Vrtenje   ' + #13#10 +
      'CancelB.Caption=Prekli�i' + #13#10 +
      'OkB.Caption=V redu' + #13#10 +
      'CalcCheckSumCB.Caption=Kontrolna vsota ' + #13#10 +
      'ViewTextCB.Caption=Tekst' + #13#10 +
      'Rotation0RB.Caption=0�' + #13#10 +
      'Rotation90RB.Caption=90�' + #13#10 +
      'Rotation180RB.Caption=180�' + #13#10 +
      'Rotation270RB.Caption=270�' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Izra�un kontrolne vsote');
    Add('bcShowText', 'Poka�i tekst');

    Add('TfrxAliasesEditorForm',
      'Caption=Urejanje aliasov' + #13#10 +
      'HintL.Caption=Pritisni Enter za urejanje elementa' + #13#10 +
      'DSAliasL.Caption=Dataset alias' + #13#10 +
      'FieldAliasesL.Caption=Aliasi polj' + #13#10 +
      'OkB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Prekli�i' + #13#10 +
      'ResetB.Caption=Ponastavi' + #13#10 +
      'UpdateB.Caption=Update' + #13#10 +
      '');
    Add('alUserName', 'Uporabni�ko ime');
    Add('alOriginal', 'Originalno ime');

    Add('TfrxParamsEditorForm',
      'Caption=Urejanje parametrov' + #13#10 +
      'OkB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Prekli�i' + #13#10 +
      '');
    Add('qpName', 'Ime');
    Add('qpDataType', 'Podatkovni tip');
    Add('qpValue', 'Vrednost');

    Add('TfrxMDEditorForm',
      'Caption=Master-Detail povezava' + #13#10 +
      'Label1.Caption=Detail polja' + #13#10 +
      'Label2.Caption=Master polja' + #13#10 +
      'Label3.Caption=Povezana polja' + #13#10 +
      'AddB.Caption=Dodaj' + #13#10 +
      'ClearB.Caption=Odstrani' + #13#10 +
      'OkB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Prekli�i' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=Memo' + #13#10 +
      'ExprB.Hint=Vstavi izraz' + #13#10 +
      'AggregateB.Hint=Vstavi zdru�evanje' + #13#10 +
      'LocalFormatB.Hint=Vstavi formatiranje' + #13#10 +
      'WordWrapB.Hint=Prelom besed' + #13#10 +
      'CancelB.Hint=Prekli�i' + #13#10 +
      'OkB.Hint=V redu' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=Slika' + #13#10 +
      'LoadB.Hint=Odpri' + #13#10 +
      'CopyB.Hint=Kopiraj' + #13#10 +
      'PasteB.Hint=Prilepi' + #13#10 +
      'ClearB.Hint=Odstrani' + #13#10 +
      'CancelB.Hint=Prekli�i' + #13#10 +
      'OkB.Hint=V redu' + #13#10 +
      '');
    Add('piEmpty', 'Prazno');

    Add('TfrxChartEditorForm',
      'Caption=Urejevalnik grafov' + #13#10 +
      'OkB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=Dodaj serijo' + #13#10 +
      'DeleteB.Hint=Izbri�i serijo' + #13#10 +
      'DBSourceRB.Caption=Podatki iz ZP' + #13#10 +
      'BandSourceRB.Caption=Izvorni trak' + #13#10 +
      'FixedDataRB.Caption=Fiksni podatki' + #13#10 +
      'DatasetLbl.Caption=Dataset' + #13#10 +
      'BandLbl.Caption=Podatkovni trak' + #13#10 +
      'X1Lbl.Caption=X vrednosti' + #13#10 +
      'Y1Lbl.Caption=Y vrednosti' + #13#10 +
      'X2Lbl.Caption=X vrednosti' + #13#10 +
      'Y2Lbl.Caption=Y vrednosti' + #13#10 +
      'X3Lbl.Caption=X vrednosti (npr., a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Y vrednosti (npr., 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Druge mo�nosti   ' + #13#10 +
      'ShowTopLbl.Caption=TopN vrednosti' + #13#10 +
      'CaptionLbl.Caption=TopN naziv' + #13#10 +
      'SortLbl.Caption=Razvr��anje' + #13#10 +
      'LineMI.Caption=�rta' + #13#10 +
      'AreaMI.Caption=Podro�je' + #13#10 +
      'PointMI.Caption=To�ka' + #13#10 +
      'BarMI.Caption=Trak' + #13#10 +
      'HorizBarMI.Caption=Vod. trak' + #13#10 +
      'PieMI.Caption=Poga�a' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Hitra �rta' + #13#10 +
      '');
    Add('ch3D', '3D pogled');
    Add('chAxis', 'Poka�i osi');
    Add('chsoNone', 'Brez');
    Add('chsoAscending', 'Nara��ajo�e');
    Add('chsoDescending', 'Padajo�e');

    Add('TfrxRichEditorForm',
      'Caption=RTF urejevalnik' + #13#10 +
      'OpenB.Hint=Odpri datoteko' + #13#10 +
      'SaveB.Hint=Shrani datoteko' + #13#10 +
      'UndoB.Hint=Razveljavi' + #13#10 +
      'TTB.Hint=Pisava' + #13#10 +
      'ExprB.Hint=Vstavi izraz' + #13#10 +
      'CancelB.Hint=Prekli�i' + #13#10 +
      'OkB.Hint=V redu' + #13#10 +
      'BoldB.Hint=Krepko' + #13#10 +
      'ItalicB.Hint=Le�e�e' + #13#10 +
      'UnderlineB.Hint=Pod�rtano' + #13#10 +
      'LeftAlignB.Hint=Poravnaj levo' + #13#10 +
      'CenterAlignB.Hint=Na sredino' + #13#10 +
      'RightAlignB.Hint=Poravnaj desno' + #13#10 +
      'BlockAlignB.Hint=Obojestransko' + #13#10 +
      'BulletsB.Hint=Ozna�evanje' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Cross-tab urejevalnik' + #13#10 +
      'DatasetL.Caption=Izvorni podatki   ' + #13#10 +
      'DimensionsL.Caption=Dimenzije   ' + #13#10 +
      'RowsL.Caption=Vrstice' + #13#10 +
      'ColumnsL.Caption=Stolpci' + #13#10 +
      'CellsL.Caption=Celice' + #13#10 +
      'StructureL.Caption=Cross-tab struktura   ' + #13#10 +
      'RowHeaderCB.Caption=Glava vrstice' + #13#10 +
      'ColumnHeaderCB.Caption=Glava stolpca' + #13#10 +
      'RowTotalCB.Caption=Vrstica skupaj' + #13#10 +
      'ColumnTotalCB.Caption=Stolpec skupaj' + #13#10 +
      'SwapB.Hint=Zamenjaj vrstice/stolpci' + #13#10 +
      'StyleCB.Hint=Cross-tab stil' + #13#10 +
      'FontB.Hint=Nastavitev pisave' + #13#10 +
      'AlignLeftB.Hint=Poravnaj levo' + #13#10 +
      'AlignCenterB.Hint=Na sredino' + #13#10 +
      'AlignRightB.Hint=Poravnaj desno' + #13#10 +
      'RotationB.Hint=Vrtenje teksta' + #13#10 +
      'HighlightB.Hint=Povdarek' + #13#10 +
      'FormatB.Hint=Oblika' + #13#10 +
      'FrameB.Hint=Nastavitev okvira' + #13#10 +
      'FillColorB.Hint=Barva polnila' + #13#10 +
      'Func1MI.Caption=Brez' + #13#10 +
      'Func2MI.Caption=Sum' + #13#10 +
      'Func3MI.Caption=Min' + #13#10 +
      'Func4MI.Caption=Max' + #13#10 +
      'Func5MI.Caption=Average' + #13#10 +
      'Func6MI.Caption=Count' + #13#10 +
      'Sort1MI.Caption=Nara��ajo�e (A-Z)' + #13#10 +
      'Sort2MI.Caption=Padajo�e (Z-A)' + #13#10 +
      'Sort3MI.Caption=Brez razvr��anja' + #13#10 +
      'BoldMI.Caption=Krepko' + #13#10 +
      'ItalicMI.Caption=Le�e�e' + #13#10 +
      'UnderlineMI.Caption=Pod�rtano' + #13#10 +
      'SuperScriptMI.Caption=Nadpisano' + #13#10 +
      'SubScriptMI.Caption=Podpisano' + #13#10 +
      'CondensedMI.Caption=Zgo��eno' + #13#10 +
      'WideMI.Caption=�iroko' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=Prekli�i' + #13#10 +
      'OkB.Hint=V redu' + #13#10 +
      '');
    Add('crSubtotal', 'Subtotal');
    Add('crNone', 'Brez');
    Add('crSum', 'Sum');
    Add('crMin', 'Min');
    Add('crMax', 'Max');
    Add('crAvg', 'Avg');
    Add('crCount', 'Count');
    Add('crAsc', 'A-Z');
    Add('crDesc', 'Z-A');
    Add('crRepHdrs', 'Ponovi glave');
    Add('crBorder', 'Meja');
    Add('crDown', 'Navzdol potem po�ez');

    Add('TfrxExprEditorForm',
      'Caption=Urejevalnik izrazov' + #13#10 +
      'ExprL.Caption=Izraz:' + #13#10 +
      'OkB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Prekli�i' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=Oblika prikaza' + #13#10 +
      'CategoryL.Caption=Katergorija' + #13#10 +
      'FormatL.Caption=Oblika' + #13#10 +
      'FormatStrL.Caption=Oblikovni niz:' + #13#10 +
      'SeparatorL.Caption=Decimalno lo�ilo:' + #13#10 +
      'OkB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Prekli�i' + #13#10 +
      '');
    Add('fkText', 'Tekst (brez formatiranja)');
    Add('fkNumber', '�tevilo');
    Add('fkDateTime', 'Datum/�as');
    Add('fkBoolean', 'Boolean');
    Add('fkNumber1', '1234.5;%g');
    Add('fkNumber2', '1234.50;%2.2f');
    Add('fkNumber3', '1,234.50;%2.2n');
    Add('fkNumber4', '$1,234.50;%2.2m');
    Add('fkDateTime1', '28.11.2002;dd.mm.yyyy');
    Add('fkDateTime2', '28 nov 2002;dd mmm yyyy');
    Add('fkDateTime3', '28 November, 2002;dd mmmm, yyyy');
    Add('fkDateTime4', '02:14;hh:mm');
    Add('fkDateTime5', '02:14am;hh:mm am/pm');
    Add('fkDateTime6', '02:14:00;hh:mm:ss');
    Add('fkDateTime7', '02:14am, 28 November, 2002;hh:mm am/pm, dd mmmm, yyyy');
    Add('fkBoolean1', '0,1;0,1');
    Add('fkBoolean2', 'No,Yes;No,Yes');
    Add('fkBoolean3', '_,x;_,x');
    Add('fkBoolean4', 'False,True;False,True');

    Add('TfrxHighlightEditorForm',
      'Caption=Povdarek' + #13#10 +
      'FontColorB.Caption=Barva...' + #13#10 +
      'BackColorB.Caption=Barva...' + #13#10 +
      'ConditionL.Caption=Pogoj   ' + #13#10 +
      'FontL.Caption=Pisava   ' + #13#10 +
      'BackgroundL.Caption=Ozadje   ' + #13#10 +
      'OKB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Prekli�i' + #13#10 +
      'BoldCB.Caption=Krepko' + #13#10 +
      'ItalicCB.Caption=Le�e�e' + #13#10 +
      'UnderlineCB.Caption=Pod�rtano' + #13#10 +
      'TransparentRB.Caption=Prosojno' + #13#10 +
      'OtherRB.Caption=Drugo' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Nastavitve poro�ila' + #13#10 +
      'OkB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Prekli�i' + #13#10 +
      'GeneralTS.Caption=Splo�no' + #13#10 +
      'ReportSettingsL.Caption=Nastavitve tiskalnika   ' + #13#10 +
      'CopiesL.Caption=Kopije' + #13#10 +
      'GeneralL.Caption=Splo�no   ' + #13#10 +
      'PasswordL.Caption=Geslo' + #13#10 +
      'CollateCB.Caption=Zbiranje kopij' + #13#10 +
      'DoublePassCB.Caption=Dvkratni prehod' + #13#10 +
      'PrintIfEmptyCB.Caption=Natisni, �e prazen' + #13#10 +
      'DescriptionTS.Caption=Opis' + #13#10 +
      'NameL.Caption=Ime' + #13#10 +
      'Description1L.Caption=Opis' + #13#10 +
      'PictureL.Caption=Slika' + #13#10 +
      'AuthorL.Caption=Avtor' + #13#10 +
      'MajorL.Caption=Major' + #13#10 +
      'MinorL.Caption=Minor' + #13#10 +
      'ReleaseL.Caption=Release' + #13#10 +
      'BuildL.Caption=Build' + #13#10 +
      'CreatedL.Caption=Ustvarjeno' + #13#10 +
      'ModifiedL.Caption=Spremenjeno' + #13#10 +
      'DescriptionL.Caption=Opis   ' + #13#10 +
      'VersionL.Caption=Razli�ica   ' + #13#10 +
      'PictureB.Caption=Prebrskaj...' + #13#10 +
      '');
    Add('rePrnOnPort', 'na');

    Add('TfrxStringsEditorForm',
      'Caption=�rte' + #13#10 +
      'CancelB.Hint=Prekli�i' + #13#10 +
      'OkB.Hint=V redu' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=Prekli�i' + #13#10 +
      'OkB.Hint=V redu' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=Geslo' + #13#10 +
      'PasswordL.Caption=Vnesite geslo:' + #13#10 +
      'OkB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Prekli�i' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=Urejevalnik stila' + #13#10 +
      'ColorB.Caption=Barva...' + #13#10 +
      'FontB.Caption=Pisava...' + #13#10 +
      'FrameB.Caption=Okvir...' + #13#10 +
      'AddB.Hint=Dodaj' + #13#10 +
      'DeleteB.Hint=Izbri�i' + #13#10 +
      'EditB.Hint=Uredi' + #13#10 +
      'LoadB.Hint=Odpri' + #13#10 +
      'SaveB.Hint=Shrani' + #13#10 +
      'CancelB.Hint=Prekli�i' + #13#10 +
      'OkB.Hint=V redu' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=Urejevalnik okvira' + #13#10 +
      'FrameL.Caption=Okvir' + #13#10 +
      'LineL.Caption=�rta okvira' + #13#10 +
      'ShadowL.Caption=Senca' + #13#10 +
      'FrameTopB.Hint=Zgornja �rta' + #13#10 +
      'FrameBottomB.Hint=Spodnja �rta' + #13#10 +
      'FrameLeftB.Hint=Leva �rta' + #13#10 +
      'FrameRightB.Hint=Desna �rta' + #13#10 +
      'FrameAllB.Hint=Vse �rte okvira' + #13#10 +
      'FrameNoB.Hint=Brez okvira' + #13#10 +
      'FrameColorB.Hint=Barva okvira' + #13#10 +
      'FrameStyleB.Hint=Stil okvira' + #13#10 +
      'FrameWidthCB.Hint=�irina okvira' + #13#10 +
      'ShadowB.Hint=Senca' + #13#10 +
      'ShadowColorB.Hint=Barva sence' + #13#10 +
      'ShadowWidthCB.Hint=�irina sence' + #13#10 +
      'OkB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Prekli�i' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=Novi element' + #13#10 +
      'ItemsTab.Caption=Elementi' + #13#10 +
      'TemplatesTab.Caption=Predloge' + #13#10 +
      'OkB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Prekli�i' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Vrstni red tab-ov' + #13#10 +
      'Label1.Caption=Seznam predmetov v vrstnem redu tab-ov:' + #13#10 +
      'OkB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Prekli�i' + #13#10 +
      'UpB.Caption=Navzgor' + #13#10 +
      'DownB.Caption=Navzdol' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Izra�un' + #13#10 +
      'Label1.Caption=Izraz' + #13#10 +
      'Label2.Caption=Rezultat' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=�arovnik za poro�ilo' + #13#10 +
      'DataTab.Caption=Podatki' + #13#10 +
      'GroupsTab.Caption=Skupine' + #13#10 +
      'LayoutTab.Caption=Postavitev' + #13#10 +
      'StyleTab.Caption=Stil' + #13#10 +
      'Step1L.Caption=Korak 1. Izbor izvora podatkov in polj za prikaz.' + #13#10 +
      'Step2L.Caption=Korak 2. Ustvari skupine (opcijsko).' + #13#10 +
      'Step3L.Caption=Korak 3. Dolo�itev usmerjenosti strani in postavitve podatkov.' + #13#10 +
      'Step4L.Caption=Korak 4. Izbor stila poro�ila.' + #13#10 +
      'AddFieldB.Caption=Dodaj >' + #13#10 +
      'AddAllFieldsB.Caption=Dodaj vse >>' + #13#10 +
      'RemoveFieldB.Caption=< Odstrani' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Odstrani vse' + #13#10 +
      'AddGroupB.Caption=Dodaj >' + #13#10 +
      'RemoveGroupB.Caption=< Odstrani' + #13#10 +
      'SelectedFieldsL.Caption=Izbrana polja:' + #13#10 +
      'AvailableFieldsL.Caption=Razpolo�ljiva polja:' + #13#10 +
      'GroupsL.Caption=Skupine:' + #13#10 +
      'OrientationL.Caption=Usmerjenost   ' + #13#10 +
      'LayoutL.Caption=Postavitev   ' + #13#10 +
      'PortraitRB.Caption=Pokon�no' + #13#10 +
      'LandscapeRB.Caption=Le�e�e' + #13#10 +
      'TabularRB.Caption=Tabelari�no' + #13#10 +
      'ColumnarRB.Caption=Stolpasto' + #13#10 +
      'FitWidthCB.Caption=Prilagodi polja na �irino strani' + #13#10 +
      'CancelB.Caption=Prekli�i' + #13#10 +
      'BackB.Caption=<< Nazaj' + #13#10 +
      'NextB.Caption=Naprej >>' + #13#10 +
      'FinishB.Caption=Kon�aj' + #13#10 +
      '');
    Add('wzStd', 'Standarden �arovnik poro�ila');
    Add('wzDMP', '�arovnik za matri�ni tiskalnik');
    Add('wzStdEmpty', 'Standardno poro�ilo');
    Add('wzDMPEmpty', 'Poro�ilo za matrir�ni tiskalnik');


    Add('ftAllFiles', 'Vse datoteke');
    Add('ftPictures', 'Slike');
    Add('ftDB', 'Zbirke podatkov');
    Add('ftRichFile', 'RTF datoteke');
    Add('ftTextFile', 'Tekstovne datoteke');

    Add('prNotAssigned', '(Ni dodeljeno)');
    Add('prInvProp', 'Neveljavna vrednost lastnosti');
    Add('prDupl', 'Podvojeno ime');
    Add('prPict', '(Slika)');

    Add('mvExpr', 'Dovoli izraze');
    Add('mvStretch', 'Raztegni');
    Add('mvStretchToMax', 'Raztegni na najve�jo vi�ino');
    Add('mvShift', 'Premakni');
    Add('mvShiftOver', 'Premakni �e se prekriva');
    Add('mvVisible', 'Vidno');
    Add('mvPrintable', 'Se tiska');
    Add('mvFont', 'Pisava...');
    Add('mvFormat', 'Oblika prikaza...');
    Add('mvClear', 'Izbri�i vsebino');
    Add('mvAutoWidth', 'Samo�irina');
    Add('mvWWrap', 'Prelom besed');
    Add('mvSuppress', 'Prepre�i ponavljajo�e vrednosti');
    Add('mvHideZ', 'Skrij ni�le');
    Add('mvHTML', 'Dovoli HTML oznake');
    Add('lvDiagonal', 'Diagonalno');
    Add('pvAutoSize', 'Samovelikost');
    Add('pvCenter', 'Usredini');
    Add('pvAspect', 'Obr�i razmerje �ir/vi�');
    Add('bvSplit', 'Dovoli delitev');
    Add('bvKeepChild', 'Obdr�i Child skupaj');
    Add('bvPrintChild', 'Natisni Child, �e neviden');
    Add('bvStartPage', 'Za�ni novo stran');
    Add('bvPrintIfEmpty', 'Natisni, �e Detail prazen');
    Add('bvKeepDetail', 'Obdr�i Detail skupaj');
    Add('bvKeepFooter', 'Obdr�i Nogo skupaj');
    Add('bvReprint', 'Ponatis na novi strani');
    Add('bvOnFirst', 'Natisni na prvi strani');
    Add('bvOnLast', 'Natisni na zadnji strani');
    Add('bvKeepGroup', 'Obdr�i skupaj');
    Add('bvFooterAfterEach', 'Noga za vsako vrstico');
    Add('srParent', 'Natisni na Parent');
    Add('bvKeepHeader', 'Obdr�i Glavo skupaj');

    Add('obCatDraw', 'Risanje');
    Add('obCatOther', 'Drugi predmeti');
    Add('obCatOtherControls', 'Druge kontrole');
    Add('obDiagLine', 'Diagonalna �rta');
    Add('obRect', 'Pravokotnik');
    Add('obRoundRect', 'Zaokro�eni pravokotnik');
    Add('obEllipse', 'Elipsa');
    Add('obTrian', 'Trikotnik');
    Add('obDiamond', 'Diamant');
    Add('obLabel', 'Label control');
    Add('obEdit', 'Edit control');
    Add('obMemoC', 'Memo control');
    Add('obButton', 'Button control');
    Add('obChBoxC', 'CheckBox control');
    Add('obRButton', 'RadioButton control');
    Add('obLBox', 'ListBox control');
    Add('obCBox', 'ComboBox control');
    Add('obDateEdit', 'DateEdit control');
    Add('obImageC', 'Image control');
    Add('obPanel', 'Panel control');
    Add('obGrBox', 'GroupBox control');
    Add('obBBtn', 'BitBtn control');
    Add('obSBtn', 'SpeedButton control');
    Add('obMEdit', 'MaskEdit control');
    Add('obChLB', 'CheckListBox control');
    Add('obDBLookup', 'DBLookupComboBox control');
    Add('obBevel', 'Bevel object');
    Add('obShape', 'Shape object');
    Add('obText', 'Tekst');
    Add('obSysText', 'Sistemski tekst');
    Add('obLine', '�rta');
    Add('obPicture', 'Slika');
    Add('obBand', 'Trak');
    Add('obDataBand', 'Podatkovni trak');
    Add('obSubRep', 'Podporo�ilo');
    Add('obDlgPage', 'Pogovorno okno');
    Add('obRepPage', 'Stran poro�ila');
    Add('obReport', 'Poro�ilo');
    Add('obRich', 'Obogateno besedilo');
    Add('obOLE', 'OLE predmet');
    Add('obChBox', 'CheckBox object');
    Add('obChart', 'Graf');
    Add('obBarC', '�rtna koda');
    Add('obCross', 'Cross-tab');
    Add('obDBCross', 'ZP Cross-tab');
    Add('obGrad', 'Gradient');
    Add('obDMPText', 'Matri�ni tiskalnik-Tekst');
    Add('obDMPLine', 'Matri�ni tiskalnik-�rta');
    Add('obBDEDB', 'BDE Database');
    Add('obBDETb', 'BDE Table');
    Add('obBDEQ', 'BDE Query');
    Add('obBDEComps', 'BDE components');
    Add('obIBXDB', 'IBX Database');
    Add('obIBXTb', 'IBX Table');
    Add('obIBXQ', 'IBX Query');
    Add('obIBXComps', 'IBX Components');
    Add('obADODB', 'ADO Database');
    Add('obADOTb', 'ADO Table');
    Add('obADOQ', 'ADO Query');
    Add('obADOComps', 'ADO Components');
    Add('obDBXDB', 'DBX Database');
    Add('obDBXTb', 'DBX Table');
    Add('obDBXQ', 'DBX Query');
    Add('obDBXComps', 'DBX Components');

    Add('ctString', 'Niz');
    Add('ctDate', 'Datum in �as');
    Add('ctConv', 'Pretvorbe');
    Add('ctFormat', 'Oblikovanje');
    Add('ctMath', 'Matemati�no');
    Add('ctOther', 'Drugo');

    Add('IntToStr', 'Pretvori integer vrednost v niz');
    Add('FloatToStr', 'Pretvori float vrednost v niz');
    Add('DateToStr', 'Pretvori datum v niz');
    Add('TimeToStr', 'Pretvori �as v niz');
    Add('DateTimeToStr', 'Pretvori datum in �as v niz');
    Add('VarToStr', 'Pretvori variant vrednost v niz');
    Add('StrToInt', 'Pretvori niz v integer vrednost');
    Add('StrToFloat', 'Pretvori niz v float');
    Add('StrToDate', 'Pretvori niz v datum');
    Add('StrToTime', 'Pretvori niz v �as');
    Add('StrToDateTime', 'Pretvori string to a date-and-time format');
    Add('Format', 'Vrne oblikovan niz glede na dolo�itev argumenta');
    Add('FormatFloat', 'Oblikuje float vrednost');
    Add('FormatDateTime', 'Oblikuje datum ali �as');
    Add('FormatMaskText', 'Vrne niz oblikovan z uporabo urejevalne maske');
    Add('EncodeDate', 'Vrne TDateTime tip za dolo�eno Leto, Mesec, in Dan');
    Add('DecodeDate', 'Razbije TDateTime v leto, mesec, in dan');
    Add('EncodeTime', 'Vrne TDateTime tip za dolo�eno uro, Min, Sec, in MSec');
    Add('DecodeTime', 'Razbije TDateTime v ure, minute, sekunde, in millisekunde');
    Add('Date', 'Vrne trenutni datum');
    Add('Time', 'Vrne trenutni �as');
    Add('Now', 'Vrne trenutni datum in �as');
    Add('DayOfWeek', 'Vrne dan v tednu za dolo�en datum');
    Add('IsLeapYear', 'Naznani, �e je navedeno leto prehodno ali ne');
    Add('DaysInMonth', 'Vrne �tevilo dni v navedenem mesecu');
    Add('Length', 'Vrne dol�ino niza');
    Add('Copy', 'Vrne del niza');
    Add('Pos', 'Vrne polo�aj dela niza v nizu');
    Add('Delete', 'Odstrani del niza iz niza');
    Add('Insert', 'Vstavi del niza v niz');
    Add('Uppercase', 'Pretvori vse znake niza v VELIKE �RKE');
    Add('Lowercase', 'Pretvori vse znake niza v male �rke');
    Add('Trim', 'Odstrani presledke pred in za nizom');
    Add('NameCase', 'Pretvori prvi znak besede v veliko �rko');
    Add('CompareText', 'Primerja dva niza');
    Add('Chr', 'Pretvori integer v znak');
    Add('Ord', 'Pretvori znak v integer');
    Add('SetLength', 'Nastavi dol�ino niza');
    Add('Round', 'Zaokro�i float vrednost na najbli�jo celo �tevilo');
    Add('Trunc', 'Odstrani decimalni del float vrednosti (dobimo samo celo �tevilo)');
    Add('Int', 'Vrne integer del realnega �tevila');
    Add('Frac', 'Vrne ulomljeni del realnega �tevila');
    Add('Sqrt', 'Vrne kvadratni koren navedenega �tevila');
    Add('Abs', 'Vrne absolutno vrednost');
    Add('Sin', 'Vrne sinus kota (v radianih)');
    Add('Cos', 'Vrne kosinus kota (v radianih)');
    Add('ArcTan', 'Vrne arctangens');
    Add('Tan', 'Vrne tangens');
    Add('Exp', 'Vrne exponential');
    Add('Ln', 'Vrne naravni logaritem');
    Add('Pi', 'Vrne �tevilo PI: 3.1415926...');
    Add('Inc', 'Pove�a vrednost');
    Add('Dec', 'Zmanj�a vrednost');
    Add('RaiseException', 'Povzro�i exception');
    Add('ShowMessage', 'Prika�e sporo�ilo');
    Add('Randomize', 'Po�ene generator naklju�nega �tevila');
    Add('Random', 'Vrne naklju�no �tevilo');
    Add('ValidInt', 'Vrne True �e naveden niz vsebuje veljavno integer vrednost');
    Add('ValidFloat', 'Vrne True �e naveden niz vsebuje veljavno float vrednost');
    Add('ValidDate', 'Vrne True �e naveden niz vsebuje veljaven datum');
    Add('IIF', 'Vrne TrueValue �e je naveden izraz True, druga�e vrne FalseValue');
    Add('Get', 'Samo za interno uporabo');
    Add('Set', 'Samo za interno uporabo');
    Add('InputBox', 'Prika�e vnosno pogovorno okno, ki omogo�a vpis niza');
    Add('InputQuery', 'Prika�e vnosno pogovorno okno, ki omogo�a vpis niza');
    Add('MessageDlg', 'Prika�e sporo�ilo');
    Add('CreateOleObject', 'Ustvari OLE predmet');
    Add('VarArrayCreate', 'Ustvari variant polje');
    Add('VarType', 'Vrne tip variant vrednosti');
    Add('DayOf', 'Vrne stevilko dneva (1..31) danega datuma');
    Add('MonthOf', 'Vrne stevilko meseca (1..12) danega datuma');
    Add('YearOf', 'Vrne leto danega datuma');

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
