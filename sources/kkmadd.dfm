object KKM_ADD: TKKM_ADD
  Left = 448
  Top = 406
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '�������� ����� � �����'
  ClientHeight = 153
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 4
    Width = 485
    Height = 53
    Visible = False
  end
  object Label1: TLabel
    Left = 4
    Top = 8
    Width = 472
    Height = 13
    Caption = 
      '��������! ������ �������� ����� ���� ��������� ������ ���� �� ��' +
      '�� �� ����� �������'
    Visible = False
  end
  object Label2: TLabel
    Left = 4
    Top = 24
    Width = 474
    Height = 13
    Caption = 
      '�� ������� ��������� ������ ����������� �����.  � ������� ��� ��' +
      '��� ����� ������ ����'
    Visible = False
  end
  object Label3: TLabel
    Left = 4
    Top = 40
    Width = 402
    Height = 13
    Caption = 
      '�������!   ������ �������� ������� ������������� ���� �� ������ ' +
      '� ������!'
    Visible = False
  end
  object Label6: TLabel
    Left = 4
    Top = 64
    Width = 93
    Height = 13
    Caption = '�������� ����� :'
  end
  object Button1: TButton
    Left = 332
    Top = 120
    Width = 75
    Height = 25
    Caption = '��'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 412
    Top = 120
    Width = 75
    Height = 25
    Caption = '�������'
    TabOrder = 1
    OnClick = Button2Click
  end
  object KKM_SUMM: TRxCalcEdit
    Left = 104
    Top = 60
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00 ���'
    NumGlyphs = 2
    TabOrder = 2
  end
end
