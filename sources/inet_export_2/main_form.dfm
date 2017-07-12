object Form6: TForm6
  Left = 0
  Top = 0
  Caption = 'Form6'
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
    Left = 288
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = '192.168.0.24:bsklad2009'
    Params.Strings = (
      'user_name=beginner'
      'password=mayby'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    SQLDialect = 1
    Left = 144
    Top = 56
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1
    SQL.Strings = (
      'select out_str from inet_data_export_3(:export_param)')
    Left = 240
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'export_param'
        ParamType = ptUnknown
      end>
    object IBQuery1OUT_STR: TIBStringField
      FieldName = 'OUT_STR'
      Origin = 'INET_DATA_EXPORT_3.OUT_STR'
      Size = 11000
    end
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 192
    Top = 136
  end
  object IdTrivialFTP1: TIdTrivialFTP
    Port = 69
    ReceiveTimeout = 4000
    Left = 64
    Top = 104
  end
  object IdFTP1: TIdFTP
    AutoLogin = True
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 40
    Top = 176
  end
  object IBSQL1: TIBSQL
    Database = IBDatabase1
    SQL.Strings = (
      'select out_str from inet_data_export_3(:export_param)')
    Transaction = IBTransaction1
    Left = 320
    Top = 72
  end
end
