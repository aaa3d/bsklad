object SET_MIN_OST: TSET_MIN_OST
  Left = 38
  Top = 111
  Width = 785
  Height = 528
  Caption = 'Выставление минимальных остатков'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 777
    Height = 117
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 8
      Width = 85
      Height = 13
      Caption = 'Группа товаров :'
    end
    object BtnDic: TSpeedButton
      Left = 434
      Top = 4
      Width = 23
      Height = 22
      Hint = 'Выбрать группу товаров по каталогу (F11)'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555000000005555555099999990055555099999999010555001111111101
        105500000000000011055080FFFFFF0F01105500FFFFFF0FF0105550FF800007
        7F005555000777777F005555500000000F05555550FFFFFF0F05555550F000FF
        0005555550FFFFFF0555555550FF800005555555550005555555}
      OnClick = BtnDicClick
    end
    object Label2: TLabel
      Left = 8
      Top = 34
      Width = 193
      Height = 13
      Caption = 'Запрашивать продажи за последние :'
    end
    object Label3: TLabel
      Left = 8
      Top = 58
      Width = 363
      Height = 13
      Caption = 'Установить минимальные остатки, поделив запрошенные остатки на :'
    end
    object TW: TEdit
      Left = 100
      Top = 4
      Width = 333
      Height = 21
      Enabled = False
      TabOrder = 0
      Text = 'TW'
    end
    object Period: TComboBox
      Left = 204
      Top = 30
      Width = 253
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'Period'
      OnChange = PeriodChange
    end
    object RxSpinEdit1: TRxSpinEdit
      Left = 376
      Top = 54
      Width = 81
      Height = 21
      Alignment = taRightJustify
      Increment = 0.1
      MaxValue = 100
      MinValue = 0.1
      ValueType = vtFloat
      Value = 2
      TabOrder = 2
    end
    object Check_clear: TCheckBox
      Left = 6
      Top = 80
      Width = 181
      Height = 17
      Caption = 'Обнулить остатки, если товар'
      TabOrder = 3
      OnClick = Check_clearClick
    end
    object period2: TComboBox
      Left = 300
      Top = 78
      Width = 157
      Height = 21
      ItemHeight = 13
      TabOrder = 4
      Text = 'period2'
      OnChange = period2Change
    end
    object Typ_period2: TComboBox
      Left = 182
      Top = 78
      Width = 117
      Height = 21
      ItemHeight = 13
      TabOrder = 5
      Text = 'не поставлялся'
      OnChange = Typ_period2Change
      Items.Strings = (
        'не поставлялся'
        'не продавался')
    end
    object Button1: TButton
      Left = 476
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Запросить'
      TabOrder = 6
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 476
      Top = 36
      Width = 75
      Height = 25
      Caption = 'Установить'
      TabOrder = 7
    end
    object Button3: TButton
      Left = 476
      Top = 66
      Width = 75
      Height = 25
      Caption = 'Закрыть'
      TabOrder = 8
      OnClick = Button3Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 482
    Width = 777
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 117
    Width = 777
    Height = 365
    Align = alClient
    DataSource = DsTw
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'tw_art'
        Title.Alignment = taCenter
        Title.Caption = 'Код'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tw_nam'
        Title.Alignment = taCenter
        Title.Caption = 'Наименование товара'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ed_short'
        Title.Alignment = taCenter
        Title.Caption = 'Ед.'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'skl'
        Title.Alignment = taCenter
        Title.Caption = 'Итого'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'skl1'
        Title.Alignment = taCenter
        Title.Caption = 'Склад1'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'skl2'
        Title.Alignment = taCenter
        Title.Caption = 'Склад2'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'skl3'
        Title.Alignment = taCenter
        Title.Caption = 'Склад3'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'skl4'
        Title.Alignment = taCenter
        Title.Caption = 'Склад4'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'skl5'
        Title.Alignment = taCenter
        Title.Caption = 'Склад5'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'skl6'
        Title.Alignment = taCenter
        Title.Caption = 'Склад6'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'skl7'
        Title.Alignment = taCenter
        Title.Caption = 'Склад7'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'skl8'
        Title.Alignment = taCenter
        Title.Caption = 'Склад8'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'skl9'
        Title.Alignment = taCenter
        Title.Caption = 'Склад9'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'skl10'
        Title.Alignment = taCenter
        Title.Caption = 'Склад10'
        Width = 75
        Visible = True
      end>
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 256
    Top = 224
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 250
    Top = 278
  end
  object MemTw: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'tw_id'
        DataType = ftInteger
      end
      item
        Name = 'tw_art'
        DataType = ftInteger
      end
      item
        Name = 'tw_nam'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'ed_short'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'skl1'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'skl2'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'skl3'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'skl4'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'skl5'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'skl6'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'skl7'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'skl8'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'skl9'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'skl10'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'skl'
        DataType = ftString
        Size = 32
      end>
    Left = 128
    Top = 194
    object MemTwtw_id: TIntegerField
      FieldName = 'tw_id'
    end
    object MemTwtw_art: TIntegerField
      FieldName = 'tw_art'
    end
    object MemTwtw_nam: TStringField
      FieldName = 'tw_nam'
      Size = 128
    end
    object MemTwed_short: TStringField
      FieldName = 'ed_short'
      Size = 16
    end
    object MemTwskl1: TStringField
      FieldName = 'skl1'
      Size = 32
    end
    object MemTwskl2: TStringField
      FieldName = 'skl2'
      Size = 32
    end
    object MemTwskl3: TStringField
      FieldName = 'skl3'
      Size = 32
    end
    object MemTwskl4: TStringField
      FieldName = 'skl4'
      Size = 32
    end
    object MemTwskl5: TStringField
      FieldName = 'skl5'
      Size = 32
    end
    object MemTwskl6: TStringField
      FieldName = 'skl6'
      Size = 32
    end
    object MemTwskl7: TStringField
      FieldName = 'skl7'
      Size = 32
    end
    object MemTwskl8: TStringField
      FieldName = 'skl8'
      Size = 32
    end
    object MemTwskl9: TStringField
      FieldName = 'skl9'
      Size = 32
    end
    object MemTwskl10: TStringField
      FieldName = 'skl10'
      Size = 32
    end
    object MemTwskl: TStringField
      FieldName = 'skl'
      Size = 32
    end
  end
  object DsTw: TDataSource
    DataSet = MemTw
    Left = 128
    Top = 256
  end
end
