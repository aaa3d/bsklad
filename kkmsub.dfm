object KKM_SUB: TKKM_SUB
  Left = 208
  Top = 185
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '������ �����'
  ClientHeight = 98
  ClientWidth = 404
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
    Width = 401
    Height = 53
    Visible = False
  end
  object Label1: TLabel
    Left = 4
    Top = 8
    Width = 391
    Height = 13
    Caption = 
      '��������! ����� ����� �����, �� ����������� ��, ��� ��������� � ' +
      '�����!'
    Visible = False
  end
  object Label3: TLabel
    Left = 32
    Top = 40
    Width = 344
    Height = 13
    Caption = '������ �������� ������� ������������� ���� �� ������ � ������!'
    Visible = False
  end
  object Label6: TLabel
    Left = 0
    Top = 68
    Width = 101
    Height = 13
    Caption = '��������� ����� :'
  end
  object Label2: TLabel
    Left = 16
    Top = 24
    Width = 372
    Height = 13
    Caption = 
      '����� ����� ��������� �� 10 ��� � ������� ����� ����������� ����' +
      '� !'
    Visible = False
  end
  object Button1: TButton
    Left = 244
    Top = 64
    Width = 75
    Height = 25
    Caption = '��'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 324
    Top = 64
    Width = 75
    Height = 25
    Caption = '�������'
    TabOrder = 1
    OnClick = Button2Click
  end
  object KKM_SUMM: TRxCalcEdit
    Left = 100
    Top = 64
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00 ���'
    NumGlyphs = 2
    TabOrder = 2
  end
end
