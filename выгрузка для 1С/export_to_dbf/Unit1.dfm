object Form1: TForm1
  Left = 323
  Top = 181
  Width = 1305
  Height = 669
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 208
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 136
    Top = 40
  end
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = '192.168.0.9:bsklad2009'
    Params.Strings = (
      'user_name=beginner'
      'password=mayby'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 64
    Top = 32
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from NEW_PROCEDURE_EXPORT_TW_FOR_1C2')
    Left = 64
    Top = 128
    object IBQuery1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.ID'
    end
    object IBQuery1ART: TIBStringField
      FieldName = 'ART'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.ART'
      Size = 254
    end
    object IBQuery1NAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.NAME'
      Size = 254
    end
    object IBQuery1FNAME: TIBStringField
      FieldName = 'FNAME'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.FNAME'
      Size = 254
    end
    object IBQuery1PARENT: TIntegerField
      FieldName = 'PARENT'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.PARENT'
    end
    object IBQuery1EDIZM: TIBStringField
      FieldName = 'EDIZM'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.EDIZM'
      Size = 32
    end
    object IBQuery1VEDIZM: TIntegerField
      FieldName = 'VEDIZM'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.VEDIZM'
    end
    object IBQuery1OEDIZM: TIntegerField
      FieldName = 'OEDIZM'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.OEDIZM'
    end
    object IBQuery1VN: TIntegerField
      FieldName = 'VN'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.VN'
    end
    object IBQuery1NDA: TIntegerField
      FieldName = 'NDA'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.NDA'
    end
    object IBQuery1SZ: TIntegerField
      FieldName = 'SZ'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.SZ'
    end
    object IBQuery1PROIZV: TIBStringField
      FieldName = 'PROIZV'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.PROIZV'
      Size = 254
    end
    object IBQuery1STRANA: TIBStringField
      FieldName = 'STRANA'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.STRANA'
      Size = 254
    end
    object IBQuery1OPIS: TIBStringField
      FieldName = 'OPIS'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.OPIS'
      Size = 9000
    end
    object IBQuery1KOMMENT: TIBStringField
      FieldName = 'KOMMENT'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.KOMMENT'
      Size = 9000
    end
    object IBQuery1PR: TIntegerField
      FieldName = 'PR'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.PR'
    end
    object IBQuery1UPAK: TIntegerField
      FieldName = 'UPAK'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.UPAK'
    end
    object IBQuery1IDS: TIntegerField
      FieldName = 'IDS'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.IDS'
    end
    object IBQuery1KO: TFloatField
      FieldName = 'KO'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.KO'
    end
    object IBQuery1SO: TFloatField
      FieldName = 'SO'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.SO'
    end
    object IBQuery1FILES: TIBStringField
      FieldName = 'FILES'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.FILES'
      Size = 9000
    end
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 224
    Top = 32
  end
  object Dbf1: TDbf
    FilePath = 'C:\unloading\'
    IndexDefs = <>
    OpenMode = omAutoCreate
    StoreDefs = True
    TableName = 'catalog.dbf'
    TableLevel = 4
    UseFloatFields = False
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ART'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'FNAME'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'PARENT'
        DataType = ftInteger
      end
      item
        Name = 'EDIZM'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'VEDIZM'
        DataType = ftInteger
      end
      item
        Name = 'OEDIZM'
        DataType = ftInteger
      end
      item
        Name = 'VN'
        DataType = ftInteger
      end
      item
        Name = 'NDA'
        DataType = ftInteger
      end
      item
        Name = 'SZ'
        DataType = ftInteger
      end
      item
        Name = 'PROIZV'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'STRANA'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'OPIS'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'KOMMENT'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'PR'
        DataType = ftInteger
      end
      item
        Name = 'UPAK'
        DataType = ftInteger
      end
      item
        Name = 'IDS'
        DataType = ftInteger
      end
      item
        Name = 'KO'
        DataType = ftFloat
        Precision = 9
      end
      item
        Name = 'SO'
        DataType = ftFloat
        Precision = 9
      end
      item
        Name = 'FILES'
        DataType = ftString
        Size = 255
      end>
    Left = 384
    Top = 96
    object Dbf1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.ID'
    end
    object Dbf1ART: TIBStringField
      FieldName = 'ART'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.ART'
      Size = 254
    end
    object Dbf1NAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.NAME'
      Size = 254
    end
    object Dbf1FNAME: TIBStringField
      FieldName = 'FNAME'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.FNAME'
      Size = 254
    end
    object Dbf1PARENT: TIntegerField
      FieldName = 'PARENT'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.PARENT'
    end
    object Dbf1EDIZM: TIBStringField
      FieldName = 'EDIZM'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.EDIZM'
      Size = 32
    end
    object Dbf1VEDIZM: TIntegerField
      FieldName = 'VEDIZM'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.VEDIZM'
    end
    object Dbf1OEDIZM: TIntegerField
      FieldName = 'OEDIZM'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.OEDIZM'
    end
    object Dbf1VN: TIntegerField
      FieldName = 'VN'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.VN'
    end
    object Dbf1NDA: TIntegerField
      FieldName = 'NDA'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.NDA'
    end
    object Dbf1SZ: TIntegerField
      FieldName = 'SZ'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.SZ'
    end
    object Dbf1PROIZV: TIBStringField
      FieldName = 'PROIZV'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.PROIZV'
      Size = 254
    end
    object Dbf1STRANA: TIBStringField
      FieldName = 'STRANA'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.STRANA'
      Size = 254
    end
    object Dbf1OPIS: TIBStringField
      FieldName = 'OPIS'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.OPIS'
      Size = 255
    end
    object Dbf1KOMMENT: TIBStringField
      FieldName = 'KOMMENT'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.KOMMENT'
      Size = 255
    end
    object Dbf1PR: TIntegerField
      FieldName = 'PR'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.PR'
    end
    object Dbf1UPAK: TIntegerField
      FieldName = 'UPAK'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.UPAK'
    end
    object Dbf1IDS: TIntegerField
      FieldName = 'IDS'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.IDS'
    end
    object Dbf1KO: TFloatField
      FieldName = 'KO'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.KO'
    end
    object Dbf1SO: TFloatField
      FieldName = 'SO'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.SO'
    end
    object Dbf1FILES: TIBStringField
      FieldName = 'FILES'
      Origin = 'NEW_PROCEDURE_EXPORT_TW_FOR_1C.FILES'
      Size = 255
    end
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '#39#1050#1056#1054#1055#1058#39' TC , tmp_report_int_move.tw_id ID,'
      
        '(select tw_price_frm.money from  tw_price_frm(tmp_report_int_mov' +
        'e.tw_id, 2, 0, 0)) PRICE'
      'from tmp_report_int_move'
      'where report_id=2018')
    Left = 64
    Top = 208
    object IBQuery2TC: TIBStringField
      FieldName = 'TC'
      Required = True
      FixedChar = True
      Size = 5
    end
    object IBQuery2ID: TIntegerField
      FieldName = 'ID'
      Origin = 'TMP_REPORT_INT_MOVE.TW_ID'
    end
    object IBQuery2PRICE: TFloatField
      FieldName = 'PRICE'
    end
  end
  object Dbf2: TDbf
    FilePath = 'C:\unloading\'
    IndexDefs = <>
    OpenMode = omAutoCreate
    StoreDefs = True
    TableName = 'price.dbf'
    TableLevel = 4
    UseFloatFields = False
    FieldDefs = <
      item
        Name = 'TC'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'PRICE'
        DataType = ftFloat
        Precision = 9
      end>
    Left = 384
    Top = 160
    object Dbf2TC: TIBStringField
      FieldName = 'TC'
      Required = True
      FixedChar = True
      Size = 5
    end
    object Dbf2ID: TIntegerField
      FieldName = 'ID'
      Origin = 'TMP_REPORT_INT_MOVE.TW_ID'
    end
    object Dbf2PRICE: TFloatField
      FieldName = 'PRICE'
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 480
    Top = 80
  end
end
