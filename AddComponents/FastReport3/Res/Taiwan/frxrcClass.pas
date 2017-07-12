
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
      'Caption=�w��' + #13#10 +
      'PrintB.Caption=�C�L' + #13#10 +
      'PrintB.Hint=�C�L' + #13#10 +
      'OpenB.Caption=�}��' + #13#10 +
      'OpenB.Hint=�}��' + #13#10 +
      'SaveB.Caption=�x�s' + #13#10 +
      'SaveB.Hint=�x�s' + #13#10 +
      'ExportB.Caption=�ץX' + #13#10 +
      'ExportB.Hint=�ץX' + #13#10 +
      'FindB.Caption=�M��' + #13#10 +
      'FindB.Hint=�M��' + #13#10 +
      'ZoomWholePageB.Caption=�㭶' + #13#10 +
      'ZoomWholePageB.Hint=�㭶' + #13#10 +
      'ZoomPageWidthB.Caption=���e' + #13#10 +
      'ZoomPageWidthB.Hint=���e' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=�⭶' + #13#10 +
      'Zoom50B.Hint=�⭶' + #13#10 +
      'ZoomCB.Hint=��ܤ��' + #13#10 +
      'PageSettingsB.Caption=�����]�w' + #13#10 +
      'PageSettingsB.Hint=�����]�w' + #13#10 +
      'OutlineB.Caption=���n' + #13#10 +
      'OutlineB.Hint=���n' + #13#10 +
      'HandToolB.Caption=���' + #13#10 +
      'HandToolB.Hint=���' + #13#10 +
      'ZoomToolB.Caption=�Y��' + #13#10 +
      'ZoomToolB.Hint=�Y��' + #13#10 +
      'NewPageB.Caption=�s�W��' + #13#10 +
      'NewPageB.Hint=�s�W��' + #13#10 +
      'DelPageB.Caption=�R����' + #13#10 +
      'DelPageB.Hint=�R����' + #13#10 +
      'DesignerB.Caption=�s�譶' + #13#10 +
      'DesignerB.Hint=�s�譶' + #13#10 +
      'FirstB.Caption=����' + #13#10 +
      'FirstB.Hint=����' + #13#10 +
      'PriorB.Caption=�e��' + #13#10 +
      'PriorB.Hint=�e��' + #13#10 +
      'NextB.Caption=����' + #13#10 +
      'NextB.Hint=����' + #13#10 +
      'LastB.Caption=����' + #13#10 +
      'LastB.Hint=����' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      'PageE.Hint=����' + #13#10 +
      '');
    Add('zmPageWidth', '���e');
    Add('zmWholePage', '�㭶');

    Add('TfrxPrintDialog',
      'Caption=�C�L' + #13#10 +
      'Label12.Caption=�L���   ' + #13#10 +
      'DescrL.Caption=��J����/���d��A�H�r�����j(�Ҧp:1,3,5-12)' + #13#10 +
      'Label1.Caption=�� ' + #13#10 +
      'CopiesL.Caption=����' + #13#10 +
      'CollateL.Caption=�۰ʤ���(&T)' + #13#10 +
      'Label2.Caption=����(&C)   ' + #13#10 +
      'PrintL.Caption=�C�L' + #13#10 +
      'TypeL.Caption=����:' + #13#10 +
      'WhereL.Caption=��m:' + #13#10 +
      'OkB.Caption=�T�w' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      'PropButton.Caption=���e(&P)' + #13#10 +
      'AllRB.Caption=����(&A)' + #13#10 +
      'CurPageRB.Caption=����(&E)' + #13#10 +
      'PageNumbersRB.Caption=����(&G):' + #13#10 +
      'FileCB.Caption=��X���ɮ�(&L)' + #13#10 +
      'ReverseCB.Caption=�ϧǦC�L(&V)' + #13#10 +
      '');
    Add('ppAll', '�d�򤺥�������');
    Add('ppOdd', '�_�ƭ�');
    Add('ppEven', '���ƭ�');

    Add('TfrxSearchDialog',
      'Caption=�M���r' + #13#10 +
      'TextL.Caption=�M��ؼ�:' + #13#10 +
      'SearchL.Caption=�ﶵ   ' + #13#10 +
      'TopCB.Caption=�_�I' + #13#10 +
      'CaseCB.Caption=�Ϥ��j�p�g' + #13#10 +
      'OkB.Caption=�T�w' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=�����]�w' + #13#10 +
      'WidthL.Caption=�e��' + #13#10 +
      'HeightL.Caption=����' + #13#10 +
      'SizeL.Caption=�ȱi�j�p   ' + #13#10 +
      'OrientationL.Caption=�C�L��V   ' + #13#10 +
      'LeftL.Caption=��' + #13#10 +
      'TopL.Caption=�W' + #13#10 +
      'RightL.Caption=�k' + #13#10 +
      'BottomL.Caption=�U' + #13#10 +
      'MarginsL.Caption=���   ' + #13#10 +
      'PortraitRB.Caption=���L' + #13#10 +
      'LandscapeRB.Caption=��L' + #13#10 +
      'cmL1.Caption=cm' + #13#10 +
      'cmL2.Caption=cm' + #13#10 +
      'cmL3.Caption=cm' + #13#10 +
      'cmL4.Caption=cm' + #13#10 +
      'cmL5.Caption=cm' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=�T�w' + #13#10 +
      'CancelB.Caption=����' + #13#10 +
      'OtherL.Caption=�䥦   ' + #13#10 +
      'ApplyToCurRB.Caption=�M�Υ���' + #13#10 +
      'ApplyToAllRB.Caption=�M�Υ�������' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=�C�Lt' + #13#10 +
      'PrinterL.Caption=�L���   ' + #13#10 +
      'PagesL.Caption=��   ' + #13#10 +
      'CopiesL.Caption=����   ' + #13#10 +
      'CopiesNL.Caption=����' + #13#10 +
      'DescrL.Caption=��J����/���d��A�H�r�����j(�Ҧp:1,3,5-12)' + #13#10 +
      'OptionsL.Caption=�ﶵ   ' + #13#10 +
      'EscL.Caption=Escape ���O   ' + #13#10 +
      'OK.Caption=�T�{' + #13#10 +
      'Cancel.Caption=����' + #13#10 +
      'SaveToFileCB.Caption=�C�L���ɮ�' + #13#10 +
      'AllRB.Caption=����' + #13#10 +
      'CurPageRB.Caption=����' + #13#10 +
      'PageNumbersRB.Caption=����:' + #13#10 +
      'PageBreaksCB.Caption=����' + #13#10 +
      'OemCB.Caption=OEM ���X' + #13#10 +
      'PseudoCB.Caption=�X�R���ϧΦr��' + #13#10 +
      'SaveDialog1.Filter=�L����� (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=��R�' + #13#10 +
      '');

    Add('mbConfirm', '�T�{');
    Add('mbError', '���~');
    Add('mbInfo', '��T');
    Add('xrCantFindClass', '���������O');
    Add('prVirtual', '����');
    Add('prDefault', '�w�]');
    Add('prCustom', '�۩w');
    Add('enUnconnHeader', '���s���ܪ�');
    Add('enUnconnGroup', '�s�ե��s���ܸ�Ʈw');
    Add('enUnconnGFooter', '�S���s�ժ��er for');
    Add('enBandPos', 'Band����m���~:');
    Add('dbNotConn', '��ƶ� %s ���s���ܸ�Ʈw');
    Add('dbFldNotFound', '��줣�s�b:');
    Add('clDSNotIncl', '(��ƶ����[�J�� Report.DataSets)');
    Add('clUnknownVar', '�������ܼƩθ�Ʈw���:');
    Add('clScrError', 'Script ���~�b %s: %s');
    Add('clDSNotExist', '��ƶ� "%s" ���s�b');
    Add('clErrors', '�o�ͤU�C�����~:');
    Add('clExprError', '�B�⦡���~');
    Add('clFP3files', '������');
    Add('clSaving', '�x�s�ɮ�...');
    Add('clCancel', '����');
    Add('clClose', '����');
    Add('clPrinting', '�C�L��');
    Add('clLoading', '���J�ɮ�...');
    Add('clPageOf', '�� %d / %d');
    Add('clFirstPass', '�Ĥ@���B�z�L�{: �� ');
    Add('clNoPrinters', '�b�A���t�ΨS���w�˦L���');
    Add('clDecompressError', 'Stream �����Y�o�Ϳ��~');

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
