object DOC_ZTRINDEF: TDOC_ZTRINDEF
  Left = 149
  Top = 218
  Width = 1145
  Height = 664
  Caption = 'Заявка на перевод в брак'
  Color = clBtnFace
  Constraints.MinHeight = 540
  Constraints.MinWidth = 760
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1129
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton9: TToolButton
      Left = 0
      Top = 2
      Action = ActLock
    end
    object ToolButton10: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 33
      Top = 2
      Action = ActSave
    end
    object ToolButton2: TToolButton
      Left = 58
      Top = 2
      Action = ActApply
    end
    object zakryt: TToolButton
      Left = 83
      Top = 2
      Action = ActOk
      Enabled = False
    end
    object ToolButton14: TToolButton
      Left = 108
      Top = 2
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object ToolButton12: TToolButton
      Left = 116
      Top = 2
      Action = ActPrint
    end
    object ToolButton13: TToolButton
      Left = 141
      Top = 2
      Action = ActHistory
    end
    object ToolButton3: TToolButton
      Left = 166
      Top = 2
      Width = 22
      Caption = 'ToolButton3'
      ImageIndex = 39
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 188
      Top = 2
      Action = DicTW
    end
    object ToolButton11: TToolButton
      Left = 213
      Top = 2
      Action = ActDel
    end
    object ToolButton5: TToolButton
      Left = 238
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 38
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 246
      Top = 2
      Action = ActDetal
    end
    object ToolButton7: TToolButton
      Left = 271
      Top = 2
      Action = ActAnaliz
    end
    object ToolButton8: TToolButton
      Left = 296
      Top = 2
      Action = ActMarketing
      Visible = False
    end
    object ToolButton15: TToolButton
      Left = 321
      Top = 2
      Width = 8
      Caption = 'ToolButton15'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object ToolButton16: TToolButton
      Left = 329
      Top = 2
      Action = ActRefresh
      Visible = False
    end
    object ToolButton18: TToolButton
      Left = 354
      Top = 2
      Width = 63
      Caption = 'ToolButton18'
      ImageIndex = 124
      Style = tbsSeparator
    end
    object ToolButton17: TToolButton
      Left = 417
      Top = 2
      Hint = 'Перевести заявку в следующее состояние'
      Caption = 'ToolButton17'
      ImageIndex = 123
      OnClick = ToolButton17Click
    end
    object ToolButton20: TToolButton
      Left = 442
      Top = 2
      Width = 8
      Caption = 'ToolButton20'
      ImageIndex = 122
      Style = tbsSeparator
    end
    object ToolButton19: TToolButton
      Left = 450
      Top = 2
      Hint = 'Создать резрв на товар'
      Caption = 'ToolButton19'
      ImageIndex = 121
      OnClick = ToolButton19Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 29
    Width = 1129
    Height = 196
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 2
      Top = 37
      Width = 71
      Height = 13
      Caption = 'Составитель :'
    end
    object Label2: TLabel
      Left = 160
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Дата :'
    end
    object Label4: TLabel
      Left = 3
      Top = 97
      Width = 69
      Height = 13
      Caption = 'Примечание :'
    end
    object Label5: TLabel
      Left = 32
      Top = 8
      Width = 40
      Height = 13
      Caption = 'Номер :'
    end
    object Label6: TLabel
      Left = 651
      Top = 10
      Width = 141
      Height = 13
      Caption = 'Прохождение утверждений:'
    end
    object Label3: TLabel
      Left = 208
      Top = 226
      Width = 50
      Height = 13
      Caption = 'Магазин :'
      Visible = False
    end
    object Label7: TLabel
      Left = 32
      Top = 66
      Width = 37
      Height = 13
      Caption = 'Склад :'
    end
    object Label8: TLabel
      Left = 304
      Top = 8
      Width = 73
      Height = 13
      Caption = 'Комментарий:'
    end
    object BtnTW: TSpeedButton
      Left = 672
      Top = 167
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
    object Label9: TLabel
      Left = 20
      Top = 172
      Width = 53
      Height = 13
      Caption = 'Действие:'
    end
    object Label10: TLabel
      Left = 488
      Top = 128
      Width = 38
      Height = 13
      Caption = 'Label10'
    end
    object Label11: TLabel
      Left = 716
      Top = 156
      Width = 26
      Height = 13
      Caption = 'Цена'
    end
    object Label12: TLabel
      Left = 306
      Top = 84
      Width = 59
      Height = 13
      Caption = 'Менеджер :'
    end
    object USER: TEdit
      Left = 76
      Top = 33
      Width = 197
      Height = 21
      Enabled = False
      TabOrder = 0
      Text = 'USER'
    end
    object TRINDEF_NUM: TEdit
      Left = 76
      Top = 4
      Width = 85
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'TRINDEF_NUM'
    end
    object TRINDEF_DATE: TDateEdit
      Left = 192
      Top = 4
      Width = 85
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
      OnChange = TRINDEF_DATEChange
    end
    object TRINDEF_OSN: TMemo
      Left = 76
      Top = 88
      Width = 197
      Height = 65
      TabOrder = 3
      OnChange = TRINDEF_OSNChange
    end
    object TRINDEF_SHOP: TRxDBLookupCombo
      Left = 216
      Top = 243
      Width = 201
      Height = 20
      DropDownCount = 8
      EscapeClear = False
      Enabled = False
      LookupField = 'SHOP_ID'
      LookupDisplay = 'SHOP_NAME'
      LookupSource = DataModule1.MainDsShop
      TabOrder = 4
      Visible = False
    end
    object TRINDEF_SKL: TRxDBLookupCombo
      Left = 76
      Top = 62
      Width = 201
      Height = 21
      DropDownCount = 8
      EscapeClear = False
      LookupField = 'SKL_ID'
      LookupDisplay = 'SKL_SHORT'
      LookupSource = DataModule1.MainDsSkl
      TabOrder = 5
      OnChange = TRINDEF_SKLChange
    end
    object stat_list: TRxCheckListBox
      Left = 652
      Top = 24
      Width = 149
      Height = 97
      ItemHeight = 13
      TabOrder = 6
      OnStateChange = stat_listStateChange
      OnClickCheck = stat_listClickCheck
      OnClick = stat_listClick
      InternalVersion = 202
    end
    object trindef_stats: TMemo
      Left = 304
      Top = 24
      Width = 333
      Height = 57
      Lines.Strings = (
        'trindef_stats')
      TabOrder = 7
      OnChange = trindef_statsChange
    end
    object Button1: TButton
      Left = 304
      Top = 128
      Width = 165
      Height = 25
      Caption = 'Утвердить: '
      TabOrder = 8
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 820
      Top = 132
      Width = 145
      Height = 25
      Caption = 'Отказать: '
      TabOrder = 9
      Visible = False
      OnClick = Button2Click
    end
    object ListBox1: TListBox
      Left = 796
      Top = 24
      Width = 253
      Height = 97
      ItemHeight = 13
      TabOrder = 10
      OnClick = ListBox1Click
    end
    object Edit1: TEdit
      Left = 652
      Top = 128
      Width = 149
      Height = 21
      ReadOnly = True
      TabOrder = 11
      Text = 'Edit1'
    end
    object trindef_type: TComboBox
      Left = 76
      Top = 168
      Width = 145
      Height = 21
      Style = csDropDownList
      Enabled = False
      ItemHeight = 13
      TabOrder = 12
      OnChange = trindef_typeChange
      Items.Strings = (
        'Неопределено'
        'Пересорт в брак'
        'Списание'
        'Пересорт в один артикул'
        'Пересорт в несколько артикулов'
        'Перевод на склад 7СБ')
    end
    object tw_nam: TEdit
      Left = 228
      Top = 168
      Width = 441
      Height = 21
      ReadOnly = True
      TabOrder = 13
    end
    object PSORT_TW_PRICE: TRxCalcEdit
      Left = 716
      Top = 168
      Width = 81
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 14
      OnChange = PSORT_TW_PRICEChange
    end
    object MEN_ID: TRxDBLookupCombo
      Left = 306
      Top = 96
      Width = 255
      Height = 21
      DropDownCount = 8
      EscapeClear = False
      LookupField = 'KLN_ID'
      LookupDisplay = 'KLN_FIO'
      LookupSource = DataModule1.MainDsMen
      TabOrder = 15
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 225
    Width = 1129
    Height = 382
    Align = alClient
    DataSource = DsTRINDEFS
    DefaultDrawing = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawDataCell = RxDBGrid1DrawDataCell
    OnDrawColumnCell = RxDBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'met'
        ReadOnly = True
        Title.Caption = ' '
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_ART'
        ReadOnly = True
        Title.Caption = 'Артикул'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_NAM'
        ReadOnly = True
        Title.Caption = 'Наименование'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ED_SHORT'
        ReadOnly = True
        Title.Caption = 'Ед.'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_BAD'
        Title.Caption = 'Кол-во'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tw_ost'
        ReadOnly = True
        Title.Caption = 'Остаток'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MON_GOOD'
        ReadOnly = True
        Title.Caption = 'Цена товара'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZAK_MON'
        ReadOnly = True
        Title.Caption = 'Закупочная цена'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NEW_MON_BAD'
        Title.Caption = 'Цена брака'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tw_art2'
        Title.Caption = 'Арт приходуемого'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tw_nam2'
        Title.Caption = 'Наименование приходуемого товара'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ed_short2'
        Title.Caption = 'Ед. изм. приходуемого'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'zak_brak'
        Title.Caption = 'Закупочная цена приходуемого'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tw2_mon_good'
        Title.Caption = 'р. цена  2 товара'
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 607
    Width = 1129
    Height = 19
    Panels = <
      item
        Text = 'Состояние'
        Width = 200
      end
      item
        Width = 100
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 412
    Top = 293
    object ActSave: TAction
      Caption = 'Сохранить'
      Hint = 'Сохранить'
      ImageIndex = 39
      ShortCut = 16397
      OnExecute = ActSaveExecute
    end
    object ActApply: TAction
      Caption = 'Применить'
      Hint = 'Применить'
      ImageIndex = 38
      ShortCut = 16467
      OnExecute = ActApplyExecute
    end
    object DicTW: TAction
      Caption = 'Товары по каталогу...'
      Hint = 'Товары по каталогу...'
      ImageIndex = 37
      ShortCut = 122
      OnExecute = DicTWExecute
    end
    object ActDetal: TAction
      Caption = 'Подробно о товаре...'
      Hint = 'Подробно о товаре...'
      ImageIndex = 11
      ShortCut = 113
      OnExecute = ActDetalExecute
    end
    object ActAnaliz: TAction
      Caption = 'Анализ товара...'
      Hint = 'Анализ товара...'
      ImageIndex = 12
      ShortCut = 114
      OnExecute = ActAnalizExecute
    end
    object ActMarketing: TAction
      Caption = 'Маркетинговые данные товара...'
      Hint = 'Маркетинговые данные товара...'
      ImageIndex = 10
      ShortCut = 115
    end
    object ActLock: TAction
      Caption = 'Заблокировать систему'
      Hint = 'Заблокировать систему'
      ImageIndex = 105
    end
    object ActDel: TAction
      Caption = 'Удалить товар'
      Hint = 'Удалить товар'
      ImageIndex = 2
      OnExecute = ActDelExecute
    end
    object ActPrint: TAction
      Caption = 'Печать...'
      Hint = 'Печать...'
      ImageIndex = 9
      ShortCut = 120
      OnExecute = ActPrintExecute
    end
    object ActHistory: TAction
      Caption = 'История документа...'
      Hint = 'История документа...'
      ImageIndex = 3
      OnExecute = ActHistoryExecute
    end
    object ActRefresh: TAction
      Caption = 'Обновить данные'
      Hint = 'Обновить данные'
      ImageIndex = 44
    end
    object ActOk: TAction
      Caption = 'Закончить утверждение'
      Hint = 'Закончить утверждение'
      ImageIndex = 22
      OnExecute = ActOkExecute
    end
  end
  object DsStat: TDataSource
    DataSet = MemStat
    Left = 502
    Top = 379
  end
  object MemStat: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'STAT_ID'
        DataType = ftInteger
      end
      item
        Name = 'STAT_NAME'
        DataType = ftString
        Size = 254
      end>
    Left = 494
    Top = 329
    object MemStatSTAT_ID: TIntegerField
      FieldName = 'STAT_ID'
    end
    object MemStatSTAT_NAME: TStringField
      FieldName = 'STAT_NAME'
      Size = 254
    end
  end
  object ImageList1: TImageList
    Left = 30
    Top = 220
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C60000000000FFFFFF00C6C6C600C6C6C600C6C6C600C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF00C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF00C6C6C60000000000C6C6C600FFFFFF00C6C6C600008400000084
      0000C6C6C600C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C60000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C60000FFFF00FFFFFF00FFFFFF00FFFFFF0000008400FFFFFF00FFFF
      FF0000FFFF00FFFFFF00FFFFFF0000000000000000000000000000000000C6C6
      C600C6C6C6000000FF0000000000FFFFFF00C6C6C600C6C6C60000840000FFFF
      FF0000840000C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000FFFF00C6C6C60084848400FFFFFF00FFFFFF0000FFFF00C6C6C600FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000C6C6
      C60000FFFF00C6C6C600FFFFFF00000084000000840000008400FFFFFF008484
      8400FFFFFF00FFFFFF008484840000000000000000000000000000000000C6C6
      C6000000FF00C6C6C60000000000C6C6C600FFFFFF00FFFFFF0000840000FFFF
      FF0000840000C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C60000FF
      FF00C6C6C60000FFFF008484840000FFFF00FFFFFF00C6C6C6000000000000FF
      FF00FFFFFF008484840000000000000000000000000000000000C6C6C60000FF
      FF00C6C6C60000FFFF000000840000008400000084000000840000008400FFFF
      FF008484840084848400FFFFFF00000000000000000000000000C6C6C6000000
      FF00C6C6C6000000000000000000FFFFFF00FFFFFF00FFFFFF00848484000084
      000000840000C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00C6C6
      C60000FFFF00C6C6C60084848400FFFFFF00C6C6C6000000000000000000FFFF
      FF00FFFFFF00848484000000000000000000000000000000000000FFFF00C6C6
      C60000FFFF00C6C6C6000000840000008400FFFFFF000000840000008400FFFF
      FF00FFFFFF0084848400FFFFFF000000000000000000000000000000FF00C6C6
      C6000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600FFFFFF0000FF
      FF00C6C6C60000FFFF0084848400C6C6C6000000000000FFFF000000000000FF
      FF00FFFFFF0084848400000000000000000000000000C6C6C600FFFFFF0000FF
      FF00C6C6C60000008400FFFFFF00FFFFFF00FFFFFF00FFFFFF0000008400FFFF
      FF0000FFFF00FFFFFF00848484000000000000000000C6C6C6000000FF000000
      FF00C6C6C60000000000FFFFFF00FFFFFF008484840084848400848484008484
      8400FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00C6C6
      C600FFFFFF00FFFFFF00848484000000000000FFFF0000000000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF0000FFFF00C6C6
      C600FFFFFF00FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00000084000000
      840084848400000000000000000000000000000000000000FF000000FF00C6C6
      C6000000FF0000000000FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008484840084848400FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF0000FF
      FF00FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      8400C6C6C60000000000000000000000000000000000000000000000FF000000
      FF000000000000000000FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000840000000000FFFFFF0000FFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF00FFFFFF00FFFFFF00FFFFFF0000FF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFF9F0000F3FFF3FFF2070000
      E0FFE0FFE0010000E03FE000E0000000C003C000C0000000C003C000C0000000
      8000800080000000800180008000000000010000000000000003000000000000
      8003800380000000CC03CC07CC000000FC03FF07FF000000FC03FFCFFFCF0000
      FFFFFFFFFFFF0000FFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object DsTRINDEFS: TDataSource
    DataSet = MemZTrindefs
    OnDataChange = DsTRINDEFSDataChange
    Left = 138
    Top = 394
  end
  object DsTRINDEF: TDataSource
    DataSet = IBQuery
    Left = 114
    Top = 290
  end
  object IBQuery: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = QueryTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 190
    Top = 290
  end
  object QueryTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 270
    Top = 290
  end
  object MemZTrindefs: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'met'
        DataType = ftInteger
      end
      item
        Name = 'TRINDEFS_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'TW_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'TW_ART'
        DataType = ftInteger
      end
      item
        Name = 'TW_NAM'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'ED_SHORT'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'TW_KOL'
        DataType = ftInteger
      end
      item
        Name = 'TW_BAD'
        DataType = ftFloat
      end
      item
        Name = 'NEW_MON_BAD'
        DataType = ftFloat
      end
      item
        Name = 'UTV_MON_BAD'
        DataType = ftFloat
      end
      item
        Name = 'MON_GOOD'
        DataType = ftInteger
      end
      item
        Name = 'OLD_MON_BAD'
        DataType = ftInteger
      end
      item
        Name = 'ZAK_MON'
        DataType = ftInteger
      end
      item
        Name = 'COMMENT'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'twktg_color'
        DataType = ftInteger
      end
      item
        Name = 'tw_ost'
        DataType = ftFloat
      end
      item
        Name = 'ed_short2'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'tw_nam2'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'tw_art2'
        DataType = ftInteger
      end
      item
        Name = 'tw_id2'
        DataType = ftInteger
      end
      item
        Name = 'zak_brak'
        DataType = ftFloat
      end
      item
        Name = 'kropt_price'
        DataType = ftFloat
      end
      item
        Name = 'spec_price'
        DataType = ftFloat
      end
      item
        Name = 'tw2_mon_good'
        DataType = ftFloat
      end>
    AfterEdit = MemZTrindefsAfterEdit
    Left = 216
    Top = 394
    object MemZTrindefsmet: TIntegerField
      FieldName = 'met'
    end
    object MemZTrindefsTRINDEFS_ID: TIntegerField
      FieldName = 'TRINDEFS_ID'
      Origin = 'TRINDEFS.TRINDEFS_ID'
      Required = True
    end
    object MemZTrindefsTW_ID: TIntegerField
      FieldName = 'TW_ID'
      Origin = 'TRINDEFS.TW_ID'
      Required = True
    end
    object MemZTrindefsTW_ART: TIntegerField
      FieldName = 'TW_ART'
    end
    object MemZTrindefsTW_NAM: TStringField
      FieldName = 'TW_NAM'
      Size = 150
    end
    object MemZTrindefsED_SHORT: TStringField
      DisplayWidth = 10
      FieldName = 'ED_SHORT'
      Size = 5
    end
    object MemZTrindefsTW_KOL: TIntegerField
      FieldName = 'TW_KOL'
      DisplayFormat = '0.000'
    end
    object MemZTrindefsTW_BAD: TFloatField
      FieldName = 'TW_BAD'
      Origin = 'TRINDEFS.TW_BAD'
      OnChange = MemZTrindefsTW_BADChange
      DisplayFormat = '0.000'
    end
    object MemZTrindefsNEW_MON_BAD: TFloatField
      FieldName = 'NEW_MON_BAD'
      Origin = 'TRINDEFS.NEW_MON_BAD'
      OnChange = MemZTrindefsNEW_MON_BADChange
      DisplayFormat = '0.00'
    end
    object MemZTrindefsUTV_MON_BAD: TFloatField
      FieldName = 'UTV_MON_BAD'
      Origin = 'TRINDEFS.UTV_MON_BAD'
      DisplayFormat = '0.00'
    end
    object MemZTrindefsMON_GOOD: TIntegerField
      FieldName = 'MON_GOOD'
      Origin = 'TRINDEFS.MON_GOOD'
      DisplayFormat = '0.00'
    end
    object MemZTrindefsOLD_MON_BAD: TIntegerField
      FieldName = 'OLD_MON_BAD'
      Origin = 'TRINDEFS.OLD_MON_BAD'
      DisplayFormat = '0.00'
    end
    object MemZTrindefsZAK_MON: TIntegerField
      FieldName = 'ZAK_MON'
      Origin = 'TRINDEFS.ZAK_MON'
      DisplayFormat = '0.00'
    end
    object MemZTrindefsCOMENT: TIBStringField
      FieldName = 'COMMENT'
      Origin = 'TRINDEFS.COMENT'
      Size = 254
    end
    object MemZTrindefstwktg_color: TIntegerField
      FieldName = 'twktg_color'
    end
    object MemZTrindefstw_ost: TFloatField
      FieldName = 'tw_ost'
      DisplayFormat = '#0.0000'
    end
    object MemZTrindefsed_short2: TStringField
      FieldName = 'ed_short2'
      Size = 6
    end
    object MemZTrindefstw_nam2: TStringField
      FieldName = 'tw_nam2'
      Size = 128
    end
    object MemZTrindefstw_art2: TIntegerField
      FieldName = 'tw_art2'
    end
    object MemZTrindefstw_id2: TIntegerField
      FieldName = 'tw_id2'
    end
    object MemZTrindefszak_brak: TFloatField
      FieldName = 'zak_brak'
      DisplayFormat = '0.00'
    end
    object MemZTrindefskropt_price: TFloatField
      FieldName = 'kropt_price'
    end
    object MemZTrindefsspec_price: TFloatField
      FieldName = 'spec_price'
    end
    object MemZTrindefstw2_mon_good: TFloatField
      FieldName = 'tw2_mon_good'
      DisplayFormat = '0.00'
    end
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select tw.tw_id, tw.tw_art, tw.tw_nam, ed.ed_short, tw_price.mon' +
        'ey as mon_good, ost_now_all.ost  as tw_kol, twktg.twktg_color,'
      '   (select tw_price.money'
      
        '     from tw_price((select tw_id from tw where tw_art = (select ' +
        'tw_art from tw      where tw_id=:TW_ID) and  tw_brak=1),0,0)) as' +
        ' OLD_MON_BAD,'
      '   (select tw_price.money from tw_price(:TW_ID,5,0)) as zak_mon'
      'from tw_price(:TW_ID,0,0),'
      'tw, ed, ost_now_all(:TW_ID), twktg'
      
        'where tw.tw_id=:TW_ID and ed.ed_id=tw.ed_id and tw.twktg_id=twkt' +
        'g.twktg_id')
    Left = 368
    Top = 417
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TW_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TW_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TW_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TW_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TW_ID'
        ParamType = ptUnknown
      end>
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 368
    Top = 367
  end
  object frReport1: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    OnGetValue = frReport1GetValue
    Left = 632
    Top = 286
    ReportForm = {
      18000000850E0000180000000001000100FFFFFFFFFF090000009A0B00003408
      00002400000048000000240000002400000001FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      0000480000002F040000980000003100000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D004D61737465
      7248656164657231000201000000005C0100002F040000120000003000040001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200AF0100000B004D6173746572446174613100020100000000A80100002F04
      0000120000003000050001000000000000000000FFFFFF1F000000000C006672
      4442446174615365743100000000000000FFFF00000000000200000001000000
      0000000001000000C8000000140000000100000000000000003D02000005004D
      656D6F310002002800000048000000E003000023000000430000000100000000
      0000000000FFFFFF1F2C02000000000001000F005B5452494E4445465F544954
      4C455D00000000FFFF000000000002000000010000000006005461686F6D6100
      08000000000000000000000000000100020000000000FFFFFF00000000020000
      00000000000000BD02000005004D656D6F32000200280000005C010000240000
      001200000043000F0064000000000000000000FFFFFF1F2C0200000000000100
      01002300000000FFFF000000000002000000010000000006005461686F6D6100
      08000000000000000000000000000100020000000000FFFFFF00000000020000
      000000000000003F03000005004D656D6F330002004C0000005C0100003C0000
      001200000043000F0064000000000000000000FFFFFF1F2C0200000000000100
      0300C0F0F200000000FFFF000000000002000000010000000006005461686F6D
      610008000000000000000000000000000100020000000000FFFFFF0000000002
      000000000000000000CA03000005004D656D6F34000200880000005C01000004
      0100001200000043000F0064000000000000000000FFFFFF1F2C020000000000
      01000C00CDE0E8ECE5EDEEE2E0EDE8E500000000FFFF00000000000200000001
      0000000006005461686F6D610008000000000000000000000000000100020000
      000000FFFFFF00000000020000000000000000004F04000005004D656D6F3500
      02008C0100005C010000380000001200000043000F0064000000000000000000
      FFFFFF1F2C02000000000001000600CAEEEB2DE2EE00000000FFFF0000000000
      02000000010000000006005461686F6D61000800000000000000000000000000
      0100020000000000FFFFFF0000000002000000000000000000D004000005004D
      656D6F36000200C40100005C010000380000001200000043000F006400000000
      0000000000FFFFFF1F2C02000000000001000200C5E400000000FFFF00000000
      0002000000010000000006005461686F6D610008000000000000000000000000
      000100020000000000FFFFFF0000000002000000000000000000530500000500
      4D656D6F37000200FC0100005C010000380000001200000043000F0064000000
      000000000000FFFFFF1F2C02000000000001000400D6E5EDE000000000FFFF00
      0000000002000000010000000006005461686F6D610008000000000000000000
      000000000100020000000000FFFFFF0000000002000000000000000000D90500
      0005004D656D6F38000200340200005C010000380000001200000043000F0064
      000000000000000000FFFFFF1F2C02000000000001000700C7E0EAF3EFEAE000
      000000FFFF000000000002000000010000000006005461686F6D610008000000
      000000000000000000000100020000000000FFFFFF0000000002000000000000
      0000006206000005004D656D6F390002006C0200005C01000040000000120000
      0043000F0064000000000000000000FFFFFF1F2C02000000000001000A00D6E5
      EDE020E1F0E0EAE000000000FFFF000000000002000000010000000006005461
      686F6D610008000000000000000000000000000100020000000000FFFFFF0000
      000002000000000000000000E506000006004D656D6F3130000200B80200005C
      0100003C0000001200000043000F0064000000000000000000FFFFFF1F2C0200
      0000000001000300C0F0F200000000FFFF000000000002000000010000000006
      005461686F6D610008000000000000000000000000000100020000000000FFFF
      FF00000000020000000000000000007107000006004D656D6F3131000200F402
      00005C010000040100001200000043000F0064000000000000000000FFFFFF1F
      2C02000000000001000C00CDE0E8ECE5EDEEE2E0EDE8E500000000FFFF000000
      000002000000010000000006005461686F6D6100080000000000000000000000
      00000100020000000000FFFFFF0000000002000000000000000000F807000006
      004D656D6F313200020028000000A8010000240000001200000043000F006400
      0000000000000000FFFFFF1F2C020000000000010007005B4C494E45235D0000
      0000FFFF000000000002000000010000000006005461686F6D61000800000000
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      00008F08000006004D656D6F31330002004C000000A80100003C000000120000
      0043000F0064000000000000000000FFFFFF1F2C020000000000010017005B4D
      656D5A5472696E646566732E2254575F415254225D00000000FFFF0000000000
      02000000010000000006005461686F6D61000800000000000000000000000000
      0100020000000000FFFFFF00000000020000000000000000002609000006004D
      656D6F313400020088000000A8010000040100001200000043000F0064000000
      000000000000FFFFFF1F2C020000000000010017005B4D656D5A5472696E6465
      66732E2254575F4E414D225D00000000FFFF0000000000020000000100000000
      06005461686F6D610008000000000000000000000000000100020000000000FF
      FFFF0000000002000000000000000000BD09000006004D656D6F31350002008C
      010000A8010000380000001200000043000F0064000000000000000000FFFFFF
      1F2C020000000000010017005B4D656D5A5472696E646566732E2254575F4241
      44225D00000000FFFF000000000002000000010000000006005461686F6D6100
      08000000000000000000000000000100020000000000FFFFFF00000000020000
      00000000000000560A000006004D656D6F3136000200C4010000A80100003800
      00001200000043000F0064000000000000000000FFFFFF1F2C02000000000001
      0019005B4D656D5A5472696E646566732E2245445F53484F5254225D00000000
      FFFF000000000002000000010000000006005461686F6D610008000000000000
      000000000000000100020000000000FFFFFF0000000002000000000000000000
      EF0A000006004D656D6F3137000200FC010000A8010000380000001200000043
      000F0064000000000000000000FFFFFF1F2C020000000000010019005B4D656D
      5A5472696E646566732E224D4F4E5F474F4F44225D00000000FFFF0000000000
      02000000010000000006005461686F6D61000800000000000000000000000000
      0100020000000000FFFFFF0000000002000000000000000000870B000006004D
      656D6F313800020034020000A8010000380000001200000043000F0064000000
      000000000000FFFFFF1F2C020000000000010018005B4D656D5A5472696E6465
      66732E225A414B5F4D4F4E225D00000000FFFF00000000000200000001000000
      0006005461686F6D610008000000000000000000000000000100020000000000
      FFFFFF0000000002000000000000000000230C000006004D656D6F3139000200
      6C020000A8010000400000001200000043000F0064000000000000000000FFFF
      FF1F2C02000000000001001C005B4D656D5A5472696E646566732E224E45575F
      4D4F4E5F424144225D00000000FFFF0000000000020000000100000000060054
      61686F6D610008000000000000000000000000000100020000000000FFFFFF00
      00000002000000000000000000BB0C000006004D656D6F3230000200B8020000
      A80100003C0000001200000043000F0064000000000000000000FFFFFF1F2C02
      0000000000010018005B4D656D5A5472696E646566732E2274775F6172743222
      5D00000000FFFF000000000002000000010000000006005461686F6D61000800
      0000000000000000000000000100020000000000FFFFFF000000000200000000
      0000000000530D000006004D656D6F3231000200F4020000A801000004010000
      1200000043000F0064000000000000000000FFFFFF1F2C020000000000010018
      005B4D656D5A5472696E646566732E2274775F6E616D32225D00000000FFFF00
      0000000002000000010000000006005461686F6D610008000000000000000000
      000000000100020000000000FFFFFF0000000002000000000000000000E40D00
      0006004D656D6F3232000200280000006D000000E00300001B00000043000000
      01000000000000000000FFFFFF1F2C020000000000010011005B5452494E4445
      465F434F4D4D454E545D00000000FFFF00000000000200000001000000000600
      5461686F6D610008000000000000000000000000000100020000000000FFFFFF
      0000000002000000000000000000760E000006004D656D6F3233000200280000
      008A000000E0030000540000004300000001000000000000000000FFFFFF1F2C
      020000000000010012005B5452494E4445465F434F4D4D454E54535D00000000
      FFFF000000000002000000010000000006005461686F6D610008000000000000
      000000000000000100020000000000FFFFFF000000000200000000000000FEFE
      FF000000000000000000000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = MemZTrindefs
    Left = 696
    Top = 376
  end
  object print_query: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.ReportTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from print_ztrindef(:trindef_id)')
    Left = 712
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'trindef_id'
        ParamType = ptUnknown
      end>
    object print_queryTRINDEF_NUM: TIntegerField
      FieldName = 'TRINDEF_NUM'
      Origin = 'PRINT_ZTRINDEF.TRINDEF_NUM'
    end
    object print_queryTRINDEF_DT: TDateTimeField
      FieldName = 'TRINDEF_DT'
      Origin = 'PRINT_ZTRINDEF.TRINDEF_DT'
    end
    object print_queryCOMMENT: TIBStringField
      FieldName = 'COMMENT'
      Origin = 'PRINT_ZTRINDEF.COMMENT'
      Size = 254
    end
    object print_queryTRINDEF_TW_NAM: TIBStringField
      FieldName = 'TRINDEF_TW_NAM'
      Origin = 'PRINT_ZTRINDEF.TRINDEF_TW_NAM'
      Size = 254
    end
    object print_queryTRINDEF_TYPE_STR: TIBStringField
      FieldName = 'TRINDEF_TYPE_STR'
      Origin = 'PRINT_ZTRINDEF.TRINDEF_TYPE_STR'
      Size = 254
    end
    object print_queryUSERS_COMMENT: TStringField
      FieldName = 'USERS_COMMENT'
      Size = 8192
    end
  end
end
