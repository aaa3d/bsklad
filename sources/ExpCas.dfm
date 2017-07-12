object EXP_CAS: TEXP_CAS
  Left = 304
  Top = 216
  Width = 408
  Height = 146
  Caption = 'Выгрузка товаров для загрузки в весы'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 12
    Width = 70
    Height = 13
    Caption = 'Файл обмена'
  end
  object FilenameEdit1: TFilenameEdit
    Left = 20
    Top = 32
    Width = 357
    Height = 21
    NumGlyphs = 1
    TabOrder = 0
    Text = 'c:\товары.csv'
  end
  object Button1: TButton
    Left = 272
    Top = 72
    Width = 103
    Height = 25
    Caption = 'Начать выгрузку'
    TabOrder = 1
    OnClick = Button1Click
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 32
    Top = 60
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 72
    Top = 68
  end
end
