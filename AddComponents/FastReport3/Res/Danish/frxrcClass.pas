
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
      'Caption=Vis udskrift' + #13#10 +
      'PrintB.Caption=Udskriv' + #13#10 +
      'PrintB.Hint=Udskriv' + #13#10 +
      'OpenB.Caption=Åbn' + #13#10 +
      'OpenB.Hint=Åbn' + #13#10 +
      'SaveB.Caption=Gem' + #13#10 +
      'SaveB.Hint=Gem' + #13#10 +
      'ExportB.Caption=Eksporter' + #13#10 +
      'ExportB.Hint=Eksporter' + #13#10 +
      'FindB.Caption=Find' + #13#10 +
      'FindB.Hint=Find' + #13#10 +
      'ZoomWholePageB.Caption=Hele siden' + #13#10 +
      'ZoomWholePageB.Hint=Hele siden' + #13#10 +
      'ZoomPageWidthB.Caption=Sidebredde' + #13#10 +
      'ZoomPageWidthB.Hint=Sidebredde' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=To sider' + #13#10 +
      'Zoom50B.Hint=To sider' + #13#10 +
      'ZoomCB.Hint=Zoom' + #13#10 +
      'PageSettingsB.Caption=Margener' + #13#10 +
      'PageSettingsB.Hint=Margener' + #13#10 +
      'OutlineB.Caption=Omrids' + #13#10 +
      'OutlineB.Hint=Omrids' + #13#10 +
      'HandToolB.Caption=Træk' + #13#10 +
      'HandToolB.Hint=Trækværktøj' + #13#10 +
      'ZoomToolB.Caption=Zoom' + #13#10 +
      'ZoomToolB.Hint=Zoom værktøj' + #13#10 +
      'NewPageB.Caption=Tilføj side' + #13#10 +
      'NewPageB.Hint=Tilføj side' + #13#10 +
      'DelPageB.Caption=Slet' + #13#10 +
      'DelPageB.Hint=Slet side' + #13#10 +
      'DesignerB.Caption=Editer' + #13#10 +
      'DesignerB.Hint=Editer side' + #13#10 +
      'FirstB.Caption=Første' + #13#10 +
      'FirstB.Hint=Første side' + #13#10 +
      'PriorB.Caption=Forgående' + #13#10 +
      'PriorB.Hint=Forgående side' + #13#10 +
      'NextB.Caption=Næste' + #13#10 +
      'NextB.Hint=Næste side' + #13#10 +
      'LastB.Caption=Sidste' + #13#10 +
      'LastB.Hint=Sidste side' + #13#10 +
      'CancelB.Caption=Luk' + #13#10 +
      'PageE.Hint=Side nummer' + #13#10 +
      '');
    Add('zmPageWidth', 'Sidebredde');
    Add('zmWholePage', 'Hele sider');

    Add('TfrxPrintDialog',
      'Caption=Udskriv' + #13#10 +
      'Label12.Caption=Printer   ' + #13#10 +
      'DescrL.Caption=Angiv sidetal og/eller sideområder adskilt af kommaer, f.eks. 1,3,5-12' + #13#10 +
      'Label1.Caption=Sider   ' + #13#10 +
      'CopiesL.Caption=Antal af kopier' + #13#10 +
      'CollateL.Caption=Sætvis' + #13#10 +
      'Label2.Caption=Kopier   ' + #13#10 +
      'PrintL.Caption=Udskriv' + #13#10 +
      'TypeL.Caption=Type:' + #13#10 +
      'WhereL.Caption=Where:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      'PropButton.Caption=Egenskaber...' + #13#10 +
      'AllRB.Caption=Alle' + #13#10 +
      'CurPageRB.Caption=Aktuel side' + #13#10 +
      'PageNumbersRB.Caption=Sider:' + #13#10 +
      'FileCB.Caption=Udskriv til fil' + #13#10 +
      'ReverseCB.Caption=Vend sider' + #13#10 +
      '');
    Add('ppAll', 'Alle sider');
    Add('ppOdd', 'Ulige sider');
    Add('ppEven', 'Lige sider');

    Add('TfrxSearchDialog',
      'Caption=Find Tekst' + #13#10 +
      'TextL.Caption=Tekst der skal fremsøges:' + #13#10 +
      'SearchL.Caption=Søgevalg   ' + #13#10 +
      'ReplaceL.Caption=Erstat med' + #13#10 +
      'TopCB.Caption=Søg fra begyndelse' + #13#10 +
      'CaseCB.Caption=Forskel på store og små bogstaver' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortryd' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Sideopsætning' + #13#10 +
      'WidthL.Caption=Bredde' + #13#10 +
      'HeightL.Caption=Højde' + #13#10 +
      'SizeL.Caption=Størrelse   ' + #13#10 +
      'OrientationL.Caption=Orientering   ' + #13#10 +
      'LeftL.Caption=Venstre' + #13#10 +
      'TopL.Caption=Top' + #13#10 +
      'RightL.Caption=Højre' + #13#10 +
      'BottomL.Caption=Bund' + #13#10 +
      'MarginsL.Caption=Marginer   ' + #13#10 +
      'PortraitRB.Caption=Stående' + #13#10 +
      'LandscapeRB.Caption=Liggende' + #13#10 +
      'cmL1.Caption=cm' + #13#10 +
      'cmL2.Caption=cm' + #13#10 +
      'cmL3.Caption=cm' + #13#10 +
      'cmL4.Caption=cm' + #13#10 +
      'cmL5.Caption=cm' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Fortyd' + #13#10 +
      'OtherL.Caption=Andet   ' + #13#10 +
      'ApplyToCurRB.Caption=Tilføj til den aktuel side' + #13#10 +
      'ApplyToAllRB.Caption=Tilføj til alle sider' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Udskriv' + #13#10 +
      'PrinterL.Caption=Printer   ' + #13#10 +
      'PagesL.Caption=Sider   ' + #13#10 +
      'CopiesL.Caption=Kopier   ' + #13#10 +
      'CopiesNL.Caption=Antal af kopier' + #13#10 +
      'DescrL.Caption=Angiv sidetal og/eller sideområder adskilt af kommaer, f.eks. 1,3,5-12' + #13#10 +
      'OptionsL.Caption=Valgmuligheder   ' + #13#10 +
      'EscL.Caption=Escape kommandoer   ' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Fortryd' + #13#10 +
      'SaveToFileCB.Caption=Udskriv til fil' + #13#10 +
      'AllRB.Caption=Alle' + #13#10 +
      'CurPageRB.Caption=Aktuel side' + #13#10 +
      'PageNumbersRB.Caption=Sider:' + #13#10 +
      'PageBreaksCB.Caption=Sidebrydning' + #13#10 +
      'OemCB.Caption=OEM codepage' + #13#10 +
      'PseudoCB.Caption=Pseudografik' + #13#10 +
      'SaveDialog1.Filter=Printerfil (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Fortryd' + #13#10 +
      '');

    Add('mbConfirm', 'Bekræft');
    Add('mbError', 'Fejl');
    Add('mbInfo', 'Information');
    Add('xrCantFindClass', 'Kunne ikke finde klasse');
    Add('prVirtual', 'Virtual');
    Add('prDefault', 'Default');
    Add('prCustom', 'Brugervalgt');
    Add('enUnconnHeader', 'Ikke forbundet hoved/fod');
    Add('enUnconnGroup', 'Intet databånd for gruppen');
    Add('enUnconnGFooter', 'Ingen gruppehoved for');
    Add('enBandPos', 'Ukorrekt båndposition:');
    Add('dbNotConn', 'DataSet %s er ikke forbundet til data');
    Add('dbFldNotFound', 'Feltet blev ikke fundet:');
    Add('clDSNotIncl', '(dataset er ikke indkluderet i Report.DataSets)');
    Add('clUnknownVar', 'Ukendt variabel eller datafelt:');
    Add('clScrError', 'Skriptfejl i %s: %s');
    Add('clDSNotExist', 'Datasættet "%s" findes ikke');
    Add('clErrors', 'Følgende fejl opstod:');
    Add('clExprError', 'Fejl i udtryk');
    Add('clFP3files', 'Forbereder Report');
    Add('clSaving', 'Gemmer fil...');
    Add('clCancel', 'Fortryd');
    Add('clClose', 'Luk');
    Add('clPrinting', 'Printer side');
    Add('clLoading', 'Henter fil...');
    Add('clPageOf', 'Side %d af %d');
    Add('clFirstPass', 'Første gennemløb: side ');
    Add('clNoPrinters', 'Der er ikke installeret printere på systemet');
    Add('clDecompressError', 'Stream dekomprimeringsfejl');
    Add('crFillMx', 'Fylder kryds-tab...');
    Add('crBuildMx', 'Bygger kryds-tab...');

    Add('prRunningFirst', 'Første gennemløb: side %d');
    Add('prRunning', 'Forbereder side %d');
    Add('prPrinting', 'Printer side %d');
    Add('prExporting', 'Eksporterer side %d');
    Add('uCm', 'cm');
    Add('uInch', 'in');
    Add('uPix', 'px');
    Add('uChar', 'chr');
  end;
end;


initialization
  frAddClassesRes;

end.