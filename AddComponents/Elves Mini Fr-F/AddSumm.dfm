object ADD_SUMM: TADD_SUMM
  Left = 94
  Top = 52
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '�������� �����'
  ClientHeight = 90
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 4
    Width = 385
    Height = 39
    Caption = 
      '�������� �������� ����� ��������� � ����� � ����� �������� �����' +
      '���'#13#10'���   ��������  ����  (��������  ����  ���������  �������� ' +
      ' ���  �������� '#13#10'��������� ������).'
  end
  object Label2: TLabel
    Left = 6
    Top = 62
    Width = 40
    Height = 13
    Caption = '����� :'
  end
  object SUMM: TRxCalcEdit
    Left = 50
    Top = 58
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00 ���##'
    NumGlyphs = 2
    TabOrder = 0
  end
  object BtnOk: TButton
    Left = 238
    Top = 56
    Width = 75
    Height = 25
    Caption = '��'
    TabOrder = 1
    OnClick = BtnOkClick
  end
  object BtnCancel: TButton
    Left = 316
    Top = 56
    Width = 75
    Height = 25
    Caption = '������'
    TabOrder = 2
    OnClick = BtnCancelClick
  end
end
