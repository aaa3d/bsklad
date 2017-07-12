object Form6: TForm6
  Left = 0
  Top = 0
  Caption = 'Form6'
  ClientHeight = 491
  ClientWidth = 670
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
    Left = 272
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object JvUIBDataBase1: TUIBDataBase
    Params.Strings = (
      'sql_dialect=3'
      'lc_ctype=WIN1251'
      'user_name=beginner'
      'password=mayby')
    DatabaseName = '192.168.0.16:c:\base\current\bsklad2005.fdb'
    CharacterSet = csWIN1251
    UserName = 'beginner'
    PassWord = 'mayby'
    LibraryName = 'gds32.dll'
    Left = 480
    Top = 24
  end
  object JvUIBTransaction1: TUIBTransaction
    DataBase = JvUIBDataBase1
    Left = 432
    Top = 256
  end
  object JvUIBQuery1: TUIBQuery
    Transaction = JvUIBTransaction1
    DataBase = JvUIBDataBase1
    Left = 528
    Top = 200
  end
end
