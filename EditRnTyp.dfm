object Edit_Rntyp: TEdit_Rntyp
  Left = 392
  Top = 184
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '��� ��������� ���������'
  ClientHeight = 405
  ClientWidth = 550
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 67
    Top = 12
    Width = 70
    Height = 13
    Caption = '���������� :'
  end
  object Label2: TLabel
    Left = 42
    Top = 36
    Width = 95
    Height = 13
    Caption = '������ �������� :'
  end
  object Label3: TLabel
    Left = 29
    Top = 60
    Width = 108
    Height = 13
    Caption = '������� ��������� :'
  end
  object Image3: TImage
    Left = 498
    Top = 290
    Width = 16
    Height = 16
    Hint = 
      '������ ����� ������������� ����������� ��������,'#13#10'��������� � ��' +
      '������� Beginner(R)'
    AutoSize = True
    Picture.Data = {
      07544269746D6170F6000000424DF60000000000000076000000280000001000
      000010000000010004000000000080000000120B0000120B0000100000000000
      0000000000000000800000800000008080008000000080008000808000008080
      8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF008888888888888888888884F8888888888888444F888888888884444F8888
      888888444F44F88888888444F8844F888888884F88884F8888888888888884F8
      888888BBBBBB884F88888000000BB884F8888800B800B8884F888800BB008888
      84F88800000BB88888488800B800B88888888800BB0088888888800000088888
      8888}
    Transparent = True
  end
  object Label4: TLabel
    Left = 24
    Top = 206
    Width = 113
    Height = 13
    Caption = '������ � ���������� :'
  end
  object Label5: TLabel
    Left = 35
    Top = 234
    Width = 102
    Height = 13
    Caption = '������ � �������� :'
  end
  object Image1: TImage
    Left = 142
    Top = 206
    Width = 16
    Height = 16
    AutoSize = True
    Transparent = True
  end
  object Image2: TImage
    Left = 142
    Top = 234
    Width = 16
    Height = 16
    AutoSize = True
    Transparent = True
  end
  object Label6: TLabel
    Left = 22
    Top = 262
    Width = 115
    Height = 13
    Caption = '��� ��� ����������:'
  end
  object Label7: TLabel
    Left = 4
    Top = 290
    Width = 133
    Height = 13
    Caption = '������� ����� � ������ :'
  end
  object BtnNP: TSpeedButton
    Left = 240
    Top = 286
    Width = 15
    Height = 22
    Hint = 
      '������� ��������� ������ ������ � ������ �� ������� ���� �������' +
      '�� ���������...'
    Glyph.Data = {
      96000000424D9600000000000000760000002800000008000000080000000100
      0400000000002000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
      FFFFFFF0FFFFFF000FFFF00000FF0000000FFFFFFFFFFFFFFFFF}
    OnClick = BtnNPClick
  end
  object Label8: TLabel
    Left = 48
    Top = 176
    Width = 88
    Height = 13
    Caption = '��� ���������� :'
  end
  object Label9: TLabel
    Left = 33
    Top = 92
    Width = 99
    Height = 13
    Caption = '������� � ��������'
  end
  object RNTYP_SHORT: TEdit
    Left = 142
    Top = 8
    Width = 121
    Height = 21
    MaxLength = 32
    TabOrder = 0
    Text = 'RNTYP_SHORT'
    OnChange = RNTYP_SHORTChange
  end
  object RNTYP_FULL: TEdit
    Left = 142
    Top = 32
    Width = 289
    Height = 21
    MaxLength = 254
    TabOrder = 1
    Text = 'RNTYP_FULL'
    OnChange = RNTYP_SHORTChange
  end
  object NUM_TYP: TComboBox
    Left = 142
    Top = 56
    Width = 289
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    OnChange = RNTYP_SHORTChange
    Items.Strings = (
      '��������� � ���� ���� ����������� ��������'
      '�������� ��������� � ���� ����'
      '�������� ��������� �� ���� �����'
      
        '� ������ ����������� ����, ���������  � ���� ����������� �������' +
        '��')
  end
  object BtnSave: TButton
    Left = 458
    Top = 4
    Width = 75
    Height = 25
    Caption = '���������'
    TabOrder = 7
    OnClick = BtnSaveClick
  end
  object BtnApply: TButton
    Left = 458
    Top = 32
    Width = 75
    Height = 25
    Caption = '���������'
    TabOrder = 8
    OnClick = BtnApplyClick
  end
  object BtnClose: TButton
    Left = 458
    Top = 60
    Width = 75
    Height = 25
    Caption = '�������'
    TabOrder = 9
    OnClick = BtnCloseClick
  end
  object ComboBox1: TComboBox
    Left = 166
    Top = 206
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
    OnChange = ComboBox1Change
  end
  object ComboBox2: TComboBox
    Left = 166
    Top = 234
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
    OnChange = ComboBox2Change
  end
  object Cl: TCheckBox
    Left = 142
    Top = 120
    Width = 341
    Height = 17
    Caption = '������ �� ������� ���� ��������� ������� �� �����������'
    TabOrder = 3
    OnClick = ClClick
  end
  object RNTYP_NDS: TComboBox
    Left = 142
    Top = 258
    Width = 223
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
    OnChange = RNTYP_NDSChange
    Items.Strings = (
      '�� ���������'
      '������ ��������!'
      '�� ��������!')
  end
  object NP: TEdit
    Left = 142
    Top = 286
    Width = 99
    Height = 21
    ReadOnly = True
    TabOrder = 10
    Text = 'NP'
  end
  object checkTemp: TCheckBox
    Left = 142
    Top = 152
    Width = 337
    Height = 17
    Caption = '������� (������������� ��������� � ��������)'
    TabOrder = 11
  end
  object cmbRealTyp: TComboBox
    Left = 142
    Top = 176
    Width = 169
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 12
    Items.Strings = (
      '������� ��������'
      '��������� ��������')
  end
  object RNTYP_SPEED: TComboBox
    Left = 140
    Top = 88
    Width = 293
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 13
    Items.Strings = (
      '�� ���������� � ������� ������� � �������� ������'
      '���������� � ������� ������� � �������� ������ � ��������'
      '��������� ������ � ������� �������')
  end
  object chkIn_USE: TCheckBox
    Left = 142
    Top = 324
    Width = 255
    Height = 17
    Caption = '������������ � ������'
    TabOrder = 14
    OnClick = ClClick
  end
  object RnTypTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 294
    Top = 8
  end
  object QueryRnTyp: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = RnTypTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 378
    Top = 8
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 412
    Top = 226
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 482
    Top = 224
  end
end
