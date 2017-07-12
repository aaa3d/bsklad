
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
      'Caption=Elõkép' + #13#10 +
      'PrintB.Caption=Nyomtat' + #13#10 +
      'PrintB.Hint=Nyomtat' + #13#10 +
      'OpenB.Caption=Megnyit' + #13#10 +
      'OpenB.Hint=Megnyit' + #13#10 +
      'SaveB.Caption=Ment' + #13#10 +
      'SaveB.Hint=Ment' + #13#10 +
      'ExportB.Caption=Exportál' + #13#10 +
      'ExportB.Hint=Exportál' + #13#10 +
      'FindB.Caption=Keres' + #13#10 +
      'FindB.Hint=Keres' + #13#10 +
      'ZoomWholePageB.Caption=Teljes oldal' + #13#10 +
      'ZoomWholePageB.Hint=Teljes oldal' + #13#10 +
      'ZoomPageWidthB.Caption=Oldalszélesség' + #13#10 +
      'ZoomPageWidthB.Hint=Oldalszélesség' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=Két oldal' + #13#10 +
      'Zoom50B.Hint=Két oldal' + #13#10 +
      'ZoomCB.Hint=Nagyít' + #13#10 +
      'PageSettingsB.Caption=Margók' + #13#10 +
      'PageSettingsB.Hint=Margók' + #13#10 +
      'OutlineB.Caption=Körvonal' + #13#10 +
      'OutlineB.Hint=Körvonal' + #13#10 +
      'HandToolB.Caption=Húz' + #13#10 +
      'HandToolB.Hint=Húzó eszköz' + #13#10 +
      'ZoomToolB.Caption=Nagyít' + #13#10 +
      'ZoomToolB.Hint=Nagyító' + #13#10 +
      'NewPageB.Caption=Lapot hozzáad' + #13#10 +
      'NewPageB.Hint=Lapot hozzáad' + #13#10 +
      'DelPageB.Caption=Töröl' + #13#10 +
      'DelPageB.Hint=Lapot törli' + #13#10 +
      'DesignerB.Caption=Szerkeszt' + #13#10 +
      'DesignerB.Hint=Lapot szerkeszt' + #13#10 +
      'FirstB.Caption=Elsõ' + #13#10 +
      'FirstB.Hint=Elsõ oldal' + #13#10 +
      'PriorB.Caption=Elõzõ' + #13#10 +
      'PriorB.Hint=Elõzõ oldal' + #13#10 +
      'NextB.Caption=Következõ' + #13#10 +
      'NextB.Hint=Következõ oldal' + #13#10 +
      'LastB.Caption=Utolsó' + #13#10 +
      'LastB.Hint=Utolsó oldal' + #13#10 +
      'CancelB.Caption=Bezár' + #13#10 +
      'PageE.Hint=Oldalszám' + #13#10 +
      '');
    Add('zmPageWidth', 'Oldal széles');
    Add('zmWholePage', 'Teljes oldal');

    Add('TfrxPrintDialog',
      'Caption=Nyomtat' + #13#10 +
      'Label12.Caption=Nyomtató  ' + #13#10 +
      'DescrL.Caption=Adjon meg oldalszámokat vagy tartományokat, vesszõvel elválasztva. Például 1,3,5-12' + #13#10 +
      'Label1.Caption=Oldalak ' + #13#10 +
      'CopiesL.Caption=Másolatok száma' + #13#10 +
      'CollateL.Caption=Gyûjt' + #13#10 +
      'Label2.Caption=Másolatok' + #13#10 +
      'PrintL.Caption=Nyomtat' + #13#10 +
      'TypeL.Caption=Típus:' + #13#10 +
      'WhereL.Caption=Hol:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      'PropButton.Caption=Tulajdonságok...' + #13#10 +
      'AllRB.Caption=Mind' + #13#10 +
      'CurPageRB.Caption=Jelenlegi oldal' + #13#10 +
      'PageNumbersRB.Caption=Oldalak:' + #13#10 +
      'FileCB.Caption=Fájlba nyomtat' + #13#10 +
      'ReverseCB.Caption=Fordított sorrendben' + #13#10 +
      '');
    Add('ppAll', 'Minden oldal');
    Add('ppOdd', 'Páratlan oldalak');
    Add('ppEven', 'Páros oldalak');

    Add('TfrxSearchDialog',
      'Caption=Szövegkeresõ' + #13#10 +
      'TextL.Caption=Keresendõ szöveg:' + #13#10 +
      'SearchL.Caption=Keresési opciók  ' + #13#10 +
      'ReplaceL.Caption=Replace with' + #13#10 +
      'TopCB.Caption=Elölrõl keres' + #13#10 +
      'CaseCB.Caption=Kis-, nagybetûérzékenyen' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Oldalbeállítás' + #13#10 +
      'WidthL.Caption=Szélesség' + #13#10 +
      'HeightL.Caption=Magasság' + #13#10 +
      'SizeL.Caption=Méret  ' + #13#10 +
      'OrientationL.Caption=Irány         ' + #13#10 +
      'LeftL.Caption=Bal' + #13#10 +
      'TopL.Caption=Felül' + #13#10 +
      'RightL.Caption=Jobb' + #13#10 +
      'BottomL.Caption=Lent' + #13#10 +
      'MarginsL.Caption=Margók    ' + #13#10 +
      'PortraitRB.Caption=Portré' + #13#10 +
      'LandscapeRB.Caption=Tájkép' + #13#10 +
      'cmL1.Caption=cm' + #13#10 +
      'cmL2.Caption=cm' + #13#10 +
      'cmL3.Caption=cm' + #13#10 +
      'cmL4.Caption=cm' + #13#10 +
      'cmL5.Caption=cm' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Mégsem' + #13#10 +
      'OtherL.Caption=Egyéb   ' + #13#10 +
      'ApplyToCurRB.Caption=Jelenlegi lapra alkalmaz' + #13#10 +
      'ApplyToAllRB.Caption=Minden lapra alkalmaz' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Nyomtat' + #13#10 +
      'PrinterL.Caption=Nyomtató  ' + #13#10 +
      'PagesL.Caption=Oldalak ' + #13#10 +
      'CopiesL.Caption=Másolatok' + #13#10 +
      'CopiesNL.Caption=Másolatok száma ' + #13#10 +
      'DescrL.Caption=Adjon meg oldalszámokat vagy tartományokat, vesszõvel elválasztva. Például 1,3,5-12' + #13#10 +
      'OptionsL.Caption=Opciók    ' + #13#10 +
      'EscL.Caption=Escape kódok      ' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Mégsem' + #13#10 +
      'SaveToFileCB.Caption=Fájlba nyomtat' + #13#10 +
      'AllRB.Caption=Mind' + #13#10 +
      'CurPageRB.Caption=Jelenelgi oldal' + #13#10 +
      'PageNumbersRB.Caption=Oldalak:' + #13#10 +
      'PageBreaksCB.Caption=Oldaltörések' + #13#10 +
      'OemCB.Caption=OEM kódlap' + #13#10 +
      'PseudoCB.Caption=Grafikus' + #13#10 +
      'SaveDialog1.Filter=Nyomtatófájl (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Mégsem' + #13#10 +
      '');

    Add('mbConfirm', 'Megerõsít');
    Add('mbError', 'Hiba');
    Add('mbInfo', 'Információ');
    Add('xrCantFindClass', 'Nem találom az osztályt');
    Add('prVirtual', 'Virtuális');
    Add('prDefault', 'Alapértelmezett');
    Add('prCustom', 'Egyéni');
    Add('enUnconnHeader', 'Független fej-, lábléc');
    Add('enUnconnGroup', 'A csoportnak nincs adatsávja');
    Add('enUnconnGFooter', 'Nincs fejléc ');
    Add('enBandPos', 'Hibás sávpozició:');
    Add('dbNotConn', '%s DataSet nincs adathoz csatlakoztatva');
    Add('dbFldNotFound', 'Nincs ilyen mezõ:');
    Add('clDSNotIncl', '(adatkészlet nincs a Report.DataSets-ben)');
    Add('clUnknownVar', 'Ismeretlen mezõ vagy változó:');
    Add('clScrError', 'Script hiba %s: %s-nél');
    Add('clDSNotExist', 'A(z) "%s" DataSet nem létezik');
    Add('clErrors', 'A következõ hiba történt:');
    Add('clExprError', 'Hiba a kifejezésben');
    Add('clFP3files', 'Elõkészített riport');
    Add('clSaving', 'Fájl mentése...');
    Add('clCancel', 'Mégsem');
    Add('clClose', 'Bezár');
    Add('clPrinting', 'Oldal nyomtatása');
    Add('clLoading', 'Fájl betöltése...');
    Add('clPageOf', '%d. oldal %d oldalból');
    Add('clFirstPass', 'Elsõ menet: oldal ');
    Add('clNoPrinters', 'Nincs nyomtató telepítve');
    Add('clDecompressError', 'Stream kitömörítés hiba');
    Add('crFillMx', 'Kereszttábla kitöltése...');
    Add('crBuildMx', 'Kereszttábla felépítése...');

    Add('prRunningFirst', 'First pass: page %d');
    Add('prRunning', 'Preparing page %d');
    Add('prPrinting', 'Printing page %d');
    Add('prExporting', 'Exporting page %d');
    Add('uCm', 'cm');
    Add('uInch', 'in');
    Add('uPix', 'px');
    Add('uChar', 'chr');
  end;
end;


initialization
  frAddClassesRes;

end.
