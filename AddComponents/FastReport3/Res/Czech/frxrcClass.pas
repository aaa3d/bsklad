
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
      'Caption=Pøedtisk' + #13#10 +
      'PrintB.Caption=Tisk' + #13#10 +
      'PrintB.Hint=Tisknout' + #13#10 +
      'OpenB.Caption=Otevøít' + #13#10 +
      'OpenB.Hint=Otevøít' + #13#10 +
      'SaveB.Caption=Uložit' + #13#10 +
      'SaveB.Hint=Uložit' + #13#10 +
      'ExportB.Caption=Export' + #13#10 +
      'ExportB.Hint=Export' + #13#10 +
      'FindB.Caption=Najít' + #13#10 +
      'FindB.Hint=Najít' + #13#10 +
      'ZoomWholePageB.Caption=Celá stránka' + #13#10 +
      'ZoomWholePageB.Hint=Celá stránka' + #13#10 +
      'ZoomPageWidthB.Caption=Šíøka stránky' + #13#10 +
      'ZoomPageWidthB.Hint=Na šíøku stránky' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=Dvì stránky' + #13#10 +
      'Zoom50B.Hint=Dvì stránky' + #13#10 +
      'ZoomCB.Hint=Zvìtšení' + #13#10 +
      'PageSettingsB.Caption=Okraje' + #13#10 +
      'PageSettingsB.Hint=Okraje' + #13#10 +
      'OutlineB.Caption=Ovládání' + #13#10 +
      'OutlineB.Hint=Ovládání' + #13#10 +
      'HandToolB.Caption=Pøetáhnout' + #13#10 +
      'HandToolB.Hint=Nástroj pøetažení' + #13#10 +
      'ZoomToolB.Caption=Zvìtšení' + #13#10 +
      'ZoomToolB.Hint=Nástroj zvìtšení' + #13#10 +
      'NewPageB.Caption=Pøidat stránku' + #13#10 +
      'NewPageB.Hint=Pøidat stránku' + #13#10 +
      'DelPageB.Caption=Vymazat' + #13#10 +
      'DelPageB.Hint=Vymazat stránku' + #13#10 +
      'DesignerB.Caption=Upravit' + #13#10 +
      'DesignerB.Hint=Upravit stránku' + #13#10 +
      'FirstB.Caption=První' + #13#10 +
      'FirstB.Hint=První stránka' + #13#10 +
      'PriorB.Caption=Pøedchozí' + #13#10 +
      'PriorB.Hint=Pøedchozí stránka' + #13#10 +
      'NextB.Caption=Další' + #13#10 +
      'NextB.Hint=Další stránka' + #13#10 +
      'LastB.Caption=Poslední' + #13#10 +
      'LastB.Hint=Poslední stránka' + #13#10 +
      'CancelB.Caption=Zavøít' + #13#10 +
      'PageE.Hint=Èíslo stránky' + #13#10 +
      '');
    Add('zmPageWidth', 'Šíøka stránky');
    Add('zmWholePage', 'Celá stránka');

    Add('TfrxPrintDialog',
      'Caption=Tisk' + #13#10 +
      'Label12.Caption=Tiskárna   ' + #13#10 +
      'DescrL.Caption=Zadejte poèet stránek a/nebo rozsah stránek oddìlených èárkami. Napø. 1,3,5-12' + #13#10 +
      'Label1.Caption=Stránky   ' + #13#10 +
      'CopiesL.Caption=Poèet kopií' + #13#10 +
      'CollateL.Caption=Uspoøádat' + #13#10 +
      'Label2.Caption=Kopie   ' + #13#10 +
      'PrintL.Caption=Tisk' + #13#10 +
      'TypeL.Caption=Typ:' + #13#10 +
      'WhereL.Caption=Kde:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      'PropButton.Caption=Vlastnosti...' + #13#10 +
      'AllRB.Caption=Vše' + #13#10 +
      'CurPageRB.Caption=Aktuální stránku' + #13#10 +
      'PageNumbersRB.Caption=Stránky:' + #13#10 +
      'FileCB.Caption=Tisknout do souboru' + #13#10 +
      'ReverseCB.Caption=Obrácené poøadí str.' + #13#10 +
      '');
    Add('ppAll', 'Všechny stránky');
    Add('ppOdd', 'Liché stránky');
    Add('ppEven', 'Sudé stránky');

    Add('TfrxSearchDialog',
      'Caption=Najít text' + #13#10 +
      'TextL.Caption=Hledaný text:' + #13#10 +
      'SearchL.Caption=Volby prohledávání   ' + #13#10 +
      'TopCB.Caption=Hledat od zaèátku' + #13#10 +
      'CaseCB.Caption=Rozlišovat malá/velká' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Nastavení stránky' + #13#10 +
      'WidthL.Caption=Šíøka' + #13#10 +
      'HeightL.Caption=Výška' + #13#10 +
      'SizeL.Caption=Velikost   ' + #13#10 +
      'OrientationL.Caption=Orientace   ' + #13#10 +
      'LeftL.Caption=Vlevo' + #13#10 +
      'TopL.Caption=Nahoøe' + #13#10 +
      'RightL.Caption=Vpravo' + #13#10 +
      'BottomL.Caption=Dole' + #13#10 +
      'MarginsL.Caption=Okraje   ' + #13#10 +
      'PortraitRB.Caption=Na výšku' + #13#10 +
      'LandscapeRB.Caption=Na šíøku' + #13#10 +
      'cmL1.Caption=cm' + #13#10 +
      'cmL2.Caption=cm' + #13#10 +
      'cmL3.Caption=cm' + #13#10 +
      'cmL4.Caption=cm' + #13#10 +
      'cmL5.Caption=cm' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zrušit' + #13#10 +
      'OtherL.Caption=Další   ' + #13#10 +
      'ApplyToCurRB.Caption=Uplatnit na aktuální stránku' + #13#10 +
      'ApplyToAllRB.Caption=Uplatnit na všechny stránky' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Tisk' + #13#10 +
      'PrinterL.Caption=Tiskárna   ' + #13#10 +
      'PagesL.Caption=Stránky   ' + #13#10 +
      'CopiesL.Caption=Kopie   ' + #13#10 +
      'CopiesNL.Caption=Poèet kopií' + #13#10 +
      'DescrL.Caption=Zadejte poèet stránek a/nebo rozsah stránek oddìlených èárkami. Napø. 1,3,5-12' + #13#10 +
      'OptionsL.Caption=Nastavení   ' + #13#10 +
      'EscL.Caption=Pøíkazy ukonèení   ' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Zrušit' + #13#10 +
      'SaveToFileCB.Caption=Tisknout do souboru' + #13#10 +
      'AllRB.Caption=Vše' + #13#10 +
      'CurPageRB.Caption=Aktuální stránku' + #13#10 +
      'PageNumbersRB.Caption=Stránky:' + #13#10 +
      'PageBreaksCB.Caption=Konce stránek' + #13#10 +
      'OemCB.Caption=OEM codepage' + #13#10 +
      'PseudoCB.Caption=Pseudografika' + #13#10 +
      'SaveDialog1.Filter=Tiskový soubor (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Zrušit' + #13#10 +
      '');

    Add('mbConfirm', 'Potvrdit');
    Add('mbError', 'Chyba');
    Add('mbInfo', 'Informace');
    Add('xrCantFindClass', 'Nelze nalézt tøídu');
    Add('prVirtual', 'Virtuální');
    Add('prDefault', 'Pøedvolená');
    Add('prCustom', 'Vlastní');
    Add('enUnconnHeader', 'Nepøipojené záhlaví/zápatí');
    Add('enUnconnGroup', 'Žádný pruh pro skupinu');
    Add('enUnconnGFooter', 'Žádné skupinové záhlaví');
    Add('enBandPos', 'Nesprávná pozice pruhu:');
    Add('dbNotConn', 'DataSet %s není pøipojen k datùm');
    Add('dbFldNotFound', 'Soubor nenalezen:');
    Add('clDSNotIncl', '(dataset není v Report.DataSets obsažen)');
    Add('clUnknownVar', 'Neznámá promìnná, nebo datové pole:');
    Add('clScrError', 'Chyba skriptu v %s: %s');
    Add('clDSNotExist', 'Dataset "%s" neexistuje');
    Add('clErrors', 'Nastala(y) následující chyba(y):');
    Add('clExprError', 'Chyba ve výrazu');
    Add('clFP3files', 'Pøipravený Report');
    Add('clSaving', 'Ukládání souboru...');
    Add('clCancel', 'Zrušit');
    Add('clClose', 'Zavøít');
    Add('clPrinting', 'Tisk stránky');
    Add('clLoading', 'Naèítání souboru...');
    Add('clPageOf', '%d strana z %d');
    Add('clFirstPass', 'První prùchod: strana ');
    Add('clNoPrinters', 'Na Vašem systému není nainstalována žádná tiskárna');
    Add('clDecompressError', 'Chyba pøi dekomprimování streamu');

    Add('prRunningFirst', 'First pass: page %d');
    Add('prRunning', 'Preparing page %d');
    Add('prPrinting', 'Printing page %d');
    Add('prExporting', 'Exporting page %d');
    Add('uCm', 'cm');
    Add('uInch', 'in');
    Add('uPix', 'px');
    Add('uChar', 'zn');
  end;
end;


initialization
  frAddClassesRes;

end.