object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 403
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 359
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 425
    Height = 345
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = '127.0.0.1:c:\base\current\bsklad2005.fdb'
    Params.Strings = (
      'user_name=beginner'
      'password=mayby'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    SQLDialect = 1
    AllowStreamedConnected = False
    Left = 32
    Top = 16
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait'
      'read')
    Left = 32
    Top = 64
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from PRINT_PRICE_FRM(:TWDYNGROUP_ID,'
      ':TWDYNGROUP_TYP, 1, 0, 1, :kln_id, :frm_id)')
    Left = 32
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TWDYNGROUP_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TWDYNGROUP_TYP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'kln_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'frm_id'
        ParamType = ptUnknown
      end>
    object IBQuery1TW_ID: TIntegerField
      FieldName = 'TW_ID'
      Origin = 'PRINT_PRICE_FRM.TW_ID'
    end
    object IBQuery1TW_OST: TFloatField
      FieldName = 'TW_OST'
      Origin = 'PRINT_PRICE_FRM.TW_OST'
    end
    object IBQuery1TW_ART: TIntegerField
      FieldName = 'TW_ART'
      Origin = 'PRINT_PRICE_FRM.TW_ART'
    end
    object IBQuery1TW_NAM: TIBStringField
      FieldName = 'TW_NAM'
      Origin = 'PRINT_PRICE_FRM.TW_NAM'
      Size = 254
    end
    object IBQuery1ED_SHORT: TIBStringField
      FieldName = 'ED_SHORT'
      Origin = 'PRINT_PRICE_FRM.ED_SHORT'
      Size = 32
    end
    object IBQuery1TWTREE_ID: TIntegerField
      FieldName = 'TWTREE_ID'
      Origin = 'PRINT_PRICE_FRM.TWTREE_ID'
    end
    object IBQuery1TW_KWM_ONE: TFloatField
      FieldName = 'TW_KWM_ONE'
      Origin = 'PRINT_PRICE_FRM.TW_KWM_ONE'
    end
    object IBQuery1TW_MROZ: TFloatField
      FieldName = 'TW_MROZ'
      Origin = 'PRINT_PRICE_FRM.TW_MROZ'
    end
    object IBQuery1TWTREE_FULL: TIBStringField
      FieldName = 'TWTREE_FULL'
      Origin = 'PRINT_PRICE_FRM.TWTREE_FULL'
      Size = 1000
    end
    object IBQuery1MONEY1: TFloatField
      FieldName = 'MONEY1'
      Origin = 'PRINT_PRICE_FRM.MONEY1'
    end
    object IBQuery1MONEY2: TFloatField
      FieldName = 'MONEY2'
      Origin = 'PRINT_PRICE_FRM.MONEY2'
    end
    object IBQuery1MONEY3: TFloatField
      FieldName = 'MONEY3'
      Origin = 'PRINT_PRICE_FRM.MONEY3'
    end
    object IBQuery1MONEY4: TFloatField
      FieldName = 'MONEY4'
      Origin = 'PRINT_PRICE_FRM.MONEY4'
    end
    object IBQuery1MONEY5: TFloatField
      FieldName = 'MONEY5'
      Origin = 'PRINT_PRICE_FRM.MONEY5'
    end
    object IBQuery1TW_BRAK: TIBStringField
      FieldName = 'TW_BRAK'
      Origin = 'PRINT_PRICE_FRM.TW_BRAK'
      FixedChar = True
      Size = 1
    end
    object IBQuery1MON_NAL: TFloatField
      FieldName = 'MON_NAL'
      Origin = 'PRINT_PRICE_FRM.MON_NAL'
    end
    object IBQuery1MON_BNAL: TFloatField
      FieldName = 'MON_BNAL'
      Origin = 'PRINT_PRICE_FRM.MON_BNAL'
    end
    object IBQuery1BNAL_SALE: TIntegerField
      FieldName = 'BNAL_SALE'
      Origin = 'PRINT_PRICE_FRM.BNAL_SALE'
    end
    object IBQuery1NAL_SALE: TIntegerField
      FieldName = 'NAL_SALE'
      Origin = 'PRINT_PRICE_FRM.NAL_SALE'
    end
    object IBQuery1KLN_FULL: TIBStringField
      FieldName = 'KLN_FULL'
      Origin = 'PRINT_PRICE_FRM.KLN_FULL'
      Size = 64
    end
  end
  object DataSource1: TDataSource
    DataSet = IBQuery2
    Left = 40
    Top = 224
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      
        'select kln_id, kln_inn, (select kln_full from kln_data(propkln.k' +
        'ln_id)) kln_name from propkln, kln'
      'where frm_id=2696877'
      'and typ=3'
      'and valueint=4'
      'and kln.kln_id=propkln.kln_id')
    Left = 16
    Top = 296
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 272
    Top = 152
  end
end
