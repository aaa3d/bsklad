object DIC_SHOPSKL: TDIC_SHOPSKL
  Left = 212
  Top = 218
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Справочник. Доступность складов'
  ClientHeight = 465
  ClientWidth = 629
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 446
    Width = 629
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 629
    Height = 446
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object RxDBGrid1: TRxDBGrid
      Left = 0
      Top = 0
      Width = 297
      Height = 446
      Align = alLeft
      DataSource = DsDic
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'SHOP_NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Магазин'
          Width = 137
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FRM_NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Примечание'
          Width = 124
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 297
      Top = 0
      Width = 332
      Height = 446
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object RxDBGrid3: TRxDBGrid
        Left = 0
        Top = 25
        Width = 329
        Height = 421
        Align = alLeft
        DataSource = DsDost
        PopupMenu = PopupMenu1
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'SKL_SHORT'
            Title.Alignment = taCenter
            Title.Caption = 'Склад'
            Width = 182
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DOSTUP_NAME'
            Title.Alignment = taCenter
            Title.Caption = 'Доступ'
            Width = 113
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 332
        Height = 25
        Align = alTop
        Caption = 'Panel3'
        TabOrder = 1
        object Panel4: TPanel
          Left = 1
          Top = 1
          Width = 328
          Height = 23
          Align = alLeft
          Caption = 'ПРОДАЖА'
          TabOrder = 0
          object TYP: TComboBox
            Left = 0
            Top = 0
            Width = 329
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnChange = TYPChange
            Items.Strings = (
              'Доступность в продаже'
              'Доступность в расходной накладной')
          end
        end
      end
    end
  end
  object DsDost: TDataSource
    DataSet = QueryDost
    Left = 489
    Top = 303
  end
  object DicTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 204
    Top = 87
  end
  object QueryDic: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DicTransaction
    AfterOpen = QueryDicAfterOpen
    AfterScroll = QueryDicAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from lisT_shop(0)')
    Left = 204
    Top = 141
    object QueryDicSHOP_NAME: TIBStringField
      FieldName = 'SHOP_NAME'
      Origin = 'LIST_SHOP.SHOP_NAME'
      Size = 32
    end
    object QueryDicFRM_NAME: TIBStringField
      FieldName = 'FRM_NAME'
      Origin = 'LIST_SHOP.FRM_NAME'
      Size = 254
    end
    object QueryDicSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
      Origin = 'LIST_SHOP.SHOP_ID'
    end
  end
  object DsDic: TDataSource
    DataSet = QueryDic
    Left = 202
    Top = 195
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 359
    Top = 117
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 359
    Top = 179
  end
  object DostTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 489
    Top = 207
  end
  object QueryDost: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DostTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from dic_shop_skl(:shop_id, :typ)')
    Left = 489
    Top = 257
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'shop_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'typ'
        ParamType = ptUnknown
      end>
    object QueryDostSKL_ID: TIntegerField
      FieldName = 'SKL_ID'
      Origin = 'DIC_SHOP_SKL.SKL_ID'
    end
    object QueryDostSKL_SHORT: TIBStringField
      FieldName = 'SKL_SHORT'
      Origin = 'DIC_SHOP_SKL.SKL_SHORT'
      Size = 64
    end
    object QueryDostCFG_ID: TIntegerField
      FieldName = 'CFG_ID'
      Origin = 'DIC_SHOP_SKL.CFG_ID'
    end
    object QueryDostCFG_VALUE: TIntegerField
      FieldName = 'CFG_VALUE'
      Origin = 'DIC_SHOP_SKL.CFG_VALUE'
    end
    object QueryDostDOSTUP_NAME: TIBStringField
      FieldName = 'DOSTUP_NAME'
      Origin = 'DIC_SHOP_SKL.DOSTUP_NAME'
      Size = 64
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 465
    Top = 389
    object MnDostOn: TMenuItem
      Caption = 'Разрешить доступ'
      OnClick = MnDostOnClick
    end
    object MnDostOff: TMenuItem
      Caption = 'Запретить доступ'
      OnClick = MnDostOffClick
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer1Timer
    Left = 112
    Top = 119
  end
end
