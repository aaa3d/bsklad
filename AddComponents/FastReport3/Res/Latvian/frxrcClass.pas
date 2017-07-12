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
      'Caption=Iprieksejs parskats' + #13#10 +
      'PrintB.Caption=Druka' + #13#10 +
      'PrintB.Hint= Druka ' + #13#10 +
      'OpenB.Caption=Atvert' + #13#10 +
      'OpenB.Hint= Atvert ' + #13#10 +
      'SaveB.Caption=Saglabat' + #13#10 +
      'SaveB.Hint= Saglabat ' + #13#10 +
      'ExportB.Caption=Eksports' + #13#10 +
      'ExportB.Hint= Eksports ' + #13#10 +
      'FindB.Caption=Meklet' + #13#10 +
      'FindB.Hint= Meklet ' + #13#10 +
      'ZoomWholePageB.Caption=Pilnigi' + #13#10 +
      'ZoomWholePageB.Hint= Visa lappuse ' + #13#10 +
      'ZoomPageWidthB.Caption=Platuma' + #13#10 +
      'ZoomPageWidthB.Hint= Platuma ' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=Divas lappuses' + #13#10 +
      'Zoom50B.Hint= Divas lappuses ' + #13#10 +
      'ZoomCB.Hint=Merogs' + #13#10 +
      'PageSettingsB.Caption=Laukumi' + #13#10 +
      'PageSettingsB.Hint=Lappuses parametri' + #13#10 +
      'OutlineB.Caption=Koks' + #13#10 +
      'OutlineB.Hint=Atskaites koks' + #13#10 +
      'HandToolB.Caption=Roka' + #13#10 +
      'HandToolB.Hint= Roka ' + #13#10 +
      'ZoomToolB.Caption=Lupa' + #13#10 +
      'ZoomToolB.Hint= Lupa ' + #13#10 +
      'NewPageB.Caption=Pievienot' + #13#10 +
      'NewPageB.Hint=Pievienot lappusi' + #13#10 +
      'DelPageB.Caption=Dzest' + #13#10 +
      'DelPageB.Hint=Dzest lappusi' + #13#10 +
      'DesignerB.Caption=Labojums' + #13#10 +
      'DesignerB.Hint=Rediget lappusi' + #13#10 +
      'FirstB.Caption=Pirma' + #13#10 +
      'FirstB.Hint=Uz pirmo lappusi' + #13#10 +
      'PriorB.Caption=Iepriekseja' + #13#10 +
      'PriorB.Hint=Uz ieprieksejo lappusi' + #13#10 +
      'NextB.Caption=Nakosa' + #13#10 +
      'NextB.Hint=Uz nakoso lappusi' + #13#10 +
      'LastB.Caption=Pedeja' + #13#10 +
      'LastB.Hint=Uz pedejo lappusi' + #13#10 +
      'CancelB.Caption=Aizvert' + #13#10 +
      'PageE.Hint=Lappuses numurs' + #13#10 +
      '');
    Add('zmPageWidth', 'Platuma');
    Add('zmWholePage', 'Visa lappuse');

    Add('TfrxPrintDialog',
      'Caption=Druka' + #13#10 +
      'Label12.Caption=Printeris   ' + #13#10 +
      'DescrL.Caption=Ievadiet numurus un/vai lappuses izmerus, sadalitas ar komatiem. Piemeram, 1,3,5-12' + #13#10 +
      'Label1.Caption=Lappuses   ' + #13#10 +
      'CopiesL.Caption=Daudzums' + #13#10 +
      'CollateL.Caption=Skirot pec kopijam' + #13#10 +
      'Label2.Caption=Kopijas   ' + #13#10 +
      'PrintL.Caption=Druka' + #13#10 +
      'TypeL.Caption=Veids:' + #13#10 +
      'WhereL.Caption=Kur:' + #13#10 +
      'OkB.Caption=Œ ' + #13#10 +
      'CancelB.Caption=Atcelt' + #13#10 +
      'PropButton.Caption=Iestatijumi...' + #13#10 +
      'AllRB.Caption=Visi' + #13#10 +
      'CurPageRB.Caption=Tekosa' + #13#10 +
      'PageNumbersRB.Caption=Numuri:' + #13#10 +
      'FileCB.Caption=Druka faila' + #13#10 +
      'ReverseCB.Caption=Atgriezeniska kartiba' + #13#10 +
      '');
    Add('ppAll', 'Visas lappuses');
    Add('ppOdd', 'Nepara lappuses');
    Add('ppEven', 'Parskaita lappuses');

    Add('TfrxSearchDialog',
      'Caption=Meklet tekstu' + #13#10 +
      'TextL.Caption=Teksts:' + #13#10 +
      'SearchL.Caption=Meklesanas iestatijumi   ' + #13#10 +
      'ReplaceL.Caption=Aizvietot' + #13#10 +
      'TopCB.Caption=Meklet no sakuma' + #13#10 +
      'CaseCB.Caption=Atpazit registru' + #13#10 +
      'OkB.Caption=Œ ' + #13#10 +
      'CancelB.Caption=Atcelt' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Lappuses iestatijumi' + #13#10 +
      'WidthL.Caption=Platums' + #13#10 +
      'HeightL.Caption=Augstums' + #13#10 +
      'SizeL.Caption=Izmers   ' + #13#10 +
      'OrientationL.Caption=Orientacija   ' + #13#10 +
      'LeftL.Caption=Kreisais' + #13#10 +
      'TopL.Caption=Augsejais' + #13#10 +
      'RightL.Caption=Labais' + #13#10 +
      'BottomL.Caption=Apaksejais' + #13#10 +
      'MarginsL.Caption=Laukumi   ' + #13#10 +
      'PortraitRB.Caption=Vertikali' + #13#10 +
      'LandscapeRB.Caption=Horizontali' + #13#10 +
      'cmL1.Caption= cm ' + #13#10 +
      'cmL2.Caption= cm ' + #13#10 +
      'cmL3.Caption= cm ' + #13#10 +
      'cmL4.Caption= cm ' + #13#10 +
      'cmL5.Caption= cm ' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=Œ ' + #13#10 +
      'CancelB.Caption=Atcelt' + #13#10 +
      'OtherL.Caption=Citi   ' + #13#10 +
      'ApplyToCurRB.Caption=Pievienot tekosajai lappusei' + #13#10 +
      'ApplyToAllRB.Caption=Pievienot visam lappusem' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Druka' + #13#10 +
      'PrinterL.Caption=Printeris   ' + #13#10 +
      'PagesL.Caption=Lappuses   ' + #13#10 +
      'CopiesL.Caption=Kopijas   ' + #13#10 +
      'CopiesNL.Caption=Daudzums' + #13#10 +
      'DescrL.Caption=Ievadiet numurus un/vai lappuses iestatijumus, sadalitas ar komatiem. Piemeram, 1,3,5-12' + #13#10 +
      'OptionsL.Caption=Izvelnes   ' + #13#10 +
      'EscL.Caption=ESC-komandas   ' + #13#10 +
      'OK.Caption=ok' + #13#10 +
      'Cancel.Caption=Atcelt' + #13#10 +
      'SaveToFileCB.Caption=Druka faila' + #13#10 +
      'AllRB.Caption=Visi' + #13#10 +
      'CurPageRB.Caption=Tekosa' + #13#10 +
      'PageNumbersRB.Caption=Numuri:' + #13#10 +
      'PageBreaksCB.Caption=Lappusu dalisana' + #13#10 +
      'OemCB.Caption=OEM-kodesana' + #13#10 +
      'PseudoCB.Caption=Pseidografika' + #13#10 +
      'SaveDialog1.Filter=Drukas fails (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Atcelt' + #13#10 +
      '');

    Add('mbConfirm', 'Apstiprinat');
    Add('mbError', 'Kluda');
    Add('mbInfo', 'Informacija');
    Add('xrCantFindClass', 'Neizdevas atrast klasi');
    Add('prVirtual', 'Virtuala');
    Add('prDefault', 'Pec noklusejuma');
    Add('prCustom', 'Lietotaja');
    Add('enUnconnHeader', 'Nav pieslegts header/footer');
    Add('enUnconnGroup', 'Nav grupas datu koda');
    Add('enUnconnGFooter', 'Nav grupas virsraksta');
    Add('enBandPos', 'Nepareizi izvietots datu kods:');
    Add('dbNotConn', 'Komponents %s nav pievienots datiem');
    Add('dbFldNotFound', 'Laukums nav atrasts:');
    Add('clDSNotIncl', '(komponents nav pievienots pie Report.DataSets)');
    Add('clUnknownVar', 'Neatpazits labojums vai datu laukums:');
    Add('clScrError', 'Kuda skripta %s: %s');
    Add('clDSNotExist', 'Nav atrasta datu ievade "%s"');
    Add('clErrors', 'Tika atrastas sekojosas kludas:');
    Add('clExprError', 'Kluda izteiksme');
    Add('clFP3files', 'Atskaite gatava');
    Add('clSaving', 'Tiek saglabats fails...');
    Add('clCancel', 'Atcelt');

    Add('clClose', 'Aizvert');
    Add('clPrinting', 'Tiek drukata lappuse');
    Add('clLoading', 'Notiek faila ielade...');
    Add('clPageOf', 'Lappuse %d no %d');
    Add('clFirstPass', 'Pirma parbaude: lappuse ');
    Add('clNoPrinters', 'Jusu sistemai nav uzstadits printeris');
    Add('clDecompressError', 'Datu konvertesanas kluda');
    Add('crFillMx', 'Tiek aizpildits cross-tab...');
    Add('crBuildMx', 'Tiek pievienots cross-tab...');

    Add('prRunningFirst', 'Pirma parbaude: lappuse %d');
    Add('prRunning', 'Tiek sagatavota lappuse %d');
    Add('prPrinting', 'Tiek drukata lappuse %d');
    Add('prExporting', 'Lappuses eksportesana %d');
    Add('uCm', 'cm');
    Add('uInch', 'in');
    Add('uPix', 'px');
    Add('uChar', 'chr');
  end;
end;


initialization
  frAddClassesRes;

end.