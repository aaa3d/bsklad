object Select_Shop: TSelect_Shop
  Left = 485
  Top = 257
  BorderStyle = bsToolWindow
  Caption = 'Выбор склада'
  ClientHeight = 238
  ClientWidth = 308
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
    Top = 0
    Width = 308
    Height = 238
    Align = alClient
    DataSource = DsShop
    Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    OnKeyPress = RxDBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'SHOP_NAME'
        Visible = True
      end>
  end
  object ShopTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 116
    Top = 32
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
    Left = 192
    Top = 32
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
    Left = 256
    Top = 32
  end
end
