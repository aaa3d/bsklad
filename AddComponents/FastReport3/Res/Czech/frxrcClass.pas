
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
      'Caption=P�edtisk' + #13#10 +
      'PrintB.Caption=Tisk' + #13#10 +
      'PrintB.Hint=Tisknout' + #13#10 +
      'OpenB.Caption=Otev��t' + #13#10 +
      'OpenB.Hint=Otev��t' + #13#10 +
      'SaveB.Caption=Ulo�it' + #13#10 +
      'SaveB.Hint=Ulo�it' + #13#10 +
      'ExportB.Caption=Export' + #13#10 +
      'ExportB.Hint=Export' + #13#10 +
      'FindB.Caption=Naj�t' + #13#10 +
      'FindB.Hint=Naj�t' + #13#10 +
      'ZoomWholePageB.Caption=Cel� str�nka' + #13#10 +
      'ZoomWholePageB.Hint=Cel� str�nka' + #13#10 +
      'ZoomPageWidthB.Caption=���ka str�nky' + #13#10 +
      'ZoomPageWidthB.Hint=Na ���ku str�nky' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=Dv� str�nky' + #13#10 +
      'Zoom50B.Hint=Dv� str�nky' + #13#10 +
      'ZoomCB.Hint=Zv�t�en�' + #13#10 +
      'PageSettingsB.Caption=Okraje' + #13#10 +
      'PageSettingsB.Hint=Okraje' + #13#10 +
      'OutlineB.Caption=Ovl�d�n�' + #13#10 +
      'OutlineB.Hint=Ovl�d�n�' + #13#10 +
      'HandToolB.Caption=P�et�hnout' + #13#10 +
      'HandToolB.Hint=N�stroj p�eta�en�' + #13#10 +
      'ZoomToolB.Caption=Zv�t�en�' + #13#10 +
      'ZoomToolB.Hint=N�stroj zv�t�en�' + #13#10 +
      'NewPageB.Caption=P�idat str�nku' + #13#10 +
      'NewPageB.Hint=P�idat str�nku' + #13#10 +
      'DelPageB.Caption=Vymazat' + #13#10 +
      'DelPageB.Hint=Vymazat str�nku' + #13#10 +
      'DesignerB.Caption=Upravit' + #13#10 +
      'DesignerB.Hint=Upravit str�nku' + #13#10 +
      'FirstB.Caption=Prvn�' + #13#10 +
      'FirstB.Hint=Prvn� str�nka' + #13#10 +
      'PriorB.Caption=P�edchoz�' + #13#10 +
      'PriorB.Hint=P�edchoz� str�nka' + #13#10 +
      'NextB.Caption=Dal��' + #13#10 +
      'NextB.Hint=Dal�� str�nka' + #13#10 +
      'LastB.Caption=Posledn�' + #13#10 +
      'LastB.Hint=Posledn� str�nka' + #13#10 +
      'CancelB.Caption=Zav��t' + #13#10 +
      'PageE.Hint=��slo str�nky' + #13#10 +
      '');
    Add('zmPageWidth', '���ka str�nky');
    Add('zmWholePage', 'Cel� str�nka');

    Add('TfrxPrintDialog',
      'Caption=Tisk' + #13#10 +
      'Label12.Caption=Tisk�rna   ' + #13#10 +
      'DescrL.Caption=Zadejte po�et str�nek a/nebo rozsah str�nek odd�len�ch ��rkami. Nap�. 1,3,5-12' + #13#10 +
      'Label1.Caption=Str�nky   ' + #13#10 +
      'CopiesL.Caption=Po�et kopi�' + #13#10 +
      'CollateL.Caption=Uspo��dat' + #13#10 +
      'Label2.Caption=Kopie   ' + #13#10 +
      'PrintL.Caption=Tisk' + #13#10 +
      'TypeL.Caption=Typ:' + #13#10 +
      'WhereL.Caption=Kde:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      'PropButton.Caption=Vlastnosti...' + #13#10 +
      'AllRB.Caption=V�e' + #13#10 +
      'CurPageRB.Caption=Aktu�ln� str�nku' + #13#10 +
      'PageNumbersRB.Caption=Str�nky:' + #13#10 +
      'FileCB.Caption=Tisknout do souboru' + #13#10 +
      'ReverseCB.Caption=Obr�cen� po�ad� str.' + #13#10 +
      '');
    Add('ppAll', 'V�echny str�nky');
    Add('ppOdd', 'Lich� str�nky');
    Add('ppEven', 'Sud� str�nky');

    Add('TfrxSearchDialog',
      'Caption=Naj�t text' + #13#10 +
      'TextL.Caption=Hledan� text:' + #13#10 +
      'SearchL.Caption=Volby prohled�v�n�   ' + #13#10 +
      'TopCB.Caption=Hledat od za��tku' + #13#10 +
      'CaseCB.Caption=Rozli�ovat mal�/velk�' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Nastaven� str�nky' + #13#10 +
      'WidthL.Caption=���ka' + #13#10 +
      'HeightL.Caption=V��ka' + #13#10 +
      'SizeL.Caption=Velikost   ' + #13#10 +
      'OrientationL.Caption=Orientace   ' + #13#10 +
      'LeftL.Caption=Vlevo' + #13#10 +
      'TopL.Caption=Naho�e' + #13#10 +
      'RightL.Caption=Vpravo' + #13#10 +
      'BottomL.Caption=Dole' + #13#10 +
      'MarginsL.Caption=Okraje   ' + #13#10 +
      'PortraitRB.Caption=Na v��ku' + #13#10 +
      'LandscapeRB.Caption=Na ���ku' + #13#10 +
      'cmL1.Caption=cm' + #13#10 +
      'cmL2.Caption=cm' + #13#10 +
      'cmL3.Caption=cm' + #13#10 +
      'cmL4.Caption=cm' + #13#10 +
      'cmL5.Caption=cm' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Zru�it' + #13#10 +
      'OtherL.Caption=Dal��   ' + #13#10 +
      'ApplyToCurRB.Caption=Uplatnit na aktu�ln� str�nku' + #13#10 +
      'ApplyToAllRB.Caption=Uplatnit na v�echny str�nky' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Tisk' + #13#10 +
      'PrinterL.Caption=Tisk�rna   ' + #13#10 +
      'PagesL.Caption=Str�nky   ' + #13#10 +
      'CopiesL.Caption=Kopie   ' + #13#10 +
      'CopiesNL.Caption=Po�et kopi�' + #13#10 +
      'DescrL.Caption=Zadejte po�et str�nek a/nebo rozsah str�nek odd�len�ch ��rkami. Nap�. 1,3,5-12' + #13#10 +
      'OptionsL.Caption=Nastaven�   ' + #13#10 +
      'EscL.Caption=P��kazy ukon�en�   ' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Zru�it' + #13#10 +
      'SaveToFileCB.Caption=Tisknout do souboru' + #13#10 +
      'AllRB.Caption=V�e' + #13#10 +
      'CurPageRB.Caption=Aktu�ln� str�nku' + #13#10 +
      'PageNumbersRB.Caption=Str�nky:' + #13#10 +
      'PageBreaksCB.Caption=Konce str�nek' + #13#10 +
      'OemCB.Caption=OEM codepage' + #13#10 +
      'PseudoCB.Caption=Pseudografika' + #13#10 +
      'SaveDialog1.Filter=Tiskov� soubor (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Zru�it' + #13#10 +
      '');

    Add('mbConfirm', 'Potvrdit');
    Add('mbError', 'Chyba');
    Add('mbInfo', 'Informace');
    Add('xrCantFindClass', 'Nelze nal�zt t��du');
    Add('prVirtual', 'Virtu�ln�');
    Add('prDefault', 'P�edvolen�');
    Add('prCustom', 'Vlastn�');
    Add('enUnconnHeader', 'Nep�ipojen� z�hlav�/z�pat�');
    Add('enUnconnGroup', '��dn� pruh pro skupinu');
    Add('enUnconnGFooter', '��dn� skupinov� z�hlav�');
    Add('enBandPos', 'Nespr�vn� pozice pruhu:');
    Add('dbNotConn', 'DataSet %s nen� p�ipojen k dat�m');
    Add('dbFldNotFound', 'Soubor nenalezen:');
    Add('clDSNotIncl', '(dataset nen� v Report.DataSets obsa�en)');
    Add('clUnknownVar', 'Nezn�m� prom�nn�, nebo datov� pole:');
    Add('clScrError', 'Chyba skriptu v %s: %s');
    Add('clDSNotExist', 'Dataset "%s" neexistuje');
    Add('clErrors', 'Nastala(y) n�sleduj�c� chyba(y):');
    Add('clExprError', 'Chyba ve v�razu');
    Add('clFP3files', 'P�ipraven� Report');
    Add('clSaving', 'Ukl�d�n� souboru...');
    Add('clCancel', 'Zru�it');
    Add('clClose', 'Zav��t');
    Add('clPrinting', 'Tisk str�nky');
    Add('clLoading', 'Na��t�n� souboru...');
    Add('clPageOf', '%d strana z %d');
    Add('clFirstPass', 'Prvn� pr�chod: strana ');
    Add('clNoPrinters', 'Na Va�em syst�mu nen� nainstalov�na ��dn� tisk�rna');
    Add('clDecompressError', 'Chyba p�i dekomprimov�n� streamu');

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