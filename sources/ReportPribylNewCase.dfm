object Report_pribyl_new_case: TReport_pribyl_new_case
  Left = 4
  Top = 70
  Width = 540
  Height = 384
  BorderIcons = [biSystemMenu]
  Caption = 'Выбор варианта распечатки отчета'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel5: TBevel
    Left = 304
    Top = 140
    Width = 13
    Height = 13
    Shape = bsTopLine
  end
  object Bevel7: TBevel
    Left = 316
    Top = 150
    Width = 21
    Height = 13
    Shape = bsTopLine
  end
  object Bevel1: TBevel
    Left = 288
    Top = 228
    Width = 25
    Height = 13
    Shape = bsTopLine
  end
  object Bevel2: TBevel
    Left = 296
    Top = 248
    Width = 17
    Height = 13
    Shape = bsTopLine
  end
  object Bevel3: TBevel
    Left = 312
    Top = 262
    Width = 25
    Height = 13
    Shape = bsTopLine
  end
  object Bevel4: TBevel
    Left = 316
    Top = 140
    Width = 9
    Height = 21
    Shape = bsLeftLine
  end
  object Bevel6: TBevel
    Left = 304
    Top = 160
    Width = 13
    Height = 13
    Shape = bsTopLine
  end
  object Bevel8: TBevel
    Left = 312
    Top = 228
    Width = 9
    Height = 65
    Shape = bsLeftLine
  end
  object Bevel9: TBevel
    Left = 276
    Top = 268
    Width = 37
    Height = 13
    Shape = bsTopLine
  end
  object Bevel10: TBevel
    Left = 284
    Top = 292
    Width = 29
    Height = 13
    Shape = bsTopLine
  end
  object RadioButton1: TRadioButton
    Left = 6
    Top = 4
    Width = 223
    Height = 17
    Caption = 'Итоговый в рублях'
    Checked = True
    TabOrder = 0
    TabStop = True
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 6
    Top = 25
    Width = 223
    Height = 17
    Caption = 'Итоговый в долларах США'
    TabOrder = 1
    OnClick = RadioButton1Click
  end
  object RadioButton3: TRadioButton
    Left = 6
    Top = 47
    Width = 227
    Height = 17
    Caption = 'Подробный отчет об остатках в рублях'
    TabOrder = 2
    OnClick = RadioButton1Click
  end
  object RadioButton4: TRadioButton
    Left = 6
    Top = 68
    Width = 225
    Height = 17
    Caption = 'Групповой отчет об остатках в рублях'
    TabOrder = 3
    OnClick = RadioButton1Click
  end
  object Button1: TButton
    Left = 6
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Ок'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 88
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 5
    OnClick = Button2Click
  end
  object RadioButton5: TRadioButton
    Left = 6
    Top = 90
    Width = 223
    Height = 17
    Caption = 'Итоговый в рублях по магазинам'
    TabOrder = 6
    OnClick = RadioButton1Click
  end
  object RadioButton6: TRadioButton
    Left = 6
    Top = 111
    Width = 223
    Height = 17
    Caption = 'Итоговый в долларах США по магазинам'
    TabOrder = 7
    OnClick = RadioButton1Click
  end
  object RadioButton7: TRadioButton
    Left = 6
    Top = 133
    Width = 295
    Height = 17
    Caption = 'Подробный отчет об остатках в магазине в рублях     :'
    TabOrder = 8
    OnClick = RadioButton1Click
  end
  object SHOP: TRxDBLookupCombo
    Left = 336
    Top = 140
    Width = 185
    Height = 21
    DropDownCount = 8
    LookupField = 'SHOP_ID'
    LookupDisplay = 'SHOP_NAME'
    LookupSource = DsShop
    TabOrder = 9
  end
  object RadioButton8: TRadioButton
    Left = 6
    Top = 154
    Width = 295
    Height = 17
    Caption = 'Подробный отчет об остатках в магазине в долларах :'
    TabOrder = 10
    OnClick = RadioButton1Click
  end
  object RadioButton9: TRadioButton
    Left = 6
    Top = 176
    Width = 297
    Height = 17
    Caption = 'Отчет о реализации для налоговой (продажи с НДС)'
    TabOrder = 11
    OnClick = RadioButton1Click
  end
  object RadioButton10: TRadioButton
    Left = 6
    Top = 197
    Width = 297
    Height = 17
    Caption = 'Отчет о реализации для налоговой (продажи без НДС)'
    TabOrder = 12
    OnClick = RadioButton1Click
  end
  object RadioButton11: TRadioButton
    Left = 6
    Top = 219
    Width = 279
    Height = 17
    Caption = 'Подробный отчет в рублях по товарам менеджера:'
    TabOrder = 13
    OnClick = RadioButton1Click
  end
  object OW: TRxDBLookupCombo
    Left = 336
    Top = 252
    Width = 185
    Height = 21
    DropDownCount = 8
    EscapeClear = False
    LookupField = 'OW_ID'
    LookupDisplay = 'OW_FULL'
    LookupSource = DsOwner
    TabOrder = 14
  end
  object RadioButton12: TRadioButton
    Left = 6
    Top = 240
    Width = 295
    Height = 17
    Caption = 'Подробный отчет в долларах по товарам менеджера:'
    TabOrder = 15
    OnClick = RadioButton1Click
  end
  object RadioButton13: TRadioButton
    Left = 6
    Top = 264
    Width = 273
    Height = 17
    Caption = 'Отчет в рублях по группам товаров менеджера :'
    TabOrder = 16
    OnClick = RadioButton1Click
  end
  object RadioButton14: TRadioButton
    Left = 6
    Top = 288
    Width = 273
    Height = 17
    Caption = 'Отчет в долларах по группам товаров менеджера :'
    TabOrder = 17
    OnClick = RadioButton1Click
  end
  object CaseTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 54
    Top = 6
  end
  object QueryShop: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = CaseTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select shop_id,shop_name from shop'
      'order by shop_name')
    Left = 54
    Top = 54
    object QueryShopSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
      Origin = 'SHOP.SHOP_ID'
      Required = True
    end
    object QueryShopSHOP_NAME: TIBStringField
      FieldName = 'SHOP_NAME'
      Origin = 'SHOP.SHOP_NAME'
      Required = True
      Size = 254
    end
  end
  object DsShop: TDataSource
    DataSet = QueryShop
    Left = 54
    Top = 104
  end
  object QueryOwner: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = CaseTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from list_owner_repprib(:repprib_id)'
      'order by ow_full')
    Left = 280
    Top = 12
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'repprib_id'
        ParamType = ptUnknown
      end>
    object QueryOwnerOW_ID: TIntegerField
      FieldName = 'OW_ID'
      Origin = 'LIST_OWNER_REPPRIB.OW_ID'
    end
    object QueryOwnerOW_FULL: TIBStringField
      FieldName = 'OW_FULL'
      Origin = 'LIST_OWNER_REPPRIB.OW_FULL'
      Size = 254
    end
  end
  object DsOwner: TDataSource
    DataSet = QueryOwner
    Left = 280
    Top = 56
  end
end
