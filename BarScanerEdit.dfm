object BAR_SCANER_EDIT: TBAR_SCANER_EDIT
  Left = 415
  Top = 264
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '������ ����� �����'
  ClientHeight = 331
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object SaveButton: TButton
    Left = 288
    Top = 162
    Width = 75
    Height = 25
    Caption = '���������'
    TabOrder = 0
    OnClick = SaveButtonClick
  end
  object GroupBox1: TGroupBox
    Left = 216
    Top = 4
    Width = 153
    Height = 105
    Caption = '����������'
    TabOrder = 1
    object Label1: TLabel
      Left = 12
      Top = 16
      Width = 58
      Height = 13
      Caption = '���������'
    end
    object Label3: TLabel
      Left = 12
      Top = 60
      Width = 44
      Height = 13
      Caption = '�������'
    end
    object Edit1: TEdit
      Left = 12
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 12
      Top = 76
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'Edit2'
    end
  end
  object GroupBox2: TGroupBox
    Left = 4
    Top = 4
    Width = 201
    Height = 237
    Caption = '���������'
    TabOrder = 2
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 183
      Height = 13
      Caption = '������ ������ ��������� � �����: '
    end
    object Label4: TLabel
      Left = 8
      Top = 108
      Width = 85
      Height = 13
      Caption = '���� �� �������'
    end
    object Label5: TLabel
      Left = 8
      Top = 64
      Width = 179
      Height = 13
      Caption = '������ ������ ��������� � �����: '
    end
    object Label6: TLabel
      Left = 9
      Top = 192
      Width = 171
      Height = 13
      Caption = '����� ���������� ���������� � :'
    end
    object ComboBox1: TComboBox
      Left = 12
      Top = 32
      Width = 177
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBox1Change
      Items.Strings = (
        '�� ���������'
        'COM1'
        'COM2'
        'COM3'
        'COM4'
        'COM5'
        'COM6'
        'COM7'
        'COM8'
        'COM9'
        'COM10')
    end
    object Memo1: TMemo
      Left = 12
      Top = 124
      Width = 181
      Height = 53
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object ComboBox2: TComboBox
      Left = 12
      Top = 80
      Width = 177
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = ComboBox2Change
      Items.Strings = (
        '�� ���������'
        'COM1'
        'COM2'
        'COM3'
        'COM4'
        'COM5'
        'COM6'
        'COM7'
        'COM8'
        'COM9'
        'COM10')
    end
    object ComboBox3: TComboBox
      Left = 12
      Top = 208
      Width = 177
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      OnChange = ComboBox3Change
      Items.Strings = (
        '�� ���������'
        'COM1'
        'COM2'
        'COM3'
        'COM4'
        'COM5'
        'COM6'
        'COM7'
        'COM8'
        'COM9'
        'COM10')
    end
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = MAIN_FORM.read_transaction
    BufferChunks = 10
    CachedUpdates = False
    Left = 220
    Top = 144
  end
end
