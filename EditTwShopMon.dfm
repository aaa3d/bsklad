object EDIT_TWSHOPMON: TEDIT_TWSHOPMON
  Left = 174
  Top = 250
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Дополнительная розничная цена в магазине'
  ClientHeight = 63
  ClientWidth = 379
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
    Left = 6
    Top = 8
    Width = 50
    Height = 13
    Caption = 'Магазин :'
  end
  object Label2: TLabel
    Left = 24
    Top = 30
    Width = 32
    Height = 13
    Caption = 'Цена :'
  end
  object SHOP_NAME: TEdit
    Left = 60
    Top = 4
    Width = 231
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 0
    Text = 'SHOP_NAME'
  end
  object SHOP_COMBO: TRxDBLookupCombo
    Left = 60
    Top = 4
    Width = 231
    Height = 21
    DropDownCount = 8
    EscapeClear = False
    LookupField = 'SHOP_ID'
    LookupDisplay = 'SHOP_NAME'
    LookupSource = DsShop
    TabOrder = 1
  end
  object TW_MONEY: TRxCalcEdit
    Left = 60
    Top = 26
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00 руб##'
    NumGlyphs = 2
    TabOrder = 2
  end
  object Button1: TButton
    Left = 298
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Сохранить'
    TabOrder = 3
    OnClick = Button1Click
  end
  object BtnClose: TButton
    Left = 298
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 4
    OnClick = BtnCloseClick
  end
  object WorkTransction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 176
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 218
  end
  object MemShop: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'SHOP_ID'
        DataType = ftInteger
      end
      item
        Name = 'SHOP_NAME'
        DataType = ftString
        Size = 254
      end>
    Left = 84
    object MemShopSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
    end
    object MemShopSHOP_NAME: TStringField
      FieldName = 'SHOP_NAME'
      Size = 254
    end
  end
  object DsShop: TDataSource
    DataSet = MemShop
    Left = 130
  end
end
