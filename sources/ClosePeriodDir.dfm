object CLOSE_PERIOD_DIR: TCLOSE_PERIOD_DIR
  Left = 79
  Top = 147
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '�������� ������� ����������'
  ClientHeight = 118
  ClientWidth = 494
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 2
    Width = 481
    Height = 52
    Caption = 
      '  � ������ ���� �������� ���� �������� �������, ������ ������� �' +
      '��������� ����� ������ '#13#10'������������������ �������� �������. ��' +
      '������� ������������� ��� ������ �� ��������'#13#10'��� �������� �����' +
      '�� � ����� ��� ���������� ����������� ������� ��������� "������"' +
      #13#10'������ ����������� ����������'
  end
  object Label2: TLabel
    Left = 4
    Top = 62
    Width = 25
    Height = 13
    Caption = '����'
  end
  object Label3: TLabel
    Left = 4
    Top = 90
    Width = 267
    Height = 13
    Caption = '���������� ���������� ���� �������� ������� �� :'
  end
  object DT: TDateEdit
    Left = 276
    Top = 86
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 0
  end
  object Button1: TButton
    Left = 412
    Top = 60
    Width = 75
    Height = 25
    Caption = '��'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 412
    Top = 88
    Width = 75
    Height = 25
    Caption = '������'
    TabOrder = 2
    OnClick = Button2Click
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 84
    Top = 46
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 174
    Top = 44
  end
end
