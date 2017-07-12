
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

unit frxrcClass;

interface

procedure frAddClassesRes;


implementation

uses frxRes;


procedure frAddClassesRes;
begin
  with frxResources do
  begin
    Add('TfrxPreviewForm',
      'Caption=Podglπd' + #13#10 +
      'PrintB.Caption=Wydruk' + #13#10 +
      'PrintB.Hint=Wydruk' + #13#10 +
      'OpenB.Caption=OtwÛrz' + #13#10 +
      'OpenB.Hint=OtwÛrz' + #13#10 +
      'SaveB.Caption=Zapisz' + #13#10 +
      'SaveB.Hint=Zapisz' + #13#10 +
      'ExportB.Caption=Eksport' + #13#10 +
      'ExportB.Hint=Eksport' + #13#10 +
      'FindB.Caption=Znajdü' + #13#10 +
      'FindB.Hint=Znajdü' + #13#10 +
      'ZoomWholePageB.Caption=Ca≥a strona' + #13#10 +
      'ZoomWholePageB.Hint=Ca≥a strona' + #13#10 +
      'ZoomPageWidthB.Caption=SzerokoúÊ strony' + #13#10 +
      'ZoomPageWidthB.Hint=SzerokoúÊ strony' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=Dwie strony' + #13#10 +
      'Zoom50B.Hint=Dwie strony' + #13#10 +
      'ZoomCB.Hint=PowiÍkszenie' + #13#10 +
      'PageSettingsB.Caption=Marginesy' + #13#10 +
      'PageSettingsB.Hint=Marginesy' + #13#10 +
      'OutlineB.Caption=Zak≥adki' + #13#10 +
      'OutlineB.Hint=Zak≥adki' + #13#10 +
      'HandToolB.Caption=Przesuwanie strony' + #13#10 +
      'HandToolB.Hint=NarzÍdzie do przesuwania' + #13#10 +
      'ZoomToolB.Caption=PowiÍkszenie' + #13#10 +
      'ZoomToolB.Hint=NarzÍdzie do powiÍkszania' + #13#10 +
      'NewPageB.Caption=Dodaj stronÍ' + #13#10 +
      'NewPageB.Hint=Dodaj stronÍ' + #13#10 +
      'DelPageB.Caption=UsuÒ' + #13#10 +
      'DelPageB.Hint=UsuÒ stronÍ' + #13#10 +
      'DesignerB.Caption=Edycja' + #13#10 +
      'DesignerB.Hint=Edycja strony' + #13#10 +
      'FirstB.Caption=Poczπtek' + #13#10 +
      'FirstB.Hint=Pierwsza strona' + #13#10 +
      'PriorB.Caption=Poprzednia' + #13#10 +
      'PriorB.Hint=Poprzednia strona' + #13#10 +
      'NextB.Caption=NastÍpna' + #13#10 +
      'NextB.Hint=NastÍpna strona' + #13#10 +
      'LastB.Caption=Koniec' + #13#10 +
      'LastB.Hint=Ostatnia strona' + #13#10 +
      'CancelB.Caption=Zamknij' + #13#10 +
      'PageE.Hint=Numer strony' + #13#10 +
      '');
    Add('zmPageWidth', 'SzerokoúÊ strony');
    Add('zmWholePage', 'Ca≥a strona');

    Add('TfrxPrintDialog',
      'Caption=Drukuj' + #13#10 +
      'Label12.Caption=Drukarka   ' + #13#10 +
      'DescrL.Caption=Podaj numer strony i/lub zakres stron, oddzielone przecinkami, np.1,3,5-12' + #13#10 +
      'Label1.Caption=Strony   ' + #13#10 +
      'CopiesL.Caption=IloúÊ kopii' + #13#10 +
      'CollateL.Caption=Sortowanie' + #13#10 +
      'Label2.Caption=Kopie   ' + #13#10 +
      'PrintL.Caption=Drukuj' + #13#10 +
      'TypeL.Caption=Nazwa:' + #13#10 +
      'WhereL.Caption=åcieøka:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'PropButton.Caption=W≥aúciwoúci...' + #13#10 +
      'AllRB.Caption=Wszystko' + #13#10 +
      'CurPageRB.Caption=Aktualna strona' + #13#10 +
      'PageNumbersRB.Caption=Strony:' + #13#10 +
      'FileCB.Caption=Drukuj do pliku' + #13#10 +
      'ReverseCB.Caption=Drukuj od ostatniej' + #13#10 +
      '');
    Add('ppAll', 'Wszystkie strony');
    Add('ppOdd', 'Nieparzyste');
    Add('ppEven', 'Parzyste');

    Add('TfrxSearchDialog',
      'Caption=Wyszukiwanie tekstu' + #13#10 +
      'TextL.Caption=Wyszukiwany tekst:' + #13#10 +
      'SearchL.Caption=Opcje wyszukiwania   ' + #13#10 +
      'ReplaceL.Caption=ZamieÒ na' + #13#10 +
      'TopCB.Caption=Szukaj od poczπtku' + #13#10 +
      'CaseCB.Caption=RozrÛøniaj wielkoúÊ liter' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Ustawienia strony' + #13#10 +
      'WidthL.Caption=SzerokoúÊ' + #13#10 +
      'HeightL.Caption=WysokoúÊ' + #13#10 +
      'SizeL.Caption=Rozmiar   ' + #13#10 +
      'OrientationL.Caption=Orientacja   ' + #13#10 +
      'LeftL.Caption=Lewy' + #13#10 +
      'TopL.Caption=GÛrny' + #13#10 +
      'RightL.Caption=Prawy' + #13#10 +
      'BottomL.Caption=Dolny' + #13#10 +
      'MarginsL.Caption=Marginesy   ' + #13#10 +
      'PortraitRB.Caption=Pionowa' + #13#10 +
      'LandscapeRB.Caption=Pozioma' + #13#10 +
      'cmL1.Caption=cm' + #13#10 +
      'cmL2.Caption=cm' + #13#10 +
      'cmL3.Caption=cm' + #13#10 +
      'cmL4.Caption=cm' + #13#10 +
      'cmL5.Caption=cm' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuluj' + #13#10 +
      'OtherL.Caption=Inne   ' + #13#10 +
      'ApplyToCurRB.Caption=Zastosuj do bieøπcej strony' + #13#10 +
      'ApplyToAllRB.Caption=Zastosuj do wszystkich stron' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Wydruk' + #13#10 +
      'PrinterL.Caption=Drukarka   ' + #13#10 +
      'PagesL.Caption=Strony   ' + #13#10 +
      'CopiesL.Caption=Kopie   ' + #13#10 +
      'CopiesNL.Caption=IloúÊ kopii' + #13#10 +
      'DescrL.Caption=Podaj numer strony i/lub zakres stron, oddzielone przecinkami, np.1,3,5-12' + #13#10 +
      'OptionsL.Caption=Opcje   ' + #13#10 +
      'EscL.Caption=Polecenia ESC   ' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Anuluj' + #13#10 +
      'SaveToFileCB.Caption=Drukuj do pliku' + #13#10 +
      'AllRB.Caption=Wszystko' + #13#10 +
      'CurPageRB.Caption=Bieøπca strona' + #13#10 +
      'PageNumbersRB.Caption=Strony:' + #13#10 +
      'PageBreaksCB.Caption=Dzielenie stron' + #13#10 +
      'OemCB.Caption=Strona kodowa OEM' + #13#10 +
      'PseudoCB.Caption=Symulowanie grafiki' + #13#10 +
      'SaveDialog1.Filter=Plik drukarki (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Anuluj' + #13#10 +
      '');

    Add('mbConfirm', 'Zapytanie');
    Add('mbError', 'B≥πd');
    Add('mbInfo', 'Informacja');
    Add('xrCantFindClass', 'Nie znaleziono klasy');
    Add('prVirtual', 'Wirtualny');
    Add('prDefault', 'Domyúlny');
    Add('prCustom', 'Uøytkownika');
    Add('enUnconnHeader', 'Niepo≥πczony nag≥Ûwek/stopka');
    Add('enUnconnGroup', 'Brak wstÍgi danych dla grupy');
    Add('enUnconnGFooter', 'Brak nag≥Ûwka grupy dla');
    Add('enBandPos', 'Nieprawid≥owa pozycja wstÍgi:');
    Add('dbNotConn', 'èrÛd≥o %s jest niepod≥πczone');
    Add('dbFldNotFound', 'Nieznaleziono pola:');
    Add('clDSNotIncl', '(èrÛd≥o jest nie do≥πczone do Report.DataSets)');
    Add('clUnknownVar', 'Nieznana zmienna lub pole danych:');
    Add('clScrError', 'B≥πd wykonania skryptu w %s: %s');
    Add('clDSNotExist', 'èrÛd≥o "%s" nie istnieje');
    Add('clErrors', 'Pojawi≥ siÍ nastÍpujπcy b≥πd(y):');
    Add('clExprError', 'B≥πd w wyraøeniu');
    Add('clFP3files', 'Tworzenie raportu');
    Add('clSaving', 'Zapisywanie pliku...');
    Add('clCancel', 'Anuluj');
    Add('clClose', 'Zamknij');
    Add('clPrinting', 'Drukowanie strony');
    Add('clLoading', '£adowanie pliku...');
    Add('clPageOf', 'Strona %d z %d');
    Add('clFirstPass', 'Pierwszy przebieg: strona ');
    Add('clNoPrinters', 'Brak zainstalowanych drukarek w systemie');
    Add('clDecompressError', 'B≥πd wypakowania strumienia');
    Add('crFillMx', 'Wype≥nianie tabeli przestawnej...');
    Add('crBuildMx', 'Tworzenie tabeli przestawnej...');

    Add('prRunningFirst', 'Pierwszy przebieg: strona %d');
    Add('prRunning', 'Tworzenie strony %d');
    Add('prPrinting', 'Drukowanie strony %d');
    Add('prExporting', 'Eksportowanie strony %d');
    Add('uCm', 'cm');
    Add('uInch', 'in');
    Add('uPix', 'px');
    Add('uChar', 'zn');
  end;
end;


initialization
  frAddClassesRes;

end.