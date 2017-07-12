
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
      'Caption=F�rhandsgranska' + #13#10 +
      'PrintB.Caption=Skriv ut' + #13#10 +
      'PrintB.Hint=Skriv ut' + #13#10 +
      'OpenB.Caption=�ppna' + #13#10 +
      'OpenB.Hint=�ppna' + #13#10 +
      'SaveB.Caption=Spara' + #13#10 +
      'SaveB.Hint=Spara' + #13#10 +
      'ExportB.Caption=Exportera' + #13#10 +
      'ExportB.Hint=Exportera' + #13#10 +
      'FindB.Caption=S�k' + #13#10 +
      'FindB.Hint=S�k' + #13#10 +
      'ZoomWholePageB.Caption=Hel Sida' + #13#10 +
      'ZoomWholePageB.Hint=Hel Sida' + #13#10 +
      'ZoomPageWidthB.Caption=Sidbredd' + #13#10 +
      'ZoomPageWidthB.Hint=Sidbredd' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=Tv� Sidor' + #13#10 +
      'Zoom50B.Hint=Tv� Sidor' + #13#10 +
      'ZoomCB.Hint=Zoom' + #13#10 +
      'PageSettingsB.Caption=Marginaler' + #13#10 +
      'PageSettingsB.Hint=Marginaler' + #13#10 +
      'OutlineB.Caption=�versikt' + #13#10 +
      'OutlineB.Hint=�versikt' + #13#10 +
      'HandToolB.Caption=Dra' + #13#10 +
      'HandToolB.Hint=Dragverktyg' + #13#10 +
      'ZoomToolB.Caption=Zoom' + #13#10 +
      'ZoomToolB.Hint=Zoom Verktyg' + #13#10 +
      'NewPageB.Caption=Addera Sida' + #13#10 +
      'NewPageB.Hint=Addera Sida' + #13#10 +
      'DelPageB.Caption=Radera' + #13#10 +
      'DelPageB.Hint=Radera Sida' + #13#10 +
      'DesignerB.Caption=Redigera' + #13#10 +
      'DesignerB.Hint=Redigera Sida' + #13#10 +
      'FirstB.Caption=F�rsta' + #13#10 +
      'FirstB.Hint=F�rsta Sidan' + #13#10 +
      'PriorB.Caption=F�reg�ende' + #13#10 +
      'PriorB.Hint=F�reg�ende Sida' + #13#10 +
      'NextB.Caption=N�sta' + #13#10 +
      'NextB.Hint=N�sta Sida' + #13#10 +
      'LastB.Caption=Sista' + #13#10 +
      'LastB.Hint=Sista Sidan' + #13#10 +
      'CancelB.Caption=St�ng' + #13#10 +
      'PageE.Hint=Sida Nummer' + #13#10 +
      '');
    Add('zmPageWidth', 'sidbredd');
    Add('zmWholePage', 'hel sida');

    Add('TfrxPrintDialog',
      'Caption=Skriv ut' + #13#10 +
      'Label12.Caption=Skrivare   ' + #13#10 +
      'DescrL.Caption=Skriv in sidnummer och/eller sidintervall avgr�nsade med kommatecken, t.ex 1,3,5-12.' + #13#10 +
      'Label1.Caption=Sidor   ' + #13#10 +
      'CopiesL.Caption=Antal kopior' + #13#10 +
      'CollateL.Caption=Sortera' + #13#10 +
      'Label2.Caption=Kopior   ' + #13#10 +
      'PrintL.Caption=Skriv ut' + #13#10 +
      'TypeL.Caption=Typ:' + #13#10 +
      'WhereL.Caption=Plats:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      'PropButton.Caption=Egenskaper...' + #13#10 +
      'AllRB.Caption=Alla' + #13#10 +
      'CurPageRB.Caption=Aktuell sida' + #13#10 +
      'PageNumbersRB.Caption=Sidor:' + #13#10 +
      'FileCB.Caption=Skriv till fil' + #13#10 +
      'ReverseCB.Caption=Manuell duplex' + #13#10 +
      '');
    Add('ppAll', 'Alla sidor');
    Add('ppOdd', 'Udda sidor');
    Add('ppEven', 'J�mna sidor');

    Add('TfrxSearchDialog',
      'Caption=S�k och Ers�tt' + #13#10 +
      'TextL.Caption=S�k efter:' + #13#10 +
      'SearchL.Caption=S�kval   ' + #13#10 +
      'ReplaceL.Caption=Ers�tt med' + #13#10 +
      'TopCB.Caption=S�k fr�n b�rjan' + #13#10 +
      'CaseCB.Caption=Matcha gemener/VERSALER' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Sidinst�llningar' + #13#10 +
      'WidthL.Caption=Bredd' + #13#10 +
      'HeightL.Caption=H�jd' + #13#10 +
      'SizeL.Caption=Storlek   ' + #13#10 +
      'OrientationL.Caption=Orientering   ' + #13#10 +
      'LeftL.Caption=V�nster' + #13#10 +
      'TopL.Caption=�verkant' + #13#10 +
      'RightL.Caption=H�ger' + #13#10 +
      'BottomL.Caption=Botten' + #13#10 +
      'MarginsL.Caption=Marginaler   ' + #13#10 +
      'PortraitRB.Caption=Portr�tt' + #13#10 +
      'LandscapeRB.Caption=Landskap' + #13#10 +
      'cmL1.Caption=cm' + #13#10 +
      'cmL2.Caption=cm' + #13#10 +
      'cmL3.Caption=cm' + #13#10 +
      'cmL4.Caption=cm' + #13#10 +
      'cmL5.Caption=cm' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Avbryt' + #13#10 +
      'OtherL.Caption=Annat   ' + #13#10 +
      'ApplyToCurRB.Caption=Anv�nd p� aktuell sida' + #13#10 +
      'ApplyToAllRB.Caption=Anv�nd p� alla sidor' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Skriv ut' + #13#10 +
      'PrinterL.Caption=Skrivare   ' + #13#10 +
      'PagesL.Caption=Sidor   ' + #13#10 +
      'CopiesL.Caption=Kopior   ' + #13#10 +
      'CopiesNL.Caption=Antal kopior' + #13#10 +
      'DescrL.Caption=Skriv in sidnummer och/eller sidintervall avgr�nsade med kommatecken, t.ex 1,3,5-12.' + #13#10 +
      'OptionsL.Caption=Tillval   ' + #13#10 +
      'EscL.Caption=Escape kommando   ' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Avbryt' + #13#10 +
      'SaveToFileCB.Caption=Skriv till fil' + #13#10 +
      'AllRB.Caption=Alla' + #13#10 +
      'CurPageRB.Caption=Aktuell sida' + #13#10 +
      'PageNumbersRB.Caption=Sidor:' + #13#10 +
      'PageBreaksCB.Caption=Sidbrytning' + #13#10 +
      'OemCB.Caption=Kodning' + #13#10 +
      'PseudoCB.Caption=Pseudografik' + #13#10 +
      'SaveDialog1.Filter=Utskriftsfil (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Avbryt' + #13#10 +
      '');

    Add('mbConfirm', 'Bekr�fta');
    Add('mbError', 'Fel');
    Add('mbInfo', 'Information');
    Add('xrCantFindClass', 'Kan inte hitta klass');
    Add('prVirtual', 'Virtuell');
    Add('prDefault', 'F�rvalt');
    Add('prCustom', 'Eget');
    Add('enUnconnHeader', 'Ej kopplad sidhuvud/sidfot');
    Add('enUnconnGroup', 'Inget data band f�r gruppen');
    Add('enUnconnGFooter', 'Ingen grupp huvud f�r');
    Add('enBandPos', 'Felaktig bandposition:');
    Add('dbNotConn', 'DataSet %s �r inte kopplad till data');
    Add('dbFldNotFound', 'Hittar inte f�lt:');
    Add('clDSNotIncl', '(dataset �r inte inkluderat i Report.DataSets)');
    Add('clUnknownVar', 'ok�nd variabel eller dataf�lt:');
    Add('clScrError', 'Skript fel p� %s: %s');
    Add('clDSNotExist', 'Dataset "%s" finns inte');
    Add('clErrors', 'F�ljande fel har intr�ffat:');
    Add('clExprError', 'Fel i uttryck');
    Add('clFP3files', 'Iordningst�ller rapport');
    Add('clSaving', 'Sparar fil...');
    Add('clCancel', 'Avbryt');
    Add('clClose', 'St�ng');
    Add('clPrinting', 'Skriver sida');
    Add('clLoading', 'L�ser fil...');
    Add('clPageOf', 'Sida %d av %d');
    Add('clFirstPass', 'F�rsta genoml�sning: sida ');
    Add('clNoPrinters', 'Det finns inga skrivare installerade i ditt system');
    Add('clDecompressError', 'Fel vid dekomprimering fr�n Stream');
    Add('crFillMx', 'Fyller korsreferens...');
    Add('crBuildMx', 'Bygger korsreferens...');

    Add('prRunningFirst', 'F�rsta genoml�sning: sida %d');
    Add('prRunning', 'F�rbereder sida %d');
    Add('prPrinting', 'Skriver sida %d');
    Add('prExporting', 'Exporterar sida %d');
    Add('uCm', 'cm');
    Add('uInch', 'tum');
    Add('uPix', 'px');
    Add('uChar', 'chr');
  end;
end;


initialization
  frAddClassesRes;

end.