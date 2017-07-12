
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
      'Caption=Inspektor obiektów' + #13#10 +
      '');
    Add('oiProp', 'W³aœciwoœci');
    Add('oiEvent', 'Zdarzenia');

    Add('TfrxDataTreeForm',
      'Caption=Drzewo danych' + #13#10 +
      'DataTS.Caption=Dane' + #13#10 +
      'VariablesTS.Caption=Zmienne' + #13#10 +
      'FunctionsTS.Caption=Funkcje' + #13#10 +
      'InsFieldCB.Caption=Twórz pole' + #13#10 +
      'InsCaptionCB.Caption=Twórz opis' + #13#10 +
      '');
    Add('dtNoData', 'Dane niedostêpne');
    Add('dtData', 'Dane');
    Add('dtSysVar', 'Zmienne systemowe');
    Add('dtVar', 'Zmienne');
    Add('dtFunc', 'Funkcje');

    Add('TfrxReportTreeForm',
      'Caption=Drzewo raportu' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Otwórz plik skryptu' + #13#10 +
      'SaveScriptB.Hint=Zapisz plik skryptu' + #13#10 +
      'RunScriptB.Hint=Uruchom skrypt' + #13#10 +
      'StepScriptB.Hint=Uruchom krokowo' + #13#10 +
      'StopScriptB.Hint=Przerwij wykonywanie skryptu' + #13#10 +
      'EvaluateB.Hint=Ustalenie wartoœci' + #13#10 +
      'LangL.Caption=Jêzyk:' + #13#10 +
      'AlignTB.Caption=Po³o¿enie' + #13#10 +
      'AlignLeftsB.Hint=Do lewej' + #13#10 +
      'AlignHorzCentersB.Hint=Œrodek poziomo' + #13#10 +
      'AlignRightsB.Hint=Do prawej' + #13#10 +
      'AlignTopsB.Hint=U góry' + #13#10 +
      'AlignVertCentersB.Hint=Œrodek pionowo' + #13#10 +
      'AlignBottomsB.Hint=Na dole' + #13#10 +
      'SpaceHorzB.Hint=Rozmieœæ poziomo' + #13#10 +
      'SpaceVertB.Hint=Rozmieœæ pionowo' + #13#10 +
      'CenterHorzB.Hint=Centruj poziomo na wstêdze' + #13#10 +
      'CenterVertB.Hint=Centruj pionowo na wstêdze' + #13#10 +
      'SameWidthB.Hint=Taka sama szerokoœæ' + #13#10 +
      'SameHeightB.Hint=Taka sama wysokoœæ' + #13#10 +
      'TextTB.Caption=Tekst' + #13#10 +
      'StyleCB.Hint=Styl' + #13#10 +
      'FontNameCB.Hint=Nazwa czcionki' + #13#10 +
      'FontSizeCB.Hint=Rozmiar czcionki' + #13#10 +
      'BoldB.Hint=Pogrubienie' + #13#10 +
      'ItalicB.Hint=Pochylenie' + #13#10 +
      'UnderlineB.Hint=Podkreœlenie' + #13#10 +
      'FontColorB.Hint=Kolor czcionki' + #13#10 +
      'HighlightB.Hint=Wyró¿nienie' + #13#10 +
      'RotateB.Hint=Obrót tekstu' + #13#10 +
      'TextAlignLeftB.Hint=Wyrównanie do lewej' + #13#10 +
      'TextAlignCenterB.Hint=Wyœrodkowanie poziome' + #13#10 +
      'TextAlignRightB.Hint=Wyrównanie do prawej' + #13#10 +
      'TextAlignBlockB.Hint=Justowanie' + #13#10 +
      'TextAlignTopB.Hint=Wyrównanie do góry' + #13#10 +
      'TextAlignMiddleB.Hint=Wyœrodkowanie pionowe' + #13#10 +
      'TextAlignBottomB.Hint=Wyrównanie do do³u' + #13#10 +
      'FrameTB.Caption=Ramka' + #13#10 +
      'FrameTopB.Hint=Górna linia' + #13#10 +
      'FrameBottomB.Hint=Dolna linia' + #13#10 +
      'FrameLeftB.Hint=Lewa linia' + #13#10 +
      'FrameRightB.Hint=Prawa linia' + #13#10 +
      'FrameAllB.Hint=Wszystkie linie ramki' + #13#10 +
      'FrameNoB.Hint=Bez ramki' + #13#10 +
      'ShadowB.Hint=Cieñ' + #13#10 +
      'FillColorB.Hint=Kolor t³a' + #13#10 +
      'FrameColorB.Hint=Kolor ramki' + #13#10 +
      'FrameStyleB.Hint=Styl ramki' + #13#10 +
      'FrameWidthCB.Hint=Gruboœæ ramki' + #13#10 +
      'StandardTB.Caption=Standard' + #13#10 +
      'NewB.Hint=Nowy Raport' + #13#10 +
      'OpenB.Hint=Otwórz Raport' + #13#10 +
      'SaveB.Hint=Zapisz Raport' + #13#10 +
      'PreviewB.Hint=Podgl¹d' + #13#10 +
      'NewPageB.Hint=Nowa Strona Raportu' + #13#10 +
      'NewDialogB.Hint=Nowa Strona Dialogowa' + #13#10 +
      'DeletePageB.Hint=Usuñ Stronê' + #13#10 +
      'PageSettingsB.Hint=Ustawienia Strony' + #13#10 +
      'VariablesB.Hint=Zmienne' + #13#10 +
      'CutB.Hint=Wytnij' + #13#10 +
      'CopyB.Hint=Kopiuj' + #13#10 +
      'PasteB.Hint=Wklej' + #13#10 +
      'SampleFormatB.Hint=Kopiuj formatowanie' + #13#10 +
      'UndoB.Hint=Cofnij' + #13#10 +
      'RedoB.Hint=Ponów' + #13#10 +
      'GroupB.Hint=Grupuj' + #13#10 +
      'UngroupB.Hint=Rozgrupuj' + #13#10 +
      'ShowGridB.Hint=Poka¿ Siatkê' + #13#10 +
      'AlignToGridB.Hint=Przyci¹gaj do siatki' + #13#10 +
      'SetToGridB.Hint=Wpasuj w siatkê' + #13#10 +
      'ScaleCB.Hint=Powiêkszenie' + #13#10 +
      'ExtraToolsTB.Caption=Dodatkowe narzêdzia' + #13#10 +
      'ObjectSelectB.Hint=WskaŸnik' + #13#10 +
      'HandToolB.Hint=R¹czka' + #13#10 +
      'ZoomToolB.Hint=Lupa' + #13#10 +
      'TextToolB.Hint=Edycja tekstu' + #13#10 +
      'FormatToolB.Hint=Kopiowanie formatu' + #13#10 +
      'ObjectBandB.Hint=Wstawianie wstêgi' + #13#10 +
      'FileMenu.Caption=&Plik' + #13#10 +
      'EditMenu.Caption=&Edycja' + #13#10 +
      'FindMI.Caption=ZnajdŸ...' + #13#10 +
      'FindNextMI.Caption=ZnajdŸ nastêpne' + #13#10 +
      'ReplaceMI.Caption=Zamieñ...' + #13#10 +
      'ReportMenu.Caption=&Raport' + #13#10 +
      'ReportDataMI.Caption=Dane...' + #13#10 +
      'ReportSettingsMI.Caption=Opcje...' + #13#10 +
      'ReportStylesMI.Caption=Style...' + #13#10 +
      'ViewMenu.Caption=&Widok' + #13#10 +
      'ToolbarsMI.Caption=Paski narzêdzi' + #13#10 +
      'StandardMI.Caption=Standardowy' + #13#10 +
      'TextMI.Caption=Tekst' + #13#10 +
      'FrameMI.Caption=Ramka' + #13#10 +
      'AlignmentMI.Caption=Rozmieszczenie' + #13#10 +
      'ToolsMI.Caption=Dodatkowe narzêdzia' + #13#10 +
      'InspectorMI.Caption=Inspektor obiektów' + #13#10 +
      'DataTreeMI.Caption=Drzewo danych' + #13#10 +
      'ReportTreeMI.Caption=Drzewo raportu' + #13#10 +
      'ShowRulersMI.Caption=Linijki' + #13#10 +
      'ShowGuidesMI.Caption=Prowadnice' + #13#10 +
      'DeleteGuidesMI.Caption=Usuñ prowadnice' + #13#10 +
      'OptionsMI.Caption=Opcje...' + #13#10 +
      'HelpMenu.Caption=&Pomoc' + #13#10 +
      'HelpContentsMI.Caption=Pomoc kontekstowa...' + #13#10 +
      'AboutMI.Caption=O FastReport...' + #13#10 +
      'TabOrderMI.Caption=Porz¹dek tabulacji...' + #13#10 +
      'UndoCmd.Caption=Cofnij' + #13#10 +
      'RedoCmd.Caption=Ponów' + #13#10 +
      'CutCmd.Caption=Wytnij' + #13#10 +
      'CopyCmd.Caption=Kopiuj' + #13#10 +
      'PasteCmd.Caption=Wklej' + #13#10 +
      'GroupCmd.Caption=Grupuj' + #13#10 +
      'UngroupCmd.Caption=Rozgrupuj' + #13#10 +
      'DeleteCmd.Caption=Usuñ' + #13#10 +
      'DeletePageCmd.Caption=Usuñ stronê' + #13#10 +
      'SelectAllCmd.Caption=Wybierz wszystko' + #13#10 +
      'EditCmd.Caption=Edytuj...' + #13#10 +
      'BringToFrontCmd.Caption=Przesuñ na wierzch' + #13#10 +
      'SendToBackCmd.Caption=Schowaj pod spód' + #13#10 +
      'NewItemCmd.Caption=Nowy...' + #13#10 +
      'NewReportCmd.Caption=Nowy raport' + #13#10 +
      'NewPageCmd.Caption=Nowa strona' + #13#10 +
      'NewDialogCmd.Caption=Nowy dialog' + #13#10 +
      'OpenCmd.Caption=Otwórz...' + #13#10 +
      'SaveCmd.Caption=Zapisz' + #13#10 +
      'SaveAsCmd.Caption=Zapisz jako...' + #13#10 +
      'VariablesCmd.Caption=Zmienne...' + #13#10 +
      'PageSettingsCmd.Caption=Ustawienia strony...' + #13#10 +
      'PreviewCmd.Caption=Podgl¹d' + #13#10 +
      'ExitCmd.Caption=Wyjœcie' + #13#10 +
      'ReportTitleMI.Caption=Nag³ówek raportu' + #13#10 +
      'ReportSummaryMI.Caption=Podsumowanie raportu' + #13#10 +
      'PageHeaderMI.Caption=Nag³ówek strony' + #13#10 +
      'PageFooterMI.Caption=Stopka strony' + #13#10 +
      'HeaderMI.Caption=Nag³ówek' + #13#10 +
      'FooterMI.Caption=Stopka' + #13#10 +
      'MasterDataMI.Caption=G³ówne dane' + #13#10 +
      'DetailDataMI.Caption=Szczegó³owe dane' + #13#10 +
      'SubdetailDataMI.Caption=Szczegó³owe dane 3.poziom' + #13#10 +
      'Data4levelMI.Caption=Szczegó³owe dane 4.poziom' + #13#10 +
      'Data5levelMI.Caption=Szczegó³owe dane 5.poziom' + #13#10 +
      'Data6levelMI.Caption=Szczegó³owe dane 6.poziom' + #13#10 +
      'GroupHeaderMI.Caption=Nag³ówek grupy' + #13#10 +
      'GroupFooterMI.Caption=Stopka grupy' + #13#10 +
      'ChildMI.Caption=Wstêga podrzêdna' + #13#10 +
      'ColumnHeaderMI.Caption=Nag³ówek kolumny' + #13#10 +
      'ColumnFooterMI.Caption=Stopka kolumny' + #13#10 +
      'OverlayMI.Caption=Nak³adka' + #13#10 +
      'VerticalbandsMI.Caption=Pionowe wstêgi' + #13#10 +
      'HeaderMI1.Caption=Nag³ówek' + #13#10 +
      'FooterMI1.Caption=Stopka' + #13#10 +
      'MasterDataMI1.Caption=Glówne dane' + #13#10 +
      'DetailDataMI1.Caption=Szczegó³owe dane' + #13#10 +
      'SubdetailDataMI1.Caption=Szczegó³owe dane 3.poziom' + #13#10 +
      'GroupHeaderMI1.Caption=Nag³ówek grupy' + #13#10 +
      'GroupFooterMI1.Caption=Stopka grupy' + #13#10 +
      'ChildMI1.Caption=Wstêga podrzêdna' + #13#10 +
      'R0MI.Caption=0°' + #13#10 +
      'R45MI.Caption=45°' + #13#10 +
      'R90MI.Caption=90°' + #13#10 +
      'R180MI.Caption=180°' + #13#10 +
      'R270MI.Caption=270°' + #13#10 +
      'FontB.Hint=Ustawienia czcionki' + #13#10 +
      'BoldMI.Caption=Pogrubienie' + #13#10 +
      'ItalicMI.Caption=Pochylenie' + #13#10 +
      'UnderlineMI.Caption=Podkreœlenie' + #13#10 +
      'SuperScriptMI.Caption=Super Skrypt' + #13#10 +
      'SubScriptMI.Caption=Podskrypt' + #13#10 +
      'CondensedMI.Caption=Zagêszczone' + #13#10 +
      'WideMI.Caption=Szerokie' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'OpenDialog.Filter=Raport (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=pliki Pascal (*.pas)|*.pas|pliki C++ (*.cpp)|*.cpp|pliki JavaScript (*.js)|*.js|pliki Basic (*.vb)|*.vb|Wszystkie|*.*' + #13#10 +
      'SaveScriptDialog.Filter=pliki Pascal (*.pas)|*.pas|pliki C++ (*.cpp)|*.cpp|pliki JavaScript (*.js)|*.js|pliki Basic (*.vb)|*.vb|Wszystkie|*.*' + #13#10 +
      '');
    Add('dsCm', 'Centymetry');
    Add('dsInch', 'Cale');
    Add('dsPix', 'Piksele');
    Add('dsChars', 'Znaki');
    Add('dsCode', 'Kod');
    Add('dsPage', 'Strona');
    Add('dsRepFilter', 'Raport (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'Skompresowany raport (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', 'Zapisz zmiany w przegl¹danej stronie?');
    Add('dsSaveChangesTo', 'Zapisz zmiany do ');
    Add('dsCantLoad', 'Nie mo¿na wczytaæ pliku');
    Add('dsStyleFile', 'Styl');
    Add('dsCantFindProc', 'Nie mo¿na znaleŸæ g³ównej proc');
    Add('dsClearScript', 'Wszystkie kody zostan¹ usuniête. Czy chcesz kontynuowaæ ?');
    Add('dsNoStyle', 'Brak stylu');
    Add('dsStyleSample', 'Przyk³ad stylu');
    Add('dsTextNotFound', 'Tekst ''%s'' nie zosta³ znaleziony');
    Add('dsReplace', 'Czy zamieniæ to wyst¹pienie ''%s''?');

    Add('TfrxAboutForm',
      'Caption=O FastReport' + #13#10 +
      'Label4.Caption=Wiêcej informacji na naszej stronie:' + #13#10 +
      'Label6.Caption=Sprzeda¿:' + #13#10 +
      'Label8.Caption=Wsparcie:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Opcje strony' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'TabSheet1.Caption=Papier' + #13#10 +
      'Label1.Caption=Szerokoœæ' + #13#10 +
      'Label2.Caption=Wysokoœæ' + #13#10 +
      'Label11.Caption=Rozmiar   ' + #13#10 +
      'Label12.Caption=Orientacja   ' + #13#10 +
      'Label3.Caption=Lewy' + #13#10 +
      'Label4.Caption=Górny' + #13#10 +
      'Label5.Caption=Prawy' + #13#10 +
      'Label6.Caption=Dolny' + #13#10 +
      'Label13.Caption=Marginesy   ' + #13#10 +
      'Label14.Caption=ród³o papieru   ' + #13#10 +
      'Label9.Caption=Pierwsza strona' + #13#10 +
      'Label10.Caption=Pozosta³e strony' + #13#10 +
      'PortraitRB.Caption=Pionowa' + #13#10 +
      'LandscapeRB.Caption=Pozioma' + #13#10 +
      'TabSheet3.Caption=Pozosta³e' + #13#10 +
      'Label7.Caption=Kolumny   ' + #13#10 +
      'Label8.Caption=Iloœæ' + #13#10 +
      'Label15.Caption=Szerokoœæ' + #13#10 +
      'Label16.Caption=Pozycje' + #13#10 +
      'Label17.Caption=Inne   ' + #13#10 +
      'Label18.Caption=Duplex' + #13#10 +
      'PrintOnPrevCB.Caption=Drukuj do poprzedniej strony' + #13#10 +
      'MirrorMarginsCB.Caption=Marginesy lustrzane' + #13#10 +
      'LargeHeightCB.Caption=Du¿a wysokoœæ strony w trybie projektowania' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Wybór Ÿróde³ danych raportu' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Edycja zmiennych' + #13#10 +
      'NewCategoryB.Caption=Kategoria' + #13#10 +
      'NewVarB.Caption=Zmienna' + #13#10 +
      'EditB.Caption=Edytuj' + #13#10 +
      'DeleteB.Caption=Usuñ' + #13#10 +
      'EditListB.Caption=Lista' + #13#10 +
      'LoadB.Caption=Wczytaj' + #13#10 +
      'SaveB.Caption=Zapisz' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'ExprPanel.Caption= Wyra¿enie:' + #13#10 +
      'OpenDialog1.Filter=S³ownik (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=S³ownik (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(brak zdefiniowanych zmiennych)');
    Add('vaVar', 'Zmienne');
    Add('vaDupName', 'Zmienna o tej nazwie ju¿ wystêpuje');

    Add('TfrxOptionsEditor',
      'Caption=Opcje konstruktora raportów' + #13#10 +
      'Label1.Caption=Siatka   ' + #13#10 +
      'Label2.Caption=Rodzaj miary' + #13#10 +
      'Label3.Caption=Rozmiar' + #13#10 +
      'Label4.Caption=Okno dialogowe:' + #13#10 +
      'Label5.Caption=Inne   ' + #13#10 +
      'Label6.Caption=Czcionki   ' + #13#10 +
      'Label7.Caption=Okno kodu' + #13#10 +
      'Label8.Caption=Edytor tekstu' + #13#10 +
      'Label9.Caption=Rozmiar' + #13#10 +
      'Label10.Caption=Rozmiar' + #13#10 +
      'Label11.Caption=Kolory   ' + #13#10 +
      'Label12.Caption=Przerwa pomiêdzy wstêgami:' + #13#10 +
      'Label13.Caption=cm' + #13#10 +
      'Label14.Caption=in' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'CMRB.Caption=Centymetry:' + #13#10 +
      'InchesRB.Caption=Cale:' + #13#10 +
      'PixelsRB.Caption=Pixele:' + #13#10 +
      'ShowGridCB.Caption=Pokazuj siatkê' + #13#10 +
      'AlignGridCB.Caption=Przyci¹gaj do siatki' + #13#10 +
      'EditAfterInsCB.Caption=Wyœwietl edytor po dopisaniu' + #13#10 +
      'ObjectFontCB.Caption=U¿yj ustawieñ czcionki w obiektach' + #13#10 +
      'WorkspaceB.Caption=Okno konstruktora' + #13#10 +
      'ToolB.Caption=Okna narzêdziowe' + #13#10 +
      'LCDCB.Caption=Kolor siatki dla monitora LCD' + #13#10 +
      'FreeBandsCB.Caption=Dowolne rozmieszczanie wstêg' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Przywróæ domyœlne' + #13#10 +
      'BandsCaptionsCB.Caption=Wyœwietlanie opisów wstêg' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=Wybór Ÿród³a danych' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      '');
    Add('dbNotAssigned', '[brak Ÿród³a]');
    Add('dbSingleLine', 'Pojedynczy wiersz');

    Add('TfrxGroupEditorForm',
      'Caption=Grupa' + #13#10 +
      'BreakOnL.Caption=Warunek grupowania   ' + #13#10 +
      'OptionsL.Caption=Opcje   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'DataFieldRB.Caption=Pole danych' + #13#10 +
      'ExpressionRB.Caption=Wyra¿enie' + #13#10 +
      'KeepGroupTogetherCB.Caption=Nie dziel krótkich grupy na strony' + #13#10 +
      'StartNewPageCB.Caption=Rozpocznij od nowej strony' + #13#10 +
      'OutlineCB.Caption=Wyœwietl w oknie zak³adek' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=Kontrolka systemowa' + #13#10 +
      'DataBandL.Caption=Wstêga danych' + #13#10 +
      'DataSetL.Caption=ród³o danych' + #13#10 +
      'DataFieldL.Caption=Pole tabeli' + #13#10 +
      'FunctionL.Caption=Funkcja' + #13#10 +
      'ExpressionL.Caption=Wyra¿enie' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'AggregateRB.Caption=Wartoœæ ³¹czna' + #13#10 +
      'SysVariableRB.Caption=Wartoœæ systemowa' + #13#10 +
      'CountInvisibleCB.Caption=Zliczanie niewidocznych wstêg' + #13#10 +
      'TextRB.Caption=Tekst' + #13#10 +
      'RunningTotalCB.Caption=Suma ogólna' + #13#10 +
      'RunningTotalCB.Caption=Suma ogólna' + #13#10 +
      '');
    Add('agAggregate', 'Insert Aggregate');
    Add('agAggregate', 'Wstaw ³¹czn¹ wartoœæ');
    Add('vt1', '[DATE]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGES#]');
    Add('vt5', '[PAGE#] z [TOTALPAGES#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=Obiekt OLE' + #13#10 +
      'InsertB.Caption=Wstaw...' + #13#10 +
      'EditB.Caption=Edytuj...' + #13#10 +
      'CloseB.Caption=Zamknij' + #13#10 +
      '');
    Add('olStretched', 'Dopasowanie');

    Add('TfrxBarcodeEditorForm',
      'Caption=Edytor kodu kreskowego' + #13#10 +
      'CodeLbl.Caption=Kod' + #13#10 +
      'TypeLbl.Caption=Rodzaj kodu' + #13#10 +
      'ZoomLbl.Caption=Powiêkszenie:' + #13#10 +
      'OptionsLbl.Caption=Opcje   ' + #13#10 +
      'RotationLbl.Caption=Obrót   ' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CalcCheckSumCB.Caption=Suma kontrolna ' + #13#10 +
      'ViewTextCB.Caption=Text' + #13#10 +
      'Rotation0RB.Caption=0°' + #13#10 +
      'Rotation90RB.Caption=90°' + #13#10 +
      'Rotation180RB.Caption=180°' + #13#10 +
      'Rotation270RB.Caption=270°' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Suma kontrolna');
    Add('bcShowText', 'Poka¿ tekst');

    Add('TfrxAliasesEditorForm',
      'Caption=Edytor aliasów' + #13#10 +
      'HintL.Caption=Naciœnij Enter aby poprawiæ pozycjê' + #13#10 +
      'DSAliasL.Caption=Alias Ÿród³a danych' + #13#10 +
      'FieldAliasesL.Caption=Alias pola' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'ResetB.Caption=Reset' + #13#10 +
      'UpdateB.Caption=Update' + #13#10 +
      '');
    Add('alUserName', 'Nazwa u¿ytkownika');
    Add('alOriginal', 'Nazwa oryginalna');

    Add('TfrxParamsEditorForm',
      'Caption=Parameters Editor' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      '');
    Add('qpName', 'Nazwa');
    Add('qpDataType', 'Typ danych');
    Add('qpValue', 'Wartoœæ');

    Add('TfrxMDEditorForm',
      'Caption=Po³¹czenie g³ówne-szczegó³owe Ÿród³o' + #13#10 +
      'Label1.Caption=Pola szczeg.' + #13#10 +
      'Label2.Caption=Pola g³ównego' + #13#10 +
      'Label3.Caption=Pola powi¹zane' + #13#10 +
      'AddB.Caption=Dodaj' + #13#10 +
      'ClearB.Caption=Wyczyœæ' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=Memo' + #13#10 +
      'ExprB.Hint=Wstaw wyra¿enie' + #13#10 +
      'AggregateB.Hint=Wstaw wyliczenie' + #13#10 +
      'LocalFormatB.Hint=Wstaw formatowanie' + #13#10 +
      'WordWrapB.Hint=Przenoszenie wyrazów' + #13#10 +
      'CancelB.Hint=Anuluj' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=Obraz' + #13#10 +
      'LoadB.Hint=Wczytaj' + #13#10 +
      'CopyB.Hint=Kopiuj' + #13#10 +
      'PasteB.Hint=Wklej' + #13#10 +
      'ClearB.Hint=Wyczyœæ' + #13#10 +
      'CancelB.Hint=Anuluj' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('piEmpty', 'Pusty');

    Add('TfrxChartEditorForm',
      'Caption=Edytor wykresu' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=Dodaj seriê danych' + #13#10 +
      'DeleteB.Hint=Usuñ seriê danych' + #13#10 +
      'DBSourceRB.Caption=Dane z bazy danych' + #13#10 +
      'BandSourceRB.Caption=Dane ze wstêgi' + #13#10 +
      'FixedDataRB.Caption=Dane sta³e' + #13#10 +
      'DatasetLbl.Caption=ród³o danych' + #13#10 +
      'BandLbl.Caption=Wstêga danych' + #13#10 +
      'X1Lbl.Caption=Wartoœci X' + #13#10 +
      'Y1Lbl.Caption=Wartoœci Y' + #13#10 +
      'X2Lbl.Caption=Wartoœci X' + #13#10 +
      'Y2Lbl.Caption=Wartoœci Y' + #13#10 +
      'X3Lbl.Caption=Wartoœci X (np. a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Wartoœci Y (np. 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Inne opcje   ' + #13#10 +
      'ShowTopLbl.Caption=Pokazuj N pierwszych wartoœci' + #13#10 +
      'CaptionLbl.Caption=Opis' + #13#10 +
      'SortLbl.Caption=Rodzaj sortowania' + #13#10 +
      'LineMI.Caption=Liniowy' + #13#10 +
      'AreaMI.Caption=Powierzchniowy' + #13#10 +
      'PointMI.Caption=Punktowy' + #13#10 +
      'BarMI.Caption=S³upkowy' + #13#10 +
      'HorizBarMI.Caption=S³upkowy poziomy' + #13#10 +
      'PieMI.Caption=Ko³owy' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Fast Line' + #13#10 +
      '');
    Add('ch3D', 'Widok 3D');
    Add('chAxis', 'Pokazuj osie');
    Add('chsoNone', 'Brak');
    Add('chsoAscending', 'Rosn¹co');
    Add('chsoDescending', 'Malej¹co');

    Add('TfrxRichEditorForm',
      'Caption=Edytor obiektu Rich' + #13#10 +
      'OpenB.Hint=Otwórz plik' + #13#10 +
      'SaveB.Hint=Zapisz do pliku' + #13#10 +
      'UndoB.Hint=Cofnij' + #13#10 +
      'TTB.Hint=Czcionka' + #13#10 +
      'ExprB.Hint=Wstaw wyra¿enie' + #13#10 +
      'CancelB.Hint=Anuluj' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      'BoldB.Hint=Pogrubienie' + #13#10 +
      'ItalicB.Hint=Pochylenie' + #13#10 +
      'UnderlineB.Hint=Podkreœlenie' + #13#10 +
      'LeftAlignB.Hint=Wyrównanie do lewej' + #13#10 +
      'CenterAlignB.Hint=Centrowanie' + #13#10 +
      'RightAlignB.Hint=Wyrównanie do prawej' + #13#10 +
      'BlockAlignB.Hint=Justowanie' + #13#10 +
      'BulletsB.Hint=Wypunktowanie' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Edytor tabeli przestawnej' + #13#10 +
      'DatasetL.Caption=ród³o danych   ' + #13#10 +
      'DimensionsL.Caption=Wymiary   ' + #13#10 +
      'RowsL.Caption=Wiersze' + #13#10 +
      'ColumnsL.Caption=Kolumny' + #13#10 +
      'CellsL.Caption=Komórki' + #13#10 +
      'StructureL.Caption=Struktura tabeli przestawnej   ' + #13#10 +
      'RowHeaderCB.Caption=Nag³ówek wiersza' + #13#10 +
      'ColumnHeaderCB.Caption=Nag³ówek kolumny' + #13#10 +
      'RowTotalCB.Caption=Suma wiersza' + #13#10 +
      'ColumnTotalCB.Caption=Suma kolumny' + #13#10 +
      'SwapB.Hint=Zamiana wiersze/kolumny' + #13#10 +
      'StyleCB.Hint=Rodzaj tabeli przestawnej' + #13#10 +
      'FontB.Hint=Ustawienia czcionki' + #13#10 +
      'AlignLeftB.Hint=Wyrównanie do lewej' + #13#10 +
      'AlignCenterB.Hint=Centrowanie' + #13#10 +
      'AlignRightB.Hint=Wyrównanie do prawej' + #13#10 +
      'RotationB.Hint=Obrót tekstu' + #13#10 +
      'HighlightB.Hint=Wyró¿nienie' + #13#10 +
      'FormatB.Hint=Formatowanie wyœwietlania' + #13#10 +
      'FrameB.Hint=Ustawienia ramki' + #13#10 +
      'FillColorB.Hint=Kolor wype³nienia' + #13#10 +
      'Func1MI.Caption=Brak' + #13#10 +
      'Func2MI.Caption=Suma' + #13#10 +
      'Func3MI.Caption=Minimum' + #13#10 +
      'Func4MI.Caption=Maksimum' + #13#10 +
      'Func5MI.Caption=Œrednia' + #13#10 +
      'Func6MI.Caption=Licznik' + #13#10 +
      'Sort1MI.Caption=Rosn¹co (A-Z)' + #13#10 +
      'Sort2MI.Caption=Malej¹co (Z-A)' + #13#10 +
      'Sort3MI.Caption=Brak sortowania' + #13#10 +
      'BoldMI.Caption=Pogrubienie' + #13#10 +
      'ItalicMI.Caption=Pochylenie' + #13#10 +
      'UnderlineMI.Caption=Podkreœlenie' + #13#10 +
      'SuperScriptMI.Caption=Super skrypt' + #13#10 +
      'SubScriptMI.Caption=Podskrypt' + #13#10 +
      'CondensedMI.Caption=Zagêszczone' + #13#10 +
      'WideMI.Caption=Rozszerzone' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=Anuluj' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('crSubtotal', 'Podsumy');
    Add('crNone', 'Brak');
    Add('crSum', 'Sum');
    Add('crMin', 'Min');
    Add('crMax', 'Max');
    Add('crAvg', 'Œred');
    Add('crCount', 'Licz');
    Add('crAsc', 'A-Z');
    Add('crDesc', 'Z-A');
    Add('crRepHdrs', 'Powtórz nag³ówki');
    Add('crBorder', 'Obramowanie');
    Add('crDown', 'Drukuj kolumnami w dó³');

    Add('TfrxExprEditorForm',
      'Caption=Edytor wyra¿enia' + #13#10 +
      'ExprL.Caption=Wyra¿enie:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=Format wyœwietlania' + #13#10 +
      'CategoryL.Caption=Kategoria' + #13#10 +
      'FormatL.Caption=Format' + #13#10 +
      'FormatStrL.Caption=Maska formatowania:' + #13#10 +
      'SeparatorL.Caption=Separator dziesiêtny:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      '');
    Add('fkText', 'Tekst (nieformatowany)');
    Add('fkNumber', 'Liczbowe');
    Add('fkDateTime', 'Data/Czas');
    Add('fkBoolean', 'Logiczne');
    Add('fkNumber1', '1234.5;%g');
    Add('fkNumber2', '1234.50;%2.2f');
    Add('fkNumber3', '1,234.50;%2.2n');
    Add('fkNumber4', '$1,234.50;%2.2m');
    Add('fkDateTime1', '28.11.2002;dd.mm.yyyy');
    Add('fkDateTime2', '28 lis 2002;dd mmm yyyy');
    Add('fkDateTime3', '28 Listopad 2002;dd mmmm yyyy');
    Add('fkDateTime4', '02:14;hh:mm');
    Add('fkDateTime5', '02:14am;hh:mm am/pm');
    Add('fkDateTime6', '02:14:00;hh:mm:ss');
    Add('fkDateTime7', '28.11.2002 02:14;dd.mm.yyyy hh:mm');
    Add('fkBoolean1', '0,1;0,1');
    Add('fkBoolean2', 'Nie,Tak;Nie,Tak');
    Add('fkBoolean3', '_,x;_,x');
    Add('fkBoolean4', 'Fa³sz,Prawda;Fa³sz,Prawda');

    Add('TfrxHighlightEditorForm',
      'Caption=Wyró¿nienie' + #13#10 +
      'FontColorB.Caption=Kolor...' + #13#10 +
      'BackColorB.Caption=Kolor...' + #13#10 +
      'ConditionL.Caption=Warunek   ' + #13#10 +
      'FontL.Caption=Czcionka   ' + #13#10 +
      'BackgroundL.Caption=T³o   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'BoldCB.Caption=Pogrubienie' + #13#10 +
      'ItalicCB.Caption=Pochylenie' + #13#10 +
      'UnderlineCB.Caption=Podkreœlenie' + #13#10 +
      'TransparentRB.Caption=Przezroczystoœæ' + #13#10 +
      'OtherRB.Caption=Inne' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Ustawienia raportu' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'GeneralTS.Caption=Ogólne' + #13#10 +
      'ReportSettingsL.Caption=Ustawienia drukarki   ' + #13#10 +
      'CopiesL.Caption=Kopie' + #13#10 +
      'GeneralL.Caption=Ogólne   ' + #13#10 +
      'PasswordL.Caption=Has³o' + #13#10 +
      'CollateCB.Caption=srtowanie kopii' + #13#10 +
      'DoublePassCB.Caption=Podwójny przebieg' + #13#10 +
      'PrintIfEmptyCB.Caption=Drukuj jeœli pusty' + #13#10 +
      'DescriptionTS.Caption=Informacyjne' + #13#10 +
      'NameL.Caption=Name' + #13#10 +
      'Description1L.Caption=Opis' + #13#10 +
      'PictureL.Caption=Ikona raportu' + #13#10 +
      'AuthorL.Caption=Autor' + #13#10 +
      'MajorL.Caption=Nadrz.' + #13#10 +
      'MinorL.Caption=Podrz.' + #13#10 +
      'ReleaseL.Caption=Wydanie' + #13#10 +
      'BuildL.Caption=Kompil.' + #13#10 +
      'CreatedL.Caption=Utworzony' + #13#10 +
      'ModifiedL.Caption=Zmodyfikowany' + #13#10 +
      'DescriptionL.Caption=Opis   ' + #13#10 +
      'VersionL.Caption=Wersja   ' + #13#10 +
      'PictureB.Caption=Przegl¹daj...' + #13#10 +
      '');
    Add('rePrnOnPort', 'w³¹czony');

    Add('TfrxStringsEditorForm',
      'Caption=Linie' + #13#10 +
      'CancelB.Hint=Anuluj' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=Anuluj' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=Has³o' + #13#10 +
      'PasswordL.Caption=Podaj has³o:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption= Edytor Styli' + #13#10 +
      'ColorB.Caption=Kolor...' + #13#10 +
      'FontB.Caption=Czcionka...' + #13#10 +
      'FrameB.Caption=Ramka...' + #13#10 +
      'AddB.Hint=Dodaj' + #13#10 +
      'DeleteB.Hint=Usuñ' + #13#10 +
      'EditB.Hint=Edytuj' + #13#10 +
      'LoadB.Hint=Wczytaj' + #13#10 +
      'SaveB.Hint=Zapisz' + #13#10 +
      'CancelB.Hint=Anuluj' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=Edytor ramki' + #13#10 +
      'FrameL.Caption=Ramka' + #13#10 +
      'LineL.Caption=Linia ramki' + #13#10 +
      'ShadowL.Caption=Cieñ' + #13#10 +
      'FrameTopB.Hint=Górna linia' + #13#10 +
      'FrameBottomB.Hint=Dolna linia' + #13#10 +
      'FrameLeftB.Hint=Lewa linia' + #13#10 +
      'FrameRightB.Hint=Prawa linia' + #13#10 +
      'FrameAllB.Hint=Wszystkie linie' + #13#10 +
      'FrameNoB.Hint=Brak obramowania' + #13#10 +
      'FrameColorB.Hint=Kolor ramki' + #13#10 +
      'FrameStyleB.Hint=Rodzaj ramki' + #13#10 +
      'FrameWidthCB.Hint=Gruboœæ ramki' + #13#10 +
      'ShadowB.Hint=Cieñ' + #13#10 +
      'ShadowColorB.Hint=Kolor cienia' + #13#10 +
      'ShadowWidthCB.Hint=Szerokoœæ cienia' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=Nowa pozycja' + #13#10 +
      'ItemsTab.Caption=Pozycje' + #13#10 +
      'TemplatesTab.Caption=Przyk³ady' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Porz¹dek Tab' + #13#10 +
      'Label1.Caption=Lista elementów kontrolnych Tab:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'UpB.Caption=Przesuñ do góry' + #13#10 +
      'DownB.Caption=Przesuñ na dó³' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Wartoœæ obliczana' + #13#10 +
      'Label1.Caption=Wyra¿enie' + #13#10 +
      'Label2.Caption=Wynik' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Kreator raportu' + #13#10 +
      'DataTab.Caption=Dane' + #13#10 +
      'GroupsTab.Caption=Grupowanie' + #13#10 +
      'LayoutTab.Caption=Rozmieszczenie' + #13#10 +
      'StyleTab.Caption=Rodzaj raportu' + #13#10 +
      'Step1L.Caption=Krok 1. Wybierz Ÿrod³o danych i pola do wyœwietlenia.' + #13#10 +
      'Step2L.Caption=Krok 2. Utwórz grupy (opcjonalnie).' + #13#10 +
      'Step3L.Caption=Krok 3. Definiuj orientacjê strony i rozmieszczenie pól.' + #13#10 +
      'Step4L.Caption=Krok 4. Wybierz rodzaj raportu.' + #13#10 +
      'AddFieldB.Caption=Dodaj >' + #13#10 +
      'AddAllFieldsB.Caption=Dodaj wszystkie >>' + #13#10 +
      'RemoveFieldB.Caption=< Usuñ' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Usuñ wszystkie' + #13#10 +
      'AddGroupB.Caption=Dodaj >' + #13#10 +
      'RemoveGroupB.Caption=< Usuñ' + #13#10 +
      'SelectedFieldsL.Caption=Wybrane pola:' + #13#10 +
      'AvailableFieldsL.Caption=Dostêpne pola:' + #13#10 +
      'GroupsL.Caption=Grupy:' + #13#10 +
      'OrientationL.Caption=Orientacja strony   ' + #13#10 +
      'LayoutL.Caption=Rozmieszczenie pól   ' + #13#10 +
      'PortraitRB.Caption=Pionowa' + #13#10 +
      'LandscapeRB.Caption=Pozioma' + #13#10 +
      'TabularRB.Caption=Tabularyczny' + #13#10 +
      'ColumnarRB.Caption=Kolumnowy' + #13#10 +
      'FitWidthCB.Caption=Dopasuj pola do szerokoœci strony' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'BackB.Caption=<< Back' + #13#10 +
      'NextB.Caption=Next >>' + #13#10 +
      'FinishB.Caption=Finish' + #13#10 +
      '');
    Add('wzStd', 'Kreator raportu standardowego');
    Add('wzDMP', 'Kreator raportu dla drukarek ig³owych');
    Add('wzStdEmpty', 'Raport standardowy');
    Add('wzDMPEmpty', 'Raport dla drukarek ig³owych');


    Add('ftAllFiles', 'Wszystkie pliki');
    Add('ftPictures', 'Obrazy');
    Add('ftDB', 'Bazy danych');
    Add('ftRichFile', 'Dokument RichText');
    Add('ftTextFile', 'Dokument tekstowy');

    Add('prNotAssigned', '(Brak)');
    Add('prInvProp', 'Nieprawid³owa wartoœæ w³aœciowoœci');
    Add('prDupl', 'Nazwa jest ju¿ u¿yta');
    Add('prPict', '(Obraz)');

    Add('mvExpr', 'Zezwól na wyra¿enia');
    Add('mvStretch', 'Dopasuj');
    Add('mvStretchToMax', 'Dopasuj do maks.wysokoœci');
    Add('mvShift', 'Przesuñ');
    Add('mvShiftOver', 'Przesuñ jeœli siê nak³ada');
    Add('mvVisible', 'Widoczny');
    Add('mvPrintable', 'Dobry do druku');
    Add('mvFont', 'Czcionka...');
    Add('mvFormat', 'Format wyœwietlania...');
    Add('mvClear', 'Wyczyœæ zawartoœæ');
    Add('mvAutoWidth', 'Automatyczna szerokoœæ');
    Add('mvWWrap', 'Zawijaj wiersze');
    Add('mvSuppress', 'Ukryj powtarzaj¹ce siê wartoœci');
    Add('mvHideZ', 'Ukryj zera');
    Add('mvHTML', 'Zezwól na znaczniki HTML');
    Add('lvDiagonal', 'Skoœne');
    Add('pvAutoSize', 'Rozmiar automatyczny');
    Add('pvCenter', 'Centrowanie');
    Add('pvAspect', 'Zachowaj proporcje');
    Add('bvSplit', 'Zezwól na dzielenie');
    Add('bvKeepChild', 'W ca³oœci ze wstêgami powi¹zanymi');
    Add('bvPrintChild', 'Drukuj powi¹zane jeœli niewidoczne');
    Add('bvStartPage', 'Zacznij od nowej strony');
    Add('bvPrintIfEmpty', 'Drukuj jeœli szczegó³y puste');
    Add('bvKeepDetail', 'W ca³oœci ze wstêgami szczegó³ów');
    Add('bvKeepFooter', 'W ca³oœci ze stopk¹');
    Add('bvReprint', 'Powtórz na stronach');
    Add('bvOnFirst', 'Drukuj na pierwszej str.');
    Add('bvOnLast', 'Drukuj na ostatniej str.');
    Add('bvKeepGroup', 'W ca³oœci');
    Add('bvFooterAfterEach', 'Stopka po ka¿dym wierszu');
    Add('srParent', 'Drukuj w nadrzêdnym');
    Add('bvKeepHeader', 'W ca³oœci z nag³ówkiem');

    Add('obCatDraw', 'Rysuj');
    Add('obCatOther', 'Inne obiekty');
    Add('obCatOtherControls', 'Inne kontrolki');
    Add('obDiagLine', 'Linia skoœna');
    Add('obRect', 'Prostok¹t');
    Add('obRoundRect', 'Zaokr¹glony prostok¹t');
    Add('obEllipse', 'Elipsa');
    Add('obTrian', 'Trójk¹t');
    Add('obDiamond', 'Romb');
    Add('obLabel', 'Etykieta');
    Add('obEdit', 'Pole tekstowe');
    Add('obMemoC', 'Pole Memo');
    Add('obButton', 'Przycisk');
    Add('obChBoxC', 'Pole zaznaczenia');
    Add('obRButton', 'Pole wyboru');
    Add('obLBox', 'Lista');
    Add('obCBox', 'Lista rozwijana');
    Add('obDateEdit', 'Pole daty');
    Add('obImageC', 'Obraz');
    Add('obPanel', 'Panel');
    Add('obGrBox', 'Obszar grupy');
    Add('obBBtn', 'Przycisk modalny');
    Add('obSBtn', 'Przycisk (SpeedBtn)');
    Add('obMEdit', 'Pole maski');
    Add('obChLB', 'Lista wyboru');
    Add('obDBLookup', 'Lista wyszukiwania');
    Add('obBevel', 'P³aszczyzna');
    Add('obShape', 'Kszta³t');
    Add('obText', 'Tekst');
    Add('obSysText', 'Tekst systemowy');
    Add('obLine', 'Linia');
    Add('obPicture', 'Obraz');
    Add('obBand', 'Wstêga');
    Add('obDataBand', 'Wstêga danych');
    Add('obSubRep', 'Podraport');
    Add('obDlgPage', 'Okno dialogowe');
    Add('obRepPage', 'Strona raportu');
    Add('obReport', 'Raport');
    Add('obRich', 'Obiekt RichText');
    Add('obOLE', 'Obiekt OLE');
    Add('obChBox', 'Zaznaczenie');
    Add('obChart', 'Wykres');
    Add('obBarC', 'Kod kreskowy');
    Add('obCross', 'Tabela przestawna');
    Add('obDBCross', 'Tabela przestawna bazy danych');
    Add('obGrad', 'Cieniowanie');
    Add('obDMPText', 'Tekst-drukarka ig³owa');
    Add('obDMPLine', 'Linia-drukarka ig³owa');
    Add('obBDEDB', 'Baza BDE');
    Add('obBDETb', 'Tabela BDE');
    Add('obBDEQ', 'Zapytanie BDE');
    Add('obBDEComps', 'Komponenty BDE');
    Add('obIBXDB', 'Baza IBX');
    Add('obIBXTb', 'Tabela IBX');
    Add('obIBXQ', 'Zapytanie IBX');
    Add('obIBXComps', 'Komponenty IBX');
    Add('obADODB', 'Baza ADO');
    Add('obADOTb', 'Tabela ADO');
    Add('obADOQ', 'Zapytanie ADO');
    Add('obADOComps', 'Komponenty ADO');
    Add('obDBXDB', 'Baza DBX');
    Add('obDBXTb', 'Tabela DBX');
    Add('obDBXQ', 'Zapytanie DBX');
    Add('obDBXComps', 'Komponenty DBX');

    Add('ctString', 'Tekstowe');
    Add('ctDate', 'Data i czas');
    Add('ctConv', 'Konwersja');
    Add('ctFormat', 'Formatowanie');
    Add('ctMath', 'Matematyczne');
    Add('ctOther', 'Pozosta³e');

    Add('IntToStr', 'Zamiana wartoœci ca³kowitej na tekst');
    Add('FloatToStr', 'Zamiana liczby na tekst');
    Add('DateToStr', 'Zamiana daty na tekst');
    Add('TimeToStr', 'Zamiana czasu na tekst');
    Add('DateTimeToStr', 'Zamiana daty i czasu na tekst');
    Add('VarToStr', 'Zamiana zmiennej na tekst');
    Add('StrToInt', 'Zamiana tekstu na wartoœæ ca³kowit¹');
    Add('StrToFloat', 'Zamiana tekstu na liczbê zmiennoprzecinkow¹');
    Add('StrToDate', 'Zamiana tekstu na datê');
    Add('StrToTime', 'Zamiana tekstu na czas');
    Add('StrToDateTime', 'Zamiana tekstu na datê i czas');
    Add('Format', 'Zwraca sformatowany tekst z³o¿ony z z serii elementów tablicy');
    Add('FormatFloat', 'Formatuje wartoœæ zmiennoprzecinkow¹');
    Add('FormatDateTime', 'Formatuje wartoœæ daty i czasu');
    Add('FormatMaskText', 'Zwraca tekst sformatowany przy u¿yciu maski');
    Add('EncodeDate', 'Zwraca wartoœæ Daty i czasu (TDateTime) na podstawie roku, miesi¹ca i dnia');
    Add('DecodeDate', 'Zwraca rok, miesi¹c i dzieñ z podanej daty');
    Add('EncodeTime', 'Zwraca czas (TDateTime) na podstawie godzin, minut, sekund i milisekund');
    Add('DecodeTime', 'Zwraca godziny, minuty, sekundy i milisekundy z podanego czasu');
    Add('Date', 'Zwraca bie¿¹ca datê');
    Add('Time', 'Zwraca bie¿¹cy czas');
    Add('Now', 'Zwraca bie¿¹c¹ datê i czas');
    Add('DayOfWeek', 'Zwraca dzieñ tygodnia z podanej daty');
    Add('IsLeapYear', 'Wskazuje czy podany rok jest rokiem przestêpnym');
    Add('DaysInMonth', 'Zwraca iloœæ dni w podanym miesi¹cu');
    Add('Length', 'Zwraca d³ugoœæ tekstu');
    Add('Copy', 'Zwraca podci¹g z ci¹gu znaków');
    Add('Pos', 'Zwraca pozycjê wyst¹pienia podci¹gu w ci¹gu znaków');
    Add('Delete', 'Usuwa podci¹g z ci¹gu znaków');
    Add('Insert', 'Wstawia podci¹g do ci¹gu znaków');
    Add('Uppercase', 'Zamienia wszystkie litery w tekœcie na du¿e');
    Add('Lowercase', 'Zamienia wszystkie litery w tekœcie na ma³e');
    Add('Trim', 'Usuwa wszystkie spacje wiod¹ce i koñcowe z tekstu');
    Add('NameCase', 'Zamienia pierwszy znak w s³owie na du¿¹ literê');
    Add('CompareText', 'Porównuje dwa teksty');
    Add('Chr', 'Zamienia wartoœæ ca³kowit¹ na znak');
    Add('Ord', 'Zamienia znak na wartoœæ ca³kowit¹');
    Add('SetLength', 'Ustawia d³ugoœæ ci¹gu znaków');
    Add('Round', 'Zaokr¹gla liczbê zmiennoprzecinkow¹ do najbli¿szej wartoœci ca³kowitej');
    Add('Trunc', 'Zamienia liczbê zmiennoprzecinkow¹ na ca³kowit¹ odrzucaj¹c czêœæ u³amkow¹');
    Add('Int', 'Zwraca czêœæ ca³kowit¹ liczby rzeczywistej');
    Add('Frac', 'Zwraca czêœæ u³amkow¹ liczby rzeczywistej');
    Add('Sqrt', 'Zwraca pierwiastek kwadratowy z podanej liczby');
    Add('Abs', 'Zwraca wartoœæ bezwzglêdn¹ z podanej liczby');
    Add('Sin', 'Zwraca sinus k¹ta (w radianach)');
    Add('Cos', 'Zwraca cosinus k¹ta (w radianach)');
    Add('ArcTan', 'Zwraca arc tangens');
    Add('Tan', 'Zwraca tangens');
    Add('Exp', 'Funkcja wyk³adniczej');
    Add('Ln', 'Zwraca logarytm naturalny z wyra¿enia rzeczywistego');
    Add('Pi', 'Zwraca liczbê 3.1415926...');
    Add('Inc', 'Zwiêksza wartoœæ');
    Add('Dec', 'Zmniejsza wartoœæ');
    Add('RaiseException', 'Generuje wyj¹tek');
    Add('ShowMessage', 'Wyœwietla okno komunikatu');
    Add('Randomize', 'Startuje generator liczb pseudolosowych');
    Add('Random', 'Zwraca liczbê pseudolosow¹');
    Add('ValidInt', 'Zwraca prawdê je¿eli podany tekst zawiera prawid³ow¹ liczbê ca³kowit¹');
    Add('ValidFloat', 'Zwraca prawdê je¿eli podany tekst zawiera prawid³ow¹ liczbê');
    Add('ValidDate', 'Zwraca prawdê je¿eli podany tekst zawiera prawid³ow¹ datê');
    Add('IIF', 'Zwraca TrueValue jeœli podane wyra¿enie jest prawd¹, w przeciwnym wypadku zwraca FalseValue');
    Add('Get', 'Tylko do u¿ytku wewnêtrznego');
    Add('Set', 'Tylko do u¿ytku wewnêtrznego');
    Add('InputBox', 'Wyœwietla okno dialogowe do wprowadzania danych pozwalaj¹c u¿ytkownikowi na wprowadzenie tekstu');
    Add('InputQuery', 'Wyœwietla okno dialogowe do wprowadzania danych pozwalaj¹c u¿ytkownikowi na wprowadzenie tekstu');
    Add('MessageDlg', 'Wyœwietla okno komunikatu');
    Add('CreateOleObject', 'Tworzy obiekt OLE');
    Add('VarArrayCreate', 'Tworzy tablicê zmiennych');
    Add('VarType', 'Zwraca typ zmiennej');
    Add('DayOf', 'Zwraca numer dnia (1..31) na podstawie podanej daty');
    Add('MonthOf', 'Zwraca numer miesi¹ca (1..12) na podstawie podanej daty');
    Add('YearOf', 'Zwraca rok na podstawie podanej daty');

    Add('ctAggregate', '£¹czna wartoœæ');
    Add('Sum', 'Oblicza sumê wyra¿enia dla wierszy wstêgi');
    Add('Avg', 'Oblicza wartoœæ œredni¹ wyra¿enia dla wierszy wstêgi');
    Add('Min', 'Oblicza wartoœæ minimaln¹ wyra¿enia dla wierszy wstêgi');
    Add('Max', 'Oblicza wartoœæ maksymaln¹ wyra¿enia dla wierszy wstêgi');
    Add('Count', 'Oblicza iloœæ wierszy');
  end;
end;


initialization
  frAddDesignerRes;

end.