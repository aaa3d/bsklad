object Form1: TForm1
  Left = 575
  Top = 487
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
  object Button2: TButton
    Left = 508
    Top = 312
    Width = 75
    Height = 25
    Caption = 'connect'
    TabOrder = 0
  end
  object Button1: TButton
    Left = 420
    Top = 312
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 1
  end
  object JvFontComboBox1: TJvFontComboBox
    Left = 52
    Top = 28
    Width = 145
    Height = 22
    DroppedDownWidth = 145
    MaxMRUCount = 0
    FontName = 'MS Sans Serif'
    ItemIndex = 16
    Sorted = False
    TabOrder = 2
  end
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = '192.168.0.1:bsklad2009'
    Params.Strings = (
      'user_name=beginner'
      'password=mayby'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 52
    Top = 88
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from list_doc_informer(:dt1, :dt2, 6, :shop_id)')
    Left = 52
    Top = 148
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dt1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'shop_id'
        ParamType = ptUnknown
      end>
    object IBQuery1INFORMER_DATA_ID: TIntegerField
      FieldName = 'INFORMER_DATA_ID'
      Origin = 'LIST_DOC_INFORMER.INFORMER_DATA_ID'
    end
    object IBQuery1DOC_TEXT: TIBStringField
      FieldName = 'DOC_TEXT'
      Origin = 'LIST_DOC_INFORMER.DOC_TEXT'
      Size = 254
    end
    object IBQuery1TM0: TDateTimeField
      FieldName = 'TM0'
      Origin = 'LIST_DOC_INFORMER.TM0'
    end
    object IBQuery1TM1: TDateTimeField
      FieldName = 'TM1'
      Origin = 'LIST_DOC_INFORMER.TM1'
    end
    object IBQuery1TM2: TDateTimeField
      FieldName = 'TM2'
      Origin = 'LIST_DOC_INFORMER.TM2'
    end
    object IBQuery1DOC_STATUS: TIntegerField
      FieldName = 'DOC_STATUS'
      Origin = 'LIST_DOC_INFORMER.DOC_STATUS'
    end
    object IBQuery1DOC_STATUS_DESC: TIBStringField
      FieldName = 'DOC_STATUS_DESC'
      Origin = 'LIST_DOC_INFORMER.DOC_STATUS_DESC'
      Size = 32
    end
    object IBQuery1SKL_SHORT: TIBStringField
      FieldName = 'SKL_SHORT'
      Origin = 'LIST_DOC_INFORMER.SKL_SHORT'
      Size = 32
    end
    object IBQuery1SHOP_COLOR: TIntegerField
      FieldName = 'SHOP_COLOR'
      Origin = 'LIST_DOC_INFORMER.SHOP_COLOR'
    end
    object IBQuery1STATUS_COLOR: TIntegerField
      FieldName = 'STATUS_COLOR'
      Origin = 'LIST_DOC_INFORMER.STATUS_COLOR'
    end
  end
  object IBTransaction1: TIBTransaction
    Active = True
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 52
    Top = 200
  end
end
