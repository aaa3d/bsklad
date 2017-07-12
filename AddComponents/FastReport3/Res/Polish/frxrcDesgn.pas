
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
      'Caption=Inspektor obiekt�w' + #13#10 +
      '');
    Add('oiProp', 'W�a�ciwo�ci');
    Add('oiEvent', 'Zdarzenia');

    Add('TfrxDataTreeForm',
      'Caption=Drzewo danych' + #13#10 +
      'DataTS.Caption=Dane' + #13#10 +
      'VariablesTS.Caption=Zmienne' + #13#10 +
      'FunctionsTS.Caption=Funkcje' + #13#10 +
      'InsFieldCB.Caption=Tw�rz pole' + #13#10 +
      'InsCaptionCB.Caption=Tw�rz opis' + #13#10 +
      '');
    Add('dtNoData', 'Dane niedost�pne');
    Add('dtData', 'Dane');
    Add('dtSysVar', 'Zmienne systemowe');
    Add('dtVar', 'Zmienne');
    Add('dtFunc', 'Funkcje');

    Add('TfrxReportTreeForm',
      'Caption=Drzewo raportu' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Otw�rz plik skryptu' + #13#10 +
      'SaveScriptB.Hint=Zapisz plik skryptu' + #13#10 +
      'RunScriptB.Hint=Uruchom skrypt' + #13#10 +
      'StepScriptB.Hint=Uruchom krokowo' + #13#10 +
      'StopScriptB.Hint=Przerwij wykonywanie skryptu' + #13#10 +
      'EvaluateB.Hint=Ustalenie warto�ci' + #13#10 +
      'LangL.Caption=J�zyk:' + #13#10 +
      'AlignTB.Caption=Po�o�enie' + #13#10 +
      'AlignLeftsB.Hint=Do lewej' + #13#10 +
      'AlignHorzCentersB.Hint=�rodek poziomo' + #13#10 +
      'AlignRightsB.Hint=Do prawej' + #13#10 +
      'AlignTopsB.Hint=U g�ry' + #13#10 +
      'AlignVertCentersB.Hint=�rodek pionowo' + #13#10 +
      'AlignBottomsB.Hint=Na dole' + #13#10 +
      'SpaceHorzB.Hint=Rozmie�� poziomo' + #13#10 +
      'SpaceVertB.Hint=Rozmie�� pionowo' + #13#10 +
      'CenterHorzB.Hint=Centruj poziomo na wst�dze' + #13#10 +
      'CenterVertB.Hint=Centruj pionowo na wst�dze' + #13#10 +
      'SameWidthB.Hint=Taka sama szeroko��' + #13#10 +
      'SameHeightB.Hint=Taka sama wysoko��' + #13#10 +
      'TextTB.Caption=Tekst' + #13#10 +
      'StyleCB.Hint=Styl' + #13#10 +
      'FontNameCB.Hint=Nazwa czcionki' + #13#10 +
      'FontSizeCB.Hint=Rozmiar czcionki' + #13#10 +
      'BoldB.Hint=Pogrubienie' + #13#10 +
      'ItalicB.Hint=Pochylenie' + #13#10 +
      'UnderlineB.Hint=Podkre�lenie' + #13#10 +
      'FontColorB.Hint=Kolor czcionki' + #13#10 +
      'HighlightB.Hint=Wyr�nienie' + #13#10 +
      'RotateB.Hint=Obr�t tekstu' + #13#10 +
      'TextAlignLeftB.Hint=Wyr�wnanie do lewej' + #13#10 +
      'TextAlignCenterB.Hint=Wy�rodkowanie poziome' + #13#10 +
      'TextAlignRightB.Hint=Wyr�wnanie do prawej' + #13#10 +
      'TextAlignBlockB.Hint=Justowanie' + #13#10 +
      'TextAlignTopB.Hint=Wyr�wnanie do g�ry' + #13#10 +
      'TextAlignMiddleB.Hint=Wy�rodkowanie pionowe' + #13#10 +
      'TextAlignBottomB.Hint=Wyr�wnanie do do�u' + #13#10 +
      'FrameTB.Caption=Ramka' + #13#10 +
      'FrameTopB.Hint=G�rna linia' + #13#10 +
      'FrameBottomB.Hint=Dolna linia' + #13#10 +
      'FrameLeftB.Hint=Lewa linia' + #13#10 +
      'FrameRightB.Hint=Prawa linia' + #13#10 +
      'FrameAllB.Hint=Wszystkie linie ramki' + #13#10 +
      'FrameNoB.Hint=Bez ramki' + #13#10 +
      'ShadowB.Hint=Cie�' + #13#10 +
      'FillColorB.Hint=Kolor t�a' + #13#10 +
      'FrameColorB.Hint=Kolor ramki' + #13#10 +
      'FrameStyleB.Hint=Styl ramki' + #13#10 +
      'FrameWidthCB.Hint=Grubo�� ramki' + #13#10 +
      'StandardTB.Caption=Standard' + #13#10 +
      'NewB.Hint=Nowy Raport' + #13#10 +
      'OpenB.Hint=Otw�rz Raport' + #13#10 +
      'SaveB.Hint=Zapisz Raport' + #13#10 +
      'PreviewB.Hint=Podgl�d' + #13#10 +
      'NewPageB.Hint=Nowa Strona Raportu' + #13#10 +
      'NewDialogB.Hint=Nowa Strona Dialogowa' + #13#10 +
      'DeletePageB.Hint=Usu� Stron�' + #13#10 +
      'PageSettingsB.Hint=Ustawienia Strony' + #13#10 +
      'VariablesB.Hint=Zmienne' + #13#10 +
      'CutB.Hint=Wytnij' + #13#10 +
      'CopyB.Hint=Kopiuj' + #13#10 +
      'PasteB.Hint=Wklej' + #13#10 +
      'SampleFormatB.Hint=Kopiuj formatowanie' + #13#10 +
      'UndoB.Hint=Cofnij' + #13#10 +
      'RedoB.Hint=Pon�w' + #13#10 +
      'GroupB.Hint=Grupuj' + #13#10 +
      'UngroupB.Hint=Rozgrupuj' + #13#10 +
      'ShowGridB.Hint=Poka� Siatk�' + #13#10 +
      'AlignToGridB.Hint=Przyci�gaj do siatki' + #13#10 +
      'SetToGridB.Hint=Wpasuj w siatk�' + #13#10 +
      'ScaleCB.Hint=Powi�kszenie' + #13#10 +
      'ExtraToolsTB.Caption=Dodatkowe narz�dzia' + #13#10 +
      'ObjectSelectB.Hint=Wska�nik' + #13#10 +
      'HandToolB.Hint=R�czka' + #13#10 +
      'ZoomToolB.Hint=Lupa' + #13#10 +
      'TextToolB.Hint=Edycja tekstu' + #13#10 +
      'FormatToolB.Hint=Kopiowanie formatu' + #13#10 +
      'ObjectBandB.Hint=Wstawianie wst�gi' + #13#10 +
      'FileMenu.Caption=&Plik' + #13#10 +
      'EditMenu.Caption=&Edycja' + #13#10 +
      'FindMI.Caption=Znajd�...' + #13#10 +
      'FindNextMI.Caption=Znajd� nast�pne' + #13#10 +
      'ReplaceMI.Caption=Zamie�...' + #13#10 +
      'ReportMenu.Caption=&Raport' + #13#10 +
      'ReportDataMI.Caption=Dane...' + #13#10 +
      'ReportSettingsMI.Caption=Opcje...' + #13#10 +
      'ReportStylesMI.Caption=Style...' + #13#10 +
      'ViewMenu.Caption=&Widok' + #13#10 +
      'ToolbarsMI.Caption=Paski narz�dzi' + #13#10 +
      'StandardMI.Caption=Standardowy' + #13#10 +
      'TextMI.Caption=Tekst' + #13#10 +
      'FrameMI.Caption=Ramka' + #13#10 +
      'AlignmentMI.Caption=Rozmieszczenie' + #13#10 +
      'ToolsMI.Caption=Dodatkowe narz�dzia' + #13#10 +
      'InspectorMI.Caption=Inspektor obiekt�w' + #13#10 +
      'DataTreeMI.Caption=Drzewo danych' + #13#10 +
      'ReportTreeMI.Caption=Drzewo raportu' + #13#10 +
      'ShowRulersMI.Caption=Linijki' + #13#10 +
      'ShowGuidesMI.Caption=Prowadnice' + #13#10 +
      'DeleteGuidesMI.Caption=Usu� prowadnice' + #13#10 +
      'OptionsMI.Caption=Opcje...' + #13#10 +
      'HelpMenu.Caption=&Pomoc' + #13#10 +
      'HelpContentsMI.Caption=Pomoc kontekstowa...' + #13#10 +
      'AboutMI.Caption=O FastReport...' + #13#10 +
      'TabOrderMI.Caption=Porz�dek tabulacji...' + #13#10 +
      'UndoCmd.Caption=Cofnij' + #13#10 +
      'RedoCmd.Caption=Pon�w' + #13#10 +
      'CutCmd.Caption=Wytnij' + #13#10 +
      'CopyCmd.Caption=Kopiuj' + #13#10 +
      'PasteCmd.Caption=Wklej' + #13#10 +
      'GroupCmd.Caption=Grupuj' + #13#10 +
      'UngroupCmd.Caption=Rozgrupuj' + #13#10 +
      'DeleteCmd.Caption=Usu�' + #13#10 +
      'DeletePageCmd.Caption=Usu� stron�' + #13#10 +
      'SelectAllCmd.Caption=Wybierz wszystko' + #13#10 +
      'EditCmd.Caption=Edytuj...' + #13#10 +
      'BringToFrontCmd.Caption=Przesu� na wierzch' + #13#10 +
      'SendToBackCmd.Caption=Schowaj pod sp�d' + #13#10 +
      'NewItemCmd.Caption=Nowy...' + #13#10 +
      'NewReportCmd.Caption=Nowy raport' + #13#10 +
      'NewPageCmd.Caption=Nowa strona' + #13#10 +
      'NewDialogCmd.Caption=Nowy dialog' + #13#10 +
      'OpenCmd.Caption=Otw�rz...' + #13#10 +
      'SaveCmd.Caption=Zapisz' + #13#10 +
      'SaveAsCmd.Caption=Zapisz jako...' + #13#10 +
      'VariablesCmd.Caption=Zmienne...' + #13#10 +
      'PageSettingsCmd.Caption=Ustawienia strony...' + #13#10 +
      'PreviewCmd.Caption=Podgl�d' + #13#10 +
      'ExitCmd.Caption=Wyj�cie' + #13#10 +
      'ReportTitleMI.Caption=Nag��wek raportu' + #13#10 +
      'ReportSummaryMI.Caption=Podsumowanie raportu' + #13#10 +
      'PageHeaderMI.Caption=Nag��wek strony' + #13#10 +
      'PageFooterMI.Caption=Stopka strony' + #13#10 +
      'HeaderMI.Caption=Nag��wek' + #13#10 +
      'FooterMI.Caption=Stopka' + #13#10 +
      'MasterDataMI.Caption=G��wne dane' + #13#10 +
      'DetailDataMI.Caption=Szczeg�owe dane' + #13#10 +
      'SubdetailDataMI.Caption=Szczeg�owe dane 3.poziom' + #13#10 +
      'Data4levelMI.Caption=Szczeg�owe dane 4.poziom' + #13#10 +
      'Data5levelMI.Caption=Szczeg�owe dane 5.poziom' + #13#10 +
      'Data6levelMI.Caption=Szczeg�owe dane 6.poziom' + #13#10 +
      'GroupHeaderMI.Caption=Nag��wek grupy' + #13#10 +
      'GroupFooterMI.Caption=Stopka grupy' + #13#10 +
      'ChildMI.Caption=Wst�ga podrz�dna' + #13#10 +
      'ColumnHeaderMI.Caption=Nag��wek kolumny' + #13#10 +
      'ColumnFooterMI.Caption=Stopka kolumny' + #13#10 +
      'OverlayMI.Caption=Nak�adka' + #13#10 +
      'VerticalbandsMI.Caption=Pionowe wst�gi' + #13#10 +
      'HeaderMI1.Caption=Nag��wek' + #13#10 +
      'FooterMI1.Caption=Stopka' + #13#10 +
      'MasterDataMI1.Caption=Gl�wne dane' + #13#10 +
      'DetailDataMI1.Caption=Szczeg�owe dane' + #13#10 +
      'SubdetailDataMI1.Caption=Szczeg�owe dane 3.poziom' + #13#10 +
      'GroupHeaderMI1.Caption=Nag��wek grupy' + #13#10 +
      'GroupFooterMI1.Caption=Stopka grupy' + #13#10 +
      'ChildMI1.Caption=Wst�ga podrz�dna' + #13#10 +
      'R0MI.Caption=0�' + #13#10 +
      'R45MI.Caption=45�' + #13#10 +
      'R90MI.Caption=90�' + #13#10 +
      'R180MI.Caption=180�' + #13#10 +
      'R270MI.Caption=270�' + #13#10 +
      'FontB.Hint=Ustawienia czcionki' + #13#10 +
      'BoldMI.Caption=Pogrubienie' + #13#10 +
      'ItalicMI.Caption=Pochylenie' + #13#10 +
      'UnderlineMI.Caption=Podkre�lenie' + #13#10 +
      'SuperScriptMI.Caption=Super Skrypt' + #13#10 +
      'SubScriptMI.Caption=Podskrypt' + #13#10 +
      'CondensedMI.Caption=Zag�szczone' + #13#10 +
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
    Add('dsSavePreviewChanges', 'Zapisz zmiany w przegl�danej stronie?');
    Add('dsSaveChangesTo', 'Zapisz zmiany do ');
    Add('dsCantLoad', 'Nie mo�na wczyta� pliku');
    Add('dsStyleFile', 'Styl');
    Add('dsCantFindProc', 'Nie mo�na znale�� g��wnej proc');
    Add('dsClearScript', 'Wszystkie kody zostan� usuni�te. Czy chcesz kontynuowa� ?');
    Add('dsNoStyle', 'Brak stylu');
    Add('dsStyleSample', 'Przyk�ad stylu');
    Add('dsTextNotFound', 'Tekst ''%s'' nie zosta� znaleziony');
    Add('dsReplace', 'Czy zamieni� to wyst�pienie ''%s''?');

    Add('TfrxAboutForm',
      'Caption=O FastReport' + #13#10 +
      'Label4.Caption=Wi�cej informacji na naszej stronie:' + #13#10 +
      'Label6.Caption=Sprzeda�:' + #13#10 +
      'Label8.Caption=Wsparcie:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Opcje strony' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'TabSheet1.Caption=Papier' + #13#10 +
      'Label1.Caption=Szeroko��' + #13#10 +
      'Label2.Caption=Wysoko��' + #13#10 +
      'Label11.Caption=Rozmiar   ' + #13#10 +
      'Label12.Caption=Orientacja   ' + #13#10 +
      'Label3.Caption=Lewy' + #13#10 +
      'Label4.Caption=G�rny' + #13#10 +
      'Label5.Caption=Prawy' + #13#10 +
      'Label6.Caption=Dolny' + #13#10 +
      'Label13.Caption=Marginesy   ' + #13#10 +
      'Label14.Caption=�r�d�o papieru   ' + #13#10 +
      'Label9.Caption=Pierwsza strona' + #13#10 +
      'Label10.Caption=Pozosta�e strony' + #13#10 +
      'PortraitRB.Caption=Pionowa' + #13#10 +
      'LandscapeRB.Caption=Pozioma' + #13#10 +
      'TabSheet3.Caption=Pozosta�e' + #13#10 +
      'Label7.Caption=Kolumny   ' + #13#10 +
      'Label8.Caption=Ilo��' + #13#10 +
      'Label15.Caption=Szeroko��' + #13#10 +
      'Label16.Caption=Pozycje' + #13#10 +
      'Label17.Caption=Inne   ' + #13#10 +
      'Label18.Caption=Duplex' + #13#10 +
      'PrintOnPrevCB.Caption=Drukuj do poprzedniej strony' + #13#10 +
      'MirrorMarginsCB.Caption=Marginesy lustrzane' + #13#10 +
      'LargeHeightCB.Caption=Du�a wysoko�� strony w trybie projektowania' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Wyb�r �r�de� danych raportu' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Edycja zmiennych' + #13#10 +
      'NewCategoryB.Caption=Kategoria' + #13#10 +
      'NewVarB.Caption=Zmienna' + #13#10 +
      'EditB.Caption=Edytuj' + #13#10 +
      'DeleteB.Caption=Usu�' + #13#10 +
      'EditListB.Caption=Lista' + #13#10 +
      'LoadB.Caption=Wczytaj' + #13#10 +
      'SaveB.Caption=Zapisz' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'ExprPanel.Caption= Wyra�enie:' + #13#10 +
      'OpenDialog1.Filter=S�ownik (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=S�ownik (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(brak zdefiniowanych zmiennych)');
    Add('vaVar', 'Zmienne');
    Add('vaDupName', 'Zmienna o tej nazwie ju� wyst�puje');

    Add('TfrxOptionsEditor',
      'Caption=Opcje konstruktora raport�w' + #13#10 +
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
      'Label12.Caption=Przerwa pomi�dzy wst�gami:' + #13#10 +
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
      'ShowGridCB.Caption=Pokazuj siatk�' + #13#10 +
      'AlignGridCB.Caption=Przyci�gaj do siatki' + #13#10 +
      'EditAfterInsCB.Caption=Wy�wietl edytor po dopisaniu' + #13#10 +
      'ObjectFontCB.Caption=U�yj ustawie� czcionki w obiektach' + #13#10 +
      'WorkspaceB.Caption=Okno konstruktora' + #13#10 +
      'ToolB.Caption=Okna narz�dziowe' + #13#10 +
      'LCDCB.Caption=Kolor siatki dla monitora LCD' + #13#10 +
      'FreeBandsCB.Caption=Dowolne rozmieszczanie wst�g' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Przywr�� domy�lne' + #13#10 +
      'BandsCaptionsCB.Caption=Wy�wietlanie opis�w wst�g' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=Wyb�r �r�d�a danych' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      '');
    Add('dbNotAssigned', '[brak �r�d�a]');
    Add('dbSingleLine', 'Pojedynczy wiersz');

    Add('TfrxGroupEditorForm',
      'Caption=Grupa' + #13#10 +
      'BreakOnL.Caption=Warunek grupowania   ' + #13#10 +
      'OptionsL.Caption=Opcje   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'DataFieldRB.Caption=Pole danych' + #13#10 +
      'ExpressionRB.Caption=Wyra�enie' + #13#10 +
      'KeepGroupTogetherCB.Caption=Nie dziel kr�tkich grupy na strony' + #13#10 +
      'StartNewPageCB.Caption=Rozpocznij od nowej strony' + #13#10 +
      'OutlineCB.Caption=Wy�wietl w oknie zak�adek' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=Kontrolka systemowa' + #13#10 +
      'DataBandL.Caption=Wst�ga danych' + #13#10 +
      'DataSetL.Caption=�r�d�o danych' + #13#10 +
      'DataFieldL.Caption=Pole tabeli' + #13#10 +
      'FunctionL.Caption=Funkcja' + #13#10 +
      'ExpressionL.Caption=Wyra�enie' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'AggregateRB.Caption=Warto�� ��czna' + #13#10 +
      'SysVariableRB.Caption=Warto�� systemowa' + #13#10 +
      'CountInvisibleCB.Caption=Zliczanie niewidocznych wst�g' + #13#10 +
      'TextRB.Caption=Tekst' + #13#10 +
      'RunningTotalCB.Caption=Suma og�lna' + #13#10 +
      'RunningTotalCB.Caption=Suma og�lna' + #13#10 +
      '');
    Add('agAggregate', 'Insert Aggregate');
    Add('agAggregate', 'Wstaw ��czn� warto��');
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
      'ZoomLbl.Caption=Powi�kszenie:' + #13#10 +
      'OptionsLbl.Caption=Opcje   ' + #13#10 +
      'RotationLbl.Caption=Obr�t   ' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CalcCheckSumCB.Caption=Suma kontrolna ' + #13#10 +
      'ViewTextCB.Caption=Text' + #13#10 +
      'Rotation0RB.Caption=0�' + #13#10 +
      'Rotation90RB.Caption=90�' + #13#10 +
      'Rotation180RB.Caption=180�' + #13#10 +
      'Rotation270RB.Caption=270�' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Suma kontrolna');
    Add('bcShowText', 'Poka� tekst');

    Add('TfrxAliasesEditorForm',
      'Caption=Edytor alias�w' + #13#10 +
      'HintL.Caption=Naci�nij Enter aby poprawi� pozycj�' + #13#10 +
      'DSAliasL.Caption=Alias �r�d�a danych' + #13#10 +
      'FieldAliasesL.Caption=Alias pola' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'ResetB.Caption=Reset' + #13#10 +
      'UpdateB.Caption=Update' + #13#10 +
      '');
    Add('alUserName', 'Nazwa u�ytkownika');
    Add('alOriginal', 'Nazwa oryginalna');

    Add('TfrxParamsEditorForm',
      'Caption=Parameters Editor' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      '');
    Add('qpName', 'Nazwa');
    Add('qpDataType', 'Typ danych');
    Add('qpValue', 'Warto��');

    Add('TfrxMDEditorForm',
      'Caption=Po��czenie g��wne-szczeg�owe �r�d�o' + #13#10 +
      'Label1.Caption=Pola szczeg.' + #13#10 +
      'Label2.Caption=Pola g��wnego' + #13#10 +
      'Label3.Caption=Pola powi�zane' + #13#10 +
      'AddB.Caption=Dodaj' + #13#10 +
      'ClearB.Caption=Wyczy��' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=Memo' + #13#10 +
      'ExprB.Hint=Wstaw wyra�enie' + #13#10 +
      'AggregateB.Hint=Wstaw wyliczenie' + #13#10 +
      'LocalFormatB.Hint=Wstaw formatowanie' + #13#10 +
      'WordWrapB.Hint=Przenoszenie wyraz�w' + #13#10 +
      'CancelB.Hint=Anuluj' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=Obraz' + #13#10 +
      'LoadB.Hint=Wczytaj' + #13#10 +
      'CopyB.Hint=Kopiuj' + #13#10 +
      'PasteB.Hint=Wklej' + #13#10 +
      'ClearB.Hint=Wyczy��' + #13#10 +
      'CancelB.Hint=Anuluj' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      '');
    Add('piEmpty', 'Pusty');

    Add('TfrxChartEditorForm',
      'Caption=Edytor wykresu' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=Dodaj seri� danych' + #13#10 +
      'DeleteB.Hint=Usu� seri� danych' + #13#10 +
      'DBSourceRB.Caption=Dane z bazy danych' + #13#10 +
      'BandSourceRB.Caption=Dane ze wst�gi' + #13#10 +
      'FixedDataRB.Caption=Dane sta�e' + #13#10 +
      'DatasetLbl.Caption=�r�d�o danych' + #13#10 +
      'BandLbl.Caption=Wst�ga danych' + #13#10 +
      'X1Lbl.Caption=Warto�ci X' + #13#10 +
      'Y1Lbl.Caption=Warto�ci Y' + #13#10 +
      'X2Lbl.Caption=Warto�ci X' + #13#10 +
      'Y2Lbl.Caption=Warto�ci Y' + #13#10 +
      'X3Lbl.Caption=Warto�ci X (np. a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Warto�ci Y (np. 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Inne opcje   ' + #13#10 +
      'ShowTopLbl.Caption=Pokazuj N pierwszych warto�ci' + #13#10 +
      'CaptionLbl.Caption=Opis' + #13#10 +
      'SortLbl.Caption=Rodzaj sortowania' + #13#10 +
      'LineMI.Caption=Liniowy' + #13#10 +
      'AreaMI.Caption=Powierzchniowy' + #13#10 +
      'PointMI.Caption=Punktowy' + #13#10 +
      'BarMI.Caption=S�upkowy' + #13#10 +
      'HorizBarMI.Caption=S�upkowy poziomy' + #13#10 +
      'PieMI.Caption=Ko�owy' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Fast Line' + #13#10 +
      '');
    Add('ch3D', 'Widok 3D');
    Add('chAxis', 'Pokazuj osie');
    Add('chsoNone', 'Brak');
    Add('chsoAscending', 'Rosn�co');
    Add('chsoDescending', 'Malej�co');

    Add('TfrxRichEditorForm',
      'Caption=Edytor obiektu Rich' + #13#10 +
      'OpenB.Hint=Otw�rz plik' + #13#10 +
      'SaveB.Hint=Zapisz do pliku' + #13#10 +
      'UndoB.Hint=Cofnij' + #13#10 +
      'TTB.Hint=Czcionka' + #13#10 +
      'ExprB.Hint=Wstaw wyra�enie' + #13#10 +
      'CancelB.Hint=Anuluj' + #13#10 +
      'OkB.Hint=OK' + #13#10 +
      'BoldB.Hint=Pogrubienie' + #13#10 +
      'ItalicB.Hint=Pochylenie' + #13#10 +
      'UnderlineB.Hint=Podkre�lenie' + #13#10 +
      'LeftAlignB.Hint=Wyr�wnanie do lewej' + #13#10 +
      'CenterAlignB.Hint=Centrowanie' + #13#10 +
      'RightAlignB.Hint=Wyr�wnanie do prawej' + #13#10 +
      'BlockAlignB.Hint=Justowanie' + #13#10 +
      'BulletsB.Hint=Wypunktowanie' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Edytor tabeli przestawnej' + #13#10 +
      'DatasetL.Caption=�r�d�o danych   ' + #13#10 +
      'DimensionsL.Caption=Wymiary   ' + #13#10 +
      'RowsL.Caption=Wiersze' + #13#10 +
      'ColumnsL.Caption=Kolumny' + #13#10 +
      'CellsL.Caption=Kom�rki' + #13#10 +
      'StructureL.Caption=Struktura tabeli przestawnej   ' + #13#10 +
      'RowHeaderCB.Caption=Nag��wek wiersza' + #13#10 +
      'ColumnHeaderCB.Caption=Nag��wek kolumny' + #13#10 +
      'RowTotalCB.Caption=Suma wiersza' + #13#10 +
      'ColumnTotalCB.Caption=Suma kolumny' + #13#10 +
      'SwapB.Hint=Zamiana wiersze/kolumny' + #13#10 +
      'StyleCB.Hint=Rodzaj tabeli przestawnej' + #13#10 +
      'FontB.Hint=Ustawienia czcionki' + #13#10 +
      'AlignLeftB.Hint=Wyr�wnanie do lewej' + #13#10 +
      'AlignCenterB.Hint=Centrowanie' + #13#10 +
      'AlignRightB.Hint=Wyr�wnanie do prawej' + #13#10 +
      'RotationB.Hint=Obr�t tekstu' + #13#10 +
      'HighlightB.Hint=Wyr�nienie' + #13#10 +
      'FormatB.Hint=Formatowanie wy�wietlania' + #13#10 +
      'FrameB.Hint=Ustawienia ramki' + #13#10 +
      'FillColorB.Hint=Kolor wype�nienia' + #13#10 +
      'Func1MI.Caption=Brak' + #13#10 +
      'Func2MI.Caption=Suma' + #13#10 +
      'Func3MI.Caption=Minimum' + #13#10 +
      'Func4MI.Caption=Maksimum' + #13#10 +
      'Func5MI.Caption=�rednia' + #13#10 +
      'Func6MI.Caption=Licznik' + #13#10 +
      'Sort1MI.Caption=Rosn�co (A-Z)' + #13#10 +
      'Sort2MI.Caption=Malej�co (Z-A)' + #13#10 +
      'Sort3MI.Caption=Brak sortowania' + #13#10 +
      'BoldMI.Caption=Pogrubienie' + #13#10 +
      'ItalicMI.Caption=Pochylenie' + #13#10 +
      'UnderlineMI.Caption=Podkre�lenie' + #13#10 +
      'SuperScriptMI.Caption=Super skrypt' + #13#10 +
      'SubScriptMI.Caption=Podskrypt' + #13#10 +
      'CondensedMI.Caption=Zag�szczone' + #13#10 +
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
    Add('crAvg', '�red');
    Add('crCount', 'Licz');
    Add('crAsc', 'A-Z');
    Add('crDesc', 'Z-A');
    Add('crRepHdrs', 'Powt�rz nag��wki');
    Add('crBorder', 'Obramowanie');
    Add('crDown', 'Drukuj kolumnami w d�');

    Add('TfrxExprEditorForm',
      'Caption=Edytor wyra�enia' + #13#10 +
      'ExprL.Caption=Wyra�enie:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=Format wy�wietlania' + #13#10 +
      'CategoryL.Caption=Kategoria' + #13#10 +
      'FormatL.Caption=Format' + #13#10 +
      'FormatStrL.Caption=Maska formatowania:' + #13#10 +
      'SeparatorL.Caption=Separator dziesi�tny:' + #13#10 +
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
    Add('fkBoolean4', 'Fa�sz,Prawda;Fa�sz,Prawda');

    Add('TfrxHighlightEditorForm',
      'Caption=Wyr�nienie' + #13#10 +
      'FontColorB.Caption=Kolor...' + #13#10 +
      'BackColorB.Caption=Kolor...' + #13#10 +
      'ConditionL.Caption=Warunek   ' + #13#10 +
      'FontL.Caption=Czcionka   ' + #13#10 +
      'BackgroundL.Caption=T�o   ' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'BoldCB.Caption=Pogrubienie' + #13#10 +
      'ItalicCB.Caption=Pochylenie' + #13#10 +
      'UnderlineCB.Caption=Podkre�lenie' + #13#10 +
      'TransparentRB.Caption=Przezroczysto��' + #13#10 +
      'OtherRB.Caption=Inne' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Ustawienia raportu' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'GeneralTS.Caption=Og�lne' + #13#10 +
      'ReportSettingsL.Caption=Ustawienia drukarki   ' + #13#10 +
      'CopiesL.Caption=Kopie' + #13#10 +
      'GeneralL.Caption=Og�lne   ' + #13#10 +
      'PasswordL.Caption=Has�o' + #13#10 +
      'CollateCB.Caption=srtowanie kopii' + #13#10 +
      'DoublePassCB.Caption=Podw�jny przebieg' + #13#10 +
      'PrintIfEmptyCB.Caption=Drukuj je�li pusty' + #13#10 +
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
      'PictureB.Caption=Przegl�daj...' + #13#10 +
      '');
    Add('rePrnOnPort', 'w��czony');

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
      'Caption=Has�o' + #13#10 +
      'PasswordL.Caption=Podaj has�o:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption= Edytor Styli' + #13#10 +
      'ColorB.Caption=Kolor...' + #13#10 +
      'FontB.Caption=Czcionka...' + #13#10 +
      'FrameB.Caption=Ramka...' + #13#10 +
      'AddB.Hint=Dodaj' + #13#10 +
      'DeleteB.Hint=Usu�' + #13#10 +
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
      'ShadowL.Caption=Cie�' + #13#10 +
      'FrameTopB.Hint=G�rna linia' + #13#10 +
      'FrameBottomB.Hint=Dolna linia' + #13#10 +
      'FrameLeftB.Hint=Lewa linia' + #13#10 +
      'FrameRightB.Hint=Prawa linia' + #13#10 +
      'FrameAllB.Hint=Wszystkie linie' + #13#10 +
      'FrameNoB.Hint=Brak obramowania' + #13#10 +
      'FrameColorB.Hint=Kolor ramki' + #13#10 +
      'FrameStyleB.Hint=Rodzaj ramki' + #13#10 +
      'FrameWidthCB.Hint=Grubo�� ramki' + #13#10 +
      'ShadowB.Hint=Cie�' + #13#10 +
      'ShadowColorB.Hint=Kolor cienia' + #13#10 +
      'ShadowWidthCB.Hint=Szeroko�� cienia' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=Nowa pozycja' + #13#10 +
      'ItemsTab.Caption=Pozycje' + #13#10 +
      'TemplatesTab.Caption=Przyk�ady' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Porz�dek Tab' + #13#10 +
      'Label1.Caption=Lista element�w kontrolnych Tab:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'UpB.Caption=Przesu� do g�ry' + #13#10 +
      'DownB.Caption=Przesu� na d�' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Warto�� obliczana' + #13#10 +
      'Label1.Caption=Wyra�enie' + #13#10 +
      'Label2.Caption=Wynik' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Kreator raportu' + #13#10 +
      'DataTab.Caption=Dane' + #13#10 +
      'GroupsTab.Caption=Grupowanie' + #13#10 +
      'LayoutTab.Caption=Rozmieszczenie' + #13#10 +
      'StyleTab.Caption=Rodzaj raportu' + #13#10 +
      'Step1L.Caption=Krok 1. Wybierz �rod�o danych i pola do wy�wietlenia.' + #13#10 +
      'Step2L.Caption=Krok 2. Utw�rz grupy (opcjonalnie).' + #13#10 +
      'Step3L.Caption=Krok 3. Definiuj orientacj� strony i rozmieszczenie p�l.' + #13#10 +
      'Step4L.Caption=Krok 4. Wybierz rodzaj raportu.' + #13#10 +
      'AddFieldB.Caption=Dodaj >' + #13#10 +
      'AddAllFieldsB.Caption=Dodaj wszystkie >>' + #13#10 +
      'RemoveFieldB.Caption=< Usu�' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Usu� wszystkie' + #13#10 +
      'AddGroupB.Caption=Dodaj >' + #13#10 +
      'RemoveGroupB.Caption=< Usu�' + #13#10 +
      'SelectedFieldsL.Caption=Wybrane pola:' + #13#10 +
      'AvailableFieldsL.Caption=Dost�pne pola:' + #13#10 +
      'GroupsL.Caption=Grupy:' + #13#10 +
      'OrientationL.Caption=Orientacja strony   ' + #13#10 +
      'LayoutL.Caption=Rozmieszczenie p�l   ' + #13#10 +
      'PortraitRB.Caption=Pionowa' + #13#10 +
      'LandscapeRB.Caption=Pozioma' + #13#10 +
      'TabularRB.Caption=Tabularyczny' + #13#10 +
      'ColumnarRB.Caption=Kolumnowy' + #13#10 +
      'FitWidthCB.Caption=Dopasuj pola do szeroko�ci strony' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'BackB.Caption=<< Back' + #13#10 +
      'NextB.Caption=Next >>' + #13#10 +
      'FinishB.Caption=Finish' + #13#10 +
      '');
    Add('wzStd', 'Kreator raportu standardowego');
    Add('wzDMP', 'Kreator raportu dla drukarek ig�owych');
    Add('wzStdEmpty', 'Raport standardowy');
    Add('wzDMPEmpty', 'Raport dla drukarek ig�owych');


    Add('ftAllFiles', 'Wszystkie pliki');
    Add('ftPictures', 'Obrazy');
    Add('ftDB', 'Bazy danych');
    Add('ftRichFile', 'Dokument RichText');
    Add('ftTextFile', 'Dokument tekstowy');

    Add('prNotAssigned', '(Brak)');
    Add('prInvProp', 'Nieprawid�owa warto�� w�a�ciowo�ci');
    Add('prDupl', 'Nazwa jest ju� u�yta');
    Add('prPict', '(Obraz)');

    Add('mvExpr', 'Zezw�l na wyra�enia');
    Add('mvStretch', 'Dopasuj');
    Add('mvStretchToMax', 'Dopasuj do maks.wysoko�ci');
    Add('mvShift', 'Przesu�');
    Add('mvShiftOver', 'Przesu� je�li si� nak�ada');
    Add('mvVisible', 'Widoczny');
    Add('mvPrintable', 'Dobry do druku');
    Add('mvFont', 'Czcionka...');
    Add('mvFormat', 'Format wy�wietlania...');
    Add('mvClear', 'Wyczy�� zawarto��');
    Add('mvAutoWidth', 'Automatyczna szeroko��');
    Add('mvWWrap', 'Zawijaj wiersze');
    Add('mvSuppress', 'Ukryj powtarzaj�ce si� warto�ci');
    Add('mvHideZ', 'Ukryj zera');
    Add('mvHTML', 'Zezw�l na znaczniki HTML');
    Add('lvDiagonal', 'Sko�ne');
    Add('pvAutoSize', 'Rozmiar automatyczny');
    Add('pvCenter', 'Centrowanie');
    Add('pvAspect', 'Zachowaj proporcje');
    Add('bvSplit', 'Zezw�l na dzielenie');
    Add('bvKeepChild', 'W ca�o�ci ze wst�gami powi�zanymi');
    Add('bvPrintChild', 'Drukuj powi�zane je�li niewidoczne');
    Add('bvStartPage', 'Zacznij od nowej strony');
    Add('bvPrintIfEmpty', 'Drukuj je�li szczeg�y puste');
    Add('bvKeepDetail', 'W ca�o�ci ze wst�gami szczeg��w');
    Add('bvKeepFooter', 'W ca�o�ci ze stopk�');
    Add('bvReprint', 'Powt�rz na stronach');
    Add('bvOnFirst', 'Drukuj na pierwszej str.');
    Add('bvOnLast', 'Drukuj na ostatniej str.');
    Add('bvKeepGroup', 'W ca�o�ci');
    Add('bvFooterAfterEach', 'Stopka po ka�dym wierszu');
    Add('srParent', 'Drukuj w nadrz�dnym');
    Add('bvKeepHeader', 'W ca�o�ci z nag��wkiem');

    Add('obCatDraw', 'Rysuj');
    Add('obCatOther', 'Inne obiekty');
    Add('obCatOtherControls', 'Inne kontrolki');
    Add('obDiagLine', 'Linia sko�na');
    Add('obRect', 'Prostok�t');
    Add('obRoundRect', 'Zaokr�glony prostok�t');
    Add('obEllipse', 'Elipsa');
    Add('obTrian', 'Tr�jk�t');
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
    Add('obBevel', 'P�aszczyzna');
    Add('obShape', 'Kszta�t');
    Add('obText', 'Tekst');
    Add('obSysText', 'Tekst systemowy');
    Add('obLine', 'Linia');
    Add('obPicture', 'Obraz');
    Add('obBand', 'Wst�ga');
    Add('obDataBand', 'Wst�ga danych');
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
    Add('obDMPText', 'Tekst-drukarka ig�owa');
    Add('obDMPLine', 'Linia-drukarka ig�owa');
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
    Add('ctOther', 'Pozosta�e');

    Add('IntToStr', 'Zamiana warto�ci ca�kowitej na tekst');
    Add('FloatToStr', 'Zamiana liczby na tekst');
    Add('DateToStr', 'Zamiana daty na tekst');
    Add('TimeToStr', 'Zamiana czasu na tekst');
    Add('DateTimeToStr', 'Zamiana daty i czasu na tekst');
    Add('VarToStr', 'Zamiana zmiennej na tekst');
    Add('StrToInt', 'Zamiana tekstu na warto�� ca�kowit�');
    Add('StrToFloat', 'Zamiana tekstu na liczb� zmiennoprzecinkow�');
    Add('StrToDate', 'Zamiana tekstu na dat�');
    Add('StrToTime', 'Zamiana tekstu na czas');
    Add('StrToDateTime', 'Zamiana tekstu na dat� i czas');
    Add('Format', 'Zwraca sformatowany tekst z�o�ony z z serii element�w tablicy');
    Add('FormatFloat', 'Formatuje warto�� zmiennoprzecinkow�');
    Add('FormatDateTime', 'Formatuje warto�� daty i czasu');
    Add('FormatMaskText', 'Zwraca tekst sformatowany przy u�yciu maski');
    Add('EncodeDate', 'Zwraca warto�� Daty i czasu (TDateTime) na podstawie roku, miesi�ca i dnia');
    Add('DecodeDate', 'Zwraca rok, miesi�c i dzie� z podanej daty');
    Add('EncodeTime', 'Zwraca czas (TDateTime) na podstawie godzin, minut, sekund i milisekund');
    Add('DecodeTime', 'Zwraca godziny, minuty, sekundy i milisekundy z podanego czasu');
    Add('Date', 'Zwraca bie��ca dat�');
    Add('Time', 'Zwraca bie��cy czas');
    Add('Now', 'Zwraca bie��c� dat� i czas');
    Add('DayOfWeek', 'Zwraca dzie� tygodnia z podanej daty');
    Add('IsLeapYear', 'Wskazuje czy podany rok jest rokiem przest�pnym');
    Add('DaysInMonth', 'Zwraca ilo�� dni w podanym miesi�cu');
    Add('Length', 'Zwraca d�ugo�� tekstu');
    Add('Copy', 'Zwraca podci�g z ci�gu znak�w');
    Add('Pos', 'Zwraca pozycj� wyst�pienia podci�gu w ci�gu znak�w');
    Add('Delete', 'Usuwa podci�g z ci�gu znak�w');
    Add('Insert', 'Wstawia podci�g do ci�gu znak�w');
    Add('Uppercase', 'Zamienia wszystkie litery w tek�cie na du�e');
    Add('Lowercase', 'Zamienia wszystkie litery w tek�cie na ma�e');
    Add('Trim', 'Usuwa wszystkie spacje wiod�ce i ko�cowe z tekstu');
    Add('NameCase', 'Zamienia pierwszy znak w s�owie na du�� liter�');
    Add('CompareText', 'Por�wnuje dwa teksty');
    Add('Chr', 'Zamienia warto�� ca�kowit� na znak');
    Add('Ord', 'Zamienia znak na warto�� ca�kowit�');
    Add('SetLength', 'Ustawia d�ugo�� ci�gu znak�w');
    Add('Round', 'Zaokr�gla liczb� zmiennoprzecinkow� do najbli�szej warto�ci ca�kowitej');
    Add('Trunc', 'Zamienia liczb� zmiennoprzecinkow� na ca�kowit� odrzucaj�c cz�� u�amkow�');
    Add('Int', 'Zwraca cz�� ca�kowit� liczby rzeczywistej');
    Add('Frac', 'Zwraca cz�� u�amkow� liczby rzeczywistej');
    Add('Sqrt', 'Zwraca pierwiastek kwadratowy z podanej liczby');
    Add('Abs', 'Zwraca warto�� bezwzgl�dn� z podanej liczby');
    Add('Sin', 'Zwraca sinus k�ta (w radianach)');
    Add('Cos', 'Zwraca cosinus k�ta (w radianach)');
    Add('ArcTan', 'Zwraca arc tangens');
    Add('Tan', 'Zwraca tangens');
    Add('Exp', 'Funkcja wyk�adniczej');
    Add('Ln', 'Zwraca logarytm naturalny z wyra�enia rzeczywistego');
    Add('Pi', 'Zwraca liczb� 3.1415926...');
    Add('Inc', 'Zwi�ksza warto��');
    Add('Dec', 'Zmniejsza warto��');
    Add('RaiseException', 'Generuje wyj�tek');
    Add('ShowMessage', 'Wy�wietla okno komunikatu');
    Add('Randomize', 'Startuje generator liczb pseudolosowych');
    Add('Random', 'Zwraca liczb� pseudolosow�');
    Add('ValidInt', 'Zwraca prawd� je�eli podany tekst zawiera prawid�ow� liczb� ca�kowit�');
    Add('ValidFloat', 'Zwraca prawd� je�eli podany tekst zawiera prawid�ow� liczb�');
    Add('ValidDate', 'Zwraca prawd� je�eli podany tekst zawiera prawid�ow� dat�');
    Add('IIF', 'Zwraca TrueValue je�li podane wyra�enie jest prawd�, w przeciwnym wypadku zwraca FalseValue');
    Add('Get', 'Tylko do u�ytku wewn�trznego');
    Add('Set', 'Tylko do u�ytku wewn�trznego');
    Add('InputBox', 'Wy�wietla okno dialogowe do wprowadzania danych pozwalaj�c u�ytkownikowi na wprowadzenie tekstu');
    Add('InputQuery', 'Wy�wietla okno dialogowe do wprowadzania danych pozwalaj�c u�ytkownikowi na wprowadzenie tekstu');
    Add('MessageDlg', 'Wy�wietla okno komunikatu');
    Add('CreateOleObject', 'Tworzy obiekt OLE');
    Add('VarArrayCreate', 'Tworzy tablic� zmiennych');
    Add('VarType', 'Zwraca typ zmiennej');
    Add('DayOf', 'Zwraca numer dnia (1..31) na podstawie podanej daty');
    Add('MonthOf', 'Zwraca numer miesi�ca (1..12) na podstawie podanej daty');
    Add('YearOf', 'Zwraca rok na podstawie podanej daty');

    Add('ctAggregate', '��czna warto��');
    Add('Sum', 'Oblicza sum� wyra�enia dla wierszy wst�gi');
    Add('Avg', 'Oblicza warto�� �redni� wyra�enia dla wierszy wst�gi');
    Add('Min', 'Oblicza warto�� minimaln� wyra�enia dla wierszy wst�gi');
    Add('Max', 'Oblicza warto�� maksymaln� wyra�enia dla wierszy wst�gi');
    Add('Count', 'Oblicza ilo�� wierszy');
  end;
end;


initialization
  frAddDesignerRes;

end.