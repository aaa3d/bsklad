
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
      'Caption=¹wÄý' + #13#10 +
      'PrintB.Caption=¦C¦L' + #13#10 +
      'PrintB.Hint=¦C¦L' + #13#10 +
      'OpenB.Caption=¶}±Ò' + #13#10 +
      'OpenB.Hint=¶}±Ò' + #13#10 +
      'SaveB.Caption=Àx¦s' + #13#10 +
      'SaveB.Hint=Àx¦s' + #13#10 +
      'ExportB.Caption=¶×¥X' + #13#10 +
      'ExportB.Hint=¶×¥X' + #13#10 +
      'FindB.Caption=´M§ä' + #13#10 +
      'FindB.Hint=´M§ä' + #13#10 +
      'ZoomWholePageB.Caption=¾ã­¶' + #13#10 +
      'ZoomWholePageB.Hint=¾ã­¶' + #13#10 +
      'ZoomPageWidthB.Caption=­¶¼e' + #13#10 +
      'ZoomPageWidthB.Hint=­¶¼e' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=¨â­¶' + #13#10 +
      'Zoom50B.Hint=¨â­¶' + #13#10 +
      'ZoomCB.Hint=Åã¥Ü¤ñ¨Ò' + #13#10 +
      'PageSettingsB.Caption=­¶­±³]©w' + #13#10 +
      'PageSettingsB.Hint=­¶­±³]©w' + #13#10 +
      'OutlineB.Caption=ºõ­n' + #13#10 +
      'OutlineB.Hint=ºõ­n' + #13#10 +
      'HandToolB.Caption=©ì°Ê' + #13#10 +
      'HandToolB.Hint=©ì°Ê' + #13#10 +
      'ZoomToolB.Caption=ÁY©ñ' + #13#10 +
      'ZoomToolB.Hint=ÁY©ñ' + #13#10 +
      'NewPageB.Caption=·s¼W­¶' + #13#10 +
      'NewPageB.Hint=·s¼W­¶' + #13#10 +
      'DelPageB.Caption=§R°£­¶' + #13#10 +
      'DelPageB.Hint=§R°£­¶' + #13#10 +
      'DesignerB.Caption=½s¿è­¶' + #13#10 +
      'DesignerB.Hint=½s¿è­¶' + #13#10 +
      'FirstB.Caption=­º­¶' + #13#10 +
      'FirstB.Hint=­º­¶' + #13#10 +
      'PriorB.Caption=«e­¶' + #13#10 +
      'PriorB.Hint=«e­¶' + #13#10 +
      'NextB.Caption=¦¸­¶' + #13#10 +
      'NextB.Hint=¦¸­¶' + #13#10 +
      'LastB.Caption=¥½­¶' + #13#10 +
      'LastB.Hint=¥½­¶' + #13#10 +
      'CancelB.Caption=µ²§ô' + #13#10 +
      'PageE.Hint=­¶¼Æ' + #13#10 +
      '');
    Add('zmPageWidth', '­¶¼e');
    Add('zmWholePage', '¾ã­¶');

    Add('TfrxPrintDialog',
      'Caption=¦C¦L' + #13#10 +
      'Label12.Caption=¦Lªí¾÷   ' + #13#10 +
      'DescrL.Caption=¿é¤J­¶¼Æ/¤å¥ó½d³ò¡A¥H³r¸¹¤À¹j(¨Ò¦p:1,3,5-12)' + #13#10 +
      'Label1.Caption=­¶ ' + #13#10 +
      'CopiesL.Caption=¥÷¼Æ' + #13#10 +
      'CollateL.Caption=¦Û°Ê¤À­¶(&T)' + #13#10 +
      'Label2.Caption=¥÷¼Æ(&C)   ' + #13#10 +
      'PrintL.Caption=¦C¦L' + #13#10 +
      'TypeL.Caption=¾÷«¬:' + #13#10 +
      'WhereL.Caption=¦ì¸m:' + #13#10 +
      'OkB.Caption=½T©w' + #13#10 +
      'CancelB.Caption=¨ú®ø' + #13#10 +
      'PropButton.Caption=¤º®e(&P)' + #13#10 +
      'AllRB.Caption=¥þ³¡(&A)' + #13#10 +
      'CurPageRB.Caption=¥»­¶(&E)' + #13#10 +
      'PageNumbersRB.Caption=­¶¼Æ(&G):' + #13#10 +
      'FileCB.Caption=¿é¥X¦ÜÀÉ®×(&L)' + #13#10 +
      'ReverseCB.Caption=¤Ï§Ç¦C¦L(&V)' + #13#10 +
      '');
    Add('ppAll', '½d³ò¤º¥þ³¡­¶­±');
    Add('ppOdd', '©_¼Æ­¶');
    Add('ppEven', '°¸¼Æ­¶');

    Add('TfrxSearchDialog',
      'Caption=´M§ä¤å¦r' + #13#10 +
      'TextL.Caption=´M§ä¥Ø¼Ð:' + #13#10 +
      'SearchL.Caption=¿ï¶µ   ' + #13#10 +
      'TopCB.Caption=°_ÂI' + #13#10 +
      'CaseCB.Caption=°Ï¤À¤j¤p¼g' + #13#10 +
      'OkB.Caption=½T©w' + #13#10 +
      'CancelB.Caption=¨ú®ø' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=­¶­±³]©w' + #13#10 +
      'WidthL.Caption=¼e«×' + #13#10 +
      'HeightL.Caption=°ª«×' + #13#10 +
      'SizeL.Caption=¯È±i¤j¤p   ' + #13#10 +
      'OrientationL.Caption=¦C¦L¤è¦V   ' + #13#10 +
      'LeftL.Caption=¥ª' + #13#10 +
      'TopL.Caption=¤W' + #13#10 +
      'RightL.Caption=¥k' + #13#10 +
      'BottomL.Caption=¤U' + #13#10 +
      'MarginsL.Caption=Ãä¬É   ' + #13#10 +
      'PortraitRB.Caption=ª½¦L' + #13#10 +
      'LandscapeRB.Caption=¾î¦L' + #13#10 +
      'cmL1.Caption=cm' + #13#10 +
      'cmL2.Caption=cm' + #13#10 +
      'cmL3.Caption=cm' + #13#10 +
      'cmL4.Caption=cm' + #13#10 +
      'cmL5.Caption=cm' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=½T©w' + #13#10 +
      'CancelB.Caption=¨ú®ø' + #13#10 +
      'OtherL.Caption=¨ä¥¦   ' + #13#10 +
      'ApplyToCurRB.Caption=®M¥Î¥»­¶' + #13#10 +
      'ApplyToAllRB.Caption=®M¥Î¥þ³¡­¶­±' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=¦C¦Lt' + #13#10 +
      'PrinterL.Caption=¦Lªí¾÷   ' + #13#10 +
      'PagesL.Caption=­¶   ' + #13#10 +
      'CopiesL.Caption=¥÷¼Æ   ' + #13#10 +
      'CopiesNL.Caption=¥÷¼Æ' + #13#10 +
      'DescrL.Caption=¿é¤J­¶¼Æ/¤å¥ó½d³ò¡A¥H³r¸¹¤À¹j(¨Ò¦p:1,3,5-12)' + #13#10 +
      'OptionsL.Caption=¿ï¶µ   ' + #13#10 +
      'EscL.Caption=Escape «ü¥O   ' + #13#10 +
      'OK.Caption=½T»{' + #13#10 +
      'Cancel.Caption=¨ú®ø' + #13#10 +
      'SaveToFileCB.Caption=¦C¦L¦ÜÀÉ®×' + #13#10 +
      'AllRB.Caption=¥þ³¡' + #13#10 +
      'CurPageRB.Caption=¥»­¶' + #13#10 +
      'PageNumbersRB.Caption=­¶¼Æ:' + #13#10 +
      'PageBreaksCB.Caption=¤À­¶' + #13#10 +
      'OemCB.Caption=OEM ­¶½X' + #13#10 +
      'PseudoCB.Caption=ÂX¥Rªº¹Ï§Î¦r¤¸' + #13#10 +
      'SaveDialog1.Filter=¦Lªí¾÷ÀÉ (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=¨úRø' + #13#10 +
      '');

    Add('mbConfirm', '½T»{');
    Add('mbError', '¿ù»~');
    Add('mbInfo', '¸ê°T');
    Add('xrCantFindClass', '¤£©úªºÃþ§O');
    Add('prVirtual', 'µêÀÀ');
    Add('prDefault', '¹w³]');
    Add('prCustom', '¦Û©w');
    Add('enUnconnHeader', '¥¼³s±µ¦Üªí­º');
    Add('enUnconnGroup', '¸s²Õ¥¼³s±µ¦Ü¸ê®Æ®w');
    Add('enUnconnGFooter', '¨S¦³¸s²Õªí§Àer for');
    Add('enBandPos', 'Bandªº¦ì¸m¿ù»~:');
    Add('dbNotConn', '¸ê®Æ¶° %s ¥¼³s±µ¦Ü¸ê®Æ®w');
    Add('dbFldNotFound', 'Äæ¦ì¤£¦s¦b:');
    Add('clDSNotIncl', '(¸ê®Æ¶°¥¼¥[¤J¦Ü Report.DataSets)');
    Add('clUnknownVar', '¥¼ª¾ªºÅÜ¼Æ©Î¸ê®Æ®wÄæ¦ì:');
    Add('clScrError', 'Script ¿ù»~¦b %s: %s');
    Add('clDSNotExist', '¸ê®Æ¶° "%s" ¤£¦s¦b');
    Add('clErrors', 'µo¥Í¤U¦Cªº¿ù»~:');
    Add('clExprError', '¹Bºâ¦¡¿ù»~');
    Add('clFP3files', '³øªíÀÉ');
    Add('clSaving', 'Àx¦sÀÉ®×...');
    Add('clCancel', '¨ú®ø');
    Add('clClose', 'µ²§ô');
    Add('clPrinting', '¦C¦L­¶');
    Add('clLoading', '¸ü¤JÀÉ®×...');
    Add('clPageOf', '­¶ %d / %d');
    Add('clFirstPass', '²Ä¤@¦¸³B²z¹Lµ{: ­¶ ');
    Add('clNoPrinters', '¦b§Aªº¨t²Î¨S¦³¦w¸Ë¦Lªí¾÷');
    Add('clDecompressError', 'Stream ¸ÑÀ£ÁYµo¥Í¿ù»~');

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
