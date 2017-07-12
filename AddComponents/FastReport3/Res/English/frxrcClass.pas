
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
      'Caption=Preview' + #13#10 +
      'PrintB.Caption=Print' + #13#10 +
      'PrintB.Hint=Print' + #13#10 +
      'OpenB.Caption=Open' + #13#10 +
      'OpenB.Hint=Open' + #13#10 +
      'SaveB.Caption=Save' + #13#10 +
      'SaveB.Hint=Save' + #13#10 +
      'ExportB.Caption=Export' + #13#10 +
      'ExportB.Hint=Export' + #13#10 +
      'FindB.Caption=Find' + #13#10 +
      'FindB.Hint=Find' + #13#10 +
      'ZoomWholePageB.Caption=Whole Page' + #13#10 +
      'ZoomWholePageB.Hint=Whole Page' + #13#10 +
      'ZoomPageWidthB.Caption=Page Width' + #13#10 +
      'ZoomPageWidthB.Hint=Page Width' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=Two Pages' + #13#10 +
      'Zoom50B.Hint=Two Pages' + #13#10 +
      'ZoomCB.Hint=Zoom' + #13#10 +
      'PageSettingsB.Caption=Margins' + #13#10 +
      'PageSettingsB.Hint=Margins' + #13#10 +
      'OutlineB.Caption=Outline' + #13#10 +
      'OutlineB.Hint=Outline' + #13#10 +
      'HandToolB.Caption=Drag' + #13#10 +
      'HandToolB.Hint=Drag Tool' + #13#10 +
      'ZoomToolB.Caption=Zoom' + #13#10 +
      'ZoomToolB.Hint=Zoom Tool' + #13#10 +
      'NewPageB.Caption=Add Page' + #13#10 +
      'NewPageB.Hint=Add Page' + #13#10 +
      'DelPageB.Caption=Delete' + #13#10 +
      'DelPageB.Hint=Delete Page' + #13#10 +
      'DesignerB.Caption=Edit' + #13#10 +
      'DesignerB.Hint=Edit Page' + #13#10 +
      'FirstB.Caption=First' + #13#10 +
      'FirstB.Hint=First Page' + #13#10 +
      'PriorB.Caption=Prior' + #13#10 +
      'PriorB.Hint=Prior Page' + #13#10 +
      'NextB.Caption=Next' + #13#10 +
      'NextB.Hint=Next Page' + #13#10 +
      'LastB.Caption=Last' + #13#10 +
      'LastB.Hint=Last Page' + #13#10 +
      'CancelB.Caption=Close' + #13#10 +
      'PageE.Hint=Page Number' + #13#10 +
      '');
    Add('zmPageWidth', 'Page width');
    Add('zmWholePage', 'Whole page');

    Add('TfrxPrintDialog',
      'Caption=Print' + #13#10 +
      'Label12.Caption=Printer   ' + #13#10 +
      'DescrL.Caption=Enter page numbers and/or page ranges, separated by commas. For example, 1,3,5-12' + #13#10 +
      'Label1.Caption=Pages   ' + #13#10 +
      'CopiesL.Caption=Number of copies' + #13#10 +
      'CollateL.Caption=Collate' + #13#10 +
      'Label2.Caption=Copies   ' + #13#10 +
      'PrintL.Caption=Print' + #13#10 +
      'TypeL.Caption=Type:' + #13#10 +
      'WhereL.Caption=Where:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'PropButton.Caption=Properties...' + #13#10 +
      'AllRB.Caption=All' + #13#10 +
      'CurPageRB.Caption=Current page' + #13#10 +
      'PageNumbersRB.Caption=Pages:' + #13#10 +
      'FileCB.Caption=Print to file' + #13#10 +
      'ReverseCB.Caption=Reverse pages' + #13#10 +
      '');
    Add('ppAll', 'All pages');
    Add('ppOdd', 'Odd pages');
    Add('ppEven', 'Even pages');

    Add('TfrxSearchDialog',
      'Caption=Find Text' + #13#10 +
      'TextL.Caption=Text to find:' + #13#10 +
      'SearchL.Caption=Search options   ' + #13#10 +
      'ReplaceL.Caption=Replace with' + #13#10 +
      'TopCB.Caption=Search from begin' + #13#10 +
      'CaseCB.Caption=Case sensitive' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Page Settings' + #13#10 +
      'WidthL.Caption=Width' + #13#10 +
      'HeightL.Caption=Height' + #13#10 +
      'SizeL.Caption=Size   ' + #13#10 +
      'OrientationL.Caption=Orientation   ' + #13#10 +
      'LeftL.Caption=Left' + #13#10 +
      'TopL.Caption=Top' + #13#10 +
      'RightL.Caption=Right' + #13#10 +
      'BottomL.Caption=Bottom' + #13#10 +
      'MarginsL.Caption=Margins   ' + #13#10 +
      'PortraitRB.Caption=Portrait' + #13#10 +
      'LandscapeRB.Caption=Landscape' + #13#10 +
      'cmL1.Caption=cm' + #13#10 +
      'cmL2.Caption=cm' + #13#10 +
      'cmL3.Caption=cm' + #13#10 +
      'cmL4.Caption=cm' + #13#10 +
      'cmL5.Caption=cm' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'OtherL.Caption=Other   ' + #13#10 +
      'ApplyToCurRB.Caption=Apply to the current page' + #13#10 +
      'ApplyToAllRB.Caption=Apply to all pages' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Print' + #13#10 +
      'PrinterL.Caption=Printer   ' + #13#10 +
      'PagesL.Caption=Pages   ' + #13#10 +
      'CopiesL.Caption=Copies   ' + #13#10 +
      'CopiesNL.Caption=Number of copies' + #13#10 +
      'DescrL.Caption=Enter page numbers and/or page ranges, separated by commas. For example, 1,3,5-12' + #13#10 +
      'OptionsL.Caption=Options   ' + #13#10 +
      'EscL.Caption=Escape commands   ' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=Cancel' + #13#10 +
      'SaveToFileCB.Caption=Print to file' + #13#10 +
      'AllRB.Caption=All' + #13#10 +
      'CurPageRB.Caption=Current page' + #13#10 +
      'PageNumbersRB.Caption=Pages:' + #13#10 +
      'PageBreaksCB.Caption=Page breaks' + #13#10 +
      'OemCB.Caption=OEM codepage' + #13#10 +
      'PseudoCB.Caption=Pseudographic' + #13#10 +
      'SaveDialog1.Filter=Printer file (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Cancel' + #13#10 +
      '');

    Add('mbConfirm', 'Confirm');
    Add('mbError', 'Error');
    Add('mbInfo', 'Information');
    Add('xrCantFindClass', 'Couldn''t find class');
    Add('prVirtual', 'Virtual');
    Add('prDefault', 'Default');
    Add('prCustom', 'Custom');
    Add('enUnconnHeader', 'Unconnected header/footer');
    Add('enUnconnGroup', 'No data band for the group');
    Add('enUnconnGFooter', 'No group header for');
    Add('enBandPos', 'Incorrect band position:');
    Add('dbNotConn', 'DataSet %s is not connected to data');
    Add('dbFldNotFound', 'Field not found:');
    Add('clDSNotIncl', '(dataset is not included into Report.DataSets)');
    Add('clUnknownVar', 'Unknown variable or datafield:');
    Add('clScrError', 'Script error at %s: %s');
    Add('clDSNotExist', 'Dataset "%s" is not exists');
    Add('clErrors', 'The following error(s) have occured:');
    Add('clExprError', 'Error in expression');
    Add('clFP3files', 'Prepared Report');
    Add('clSaving', 'Saving file...');
    Add('clCancel', 'Cancel');
    Add('clClose', 'Close');
    Add('clPrinting', 'Printing page');
    Add('clLoading', 'Loading file...');
    Add('clPageOf', 'Page %d of %d');
    Add('clFirstPass', 'First pass: page ');
    Add('clNoPrinters', 'No printers installed in your system');
    Add('clDecompressError', 'Stream decompress error');
    Add('crFillMx', 'Filling the cross-tab...');
    Add('crBuildMx', 'Building the cross-tab...');

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