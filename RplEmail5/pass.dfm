object PassForm: TPassForm
  Left = 405
  Top = 225
  Width = 311
  Height = 196
  Caption = 'Пароль'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 38
    Height = 13
    Caption = 'Пароль'
  end
  object password: TEdit
    Left = 64
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 192
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Принять'
    TabOrder = 1
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 40
    Width = 257
    Height = 105
    Caption = 'Смена пароля'
    Enabled = False
    TabOrder = 2
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 73
      Height = 13
      Caption = 'Новый пароль'
    end
    object newPassword: TEdit
      Left = 120
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 64
      Width = 121
      Height = 17
      Caption = 'Подтверждение'
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object Button2: TButton
      Left = 168
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Сменить'
      Enabled = False
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 80
    Top = 40
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select cfg_id, cfg_value from cfg where cfg_name = "RPL_PASSWORD' +
        '"')
    Left = 80
    Top = 80
  end
end
