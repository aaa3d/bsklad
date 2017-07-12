object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Form5'
  ClientHeight = 463
  ClientWidth = 709
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    709
    463)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 102
    Height = 13
    Caption = #1057#1087#1080#1089#1086#1082' '#1073#1072#1079' '#1076#1072#1085#1085#1099#1093'.'
  end
  object Label2: TLabel
    Left = 224
    Top = 8
    Width = 238
    Height = 13
    Caption = #1057#1090#1088#1086#1082#1072' '#1079#1072#1087#1088#1086#1089#1072' - '#1080#1084#1103' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1080' '#1077#1075#1086' '#1074#1077#1083#1080#1095#1080#1085#1072
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 240
    Width = 701
    Height = 215
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = JvDataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 531
    Top = 209
    Width = 158
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1103
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 209
    Width = 158
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100' '#1089#1088#1072#1074#1085#1077#1085#1080#1077
    TabOrder = 2
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 27
    Width = 185
    Height = 134
    Lines.Strings = (
      'crater:bsklad2009'
      'andromeda:bsklad2009'
      'hercules:bsklad2009'
      '85.21.210.42:bsklad2009'
      '94.136.222.154:bsklad2009')
    TabOrder = 3
    OnChange = Memo1Change
  end
  object Memo2: TMemo
    Left = 224
    Top = 27
    Width = 465
    Height = 176
    Anchors = [akLeft, akTop, akRight]
    Lines.Strings = (
      'select  tw_art||" "||tw_nam tw_name, ost.tw_id, skl_id,frm_id,'
      '(ost.tw_kol - case when (select sum(tw_kol) from reg'
      
        'where reg.tw_id = ost.tw_id and reg.skl_id = ost.skl_id and reg.' +
        'frm_id = ost.frm_id and '
      'reg.dt> "02/01/2010") is null then 0'
      'else (select sum(tw_kol) from reg'
      
        'where reg.tw_id = ost.tw_id and reg.skl_id = ost.skl_id and reg.' +
        'frm_id = ost.frm_id and '
      'reg.dt> "02/01/2010")'
      '    end)  tw_kol'
      ''
      'from ost, tw'
      'where tw.tw_id=ost.tw_id and '
      'bg_abs(ost.tw_kol - case when (select sum(tw_kol) from reg'
      
        'where reg.tw_id = ost.tw_id and reg.skl_id = ost.skl_id and reg.' +
        'frm_id = ost.frm_id and '
      'reg.dt> "02/01/2010") is null then 0'
      'else (select sum(tw_kol) from reg'
      
        'where reg.tw_id = ost.tw_id and reg.skl_id = ost.skl_id and reg.' +
        'frm_id = ost.frm_id and '
      'reg.dt> "02/01/2010")'
      '    end)>0.01')
    TabOrder = 4
  end
  object JvDataSource1: TJvDataSource
    DataSet = kbmMemTable1111
    Left = 144
    Top = 144
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    Left = 32
    Top = 104
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = 'crater:sklad'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    Left = 32
    Top = 160
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 32
    Top = 208
  end
  object kbmMemTable1111: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'tw_name'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'tw_id'
        DataType = ftInteger
      end
      item
        Name = 'skl_id'
        DataType = ftInteger
      end
      item
        Name = 'frm_id'
        DataType = ftInteger
      end
      item
        Name = 'crater'
        DataType = ftFloat
      end
      item
        Name = 'andromeda'
        DataType = ftFloat
      end
      item
        Name = 'hercules'
        DataType = ftFloat
      end
      item
        Name = 'ol4'
        DataType = ftFloat
      end
      item
        Name = 'ol3'
        DataType = ftFloat
      end
      item
        Name = 'full_key'
        DataType = ftString
        Size = 32
      end>
    IndexFieldNames = 'full_key'
    IndexName = 'kbmMemTable1111Index8'
    IndexDefs = <
      item
        Name = 'kbmMemTable1111Index8'
        Fields = 'full_key'
        Options = [ixUnique]
      end
      item
        Name = 'kbmMemTable1111Index9'
        Fields = 'tw_id'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.51'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 128
    Top = 256
    object kbmMemTable1111tw_name: TStringField
      DisplayWidth = 15
      FieldName = 'tw_name'
      Size = 250
    end
    object kbmMemTable1111tw_id: TIntegerField
      FieldName = 'tw_id'
      LookupCache = True
    end
    object kbmMemTable1111skl_id: TIntegerField
      FieldName = 'skl_id'
      LookupCache = True
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object kbmMemTable1111frm_id: TIntegerField
      FieldName = 'frm_id'
      LookupCache = True
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object kbmMemTable1111crater: TFloatField
      FieldName = 'crater'
      DisplayFormat = '0.000'
    end
    object kbmMemTable1111andromeda: TFloatField
      FieldName = 'andromeda'
      DisplayFormat = '0.000'
    end
    object kbmMemTable1111hercules: TFloatField
      FieldName = 'hercules'
      DisplayFormat = '0.000'
    end
    object kbmMemTable1111ol4: TFloatField
      FieldName = 'ol4'
      DisplayFormat = '0.000'
    end
    object kbmMemTable1111ol3: TFloatField
      FieldName = 'ol3'
      DisplayFormat = '0.000'
    end
    object kbmMemTable1111full_key: TStringField
      FieldName = 'full_key'
      KeyFields = 'full_key'
      LookupCache = True
      Size = 32
    end
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'tw_name'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'tw_id'
        DataType = ftInteger
      end
      item
        Name = 'skl_id'
        DataType = ftInteger
      end
      item
        Name = 'frm_id'
        DataType = ftInteger
      end
      item
        Name = 'crater'
        DataType = ftFloat
      end
      item
        Name = 'andromeda'
        DataType = ftFloat
      end
      item
        Name = 'hercules'
        DataType = ftFloat
      end
      item
        Name = 'ol4'
        DataType = ftFloat
      end
      item
        Name = 'ol3'
        DataType = ftFloat
      end
      item
        Name = 'full_key'
        DataType = ftLargeint
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end
      item
        Name = 'ClientDataSet1Index3'
        Fields = 'full_key'
      end>
    IndexFieldNames = 'full_key'
    Params = <>
    StoreDefs = True
    Left = 104
    Top = 344
    Data = {
      BD0000009619E0BD01000000180000000A000000000003000000BD000774775F
      6E616D65010049000000010005574944544802000200FA000574775F69640400
      01000000000006736B6C5F696404000100000000000666726D5F696404000100
      0000000006637261746572080004000000000009616E64726F6D656461080004
      00000000000868657263756C65730800040000000000036F6C34080004000000
      0000036F6C3308000400000000000866756C6C5F6B6579080001000000000000
      00}
    object ClientDataSet1tw_id: TIntegerField
      FieldName = 'tw_id'
    end
    object ClientDataSet1skl_id: TIntegerField
      FieldName = 'skl_id'
      LookupCache = True
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object ClientDataSet1frm_id: TIntegerField
      FieldName = 'frm_id'
      LookupCache = True
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object ClientDataSet1crater: TFloatField
      FieldName = 'crater'
      DisplayFormat = '0.000'
    end
    object ClientDataSet1andromeda: TFloatField
      FieldName = 'andromeda'
      DisplayFormat = '0.000'
    end
    object ClientDataSet1hercules: TFloatField
      FieldName = 'hercules'
      DisplayFormat = '0.000'
    end
    object ClientDataSet1ol4: TFloatField
      FieldName = 'ol4'
      DisplayFormat = '0.000'
    end
    object ClientDataSet1ol3: TFloatField
      FieldName = 'ol3'
      DisplayFormat = '0.000'
    end
    object ClientDataSet1full_key: TLargeintField
      FieldName = 'full_key'
    end
    object ClientDataSet1tw_name: TStringField
      FieldName = 'tw_name'
      Size = 250
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = ClientDataSet1
    Left = 424
    Top = 344
  end
  object Table1: TTable
    Left = 424
    Top = 264
  end
  object IBDatabase2: TIBDatabase
    DatabaseName = '192.168.0.1:bsklad2009'
    Params.Strings = (
      'user_name=beginner'
      'password=mayby')
    LoginPrompt = False
    SQLDialect = 1
    Left = 528
    Top = 320
  end
  object IBTransaction2: TIBTransaction
    DefaultDatabase = IBDatabase2
    Left = 600
    Top = 320
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase2
    Transaction = IBTransaction2
    Left = 544
    Top = 376
  end
end
