object Form1: TForm1
  Left = 218
  Top = 188
  Width = 870
  Height = 640
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
  object Button1: TButton
    Left = 264
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = '192.168.0.1:bsklad2009'
    Params.Strings = (
      'user_name=beginner'
      'password=mayby'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 40
    Top = 48
  end
  object IBQuery1: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 136
    Top = 48
  end
end
