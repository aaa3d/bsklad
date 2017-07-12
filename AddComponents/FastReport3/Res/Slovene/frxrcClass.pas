
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
      'Caption=Predogled' + #13#10 +
      'PrintB.Caption=Natisni' + #13#10 +
      'PrintB.Hint=Natisni' + #13#10 +
      'OpenB.Caption=Odpri' + #13#10 +
      'OpenB.Hint=Odpri' + #13#10 +
      'SaveB.Caption=Shrani' + #13#10 +
      'SaveB.Hint=Shrani' + #13#10 +
      'ExportB.Caption=Izvozi' + #13#10 +
      'ExportB.Hint=Izvozi' + #13#10 +
      'FindB.Caption=Najdi' + #13#10 +
      'FindB.Hint=Najdi' + #13#10 +
      'ZoomWholePageB.Caption=Celotna stran' + #13#10 +
      'ZoomWholePageB.Hint=Celotna stran' + #13#10 +
      'ZoomPageWidthB.Caption=Širina strani' + #13#10 +
      'ZoomPageWidthB.Hint=Širina strani' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=Dve strani' + #13#10 +
      'Zoom50B.Hint=Dve strani' + #13#10 +
      'ZoomCB.Hint=Zoom' + #13#10 +
      'PageSettingsB.Caption=Robovi' + #13#10 +
      'PageSettingsB.Hint=Robovi' + #13#10 +
      'OutlineB.Caption=Obris' + #13#10 +
      'OutlineB.Hint=Obris' + #13#10 +
      'HandToolB.Caption=Potegni' + #13#10 +
      'HandToolB.Hint=Potegni' + #13#10 +
      'ZoomToolB.Caption=Zoom' + #13#10 +
      'ZoomToolB.Hint=Zoom' + #13#10 +
      'NewPageB.Caption=Dodaj stran' + #13#10 +
      'NewPageB.Hint=Dodaj stran' + #13#10 +
      'DelPageB.Caption=Izbriši' + #13#10 +
      'DelPageB.Hint=Izbriši stran' + #13#10 +
      'DesignerB.Caption=Uredi' + #13#10 +
      'DesignerB.Hint=Uredi stran' + #13#10 +
      'FirstB.Caption=Prva' + #13#10 +
      'FirstB.Hint=Prva stran' + #13#10 +
      'PriorB.Caption=Prejšnja' + #13#10 +
      'PriorB.Hint=Prejšnja stran' + #13#10 +
      'NextB.Caption=Naslednja' + #13#10 +
      'NextB.Hint=Naslednja stran' + #13#10 +
      'LastB.Caption=Zadnja' + #13#10 +
      'LastB.Hint=Zadnja stran' + #13#10 +
      'CancelB.Caption=Zapri' + #13#10 +
      'PageE.Hint=št. strani' + #13#10 +
      '');
    Add('zmPageWidth', 'Širina strani');
    Add('zmWholePage', 'Celotna stran');

    Add('TfrxPrintDialog',
      'Caption=Print' + #13#10 +
      'Label12.Caption=Tiskalnik   ' + #13#10 +
      'DescrL.Caption=Vnesite številke in/ali obsege strani loèene z vejicami. Na primer: 1,3,5-12' + #13#10 +
      'Label1.Caption=Strani   ' + #13#10 +
      'CopiesL.Caption=Število kopij:' + #13#10 +
      'CollateL.Caption=Zbiranje kopij' + #13#10 +
      'Label2.Caption=Kopije   ' + #13#10 +
      'PrintL.Caption=Natisni' + #13#10 +
      'TypeL.Caption=Tip:' + #13#10 +
      'WhereL.Caption=Kam:' + #13#10 +
      'OkB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Preklièi' + #13#10 +
      'PropButton.Caption=Lastnosti...' + #13#10 +
      'AllRB.Caption=Vse' + #13#10 +
      'CurPageRB.Caption=Trenutna stran' + #13#10 +
      'PageNumbersRB.Caption=Strani:' + #13#10 +
      'FileCB.Caption=Natisni v datoteko' + #13#10 +
      'ReverseCB.Caption=Obrnjen vrstni red' + #13#10 +
      '');
    Add('ppAll', 'Vse strani');
    Add('ppOdd', 'Lihe strani');
    Add('ppEven', 'Sode strani');

    Add('TfrxSearchDialog',
      'Caption=Najdi besedilo' + #13#10 +
      'TextL.Caption=Iskano besedilo:' + #13#10 +
      'SearchL.Caption=Možnosti iskanja   ' + #13#10 +
      'ReplaceL.Caption=Zamenjaj z' + #13#10 +
      'TopCB.Caption=Išèi od zaèetka' + #13#10 +
      'CaseCB.Caption=Razlikuj velike in male' + #13#10 +
      'OkB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Preklièi' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Nastavitev strani' + #13#10 +
      'WidthL.Caption=Širina' + #13#10 +
      'HeightL.Caption=Višina' + #13#10 +
      'SizeL.Caption=Velikost   ' + #13#10 +
      'OrientationL.Caption=Usmerjenost   ' + #13#10 +
      'LeftL.Caption=Levo' + #13#10 +
      'TopL.Caption=Zgoraj' + #13#10 +
      'RightL.Caption=Desno' + #13#10 +
      'BottomL.Caption=Spodaj' + #13#10 +
      'MarginsL.Caption=Robovi   ' + #13#10 +
      'PortraitRB.Caption=Pokonèno' + #13#10 +
      'LandscapeRB.Caption=Ležeèe' + #13#10 +
      'cmL1.Caption=cm' + #13#10 +
      'cmL2.Caption=cm' + #13#10 +
      'cmL3.Caption=cm' + #13#10 +
      'cmL4.Caption=cm' + #13#10 +
      'cmL5.Caption=cm' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=V redu' + #13#10 +
      'CancelB.Caption=Preklièi' + #13#10 +
      'OtherL.Caption=Drugo   ' + #13#10 +
      'ApplyToCurRB.Caption=Dodeli trenutni strani' + #13#10 +
      'ApplyToAllRB.Caption=Dodeli vsem stranem' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Natisni' + #13#10 +
      'PrinterL.Caption=Tiskalnik   ' + #13#10 +
      'PagesL.Caption=Strani   ' + #13#10 +
      'CopiesL.Caption=Kopije   ' + #13#10 +
      'CopiesNL.Caption=Število kopij' + #13#10 +
      'DescrL.Caption=Vnesite številke in/ali obsege strani loèene z vejicami. Na primer: 1,3,5-12' + #13#10 +
      'OptionsL.Caption=Možnosti   ' + #13#10 +
      'EscL.Caption=Escape ukazi   ' + #13#10 +
      'OK.Caption=V redu' + #13#10 +
      'Cancel.Caption=Preklièi' + #13#10 +
      'SaveToFileCB.Caption=Natisni v datoteko' + #13#10 +
      'AllRB.Caption=Vse' + #13#10 +
      'CurPageRB.Caption=Trenutna stran' + #13#10 +
      'PageNumbersRB.Caption=Strani:' + #13#10 +
      'PageBreaksCB.Caption=Prelomi strani' + #13#10 +
      'OemCB.Caption=OEM kodna stran' + #13#10 +
      'PseudoCB.Caption=Pseudo grafika' + #13#10 +
      'SaveDialog1.Filter=Datoteka tiskalnika (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=preklièi' + #13#10 +
      '');

    Add('mbConfirm', 'Potrditev');
    Add('mbError', 'Napaka');
    Add('mbInfo', 'Informacija');
    Add('xrCantFindClass', 'Ne najdem class-a');
    Add('prVirtual', 'Virtualno');
    Add('prDefault', 'Privzeto');
    Add('prCustom', 'Po meri');
    Add('enUnconnHeader', 'Nepovezana glava/noga');
    Add('enUnconnGroup', 'Ni podatkovnega traku za grupo');
    Add('enUnconnGFooter', 'Ni glave grupe za');
    Add('enBandPos', 'Napaèen položaj traku:');
    Add('dbNotConn', 'DataSet %s ni povezan s podatki');
    Add('dbFldNotFound', 'Ne najdem polja:');
    Add('clDSNotIncl', '(dataset ni vkljuèen v Report.DataSets)');
    Add('clUnknownVar', 'Neznana spremenljivka ali podatkovno polje:');
    Add('clScrError', 'Napaka skripta pri %s: %s');
    Add('clDSNotExist', 'Dataset "%s" ne obstaja');
    Add('clErrors', 'Nastopila je(so) naslednja(e) napaka(e):');
    Add('clExprError', 'Napaka v izrazu');
    Add('clFP3files', 'Pripravljen izpis');
    Add('clSaving', 'Shranjevanje datoteke...');
    Add('clCancel', 'preklièi');
    Add('clClose', 'Zapri');
    Add('clPrinting', 'Tiskanje strani');
    Add('clLoading', 'Odpiranje datoteke...');
    Add('clPageOf', 'Stran %d od %d');
    Add('clFirstPass', 'Prvi prehod: stran ');
    Add('clNoPrinters', 'V vašem sistemu ni namešèenega nobenega tiskalnika');
    Add('clDecompressError', 'Napaka pri dekompresiji Stream-a');
    Add('crFillMx', 'Polnjenje cross-tab-a...');
    Add('crBuildMx', 'Izgradnja cross-tab-a...');

    Add('prRunningFirst', 'Prvi prehod: Stran %d');
    Add('prRunning', 'Pripravlja se stran %d');
    Add('prPrinting', 'Tiska se stran %d');
    Add('prExporting', 'Izvaža se stran %d');
    Add('uCm', 'cm');
    Add('uInch', 'pal');
    Add('uPix', 'tè');
    Add('uChar', 'zn');
  end;
end;


initialization
  frAddClassesRes;

end.
