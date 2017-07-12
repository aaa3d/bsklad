object Doc_St: TDoc_St
  Left = 308
  Top = 256
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '\'
  ClientHeight = 652
  ClientWidth = 1025
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poDefault
  Scaled = False
  ShowHint = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1025
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 26
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton6: TToolButton
      Left = 0
      Top = 2
      Caption = 'ToolButton6'
      ImageIndex = 105
      OnClick = ToolButton6Click
    end
    object ToolButton5: TToolButton
      Left = 26
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 104
      Style = tbsSeparator
    end
    object Btn_Prow: TToolButton
      Left = 34
      Top = 2
      Hint = 'Провести накладную'
      Caption = 'Btn_Prow'
      ImageIndex = 22
      Visible = False
    end
    object Btn_Unprow: TToolButton
      Left = 60
      Top = 2
      Hint = 'Снять с проводки накладную'
      Caption = 'Btn_Unprow'
      ImageIndex = 23
      Visible = False
    end
    object ToolButton8: TToolButton
      Left = 86
      Top = 2
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 4
      Style = tbsSeparator
      Visible = False
    end
    object Btn_SAVE: TToolButton
      Left = 94
      Top = 2
      Hint = 'Сохранить счёт (Ctrl+Enter)'
      Caption = 'Btn_SAVE'
      ImageIndex = 39
      OnClick = Btn_SAVEClick
    end
    object Btn_Apply: TToolButton
      Left = 120
      Top = 2
      Hint = 'Применить '
      Caption = 'Btn_Apply'
      ImageIndex = 38
      OnClick = Btn_ApplyClick
    end
    object ToolButton4: TToolButton
      Left = 146
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object Btn_Print: TToolButton
      Left = 154
      Top = 2
      Hint = 'Печать счёта(F9)'
      Caption = 'Btn_Print'
      ImageIndex = 9
      OnClick = Btn_PrintClick
    end
    object Btn_Propertis: TToolButton
      Left = 180
      Top = 2
      Hint = 'История счёта (F12)'
      Caption = 'Btn_Propertis'
      ImageIndex = 3
      OnClick = Btn_PropertisClick
    end
    object Btn_Subdoc: TToolButton
      Left = 206
      Top = 2
      Hint = 'Создать на основании...'
      Caption = 'Btn_Subdoc'
      ImageIndex = 24
      OnClick = Btn_SubdocClick
    end
    object ToolButton11: TToolButton
      Left = 232
      Top = 2
      Width = 45
      Caption = 'ToolButton11'
      ImageIndex = 24
      Style = tbsSeparator
    end
    object Btn_DicTow: TToolButton
      Left = 277
      Top = 2
      Hint = 'Товары по каталогу'
      Caption = 'Btn_DicTow'
      ImageIndex = 37
      OnClick = Btn_DicTowClick
    end
    object Btn_DelTow: TToolButton
      Left = 303
      Top = 2
      Hint = 'Удалить товар из счёта'
      Caption = 'Btn_DelTow'
      ImageIndex = 2
      OnClick = Btn_DelTowClick
    end
    object ToolButton14: TToolButton
      Left = 329
      Top = 2
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object Btn_Detal: TToolButton
      Left = 337
      Top = 2
      Hint = 'Подробная информация о товаре... (F2)'
      Caption = 'Btn_Detal'
      ImageIndex = 11
      OnClick = Btn_DetalClick
    end
    object Btn_Analiz: TToolButton
      Left = 363
      Top = 2
      Hint = 'Анализ товара... (F3)'
      Caption = 'Btn_Analiz'
      ImageIndex = 12
      OnClick = Btn_AnalizClick
    end
    object Btn_Marketing: TToolButton
      Left = 389
      Top = 2
      Hint = 'Маркетинговые исследования... (F4)'
      Caption = 'Btn_Marketing'
      ImageIndex = 10
      OnClick = Btn_MarketingClick
    end
    object ToolButton1: TToolButton
      Left = 415
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object Btn_PrintCenn: TToolButton
      Left = 423
      Top = 2
      Hint = 'Напечатать ценник на выбранный товар (F9)'
      Caption = 'Btn_PrintCenn'
      ImageIndex = 40
      OnClick = Btn_PrintCennClick
    end
    object Btn_PrintCennMore: TToolButton
      Left = 449
      Top = 2
      Hint = 'Напечатать цениики на все товары из счёта (F9)'
      Caption = 'Btn_PrintCennMore'
      ImageIndex = 41
      OnClick = Btn_PrintCennMoreClick
    end
    object ToolButton2: TToolButton
      Left = 475
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 42
      Style = tbsSeparator
    end
    object Btn_RefreshOst: TToolButton
      Left = 483
      Top = 2
      Hint = 'Обновить информацию об остатках и сумме...(Ctrl+~)'
      ImageIndex = 44
      OnClick = Btn_RefreshOstClick
    end
    object ToolButton3: TToolButton
      Left = 509
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 45
      Style = tbsSeparator
    end
    object BtnOnHelp: TToolButton
      Left = 517
      Top = 2
      Hint = 'Проанализировать остатки на складах...'
      Caption = 'BtnOnHelp'
      ImageIndex = 103
      OnClick = BtnOnHelpClick
    end
    object ToolButton7: TToolButton
      Left = 543
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 104
      Style = tbsSeparator
    end
    object ShowOst: TCheckBox
      Left = 551
      Top = 2
      Width = 142
      Height = 24
      Caption = 'Отображение остатков'
      TabOrder = 0
    end
    object ToolButton9: TToolButton
      Left = 693
      Top = 2
      Caption = 'Ценник 2'
      ImageIndex = 41
      OnClick = ToolButton9Click
    end
    object ToolButton10: TToolButton
      Left = 719
      Top = 2
      Caption = 'ToolButton10'
      ImageIndex = 42
      OnClick = ToolButton10Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 633
    Width = 1025
    Height = 19
    Panels = <
      item
        Text = 'Состояние :'
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
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 1025
    Height = 604
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 1025
      Height = 153
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Label3: TLabel
        Left = 56
        Top = 8
        Width = 43
        Height = 13
        Caption = 'Фирма :'
      end
      object Label5: TLabel
        Left = 56
        Top = 32
        Width = 42
        Height = 13
        Caption = 'Клиент :'
      end
      object Label6: TLabel
        Left = 368
        Top = 8
        Width = 70
        Height = 13
        Caption = 'Банк фирмы :'
      end
      object Label7: TLabel
        Left = 364
        Top = 32
        Width = 75
        Height = 13
        Caption = 'Банк клиента :'
      end
      object Label8: TLabel
        Left = 36
        Top = 104
        Width = 62
        Height = 13
        Caption = 'Основание :'
      end
      object Label10: TLabel
        Left = 396
        Top = 56
        Width = 40
        Height = 13
        Caption = 'Номер :'
      end
      object Label11: TLabel
        Left = 64
        Top = 80
        Width = 32
        Height = 13
        Caption = 'Дата :'
      end
      object Label14: TLabel
        Left = 562
        Top = 56
        Width = 40
        Height = 13
        Caption = 'Сумма :'
      end
      object Label1: TLabel
        Left = 228
        Top = 80
        Width = 44
        Height = 13
        Caption = 'Валюта :'
      end
      object Label2: TLabel
        Left = 374
        Top = 78
        Width = 63
        Height = 13
        Caption = 'Остатки по :'
      end
      object SpeedButton1: TSpeedButton
        Left = 650
        Top = 74
        Width = 19
        Height = 20
        Hint = 'Настройка фильтра складов'
        Caption = '...'
        Visible = False
        OnClick = SpeedButton1Click
      end
      object Label4: TLabel
        Left = 672
        Top = 78
        Width = 27
        Height = 13
        Caption = 'НДС:'
      end
      object Label9: TLabel
        Left = 0
        Top = 56
        Width = 100
        Height = 13
        Caption = 'Категория клиента:'
      end
      object Label12: TLabel
        Left = 400
        Top = 124
        Width = 36
        Height = 13
        Caption = 'Масса:'
      end
      object Label13: TLabel
        Left = 584
        Top = 124
        Width = 85
        Height = 13
        Caption = 'Наценка от зак: '
      end
      object KLN_NAME: TEdit
        Left = 104
        Top = 28
        Width = 229
        Height = 21
        Enabled = False
        TabOrder = 1
        Text = 'KLN_NAME'
      end
      object FRM_BNK: TEdit
        Left = 444
        Top = 4
        Width = 293
        Height = 21
        Enabled = False
        TabOrder = 0
        Text = 'FRM_BNK'
      end
      object KLN_BNK: TEdit
        Left = 444
        Top = 28
        Width = 293
        Height = 21
        Enabled = False
        TabOrder = 2
        Text = 'KLN_BNK'
      end
      object ST_OSN: TMemo
        Left = 104
        Top = 100
        Width = 267
        Height = 41
        Lines.Strings = (
          'Memo1')
        MaxLength = 250
        TabOrder = 6
      end
      object ST_NUM: TEdit
        Left = 444
        Top = 52
        Width = 113
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        Text = 'ST_NUM'
      end
      object ST_DATE: TDateEdit
        Left = 104
        Top = 76
        Width = 121
        Height = 21
        NumGlyphs = 2
        TabOrder = 5
      end
      object ST_SUMM: TRxCalcEdit
        Left = 610
        Top = 52
        Width = 109
        Height = 21
        AutoSize = False
        DisplayFormat = '#,0.00'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 4
      end
      object ST_VALUTA: TRxDBLookupCombo
        Left = 276
        Top = 76
        Width = 93
        Height = 21
        DropDownCount = 8
        LookupField = 'VALUTA_ID'
        LookupDisplay = 'VALUTA_FULL'
        LookupSource = DsValuta
        TabOrder = 7
      end
      object BTN_KLN: TBitBtn
        Left = 332
        Top = 28
        Width = 25
        Height = 21
        Hint = 'Поменять клиента (F10)'
        TabOrder = 8
        TabStop = False
        OnClick = BTN_KLNClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
          0555088888888888805508000000000088055080FFFFFF0508800000000000F0
          F0800FFFFFFFFF0F008050F00F00FFF0F08050FFFFFFFFF0F080000FFFFFFFFF
          00000900F00000F00090090FFFFFFFFF0090000FFFFFFFFF0F00550F000F00FF
          0F05550FFFFFFFFF0005550FFF00000005555550005555555555}
      end
      object ListOst: TRxDBLookupCombo
        Left = 444
        Top = 74
        Width = 205
        Height = 21
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'CFG_ID'
        LookupDisplay = 'CFG_VALUE'
        LookupSource = DsListOst
        TabOrder = 9
        OnChange = ListOstChange
      end
      object DBEdit1: TDBEdit
        Left = 444
        Top = 96
        Width = 311
        Height = 21
        DataField = 'SKL_LIST'
        DataSource = DsListOst
        Enabled = False
        TabOrder = 10
      end
      object NDS: TRxCalcEdit
        Left = 702
        Top = 74
        Width = 51
        Height = 21
        AutoSize = False
        DisplayFormat = '#0.00%'
        ButtonWidth = 0
        NumGlyphs = 2
        PopupMenu = MenuNDS
        TabOrder = 11
        OnExit = NDSExit
        OnKeyPress = NDSKeyPress
      end
      object FRM: TRxDBLookupCombo
        Left = 104
        Top = 6
        Width = 253
        Height = 20
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'KLN_ID'
        LookupDisplay = 'KLN_FULL'
        LookupSource = DataModule1.MainDsAllFrm
        TabOrder = 12
        OnChange = FRMChange
      end
      object KLN_KTG: TEdit
        Left = 104
        Top = 52
        Width = 253
        Height = 21
        Enabled = False
        TabOrder = 13
        Text = 'KLN_KTG'
      end
      object ST_NAC: TRxCalcEdit
        Left = 668
        Top = 127
        Width = 85
        Height = 18
        AutoSize = False
        DirectInput = False
        DisplayFormat = ',#0.00р'
        Enabled = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 14
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 153
      Width = 1025
      Height = 451
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object RxDBGrid2: TRxDBGrid
        Left = 0
        Top = 0
        Width = 1025
        Height = 335
        Align = alClient
        DataSource = DsSTS
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnGetCellParams = RxDBGrid2GetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'TW_ART'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Код'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_NAM'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Наименование товара'
            Width = 172
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ED_SHORT'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Ед. изм.'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_MONEY'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Цена'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_SKID'
            Title.Alignment = taCenter
            Title.Caption = 'Скидка, %'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_OKMONEY'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Итог. цена'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_KOL'
            Title.Alignment = taCenter
            Title.Caption = 'Кол-во'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_SUMM'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Сумма'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STS_WEIGHT'
            Title.Alignment = taCenter
            Title.Caption = 'Масса, кг'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OST'
            Title.Alignment = taCenter
            Title.Caption = 'Общий остаток'
            Width = 87
            Visible = True
          end>
      end
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 335
        Width = 1025
        Height = 116
        Align = alBottom
        DataSource = DsFastInfo
        TabOrder = 1
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
            Width = 83
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
    end
  end
  object RN_WEIGHT: TRxCalcEdit
    Left = 444
    Top = 152
    Width = 85
    Height = 18
    AutoSize = False
    DirectInput = False
    DisplayFormat = ',#0.00 кг'
    Enabled = False
    ButtonWidth = 0
    NumGlyphs = 2
    TabOrder = 3
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = Query1Transaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 72
    Top = 241
  end
  object MemSTS: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'TW_ID'
        DataType = ftInteger
      end
      item
        Name = 'TW_NAM'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'TW_MONEY'
        DataType = ftFloat
      end
      item
        Name = 'TW_KOL'
        DataType = ftFloat
      end
      item
        Name = 'ED_SHORT'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'TW_WEIGHT'
        DataType = ftFloat
      end
      item
        Name = 'STS_ID'
        DataType = ftInteger
      end
      item
        Name = 'TW_ART'
        DataType = ftInteger
      end
      item
        Name = 'TW_SKID'
        DataType = ftFloat
      end
      item
        Name = 'OST'
        DataType = ftFloat
      end
      item
        Name = 'TW_COLOR'
        DataType = ftInteger
      end
      item
        Name = 'MET_MONEY_SHOP'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'tw_NOSKID'
        DataType = ftInteger
      end
      item
        Name = 'tw_skid_load'
        DataType = ftFloat
      end
      item
        Name = 'napr'
        DataType = ftInteger
      end
      item
        Name = 'ktg'
        DataType = ftInteger
      end
      item
        Name = 'tw_seb'
        DataType = ftFloat
      end>
    AfterPost = MemSTSAfterPost
    AfterDelete = MemSTSAfterDelete
    AfterScroll = MemSTSAfterPost
    OnCalcFields = MemSTSCalcFields
    Left = 266
    Top = 241
    object MemSTSTW_ID: TIntegerField
      FieldName = 'TW_ID'
      OnChange = MemSTSTW_IDChange
    end
    object MemSTSTW_NAM: TStringField
      FieldName = 'TW_NAM'
      OnChange = MemSTSTW_IDChange
      Size = 254
    end
    object MemSTSTW_MONEY: TFloatField
      FieldName = 'TW_MONEY'
      OnChange = MemSTSTW_IDChange
      DisplayFormat = '#0.00 руб'
    end
    object MemSTSTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      OnChange = MemSTSTW_KOLChange
      DisplayFormat = '#0.0000'
    end
    object MemSTSTW_SUMM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TW_SUMM'
      OnChange = MemSTSTW_IDChange
      DisplayFormat = '#0.00 руб'
      Calculated = True
    end
    object MemSTSED_SHORT: TStringField
      FieldName = 'ED_SHORT'
      OnChange = MemSTSTW_IDChange
      Size = 32
    end
    object MemSTSTW_WEIGHT: TFloatField
      FieldName = 'TW_WEIGHT'
    end
    object MemSTSRNS_WEIGHT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'STS_WEIGHT'
      DisplayFormat = '#0.00'
      Calculated = True
    end
    object MemSTSSTS_ID: TIntegerField
      FieldName = 'STS_ID'
      OnChange = MemSTSTW_IDChange
    end
    object MemSTSTW_ART: TIntegerField
      FieldName = 'TW_ART'
      OnChange = MemSTSTW_IDChange
    end
    object MemSTSTW_SKID: TFloatField
      FieldName = 'TW_SKID'
      DisplayFormat = '#0.0000000'
    end
    object MemSTSTW_OKMONEY: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TW_OKMONEY'
      DisplayFormat = '#0.00 руб'
      Calculated = True
    end
    object MemSTSOST: TFloatField
      FieldName = 'OST'
      DisplayFormat = '#0.0000'
    end
    object MemSTSTW_COLOR: TIntegerField
      FieldName = 'TW_COLOR'
    end
    object MemSTSMET_MONEY_SHOP: TStringField
      FieldName = 'MET_MONEY_SHOP'
      Size = 1
    end
    object MemSTStw_NOSKID: TIntegerField
      FieldName = 'tw_NOSKID'
    end
    object MemSTStw_skid_load: TFloatField
      FieldName = 'tw_skid_load'
    end
    object MemSTSnapr: TIntegerField
      FieldName = 'napr'
    end
    object MemSTSktg: TIntegerField
      FieldName = 'ktg'
    end
    object MemSTStw_seb: TFloatField
      FieldName = 'tw_seb'
    end
  end
  object DsSTS: TDataSource
    DataSet = MemSTS
    OnDataChange = DsSTSDataChange
    Left = 266
    Top = 301
  end
  object StDocTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 338
    Top = 241
  end
  object Query1Transaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 68
    Top = 301
  end
  object IBQuery2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = Query1Transaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 12
    Top = 241
  end
  object PopupMenu1: TPopupMenu
    Images = DataModule1.ImageList1
    Left = 198
    Top = 241
    object MnSave: TMenuItem
      Caption = 'Сохранить счёт и выйти... (Ctrl+Enter)'
      ImageIndex = 39
      OnClick = Btn_SAVEClick
    end
    object MnApply: TMenuItem
      Caption = 'Сохранить счёт без выхода (Применить)'
      ImageIndex = 38
      OnClick = Btn_ApplyClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object MnPrint: TMenuItem
      Caption = 'Напечатать счёт  (F9)'
      ImageIndex = 9
      OnClick = Btn_PrintClick
    end
    object MnHistory: TMenuItem
      Caption = '"История" счёта'
      ImageIndex = 3
      ShortCut = 123
      OnClick = Btn_PropertisClick
    end
    object MnSubDoc: TMenuItem
      Caption = 'Создать новый документ на основании данного счёта'
      ImageIndex = 24
      OnClick = Btn_SubdocClick
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = 'Поменять фирму'
      ImageIndex = 43
      ShortCut = 16505
    end
    object N5: TMenuItem
      Caption = 'Поменять клиента'
      ImageIndex = 43
      ShortCut = 121
      OnClick = BTN_KLNClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object MnTW: TMenuItem
      Caption = 'Товары по каталогу '
      ImageIndex = 37
      ShortCut = 122
      OnClick = Btn_DicTowClick
    end
    object MnDel: TMenuItem
      Caption = 'Удалить товар из счёта'
      ImageIndex = 2
      OnClick = Btn_DelTowClick
    end
    object N13: TMenuItem
      Caption = '-'
      ShortCut = 189
    end
    object MnDetal: TMenuItem
      Caption = 'Подробная информация о товаре'
      ImageIndex = 11
      ShortCut = 113
      OnClick = Btn_DetalClick
    end
    object MnAnaliz: TMenuItem
      Caption = 'Анализ товара'
      ImageIndex = 12
      ShortCut = 114
      OnClick = Btn_AnalizClick
    end
    object MnMarketing: TMenuItem
      Caption = 'Маркетинговые исследования товара'
      ImageIndex = 10
      ShortCut = 115
      OnClick = Btn_MarketingClick
    end
    object N18: TMenuItem
      Caption = '-'
    end
    object MnCenn: TMenuItem
      Caption = 'Напечатать ценник   (F9)'
      ImageIndex = 40
      OnClick = Btn_PrintCennClick
    end
    object MnCennMore: TMenuItem
      Caption = 'Напечатать ценники на все товары из накладной   (F9)'
      ImageIndex = 41
      OnClick = Btn_PrintCennMoreClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object MnRefreshOst: TMenuItem
      Caption = 'Обновить информацию об остатках товаров и сумме (Ctrl+~)'
      ImageIndex = 44
      OnClick = Btn_RefreshOstClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MnSet_Skid: TMenuItem
      Caption = 'Определить скидку на цену товара'
      ShortCut = 16467
      OnClick = MnSet_SkidClick
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object MnOnHelp: TMenuItem
      Caption = 'Проанализировать остатки на складах'
      ImageIndex = 1033
      OnClick = BtnOnHelpClick
    end
  end
  object IbValuta: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = StDocTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select VALUTA_ID, VALUTA_FULL from valuta'
      '')
    Left = 134
    Top = 241
    object IbValutaVALUTA_ID: TIntegerField
      FieldName = 'VALUTA_ID'
      Required = True
    end
    object IbValutaVALUTA_FULL: TIBStringField
      FieldName = 'VALUTA_FULL'
      Required = True
      Size = 254
    end
  end
  object DsValuta: TDataSource
    DataSet = IbValuta
    Left = 134
    Top = 301
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 432
    Top = 241
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 432
    Top = 297
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 340
    Top = 300
  end
  object FastInfoTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 528
    Top = 241
  end
  object QrFastInfo: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = FastInfoTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from fast_info(:tw_id,1)')
    Left = 528
    Top = 297
    ParamData = <
      item
        DataType = ftInteger
        Name = 'tw_id'
        ParamType = ptInput
      end>
    object QrFastInfoVID: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'VID'
      ReadOnly = True
      Size = 64
    end
    object QrFastInfoF1: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F1'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF2: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F2'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF3: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F3'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF4: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F4'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF5: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F5'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF6: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F6'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF7: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F7'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF8: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F8'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF9: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F9'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF10: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F10'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF11: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F11'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF12: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F12'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF13: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F13'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF14: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F14'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF15: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F15'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF16: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F16'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF17: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F17'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF18: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F18'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF19: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F19'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF20: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F20'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoVID_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'VID_ID'
      ReadOnly = True
    end
  end
  object DsFastInfo: TDataSource
    DataSet = QrFastInfo
    Left = 612
    Top = 239
  end
  object IBQuery3: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = FastInfoTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 612
    Top = 292
  end
  object OstTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 712
    Top = 196
  end
  object QrListOst: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = OstTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from list_set_ost_st(:us_id)'
      'order by cfg_value')
    Left = 710
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'us_id'
        ParamType = ptUnknown
      end>
    object QrListOstCFG_ID: TIntegerField
      FieldName = 'CFG_ID'
      Origin = 'LIST_SET_OST_ST.CFG_ID'
    end
    object QrListOstCFG_VALUE: TIBStringField
      FieldName = 'CFG_VALUE'
      Origin = 'LIST_SET_OST_ST.CFG_VALUE'
      Size = 254
    end
    object QrListOstSKL_LIST: TIBStringField
      FieldName = 'SKL_LIST'
      Origin = 'LIST_SET_OST_ST.SKL_LIST'
      Size = 1000
    end
  end
  object DsListOst: TDataSource
    DataSet = QrListOst
    Left = 712
    Top = 300
  end
  object MenuNDS: TPopupMenu
    Left = 384
    Top = 196
    object N8: TMenuItem
      Caption = 'Выставить ставку НДС на основании текущих настроек'
      OnClick = N8Click
    end
  end
end
