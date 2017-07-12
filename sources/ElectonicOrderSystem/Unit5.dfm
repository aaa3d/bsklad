object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 293
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 152
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 120
    Top = 72
    Width = 265
    Height = 201
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = '127.0.0.1:c:\base\current\bsklad2005.fdb'
    Params.Strings = (
      'user_name=beginner'
      'password=mayby'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    SQLDialect = 1
    AllowStreamedConnected = False
    Left = 32
    Top = 16
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    Left = 32
    Top = 136
  end
  object IBTransaction1: TIBTransaction
    Left = 32
    Top = 72
  end
end
