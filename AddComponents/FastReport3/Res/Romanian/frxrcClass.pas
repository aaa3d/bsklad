
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
{    Romanian resource                     }
{    Translated by: Sorin Pohontu          }
{    www.frontline.ro                      }
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
      'Caption=Previzualizare' + #13#10 +
      'PrintB.Caption=Listeaza' + #13#10 +
      'PrintB.Hint=Listeaza' + #13#10 +
      'OpenB.Caption=Deschide' + #13#10 +
      'OpenB.Hint=Deschide' + #13#10 +
      'SaveB.Caption=Salveaza' + #13#10 +
      'SaveB.Hint=Salveaza' + #13#10 +
      'ExportB.Caption=Export' + #13#10 +
      'ExportB.Hint=Export' + #13#10 +
      'FindB.Caption=Cauta' + #13#10 +
      'FindB.Hint=Cauta' + #13#10 +
      'ZoomWholePageB.Caption=Intreaga pagina' + #13#10 +
      'ZoomWholePageB.Hint=Intreaga pagina' + #13#10 +
      'ZoomPageWidthB.Caption=Latime pagina' + #13#10 +
      'ZoomPageWidthB.Hint=Latime pagina' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=Doua pagini' + #13#10 +
      'Zoom50B.Hint=Doua pagini' + #13#10 +
      'ZoomCB.Hint=Scalare' + #13#10 +
      'PageSettingsB.Caption=Margini' + #13#10 +
      'PageSettingsB.Hint=Margini' + #13#10 +
      'OutlineB.Caption=Contur' + #13#10 +
      'OutlineB.Hint=Contur' + #13#10 +
      'HandToolB.Caption=Derulare' + #13#10 +
      'HandToolB.Hint=Unealta derulare' + #13#10 +
      'ZoomToolB.Caption=Scalare' + #13#10 +
      'ZoomToolB.Hint=Unealta scalare' + #13#10 +
      'NewPageB.Caption=Adauga' + #13#10 +
      'NewPageB.Hint=Adauga pagina' + #13#10 +
      'DelPageB.Caption=Sterge' + #13#10 +
      'DelPageB.Hint=Sterge pagina' + #13#10 +
      'DesignerB.Caption=Editeaza' + #13#10 +
      'DesignerB.Hint=Editeaza pagina' + #13#10 +
      'FirstB.Caption=Prima' + #13#10 +
      'FirstB.Hint=Prima pagina' + #13#10 +
      'PriorB.Caption=Anterior' + #13#10 +
      'PriorB.Hint=Pagina anterioara' + #13#10 +
      'NextB.Caption=Urmator' + #13#10 +
      'NextB.Hint=Pagina urmatoare' + #13#10 +
      'LastB.Caption=Ultima' + #13#10 +
      'LastB.Hint=Ultima pagina' + #13#10 +
      'CancelB.Caption=Inchide' + #13#10 +
      'PageE.Hint=Numar pagina' + #13#10 +
      '');
    Add('zmPageWidth', 'Latime pagina');
    Add('zmWholePage', 'Intreaga pagina');

    Add('TfrxPrintDialog',
      'Caption=Print' + #13#10 +
      'Label12.Caption=Imprimanta' + #13#10 +
      'DescrL.Caption=Introduceti numarul de pagini si/sau intervalul de pagini, separate de virgula. De exemplu: 1,3,5-1' + #13#10 +
      'Label1.Caption=Paginile' + #13#10 +
      'CopiesL.Caption=Numarul de copii' + #13#10 +
      'CollateL.Caption=Ordonare' + #13#10 +
      'Label2.Caption=Copii    ' + #13#10 +
      'PrintL.Caption=Listeaza' + #13#10 +
      'TypeL.Caption=Tip:' + #13#10 +
      'WhereL.Caption=Conditie:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      'PropButton.Caption=Proprietati...' + #13#10 +
      'AllRB.Caption=Toate' + #13#10 +
      'CurPageRB.Caption=Pagina curenta' + #13#10 +
      'PageNumbersRB.Caption=Pagini:' + #13#10 +
      'FileCB.Caption=Listeaza in fisier' + #13#10 +
      'ReverseCB.Caption=Inverseaza paginile' + #13#10 +
      '');
    Add('ppAll', 'Toate paginile');
    Add('ppOdd', 'Paginile impare');
    Add('ppEven', 'Paginile pare');

    Add('TfrxSearchDialog',
      'Caption=Cauta text' + #13#10 +
      'TextL.Caption=Text de cautat:' + #13#10 +
      'SearchL.Caption=Optiuni cautare  ' + #13#10 +
      'ReplaceL.Caption=Inlocuieste cu' + #13#10 +
      'TopCB.Caption=Cauta de la inceput' + #13#10 +
      'CaseCB.Caption=Senzitiv MAJUSCULE' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Setari pagina' + #13#10 +
      'WidthL.Caption=Latime' + #13#10 +
      'HeightL.Caption=Inaltime' + #13#10 +
      'SizeL.Caption=Dimensiune' + #13#10 +
      'OrientationL.Caption=Orientare     ' + #13#10 +
      'LeftL.Caption=Stanga' + #13#10 +
      'TopL.Caption=Sus' + #13#10 +
      'RightL.Caption=Dreapta' + #13#10 +
      'BottomL.Caption=Jos' + #13#10 +
      'MarginsL.Caption=Margini   ' + #13#10 +
      'PortraitRB.Caption=Portret' + #13#10 +
      'LandscapeRB.Caption=Peisaj' + #13#10 +
      'cmL1.Caption=cm' + #13#10 +
      'cmL2.Caption=cm' + #13#10 +
      'cmL3.Caption=cm' + #13#10 +
      'cmL4.Caption=cm' + #13#10 +
      'cmL5.Caption=cm' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Anuleaza' + #13#10 +
      'OtherL.Caption=Alte    ' + #13#10 +
      'ApplyToCurRB.Caption=Aplica la pagina curenta' + #13#10 +
      'ApplyToAllRB.Caption=Aplica la toate paginile' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Print' + #13#10 +
      'PrinterL.Caption=Imprimanta' + #13#10 +
      'PagesL.Caption=Pagini  ' + #13#10 +
      'CopiesL.Caption=Copii    ' + #13#10 +
      'CopiesNL.Caption=Numarul de copii' + #13#10 +
      'DescrL.Caption=Introduceti numarul de pagini si/sau intervalul de pagini, separate de virgula. De exemplu: 1,3,5-1' + #13#10 +
      'OptionsL.Caption=Optiuni   ' + #13#10 +
      'EscL.Caption=Comenzi ESC       ' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Anuleaza' + #13#10 +
      'SaveToFileCB.Caption=Listeaza in fisier' + #13#10 +
      'AllRB.Caption=Toate' + #13#10 +
      'CurPageRB.Caption=Pagina curenta' + #13#10 +
      'PageNumbersRB.Caption=Pagini:' + #13#10 +
      'PageBreaksCB.Caption=Page breaks' + #13#10 +
      'OemCB.Caption=Pagina de cod OEM' + #13#10 +
      'PseudoCB.Caption=Pseudografic' + #13#10 +
      'SaveDialog1.Filter=Fisier imprimanta (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Cancel' + #13#10 +
      '');

    Add('mbConfirm', 'Confirmare');
    Add('mbError', 'Eroare');
    Add('mbInfo', 'Informare');
    Add('xrCantFindClass', 'Nu pot gasi clasa');
    Add('prVirtual', 'Virtual');
    Add('prDefault', 'Implicit');
    Add('prCustom', 'Personalizat');
    Add('enUnconnHeader', 'Header/footer neconectat');
    Add('enUnconnGroup', 'Nu exista banda de date pentru grup');
    Add('enUnconnGFooter', 'Nu exista group header pentru');
    Add('enBandPos', 'Pozitie incorecta a benzii:');
    Add('dbNotConn', 'Dataset-ul %s nu este conectat la date');
    Add('dbFldNotFound', 'Campul nu a fost gasit:');
    Add('clDSNotIncl', '(dataset-ul nu este inclus in Report.DataSets)');
    Add('clUnknownVar', 'Variabila sau camp de date necunoscut:');
    Add('clScrError', 'Eroare in script la %s: %s');
    Add('clDSNotExist', 'Dataset-ul "%s" nu exista');
    Add('clErrors', 'A aparut urmatoarea eroare:');
    Add('clExprError', 'Eroare in expresie');
    Add('clFP3files', 'Raport pregatit');
    Add('clSaving', 'Salvare fisier...');
    Add('clCancel', 'Anuleaza');
    Add('clClose', 'Inchide');
    Add('clPrinting', 'Listare pagina');
    Add('clLoading', 'Incarcare fisier ...');
    Add('clPageOf', 'Pagina %d din %d');
    Add('clFirstPass', 'Prima trecere: pagina ');
    Add('clNoPrinters', 'Nu exista nici o imprimanta instalata in sistem');
    Add('clDecompressError', 'Eroare la decompresare stream');
    Add('crFillMx', 'Incarcare cross-tab...');
    Add('crBuildMx', 'Construire cross-tab...');

    Add('prRunningFirst', 'Prima trecere: page %d');
    Add('prRunning', 'Pregatire pagina %d');
    Add('prPrinting', 'Tiparire pagina %d');
    Add('prExporting', 'Exportare pagina %d');
    Add('uCm', 'cm');
    Add('uInch', 'in');
    Add('uPix', 'px');
    Add('uChar', 'chr');
  end;
end;


initialization
  frAddClassesRes;

end.