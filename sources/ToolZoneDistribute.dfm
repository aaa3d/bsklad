object tool_zone_distribute: Ttool_zone_distribute
  Left = 571
  Top = 279
  BorderStyle = bsToolWindow
  Caption = '–‡ÒÔÂ‰ÂÎÂÌËÂ ÔÓ ÁÓÌ‡Ï'
  ClientHeight = 266
  ClientWidth = 397
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 81
    Width = 397
    Height = 136
    Align = alTop
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = RxDBGrid1DrawColumnCell
    OnEnter = RxDBGrid1Enter
    OnMouseWheelDown = RxDBGrid1MouseWheelDown
    OnMouseWheelUp = RxDBGrid1MouseWheelUp
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 397
    Height = 81
    Align = alTop
    TabOrder = 1
    object tw_name: TLabel
      Left = 8
      Top = 0
      Width = 73
      Height = 20
      Caption = 'tw_name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object tw_kol: TLabel
      Left = 8
      Top = 24
      Width = 73
      Height = 20
      Caption = 'tw_name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 48
      Top = 56
      Width = 298
      Height = 16
      Caption = '»Ãﬂ «ŒÕ€: — À¿ƒ-«ŒÕ¿-ﬂ◊≈… ¿-”–Œ¬≈Õ‹'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 8
      Top = 48
      Width = 33
      Height = 25
      Caption = '+'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object in_place_combo: TRxLookupEdit
    Left = 496
    Top = 224
    Width = 121
    Height = 21
    LookupDisplay = 'ZONE_NAME'
    LookupField = 'ZONE_ID'
    LookupSource = MainDSZone
    TabOrder = 2
    Text = 'in_place_combo'
    Visible = False
    OnExit = in_place_comboExit
    OnKeyDown = in_place_comboKeyDown
    OnKeyPress = in_place_comboKeyPress
  end
  object Button2: TButton
    Left = 16
    Top = 224
    Width = 105
    Height = 25
    Caption = 'Œ '
    TabOrder = 3
    OnClick = Button2Click
  end
  object ShopTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 76
    Top = 168
  end
  object QueryShop: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ShopTransaction
    AfterOpen = QueryShopAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select shop_id,shop_name from shop'
      'order by shop_office,shop_name')
    Left = 176
    Top = 168
    object QueryShopSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
      Required = True
    end
    object QueryShopSHOP_NAME: TIBStringField
      FieldName = 'SHOP_NAME'
      Required = True
      Size = 254
    end
  end
  object DsShop: TDataSource
    DataSet = QueryShop
    Left = 264
    Top = 176
  end
  object RxMemoryData1: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'tw_kol'
        DataType = ftFloat
      end
      item
        Name = 'zone_name'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'zone_id'
        DataType = ftInteger
      end
      item
        Name = 'zone_reg_id'
        DataType = ftInteger
      end>
    AfterEdit = RxMemoryData1AfterEdit
    AfterPost = RxMemoryData1AfterPost
    OnCalcFields = RxMemoryData1CalcFields
    OnNewRecord = RxMemoryData1NewRecord
    Left = 56
    Top = 120
    object RxMemoryData1tw_kol: TFloatField
      DisplayLabel = ' ÓÎ-‚Ó'
      DisplayWidth = 18
      FieldName = 'tw_kol'
      OnChange = RxMemoryData1tw_kolChange
    end
    object RxMemoryData1zone_name: TStringField
      DisplayLabel = '«ÓÌ‡'
      DisplayWidth = 21
      FieldName = 'zone_name'
      EditMask = '0\-00\-00\-0;1;_'
    end
    object RxMemoryData1zone_id: TIntegerField
      DisplayLabel = 'ÍÓ‰ ÁÓÌ˚'
      DisplayWidth = 18
      FieldName = 'zone_id'
      Visible = False
    end
    object RxMemoryData1id: TIntegerField
      DefaultExpression = '-1'
      DisplayWidth = 15
      FieldName = 'zone_reg_id'
      Visible = False
    end
  end
  object DataSource1: TDataSource
    DataSet = RxMemoryData1
    Left = 8
    Top = 176
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 368
    Top = 192
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 424
    Top = 192
  end
  object MainDicZone1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    BufferChunks = 10
    CachedUpdates = False
    SQL.Strings = (
      'select zone.*'
      ' from zone'
      'order by zone_name')
    Left = 676
    Top = 223
    object MainDicZone1ZONE_ID: TIntegerField
      FieldName = 'ZONE_ID'
      Origin = 'ZONE.ZONE_ID'
      Required = True
    end
    object MainDicZone1SKL_ID: TIntegerField
      FieldName = 'SKL_ID'
      Origin = 'ZONE.SKL_ID'
      Required = True
    end
    object MainDicZone1ZONE_NAME: TIBStringField
      FieldName = 'ZONE_NAME'
      Origin = 'ZONE.ZONE_NAME'
      Required = True
      Size = 32
    end
    object MainDicZone1ZONE_DESCR: TIBStringField
      FieldName = 'ZONE_DESCR'
      Origin = 'ZONE.ZONE_DESCR'
      Required = True
      Size = 254
    end
    object MainDicZone1TM: TDateTimeField
      FieldName = 'TM'
      Origin = 'ZONE.TM'
    end
  end
  object MainDSZone: TDataSource
    DataSet = MainDicZone1
    Left = 676
    Top = 281
  end
  object IBQuery2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.ReportTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 296
    Top = 104
  end
end
