object Edit_PnVid: TEdit_PnVid
  Left = 30
  Top = 144
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '��� ��������� ���������'
  ClientHeight = 92
  ClientWidth = 617
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 94
    Top = 8
    Width = 56
    Height = 13
    Caption = '�������� :'
  end
  object Image3: TImage
    Left = 0
    Top = 74
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
  object Label1: TLabel
    Left = 0
    Top = 32
    Width = 150
    Height = 13
    Caption = '������ ������� ���������� :'
  end
  object PNVID_NAM: TEdit
    Left = 156
    Top = 4
    Width = 365
    Height = 21
    MaxLength = 254
    TabOrder = 0
    Text = 'PNVID_NAM'
    OnChange = PNVID_NAMChange
  end
  object BtnSave: TButton
    Left = 536
    Top = 4
    Width = 75
    Height = 25
    Caption = '���������'
    TabOrder = 2
    OnClick = BtnSaveClick
  end
  object BtnApply: TButton
    Left = 536
    Top = 32
    Width = 75
    Height = 25
    Caption = '���������'
    TabOrder = 3
    OnClick = BtnApplyClick
  end
  object BtnClose: TButton
    Left = 536
    Top = 60
    Width = 75
    Height = 25
    Caption = '�������'
    TabOrder = 4
    OnClick = BtnCloseClick
  end
  object PNVID_ACTIV: TComboBox
    Left = 156
    Top = 28
    Width = 365
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = 'PNVID_ACTIV'
    OnChange = PNVID_ACTIVChange
    Items.Strings = (
      '����������� ������ ������ ���� �� ���������� �� "����� � ������"'
      '��������� ����������� ������ ������������ � ����������'
      '��������� ����������� ������ ����������� ����������')
  end
  object PnVidTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 276
    Top = 8
  end
  object QueryPnVid: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PnVidTransaction
    CachedUpdates = False
    Left = 360
    Top = 8
  end
end
