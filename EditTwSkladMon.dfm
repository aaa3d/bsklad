object EDIT_TWSKLADMON: TEDIT_TWSKLADMON
  Left = 102
  Top = 203
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Цена при продаже товара магазином со склада'
  ClientHeight = 101
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 133
    Height = 13
    Caption = 'При продаже магазином :'
  end
  object Label2: TLabel
    Left = 84
    Top = 56
    Width = 58
    Height = 13
    Caption = 'Со склада :'
  end
  object Label3: TLabel
    Left = 54
    Top = 80
    Width = 87
    Height = 13
    Caption = 'Розничная цена :'
  end
  object SHOP_ID: TRxDBLookupCombo
    Left = 146
    Top = 28
    Width = 293
    Height = 21
    DropDownCount = 8
    EscapeClear = False
    LookupField = 'SHOP_ID'
    LookupDisplay = 'SHOP_NAME'
    LookupSource = DsShop
    TabOrder = 0
  end
  object SKL_ID: TRxDBLookupCombo
    Left = 146
    Top = 52
    Width = 293
    Height = 21
    DropDownCount = 8
    EscapeClear = False
    LookupField = 'SKL_ID'
    LookupDisplay = 'SKL_FULL'
    LookupSource = DsSKL
    TabOrder = 1
  end
  object TW_MONEY: TRxCalcEdit
    Left = 146
    Top = 76
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00 руб##'
    NumGlyphs = 2
    TabOrder = 2
    ZeroEmpty = False
  end
  object Button1: TButton
    Left = 442
    Top = 2
    Width = 75
    Height = 25
    Caption = 'Сохранить'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 442
    Top = 28
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 4
    OnClick = Button2Click
  end
  object SHOP_ALL: TCheckBox
    Left = 146
    Top = 6
    Width = 129
    Height = 17
    Caption = 'Всеми магазинами'
    TabOrder = 5
    OnClick = SHOP_ALLClick
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 242
    Top = 30
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 200
    Top = 30
  end
  object DicTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 378
    Top = 30
  end
  object DicShop: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DicTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select shop_id,shop_name from shop'
      'order by shop_name')
    Left = 284
    Top = 30
    object DicShopSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
      Required = True
    end
    object DicShopSHOP_NAME: TIBStringField
      FieldName = 'SHOP_NAME'
      Required = True
      Size = 254
    end
  end
  object DsShop: TDataSource
    DataSet = DicShop
    Left = 120
    Top = 76
  end
  object DsSKL: TDataSource
    DataSet = DicSKL
    Left = 186
    Top = 74
  end
  object DicSKL: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DicTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select skl_id,skl_full'
      'from skl'
      'order by skl_full')
    Left = 326
    Top = 30
    object DicSKLSKL_ID: TIntegerField
      FieldName = 'SKL_ID'
      Required = True
    end
    object DicSKLSKL_FULL: TIBStringField
      FieldName = 'SKL_FULL'
      Required = True
      Size = 254
    end
  end
end
