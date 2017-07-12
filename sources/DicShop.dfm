object Dic_shop: TDic_shop
  Left = 194
  Top = 213
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Список магазинов'
  ClientHeight = 268
  ClientWidth = 743
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
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 189
    Height = 268
    Align = alLeft
    BevelOuter = bvLowered
    Caption = 'Panel2'
    Color = 14548223
    TabOrder = 0
    object Image2: TImage
      Left = 0
      Top = 2
      Width = 16
      Height = 16
      AutoSize = True
      Picture.Data = {
        07544269746D6170F6000000424DF60000000000000076000000280000001000
        000010000000010004000000000080000000120B0000120B0000100000001000
        0000000000000000800000800000008080008000000080008000808000008080
        8000C0C0C0000000FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFF
        FF00DADADADADADA0ADAADADADADADA00DADDADA7777770B07DAADA0000000FF
        007DDA0FFFBFBFBFFF07AD0FBFFF44FFBF07DA0FFFBFFFBFFF07AD0FBFFF47FF
        BF07DA0FFFBF748FFF07AD0FBFFFB747BF07DA0FFF47FF44FF07AD0FBF44B844
        BF07DA0FFF844448FF07AD0FBFFFBFFFBF07DA0FFFBFFFBFFF0AADA000000000
        00AD}
      Transparent = True
    end
    object RichEdit1: TRichEdit
      Left = 16
      Top = 1
      Width = 172
      Height = 266
      TabStop = False
      Align = alRight
      Alignment = taCenter
      BorderStyle = bsNone
      Color = 14548223
      Lines.Strings = (
        '  Это список магазинов, в '
        'которых установлена '
        'система '
        '"Склад" и которые имеют '
        'единую базу данных.'
        '  Центральный офис '
        'обозначается знаком "!".'
        '  Колонка "Состояние на..." '
        'показывает, на какое время '
        'в '
        'Вашей базе данных '
        'информация '
        '"синхронна" с другими '
        'магазинами.'
        '  Это время - время '
        'последней '
        'связи магазина с '
        'центральной '
        'базой данных.'
        '  Здесь Вы можете создать '
        '"новый" магазин, изменить '
        'название существующего '
        'или '
        'его удалить.'
        '  Удалить можно лишь тот '
        'магазин, в котором не было '
        'создано ни одного '
        'документа.')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 189
    Top = 0
    Width = 554
    Height = 268
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object StatusBar1: TStatusBar
      Left = 0
      Top = 249
      Width = 554
      Height = 19
      Panels = <>
      SimplePanel = False
    end
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 554
      Height = 29
      ButtonHeight = 24
      ButtonWidth = 25
      Caption = 'ToolBar1'
      Images = DataModule1.ImageList1
      TabOrder = 1
      object BtnNew: TToolButton
        Left = 0
        Top = 2
        Hint = 'Новый магазин (Ins)'
        Caption = 'BtnNew'
        ImageIndex = 0
        OnClick = BtnNewClick
      end
      object BtnOpen: TToolButton
        Left = 25
        Top = 2
        Hint = 'Изменить название магазина (Enter)'
        Caption = 'BtnOpen'
        ImageIndex = 1
        OnClick = BtnOpenClick
      end
      object BtnDel: TToolButton
        Left = 50
        Top = 2
        Hint = 'Удалить магазин (Del)'
        Caption = 'BtnDel'
        ImageIndex = 2
        OnClick = BtnDelClick
      end
      object ToolButton1: TToolButton
        Left = 75
        Top = 2
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object ToolButton2: TToolButton
        Left = 83
        Top = 2
        Hint = 'Заблокировать систему'
        Caption = 'ToolButton2'
        ImageIndex = 110
        OnClick = ToolButton2Click
      end
    end
    object RxDBGrid1: TRxDBGrid
      Left = 0
      Top = 29
      Width = 554
      Height = 220
      Align = alClient
      DataSource = DataSource1
      DefaultDrawing = False
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawDataCell = RxDBGrid1DrawDataCell
      OnDrawColumnCell = RxDBGrid1DrawColumnCell
      OnDblClick = RxDBGrid1DblClick
      OnKeyDown = RxDBGrid1KeyDown
      OnKeyPress = RxDBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'SHOP_OFFICE'
          Title.Alignment = taCenter
          Title.Caption = ' '
          Width = 18
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SHOP_NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Название'
          Width = 206
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SHOP_LAST'
          Title.Alignment = taCenter
          Title.Caption = 'Состояние на...'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FRM_NAME'
          Title.Caption = 'Фирма'
          Width = 188
          Visible = True
        end>
    end
  end
  object QrShop: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ShopTransaction
    AfterOpen = QrShopAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from LIST_SHOP(1) '
      'order by SHOP_OFFICE desc, SHOP_NAME')
    Left = 128
    Top = 56
    object QrShopSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
      Origin = 'LIST_SHOP.SHOP_ID'
    end
    object QrShopSHOP_NAME: TIBStringField
      FieldName = 'SHOP_NAME'
      Origin = 'LIST_SHOP.SHOP_NAME'
      Size = 32
    end
    object QrShopSHOP_LAST: TDateTimeField
      FieldName = 'SHOP_LAST'
      Origin = 'LIST_SHOP.SHOP_LAST'
    end
    object QrShopSHOP_OFFICE: TIBStringField
      FieldName = 'SHOP_OFFICE'
      Origin = 'LIST_SHOP.SHOP_OFFICE'
      FixedChar = True
      Size = 1
    end
    object QrShopSHOP_PREFIX: TIBStringField
      FieldName = 'SHOP_PREFIX'
      Origin = 'LIST_SHOP.SHOP_PREFIX'
      Size = 32
    end
    object QrShopSHOP_POSTFIX: TIBStringField
      FieldName = 'SHOP_POSTFIX'
      Origin = 'LIST_SHOP.SHOP_POSTFIX'
      Size = 32
    end
    object QrShopSHOP_COLOR: TIntegerField
      FieldName = 'SHOP_COLOR'
      Origin = 'LIST_SHOP.SHOP_COLOR'
    end
    object QrShopSHOP_TM: TDateTimeField
      FieldName = 'SHOP_TM'
      Origin = 'LIST_SHOP.SHOP_TM'
    end
    object QrShopSHOP_VISIBLE: TIBStringField
      FieldName = 'SHOP_VISIBLE'
      Origin = 'LIST_SHOP.SHOP_VISIBLE'
      FixedChar = True
      Size = 1
    end
    object QrShopSHOP_FRM: TIntegerField
      FieldName = 'SHOP_FRM'
      Origin = 'LIST_SHOP.SHOP_FRM'
    end
    object QrShopFRM_NAME: TIBStringField
      FieldName = 'FRM_NAME'
      Origin = 'LIST_SHOP.FRM_NAME'
      Size = 254
    end
  end
  object DataSource1: TDataSource
    DataSet = QrShop
    Left = 32
    Top = 44
  end
  object ShopTransaction: TIBTransaction
    Active = True
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 56
    Top = 132
  end
end
