object Edit_Pntyp: TEdit_Pntyp
  Left = 65
  Top = 172
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '��� ��������� ���������'
  ClientHeight = 196
  ClientWidth = 529
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 78
    Top = 12
    Width = 70
    Height = 13
    Caption = '���������� :'
  end
  object Label2: TLabel
    Left = 53
    Top = 36
    Width = 95
    Height = 13
    Caption = '������ �������� :'
  end
  object Label3: TLabel
    Left = 40
    Top = 60
    Width = 108
    Height = 13
    Caption = '������� ��������� :'
  end
  object Image3: TImage
    Left = 510
    Top = 176
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
    Left = 44
    Top = 84
    Width = 110
    Height = 13
    Caption = '������� $ ������� :'
  end
  object Label5: TLabel
    Left = 8
    Top = 136
    Width = 113
    Height = 13
    Caption = '������ � ���������� :'
  end
  object Image1: TImage
    Left = 128
    Top = 136
    Width = 16
    Height = 16
    AutoSize = True
    Transparent = True
  end
  object Image2: TImage
    Left = 128
    Top = 164
    Width = 16
    Height = 16
    AutoSize = True
    Transparent = True
  end
  object Label6: TLabel
    Left = 16
    Top = 164
    Width = 102
    Height = 13
    Caption = '������ � �������� :'
  end
  object PNTYP_SHORT: TEdit
    Left = 152
    Top = 8
    Width = 121
    Height = 21
    MaxLength = 32
    TabOrder = 0
    Text = 'PNTYP_SHORT'
    OnChange = PNTYP_SHORTChange
  end
  object PNTYP_FULL: TEdit
    Left = 152
    Top = 32
    Width = 289
    Height = 21
    MaxLength = 254
    TabOrder = 1
    Text = 'PNTYP_FULL'
    OnChange = PNTYP_SHORTChange
  end
  object NUM_TYP: TComboBox
    Left = 152
    Top = 56
    Width = 289
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = 'NUM_TYP'
    OnChange = PNTYP_SHORTChange
    Items.Strings = (
      '��������� � ���� ���� ����������� ��������'
      '�������� ��������� � ���� ����'
      '�������� ��������� �� ���� �����'
      
        '� ������ ����������� ����, ���������  � ���� ����������� �������' +
        '��')
  end
  object BtnSave: TButton
    Left = 448
    Top = 4
    Width = 75
    Height = 25
    Caption = '���������'
    TabOrder = 7
    OnClick = BtnSaveClick
  end
  object BtnApply: TButton
    Left = 448
    Top = 32
    Width = 75
    Height = 25
    Caption = '���������'
    TabOrder = 8
    OnClick = BtnApplyClick
  end
  object BtnClose: TButton
    Left = 448
    Top = 60
    Width = 75
    Height = 25
    Caption = '�������'
    TabOrder = 9
    OnClick = BtnCloseClick
  end
  object PNTYP_CALC: TComboBox
    Left = 152
    Top = 80
    Width = 289
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Text = 'PNTYP_CALC'
    OnChange = PNTYP_CALCChange
    Items.Strings = (
      '������� 1'
      '������� 2')
  end
  object PNTYP_POST_CALC: TCheckBox
    Left = 4
    Top = 108
    Width = 469
    Height = 17
    Caption = 
      '������ ��� ��������� ��������� ��������� � ������� ������� "����' +
      '�� � �����������"'
    TabOrder = 4
  end
  object ComboBox1: TComboBox
    Left = 152
    Top = 136
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = 'ComboBox1'
    OnChange = ComboBox1Change
  end
  object ComboBox2: TComboBox
    Left = 152
    Top = 164
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    Text = 'ComboBox1'
    OnChange = ComboBox2Change
  end
  object PnTypTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 276
    Top = 8
  end
  object QueryPnTyp: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PnTypTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 360
    Top = 8
  end
end
