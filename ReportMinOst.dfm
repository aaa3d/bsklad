object Report_Min_OSt: TReport_Min_OSt
  Left = 165
  Top = 185
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Отчёт о минимальных остатках и рекомендациях к поставке'
  ClientHeight = 605
  ClientWidth = 951
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  ShowHint = True
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 951
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object BtnSave: TToolButton
      Left = 0
      Top = 2
      Hint = 'Сохранить (Ctrl+Enter)'
      Caption = 'BtnSave'
      ImageIndex = 39
      OnClick = BtnSaveClick
    end
    object BtnApply: TToolButton
      Left = 25
      Top = 2
      Hint = 'Применить (Ctrl+S)'
      Caption = 'BtnApply'
      ImageIndex = 38
      OnClick = BtnApplyClick
    end
    object ToolButton3: TToolButton
      Left = 50
      Top = 2
      Width = 7
      Caption = 'ToolButton3'
      ImageIndex = 39
      Style = tbsSeparator
    end
    object BtnStop: TToolButton
      Left = 57
      Top = 2
      Hint = 'Остановить расчёт'
      Caption = 'BtnStop'
      ImageIndex = 106
      OnClick = BtnStopClick
    end
    object ToolButton2: TToolButton
      Left = 82
      Top = 2
      Width = 7
      Caption = 'ToolButton2'
      ImageIndex = 46
      Style = tbsSeparator
    end
    object BtnResult: TToolButton
      Left = 89
      Top = 2
      Hint = 'Принять решение (Enter)'
      Caption = 'BtnResult'
      ImageIndex = 50
      OnClick = BtnResultClick
    end
    object ToolButton4: TToolButton
      Left = 114
      Top = 2
      Width = 7
      Caption = 'ToolButton4'
      ImageIndex = 51
      Style = tbsSeparator
    end
    object BtnDetal: TToolButton
      Left = 121
      Top = 2
      Hint = 'Подробно о товаре (F2)'
      Caption = 'BtnDetal'
      ImageIndex = 11
      OnClick = BtnDetalClick
    end
    object BtnAnaliz: TToolButton
      Left = 146
      Top = 2
      Hint = 'Анализ товара (F3)'
      Caption = 'BtnAnaliz'
      ImageIndex = 12
      OnClick = BtnAnalizClick
    end
    object BtnMarket: TToolButton
      Left = 171
      Top = 2
      Hint = 'Маркетинговые исследования товара (F4)'
      Caption = 'BtnMarket'
      ImageIndex = 10
      OnClick = BtnMarketClick
    end
    object ToolButton1: TToolButton
      Left = 196
      Top = 2
      Width = 50
      Caption = 'ToolButton1'
      ImageIndex = 105
      Style = tbsSeparator
    end
    object BtnExport: TToolButton
      Left = 246
      Top = 2
      Hint = 'Сохранить принятые решения в документы...'
      Caption = 'BtnExport'
      ImageIndex = 104
      OnClick = BtnExportClick
    end
    object ToolButton5: TToolButton
      Left = 271
      Top = 2
      Width = 214
      Caption = 'ToolButton5'
      ImageIndex = 45
      Style = tbsSeparator
    end
    object BtnRefresh: TToolButton
      Left = 485
      Top = 2
      Hint = 'Построить отчёт'
      Caption = 'BtnRefresh'
      ImageIndex = 44
      OnClick = BtnRefreshClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 586
    Width = 951
    Height = 19
    Panels = <
      item
        Width = 70
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 951
    Height = 557
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 951
      Height = 121
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Label2: TLabel
        Left = 460
        Top = 12
        Width = 178
        Height = 13
        Caption = 'Скорость продаж расчитывать за :'
      end
      object Label3: TLabel
        Left = 716
        Top = 12
        Width = 44
        Height = 13
        Caption = 'месяцев'
      end
      object Label4: TLabel
        Left = 8
        Top = 36
        Width = 56
        Height = 13
        Caption = 'Выводить :'
      end
      object Label7: TLabel
        Left = 404
        Top = 92
        Width = 120
        Height = 13
        Caption = 'месяцев по накладным'
        Visible = False
      end
      object Panel4: TPanel
        Left = 4
        Top = 4
        Width = 449
        Height = 29
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 45
          Height = 13
          Caption = 'Товары :'
        end
        object BtnDic: TSpeedButton
          Left = 392
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
        object BtnDynDic: TSpeedButton
          Left = 417
          Top = 4
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
          Left = 60
          Top = 8
          Width = 49
          Height = 17
          Caption = 'Все'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = TW2Click
        end
        object TW2: TRadioButton
          Left = 108
          Top = 8
          Width = 69
          Height = 17
          Caption = 'Группа :'
          TabOrder = 1
          OnClick = TW2Click
        end
        object TW: TEdit
          Left = 168
          Top = 4
          Width = 221
          Height = 21
          ReadOnly = True
          TabOrder = 2
          Text = 'TW'
        end
      end
      object MES: TRxSpinEdit
        Left = 644
        Top = 8
        Width = 65
        Height = 21
        Alignment = taRightJustify
        Increment = 0.25
        ValueType = vtFloat
        TabOrder = 1
      end
      object VID: TComboBox
        Left = 72
        Top = 32
        Width = 377
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        Text = 'VID'
        Items.Strings = (
          'Весь перечень товаров'
          'Товары, рекомендуемые к поставке')
      end
      object Panel5: TPanel
        Left = 456
        Top = 35
        Width = 325
        Height = 30
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 3
        object Label5: TLabel
          Left = 8
          Top = 10
          Width = 54
          Height = 13
          Caption = 'Скорость :'
        end
        object Speed1: TRadioButton
          Left = 68
          Top = 9
          Width = 121
          Height = 17
          Caption = 'продаж магазином'
          TabOrder = 0
          OnClick = Speed1Click
        end
        object Speed2: TRadioButton
          Left = 196
          Top = 9
          Width = 121
          Height = 17
          Caption = 'Отпуска со склада'
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = Speed1Click
        end
      end
      object CheckBox1: TCheckBox
        Left = 72
        Top = 60
        Width = 125
        Height = 17
        Caption = 'Хорошего качества'
        Checked = True
        State = cbChecked
        TabOrder = 4
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 208
        Top = 60
        Width = 97
        Height = 17
        Caption = 'Бракованные'
        TabOrder = 5
        OnClick = CheckBox1Click
      end
      object CheckBox3: TCheckBox
        Left = 320
        Top = 60
        Width = 97
        Height = 17
        Caption = 'Есть в наличии'
        TabOrder = 6
        OnClick = CheckBox1Click
      end
      object RxSpinEdit1: TRxSpinEdit
        Left = 344
        Top = 88
        Width = 61
        Height = 21
        Alignment = taRightJustify
        Increment = 0.25
        ValueType = vtFloat
        Value = 2
        TabOrder = 7
        Visible = False
      end
      object Edit1: TEdit
        Left = 528
        Top = 87
        Width = 281
        Height = 21
        TabOrder = 8
        Text = 'Edit1'
        Visible = False
      end
      object BitBtn1: TBitBtn
        Left = 810
        Top = 87
        Width = 25
        Height = 21
        Hint = 'Выбрать из списка'
        TabOrder = 9
        Visible = False
        OnClick = BitBtn1Click
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777700000007777777777777777700000007777747474747477700000007777
          7477777777777000000077774447777774777000000077777477777777777000
          00007777777777777477700000007770000007700000000000007000FBFB0000
          FBFB0000000070F0000000F000000000000070FFFFF070FFFFF07000000070F8
          88F070F888F07000000070FFFFF070FFFFF07000000070F888F070F888F07000
          000070FFFFF070FFFFF070000000700000007000000070000000777777777777
          777770000000}
      end
      object ComboBox3: TComboBox
        Left = 8
        Top = 88
        Width = 329
        Height = 21
        Style = csDropDownList
        DropDownCount = 3
        ItemHeight = 13
        TabOrder = 10
        OnChange = ComboBox3Change
        Items.Strings = (
          'Нет ограничений по продажам'
          'Только те, у которых были продажи за последние'
          'Только те, последние продажи которых были более')
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 121
      Width = 951
      Height = 436
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 333
        Width = 951
        Height = 103
        Align = alBottom
        DataSource = DsSet
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnGetCellParams = RxDBGrid1GetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'VID'
            Title.Alignment = taCenter
            Title.Caption = 'Вид'
            Width = 154
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F1'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F2'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F3'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F4'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F5'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F6'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F7'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F8'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F9'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F10'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F11'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F12'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F13'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F14'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F15'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F16'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F17'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F18'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F19'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F20'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end>
      end
      object RxDBGrid2: TRxDBGrid
        Left = 0
        Top = 0
        Width = 951
        Height = 333
        Align = alClient
        DataSource = DsReport
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = RxDBGrid2DblClick
        OnKeyPress = RxDBGrid2KeyPress
        OnGetCellParams = RxDBGrid2GetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'TW_ART'
            Title.Alignment = taCenter
            Title.Caption = 'Код'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_NAM'
            Title.Alignment = taCenter
            Title.Caption = 'Наименование товара'
            Width = 189
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ED_SHORT'
            Title.Alignment = taCenter
            Title.Caption = 'Ед. изм.'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_MROZ'
            Title.Alignment = taCenter
            Title.Caption = 'Розн. цена, руб.'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPEED_ALL'
            Title.Alignment = taCenter
            Title.Caption = 'Скорость всего'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OST_ALL'
            Title.Alignment = taCenter
            Title.Caption = 'Остаток всего'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MIN_ALL'
            Title.Alignment = taCenter
            Title.Caption = 'Мин. всего'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESULT'
            Title.Alignment = taCenter
            Title.Caption = 'Принятое решение'
            Width = 202
            Visible = True
          end>
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Images = DataModule1.ImageList1
    Left = 296
    Top = 262
    object MnSave: TMenuItem
      Caption = 'Сохранить'
      ImageIndex = 39
      ShortCut = 16397
      OnClick = BtnSaveClick
    end
    object MnApply: TMenuItem
      Caption = 'Применить'
      ImageIndex = 38
      ShortCut = 16467
      OnClick = BtnApplyClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object MnExport: TMenuItem
      Caption = 'Экспортировать принятые решения в документы'
      ImageIndex = 104
      OnClick = BtnExportClick
    end
    object MnRefresh: TMenuItem
      Caption = 'Построить отчёт'
      ImageIndex = 44
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object MnDic: TMenuItem
      Caption = 'Группа товаров по каталогу'
      Hint = 'F11'
      ImageIndex = 37
      OnClick = BtnDicClick
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object MnResult: TMenuItem
      Caption = 'Принять решение (Enter)'
      ImageIndex = 50
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object MnDetal: TMenuItem
      Caption = 'Подробно о товаре'
      ImageIndex = 11
      ShortCut = 113
    end
    object MnAnaliz: TMenuItem
      Caption = 'Анализ товара'
      ImageIndex = 12
      ShortCut = 114
    end
    object MnMarket: TMenuItem
      Caption = 'Маркетинговые исследования товара'
      ImageIndex = 10
      ShortCut = 115
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 384
    Top = 250
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 10
    CachedUpdates = False
    Left = 380
    Top = 302
  end
  object MemReport: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'TW_ID'
        DataType = ftInteger
      end
      item
        Name = 'TW_MROZ'
        DataType = ftFloat
      end
      item
        Name = 'TW_ART'
        DataType = ftInteger
      end
      item
        Name = 'TW_COLOR'
        DataType = ftInteger
      end
      item
        Name = 'ED_SHORT'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'TW_NAM'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'SPEED_ALL'
        DataType = ftFloat
      end
      item
        Name = 'OST_ALL'
        DataType = ftFloat
      end
      item
        Name = 'MIN_ALL'
        DataType = ftFloat
      end
      item
        Name = 'RESULT'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'RESULT_SEC'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'VALUTA_ID'
        DataType = ftInteger
      end
      item
        Name = 'TWKTG_ID'
        DataType = ftInteger
      end
      item
        Name = 'TW_RASPR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MET_MONEY_SHOP'
        DataType = ftInteger
      end>
    AfterPost = MemReportAfterPost
    AfterCancel = MemReportAfterPost
    AfterScroll = MemReportAfterScroll
    Left = 156
    Top = 338
    object MemReportTW_ID: TIntegerField
      FieldName = 'TW_ID'
    end
    object MemReportTW_MROZ: TFloatField
      FieldName = 'TW_MROZ'
      DisplayFormat = '#0.00 руб'
    end
    object MemReportTW_ART: TIntegerField
      FieldName = 'TW_ART'
    end
    object MemReportTW_COLOR: TIntegerField
      FieldName = 'TW_COLOR'
    end
    object MemReportED_SHORT: TStringField
      FieldName = 'ED_SHORT'
      Size = 32
    end
    object MemReportTW_NAM: TStringField
      FieldName = 'TW_NAM'
      Size = 254
    end
    object MemReportSPEED_ALL: TFloatField
      FieldName = 'SPEED_ALL'
      DisplayFormat = '#0.0000'
    end
    object MemReportOST_ALL: TFloatField
      FieldName = 'OST_ALL'
      DisplayFormat = '#0.0000'
    end
    object MemReportMIN_ALL: TFloatField
      FieldName = 'MIN_ALL'
      DisplayFormat = '#0.0000'
    end
    object MemReportRESULT: TStringField
      FieldName = 'RESULT'
      Size = 2000
    end
    object MemReportRESULT_SEC: TStringField
      FieldName = 'RESULT_SEC'
      Size = 254
    end
    object MemReportVALUTA_ID: TIntegerField
      FieldName = 'VALUTA_ID'
    end
    object MemReportTWKTG_ID: TIntegerField
      FieldName = 'TWKTG_ID'
    end
    object MemReportTW_RASPR: TStringField
      FieldName = 'TW_RASPR'
      Size = 1
    end
    object MemReportMET_MONEY_SHOP: TIntegerField
      FieldName = 'MET_MONEY_SHOP'
      Visible = False
    end
  end
  object DsReport: TDataSource
    DataSet = MemReport
    Left = 156
    Top = 386
  end
  object QueryWork2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 2
    CachedUpdates = False
    Left = 380
    Top = 354
  end
  object MemSet: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'VID'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TYP'
        DataType = ftInteger
      end
      item
        Name = 'F1'
        DataType = ftInteger
      end
      item
        Name = 'F2'
        DataType = ftInteger
      end
      item
        Name = 'F3'
        DataType = ftInteger
      end
      item
        Name = 'F4'
        DataType = ftInteger
      end
      item
        Name = 'F5'
        DataType = ftInteger
      end
      item
        Name = 'F6'
        DataType = ftInteger
      end
      item
        Name = 'F7'
        DataType = ftInteger
      end
      item
        Name = 'F8'
        DataType = ftInteger
      end
      item
        Name = 'F9'
        DataType = ftInteger
      end
      item
        Name = 'F10'
        DataType = ftInteger
      end
      item
        Name = 'F11'
        DataType = ftInteger
      end
      item
        Name = 'F12'
        DataType = ftInteger
      end
      item
        Name = 'F13'
        DataType = ftInteger
      end
      item
        Name = 'F14'
        DataType = ftInteger
      end
      item
        Name = 'F15'
        DataType = ftInteger
      end
      item
        Name = 'F16'
        DataType = ftInteger
      end
      item
        Name = 'F17'
        DataType = ftInteger
      end
      item
        Name = 'F18'
        DataType = ftInteger
      end
      item
        Name = 'F19'
        DataType = ftInteger
      end
      item
        Name = 'F20'
        DataType = ftInteger
      end>
    Left = 84
    Top = 338
    object MemSetVID: TStringField
      FieldName = 'VID'
      Size = 64
    end
    object MemSetTYP: TIntegerField
      FieldName = 'TYP'
    end
    object MemSetF1: TIntegerField
      FieldName = 'F1'
      OnChange = MemSetF1Change
      DisplayFormat = '#0.0000'
    end
    object MemSetF2: TIntegerField
      FieldName = 'F2'
      OnChange = MemSetF1Change
      DisplayFormat = '#0.0000'
    end
    object MemSetF3: TIntegerField
      FieldName = 'F3'
      OnChange = MemSetF1Change
      DisplayFormat = '#0.0000'
    end
    object MemSetF4: TIntegerField
      FieldName = 'F4'
      OnChange = MemSetF1Change
      DisplayFormat = '#0.0000'
    end
    object MemSetF5: TIntegerField
      FieldName = 'F5'
      OnChange = MemSetF1Change
      DisplayFormat = '#0.0000'
    end
    object MemSetF6: TIntegerField
      FieldName = 'F6'
      OnChange = MemSetF1Change
      DisplayFormat = '#0.0000'
    end
    object MemSetF7: TIntegerField
      FieldName = 'F7'
      OnChange = MemSetF1Change
      DisplayFormat = '#0.0000'
    end
    object MemSetF8: TIntegerField
      FieldName = 'F8'
      OnChange = MemSetF1Change
      DisplayFormat = '#0.0000'
    end
    object MemSetF9: TIntegerField
      FieldName = 'F9'
      OnChange = MemSetF1Change
      DisplayFormat = '#0.0000'
    end
    object MemSetF10: TIntegerField
      FieldName = 'F10'
      OnChange = MemSetF1Change
      DisplayFormat = '#0.0000'
    end
    object MemSetF11: TIntegerField
      FieldName = 'F11'
      OnChange = MemSetF1Change
      DisplayFormat = '#0.0000'
    end
    object MemSetF12: TIntegerField
      FieldName = 'F12'
      OnChange = MemSetF1Change
      DisplayFormat = '#0.0000'
    end
    object MemSetF13: TIntegerField
      FieldName = 'F13'
      OnChange = MemSetF1Change
      DisplayFormat = '#0.0000'
    end
    object MemSetF14: TIntegerField
      FieldName = 'F14'
      OnChange = MemSetF1Change
      DisplayFormat = '#0.0000'
    end
    object MemSetF15: TIntegerField
      FieldName = 'F15'
      OnChange = MemSetF1Change
      DisplayFormat = '#0.0000'
    end
    object MemSetF16: TIntegerField
      FieldName = 'F16'
      OnChange = MemSetF1Change
      DisplayFormat = '#0.0000'
    end
    object MemSetF17: TIntegerField
      FieldName = 'F17'
      OnChange = MemSetF1Change
      DisplayFormat = '#0.0000'
    end
    object MemSetF18: TIntegerField
      FieldName = 'F18'
      OnChange = MemSetF1Change
      DisplayFormat = '#0.0000'
    end
    object MemSetF19: TIntegerField
      FieldName = 'F19'
      OnChange = MemSetF1Change
      DisplayFormat = '#0.0000'
    end
    object MemSetF20: TIntegerField
      FieldName = 'F20'
      OnChange = MemSetF1Change
      DisplayFormat = '#0.0000'
    end
  end
  object DsSet: TDataSource
    DataSet = MemSet
    OnDataChange = DsSetDataChange
    Left = 84
    Top = 390
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer1Timer
    Left = 500
    Top = 290
  end
  object DualListDialog1: TDualListDialog
    Sorted = False
    Label1Caption = '&Типы накладных'
    Label2Caption = '&Типы для расчёта'
    HelpContext = 0
    Left = 594
    Top = 354
  end
end
