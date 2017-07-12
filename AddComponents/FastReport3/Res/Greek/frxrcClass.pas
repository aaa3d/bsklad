
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
      'Caption=�������������' + #13#10 +
      'PrintB.Caption=��������' + #13#10 +
      'PrintB.Hint=��������' + #13#10 +
      'OpenB.Caption=�������' + #13#10 +
      'OpenB.Hint=�������' + #13#10 +
      'SaveB.Caption=����������' + #13#10 +
      'SaveB.Hint=����������' + #13#10 +
      'ExportB.Caption=�������' + #13#10 +
      'ExportB.Hint=�������' + #13#10 +
      'FindB.Caption=���������' + #13#10 +
      'FindB.Hint=���������' + #13#10 +
      'ZoomWholePageB.Caption=�������� ������' + #13#10 +
      'ZoomWholePageB.Hint=�������� ������' + #13#10 +
      'ZoomPageWidthB.Caption=��� �� ������' + #13#10 +
      'ZoomPageWidthB.Hint=��� �� ������' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=��� �������' + #13#10 +
      'Zoom50B.Hint=��� �������' + #13#10 +
      'ZoomCB.Hint=���������' + #13#10 +
      'PageSettingsB.Caption=���������' + #13#10 +
      'PageSettingsB.Hint=���������' + #13#10 +
      'OutlineB.Caption=����������' + #13#10 +
      'OutlineB.Hint=����������' + #13#10 +
      'HandToolB.Caption=����������' + #13#10 +
      'HandToolB.Hint=�������� �����������' + #13#10 +
      'ZoomToolB.Caption=���������' + #13#10 +
      'ZoomToolB.Hint=�������� ����������' + #13#10 +
      'NewPageB.Caption=�������� �������' + #13#10 +
      'NewPageB.Hint=�������� �������' + #13#10 +
      'DelPageB.Caption=�������� �������' + #13#10 +
      'DelPageB.Hint=�������� �������' + #13#10 +
      'DesignerB.Caption=��������' + #13#10 +
      'DesignerB.Hint=�������� �������' + #13#10 +
      'FirstB.Caption=�����' + #13#10 +
      'FirstB.Hint=����� ������' + #13#10 +
      'PriorB.Caption=�����������' + #13#10 +
      'PriorB.Hint=����������� ������' + #13#10 +
      'NextB.Caption=�������' + #13#10 +
      'NextB.Hint=������� ������' + #13#10 +
      'LastB.Caption=���������' + #13#10 +
      'LastB.Hint=��������� ������' + #13#10 +
      'CancelB.Caption=��������' + #13#10 +
      'PageE.Hint=������� �������' + #13#10 +
      '');
    Add('zmPageWidth', '��� �� ������');
    Add('zmWholePage', '�������� ������');

    Add('TfrxPrintDialog',
      'Caption=��������' + #13#10 +
      'Label12.Caption=���������   ' + #13#10 +
      'DescrL.Caption=����� �������� ��� ����� �������, ��������� �� ����. ��� ���������� 1,3,5-12' + #13#10 +
      'Label1.Caption=�������   ' + #13#10 +
      'CopiesL.Caption=������� ����������' + #13#10 +
      'CollateL.Caption=��������' + #13#10 +
      'Label2.Caption=���������   ' + #13#10 +
      'PrintL.Caption=��������' + #13#10 +
      'TypeL.Caption=�����:' + #13#10 +
      'WhereL.Caption=���������:' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=�����' + #13#10 +
      'PropButton.Caption=���������...' + #13#10 +
      'AllRB.Caption=����' + #13#10 +
      'CurPageRB.Caption=�������� ������' + #13#10 +
      'PageNumbersRB.Caption=�������:' + #13#10 +
      'FileCB.Caption=�������� �� ������' + #13#10 +
      'ReverseCB.Caption=������������� �������' + #13#10 +
      '');
    Add('ppAll', '���� �� �������');
    Add('ppOdd', '����� �������');
    Add('ppEven', '����� �������');

    Add('TfrxSearchDialog',
      'Caption=��������� ��������' + #13#10 +
      'TextL.Caption=������� ���� ���������:' + #13#10 +
      'SearchL.Caption=��������� ����������   ' + #13#10 +
      'ReplaceL.Caption=������������� ��' + #13#10 +
      'TopCB.Caption=��������� ��� ��� ����' + #13#10 +
      'CaseCB.Caption=���������� ��� ����/��������' + #13#10 +
      'OkB.Caption=OK' + #13#10 +
      'CancelB.Caption=�����' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=��������� �������' + #13#10 +
      'WidthL.Caption=������' + #13#10 +
      'HeightL.Caption=����' + #13#10 +
      'SizeL.Caption=�������   ' + #13#10 +
      'OrientationL.Caption=���������������   ' + #13#10 +
      'LeftL.Caption=��������' + #13#10 +
      'TopL.Caption=������' + #13#10 +
      'RightL.Caption=�����' + #13#10 +
      'BottomL.Caption=����' + #13#10 +
      'MarginsL.Caption=���������   ' + #13#10 +
      'PortraitRB.Caption=�����������' + #13#10 +
      'LandscapeRB.Caption=�������' + #13#10 +
      'cmL1.Caption=��' + #13#10 +
      'cmL2.Caption=��' + #13#10 +
      'cmL3.Caption=��' + #13#10 +
      'cmL4.Caption=��' + #13#10 +
      'cmL5.Caption=��' + #13#10 +
      'cmL6.Caption=��' + #13#10 +
      'OKB.Caption=OK' + #13#10 +
      'CancelB.Caption=�����' + #13#10 +
      'OtherL.Caption=����   ' + #13#10 +
      'ApplyToCurRB.Caption=�������� ��������� ���� �������� ������' + #13#10 +
      'ApplyToAllRB.Caption=�������� ��������� �� ���� ��� �������' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=��������' + #13#10 +
      'PrinterL.Caption=���������   ' + #13#10 +
      'PagesL.Caption=�������   ' + #13#10 +
      'CopiesL.Caption=���������   ' + #13#10 +
      'CopiesNL.Caption=������� ����������' + #13#10 +
      'DescrL.Caption=����� �������� ��� ����� �������, ��������� �� ����. ��� ���������� 1,3,5-12' + #13#10 +
      'OptionsL.Caption=���������   ' + #13#10 +
      'EscL.Caption=������� Esc   ' + #13#10 +
      'OK.Caption=OK' + #13#10 +
      'Cancel.Caption=�����' + #13#10 +
      'SaveToFileCB.Caption=�������� �� ������' + #13#10 +
      'AllRB.Caption=����' + #13#10 +
      'CurPageRB.Caption=�������� ������' + #13#10 +
      'PageNumbersRB.Caption=�������:' + #13#10 +
      'PageBreaksCB.Caption=Page breaks' + #13#10 +
      'OemCB.Caption=OEM codepage' + #13#10 +
      'PseudoCB.Caption=Pseudographic' + #13#10 +
      'SaveDialog1.Filter=������ ��������� (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=�������' + #13#10 +
      '');

    Add('mbConfirm', '�����������');
    Add('mbError', '������');
    Add('mbInfo', '�����������');
    Add('xrCantFindClass', '��� ������� �� ������ � �����');
    Add('prVirtual', '�������');
    Add('prDefault', 'Default');
    Add('prCustom', 'Custom');
    Add('enUnconnHeader', 'Unconnected header/footer');
    Add('enUnconnGroup', 'No data band for the group');
    Add('enUnconnGFooter', 'No group header for');
    Add('enBandPos', '���������� ���� �����:');
    Add('dbNotConn', 'DataSet %s is not connected to data');
    Add('dbFldNotFound', '�� ����� ��� �������:');
    Add('clDSNotIncl', '(dataset is not included into Report.DataSets)');
    Add('clUnknownVar', '������� ��������� � �����:');
    Add('clScrError', 'Script error at %s: %s');
    Add('clDSNotExist', 'Dataset "%s" is not exists');
    Add('clErrors', '��������� �� �������� ��������:');
    Add('clExprError', 'Error in expression');
    Add('clFP3files', '������������ ��������');
    Add('clSaving', '���������� �������...');
    Add('clCancel', '�����');
    Add('clClose', '��������');
    Add('clPrinting', '�������� �������');
    Add('clLoading', '������� �������...');
    Add('clPageOf', '������ %d ��� %d');
    Add('clFirstPass', '����� �������: ������ ');
    Add('clNoPrinters', '��� ������� �������������� ��������� ��� ������� ���');
    Add('clDecompressError', 'Stream decompress error');
    Add('crFillMx', 'Filling the cross-tab...');
    Add('crBuildMx', 'Building the cross-tab...');

    Add('prRunningFirst', '����� �������: ������ %d');
    Add('prRunning', '������������ ������� %d');
    Add('prPrinting', '�������� ������� %d');
    Add('prExporting', '������� ������� %d');
    Add('uCm', '��.');
    Add('uInch', '��.');
    Add('uPix', 'px');
    Add('uChar', '���.');
  end;
end;


initialization
  frAddClassesRes;

end.