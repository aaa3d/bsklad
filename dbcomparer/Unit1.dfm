object Form1: TForm1
  Left = 192
  Top = 124
  Width = 1142
  Height = 656
  Caption = 'Form1'
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
    Left = 24
    Top = 72
    Width = 73
    Height = 13
    Caption = 'Label1'
  end
  object Button1: TButton
    Left = 16
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 112
    Top = 32
    Width = 449
    Height = 545
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = '192.168.0.1:bsklad2009'
    Params.Strings = (
      'user_name=beginner'
      'password=mayby'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 704
    Top = 264
  end
  object IBDatabase2: TIBDatabase
    DatabaseName = '192.168.0.5:bsklad2009'
    Params.Strings = (
      'user_name=beginner'
      'password=mayby'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction2
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 704
    Top = 344
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 880
    Top = 264
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase2
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    Left = 872
    Top = 336
  end
  object IBTransaction1: TIBTransaction
    Active = False
    AutoStopAction = saNone
    Left = 808
    Top = 256
  end
  object IBTransaction2: TIBTransaction
    Active = False
    AutoStopAction = saNone
    Left = 808
    Top = 336
  end
end
