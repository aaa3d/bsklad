object MAKE_TW_WOZW_TO_POST: TMAKE_TW_WOZW_TO_POST
  Left = 334
  Top = 226
  Width = 472
  Height = 385
  Caption = 'Оформить возврать товаров внутреннему поставщику'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 56
    Width = 37
    Height = 13
    Caption = 'Фирма'
  end
  object Label2: TLabel
    Left = 180
    Top = 56
    Width = 58
    Height = 13
    Caption = 'Поставщик'
  end
  object Label3: TLabel
    Left = 12
    Top = 100
    Width = 31
    Height = 13
    Caption = 'Склад'
  end
  object Label4: TLabel
    Left = 12
    Top = 212
    Width = 373
    Height = 13
    Caption = 'Создает возвратные документы в журнале РН: БНАЛИП и ПН: БНАЛИП.'
  end
  object Label5: TLabel
    Left = 12
    Top = 8
    Width = 93
    Height = 13
    Caption = 'Дата оформления'
  end
  object Label6: TLabel
    Left = 184
    Top = 104
    Width = 44
    Height = 13
    Caption = 'Магазин'
  end
  object FRM: TRxDBLookupCombo
    Left = 12
    Top = 72
    Width = 149
    Height = 21
    DropDownCount = 8
    LookupField = 'KLN_ID'
    LookupDisplay = 'KLN_FULL'
    LookupSource = DataModule1.MainDsAllFrm
    TabOrder = 0
  end
  object SKL: TRxDBLookupCombo
    Left = 12
    Top = 116
    Width = 149
    Height = 21
    DropDownCount = 8
    LookupField = 'SKL_ID'
    LookupDisplay = 'SKL_SHORT'
    LookupSource = DataModule1.MainDsSkl
    TabOrder = 1
  end
  object GroupBox2: TGroupBox
    Left = 10
    Top = 152
    Width = 447
    Height = 45
    Caption = ' Товары '
    TabOrder = 2
    object BtnTW: TSpeedButton
      Left = 418
      Top = 16
      Width = 23
      Height = 22
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000DDDD00000000DDDDDD000000DDD0
        999999900DDDDD000000DD099999999010DDDD000000D00111111110110DDD00
        0000D000000000000110DD000000DD070FFFFFF0F0110D000000DDD00FFFFFF0
        FF010D000000DDDD0FF7000088F00D000000DDDDD000888888F00D000000DDDD
        DD00000000F0DD000000DDDDDD0FFFFFF0F0DD000000DDDDDD0F000FF000DD00
        0000DDDDDD0FFFFFF0DDDD000000DDDDDD0FF70000DDDD000000DDDDDDD000DD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      OnClick = BtnTWClick
    end
    object BtnDynDic: TSpeedButton
      Left = 393
      Top = 16
      Width = 23
      Height = 22
      Hint = 'Выбрать динамическую группу товаров'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555550000000055555550AAAAAAA00555550AAAAAAAA020555002222222202
        205500000000000022055080FFFFFF0F02205500FFFFFF0FF0205550FF800007
        7F005555000777777F005555500000000F05555550FFFFFF0F05555550F000FF
        0005555550FFFFFF0555555550FF800005555555550005555555}
      OnClick = BtnDynDicClick
    end
    object TW1: TRadioButton
      Left = 8
      Top = 20
      Width = 53
      Height = 17
      Caption = 'Все'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = TW1Click
    end
    object TW2: TRadioButton
      Left = 68
      Top = 20
      Width = 273
      Height = 17
      Caption = 'Группа :'
      TabOrder = 1
      OnClick = TW1Click
    end
    object TW: TEdit
      Left = 128
      Top = 16
      Width = 249
      Height = 21
      Enabled = False
      TabOrder = 2
      Text = 'Все товары'
    end
  end
  object Memo1: TMemo
    Left = 8
    Top = 284
    Width = 441
    Height = 65
    TabOrder = 3
  end
  object Button1: TButton
    Left = 396
    Top = 212
    Width = 59
    Height = 25
    Caption = 'Запуск!'
    TabOrder = 4
    OnClick = Button1Click
  end
  object POST: TRxDBLookupCombo
    Left = 180
    Top = 72
    Width = 149
    Height = 21
    DropDownCount = 8
    LookupField = 'KLN_ID'
    LookupDisplay = 'KLN_FULL'
    LookupSource = DataModule1.MainDsAllFrm
    TabOrder = 5
  end
  object SHOP: TRxDBLookupCombo
    Left = 180
    Top = 116
    Width = 149
    Height = 21
    DropDownCount = 8
    LookupField = 'SHOP_ID'
    LookupDisplay = 'SHOP_NAME'
    LookupSource = DataModule1.MainDsShop
    TabOrder = 6
  end
  object dt1: TDateTimePicker
    Left = 12
    Top = 24
    Width = 117
    Height = 21
    CalAlignment = dtaLeft
    Date = 40129.4010584838
    Time = 40129.4010584838
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 7
  end
  object tm1: TDateTimePicker
    Left = 136
    Top = 24
    Width = 117
    Height = 21
    CalAlignment = dtaLeft
    Date = 40129.4010584838
    Time = 40129.4010584838
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkTime
    ParseInput = False
    TabOrder = 8
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 96
    Top = 276
  end
  object IBTransaction1: TIBTransaction
    Active = False
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 40
    Top = 272
  end
end
