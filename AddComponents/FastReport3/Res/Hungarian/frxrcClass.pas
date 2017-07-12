
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
      'Caption=El�k�p' + #13#10 +
      'PrintB.Caption=Nyomtat' + #13#10 +
      'PrintB.Hint=Nyomtat' + #13#10 +
      'OpenB.Caption=Megnyit' + #13#10 +
      'OpenB.Hint=Megnyit' + #13#10 +
      'SaveB.Caption=Ment' + #13#10 +
      'SaveB.Hint=Ment' + #13#10 +
      'ExportB.Caption=Export�l' + #13#10 +
      'ExportB.Hint=Export�l' + #13#10 +
      'FindB.Caption=Keres' + #13#10 +
      'FindB.Hint=Keres' + #13#10 +
      'ZoomWholePageB.Caption=Teljes oldal' + #13#10 +
      'ZoomWholePageB.Hint=Teljes oldal' + #13#10 +
      'ZoomPageWidthB.Caption=Oldalsz�less�g' + #13#10 +
      'ZoomPageWidthB.Hint=Oldalsz�less�g' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=K�t oldal' + #13#10 +
      'Zoom50B.Hint=K�t oldal' + #13#10 +
      'ZoomCB.Hint=Nagy�t' + #13#10 +
      'PageSettingsB.Caption=Marg�k' + #13#10 +
      'PageSettingsB.Hint=Marg�k' + #13#10 +
      'OutlineB.Caption=K�rvonal' + #13#10 +
      'OutlineB.Hint=K�rvonal' + #13#10 +
      'HandToolB.Caption=H�z' + #13#10 +
      'HandToolB.Hint=H�z� eszk�z' + #13#10 +
      'ZoomToolB.Caption=Nagy�t' + #13#10 +
      'ZoomToolB.Hint=Nagy�t�' + #13#10 +
      'NewPageB.Caption=Lapot hozz�ad' + #13#10 +
      'NewPageB.Hint=Lapot hozz�ad' + #13#10 +
      'DelPageB.Caption=T�r�l' + #13#10 +
      'DelPageB.Hint=Lapot t�rli' + #13#10 +
      'DesignerB.Caption=Szerkeszt' + #13#10 +
      'DesignerB.Hint=Lapot szerkeszt' + #13#10 +
      'FirstB.Caption=Els�' + #13#10 +
      'FirstB.Hint=Els� oldal' + #13#10 +
      'PriorB.Caption=El�z�' + #13#10 +
      'PriorB.Hint=El�z� oldal' + #13#10 +
      'NextB.Caption=K�vetkez�' + #13#10 +
      'NextB.Hint=K�vetkez� oldal' + #13#10 +
      'LastB.Caption=Utols�' + #13#10 +
      'LastB.Hint=Utols� oldal' + #13#10 +
      'CancelB.Caption=Bez�r' + #13#10 +
      'PageE.Hint=Oldalsz�m' + #13#10 +
      '');
    Add('zmPageWidth', 'Oldal sz�les');
    Add('zmWholePage', 'Teljes oldal');

    Add('TfrxPrintDialog',
      'Caption=Nyomtat' + #13#10 +
      'Label12.Caption=Nyomtat�  ' + #13#10 +
      'DescrL.Caption=Adjon meg oldalsz�mokat vagy tartom�nyokat, vessz�vel elv�lasztva. P�ld�ul 1,3,5-12' + #13#10 +
      'Label1.Caption=Oldalak ' + #13#10 +
      'CopiesL.Caption=M�solatok sz�ma' + #13#10 +
      'CollateL.Caption=Gy�jt' + #13#10 +
      'Label2.Caption=M�solatok' + #13#10 +
      'PrintL.Caption=Nyomtat' + #13#10 +
      'TypeL.Caption=T�pus:' + #13#10 +
      'WhereL.Caption=Hol:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      'PropButton.Caption=Tulajdons�gok...' + #13#10 +
      'AllRB.Caption=Mind' + #13#10 +
      'CurPageRB.Caption=Jelenlegi oldal' + #13#10 +
      'PageNumbersRB.Caption=Oldalak:' + #13#10 +
      'FileCB.Caption=F�jlba nyomtat' + #13#10 +
      'ReverseCB.Caption=Ford�tott sorrendben' + #13#10 +
      '');
    Add('ppAll', 'Minden oldal');
    Add('ppOdd', 'P�ratlan oldalak');
    Add('ppEven', 'P�ros oldalak');

    Add('TfrxSearchDialog',
      'Caption=Sz�vegkeres�' + #13#10 +
      'TextL.Caption=Keresend� sz�veg:' + #13#10 +
      'SearchL.Caption=Keres�si opci�k  ' + #13#10 +
      'ReplaceL.Caption=Replace with' + #13#10 +
      'TopCB.Caption=El�lr�l keres' + #13#10 +
      'CaseCB.Caption=Kis-, nagybet��rz�kenyen' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Oldalbe�ll�t�s' + #13#10 +
      'WidthL.Caption=Sz�less�g' + #13#10 +
      'HeightL.Caption=Magass�g' + #13#10 +
      'SizeL.Caption=M�ret  ' + #13#10 +
      'OrientationL.Caption=Ir�ny         ' + #13#10 +
      'LeftL.Caption=Bal' + #13#10 +
      'TopL.Caption=Fel�l' + #13#10 +
      'RightL.Caption=Jobb' + #13#10 +
      'BottomL.Caption=Lent' + #13#10 +
      'MarginsL.Caption=Marg�k    ' + #13#10 +
      'PortraitRB.Caption=Portr�' + #13#10 +
      'LandscapeRB.Caption=T�jk�p' + #13#10 +
      'cmL1.Caption=cm' + #13#10 +
      'cmL2.Caption=cm' + #13#10 +
      'cmL3.Caption=cm' + #13#10 +
      'cmL4.Caption=cm' + #13#10 +
      'cmL5.Caption=cm' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=M�gsem' + #13#10 +
      'OtherL.Caption=Egy�b   ' + #13#10 +
      'ApplyToCurRB.Caption=Jelenlegi lapra alkalmaz' + #13#10 +
      'ApplyToAllRB.Caption=Minden lapra alkalmaz' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Nyomtat' + #13#10 +
      'PrinterL.Caption=Nyomtat�  ' + #13#10 +
      'PagesL.Caption=Oldalak ' + #13#10 +
      'CopiesL.Caption=M�solatok' + #13#10 +
      'CopiesNL.Caption=M�solatok sz�ma ' + #13#10 +
      'DescrL.Caption=Adjon meg oldalsz�mokat vagy tartom�nyokat, vessz�vel elv�lasztva. P�ld�ul 1,3,5-12' + #13#10 +
      'OptionsL.Caption=Opci�k    ' + #13#10 +
      'EscL.Caption=Escape k�dok      ' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=M�gsem' + #13#10 +
      'SaveToFileCB.Caption=F�jlba nyomtat' + #13#10 +
      'AllRB.Caption=Mind' + #13#10 +
      'CurPageRB.Caption=Jelenelgi oldal' + #13#10 +
      'PageNumbersRB.Caption=Oldalak:' + #13#10 +
      'PageBreaksCB.Caption=Oldalt�r�sek' + #13#10 +
      'OemCB.Caption=OEM k�dlap' + #13#10 +
      'PseudoCB.Caption=Grafikus' + #13#10 +
      'SaveDialog1.Filter=Nyomtat�f�jl (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=M�gsem' + #13#10 +
      '');

    Add('mbConfirm', 'Meger�s�t');
    Add('mbError', 'Hiba');
    Add('mbInfo', 'Inform�ci�');
    Add('xrCantFindClass', 'Nem tal�lom az oszt�lyt');
    Add('prVirtual', 'Virtu�lis');
    Add('prDefault', 'Alap�rtelmezett');
    Add('prCustom', 'Egy�ni');
    Add('enUnconnHeader', 'F�ggetlen fej-, l�bl�c');
    Add('enUnconnGroup', 'A csoportnak nincs adats�vja');
    Add('enUnconnGFooter', 'Nincs fejl�c ');
    Add('enBandPos', 'Hib�s s�vpozici�:');
    Add('dbNotConn', '%s DataSet nincs adathoz csatlakoztatva');
    Add('dbFldNotFound', 'Nincs ilyen mez�:');
    Add('clDSNotIncl', '(adatk�szlet nincs a Report.DataSets-ben)');
    Add('clUnknownVar', 'Ismeretlen mez� vagy v�ltoz�:');
    Add('clScrError', 'Script hiba %s: %s-n�l');
    Add('clDSNotExist', 'A(z) "%s" DataSet nem l�tezik');
    Add('clErrors', 'A k�vetkez� hiba t�rt�nt:');
    Add('clExprError', 'Hiba a kifejez�sben');
    Add('clFP3files', 'El�k�sz�tett riport');
    Add('clSaving', 'F�jl ment�se...');
    Add('clCancel', 'M�gsem');
    Add('clClose', 'Bez�r');
    Add('clPrinting', 'Oldal nyomtat�sa');
    Add('clLoading', 'F�jl bet�lt�se...');
    Add('clPageOf', '%d. oldal %d oldalb�l');
    Add('clFirstPass', 'Els� menet: oldal ');
    Add('clNoPrinters', 'Nincs nyomtat� telep�tve');
    Add('clDecompressError', 'Stream kit�m�r�t�s hiba');
    Add('crFillMx', 'Keresztt�bla kit�lt�se...');
    Add('crBuildMx', 'Keresztt�bla fel�p�t�se...');

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
