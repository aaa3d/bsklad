
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
{******************************************
  Translate by ChenFeng For Chinese res file at 2004-12-03 23:09PM
  Email:soareay@hotmail.com
  Good Luck!
******************************************}

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
      'Caption=Ԥ��' + #13#10 +
      'PrintB.Caption=��ӡ' + #13#10 +
      'PrintB.Hint=��ӡ' + #13#10 +
      'OpenB.Caption=��' + #13#10 +
      'OpenB.Hint=��' + #13#10 +
      'SaveB.Caption=����' + #13#10 +
      'SaveB.Hint=����' + #13#10 +
      'ExportB.Caption=����' + #13#10 +
      'ExportB.Hint=����' + #13#10 +
      'FindB.Caption=Ѱ��' + #13#10 +
      'FindB.Hint=Ѱ��' + #13#10 +
      'ZoomWholePageB.Caption=��ҳ' + #13#10 +
      'ZoomWholePageB.Hint=��ҳ' + #13#10 +
      'ZoomPageWidthB.Caption=ҳ��' + #13#10 +
      'ZoomPageWidthB.Hint=ҳ��' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=��ҳ' + #13#10 +
      'Zoom50B.Hint=��ҳ' + #13#10 +
      'ZoomCB.Hint=��ʾ����' + #13#10 +
      'PageSettingsB.Caption=ҳ������' + #13#10 +
      'PageSettingsB.Hint=ҳ������' + #13#10 +
      'OutlineB.Caption=��Ҫ' + #13#10 +
      'OutlineB.Hint=��Ҫ' + #13#10 +
      'HandToolB.Caption=�϶�' + #13#10 +
      'HandToolB.Hint=�϶�' + #13#10 +
      'ZoomToolB.Caption=����' + #13#10 +
      'ZoomToolB.Hint=����' + #13#10 +
      'NewPageB.Caption=����ҳ' + #13#10 +
      'NewPageB.Hint=����ҳ' + #13#10 +
      'DelPageB.Caption=ɾ��ҳ' + #13#10 +
      'DelPageB.Hint=ɾ��ҳ' + #13#10 +
      'DesignerB.Caption=�༭ҳ' + #13#10 +
      'DesignerB.Hint=�༭ҳ' + #13#10 +
      'FirstB.Caption=��ҳ' + #13#10 +
      'FirstB.Hint=��ҳ' + #13#10 +
      'PriorB.Caption=ǰҳ' + #13#10 +
      'PriorB.Hint=ǰҳ' + #13#10 +
      'NextB.Caption=��ҳ' + #13#10 +
      'NextB.Hint=��ҳ' + #13#10 +
      'LastB.Caption=ĩҳ' + #13#10 +
      'LastB.Hint=ĩҳ' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      'PageE.Hint=ҳ��' + #13#10 +
      '');
    Add('zmPageWidth', 'ҳ��');
    Add('zmWholePage', '��ҳ');

    Add('TfrxPrintDialog',
      'Caption=��ӡ' + #13#10 +
      'Label12.Caption=��ӡ��   ' + #13#10 +
      'DescrL.Caption=����ҳ��/�ļ���Χ���Զ��ŷָ�(����:1,3,5-12)' + #13#10 +
      'Label1.Caption=ҳ ' + #13#10 +
      'CopiesL.Caption=����' + #13#10 +
      'CollateL.Caption=�Զ���ҳ(&T)' + #13#10 +
      'Label2.Caption=����(&C)   ' + #13#10 +
      'PrintL.Caption=��ӡ' + #13#10 +
      'TypeL.Caption=����:' + #13#10 +
      'WhereL.Caption=λ��:' + #13#10 +
      'OkB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      'PropButton.Caption=����(&P)' + #13#10 +
      'AllRB.Caption=ȫ��(&A)' + #13#10 +
      'CurPageRB.Caption=��ҳ(&E)' + #13#10 +
      'PageNumbersRB.Caption=ҳ��(&G):' + #13#10 +
      'FileCB.Caption=������ļ�(&L)' + #13#10 +
      'ReverseCB.Caption=��ҳ���ӡ(&V)' + #13#10 +
      '');
    Add('ppAll', '��Χ������ҳ��');
    Add('ppOdd', '����ҳ');
    Add('ppEven', 'ż��ҳ');

    Add('TfrxSearchDialog',
      'Caption=Ѱ���ı�' + #13#10 +
      'TextL.Caption=Ѱ��Ŀ��:' + #13#10 +
      'SearchL.Caption=ѡ��   ' + #13#10 +
      'TopCB.Caption=���' + #13#10 +
      'CaseCB.Caption=���ִ�Сд' + #13#10 +
      'OkB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=ҳ������' + #13#10 +
      'WidthL.Caption=���' + #13#10 +
      'HeightL.Caption=�߶�' + #13#10 +
      'SizeL.Caption=ֽ�Ŵ�С   ' + #13#10 +
      'OrientationL.Caption=��ӡ����   ' + #13#10 +
      'LeftL.Caption=��' + #13#10 +
      'TopL.Caption=��' + #13#10 +
      'RightL.Caption=��' + #13#10 +
      'BottomL.Caption=��' + #13#10 +
      'MarginsL.Caption=�߾�   ' + #13#10 +
      'PortraitRB.Caption=����' + #13#10 +
      'LandscapeRB.Caption=����' + #13#10 +
      'cmL1.Caption=cm' + #13#10 +
      'cmL2.Caption=cm' + #13#10 +
      'cmL3.Caption=cm' + #13#10 +
      'cmL4.Caption=cm' + #13#10 +
      'cmL5.Caption=cm' + #13#10 +
      'cmL6.Caption=cm' + #13#10 +
      'OKB.Caption=ȷ��' + #13#10 +
      'CancelB.Caption=ȡ��' + #13#10 +
      'OtherL.Caption=����   ' + #13#10 +
      'ApplyToCurRB.Caption=���ñ�ҳ' + #13#10 +
      'ApplyToAllRB.Caption=����ȫ��ҳ��' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=��ӡt' + #13#10 +
      'PrinterL.Caption=��ӡ��   ' + #13#10 +
      'PagesL.Caption=ҳ   ' + #13#10 +
      'CopiesL.Caption=����   ' + #13#10 +
      'CopiesNL.Caption=����' + #13#10 +
      'DescrL.Caption=����ҳ��/�ļ���Χ���Զ��ŷָ�(����:1,3,5-12)' + #13#10 +
      'OptionsL.Caption=ѡ��   ' + #13#10 +
      'EscL.Caption=Escape ָ��   ' + #13#10 +
      'OK.Caption=ȷ��' + #13#10 +
      'Cancel.Caption=ȡ��' + #13#10 +
      'SaveToFileCB.Caption=��ӡ���ļ�' + #13#10 +
      'AllRB.Caption=ȫ��' + #13#10 +
      'CurPageRB.Caption=��ҳ' + #13#10 +
      'PageNumbersRB.Caption=ҳ��:' + #13#10 +
      'PageBreaksCB.Caption=��ҳ' + #13#10 +
      'OemCB.Caption=OEM ҳ��' + #13#10 +
      'PseudoCB.Caption=�����ͼ����Ԫ' + #13#10 +
      'SaveDialog1.Filter=��ӡ���ļ� (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=ȡ��' + #13#10 +
      '');

    Add('mbConfirm', 'ȷ��');
    Add('mbError', '����');
    Add('mbInfo', '��Ѷ');
    Add('xrCantFindClass', '���������');
    Add('prVirtual', '����');
    Add('prDefault', 'Ԥ��');
    Add('prCustom', '�Զ�');
    Add('enUnconnHeader', 'δ����������');
    Add('enUnconnGroup', 'Ⱥ��δ���������ݿ�');
    Add('enUnconnGFooter', 'û��Ⱥ���βer for');
    Add('enBandPos', 'Band��λ�ô���:');
    Add('dbNotConn', '���ݿ� %s δ���������ݿ�');
    Add('dbFldNotFound', '�ֶβ�����:');
    Add('clDSNotIncl', '(���ݿ�δ������ Report.DataSets)');
    Add('clUnknownVar', 'δ֪�ı��������ݿ��ֶ�:');
    Add('clScrError', 'Script ������ %s: %s');
    Add('clDSNotExist', '���ݿ� "%s" ������');
    Add('clErrors', '�������еĴ���:');
    Add('clExprError', '����ʽ����');
    Add('clFP3files', '�����ļ�');
    Add('clSaving', '�����ļ�...');
    Add('clCancel', 'ȡ��');
    Add('clClose', '�ر�(&X)');
    Add('clPrinting', '��ӡҳ');
    Add('clLoading', '�����ļ�...');
    Add('clPageOf', 'ҳ %d / %d');
    Add('clFirstPass', '��һ�δ������: ҳ ');
    Add('clNoPrinters', '�����ϵͳû�а�װ��ӡ��');
    Add('clDecompressError', 'Stream ��ѹ����������');

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
