object Detal_TW: TDetal_TW
  Left = 443
  Top = 340
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Подробная информация о товаре'
  ClientHeight = 600
  ClientWidth = 1013
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 790
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 581
    Width = 1013
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1013
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 1
    object BtnPrint: TToolButton
      Left = 0
      Top = 2
      Hint = 'Печать текущего отображения подробной информации о товаре (F9)'
      Caption = 'BtnPrint'
      ImageIndex = 9
      OnClick = BtnPrintClick
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object Btn_INTERVAL: TToolButton
      Left = 33
      Top = 2
      Hint = 'Период времени выбранной страницы (I)'
      Caption = 'Btn_INTERVAL'
      ImageIndex = 36
      OnClick = Btn_INTERVALClick
    end
    object ToolButton4: TToolButton
      Left = 58
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 37
      Style = tbsSeparator
    end
    object Btn_BRAK: TToolButton
      Left = 66
      Top = 2
      Hint = 'Информация по браку/хорошему (Пробел)'
      Caption = 'Btn_BRAK'
      ImageIndex = 43
      OnClick = Btn_BRAKClick
    end
    object ToolButton3: TToolButton
      Left = 91
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 38
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 99
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton1'
      ImageIndex = 110
      OnClick = ToolButton1Click
    end
    object ToolButton6: TToolButton
      Left = 124
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 40
      Style = tbsSeparator
    end
    object TW_NAM2: TEdit
      Left = 132
      Top = 2
      Width = 302
      Height = 24
      Enabled = False
      TabOrder = 0
    end
    object ToolButton5: TToolButton
      Left = 434
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 39
      Style = tbsSeparator
    end
    object SKL1: TRadioButton
      Left = 442
      Top = 2
      Width = 92
      Height = 24
      Caption = 'Все склады'
      TabOrder = 1
      OnClick = SKL2Click
    end
    object SKL2: TRadioButton
      Left = 534
      Top = 2
      Width = 92
      Height = 24
      Caption = 'Один склад :'
      Checked = True
      TabOrder = 2
      TabStop = True
      OnClick = SKL2Click
    end
    object SKL: TRxDBLookupCombo
      Left = 626
      Top = 2
      Width = 156
      Height = 24
      DropDownCount = 8
      LookupField = 'SKL_ID'
      LookupDisplay = 'SKL_FULL'
      LookupSource = DsSKL
      TabOrder = 3
      OnChange = SKLChange
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 29
    Width = 1013
    Height = 552
    ActivePage = tw_zone_distrib
    Align = alClient
    MultiLine = True
    TabOrder = 2
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = '1. Основная информация'
      object Label8: TLabel
        Left = 50
        Top = 8
        Width = 85
        Height = 13
        Caption = 'Группа товаров :'
      end
      object Label10: TLabel
        Left = 72
        Top = 32
        Width = 63
        Height = 13
        Caption = 'Код товара :'
      end
      object Label11: TLabel
        Left = 264
        Top = 32
        Width = 120
        Height = 13
        Caption = 'Наименование товара :'
      end
      object Label12: TLabel
        Left = 37
        Top = 60
        Width = 98
        Height = 13
        Caption = 'Базовые единицы :'
      end
      object Label13: TLabel
        Left = 400
        Top = 60
        Width = 82
        Height = 13
        Caption = 'Валюта товара :'
      end
      object Label14: TLabel
        Left = 56
        Top = 84
        Width = 79
        Height = 13
        Caption = 'Производство :'
      end
      object Label15: TLabel
        Left = 82
        Top = 108
        Width = 53
        Height = 13
        Caption = 'Размеры :'
      end
      object Label16: TLabel
        Left = 79
        Top = 132
        Width = 56
        Height = 13
        Caption = 'Упаковка :'
      end
      object Label17: TLabel
        Left = 66
        Top = 156
        Width = 69
        Height = 13
        Caption = 'Примечания :'
      end
      object Label18: TLabel
        Left = 49
        Top = 256
        Width = 84
        Height = 13
        Hint = 
          'Номер секции, по которой будет пробиваться товар'#13#10'через контроль' +
          'но-кассовую машину (кассу)'
        Caption = 'Секция по ККМ :'
      end
      object Label19: TLabel
        Left = 244
        Top = 256
        Width = 87
        Height = 13
        Caption = 'Розничная цена :'
      end
      object Label20: TLabel
        Left = 36
        Top = 308
        Width = 97
        Height = 13
        Caption = 'Категория товара :'
      end
      object Label21: TLabel
        Left = 465
        Top = 256
        Width = 92
        Height = 13
        Caption = 'Цена на ценнике :'
      end
      object Label26: TLabel
        Left = 264
        Top = 280
        Width = 65
        Height = 13
        Caption = 'Цена брака :'
      end
      object Label27: TLabel
        Left = 465
        Top = 280
        Width = 91
        Height = 13
        Caption = 'Брак на ценнике :'
      end
      object Label7: TLabel
        Left = 19
        Top = 208
        Width = 116
        Height = 13
        Caption = 'Страна производства :'
      end
      object Label9: TLabel
        Left = 4
        Top = 232
        Width = 131
        Height = 13
        Caption = '№ таможн. декаларации :'
      end
      object Label37: TLabel
        Left = 424
        Top = 335
        Width = 97
        Height = 13
        Caption = 'Цены в магазинах:'
      end
      object Label36: TLabel
        Left = 32
        Top = 332
        Width = 91
        Height = 13
        Caption = 'Цена прайс листа'
      end
      object TWTREE_FULL: TEdit
        Left = 140
        Top = 4
        Width = 633
        Height = 21
        Enabled = False
        TabOrder = 0
        Text = 'TWTREE_FULL'
      end
      object TW_ART: TEdit
        Left = 140
        Top = 28
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 1
        Text = 'TW_ART'
      end
      object TW_NAM: TEdit
        Left = 388
        Top = 28
        Width = 385
        Height = 21
        Enabled = False
        TabOrder = 2
        Text = 'TW_NAM'
      end
      object ED_FULL: TEdit
        Left = 140
        Top = 56
        Width = 225
        Height = 21
        Enabled = False
        TabOrder = 3
        Text = 'ED_FULL'
      end
      object VALUTA_FULL: TEdit
        Left = 488
        Top = 56
        Width = 285
        Height = 21
        Enabled = False
        TabOrder = 4
        Text = 'VALUTA_FULL'
      end
      object TW_MADE: TEdit
        Left = 140
        Top = 80
        Width = 633
        Height = 21
        Enabled = False
        TabOrder = 5
        Text = 'TW_MADE'
      end
      object TW_RAZM: TEdit
        Left = 140
        Top = 104
        Width = 633
        Height = 21
        Enabled = False
        TabOrder = 6
        Text = 'TW_RAZM'
      end
      object TW_UP: TEdit
        Left = 140
        Top = 128
        Width = 633
        Height = 21
        Enabled = False
        TabOrder = 7
        Text = 'TW_UP'
      end
      object TW_PRIM: TMemo
        Left = 140
        Top = 152
        Width = 633
        Height = 49
        TabStop = False
        Lines.Strings = (
          'TW_PRIM')
        ReadOnly = True
        TabOrder = 8
      end
      object TW_SEK: TEdit
        Left = 140
        Top = 252
        Width = 93
        Height = 21
        Enabled = False
        TabOrder = 9
        Text = 'TW_SEK'
      end
      object TW_MROZ: TRxCalcEdit
        Left = 336
        Top = 252
        Width = 121
        Height = 21
        AutoSize = False
        DisplayFormat = ',#0.00 руб'
        Enabled = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 10
      end
      object TW_MROZ_CENN: TRxCalcEdit
        Left = 564
        Top = 252
        Width = 121
        Height = 21
        AutoSize = False
        DisplayFormat = ',#0.00 руб'
        Enabled = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 11
      end
      object TWKTG_NAM: TEdit
        Left = 140
        Top = 304
        Width = 317
        Height = 21
        Enabled = False
        TabOrder = 12
        Text = 'TWKTG_NAM'
      end
      object TW_MROZ2: TRxCalcEdit
        Left = 336
        Top = 276
        Width = 121
        Height = 21
        AutoSize = False
        DisplayFormat = ',#0.00 руб'
        Enabled = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 13
      end
      object TW_MROZ2_CENN: TRxCalcEdit
        Left = 564
        Top = 276
        Width = 121
        Height = 21
        AutoSize = False
        DisplayFormat = ',#0.00 руб'
        Enabled = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 14
      end
      object TW_LAND: TEdit
        Left = 140
        Top = 204
        Width = 633
        Height = 21
        Enabled = False
        TabOrder = 15
        Text = 'TW_LAND'
      end
      object TW_TAM: TEdit
        Left = 140
        Top = 228
        Width = 633
        Height = 21
        Enabled = False
        TabOrder = 16
        Text = 'TW_TAM'
      end
      object PRICE_GRID: TRxDBGrid
        Left = 140
        Top = 334
        Width = 277
        Height = 159
        DataSource = DS_PRICE
        TabOrder = 17
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'twpricetyp_desc'
            ReadOnly = True
            Title.Caption = 'Тип цены'
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'twprice_money'
            ReadOnly = True
            Title.Caption = 'Цена'
            Width = 100
            Visible = True
          end>
      end
      object RxDBGrid10: TRxDBGrid
        Left = 528
        Top = 338
        Width = 249
        Height = 123
        DataSource = DsShop
        ReadOnly = True
        TabOrder = 18
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
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_MONEY'
            Title.Alignment = taCenter
            Title.Caption = 'Розн. цена'
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_MONEY2'
            Title.Alignment = taCenter
            Title.Caption = 'Цена в валюте'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'SKID_PERCENT'
            Title.Alignment = taCenter
            Title.Caption = 'Скидка, %'
            Width = 71
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = '2. Дополнительные цены'
      ImageIndex = 1
      object Panel17: TPanel
        Left = 0
        Top = 0
        Width = 1005
        Height = 29
        Align = alTop
        TabOrder = 0
        object Label5: TLabel
          Left = 8
          Top = 8
          Width = 87
          Height = 13
          Caption = 'Розничная цена :'
        end
        object Label6: TLabel
          Left = 233
          Top = 8
          Width = 92
          Height = 13
          Caption = 'Цена на ценнике :'
        end
        object MON1: TRxCalcEdit
          Left = 100
          Top = 4
          Width = 101
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.0000##'
          Enabled = False
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 0
        end
        object MON2: TRxCalcEdit
          Left = 328
          Top = 4
          Width = 97
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.00 руб##'
          Enabled = False
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object Panel18: TPanel
        Left = 0
        Top = 29
        Width = 1005
        Height = 477
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Panel19: TPanel
          Left = 0
          Top = 0
          Width = 421
          Height = 477
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object RxDBGrid6: TRxDBGrid
            Left = 0
            Top = 17
            Width = 421
            Height = 460
            Align = alClient
            DataSource = DsShop
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
                FieldName = 'SHOP_NAME'
                Title.Alignment = taCenter
                Title.Caption = 'Магазин'
                Width = 114
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TW_MONEY'
                Title.Alignment = taCenter
                Title.Caption = 'Розн. цена'
                Width = 109
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TW_MONEY2'
                Title.Alignment = taCenter
                Title.Caption = 'Цена в валюте'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SKID_PERCENT'
                Title.Alignment = taCenter
                Title.Caption = 'Скидка, %'
                Width = 71
                Visible = True
              end>
          end
          object Panel20: TPanel
            Left = 0
            Top = 0
            Width = 421
            Height = 17
            Align = alTop
            Caption = 'Цены в магазинах'
            TabOrder = 1
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = '3. Дополнительная комплектация'
      ImageIndex = 2
      object RxDBGrid8: TRxDBGrid
        Left = 0
        Top = 0
        Width = 941
        Height = 524
        Align = alClient
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'Ед.изм.'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'Кол-во'
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'Цена в валюте'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'Цена в рублях'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'Размеры'
            Width = 219
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'Упаковка'
            Width = 244
            Visible = True
          end>
      end
    end
    object TabSheet4: TTabSheet
      Caption = '4. Остатки и сертификация'
      ImageIndex = 3
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 369
        Height = 506
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 369
          Height = 77
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 0
          object Label22: TLabel
            Left = 4
            Top = 8
            Width = 171
            Height = 13
            Caption = 'Остатки товара на всех складах :'
          end
          object Label23: TLabel
            Left = 184
            Top = 8
            Width = 36
            Height = 13
            Caption = 'Всего :'
          end
          object Label24: TLabel
            Left = 172
            Top = 32
            Width = 50
            Height = 13
            Caption = 'Хороших :'
          end
          object Label25: TLabel
            Left = 148
            Top = 56
            Width = 74
            Height = 13
            Caption = 'Бракованных :'
          end
          object OST1: TRxCalcEdit
            Left = 228
            Top = 4
            Width = 137
            Height = 21
            AutoSize = False
            DisplayFormat = '#0.0000 шт'
            Enabled = False
            ButtonWidth = 0
            NumGlyphs = 2
            TabOrder = 0
          end
          object OST2: TRxCalcEdit
            Left = 228
            Top = 28
            Width = 137
            Height = 21
            AutoSize = False
            DisplayFormat = '#0.0000 шт'
            Enabled = False
            ButtonWidth = 0
            NumGlyphs = 2
            TabOrder = 1
          end
          object OST3: TRxCalcEdit
            Left = 228
            Top = 52
            Width = 137
            Height = 21
            AutoSize = False
            DisplayFormat = '#0.0000 шт'
            Enabled = False
            ButtonWidth = 0
            NumGlyphs = 2
            TabOrder = 2
          end
        end
        object RxDBGrid4: TRxDBGrid
          Left = 0
          Top = 77
          Width = 369
          Height = 429
          Align = alClient
          DataSource = DataModule2.DsQuery_OST
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'SKL_FULL'
              Title.Alignment = taCenter
              Title.Caption = 'Склад'
              Width = 174
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OST1'
              Title.Alignment = taCenter
              Title.Caption = 'Всего'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OST2'
              Title.Alignment = taCenter
              Title.Caption = 'В т.ч. брак'
              Width = 76
              Visible = True
            end>
        end
      end
      object Panel3: TPanel
        Left = 369
        Top = 0
        Width = 636
        Height = 506
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 636
          Height = 117
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 0
          object Label28: TLabel
            Left = 4
            Top = 4
            Width = 141
            Height = 13
            Caption = 'Действующий сертификат :'
          end
          object Label29: TLabel
            Left = 8
            Top = 24
            Width = 40
            Height = 13
            Caption = 'Номер :'
          end
          object Label30: TLabel
            Left = 8
            Top = 48
            Width = 81
            Height = 13
            Caption = 'Срок действия :'
          end
          object Label31: TLabel
            Left = 8
            Top = 72
            Width = 62
            Height = 13
            Caption = 'Кем выдан :'
          end
          object Label32: TLabel
            Left = 8
            Top = 100
            Width = 111
            Height = 13
            Caption = 'Архив сертификатов :'
          end
          object Sert_NUM: TEdit
            Left = 52
            Top = 20
            Width = 349
            Height = 21
            Enabled = False
            TabOrder = 0
          end
          object SERT_DATE: TDateEdit
            Left = 92
            Top = 44
            Width = 121
            Height = 21
            Enabled = False
            NumGlyphs = 2
            TabOrder = 1
          end
          object SERT_WHO: TEdit
            Left = 76
            Top = 68
            Width = 325
            Height = 21
            Enabled = False
            TabOrder = 2
          end
        end
        object RxDBGrid5: TRxDBGrid
          Left = 0
          Top = 117
          Width = 636
          Height = 389
          Align = alClient
          DataSource = DataModule2.DsQuery_SERT
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'SERT_NUM'
              Title.Alignment = taCenter
              Title.Caption = 'Номер'
              Width = 233
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERT_DATE'
              Title.Alignment = taCenter
              Title.Caption = 'Срок действия'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERT_WHO'
              Title.Caption = 'Кем выдан'
              Width = 201
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FIO'
              Title.Caption = 'Кто внёс данные'
              Width = 169
              Visible = True
            end>
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = '5. Поставки'
      ImageIndex = 4
      object Status_POST: TStatusBar
        Left = 0
        Top = 0
        Width = 1005
        Height = 19
        Align = alTop
        Panels = <
          item
            Text = 'Поставки товара за :'
            Width = 50
          end>
        SimplePanel = False
      end
      object PostGrid: TRxDBGrid
        Left = 0
        Top = 19
        Width = 1005
        Height = 487
        Align = alClient
        DataSource = DataModule2.DsQuery_POST
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = PostGridDblClick
        OnKeyPress = PostGridKeyPress
        OnGetCellParams = PostGridGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'KLN_PREFIX'
            Title.Alignment = taCenter
            Title.Caption = 'Фирма'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PN_NUM_FULL'
            Title.Alignment = taCenter
            Title.Caption = 'Номер'
            Width = 121
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KLN_ORG'
            Title.Alignment = taCenter
            Title.Caption = 'Поставщик'
            Width = 137
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PN_DATE'
            Title.Alignment = taCenter
            Title.Caption = 'Дата'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PN_DATE_OPL'
            Title.Alignment = taCenter
            Title.Caption = 'Дата оплаты'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_KOL'
            Title.Alignment = taCenter
            Title.Caption = 'Кол-во'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_MONEY'
            Title.Alignment = taCenter
            Title.Caption = 'Цена'
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_MONEYD'
            Title.Alignment = taCenter
            Title.Caption = 'Цена, $'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TW_MONEY_S'
            Title.Alignment = taCenter
            Title.Caption = 'Себестоимость'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_SUMM'
            Title.Caption = 'Сумма'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_SUMMD'
            Title.Alignment = taCenter
            Title.Caption = 'Сумма, $'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TW_SUMM_S'
            Title.Caption = 'Сумма себест.'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SKL_SHORT'
            Title.Alignment = taCenter
            Title.Caption = 'Склад разгрузки'
            Width = 165
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OWNER_FULL'
            Title.Alignment = taCenter
            Title.Caption = '"Владелец" накладной'
            Width = 158
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PN_KURS'
            Title.Alignment = taCenter
            Title.Caption = 'Курс'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PNVID_NAM'
            Title.Alignment = taCenter
            Title.Caption = 'Вид накладной'
            Width = 64
            Visible = True
          end>
      end
    end
    object TabSheet6: TTabSheet
      Caption = '6. Реализация'
      ImageIndex = 5
      object Status_REAL: TStatusBar
        Left = 0
        Top = 0
        Width = 1005
        Height = 19
        Align = alTop
        Panels = <
          item
            Text = 'Продажи и списания товара за :'
            Width = 50
          end>
        SimplePanel = False
      end
      object RealGrid: TRxDBGrid
        Left = 0
        Top = 19
        Width = 1005
        Height = 487
        Align = alClient
        DataSource = DataModule2.DsQuery_Realiz
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = RealGridDblClick
        OnKeyPress = RealGridKeyPress
        OnGetCellParams = RealGridGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'KLN_PREFIX'
            Title.Alignment = taCenter
            Title.Caption = 'Фирма'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REAL_NUM_FULL'
            Title.Alignment = taCenter
            Title.Caption = 'Номер'
            Width = 118
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KLN_ORG'
            Title.Alignment = taCenter
            Title.Caption = 'Клиент'
            Width = 147
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REAL_DATE'
            Title.Alignment = taCenter
            Title.Caption = 'Дата'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_KOL'
            Title.Alignment = taCenter
            Title.Caption = 'Кол-во'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_MONEY'
            Title.Alignment = taCenter
            Title.Caption = 'Цена'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_MONEYD'
            Title.Alignment = taCenter
            Title.Caption = 'Цена, $'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TW_SUMM'
            Title.Alignment = taCenter
            Title.Caption = 'Сумма'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_SUMMD'
            Title.Alignment = taCenter
            Title.Caption = 'Сумма, $'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'SKL_SHORT'
            Title.Alignment = taCenter
            Title.Caption = 'Склад'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REAL_KURS'
            Title.Alignment = taCenter
            Title.Caption = 'Курс'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'REALVID_NAM'
            Title.Alignment = taCenter
            Title.Caption = 'Вид документа'
            Width = 171
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REAL_OSN'
            Title.Alignment = taCenter
            Title.Caption = 'Основание'
            Width = 196
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'US_FULL'
            Title.Alignment = taCenter
            Title.Caption = 'Кто оформил'
            Width = 170
            Visible = True
          end>
      end
    end
    object TabSheet7: TTabSheet
      Caption = '7. Движение'
      ImageIndex = 6
      object Status_MOVE: TStatusBar
        Left = 0
        Top = 0
        Width = 1005
        Height = 19
        Align = alTop
        Panels = <
          item
            Text = 'Движение товара за :'
            Width = 50
          end>
        SimplePanel = False
      end
      object Panel1: TPanel
        Left = 0
        Top = 19
        Width = 1005
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label1: TLabel
          Left = 4
          Top = 8
          Width = 106
          Height = 13
          Caption = 'Начальный остаток :'
        end
        object Label2: TLabel
          Left = 412
          Top = 8
          Width = 99
          Height = 13
          Caption = 'Конечный остаток :'
        end
        object Label4: TLabel
          Left = 616
          Top = 8
          Width = 55
          Height = 13
          Caption = 'На сумму :'
        end
        object Label3: TLabel
          Left = 216
          Top = 8
          Width = 55
          Height = 13
          Caption = 'На сумму :'
        end
        object N_OST: TRxCalcEdit
          Left = 116
          Top = 4
          Width = 93
          Height = 21
          AutoSize = False
          DisplayFormat = '#0.0000'
          Enabled = False
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 0
        end
        object K_OST: TRxCalcEdit
          Left = 516
          Top = 4
          Width = 93
          Height = 21
          AutoSize = False
          DisplayFormat = '#0.0000'
          Enabled = False
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 1
        end
        object N_OST_R: TRxCalcEdit
          Left = 276
          Top = 4
          Width = 97
          Height = 21
          AutoSize = False
          DisplayFormat = ',#0.00 руб'
          Enabled = False
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 2
        end
        object K_OST_R: TRxCalcEdit
          Left = 676
          Top = 4
          Width = 97
          Height = 21
          AutoSize = False
          DisplayFormat = ',#0.00 руб'
          Enabled = False
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 3
        end
      end
      object MoveGrid: TRxDBGrid
        Left = 0
        Top = 49
        Width = 1005
        Height = 457
        Align = alClient
        DataSource = DsMove2
        PopupMenu = PopupMenu1
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = MoveGridDblClick
        OnKeyPress = MoveGridKeyPress
        OnGetCellParams = MoveGridGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'MOVE_NUM_FULL'
            Title.Alignment = taCenter
            Title.Caption = 'Номер'
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KLN_ORG'
            Title.Alignment = taCenter
            Title.Caption = 'Клиент'
            Width = 129
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SKL_SHORT'
            Title.Alignment = taCenter
            Title.Caption = 'Склад'
            Width = 98
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOVE_DATE'
            Title.Alignment = taCenter
            Title.Caption = 'Дата'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'POST_KOL'
            Title.Alignment = taCenter
            Title.Caption = 'Приход'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REAL_KOL'
            Title.Alignment = taCenter
            Title.Caption = 'Расход'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SALDO'
            Title.Alignment = taCenter
            Title.Caption = 'Текущий остаток'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_MONEY'
            Title.Alignment = taCenter
            Title.Caption = 'Цена, руб'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_MONEYD'
            Title.Alignment = taCenter
            Title.Caption = 'Цена, $'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TW_SUMM'
            Title.Alignment = taCenter
            Title.Caption = 'Сумма, руб'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_SUMMD'
            Title.Alignment = taCenter
            Title.Caption = 'Сумма, $'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'MOVE_KURS'
            Title.Alignment = taCenter
            Title.Caption = 'Курс'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'MOVEVID_NAM'
            Title.Alignment = taCenter
            Title.Caption = 'Вид документа'
            Width = 148
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOVE_OSN'
            Title.Alignment = taCenter
            Title.Caption = 'Основание'
            Width = 202
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'US_FULL'
            Title.Alignment = taCenter
            Title.Caption = 'Кто оформил'
            Width = 220
            Visible = True
          end>
      end
    end
    object TabSheet8: TTabSheet
      Caption = '8. "История" изменений товара'
      ImageIndex = 7
      object Splitter3: TSplitter
        Left = 397
        Top = 0
        Width = 3
        Height = 524
        Cursor = crHSplit
      end
      object Panel13: TPanel
        Left = 0
        Top = 0
        Width = 397
        Height = 524
        Align = alLeft
        TabOrder = 0
        object Panel15: TPanel
          Left = 1
          Top = 1
          Width = 395
          Height = 24
          Align = alTop
          BevelOuter = bvLowered
          Caption = 'Изменение данных товара'
          TabOrder = 0
        end
        object RxDBGrid7: TRxDBGrid
          Left = 1
          Top = 25
          Width = 395
          Height = 498
          Align = alClient
          DataSource = DsH
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'TM'
              Title.Alignment = taCenter
              Title.Caption = 'Когда'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'US_FULL'
              Title.Alignment = taCenter
              Title.Caption = 'Кто'
              Width = 98
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SHOP_NAME'
              Title.Alignment = taCenter
              Title.Caption = 'Где'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MESS'
              Title.Alignment = taCenter
              Title.Caption = 'Операция'
              Width = 770
              Visible = True
            end>
        end
      end
      object Panel14: TPanel
        Left = 400
        Top = 0
        Width = 541
        Height = 524
        Align = alClient
        TabOrder = 1
        object Panel16: TPanel
          Left = 1
          Top = 1
          Width = 539
          Height = 24
          Align = alTop
          BevelOuter = bvLowered
          Caption = 'Изменении огрузки и получения товара в накладных'
          TabOrder = 0
        end
        object RxDBGrid9: TRxDBGrid
          Left = 1
          Top = 25
          Width = 539
          Height = 498
          Align = alClient
          DataSource = DsH2
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'TM'
              Title.Alignment = taCenter
              Title.Caption = 'Когда'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'US_FULL'
              Title.Alignment = taCenter
              Title.Caption = 'Кто'
              Width = 98
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SHOP_NAME'
              Title.Alignment = taCenter
              Title.Caption = 'Где'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MESS'
              Title.Alignment = taCenter
              Title.Caption = 'Операция'
              Width = 770
              Visible = True
            end>
        end
      end
    end
    object TabSheet9: TTabSheet
      Caption = '9. Переоценки товара'
      ImageIndex = 8
      object StatusBar2: TStatusBar
        Left = 0
        Top = 0
        Width = 941
        Height = 19
        Align = alTop
        Panels = <
          item
            Text = 'Перечень переоценок товара'
            Width = 50
          end>
        SimplePanel = False
      end
      object REMONGrid: TRxDBGrid
        Left = 0
        Top = 19
        Width = 941
        Height = 505
        Align = alClient
        DataSource = DataModule2.Ds_REMON
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'REMON_NUM_FULL'
            Title.Alignment = taCenter
            Title.Caption = 'Номер'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REMON_DATE'
            Title.Alignment = taCenter
            Title.Caption = 'Дата'
            Width = 114
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REMON_SHOP'
            Title.Alignment = taCenter
            Title.Caption = 'Переоценка в ...'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SKL_FULL'
            Title.Alignment = taCenter
            Title.Caption = 'Склад'
            Width = 136
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_KOL'
            Title.Alignment = taCenter
            Title.Caption = 'Кол-во'
            Width = 66
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ED_SHORT'
            Title.Alignment = taCenter
            Title.Caption = 'Ед. изм.'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OLD_MONEY'
            Title.Alignment = taCenter
            Title.Caption = 'Старая цена'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NEW_MONEY'
            Title.Alignment = taCenter
            Title.Caption = 'Новая цена'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REMON_OSN'
            Title.Alignment = taCenter
            Title.Caption = 'Основание'
            Width = 236
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'US_FULL'
            Title.Alignment = taCenter
            Title.Caption = 'Кто оформил'
            Width = 158
            Visible = True
          end>
      end
    end
    object TabSheet10: TTabSheet
      Caption = '10. Товар в непроведённых накладных'
      ImageIndex = 9
      object Splitter1: TSplitter
        Left = 0
        Top = 205
        Width = 1005
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 1005
        Height = 205
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Splitter2: TSplitter
          Left = 393
          Top = 0
          Width = 3
          Height = 205
          Cursor = crHSplit
        end
        object Panel9: TPanel
          Left = 0
          Top = 0
          Width = 393
          Height = 205
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object Panel11: TPanel
            Left = 0
            Top = 0
            Width = 393
            Height = 21
            Align = alTop
            BevelOuter = bvLowered
            TabOrder = 0
            object Label33: TLabel
              Left = 12
              Top = 4
              Width = 353
              Height = 13
              Caption = '"Непроведённые" приходные накладные, содержащий данный товар'
            end
          end
          object RxDBGrid2: TRxDBGrid
            Left = 0
            Top = 21
            Width = 393
            Height = 184
            Align = alClient
            DataSource = DataModule2.DsQuery_Unprov_PN
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnGetCellParams = RxDBGrid2GetCellParams
            Columns = <
              item
                Expanded = False
                FieldName = 'KLN_PREFIX'
                Title.Alignment = taCenter
                Title.Caption = 'Фирма'
                Width = 43
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PN_NUM_FULL'
                Title.Alignment = taCenter
                Title.Caption = 'Номер'
                Width = 121
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'KLN_ORG'
                Title.Alignment = taCenter
                Title.Caption = 'Поставщик'
                Width = 137
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PN_DATE'
                Title.Alignment = taCenter
                Title.Caption = 'Дата'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PN_DATE_OPL'
                Title.Alignment = taCenter
                Title.Caption = 'Дата оплаты'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TW_KOL'
                Title.Alignment = taCenter
                Title.Caption = 'Кол-во'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TW_MONEY'
                Title.Alignment = taCenter
                Title.Caption = 'Цена'
                Width = 89
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TW_MONEYD'
                Title.Alignment = taCenter
                Title.Caption = 'Цена, $'
                Width = 78
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TW_MONEY_S'
                Title.Alignment = taCenter
                Title.Caption = 'Себестоимость'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TW_SUMM'
                Title.Caption = 'Сумма'
                Width = 79
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TW_SUMMD'
                Title.Alignment = taCenter
                Title.Caption = 'Сумма, $'
                Width = 81
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TW_SUMM_S'
                Title.Caption = 'Сумма себест.'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SKL_SHORT'
                Title.Alignment = taCenter
                Title.Caption = 'Склад разгрузки'
                Width = 165
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OWNER_FULL'
                Title.Alignment = taCenter
                Title.Caption = '"Владелец" накладной'
                Width = 158
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PN_KURS'
                Title.Alignment = taCenter
                Title.Caption = 'Курс'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PNVID_NAM'
                Title.Alignment = taCenter
                Title.Caption = 'Вид накладной'
                Width = 64
                Visible = True
              end>
          end
        end
        object Panel10: TPanel
          Left = 396
          Top = 0
          Width = 609
          Height = 205
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Panel12: TPanel
            Left = 0
            Top = 0
            Width = 609
            Height = 21
            Align = alTop
            BevelOuter = bvLowered
            TabOrder = 0
            object Label34: TLabel
              Left = 12
              Top = 4
              Width = 353
              Height = 13
              Caption = '"Непроведённые" расходные накладные, содержащий данный товар'
            end
          end
          object RxDBGrid3: TRxDBGrid
            Left = 0
            Top = 21
            Width = 609
            Height = 184
            Align = alClient
            DataSource = DataModule2.DsQuery_Unprov_RN
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnGetCellParams = RxDBGrid3GetCellParams
            Columns = <
              item
                Expanded = False
                FieldName = 'KLN_PREFIX'
                Title.Alignment = taCenter
                Title.Caption = 'Фирма'
                Width = 46
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'REAL_NUM_FULL'
                Title.Alignment = taCenter
                Title.Caption = 'Номер'
                Width = 118
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'KLN_ORG'
                Title.Alignment = taCenter
                Title.Caption = 'Клиент'
                Width = 147
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'REAL_DATE'
                Title.Alignment = taCenter
                Title.Caption = 'Дата'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TW_KOL'
                Title.Alignment = taCenter
                Title.Caption = 'Кол-во'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TW_MONEY'
                Title.Alignment = taCenter
                Title.Caption = 'Цена'
                Width = 71
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TW_MONEYD'
                Title.Alignment = taCenter
                Title.Caption = 'Цена, $'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TW_SUMM'
                Title.Alignment = taCenter
                Title.Caption = 'Сумма'
                Width = 71
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TW_SUMMD'
                Title.Alignment = taCenter
                Title.Caption = 'Сумма, $'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SKL_SHORT'
                Title.Alignment = taCenter
                Title.Caption = 'Склад'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'REAL_KURS'
                Title.Alignment = taCenter
                Title.Caption = 'Курс'
                Width = 83
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'REALVID_NAM'
                Title.Alignment = taCenter
                Title.Caption = 'Вид документа'
                Width = 171
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'REAL_OSN'
                Title.Alignment = taCenter
                Title.Caption = 'Основание'
                Width = 196
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'US_FULL'
                Title.Alignment = taCenter
                Title.Caption = 'Кто оформил'
                Width = 170
                Visible = True
              end>
          end
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 208
        Width = 1005
        Height = 298
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 1005
          Height = 21
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 0
          object Label35: TLabel
            Left = 12
            Top = 4
            Width = 369
            Height = 13
            Caption = '"Непроведённые" накладные перемещения, содержащий данный товар'
          end
        end
        object RxDBGrid1: TRxDBGrid
          Left = 0
          Top = 21
          Width = 1005
          Height = 277
          Align = alClient
          DataSource = DataModule2.DsQuery_Unprov_PER
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
              FieldName = 'PER_NUM_FULL'
              Title.Alignment = taCenter
              Title.Caption = 'Номер'
              Width = 113
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PER_DATE'
              Title.Alignment = taCenter
              Title.Caption = 'Дата'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SKL_FROM'
              Title.Alignment = taCenter
              Title.Caption = 'Склад отправитель'
              Width = 153
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SKL_TO'
              Title.Alignment = taCenter
              Title.Caption = 'Склад-получатель'
              Width = 154
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TW_KOL'
              Title.Alignment = taCenter
              Title.Caption = 'Кол-во'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PER_OSN'
              Title.Alignment = taCenter
              Title.Caption = 'Основание'
              Width = 221
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'US_FULL'
              Title.Alignment = taCenter
              Title.Caption = 'Кто оформил'
              Width = 159
              Visible = True
            end>
        end
      end
    end
    object tw_zone_distrib: TTabSheet
      Caption = 'Зоны товара'
      ImageIndex = 10
      OnShow = tw_zone_distribShow
      object RxDBGrid11: TRxDBGrid
        Left = 0
        Top = 0
        Width = 345
        Height = 209
        DataSource = ds_tw_zone_distrib
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
            FieldName = 'ZONE_NAME'
            Title.Caption = 'Зона'
            Width = 165
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_OST'
            Title.Caption = 'Остаток'
            Width = 98
            Visible = True
          end>
      end
    end
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 60
    Top = 311
  end
  object QrSKL: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select skl_id,skl_full from skl where skl_speed>0'
      'order by skl_speed')
    Left = 204
    Top = 303
  end
  object DsSKL: TDataSource
    DataSet = QrSKL
    Left = 204
    Top = 355
  end
  object TwMon: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'TWMON_ID'
        DataType = ftInteger
      end
      item
        Name = 'TW_KOL'
        DataType = ftFloat
      end
      item
        Name = 'TW_MONEY'
        DataType = ftFloat
      end>
    OnCalcFields = TwMonCalcFields
    Left = 261
    Top = 304
    object TwMonTWMON_ID: TIntegerField
      FieldName = 'TWMON_ID'
    end
    object TwMonTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      DisplayFormat = '#0.0000'
    end
    object TwMonTW_MONEY: TFloatField
      FieldName = 'TW_MONEY'
    end
    object TwMonTW_MONEY2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TW_MONEY2'
      DisplayFormat = ',#0.00 руб'
      Calculated = True
    end
    object TwMonSKID_PERCENT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SKID_PERCENT'
      DisplayFormat = '#0.000%'
      Calculated = True
    end
  end
  object DsTwMon: TDataSource
    DataSet = TwMon
    Left = 261
    Top = 356
  end
  object PipRemon: TppDBPipeline
    DataSource = DataModule2.Ds_REMON
    UserName = 'PipRemon'
    Left = 366
    Top = 309
    object PipRemonppField1: TppField
      FieldAlias = 'REMON_NUM_FULL'
      FieldName = 'REMON_NUM_FULL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PipRemonppField2: TppField
      FieldAlias = 'REMON_DATE'
      FieldName = 'REMON_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PipRemonppField3: TppField
      FieldAlias = 'SKL_FULL'
      FieldName = 'SKL_FULL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PipRemonppField4: TppField
      FieldAlias = 'TW_KOL'
      FieldName = 'TW_KOL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PipRemonppField5: TppField
      FieldAlias = 'ED_SHORT'
      FieldName = 'ED_SHORT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PipRemonppField6: TppField
      FieldAlias = 'OL_MONEY'
      FieldName = 'OL_MONEY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PipRemonppField7: TppField
      FieldAlias = 'NEW_MONEY'
      FieldName = 'NEW_MONEY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PipRemonppField8: TppField
      FieldAlias = 'REMON_OSN'
      FieldName = 'REMON_OSN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PipRemonppField9: TppField
      FieldAlias = 'US_FULL'
      FieldName = 'US_FULL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object PpRemon: TppReport
    AutoStop = False
    DataPipeline = PipRemon
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Подробно о товаре. Перечень преоценок'
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    UserName = 'Report'
    DeviceType = 'Screen'
    OnPreviewFormCreate = PpRemonPreviewFormCreate
    Left = 368
    Top = 361
    Version = '5.0'
    mmColumnWidth = 0
    object ppTitleBand1: TppTitleBand
      BeforeGenerate = ppTitleBand1BeforeGenerate
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 15081
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Alignment = taRightJustify
        Caption = 'Подробно о товаре :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 31221
        BandType = 1
      end
      object Remon_title1: TppMemo
        UserName = 'Remon_title1'
        Alignment = taRightJustify
        Caption = 'Remon_title1'
        CharWrap = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 8996
        mmLeft = 31485
        mmTop = 0
        mmWidth = 98161
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 5556
        mmLeft = 0
        mmTop = 9525
        mmWidth = 202671
        BandType = 1
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = '№ акта'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 10319
        mmWidth = 10848
        BandType = 1
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Дата'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 23019
        mmTop = 10319
        mmWidth = 7408
        BandType = 1
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Склад'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 39423
        mmTop = 10319
        mmWidth = 9790
        BandType = 1
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Остаток'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 69056
        mmTop = 10319
        mmWidth = 12171
        BandType = 1
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Ед.'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 83609
        mmTop = 10319
        mmWidth = 4763
        BandType = 1
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Старая цена'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 93134
        mmTop = 10319
        mmWidth = 19050
        BandType = 1
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Новая цена'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 115094
        mmTop = 10319
        mmWidth = 17727
        BandType = 1
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Основание'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 133350
        mmTop = 10319
        mmWidth = 17198
        BandType = 1
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Кто оформил'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 171715
        mmTop = 10319
        mmWidth = 20373
        BandType = 1
      end
      object ppLabel119: TppLabel
        UserName = 'Label119'
        Caption = 'Дата/время :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 133879
        mmTop = 0
        mmWidth = 15081
        BandType = 1
      end
      object ppSystemVariable52: TppSystemVariable
        UserName = 'SystemVariable52'
        VarType = vtPrintDateTime
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 150284
        mmTop = 0
        mmWidth = 22490
        BandType = 1
      end
      object ppLabel621: TppLabel
        UserName = 'Label621'
        Caption = 'Страница :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 136790
        mmTop = 3175
        mmWidth = 12435
        BandType = 1
      end
      object ppSystemVariable54: TppSystemVariable
        UserName = 'SystemVariable54'
        VarType = vtPageNo
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 150284
        mmTop = 3440
        mmWidth = 1323
        BandType = 1
      end
      object ppLabel620: TppLabel
        UserName = 'Label620'
        Caption = 'из'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 153459
        mmTop = 3440
        mmWidth = 2646
        BandType = 1
      end
      object ppSystemVariable53: TppSystemVariable
        UserName = 'SystemVariable53'
        VarType = vtPageCount
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 157163
        mmTop = 3440
        mmWidth = 1323
        BandType = 1
      end
      object PpRemonUser: TppLabel
        UserName = 'PpRnUser5'
        Caption = 'PpRnUser'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 150284
        mmTop = 6085
        mmWidth = 12171
        BandType = 1
      end
      object ppLabel622: TppLabel
        UserName = 'Label622'
        Caption = 'Пользователь :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 131234
        mmTop = 5821
        mmWidth = 17727
        BandType = 1
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 7673
        mmLeft = 179917
        mmTop = 0
        mmWidth = 22754
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      PrintOnFirstPage = False
      mmBottomOffset = 0
      mmHeight = 14552
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 5556
        mmLeft = 0
        mmTop = 8996
        mmWidth = 202671
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Alignment = taRightJustify
        Caption = 'Подробно о товаре :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 0
        mmWidth = 25665
        BandType = 0
      end
      object Remon_title2: TppMemo
        UserName = 'Remon_title2'
        Alignment = taRightJustify
        Caption = 'Remon_title1'
        CharWrap = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 8467
        mmLeft = 25929
        mmTop = 0
        mmWidth = 105569
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = '№ акта'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 794
        mmTop = 9790
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Дата'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 22754
        mmTop = 9790
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Склад'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 39158
        mmTop = 9790
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Остаток'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 68792
        mmTop = 9790
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Ед.'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 83344
        mmTop = 9790
        mmWidth = 4763
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Старая цена'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 92869
        mmTop = 9790
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Новая цена'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 114829
        mmTop = 9790
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label101'
        Caption = 'Основание'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 133086
        mmTop = 9790
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Кто оформил'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 171450
        mmTop = 9790
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Дата/время :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 135467
        mmTop = 0
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Страница :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 138377
        mmTop = 2910
        mmWidth = 12435
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPrintDateTime
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 151871
        mmTop = 0
        mmWidth = 22490
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageNo
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 151871
        mmTop = 3175
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label6201'
        Caption = 'из'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 155046
        mmTop = 3175
        mmWidth = 2646
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageCount
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 158750
        mmTop = 3175
        mmWidth = 1323
        BandType = 0
      end
      object PpRemonUser2: TppLabel
        UserName = 'PpRemonUser2'
        Caption = 'PpRnUser'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 151871
        mmTop = 5821
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Пользователь :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 132821
        mmTop = 5556
        mmWidth = 17727
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'REMON_NUM_FULL'
        DataPipeline = PipRemon
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'REMON_DATE'
        DataPipeline = PipRemon
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 23548
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'SKL_FULL'
        DataPipeline = PipRemon
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 39688
        mmTop = 0
        mmWidth = 24871
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        Alignment = taRightJustify
        DataField = 'TW_KOL'
        DataPipeline = PipRemon
        DisplayFormat = '#0.0000'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 65088
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        Alignment = taCenter
        DataField = 'ED_SHORT'
        DataPipeline = PipRemon
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 82550
        mmTop = 0
        mmWidth = 7408
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        Alignment = taRightJustify
        DataField = 'OL_MONEY'
        DataPipeline = PipRemon
        DisplayFormat = '#0.00 руб'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 90488
        mmTop = 0
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        Alignment = taRightJustify
        DataField = 'NEW_MONEY'
        DataPipeline = PipRemon
        DisplayFormat = '#0.00 руб'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 111654
        mmTop = 0
        mmWidth = 20902
        BandType = 4
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'REMON_OSN'
        DataPipeline = PipRemon
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 133086
        mmTop = 0
        mmWidth = 39688
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'DBMemo3'
        CharWrap = False
        DataField = 'US_FULL'
        DataPipeline = PipRemon
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 173302
        mmTop = 0
        mmWidth = 29369
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 202671
        BandType = 7
      end
      object ppImage2: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = True
        Stretch = True
        Picture.Data = {
          07544269746D617066490000424D664900000000000036010000280000004F01
          0000370000000100080000000000304800000000000000000000400000004000
          0000000000000000800000800000008080008000000080008000808000008080
          8000040404008484840044444400C4C4C40024242400A4A4A40064646400E4E4
          E400141414009494940054545400D4D4D40034343400B4B4B40074747400F4F4
          F4000C0C0C008C8C8C004C4C4C00CCCCCC002C2C2C00ACACAC006C6C6C00ECEC
          EC001C1C1C009C9C9C005C5C5C00DCDCDC003C3C3C00BCBCBC007C7C7C00FCFC
          FC00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272723231F27132727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727270B0B250D272727272727272727272727272727272727272727
          272727272727272727272727272727271F250B15272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2700272727270A0A0A0A0A0A0A0A1A1A1A1A1A1A1A1A0A1A1A1A121A190E0D27
          232727272727272727272727261A1A1A1A1A1A1A1A1A121A121212121212121A
          1A1A1A1A1A1A1A0A1A0A0A0A0A0A1A1127272727272727272727272727272727
          272713220C20201C242414141C0C0C20101C272727272727272727272727271D
          1A1A1212121A1A1A1A1A1A1A1A1A0A24240A1A0A1A1C0A121212221222121212
          121212121A2627272727272727272727272727272727121A220E262727271B22
          121212121212121212121A1A1A12122727272727272727272727272727272727
          24161E1A272727272712121212122222222222221212121212121A1A1A1A1A0A
          1A1A1A1A1A1A1A0A141C0C2027270A0E22220E22222222121222121212121212
          1A1A0A0A0A0D27272727272714141C0C0C200C200C0C200C0C0C202727272727
          27272727272727272727272727272727270027272727201C1C0C1414141C1414
          14240A1A0A0A0A0A24141C1C240C0C0C2010182627272727272727271C1C1414
          1414141414242424240A24240A1216161626092626161E0E221212122222141E
          27272727272727272727272727272727120C2421230B1D090919261E0E1E2611
          0916140C1012172727272727272727261A122226110909090926161E0E0E1E16
          19212111191C241E1E220E19110D1D150D110926161427272727272727272727
          27272727270B261616222627272725221E26151B0B2515151D21191111211E27
          2727272727272727272727272727271419121A1A27272727270A21131B0B0B0B
          251D0D0D1D1D250B1B1B1B252525251515151D21210D1D15150B1B2027270C09
          1F1F0F231B1B1B1B0F1F17170F2313131B2525151419272727272727220D2121
          0D25231B1F0B0D1D151D0C272727272727272727272727272727272727272727
          2700272727270C1A2020202020202020202020200C0C1C140C0C201C1C0E1919
          1E1E141010101727272727271C2420202020200C0C0C0C1C241C0C0C14241414
          14141A1E11111111191622121A1A1A1A2727272727272727272727272727250C
          092624121121110D1D1525250D111119261622220D220C200E17272727272726
          140C0C1C1C140A221E0919260E2212221E2626161E0C1C0A222616160921160E
          220E12121E1427272727272727272727272727270F22261E1A221E2727271514
          0E1E1926121222121222221E2619122727272727272727272727272727271A09
          0E220A1A2727272727101212221E1E1E161609190D15150D111919191111191E
          121A0A1A0A0A0A1A1A1A110C15270C14122222221E2619191111211919262616
          161619252419272727272714122424240A0A161A221909161E250C2727272727
          272727272727272727272727272727272700272727270C240C0C202020202020
          202020202024141C242020200C1C2014221E1E111A0C201C272727270C140C0C
          202020200C0C1C0C0C0C0C14200C0A1E11111A1C14241A0E16221A0A0A0A2424
          272727272727272727272727271C1E0D12120916091527271B2327232527271B
          0909090D1D0D161D14140A2727272716140E192123190E1A0A1A1A121212220E
          0E26091612221C0A160916151B130F1F0F261626221C27272727272727272727
          272727271419190922120E2727270D0C12112127272727272727271B1B1D0927
          272727272727272727272727272316261A1C0A0A2727272727101E2621091725
          25250D110916160E22221E0911161E0E120E1E121A1A1A2222120D0C16270C1C
          19251125272727272727271F0D26221216261926091927272727261C24141C14
          14140A1A2209090E09260E272727272727272727272727272727272727272727
          2700272727272222241C0C1010101010101020200C0C0D0F09240C141420200C
          240A201C221624202427272712220A140C1020200C20200C0C140C1411221F27
          2727170F260A0D0B1E1C1C141412240A27272727272727272727270D121D1A22
          220C2221230E2727151E221A1A0A0E1A1A240A0A0A0E2125131A242727272726
          16221224141424260A0A1A122222221A0E270E1A1A141E221A240A0A220B1723
          26270D161E0A2727272727272727272727272724251909092212122727270D26
          161E1212110B1F1B25170D27111E0E27272727272727272727272727271E1626
          0A1C1A242727272727091D111526221B0E26111D25251D091611162727272727
          272709260E161511221A1A1414270C0B251B2727161F0B150D0D2111260E1211
          27172715261127272727120E241C1C140A241A0E110E22261F0D0E2727272727
          2727272727272727272727272727272727002727272727271327130810101010
          202020200C142427240C1C1020141C20200C190A0C22161E0C0C27271F131323
          1F20100C20200C200C0C141A112712240A0A0A14141C0C142127111A1A121A1A
          0F272727272727272727241E091624240C09151B09272626250F130F23261C18
          0A14241A0A0A0E11091A24272727271F2323230F1C141D1D12121A0A12091519
          1921270F0F1F2713131C2012241E1A0B251D1F0F0F0F27272727272727272727
          2727091D1922161E22121A2727272727231709201C2626262125221B1F1F1F27
          272727272727272727272727240E091612241A1427272727270F0F1F0F091024
          22220E1E0E120A0A1E220E1612121226221E0D172712241E0E0A0A1220272727
          2323131C1409220E1E0E12121211251419272317272727272724121424141C1C
          242422161E0A1D241D2727272727272727272727272727272727272727272727
          2700272727272727272727101C0C1020202020200C1C0A122727272518100C1C
          10200A2124240A1A220C2227272727272726201C200C0C0C0C0C0C1A0A222727
          2727272727231620200C271D1A141E0A0D272727272727272724261216141C0C
          121D231E270D1F272727272727270B0C210A24140A1A0A0A1612142727272727
          272727270F0C211522121A1A2219151E14272727272727272727080C0C1A241E
          1A272727272727272727272727272727271716260916121A0E120A2727272727
          27272721100A1A0A22191327272727272727272727272727272727140E161A12
          0E0E1A142727272727272727272718140E1E2609090E221E110A262727272727
          27270D14221B19140E0A0A1E2027272727272716201A121E26160E0E220D0D1C
          2727272727272727121C121E0A24141C240A0E16121E24272727272727272727
          272727272727272727272727272727272700272727272727272727201C0C1020
          101020200C0C1A24272727272718201C10202426120A1A0A0A12142727272727
          27191C142020200C1C0C0A240A0A2727272727272727272721182017151C0A24
          1E27272727272727241D220E140C0C0C1523242723272727272727272727250C
          13111A240A1A0A14242224272727272727272727270C1A26121A0A0A0A0A0A1A
          1427272727272727272720201C091A241E272727272727272727272727272727
          171A09272321222412120A27272727272727272710140A1A1E14272727272727
          27272727272727272727191E090A24241E260A1427272727272727272727180C
          2212220E0E1A24241E1416272727272727272727171C141214220A2220272727
          2727271D201A220E1E0E240A0A220D0C27272727272727271A0E26111A0A2412
          0A140E091A0E2527272727272727272727272727272727272727272727272727
          27002727272727272727271C140C1010202020201C1C0A14272727272727181C
          14201C161A14141A1A161C0A2727272727191C1C202020201C201A0A1A242727
          272727272727272727271820270E0A140A2727272727270E091A0E1C201A0C0A
          1309111927272727272727272727150C171D260E221A0A0A0A1E242727272727
          27272727170C0C0A2414240A0A1A0A121C2727272727272727270C200C260A24
          222727272727272727272727272727271C152727170B0D09161A0A2727272727
          27272727181C0E120E1C272727272727272727272727272727270E161E121A12
          16160A1C27272727272727272727180C14240A1222120A0A1A140E2727272727
          2727272727270C1A0E2422220C2727272727271510140E1E09090E0A0A1A120C
          272727272727272222110909120A0A220A1416121D1227272727272727272727
          2727272727272727272727272727272727002727272727272727271C1C0C1020
          101020201C0C2414272727272727201024200C24121414240A1A0A1427272727
          2719200C202020201C2014121A24272727271B1B1B1B15272727271812132624
          1427272727271516221E0A20140C1C0D1B1A1D2727272727272727272727150C
          170F2119091919190E0924272727272727272727170C1C0E141414240A1A1A0E
          1C2727272727272727270C0C0C21090A1E272727272727272727272727272712
          1B1B271F131313230F1A24272727272727272727180C1D09261C272727272727
          272727272727272727121E0B0D19091921090A1C27272727272727272727180C
          12221E191119221A0A14222727270F1B1B1B1B272727271C1A1D1A121C1B2727
          2727270F1014111111091119261E0A0C27272727272724142113150D220A121A
          1216240914272727272727272727272727272727272727272727272727272727
          27002727272727272727271C141C1010202020201C0C24142727272727271120
          242020140E1111090916220A152727272709201C0C100C200C201C0E1A242727
          27271C0A1214122727272716102717221427272727270C160E120C1A240C2123
          1B22262727272727272727272727152027170F0F1B1D11191911242727272727
          272727271F0C141E141C14240A1212121C2727272727272727270C20241F250A
          1E272727272727272727272727271311121D2111091919210B12242727272727
          2727272718142717261C27272727272727272727272727271C0E1B1B1B130F0F
          0F250A1C27272727272727272727080C150D1D1D150D21191E14122727271612
          191610272727271C0C1A2422140927272727270F100A2317170D0E0E1E260E0C
          27272727271F240D090E19111E1E120A161A121A232727272727272727272727
          2727272727272727272727272727272727002727272727272727270C14242020
          101020201C0C24242727272727271F201C0C1426132727272323122426272727
          2709100A1C20200C1C0C14090A24272727171C220E1C1A2727272727181F2709
          14272727270E120A1E1C24120C16230F1E221327272727272727272727271520
          272727272727271B1611242727272727272727271F0C0C0E1E261E1626092612
          142727272727272727270C0C19270F241E272727272727272727272727270E0E
          1521110909091919111A24272727272727272727182427270D1C272727272727
          27272727272727121E1E0926190D1B1727271A1C27272727272727272727180C
          2727272715190909151412272727141A241D10272727272710140B090A0A2727
          2727271F100E272727271E2412160E0C27272727270E0E1D15262222240A2212
          221A151E27272727272727272727272727272727272727272727272727272727
          27002727272727272727270C141A201010202020140C140A2727272727271320
          0A121D27272727272727091A1E2727272719201A0C1C0C0C24201A110A0A2727
          27211422260A1A272727272726260F0E2427272727200A1E121416190A0B2313
          261A272727272727272727272727152027272727272727272726142727272727
          272727271F0C1A21230F1B15151D1E1A142727272727272727270C200F272724
          0E27272727272727272727271714211D0D212121210D250B1B1A242727272727
          27272727181A27270F14272727272727272727272727131E1209190909191121
          15271A1C27272727272727272727181C2727272727252609191412272727200A
          111E1027272727270E0C0A1F110C27272727271710221727272727271D111A1C
          2727272724242121191116220A240A0922151427272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1C221020
          202020201A1C240A2727272727270F0C1E1E2727272727272727170B16272727
          27192022200A0A14220C11150A0A2727271A1215211A1A2727272727270C2722
          141D272722140A0E1A1226150B0F131B230A2727272727272727272727271D20
          27272727272727272719142727272727272727271F0C1B272727272727272722
          242727272727272727270C202727270A0E27272727272727272727271C1B111B
          0F171F1F0B1B1D0D0D1A14272727272727272727181E27272714272727272727
          2727272727271E220D0D0D250B0B0B1B1D21121C27272727272727272727080C
          2727272727272719261412272727181C0E1E1027272727272710222323202727
          27272717100E172727272727270D121C2727270D24161626262619190B1D0D1D
          09141F2727272727272727272727272727272727272727272727272727272727
          27002727272727272727270C1C0E20202020200C1624140A2727272727271524
          271D2727272727272727151D212727272709200E201C161E211C15231A0A2727
          271C0E2713220A2727272727270C12241C26272710241E1A0A1611220F17130F
          23262727272727272727272727271514272727272727272727211C2727272727
          272727271F0C27272727272727272719142727272727272727270C0C27272724
          0E27272727272727272727090B1D272723250D11090909092612142727272727
          2727272718192727271C272727272727272727271724161F0F0B250D21211921
          1325121C27272727272727272727181C272727272727271F1924122727270C1E
          09222027272727272720210A1D2427272727271710212727272727272727161C
          2727270E22150D0D1523130B1327272719112727272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1C222020
          2010200C090A140A2727272727270E0A27272727272727272727261E1B272727
          2709200E0C141E19270A13230A0A272727100E2727220A2727272727270A121A
          140A272720241224121927111F232313151D272727272727271D0F2327210C1A
          27272727170F1B1D21210C20210B1B13272727271F0C27272727272727272715
          142727272727272727271C20272727240E27272727272727272717111D272727
          272727231B0B1D11191214272727272727272727182127272714272727272727
          272727271C090D1109090926262626261113121C272727272727272727271814
          27272727272727272724122727151227250A20272727272727261A13231D2727
          27272717101B2727272727272727231C27270A142727272727272727271F2715
          2427272727272727272727272727272727272727272727272727272727272727
          27002727272727272727270C140E20201020200C1112240A2727272727271C1A
          1527272727272727270E1E1E272727272709201E1A24121627211713140A2727
          0D240B2727220A272727272727131717171F27250C1A1A1C2226270D1F232323
          2627272727272727271C140A241E191212120E0E0E162609262624261A0A240A
          272727271F0C27272727272727272727142727272727272727271C1C2727270A
          0E272727272727272727220B2727272727272727272727272712142727272727
          27272727100D2727271427272727272727272711091727271723232521190909
          11210A1C272727272727272727271824272727272727272727241227271C1227
          0F0E202727272727272723131B1B27272727271710232727272727272727171C
          2709242727272727272727272727271427272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1C0E2020
          20202020260E0A0A272727272715121727272727272727270D11271B27272727
          27090C160A141C14271727270A0A27151E15272727160A272727272727272727
          272727141A1E141C2616270D0F230F230A27272727272727271C0D2727272727
          27272727272727272727272727272724272727271F1C27272727272727272727
          142727272727272727271C1A272727220E27272727272727270C272727272727
          2727272727272727270A24272727272727272727100D27272724272727272727
          27271419272727272727272727271B192127241C27272727272727272727101A
          2727272727272727270A22270E14272727272027272727272727272727272727
          2727271F101327272727272727271B120E24170F1B150D0B2727272727271427
          2727272727272727272727272727272727272727272727272727272727272727
          2700272727272727272727201C1E2020202020200E1E0A0A27271727160C2711
          2727272727272727272719272727272727090C1E0A140C0C111527270E0E241C
          1F27272727190A2727272727272727272727272012120C0C1E092311230F1F13
          1427272727272727271C14220E16111119211D150B0B231F0F0B25150B151224
          272727271F1C27272727272727272727142727272727272727271C0A2727270E
          1E27272727272727162327272727272727272727231527272724142727272727
          27272727182127272724272727272727272519272727272727272727271D090A
          09130A1C27272727272727272727181227272727272727272712140C1E211F27
          272720272727272727272727272727272727271F1013272727272727270B211D
          261B0B0D191E1E191D27272727240F2727272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1A0E2020
          202020201A220C180C20200C0E0F272727272727272719272713272727272727
          2719141E24140C0C160927271E0C0D271727272727190A272727272727272727
          272727101A12200C22192109230F1F131427272727272727270E2222220E0E0E
          22121A1A1A1A221E0E0E22121A121A0A272727271F2427272727272727272727
          142727272727272727271C0A2727270E1E272727272727131D1F272727272727
          27270B1121141D2717141427272727272727272710192727270A272727272727
          27262727272727272727271509261A0E1E191A1C272727272727272727270822
          2727272727272727270D272725231F0F231F2027272727272727272727272727
          2727271F201B27272727271F211E16111A261E121A0A121E21131F0F0A242727
          2727272727272727272727272727272727272727272727272727272727272727
          270027272727272727272720120E20101010202020241C202226162717132727
          27272727251D2723152727272727272727110A1E240A220E1E1E232627272727
          27272727270F0A272727272727272727272727101A0A200C1A0926260F0F0F15
          1427272727272727272727272727272727272727272727272727272727272727
          2727272717122727272727272727271F142727272727272727271C1A27272716
          1E2727272727130E27272727272727170B0D1121260C091D0914142727272727
          27272727101E2727271A27272727271F1A23272727272727270D09262616231E
          1A1A221C272727272727272727271822272727272727272727272727130D261E
          0E211A272727272727272727272727272727271F1C1527272727270B26121A0E
          0A0A0A1A241A12260D230F232719141027272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727272012221010
          2014241A221E1A24190A11272727272727272716270D22252727272727272727
          27110A22241A0E22151E271F112523272727272727131A272727272727272727
          272727201424200C240E0E26130F0F151C272727272727272727272727272727
          27272727272727272727272727272727272727271F12272727272727270F2525
          14272727272727272727141A272727090E272727271F1C27272727270F0B250B
          2525151D271C16160A0A2427272727272727272710122727271A272727272714
          15272727170B11091E16262626092026141C161C27272727272727272727081A
          27272727232509161E1E0E22221212121A091627272727272727272727272727
          2727271F14191F1D261E0E0A141414220E26112224141414142426130B27270E
          1A13272727272727272727272727272727272727272727272727272727272727
          27002727272727272727272012122020100C1C0A0A2414202220241F27272727
          2727170F1C1C1927272727272727272727110A1A0A120E22250E1F151B232116
          16110B2727130A2727272727272727272727270C0C0A0C0C0C12121123230F1D
          1427272727272727272727272727272727272727272727272727272727272727
          2727272717122727272727272723211D142727272727272727271C2427272711
          1E272727271C272727271713251525230F231B271614220A1C1A242727272727
          27272727101A2727271A272727271F1D2727271D0E0A0A221E162626221E1826
          0C1C091C2727272727272727272708242727270F0B1D16222212270B1E0A0A0A
          240919272727272727272727272727272727271F1C26271F0B2121111111240E
          2727272727272721220A1C1C090B2327191C2727272727272727272727272727
          2727272727272727272727272727272727002727272727272727272012122020
          20200C201A1C171C0C1422240E0A1E15172713130F0E0C182727272727272727
          270D0A0A240C20201214252619140C201A16092527250A272727272727272727
          2727271A2012200C201A1A261313131514272727272727272727272727272727
          2727272727272727272727272727272727272727171A272727272727271F1D15
          242727272727272727271C14272727150E272727190F1F272727231B25150B0F
          1F13270B121C0A1C1C1624272727272727272727101A27270F1A2727271F1C27
          2725161A2414141A1E1626160B23180E1C1C211C27272727272727272727181C
          27272717171F1B21191C1A26270B192224091E27272727272727272727272727
          2727271F142225150D1926091911241A171B0B21121621271B260E241C091B27
          27220C2727272727272727272727272727272727272727272727272727272727
          27002727272727272727270C121A1020101020201A1C1D14121C0C2020121116
          21172727131B0D0C1C27272727272727271D24240A202020120C160E190A1F20
          101216090D0D0A2727272727272727272727270E200E0C0C2014120E0B25151D
          1427272727272727272727272727272727272727272727272727272727272727
          272727271712171F132727270F1F0B2514272727272727272727141C2727270B
          1E272713090F0F0F230F0B1D0D211D1B232721271A140A0C1415242727272727
          27272727101A27270B1A272727242315211916221A0A0A12161619271B271812
          1C0C211C27272727272727272727180C131511191D251D19111C221E141E0E24
          1C090A272727272727272727272727272727271F1C1A2111260E120E16262414
          272727272727140A2719091A1C140B132727240A272727272727272727272727
          27272727272727272727272727272727270027272727272727272720220A1020
          1010200C121C261A2727271518101C191E260D1B0F2325250C0E272727272727
          270D2424240C202012201A1A262427270820161E16110A272727272727272727
          272727152016200C201C1A221921110D14272727272727272727272727272727
          27272727272727272727272727272727272727271712190919251B1D0D0B0B0D
          14272727272727272727140C2717171B1E271F14271B1B1B1B1519090909111D
          270B1F271224120C141514272727272727272727100A17271D1A272721212121
          0D2111260E1A1A12160927152727181A1C0C1D1C27272727272727272727180C
          21090E2216261E12161C0E270E0C12241C091427272727272727272727272727
          2727271F1C240926262214142424241C27272727272727202409160E1214250F
          270F0D0C27272727272727272727272727272727272727272727272727272727
          2700272727272727272727200E14102010102020121C0E1A272727272710100A
          091E1E161E152521141427272727272727112414141C20201A20140A1E242727
          112022161E111A27272727272727272727272727101A240C20201A1E22220E16
          141D27272727272727272727272727272727272727270B220E0E262727272727
          2727272717120A1A1A220E221E190D2614272727272727272727140C23151513
          1E270C27231B2511261E1E161626090B272527271A0A120C2425242727272727
          27272727100A0D1F211A27251E1511210D0D2126162212121E2321272727180A
          1C0C0B1427272727272727272727180C0E120A1A1E260E1A0E240E2727182412
          1C090C272727272727272727272727272727271F1414220E161E141C141C1214
          272727272727271F20262609260E260F1F171F21212727272727272727272727
          272727272727272727272727272727272700272727272727272727200E0C1020
          102020201214220A272727272727181C11221A0A2422190909141A2727272727
          2719241C1C140C201A201C241624272727180A0E0E091A272727210C0C202227
          27272727100C121C0C201A0E24140A1A141E2727272727272727272727272727
          2727272727270A1927211A27272727272727272717121C1C141414140A0E2622
          14272727272727272727140C190E26130E12271325090E1A0A1A220E0E1E2627
          25272727120A221C241B2427272727272727272718240E1D191A0F140F092609
          11212119260E22221B1117272727180A1C0C1B1427272727272727272727181C
          0A24240A1E092612220A0E2727241C1C14261C272727270C1C0C141F27272727
          2727271F141C0A121E1E24141C140E1A2727272727272727180E192616121613
          0F0D17231C272727272727272727272727272727272727272727272727272727
          270027272727272727272720220C10102020202012140E0A2727272727271420
          220A1C0C0C1C1414241A1C27272727272719241C0C240C0C0A200C1C260A2727
          27100C1A1A211A272727241527221A27272727271E0C0E240C201A241A1C1C24
          0A1C27272727272727272727272727272727272727270C272222242727272727
          27272727171A0C0C0C0C0C0C1C0A1E1A1427272727272727272714201A1A1A23
          0E271D1922241414241A22220E1E271127272727220A0E1C2413242727272727
          2727272718141A16161A0C271E22221E0911211109160E0B171B27272727180A
          1C0C1D1427272727272727272727181C1424240A1619091E2212222727230C0C
          141E0A27272727121B270C1F2727272727272717241C140A0E1E0A1414142622
          272727272727272718121116160E220D0F1227150C2727272727272727272711
          1C1615130D190A141F2727272727272727002727272727272727272012201010
          101020201A141E0A2727272727271D10141C2020202020202011242727272727
          2709240C200A1C200A0C200C192427272712201424150A272727102709141A27
          27272727270C0A0A140C0A200A240C1C1E0C2727272727272727272727272727
          272727272726191D1E122427272727272727272717240C1C0C0C1C1C1C140E0A
          1427272727272727272714201C1424231E0D12241C1C1C14241A12220E270F27
          272727270E0A22140A1D242727272727272727271814141A220A27120A0A0A22
          1E0911210916192725272727272718241C0C091427272727272727272727180C
          2424241A1611111612220E2727271814241E1A2727270F141426201F27272727
          2727271F141C140A0E161A241424160927272727272727271C0A11160E1A1216
          0B1A1F110C272727272727272727241609191119221A14161D0C272727272727
          2700272727272727272727201A0C101010100C201A1C16242727272727270B20
          241C202020200C2020241A132727272727260A1C200A14200A0C0C0C11242727
          27161C0A24130A27272710121C140A2727272727271420220A141420140A140C
          0914232727272727272727272727272727272727270C271E0E1A242727272727
          2727272717140C0C0C0C1C0C1C14222414272727272727272727240C1C1C1C26
          27141C1C1C1C1C14240A122227271B2727272727222412240A21142727272727
          27272727101C1C141A0F0A14141424120E1619190916270D2727272727271814
          1C0C1E1427272727272727272727180C240A0A1A162121160A0E222727270816
          140E222727270E2114220A1F272727272727271F140C14242216122424242419
          27272727272727272414091E120A120E250A211A0C2727272727272709221A15
          26161F27271F1E2319110E09272727272700272727272727272727200A0C1020
          202020200A1C1E242727272727271320140C202020202020201C1A2327272727
          2726240C0C0A1420240C200C0D2427272715140D260F242727260A140C122427
          27272727272718142414240C1A0C24140A241A27272727272727272727272727
          27272727112616120E122427272727272727272717140C0C1C0C1C0C1C1C1214
          14272727272727272727240C0C0C1C0F1C1C1C1C1C1C1C1C240A121727252727
          2727272712141A0A0A2624272727272727272727101C1C1C0A221C141414140A
          121E260926270F272727272727271814141C121C27272727272727272727180C
          0A1A0A1A1E1111160A22222727271023191D112727271426141A091F27272727
          2727271F1C0C142412260E0A240A14162727272727272727200C260E24241222
          0D241A24142727272727272212232123161B2727170D1A2723271D250E272727
          27002727272727272727272024201020200C2020241C0D242727272727271120
          0C0C202020200C2020141227272727272726240C0C241420141C0C20110A2727
          27270E161E122427272019140C2624272727272727271A20221C14121C0C0C14
          1C0E2427272727272727272727272727272727230C270A24220A242727272727
          27272727271C0C0C0C0C0C0C1C1C1A1414272727272727272727240C0C0C0C1C
          0C0C0C1C1C1C1C1C140A11271527272727272727121C0A1A0A0E142727272727
          27272727100C1C1C141C1C14141C1424120E1609271B1F27272727272727180C
          140C0A1C27272727272727272727180C0A0A1A121E111116240E122727272011
          1D252627271F201C140A0D1F272727272727271F1C0C14241A161E1A1A1A1C1A
          2727272727272727180C162214240A1A191A1414142727272727150A271D191D
          151D1D211127091E20232323161D272727002727272727272727271024202010
          20202020240C0D24272727272727142614202020202020201416122727272727
          2716140C0C141C201C0C2020090A272727271B131313132721241E0C0C220A27
          27272727272727180C240C1424240C0C1C091C24272727272727272727272727
          2727271A271A1C24222424272727272727272727271C0C20200C0C0C0C1C0A14
          14272727272727272727241C1C1C1C1C0C0C0C0C0C0C1C140A12271F27272727
          27272727120C241A0A2214272727272727272727200C1C1C1C1C14141424241A
          120E160F0F252727272727272727180C140C1A1C27272727272727272727180C
          0A1A1A120E091116242222272727270F0F0F0F27271D141C1424221F27272727
          2727271F0C0C14141A1616121A1A141C272727272727272718261A0A140A1A1A
          220A1A241D27272727271C2727271F150D0D152509242619160E1E0F1A242727
          2700272727272727272727201420201020102020141C0E0A2727272727170C0B
          122020102020202012272227272727272716140C0C141C0C0C0C2020160A2727
          272727272727270B200F240C20240A27272727272727272718140C0C0C0A140C
          0C0C092023272727272727272727272727270E251E1C1C2412140A2727272727
          272727271B0C0C20200C0C0C0C1C241C142727272727272727270A1C0C1C0C0C
          1C0C0C0C0C1C1C241A250F2727272727272727271A200A1224221C2727272727
          27272727201C1C141C1C1C1C1C24241A121E21271D272727272727272727100C
          141C0A0C27272727272727272727180C0A0A1A120E09191E2422122727272727
          272727271312122424240A1F2727272727272715200C14141A1E09221A1A240C
          27272727272727231C192414141A0A1A12141A24272727272720131F0E27270E
          1E16160F1F26272727271B27170B0A27270027272727272727272720140C1010
          10102020141C1A1A2727272709200D09202020202020201C2709272727272727
          2719200C200C0C1C0C1C0C200E0A2727272727131B151C0909240C0C0C140A27
          272727272727272727180C1A1C0C1C1C0C1C0C0D0C2427272727272727272727
          1524231A1C0C1C141A1C242727272727272727271B0C0C0C0C0C0C1C1C1C1414
          2427272727272727272724141C0C0C0C0C0C0C0C1C1C0A1A2709272727272727
          27272727101C1A12141E0C2727272727272727270C1C141C1C1C0C1C240A0A0A
          221F131527272727272727272723100A1C0C1A0C27272727272727272727180C
          0A1A1A1A1216090E0A0E12272727271B1B21142417141A241A240C0F27272727
          27272715101C14241A1E191E1A0A1610272727272727212226141414121A2424
          0A16111727272727171427122727141612160F1B0A130F27271A270C21171E27
          2700272727272727272727200A0C2020102020201C240A2627160E200C092620
          10101020200C0C2727152727272727272724141C201C1C1C20140C2022102020
          10200C0C1C1D09091C0C200C1C241A272727272727272727272710200E1C140C
          0C0C0C0C210C101D272727272727231E1C27141C1C1C1C142414242727272727
          2727272709140C0C0C0C0C1C0C1C1424140D27272727272727111C091C0C0C0C
          0C1C1C1C1C240A23231B27272727272727272725141A2222141C1C1C27272727
          2727172216241C1C1C0C1C14240A0A12092715272727272727272727271D1222
          1C0C0A0A20272727272727272727100C1A1A0A1A2226091E241614140C0C1C24
          1A2527121A1A0A1A14240A0F2727272727272719101C24241216191E121A1110
          1B1B1126140C091914140A1A0E24242422272527272727271023211A27271E1A
          241A0F14091E0D271127271F1A1D1D16270027272727091A1224202009201020
          101020200C0A1A0820141A26191410202020200C1C0A2727112727271E12120E
          1C20111C1C1C20202014200C200C1426161616260E0A1C0C200C1C1414161A27
          2727272727272727272727240C0E1C120C0C0C0C201A1E0C2010120A1C100C0B
          111A141C1C1C1C1424120A272727270E2222221A1C1E0C0C0C0C1C1C1C14141A
          12201C220E0C22121C1A151C1C0C0C0C0C0C0C140A141E27152727272727271A
          0E221C14271609220A24191C0C0C181E160C1C251E242414141414240A1A1A22
          270F2727272727271B1E12141C0D1E0A1C1C241D0A20140C1C220E221E141912
          0A1A0A1A1A120E1E160F0F130B151D21121A121A0A121E241414121F27270A22
          0E1E1C140E0A1A0E0911260E121A21252619090B1B260A121A0A121614141426
          27262727272727271409161A27271E2414141314240A1B271E27272714111F14
          27002727272710121A20201C1420201C1C0C2010100C200C2616141010200C1C
          0C20200C17230921272727270C0A220C201E221A240C201C0A1A24201C1C0C0C
          0C2020202020200C1C142424240F0A27272727272727272727272727220C141E
          1E1A1A1C0C0C0C0E1B231D0B1509190A0C1C142327270C0A0A220A2727272712
          0E111926091A0A0A0A0A0A0A1A121A0A220D15152624140B11191C1C0C0C0C0C
          0C140A141C142721272727272727271027171F132619090E1A0A242619211E0C
          0F0F1D0A1C141414140A1A120A1414271617272727272727130E271F131A241C
          1C141C1411152317140A231F170F0A14240A220E1E2609091119261E1A24141C
          1C1C1C0A2216161414141E0F27271C1E2727271D1E161E1E1E160926160E1911
          0916221A0A0E0909161A24140A1A27150D272727272727271424120927271E14
          14141F0A14142319272727270C21171A270027272727200A2010102020202020
          0C1C241C1C0A091A151512121A1A161E21231F1722220B27272727271C241C20
          200C1C1C201C201C200C090C20200C0C1C1C1C1C14141C1C0C20202020271A27
          272727272727272727272727272324141E09121A12121A1C0C2020200C0C0C0C
          14272721121C0A121A190A27272727120A141C0C1C1414141414140C1C1C1C14
          140A1A220E20201C0C0C1C1C14242424141C0C0C1C270E1B2727272727272710
          2422220E1609190916121A0A0A1A1C101C1C1C1C1C140A24141C1C1C1C1C0A16
          1B2727272727272713201A161E221A241414241A22161A0A0C100A0A0A0A1A12
          220E0E221E2611211D151D0D11092626161616161E120A1C14241D0F27271C14
          1A0E1E1E1E1E0E1626091111210D211926221A0A24141414141A160B271F1E0B
          272727272727272714242411272716141414150A141A0F27242727270C1B2726
          2700272727270C0A1020202010202020200C0C0C0C24120D2727251513231526
          1622240A1D1B2727272727271C240C202020200C0C241414140A151B27272727
          27272727272727272727272727270A272727272727272727272727272727270B
          0C241A2527231515210D211D151B2727271622190B1318260A0F0A2727272712
          1A0A22191D27272727272727272727272727272727151C0A0A1E252727272727
          2727272727221D2727272727272727202727272727272727272727271F230B20
          12191B272727272727272727272727252727272727272727131C272727272727
          2727170F23250B1F160C251F2727272727272727272727272727272727272727
          27271F0F1F13251B13271F1F27271C0C27272727272727272727272727272727
          272727271727172727171F270D15272727272727272727271C1A142627271624
          1414111A2709162727222727101D272427002727272722220A0A0A0A0A0A0A0A
          0A0A0A1A0A0A0A0A0A0A0A240A1A1A12261D25272727272727272727121E1212
          12222222222212121A1A1A1A0A0A0A240A1A120E0E2222121A1A0A2424241A27
          2727272727272727272727272727272727151A1C0A1222261B25150D0D1E0A1A
          261527272727081B272724272727272216220E0E160909090926160E22221222
          2222121A0A1422161E0E220E0E0E0E0E220E222222192727272727272727270A
          0E22222222220E0E0E0E0E0E1E0E2422260919111909161616161E0E0E222227
          2727272727272727131E162616161616162626090909091922261D1D0D211111
          191921210D21211111211111112111210D0D1D0D0D0D0D1D1D1D190F27271C25
          151D1D1D250B0B0B152515151D1D1D0D0D0D0D0D0D2119261119251B27272727
          27272727272727271412241C27272624141C210F140D261D272227271009270A
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          27272727230B11090E1E1E26161D252727272727272711111121112727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          27272727272727272727272727272727272727272727272710240A1227272624
          141C090F26092621271627272417171527002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727272711241A0A162724141414220F19112621231427121D1F2427
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272714220A22241214
          141C111222241A26160F271C15111A2727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727271212160D1224141424240A221609272527142219222727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          27272727272727272727272727272727272727272727272727271C250A1A120B
          151D151D0D112527270A1A19121D272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727121B24091419272727272727241E0A160E1E272727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272722272422
          1B110A14240E1124121A091E2727272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727272727272727270A0F1E240A121E262624242213132727272727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727271716
          272713251D13270B112727272727272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727152119112327272727272727272727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727272727272727272727272700}
        mmHeight = 2910
        mmLeft = 159544
        mmTop = 1852
        mmWidth = 16404
        BandType = 7
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Система "Арм-Склад" версия'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 4
        Font.Style = []
        Transparent = True
        mmHeight = 1588
        mmLeft = 176477
        mmTop = 1323
        mmWidth = 18785
        BandType = 7
      end
      object ppLabel26: TppLabel
        UserName = 'Label201'
        Caption = 'Бритвин Сергей beginner@inbox.ru'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 4
        Font.Style = []
        Transparent = True
        mmHeight = 1588
        mmLeft = 176742
        mmTop = 3175
        mmWidth = 22490
        BandType = 7
      end
      object PpRemonVers: TppLabel
        UserName = 'PpRemonVers'
        Caption = '3.1.01'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 4
        Font.Style = []
        Transparent = True
        mmHeight = 1588
        mmLeft = 198173
        mmTop = 1323
        mmWidth = 3704
        BandType = 7
      end
    end
  end
  object PipPost: TppDBPipeline
    DataSource = DataModule2.DsQuery_POST
    UserName = 'PipPost'
    Left = 492
    Top = 311
    object PipPostppField1: TppField
      FieldAlias = 'PN_ID'
      FieldName = 'PN_ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PipPostppField2: TppField
      FieldAlias = 'PN_NUM_FULL'
      FieldName = 'PN_NUM_FULL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PipPostppField3: TppField
      FieldAlias = 'PN_DATE'
      FieldName = 'PN_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PipPostppField4: TppField
      FieldAlias = 'PN_DATE_OPL'
      FieldName = 'PN_DATE_OPL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PipPostppField5: TppField
      FieldAlias = 'SKL_SHORT'
      FieldName = 'SKL_SHORT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PipPostppField6: TppField
      FieldAlias = 'PN_COLOR'
      FieldName = 'PN_COLOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PipPostppField7: TppField
      FieldAlias = 'US_FULL'
      FieldName = 'US_FULL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PipPostppField8: TppField
      FieldAlias = 'PNVID_NAM'
      FieldName = 'PNVID_NAM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PipPostppField9: TppField
      FieldAlias = 'OWNER_FULL'
      FieldName = 'OWNER_FULL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PipPostppField10: TppField
      FieldAlias = 'KLN_ORG'
      FieldName = 'KLN_ORG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object PipPostppField11: TppField
      FieldAlias = 'PN_KURS'
      FieldName = 'PN_KURS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object PipPostppField12: TppField
      FieldAlias = 'KLN_PREFIX'
      FieldName = 'KLN_PREFIX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object PipPostppField13: TppField
      FieldAlias = 'TW_KOL'
      FieldName = 'TW_KOL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object PipPostppField14: TppField
      FieldAlias = 'TW_MONEY'
      FieldName = 'TW_MONEY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object PipPostppField15: TppField
      FieldAlias = 'TW_MONEY_S'
      FieldName = 'TW_MONEY_S'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object PipPostppField16: TppField
      FieldAlias = 'TW_SUMM'
      FieldName = 'TW_SUMM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object PipPostppField17: TppField
      FieldAlias = 'TW_SUMM_S'
      FieldName = 'TW_SUMM_S'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object PipPostppField18: TppField
      FieldAlias = 'TW_MONEYD'
      FieldName = 'TW_MONEYD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object PipPostppField19: TppField
      FieldAlias = 'TW_MONEYD_S'
      FieldName = 'TW_MONEYD_S'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object PipPostppField20: TppField
      FieldAlias = 'TW_SUMMD'
      FieldName = 'TW_SUMMD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object PipPostppField21: TppField
      FieldAlias = 'TW_SUMMD_S'
      FieldName = 'TW_SUMMD_S'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object PipPostppField22: TppField
      FieldAlias = 'POST_OSN'
      FieldName = 'POST_OSN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
  end
  object PpPost: TppReport
    AutoStop = False
    DataPipeline = PipPost
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Подробно о товаре. Перечень поставок'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    UserName = 'Report'
    DeviceType = 'Screen'
    OnPreviewFormCreate = PpPostPreviewFormCreate
    Left = 492
    Top = 361
    Version = '5.0'
    mmColumnWidth = 0
    object ppTitleBand2: TppTitleBand
      BeforeGenerate = ppTitleBand2BeforeGenerate
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 15081
      mmPrintPosition = 0
      object ppLabel27: TppLabel
        UserName = 'Label1'
        Alignment = taRightJustify
        Caption = 'Подробно о товаре :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 31221
        BandType = 1
      end
      object Post_Title1: TppMemo
        UserName = 'Post_title1'
        Caption = 'Post_title1'
        CharWrap = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 8996
        mmLeft = 31485
        mmTop = 0
        mmWidth = 161396
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape1'
        mmHeight = 5556
        mmLeft = 0
        mmTop = 9525
        mmWidth = 266171
        BandType = 1
      end
      object ppLabel37: TppLabel
        UserName = 'Label119'
        Caption = 'Дата/время :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 197115
        mmTop = 0
        mmWidth = 15081
        BandType = 1
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable52'
        VarType = vtPrintDateTime
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 213519
        mmTop = 0
        mmWidth = 22490
        BandType = 1
      end
      object ppLabel38: TppLabel
        UserName = 'Label621'
        Caption = 'Страница :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 200025
        mmTop = 3175
        mmWidth = 12435
        BandType = 1
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable54'
        VarType = vtPageNo
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 213519
        mmTop = 3440
        mmWidth = 1323
        BandType = 1
      end
      object ppLabel39: TppLabel
        UserName = 'Label620'
        Caption = 'из'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 216694
        mmTop = 3440
        mmWidth = 2646
        BandType = 1
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable53'
        VarType = vtPageCount
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 220398
        mmTop = 3440
        mmWidth = 1323
        BandType = 1
      end
      object PpPostUser: TppLabel
        UserName = 'PpRnUser5'
        Caption = 'PpRnUser'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 213519
        mmTop = 6085
        mmWidth = 12171
        BandType = 1
      end
      object ppLabel41: TppLabel
        UserName = 'Label622'
        Caption = 'Пользователь :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 194469
        mmTop = 5821
        mmWidth = 17727
        BandType = 1
      end
      object ppImage3: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 7673
        mmLeft = 243153
        mmTop = 0
        mmWidth = 22754
        BandType = 1
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Фирма-номер'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 10319
        mmWidth = 21167
        BandType = 1
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Поставщик'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 35190
        mmTop = 10319
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'Дата'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 62971
        mmTop = 10319
        mmWidth = 7408
        BandType = 1
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'Дата опл.'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 85725
        mmTop = 10319
        mmWidth = 14817
        BandType = 1
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'Кол-во'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 104246
        mmTop = 10319
        mmWidth = 10583
        BandType = 1
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = 'Цена'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 121973
        mmTop = 10319
        mmWidth = 7938
        BandType = 1
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'Себест.'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 132027
        mmTop = 10319
        mmWidth = 11642
        BandType = 1
      end
      object ppLabel35: TppLabel
        UserName = 'Label502'
        Caption = 'Сумма'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 146579
        mmTop = 10319
        mmWidth = 9790
        BandType = 1
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'Сумма себест.'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 158221
        mmTop = 11377
        mmWidth = 17198
        BandType = 1
      end
      object ppLabel61: TppLabel
        UserName = 'Label61'
        Caption = 'Склад'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 177536
        mmTop = 10319
        mmWidth = 9790
        BandType = 1
      end
      object ppLabel62: TppLabel
        UserName = 'Label62'
        Caption = 'Вид'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 196586
        mmTop = 10319
        mmWidth = 6085
        BandType = 1
      end
      object ppLabel63: TppLabel
        UserName = 'Label63'
        Caption = 'Курс'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 224367
        mmTop = 10319
        mmWidth = 7144
        BandType = 1
      end
      object ppLabel64: TppLabel
        UserName = 'Label202'
        Caption = 'Кто оформил'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 241830
        mmTop = 10319
        mmWidth = 20373
        BandType = 1
      end
    end
    object ppHeaderBand2: TppHeaderBand
      PrintHeight = phDynamic
      PrintOnFirstPage = False
      mmBottomOffset = 0
      mmHeight = 14552
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape2'
        mmHeight = 5556
        mmLeft = 0
        mmTop = 8996
        mmWidth = 266436
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label2'
        Alignment = taRightJustify
        Caption = 'Подробно о товаре :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 0
        mmWidth = 25665
        BandType = 0
      end
      object Post_Title2: TppMemo
        UserName = 'Remon_title2'
        Caption = 'Remon_title1'
        CharWrap = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 8467
        mmLeft = 25929
        mmTop = 0
        mmWidth = 168011
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label12'
        Caption = 'Фирма-номер'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 794
        mmTop = 9790
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label13'
        Caption = 'Поставщик'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 35983
        mmTop = 9790
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label15'
        Caption = 'Дата'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 63500
        mmTop = 9790
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label16'
        Caption = 'Дата опл.'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 85725
        mmTop = 9790
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label17'
        Caption = 'Кол-во'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 104246
        mmTop = 9790
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label18'
        Caption = 'Цена'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 121709
        mmTop = 9790
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'Label20'
        Caption = 'Кто оформил'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 242623
        mmTop = 9790
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label21'
        Caption = 'Дата/время :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 197644
        mmTop = 0
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'Label22'
        Caption = 'Страница :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 200555
        mmTop = 2910
        mmWidth = 12435
        BandType = 0
      end
      object ppSystemVariable7: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPrintDateTime
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 214048
        mmTop = 0
        mmWidth = 22490
        BandType = 0
      end
      object ppSystemVariable8: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageNo
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 214048
        mmTop = 3175
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel54: TppLabel
        UserName = 'Label6201'
        Caption = 'из'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 217223
        mmTop = 3175
        mmWidth = 2646
        BandType = 0
      end
      object ppSystemVariable9: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageCount
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 220928
        mmTop = 3175
        mmWidth = 1323
        BandType = 0
      end
      object PpPostUser2: TppLabel
        UserName = 'PpRemonUser2'
        Caption = 'PpRnUser'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 214048
        mmTop = 5821
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label25'
        Caption = 'Пользователь :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 194998
        mmTop = 5556
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label19'
        Caption = 'Курс'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 234421
        mmTop = 10054
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel55: TppLabel
        UserName = 'Label23'
        Caption = 'Вид'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 197380
        mmTop = 9790
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'Label26'
        Caption = 'Склад'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 178330
        mmTop = 9790
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        Caption = 'Себест.'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 132821
        mmTop = 9790
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        Caption = 'Сумма'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 147373
        mmTop = 9790
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label501'
        Caption = 'Сумма себест.'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 159015
        mmTop = 10319
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object ppDBText7: TppDBText
        UserName = 'DBText1'
        DataField = 'KLN_PREFIX'
        DataPipeline = PipPost
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText2'
        DataField = 'PN_NUM_FULL'
        DataPipeline = PipPost
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 9790
        mmTop = 0
        mmWidth = 23813
        BandType = 4
      end
      object PpKLN_ORG: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'KLN_ORG'
        DataPipeline = PipPost
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3175
        mmLeft = 34131
        mmTop = 0
        mmWidth = 28046
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo6: TppDBMemo
        UserName = 'DBMemo3'
        CharWrap = False
        DataField = 'US_FULL'
        DataPipeline = PipPost
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3175
        mmLeft = 242623
        mmTop = 0
        mmWidth = 23283
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'PN_DATE'
        DataPipeline = PipPost
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 62442
        mmTop = 0
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'PN_DATE_OPL'
        DataPipeline = PipPost
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 85990
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        Alignment = taRightJustify
        DataField = 'TW_KOL'
        DataPipeline = PipPost
        DisplayFormat = '#0.0000'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 99219
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object PpMon1: TppDBText
        UserName = 'PpMon1'
        Alignment = taRightJustify
        DataField = 'TW_MONEY'
        DataPipeline = PipPost
        DisplayFormat = '#0.00'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 115094
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object PpMon2: TppDBText
        UserName = 'PpMon2'
        Alignment = taRightJustify
        DataField = 'TW_MONEY_S'
        DataPipeline = PipPost
        DisplayFormat = '#0.00'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 129911
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
      object PpSumm1: TppDBText
        UserName = 'PpSumm1'
        Alignment = taRightJustify
        DataField = 'TW_SUMM'
        DataPipeline = PipPost
        DisplayFormat = '#0.00'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 144727
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object PpSumm2: TppDBText
        UserName = 'PpSumm2'
        Alignment = taRightJustify
        DataField = 'TW_SUMM_S'
        DataPipeline = PipPost
        DisplayFormat = '#0.00'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 160602
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object ppDBMemo5: TppDBMemo
        UserName = 'DBMemo5'
        CharWrap = False
        DataField = 'SKL_SHORT'
        DataPipeline = PipPost
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 176477
        mmTop = 0
        mmWidth = 20108
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        Alignment = taRightJustify
        DataField = 'PN_KURS'
        DataPipeline = PipPost
        DisplayFormat = '#0.00 '
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 225161
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBMemo7: TppDBMemo
        UserName = 'DBMemo7'
        CharWrap = False
        DataField = 'PNVID_NAM'
        DataPipeline = PipPost
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3175
        mmLeft = 197115
        mmTop = 0
        mmWidth = 27252
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine4: TppLine
        UserName = 'Line2'
        Pen.Color = clGray
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 0
        mmWidth = 266701
        BandType = 4
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 266171
        BandType = 7
      end
      object ppImage4: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = True
        Stretch = True
        Picture.Data = {
          07544269746D617066490000424D664900000000000036010000280000004F01
          0000370000000100080000000000304800000000000000000000400000004000
          0000000000000000800000800000008080008000000080008000808000008080
          8000040404008484840044444400C4C4C40024242400A4A4A40064646400E4E4
          E400141414009494940054545400D4D4D40034343400B4B4B40074747400F4F4
          F4000C0C0C008C8C8C004C4C4C00CCCCCC002C2C2C00ACACAC006C6C6C00ECEC
          EC001C1C1C009C9C9C005C5C5C00DCDCDC003C3C3C00BCBCBC007C7C7C00FCFC
          FC00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272723231F27132727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727270B0B250D272727272727272727272727272727272727272727
          272727272727272727272727272727271F250B15272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2700272727270A0A0A0A0A0A0A0A1A1A1A1A1A1A1A1A0A1A1A1A121A190E0D27
          232727272727272727272727261A1A1A1A1A1A1A1A1A121A121212121212121A
          1A1A1A1A1A1A1A0A1A0A0A0A0A0A1A1127272727272727272727272727272727
          272713220C20201C242414141C0C0C20101C272727272727272727272727271D
          1A1A1212121A1A1A1A1A1A1A1A1A0A24240A1A0A1A1C0A121212221222121212
          121212121A2627272727272727272727272727272727121A220E262727271B22
          121212121212121212121A1A1A12122727272727272727272727272727272727
          24161E1A272727272712121212122222222222221212121212121A1A1A1A1A0A
          1A1A1A1A1A1A1A0A141C0C2027270A0E22220E22222222121222121212121212
          1A1A0A0A0A0D27272727272714141C0C0C200C200C0C200C0C0C202727272727
          27272727272727272727272727272727270027272727201C1C0C1414141C1414
          14240A1A0A0A0A0A24141C1C240C0C0C2010182627272727272727271C1C1414
          1414141414242424240A24240A1216161626092626161E0E221212122222141E
          27272727272727272727272727272727120C2421230B1D090919261E0E1E2611
          0916140C1012172727272727272727261A122226110909090926161E0E0E1E16
          19212111191C241E1E220E19110D1D150D110926161427272727272727272727
          27272727270B261616222627272725221E26151B0B2515151D21191111211E27
          2727272727272727272727272727271419121A1A27272727270A21131B0B0B0B
          251D0D0D1D1D250B1B1B1B252525251515151D21210D1D15150B1B2027270C09
          1F1F0F231B1B1B1B0F1F17170F2313131B2525151419272727272727220D2121
          0D25231B1F0B0D1D151D0C272727272727272727272727272727272727272727
          2700272727270C1A2020202020202020202020200C0C1C140C0C201C1C0E1919
          1E1E141010101727272727271C2420202020200C0C0C0C1C241C0C0C14241414
          14141A1E11111111191622121A1A1A1A2727272727272727272727272727250C
          092624121121110D1D1525250D111119261622220D220C200E17272727272726
          140C0C1C1C140A221E0919260E2212221E2626161E0C1C0A222616160921160E
          220E12121E1427272727272727272727272727270F22261E1A221E2727271514
          0E1E1926121222121222221E2619122727272727272727272727272727271A09
          0E220A1A2727272727101212221E1E1E161609190D15150D111919191111191E
          121A0A1A0A0A0A1A1A1A110C15270C14122222221E2619191111211919262616
          161619252419272727272714122424240A0A161A221909161E250C2727272727
          272727272727272727272727272727272700272727270C240C0C202020202020
          202020202024141C242020200C1C2014221E1E111A0C201C272727270C140C0C
          202020200C0C1C0C0C0C0C14200C0A1E11111A1C14241A0E16221A0A0A0A2424
          272727272727272727272727271C1E0D12120916091527271B2327232527271B
          0909090D1D0D161D14140A2727272716140E192123190E1A0A1A1A121212220E
          0E26091612221C0A160916151B130F1F0F261626221C27272727272727272727
          272727271419190922120E2727270D0C12112127272727272727271B1B1D0927
          272727272727272727272727272316261A1C0A0A2727272727101E2621091725
          25250D110916160E22221E0911161E0E120E1E121A1A1A2222120D0C16270C1C
          19251125272727272727271F0D26221216261926091927272727261C24141C14
          14140A1A2209090E09260E272727272727272727272727272727272727272727
          2700272727272222241C0C1010101010101020200C0C0D0F09240C141420200C
          240A201C221624202427272712220A140C1020200C20200C0C140C1411221F27
          2727170F260A0D0B1E1C1C141412240A27272727272727272727270D121D1A22
          220C2221230E2727151E221A1A0A0E1A1A240A0A0A0E2125131A242727272726
          16221224141424260A0A1A122222221A0E270E1A1A141E221A240A0A220B1723
          26270D161E0A2727272727272727272727272724251909092212122727270D26
          161E1212110B1F1B25170D27111E0E27272727272727272727272727271E1626
          0A1C1A242727272727091D111526221B0E26111D25251D091611162727272727
          272709260E161511221A1A1414270C0B251B2727161F0B150D0D2111260E1211
          27172715261127272727120E241C1C140A241A0E110E22261F0D0E2727272727
          2727272727272727272727272727272727002727272727271327130810101010
          202020200C142427240C1C1020141C20200C190A0C22161E0C0C27271F131323
          1F20100C20200C200C0C141A112712240A0A0A14141C0C142127111A1A121A1A
          0F272727272727272727241E091624240C09151B09272626250F130F23261C18
          0A14241A0A0A0E11091A24272727271F2323230F1C141D1D12121A0A12091519
          1921270F0F1F2713131C2012241E1A0B251D1F0F0F0F27272727272727272727
          2727091D1922161E22121A2727272727231709201C2626262125221B1F1F1F27
          272727272727272727272727240E091612241A1427272727270F0F1F0F091024
          22220E1E0E120A0A1E220E1612121226221E0D172712241E0E0A0A1220272727
          2323131C1409220E1E0E12121211251419272317272727272724121424141C1C
          242422161E0A1D241D2727272727272727272727272727272727272727272727
          2700272727272727272727101C0C1020202020200C1C0A122727272518100C1C
          10200A2124240A1A220C2227272727272726201C200C0C0C0C0C0C1A0A222727
          2727272727231620200C271D1A141E0A0D272727272727272724261216141C0C
          121D231E270D1F272727272727270B0C210A24140A1A0A0A1612142727272727
          272727270F0C211522121A1A2219151E14272727272727272727080C0C1A241E
          1A272727272727272727272727272727271716260916121A0E120A2727272727
          27272721100A1A0A22191327272727272727272727272727272727140E161A12
          0E0E1A142727272727272727272718140E1E2609090E221E110A262727272727
          27270D14221B19140E0A0A1E2027272727272716201A121E26160E0E220D0D1C
          2727272727272727121C121E0A24141C240A0E16121E24272727272727272727
          272727272727272727272727272727272700272727272727272727201C0C1020
          101020200C0C1A24272727272718201C10202426120A1A0A0A12142727272727
          27191C142020200C1C0C0A240A0A2727272727272727272721182017151C0A24
          1E27272727272727241D220E140C0C0C1523242723272727272727272727250C
          13111A240A1A0A14242224272727272727272727270C1A26121A0A0A0A0A0A1A
          1427272727272727272720201C091A241E272727272727272727272727272727
          171A09272321222412120A27272727272727272710140A1A1E14272727272727
          27272727272727272727191E090A24241E260A1427272727272727272727180C
          2212220E0E1A24241E1416272727272727272727171C141214220A2220272727
          2727271D201A220E1E0E240A0A220D0C27272727272727271A0E26111A0A2412
          0A140E091A0E2527272727272727272727272727272727272727272727272727
          27002727272727272727271C140C1010202020201C1C0A14272727272727181C
          14201C161A14141A1A161C0A2727272727191C1C202020201C201A0A1A242727
          272727272727272727271820270E0A140A2727272727270E091A0E1C201A0C0A
          1309111927272727272727272727150C171D260E221A0A0A0A1E242727272727
          27272727170C0C0A2414240A0A1A0A121C2727272727272727270C200C260A24
          222727272727272727272727272727271C152727170B0D09161A0A2727272727
          27272727181C0E120E1C272727272727272727272727272727270E161E121A12
          16160A1C27272727272727272727180C14240A1222120A0A1A140E2727272727
          2727272727270C1A0E2422220C2727272727271510140E1E09090E0A0A1A120C
          272727272727272222110909120A0A220A1416121D1227272727272727272727
          2727272727272727272727272727272727002727272727272727271C1C0C1020
          101020201C0C2414272727272727201024200C24121414240A1A0A1427272727
          2719200C202020201C2014121A24272727271B1B1B1B15272727271812132624
          1427272727271516221E0A20140C1C0D1B1A1D2727272727272727272727150C
          170F2119091919190E0924272727272727272727170C1C0E141414240A1A1A0E
          1C2727272727272727270C0C0C21090A1E272727272727272727272727272712
          1B1B271F131313230F1A24272727272727272727180C1D09261C272727272727
          272727272727272727121E0B0D19091921090A1C27272727272727272727180C
          12221E191119221A0A14222727270F1B1B1B1B272727271C1A1D1A121C1B2727
          2727270F1014111111091119261E0A0C27272727272724142113150D220A121A
          1216240914272727272727272727272727272727272727272727272727272727
          27002727272727272727271C141C1010202020201C0C24142727272727271120
          242020140E1111090916220A152727272709201C0C100C200C201C0E1A242727
          27271C0A1214122727272716102717221427272727270C160E120C1A240C2123
          1B22262727272727272727272727152027170F0F1B1D11191911242727272727
          272727271F0C141E141C14240A1212121C2727272727272727270C20241F250A
          1E272727272727272727272727271311121D2111091919210B12242727272727
          2727272718142717261C27272727272727272727272727271C0E1B1B1B130F0F
          0F250A1C27272727272727272727080C150D1D1D150D21191E14122727271612
          191610272727271C0C1A2422140927272727270F100A2317170D0E0E1E260E0C
          27272727271F240D090E19111E1E120A161A121A232727272727272727272727
          2727272727272727272727272727272727002727272727272727270C14242020
          101020201C0C24242727272727271F201C0C1426132727272323122426272727
          2709100A1C20200C1C0C14090A24272727171C220E1C1A2727272727181F2709
          14272727270E120A1E1C24120C16230F1E221327272727272727272727271520
          272727272727271B1611242727272727272727271F0C0C0E1E261E1626092612
          142727272727272727270C0C19270F241E272727272727272727272727270E0E
          1521110909091919111A24272727272727272727182427270D1C272727272727
          27272727272727121E1E0926190D1B1727271A1C27272727272727272727180C
          2727272715190909151412272727141A241D10272727272710140B090A0A2727
          2727271F100E272727271E2412160E0C27272727270E0E1D15262222240A2212
          221A151E27272727272727272727272727272727272727272727272727272727
          27002727272727272727270C141A201010202020140C140A2727272727271320
          0A121D27272727272727091A1E2727272719201A0C1C0C0C24201A110A0A2727
          27211422260A1A272727272726260F0E2427272727200A1E121416190A0B2313
          261A272727272727272727272727152027272727272727272726142727272727
          272727271F0C1A21230F1B15151D1E1A142727272727272727270C200F272724
          0E27272727272727272727271714211D0D212121210D250B1B1A242727272727
          27272727181A27270F14272727272727272727272727131E1209190909191121
          15271A1C27272727272727272727181C2727272727252609191412272727200A
          111E1027272727270E0C0A1F110C27272727271710221727272727271D111A1C
          2727272724242121191116220A240A0922151427272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1C221020
          202020201A1C240A2727272727270F0C1E1E2727272727272727170B16272727
          27192022200A0A14220C11150A0A2727271A1215211A1A2727272727270C2722
          141D272722140A0E1A1226150B0F131B230A2727272727272727272727271D20
          27272727272727272719142727272727272727271F0C1B272727272727272722
          242727272727272727270C202727270A0E27272727272727272727271C1B111B
          0F171F1F0B1B1D0D0D1A14272727272727272727181E27272714272727272727
          2727272727271E220D0D0D250B0B0B1B1D21121C27272727272727272727080C
          2727272727272719261412272727181C0E1E1027272727272710222323202727
          27272717100E172727272727270D121C2727270D24161626262619190B1D0D1D
          09141F2727272727272727272727272727272727272727272727272727272727
          27002727272727272727270C1C0E20202020200C1624140A2727272727271524
          271D2727272727272727151D212727272709200E201C161E211C15231A0A2727
          271C0E2713220A2727272727270C12241C26272710241E1A0A1611220F17130F
          23262727272727272727272727271514272727272727272727211C2727272727
          272727271F0C27272727272727272719142727272727272727270C0C27272724
          0E27272727272727272727090B1D272723250D11090909092612142727272727
          2727272718192727271C272727272727272727271724161F0F0B250D21211921
          1325121C27272727272727272727181C272727272727271F1924122727270C1E
          09222027272727272720210A1D2427272727271710212727272727272727161C
          2727270E22150D0D1523130B1327272719112727272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1C222020
          2010200C090A140A2727272727270E0A27272727272727272727261E1B272727
          2709200E0C141E19270A13230A0A272727100E2727220A2727272727270A121A
          140A272720241224121927111F232313151D272727272727271D0F2327210C1A
          27272727170F1B1D21210C20210B1B13272727271F0C27272727272727272715
          142727272727272727271C20272727240E27272727272727272717111D272727
          272727231B0B1D11191214272727272727272727182127272714272727272727
          272727271C090D1109090926262626261113121C272727272727272727271814
          27272727272727272724122727151227250A20272727272727261A13231D2727
          27272717101B2727272727272727231C27270A142727272727272727271F2715
          2427272727272727272727272727272727272727272727272727272727272727
          27002727272727272727270C140E20201020200C1112240A2727272727271C1A
          1527272727272727270E1E1E272727272709201E1A24121627211713140A2727
          0D240B2727220A272727272727131717171F27250C1A1A1C2226270D1F232323
          2627272727272727271C140A241E191212120E0E0E162609262624261A0A240A
          272727271F0C27272727272727272727142727272727272727271C1C2727270A
          0E272727272727272727220B2727272727272727272727272712142727272727
          27272727100D2727271427272727272727272711091727271723232521190909
          11210A1C272727272727272727271824272727272727272727241227271C1227
          0F0E202727272727272723131B1B27272727271710232727272727272727171C
          2709242727272727272727272727271427272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1C0E2020
          20202020260E0A0A272727272715121727272727272727270D11271B27272727
          27090C160A141C14271727270A0A27151E15272727160A272727272727272727
          272727141A1E141C2616270D0F230F230A27272727272727271C0D2727272727
          27272727272727272727272727272724272727271F1C27272727272727272727
          142727272727272727271C1A272727220E27272727272727270C272727272727
          2727272727272727270A24272727272727272727100D27272724272727272727
          27271419272727272727272727271B192127241C27272727272727272727101A
          2727272727272727270A22270E14272727272027272727272727272727272727
          2727271F101327272727272727271B120E24170F1B150D0B2727272727271427
          2727272727272727272727272727272727272727272727272727272727272727
          2700272727272727272727201C1E2020202020200E1E0A0A27271727160C2711
          2727272727272727272719272727272727090C1E0A140C0C111527270E0E241C
          1F27272727190A2727272727272727272727272012120C0C1E092311230F1F13
          1427272727272727271C14220E16111119211D150B0B231F0F0B25150B151224
          272727271F1C27272727272727272727142727272727272727271C0A2727270E
          1E27272727272727162327272727272727272727231527272724142727272727
          27272727182127272724272727272727272519272727272727272727271D090A
          09130A1C27272727272727272727181227272727272727272712140C1E211F27
          272720272727272727272727272727272727271F1013272727272727270B211D
          261B0B0D191E1E191D27272727240F2727272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1A0E2020
          202020201A220C180C20200C0E0F272727272727272719272713272727272727
          2719141E24140C0C160927271E0C0D271727272727190A272727272727272727
          272727101A12200C22192109230F1F131427272727272727270E2222220E0E0E
          22121A1A1A1A221E0E0E22121A121A0A272727271F2427272727272727272727
          142727272727272727271C0A2727270E1E272727272727131D1F272727272727
          27270B1121141D2717141427272727272727272710192727270A272727272727
          27262727272727272727271509261A0E1E191A1C272727272727272727270822
          2727272727272727270D272725231F0F231F2027272727272727272727272727
          2727271F201B27272727271F211E16111A261E121A0A121E21131F0F0A242727
          2727272727272727272727272727272727272727272727272727272727272727
          270027272727272727272720120E20101010202020241C202226162717132727
          27272727251D2723152727272727272727110A1E240A220E1E1E232627272727
          27272727270F0A272727272727272727272727101A0A200C1A0926260F0F0F15
          1427272727272727272727272727272727272727272727272727272727272727
          2727272717122727272727272727271F142727272727272727271C1A27272716
          1E2727272727130E27272727272727170B0D1121260C091D0914142727272727
          27272727101E2727271A27272727271F1A23272727272727270D09262616231E
          1A1A221C272727272727272727271822272727272727272727272727130D261E
          0E211A272727272727272727272727272727271F1C1527272727270B26121A0E
          0A0A0A1A241A12260D230F232719141027272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727272012221010
          2014241A221E1A24190A11272727272727272716270D22252727272727272727
          27110A22241A0E22151E271F112523272727272727131A272727272727272727
          272727201424200C240E0E26130F0F151C272727272727272727272727272727
          27272727272727272727272727272727272727271F12272727272727270F2525
          14272727272727272727141A272727090E272727271F1C27272727270F0B250B
          2525151D271C16160A0A2427272727272727272710122727271A272727272714
          15272727170B11091E16262626092026141C161C27272727272727272727081A
          27272727232509161E1E0E22221212121A091627272727272727272727272727
          2727271F14191F1D261E0E0A141414220E26112224141414142426130B27270E
          1A13272727272727272727272727272727272727272727272727272727272727
          27002727272727272727272012122020100C1C0A0A2414202220241F27272727
          2727170F1C1C1927272727272727272727110A1A0A120E22250E1F151B232116
          16110B2727130A2727272727272727272727270C0C0A0C0C0C12121123230F1D
          1427272727272727272727272727272727272727272727272727272727272727
          2727272717122727272727272723211D142727272727272727271C2427272711
          1E272727271C272727271713251525230F231B271614220A1C1A242727272727
          27272727101A2727271A272727271F1D2727271D0E0A0A221E162626221E1826
          0C1C091C2727272727272727272708242727270F0B1D16222212270B1E0A0A0A
          240919272727272727272727272727272727271F1C26271F0B2121111111240E
          2727272727272721220A1C1C090B2327191C2727272727272727272727272727
          2727272727272727272727272727272727002727272727272727272012122020
          20200C201A1C171C0C1422240E0A1E15172713130F0E0C182727272727272727
          270D0A0A240C20201214252619140C201A16092527250A272727272727272727
          2727271A2012200C201A1A261313131514272727272727272727272727272727
          2727272727272727272727272727272727272727171A272727272727271F1D15
          242727272727272727271C14272727150E272727190F1F272727231B25150B0F
          1F13270B121C0A1C1C1624272727272727272727101A27270F1A2727271F1C27
          2725161A2414141A1E1626160B23180E1C1C211C27272727272727272727181C
          27272717171F1B21191C1A26270B192224091E27272727272727272727272727
          2727271F142225150D1926091911241A171B0B21121621271B260E241C091B27
          27220C2727272727272727272727272727272727272727272727272727272727
          27002727272727272727270C121A1020101020201A1C1D14121C0C2020121116
          21172727131B0D0C1C27272727272727271D24240A202020120C160E190A1F20
          101216090D0D0A2727272727272727272727270E200E0C0C2014120E0B25151D
          1427272727272727272727272727272727272727272727272727272727272727
          272727271712171F132727270F1F0B2514272727272727272727141C2727270B
          1E272713090F0F0F230F0B1D0D211D1B232721271A140A0C1415242727272727
          27272727101A27270B1A272727242315211916221A0A0A12161619271B271812
          1C0C211C27272727272727272727180C131511191D251D19111C221E141E0E24
          1C090A272727272727272727272727272727271F1C1A2111260E120E16262414
          272727272727140A2719091A1C140B132727240A272727272727272727272727
          27272727272727272727272727272727270027272727272727272720220A1020
          1010200C121C261A2727271518101C191E260D1B0F2325250C0E272727272727
          270D2424240C202012201A1A262427270820161E16110A272727272727272727
          272727152016200C201C1A221921110D14272727272727272727272727272727
          27272727272727272727272727272727272727271712190919251B1D0D0B0B0D
          14272727272727272727140C2717171B1E271F14271B1B1B1B1519090909111D
          270B1F271224120C141514272727272727272727100A17271D1A272721212121
          0D2111260E1A1A12160927152727181A1C0C1D1C27272727272727272727180C
          21090E2216261E12161C0E270E0C12241C091427272727272727272727272727
          2727271F1C240926262214142424241C27272727272727202409160E1214250F
          270F0D0C27272727272727272727272727272727272727272727272727272727
          2700272727272727272727200E14102010102020121C0E1A272727272710100A
          091E1E161E152521141427272727272727112414141C20201A20140A1E242727
          112022161E111A27272727272727272727272727101A240C20201A1E22220E16
          141D27272727272727272727272727272727272727270B220E0E262727272727
          2727272717120A1A1A220E221E190D2614272727272727272727140C23151513
          1E270C27231B2511261E1E161626090B272527271A0A120C2425242727272727
          27272727100A0D1F211A27251E1511210D0D2126162212121E2321272727180A
          1C0C0B1427272727272727272727180C0E120A1A1E260E1A0E240E2727182412
          1C090C272727272727272727272727272727271F1414220E161E141C141C1214
          272727272727271F20262609260E260F1F171F21212727272727272727272727
          272727272727272727272727272727272700272727272727272727200E0C1020
          102020201214220A272727272727181C11221A0A2422190909141A2727272727
          2719241C1C140C201A201C241624272727180A0E0E091A272727210C0C202227
          27272727100C121C0C201A0E24140A1A141E2727272727272727272727272727
          2727272727270A1927211A27272727272727272717121C1C141414140A0E2622
          14272727272727272727140C190E26130E12271325090E1A0A1A220E0E1E2627
          25272727120A221C241B2427272727272727272718240E1D191A0F140F092609
          11212119260E22221B1117272727180A1C0C1B1427272727272727272727181C
          0A24240A1E092612220A0E2727241C1C14261C272727270C1C0C141F27272727
          2727271F141C0A121E1E24141C140E1A2727272727272727180E192616121613
          0F0D17231C272727272727272727272727272727272727272727272727272727
          270027272727272727272720220C10102020202012140E0A2727272727271420
          220A1C0C0C1C1414241A1C27272727272719241C0C240C0C0A200C1C260A2727
          27100C1A1A211A272727241527221A27272727271E0C0E240C201A241A1C1C24
          0A1C27272727272727272727272727272727272727270C272222242727272727
          27272727171A0C0C0C0C0C0C1C0A1E1A1427272727272727272714201A1A1A23
          0E271D1922241414241A22220E1E271127272727220A0E1C2413242727272727
          2727272718141A16161A0C271E22221E0911211109160E0B171B27272727180A
          1C0C1D1427272727272727272727181C1424240A1619091E2212222727230C0C
          141E0A27272727121B270C1F2727272727272717241C140A0E1E0A1414142622
          272727272727272718121116160E220D0F1227150C2727272727272727272711
          1C1615130D190A141F2727272727272727002727272727272727272012201010
          101020201A141E0A2727272727271D10141C2020202020202011242727272727
          2709240C200A1C200A0C200C192427272712201424150A272727102709141A27
          27272727270C0A0A140C0A200A240C1C1E0C2727272727272727272727272727
          272727272726191D1E122427272727272727272717240C1C0C0C1C1C1C140E0A
          1427272727272727272714201C1424231E0D12241C1C1C14241A12220E270F27
          272727270E0A22140A1D242727272727272727271814141A220A27120A0A0A22
          1E0911210916192725272727272718241C0C091427272727272727272727180C
          2424241A1611111612220E2727271814241E1A2727270F141426201F27272727
          2727271F141C140A0E161A241424160927272727272727271C0A11160E1A1216
          0B1A1F110C272727272727272727241609191119221A14161D0C272727272727
          2700272727272727272727201A0C101010100C201A1C16242727272727270B20
          241C202020200C2020241A132727272727260A1C200A14200A0C0C0C11242727
          27161C0A24130A27272710121C140A2727272727271420220A141420140A140C
          0914232727272727272727272727272727272727270C271E0E1A242727272727
          2727272717140C0C0C0C1C0C1C14222414272727272727272727240C1C1C1C26
          27141C1C1C1C1C14240A122227271B2727272727222412240A21142727272727
          27272727101C1C141A0F0A14141424120E1619190916270D2727272727271814
          1C0C1E1427272727272727272727180C240A0A1A162121160A0E222727270816
          140E222727270E2114220A1F272727272727271F140C14242216122424242419
          27272727272727272414091E120A120E250A211A0C2727272727272709221A15
          26161F27271F1E2319110E09272727272700272727272727272727200A0C1020
          202020200A1C1E242727272727271320140C202020202020201C1A2327272727
          2726240C0C0A1420240C200C0D2427272715140D260F242727260A140C122427
          27272727272718142414240C1A0C24140A241A27272727272727272727272727
          27272727112616120E122427272727272727272717140C0C1C0C1C0C1C1C1214
          14272727272727272727240C0C0C1C0F1C1C1C1C1C1C1C1C240A121727252727
          2727272712141A0A0A2624272727272727272727101C1C1C0A221C141414140A
          121E260926270F272727272727271814141C121C27272727272727272727180C
          0A1A0A1A1E1111160A22222727271023191D112727271426141A091F27272727
          2727271F1C0C142412260E0A240A14162727272727272727200C260E24241222
          0D241A24142727272727272212232123161B2727170D1A2723271D250E272727
          27002727272727272727272024201020200C2020241C0D242727272727271120
          0C0C202020200C2020141227272727272726240C0C241420141C0C20110A2727
          27270E161E122427272019140C2624272727272727271A20221C14121C0C0C14
          1C0E2427272727272727272727272727272727230C270A24220A242727272727
          27272727271C0C0C0C0C0C0C1C1C1A1414272727272727272727240C0C0C0C1C
          0C0C0C1C1C1C1C1C140A11271527272727272727121C0A1A0A0E142727272727
          27272727100C1C1C141C1C14141C1424120E1609271B1F27272727272727180C
          140C0A1C27272727272727272727180C0A0A1A121E111116240E122727272011
          1D252627271F201C140A0D1F272727272727271F1C0C14241A161E1A1A1A1C1A
          2727272727272727180C162214240A1A191A1414142727272727150A271D191D
          151D1D211127091E20232323161D272727002727272727272727271024202010
          20202020240C0D24272727272727142614202020202020201416122727272727
          2716140C0C141C201C0C2020090A272727271B131313132721241E0C0C220A27
          27272727272727180C240C1424240C0C1C091C24272727272727272727272727
          2727271A271A1C24222424272727272727272727271C0C20200C0C0C0C1C0A14
          14272727272727272727241C1C1C1C1C0C0C0C0C0C0C1C140A12271F27272727
          27272727120C241A0A2214272727272727272727200C1C1C1C1C14141424241A
          120E160F0F252727272727272727180C140C1A1C27272727272727272727180C
          0A1A1A120E091116242222272727270F0F0F0F27271D141C1424221F27272727
          2727271F0C0C14141A1616121A1A141C272727272727272718261A0A140A1A1A
          220A1A241D27272727271C2727271F150D0D152509242619160E1E0F1A242727
          2700272727272727272727201420201020102020141C0E0A2727272727170C0B
          122020102020202012272227272727272716140C0C141C0C0C0C2020160A2727
          272727272727270B200F240C20240A27272727272727272718140C0C0C0A140C
          0C0C092023272727272727272727272727270E251E1C1C2412140A2727272727
          272727271B0C0C20200C0C0C0C1C241C142727272727272727270A1C0C1C0C0C
          1C0C0C0C0C1C1C241A250F2727272727272727271A200A1224221C2727272727
          27272727201C1C141C1C1C1C1C24241A121E21271D272727272727272727100C
          141C0A0C27272727272727272727180C0A0A1A120E09191E2422122727272727
          272727271312122424240A1F2727272727272715200C14141A1E09221A1A240C
          27272727272727231C192414141A0A1A12141A24272727272720131F0E27270E
          1E16160F1F26272727271B27170B0A27270027272727272727272720140C1010
          10102020141C1A1A2727272709200D09202020202020201C2709272727272727
          2719200C200C0C1C0C1C0C200E0A2727272727131B151C0909240C0C0C140A27
          272727272727272727180C1A1C0C1C1C0C1C0C0D0C2427272727272727272727
          1524231A1C0C1C141A1C242727272727272727271B0C0C0C0C0C0C1C1C1C1414
          2427272727272727272724141C0C0C0C0C0C0C0C1C1C0A1A2709272727272727
          27272727101C1A12141E0C2727272727272727270C1C141C1C1C0C1C240A0A0A
          221F131527272727272727272723100A1C0C1A0C27272727272727272727180C
          0A1A1A1A1216090E0A0E12272727271B1B21142417141A241A240C0F27272727
          27272715101C14241A1E191E1A0A1610272727272727212226141414121A2424
          0A16111727272727171427122727141612160F1B0A130F27271A270C21171E27
          2700272727272727272727200A0C2020102020201C240A2627160E200C092620
          10101020200C0C2727152727272727272724141C201C1C1C20140C2022102020
          10200C0C1C1D09091C0C200C1C241A272727272727272727272710200E1C140C
          0C0C0C0C210C101D272727272727231E1C27141C1C1C1C142414242727272727
          2727272709140C0C0C0C0C1C0C1C1424140D27272727272727111C091C0C0C0C
          0C1C1C1C1C240A23231B27272727272727272725141A2222141C1C1C27272727
          2727172216241C1C1C0C1C14240A0A12092715272727272727272727271D1222
          1C0C0A0A20272727272727272727100C1A1A0A1A2226091E241614140C0C1C24
          1A2527121A1A0A1A14240A0F2727272727272719101C24241216191E121A1110
          1B1B1126140C091914140A1A0E24242422272527272727271023211A27271E1A
          241A0F14091E0D271127271F1A1D1D16270027272727091A1224202009201020
          101020200C0A1A0820141A26191410202020200C1C0A2727112727271E12120E
          1C20111C1C1C20202014200C200C1426161616260E0A1C0C200C1C1414161A27
          2727272727272727272727240C0E1C120C0C0C0C201A1E0C2010120A1C100C0B
          111A141C1C1C1C1424120A272727270E2222221A1C1E0C0C0C0C1C1C1C14141A
          12201C220E0C22121C1A151C1C0C0C0C0C0C0C140A141E27152727272727271A
          0E221C14271609220A24191C0C0C181E160C1C251E242414141414240A1A1A22
          270F2727272727271B1E12141C0D1E0A1C1C241D0A20140C1C220E221E141912
          0A1A0A1A1A120E1E160F0F130B151D21121A121A0A121E241414121F27270A22
          0E1E1C140E0A1A0E0911260E121A21252619090B1B260A121A0A121614141426
          27262727272727271409161A27271E2414141314240A1B271E27272714111F14
          27002727272710121A20201C1420201C1C0C2010100C200C2616141010200C1C
          0C20200C17230921272727270C0A220C201E221A240C201C0A1A24201C1C0C0C
          0C2020202020200C1C142424240F0A27272727272727272727272727220C141E
          1E1A1A1C0C0C0C0E1B231D0B1509190A0C1C142327270C0A0A220A2727272712
          0E111926091A0A0A0A0A0A0A1A121A0A220D15152624140B11191C1C0C0C0C0C
          0C140A141C142721272727272727271027171F132619090E1A0A242619211E0C
          0F0F1D0A1C141414140A1A120A1414271617272727272727130E271F131A241C
          1C141C1411152317140A231F170F0A14240A220E1E2609091119261E1A24141C
          1C1C1C0A2216161414141E0F27271C1E2727271D1E161E1E1E160926160E1911
          0916221A0A0E0909161A24140A1A27150D272727272727271424120927271E14
          14141F0A14142319272727270C21171A270027272727200A2010102020202020
          0C1C241C1C0A091A151512121A1A161E21231F1722220B27272727271C241C20
          200C1C1C201C201C200C090C20200C0C1C1C1C1C14141C1C0C20202020271A27
          272727272727272727272727272324141E09121A12121A1C0C2020200C0C0C0C
          14272721121C0A121A190A27272727120A141C0C1C1414141414140C1C1C1C14
          140A1A220E20201C0C0C1C1C14242424141C0C0C1C270E1B2727272727272710
          2422220E1609190916121A0A0A1A1C101C1C1C1C1C140A24141C1C1C1C1C0A16
          1B2727272727272713201A161E221A241414241A22161A0A0C100A0A0A0A1A12
          220E0E221E2611211D151D0D11092626161616161E120A1C14241D0F27271C14
          1A0E1E1E1E1E0E1626091111210D211926221A0A24141414141A160B271F1E0B
          272727272727272714242411272716141414150A141A0F27242727270C1B2726
          2700272727270C0A1020202010202020200C0C0C0C24120D2727251513231526
          1622240A1D1B2727272727271C240C202020200C0C241414140A151B27272727
          27272727272727272727272727270A272727272727272727272727272727270B
          0C241A2527231515210D211D151B2727271622190B1318260A0F0A2727272712
          1A0A22191D27272727272727272727272727272727151C0A0A1E252727272727
          2727272727221D2727272727272727202727272727272727272727271F230B20
          12191B272727272727272727272727252727272727272727131C272727272727
          2727170F23250B1F160C251F2727272727272727272727272727272727272727
          27271F0F1F13251B13271F1F27271C0C27272727272727272727272727272727
          272727271727172727171F270D15272727272727272727271C1A142627271624
          1414111A2709162727222727101D272427002727272722220A0A0A0A0A0A0A0A
          0A0A0A1A0A0A0A0A0A0A0A240A1A1A12261D25272727272727272727121E1212
          12222222222212121A1A1A1A0A0A0A240A1A120E0E2222121A1A0A2424241A27
          2727272727272727272727272727272727151A1C0A1222261B25150D0D1E0A1A
          261527272727081B272724272727272216220E0E160909090926160E22221222
          2222121A0A1422161E0E220E0E0E0E0E220E222222192727272727272727270A
          0E22222222220E0E0E0E0E0E1E0E2422260919111909161616161E0E0E222227
          2727272727272727131E162616161616162626090909091922261D1D0D211111
          191921210D21211111211111112111210D0D1D0D0D0D0D1D1D1D190F27271C25
          151D1D1D250B0B0B152515151D1D1D0D0D0D0D0D0D2119261119251B27272727
          27272727272727271412241C27272624141C210F140D261D272227271009270A
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          27272727230B11090E1E1E26161D252727272727272711111121112727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          27272727272727272727272727272727272727272727272710240A1227272624
          141C090F26092621271627272417171527002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727272711241A0A162724141414220F19112621231427121D1F2427
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272714220A22241214
          141C111222241A26160F271C15111A2727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727271212160D1224141424240A221609272527142219222727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          27272727272727272727272727272727272727272727272727271C250A1A120B
          151D151D0D112527270A1A19121D272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727121B24091419272727272727241E0A160E1E272727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272722272422
          1B110A14240E1124121A091E2727272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727272727272727270A0F1E240A121E262624242213132727272727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727271716
          272713251D13270B112727272727272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727152119112327272727272727272727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727272727272727272727272700}
        mmHeight = 2910
        mmLeft = 222780
        mmTop = 1852
        mmWidth = 16404
        BandType = 7
      end
      object ppLabel57: TppLabel
        UserName = 'Label24'
        Caption = 'Система "Арм-Склад" версия'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 4
        Font.Style = []
        Transparent = True
        mmHeight = 1588
        mmLeft = 239713
        mmTop = 1323
        mmWidth = 18785
        BandType = 7
      end
      object ppLabel58: TppLabel
        UserName = 'Label201'
        Caption = 'Бритвин Сергей beginner@inbox.ru'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 4
        Font.Style = []
        Transparent = True
        mmHeight = 1588
        mmLeft = 239978
        mmTop = 3175
        mmWidth = 22490
        BandType = 7
      end
      object PpPostVers: TppLabel
        UserName = 'PpRemonVers'
        Caption = '3.1.01'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 4
        Font.Style = []
        Transparent = True
        mmHeight = 1588
        mmLeft = 261409
        mmTop = 1323
        mmWidth = 3704
        BandType = 7
      end
      object ppLabel65: TppLabel
        UserName = 'Label65'
        Caption = 'Итого :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 794
        mmWidth = 10054
        BandType = 7
      end
      object PpSumm3: TppDBCalc
        UserName = 'PpSumm3'
        Alignment = taRightJustify
        DataField = 'TW_SUMM'
        DataPipeline = PipPost
        DisplayFormat = '#0.00'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 143404
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
      object PpSumm4: TppDBCalc
        UserName = 'PpSumm4'
        Alignment = taRightJustify
        DataField = 'TW_SUMM_S'
        DataPipeline = PipPost
        DisplayFormat = '#0.00'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 160602
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        Alignment = taRightJustify
        DataField = 'TW_KOL'
        DataPipeline = PipPost
        DisplayFormat = '#0.0000'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 95515
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
    end
  end
  object PpRealiz: TppReport
    AutoStop = False
    DataPipeline = PipRealiz
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Подробно о товаре. Перечень реализации'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    UserName = 'Report'
    DeviceType = 'Screen'
    OnPreviewFormCreate = PpRealizPreviewFormCreate
    Left = 432
    Top = 361
    Version = '5.0'
    mmColumnWidth = 0
    object ppTitleBand3: TppTitleBand
      BeforeGenerate = ppTitleBand3BeforeGenerate
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 15081
      mmPrintPosition = 0
      object ppLabel66: TppLabel
        UserName = 'Label1'
        Alignment = taRightJustify
        Caption = 'Подробно о товаре :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 31221
        BandType = 1
      end
      object Realiz_title1: TppMemo
        UserName = 'Post_title1'
        Caption = 'Post_title1'
        CharWrap = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 8996
        mmLeft = 31485
        mmTop = 0
        mmWidth = 161396
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppShape5: TppShape
        UserName = 'Shape1'
        mmHeight = 5556
        mmLeft = 0
        mmTop = 9525
        mmWidth = 266171
        BandType = 1
      end
      object ppLabel67: TppLabel
        UserName = 'Label119'
        Caption = 'Дата/время :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 197115
        mmTop = 0
        mmWidth = 15081
        BandType = 1
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'SystemVariable52'
        VarType = vtPrintDateTime
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 213519
        mmTop = 0
        mmWidth = 22490
        BandType = 1
      end
      object ppLabel68: TppLabel
        UserName = 'Label621'
        Caption = 'Страница :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 200025
        mmTop = 3175
        mmWidth = 12435
        BandType = 1
      end
      object ppSystemVariable11: TppSystemVariable
        UserName = 'SystemVariable54'
        VarType = vtPageNo
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 213519
        mmTop = 3440
        mmWidth = 1323
        BandType = 1
      end
      object ppLabel69: TppLabel
        UserName = 'Label620'
        Caption = 'из'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 216694
        mmTop = 3440
        mmWidth = 2646
        BandType = 1
      end
      object ppSystemVariable12: TppSystemVariable
        UserName = 'SystemVariable53'
        VarType = vtPageCount
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 220398
        mmTop = 3440
        mmWidth = 1323
        BandType = 1
      end
      object PpRealizUser: TppLabel
        UserName = 'PpRnUser5'
        Caption = 'PpRnUser'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 213519
        mmTop = 6085
        mmWidth = 12171
        BandType = 1
      end
      object ppLabel71: TppLabel
        UserName = 'Label622'
        Caption = 'Пользователь :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 194469
        mmTop = 5821
        mmWidth = 17727
        BandType = 1
      end
      object ppImage5: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 7673
        mmLeft = 243153
        mmTop = 0
        mmWidth = 22754
        BandType = 1
      end
      object ppLabel72: TppLabel
        UserName = 'Label28'
        Caption = 'Фирма-номер'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 10319
        mmWidth = 21167
        BandType = 1
      end
      object ppLabel73: TppLabel
        UserName = 'Label29'
        Caption = 'Клиент'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 33867
        mmTop = 10319
        mmWidth = 10848
        BandType = 1
      end
      object ppLabel74: TppLabel
        UserName = 'Label30'
        Caption = 'Дата'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 62971
        mmTop = 10319
        mmWidth = 7408
        BandType = 1
      end
      object ppLabel76: TppLabel
        UserName = 'Label32'
        Caption = 'Кол-во'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 91546
        mmTop = 10319
        mmWidth = 10583
        BandType = 1
      end
      object ppLabel77: TppLabel
        UserName = 'Label33'
        Caption = 'Цена'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 110067
        mmTop = 10319
        mmWidth = 7938
        BandType = 1
      end
      object ppLabel78: TppLabel
        UserName = 'Label34'
        Caption = 'Цена, $'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 119856
        mmTop = 10319
        mmWidth = 11377
        BandType = 1
      end
      object ppLabel79: TppLabel
        UserName = 'Label502'
        Caption = 'Сумма'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 138377
        mmTop = 10319
        mmWidth = 9790
        BandType = 1
      end
      object ppLabel81: TppLabel
        UserName = 'Label61'
        Caption = 'Склад'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 164571
        mmTop = 10319
        mmWidth = 9790
        BandType = 1
      end
      object ppLabel82: TppLabel
        UserName = 'Label62'
        Caption = 'Вид'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 208757
        mmTop = 10319
        mmWidth = 6085
        BandType = 1
      end
      object ppLabel83: TppLabel
        UserName = 'Label63'
        Caption = 'Курс'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 201084
        mmTop = 10319
        mmWidth = 7144
        BandType = 1
      end
      object ppLabel84: TppLabel
        UserName = 'Label202'
        Caption = 'Основание'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 236009
        mmTop = 10319
        mmWidth = 17198
        BandType = 1
      end
      object ppLabel70: TppLabel
        UserName = 'Label70'
        Caption = 'Сумма, $'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 150548
        mmTop = 10319
        mmWidth = 13229
        BandType = 1
      end
    end
    object ppHeaderBand3: TppHeaderBand
      PrintHeight = phDynamic
      PrintOnFirstPage = False
      mmBottomOffset = 0
      mmHeight = 14552
      mmPrintPosition = 0
      object ppShape6: TppShape
        UserName = 'Shape2'
        mmHeight = 5556
        mmLeft = 0
        mmTop = 8996
        mmWidth = 266436
        BandType = 0
      end
      object ppLabel85: TppLabel
        UserName = 'Label2'
        Alignment = taRightJustify
        Caption = 'Подробно о товаре :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 0
        mmWidth = 25665
        BandType = 0
      end
      object Realiz_title2: TppMemo
        UserName = 'Remon_title2'
        Caption = 'Remon_title1'
        CharWrap = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 8467
        mmLeft = 25665
        mmTop = 0
        mmWidth = 168011
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel86: TppLabel
        UserName = 'Label12'
        Caption = 'Фирма-номер'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 794
        mmTop = 9790
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel87: TppLabel
        UserName = 'Label13'
        Caption = 'Клиент'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 34131
        mmTop = 9790
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel88: TppLabel
        UserName = 'Label15'
        Caption = 'Дата'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 63500
        mmTop = 9790
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel90: TppLabel
        UserName = 'Label17'
        Caption = 'Кол-во'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 91546
        mmTop = 9790
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel91: TppLabel
        UserName = 'Label18'
        Caption = 'Цена'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 109538
        mmTop = 9790
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel92: TppLabel
        UserName = 'Label20'
        Caption = 'Основание'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 236273
        mmTop = 9790
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel93: TppLabel
        UserName = 'Label21'
        Caption = 'Дата/время :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 197644
        mmTop = 0
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel94: TppLabel
        UserName = 'Label22'
        Caption = 'Страница :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 200555
        mmTop = 2910
        mmWidth = 12435
        BandType = 0
      end
      object ppSystemVariable13: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPrintDateTime
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 214048
        mmTop = 0
        mmWidth = 22490
        BandType = 0
      end
      object ppSystemVariable14: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageNo
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 214048
        mmTop = 3175
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel95: TppLabel
        UserName = 'Label6201'
        Caption = 'из'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 217223
        mmTop = 3175
        mmWidth = 2646
        BandType = 0
      end
      object ppSystemVariable15: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageCount
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 220928
        mmTop = 3175
        mmWidth = 1323
        BandType = 0
      end
      object PpRealizUser2: TppLabel
        UserName = 'PpRemonUser2'
        Caption = 'PpRnUser'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 214048
        mmTop = 5821
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel97: TppLabel
        UserName = 'Label25'
        Caption = 'Пользователь :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 194998
        mmTop = 5556
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel98: TppLabel
        UserName = 'Label19'
        Caption = 'Курс'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 200819
        mmTop = 9790
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel99: TppLabel
        UserName = 'Label23'
        Caption = 'Вид'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 208757
        mmTop = 9790
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel100: TppLabel
        UserName = 'Label26'
        Caption = 'Склад'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 165100
        mmTop = 9790
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel101: TppLabel
        UserName = 'Label45'
        Caption = 'Цена, $'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 120386
        mmTop = 9790
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel102: TppLabel
        UserName = 'Label50'
        Caption = 'Сумма'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 138377
        mmTop = 9790
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'Label503'
        Caption = 'Сумма, $'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 150813
        mmTop = 9790
        mmWidth = 13229
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object ppDBText17: TppDBText
        UserName = 'DBText1'
        DataField = 'KLN_PREFIX'
        DataPipeline = PipRealiz
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText2'
        DataField = 'REAL_NUM_FULL'
        DataPipeline = PipRealiz
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 9790
        mmTop = 0
        mmWidth = 23813
        BandType = 4
      end
      object ppDBMemo8: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'KLN_ORG'
        DataPipeline = PipRealiz
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3175
        mmLeft = 34131
        mmTop = 0
        mmWidth = 28840
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo9: TppDBMemo
        UserName = 'DBMemo3'
        CharWrap = False
        DataField = 'REAL_OSN'
        DataPipeline = PipRealiz
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3175
        mmLeft = 236538
        mmTop = 0
        mmWidth = 29369
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText9'
        DataField = 'REAL_DATE'
        DataPipeline = PipRealiz
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 63500
        mmTop = 0
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText11'
        Alignment = taRightJustify
        DataField = 'TW_KOL'
        DataPipeline = PipRealiz
        DisplayFormat = '#0.0000'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 87313
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText12'
        Alignment = taRightJustify
        DataField = 'TW_MONEY'
        DataPipeline = PipRealiz
        DisplayFormat = '#0.00'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 102659
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText13'
        Alignment = taRightJustify
        DataField = 'TW_MONEYD'
        DataPipeline = PipRealiz
        DisplayFormat = '#0.00'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 117740
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText14'
        Alignment = taRightJustify
        DataField = 'TW_SUMM'
        DataPipeline = PipRealiz
        DisplayFormat = '#0.00'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 132557
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText15'
        Alignment = taRightJustify
        DataField = 'TW_SUMMD'
        DataPipeline = PipRealiz
        DisplayFormat = '#0.00'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 148696
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object ppDBMemo10: TppDBMemo
        UserName = 'DBMemo5'
        CharWrap = False
        DataField = 'SKL_SHORT'
        DataPipeline = PipRealiz
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 165100
        mmTop = 0
        mmWidth = 25135
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText26: TppDBText
        UserName = 'DBText16'
        Alignment = taRightJustify
        DataField = 'REAL_KURS'
        DataPipeline = PipRealiz
        DisplayFormat = '#0.00 '
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 191030
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBMemo11: TppDBMemo
        UserName = 'DBMemo7'
        CharWrap = False
        DataField = 'REALVID_NAM'
        DataPipeline = PipRealiz
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3175
        mmLeft = 208757
        mmTop = 0
        mmWidth = 27252
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Pen.Color = clGray
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 0
        mmWidth = 266701
        BandType = 4
      end
    end
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 266171
        BandType = 7
      end
      object ppImage6: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = True
        Stretch = True
        Picture.Data = {
          07544269746D617066490000424D664900000000000036010000280000004F01
          0000370000000100080000000000304800000000000000000000400000004000
          0000000000000000800000800000008080008000000080008000808000008080
          8000040404008484840044444400C4C4C40024242400A4A4A40064646400E4E4
          E400141414009494940054545400D4D4D40034343400B4B4B40074747400F4F4
          F4000C0C0C008C8C8C004C4C4C00CCCCCC002C2C2C00ACACAC006C6C6C00ECEC
          EC001C1C1C009C9C9C005C5C5C00DCDCDC003C3C3C00BCBCBC007C7C7C00FCFC
          FC00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272723231F27132727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727270B0B250D272727272727272727272727272727272727272727
          272727272727272727272727272727271F250B15272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2700272727270A0A0A0A0A0A0A0A1A1A1A1A1A1A1A1A0A1A1A1A121A190E0D27
          232727272727272727272727261A1A1A1A1A1A1A1A1A121A121212121212121A
          1A1A1A1A1A1A1A0A1A0A0A0A0A0A1A1127272727272727272727272727272727
          272713220C20201C242414141C0C0C20101C272727272727272727272727271D
          1A1A1212121A1A1A1A1A1A1A1A1A0A24240A1A0A1A1C0A121212221222121212
          121212121A2627272727272727272727272727272727121A220E262727271B22
          121212121212121212121A1A1A12122727272727272727272727272727272727
          24161E1A272727272712121212122222222222221212121212121A1A1A1A1A0A
          1A1A1A1A1A1A1A0A141C0C2027270A0E22220E22222222121222121212121212
          1A1A0A0A0A0D27272727272714141C0C0C200C200C0C200C0C0C202727272727
          27272727272727272727272727272727270027272727201C1C0C1414141C1414
          14240A1A0A0A0A0A24141C1C240C0C0C2010182627272727272727271C1C1414
          1414141414242424240A24240A1216161626092626161E0E221212122222141E
          27272727272727272727272727272727120C2421230B1D090919261E0E1E2611
          0916140C1012172727272727272727261A122226110909090926161E0E0E1E16
          19212111191C241E1E220E19110D1D150D110926161427272727272727272727
          27272727270B261616222627272725221E26151B0B2515151D21191111211E27
          2727272727272727272727272727271419121A1A27272727270A21131B0B0B0B
          251D0D0D1D1D250B1B1B1B252525251515151D21210D1D15150B1B2027270C09
          1F1F0F231B1B1B1B0F1F17170F2313131B2525151419272727272727220D2121
          0D25231B1F0B0D1D151D0C272727272727272727272727272727272727272727
          2700272727270C1A2020202020202020202020200C0C1C140C0C201C1C0E1919
          1E1E141010101727272727271C2420202020200C0C0C0C1C241C0C0C14241414
          14141A1E11111111191622121A1A1A1A2727272727272727272727272727250C
          092624121121110D1D1525250D111119261622220D220C200E17272727272726
          140C0C1C1C140A221E0919260E2212221E2626161E0C1C0A222616160921160E
          220E12121E1427272727272727272727272727270F22261E1A221E2727271514
          0E1E1926121222121222221E2619122727272727272727272727272727271A09
          0E220A1A2727272727101212221E1E1E161609190D15150D111919191111191E
          121A0A1A0A0A0A1A1A1A110C15270C14122222221E2619191111211919262616
          161619252419272727272714122424240A0A161A221909161E250C2727272727
          272727272727272727272727272727272700272727270C240C0C202020202020
          202020202024141C242020200C1C2014221E1E111A0C201C272727270C140C0C
          202020200C0C1C0C0C0C0C14200C0A1E11111A1C14241A0E16221A0A0A0A2424
          272727272727272727272727271C1E0D12120916091527271B2327232527271B
          0909090D1D0D161D14140A2727272716140E192123190E1A0A1A1A121212220E
          0E26091612221C0A160916151B130F1F0F261626221C27272727272727272727
          272727271419190922120E2727270D0C12112127272727272727271B1B1D0927
          272727272727272727272727272316261A1C0A0A2727272727101E2621091725
          25250D110916160E22221E0911161E0E120E1E121A1A1A2222120D0C16270C1C
          19251125272727272727271F0D26221216261926091927272727261C24141C14
          14140A1A2209090E09260E272727272727272727272727272727272727272727
          2700272727272222241C0C1010101010101020200C0C0D0F09240C141420200C
          240A201C221624202427272712220A140C1020200C20200C0C140C1411221F27
          2727170F260A0D0B1E1C1C141412240A27272727272727272727270D121D1A22
          220C2221230E2727151E221A1A0A0E1A1A240A0A0A0E2125131A242727272726
          16221224141424260A0A1A122222221A0E270E1A1A141E221A240A0A220B1723
          26270D161E0A2727272727272727272727272724251909092212122727270D26
          161E1212110B1F1B25170D27111E0E27272727272727272727272727271E1626
          0A1C1A242727272727091D111526221B0E26111D25251D091611162727272727
          272709260E161511221A1A1414270C0B251B2727161F0B150D0D2111260E1211
          27172715261127272727120E241C1C140A241A0E110E22261F0D0E2727272727
          2727272727272727272727272727272727002727272727271327130810101010
          202020200C142427240C1C1020141C20200C190A0C22161E0C0C27271F131323
          1F20100C20200C200C0C141A112712240A0A0A14141C0C142127111A1A121A1A
          0F272727272727272727241E091624240C09151B09272626250F130F23261C18
          0A14241A0A0A0E11091A24272727271F2323230F1C141D1D12121A0A12091519
          1921270F0F1F2713131C2012241E1A0B251D1F0F0F0F27272727272727272727
          2727091D1922161E22121A2727272727231709201C2626262125221B1F1F1F27
          272727272727272727272727240E091612241A1427272727270F0F1F0F091024
          22220E1E0E120A0A1E220E1612121226221E0D172712241E0E0A0A1220272727
          2323131C1409220E1E0E12121211251419272317272727272724121424141C1C
          242422161E0A1D241D2727272727272727272727272727272727272727272727
          2700272727272727272727101C0C1020202020200C1C0A122727272518100C1C
          10200A2124240A1A220C2227272727272726201C200C0C0C0C0C0C1A0A222727
          2727272727231620200C271D1A141E0A0D272727272727272724261216141C0C
          121D231E270D1F272727272727270B0C210A24140A1A0A0A1612142727272727
          272727270F0C211522121A1A2219151E14272727272727272727080C0C1A241E
          1A272727272727272727272727272727271716260916121A0E120A2727272727
          27272721100A1A0A22191327272727272727272727272727272727140E161A12
          0E0E1A142727272727272727272718140E1E2609090E221E110A262727272727
          27270D14221B19140E0A0A1E2027272727272716201A121E26160E0E220D0D1C
          2727272727272727121C121E0A24141C240A0E16121E24272727272727272727
          272727272727272727272727272727272700272727272727272727201C0C1020
          101020200C0C1A24272727272718201C10202426120A1A0A0A12142727272727
          27191C142020200C1C0C0A240A0A2727272727272727272721182017151C0A24
          1E27272727272727241D220E140C0C0C1523242723272727272727272727250C
          13111A240A1A0A14242224272727272727272727270C1A26121A0A0A0A0A0A1A
          1427272727272727272720201C091A241E272727272727272727272727272727
          171A09272321222412120A27272727272727272710140A1A1E14272727272727
          27272727272727272727191E090A24241E260A1427272727272727272727180C
          2212220E0E1A24241E1416272727272727272727171C141214220A2220272727
          2727271D201A220E1E0E240A0A220D0C27272727272727271A0E26111A0A2412
          0A140E091A0E2527272727272727272727272727272727272727272727272727
          27002727272727272727271C140C1010202020201C1C0A14272727272727181C
          14201C161A14141A1A161C0A2727272727191C1C202020201C201A0A1A242727
          272727272727272727271820270E0A140A2727272727270E091A0E1C201A0C0A
          1309111927272727272727272727150C171D260E221A0A0A0A1E242727272727
          27272727170C0C0A2414240A0A1A0A121C2727272727272727270C200C260A24
          222727272727272727272727272727271C152727170B0D09161A0A2727272727
          27272727181C0E120E1C272727272727272727272727272727270E161E121A12
          16160A1C27272727272727272727180C14240A1222120A0A1A140E2727272727
          2727272727270C1A0E2422220C2727272727271510140E1E09090E0A0A1A120C
          272727272727272222110909120A0A220A1416121D1227272727272727272727
          2727272727272727272727272727272727002727272727272727271C1C0C1020
          101020201C0C2414272727272727201024200C24121414240A1A0A1427272727
          2719200C202020201C2014121A24272727271B1B1B1B15272727271812132624
          1427272727271516221E0A20140C1C0D1B1A1D2727272727272727272727150C
          170F2119091919190E0924272727272727272727170C1C0E141414240A1A1A0E
          1C2727272727272727270C0C0C21090A1E272727272727272727272727272712
          1B1B271F131313230F1A24272727272727272727180C1D09261C272727272727
          272727272727272727121E0B0D19091921090A1C27272727272727272727180C
          12221E191119221A0A14222727270F1B1B1B1B272727271C1A1D1A121C1B2727
          2727270F1014111111091119261E0A0C27272727272724142113150D220A121A
          1216240914272727272727272727272727272727272727272727272727272727
          27002727272727272727271C141C1010202020201C0C24142727272727271120
          242020140E1111090916220A152727272709201C0C100C200C201C0E1A242727
          27271C0A1214122727272716102717221427272727270C160E120C1A240C2123
          1B22262727272727272727272727152027170F0F1B1D11191911242727272727
          272727271F0C141E141C14240A1212121C2727272727272727270C20241F250A
          1E272727272727272727272727271311121D2111091919210B12242727272727
          2727272718142717261C27272727272727272727272727271C0E1B1B1B130F0F
          0F250A1C27272727272727272727080C150D1D1D150D21191E14122727271612
          191610272727271C0C1A2422140927272727270F100A2317170D0E0E1E260E0C
          27272727271F240D090E19111E1E120A161A121A232727272727272727272727
          2727272727272727272727272727272727002727272727272727270C14242020
          101020201C0C24242727272727271F201C0C1426132727272323122426272727
          2709100A1C20200C1C0C14090A24272727171C220E1C1A2727272727181F2709
          14272727270E120A1E1C24120C16230F1E221327272727272727272727271520
          272727272727271B1611242727272727272727271F0C0C0E1E261E1626092612
          142727272727272727270C0C19270F241E272727272727272727272727270E0E
          1521110909091919111A24272727272727272727182427270D1C272727272727
          27272727272727121E1E0926190D1B1727271A1C27272727272727272727180C
          2727272715190909151412272727141A241D10272727272710140B090A0A2727
          2727271F100E272727271E2412160E0C27272727270E0E1D15262222240A2212
          221A151E27272727272727272727272727272727272727272727272727272727
          27002727272727272727270C141A201010202020140C140A2727272727271320
          0A121D27272727272727091A1E2727272719201A0C1C0C0C24201A110A0A2727
          27211422260A1A272727272726260F0E2427272727200A1E121416190A0B2313
          261A272727272727272727272727152027272727272727272726142727272727
          272727271F0C1A21230F1B15151D1E1A142727272727272727270C200F272724
          0E27272727272727272727271714211D0D212121210D250B1B1A242727272727
          27272727181A27270F14272727272727272727272727131E1209190909191121
          15271A1C27272727272727272727181C2727272727252609191412272727200A
          111E1027272727270E0C0A1F110C27272727271710221727272727271D111A1C
          2727272724242121191116220A240A0922151427272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1C221020
          202020201A1C240A2727272727270F0C1E1E2727272727272727170B16272727
          27192022200A0A14220C11150A0A2727271A1215211A1A2727272727270C2722
          141D272722140A0E1A1226150B0F131B230A2727272727272727272727271D20
          27272727272727272719142727272727272727271F0C1B272727272727272722
          242727272727272727270C202727270A0E27272727272727272727271C1B111B
          0F171F1F0B1B1D0D0D1A14272727272727272727181E27272714272727272727
          2727272727271E220D0D0D250B0B0B1B1D21121C27272727272727272727080C
          2727272727272719261412272727181C0E1E1027272727272710222323202727
          27272717100E172727272727270D121C2727270D24161626262619190B1D0D1D
          09141F2727272727272727272727272727272727272727272727272727272727
          27002727272727272727270C1C0E20202020200C1624140A2727272727271524
          271D2727272727272727151D212727272709200E201C161E211C15231A0A2727
          271C0E2713220A2727272727270C12241C26272710241E1A0A1611220F17130F
          23262727272727272727272727271514272727272727272727211C2727272727
          272727271F0C27272727272727272719142727272727272727270C0C27272724
          0E27272727272727272727090B1D272723250D11090909092612142727272727
          2727272718192727271C272727272727272727271724161F0F0B250D21211921
          1325121C27272727272727272727181C272727272727271F1924122727270C1E
          09222027272727272720210A1D2427272727271710212727272727272727161C
          2727270E22150D0D1523130B1327272719112727272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1C222020
          2010200C090A140A2727272727270E0A27272727272727272727261E1B272727
          2709200E0C141E19270A13230A0A272727100E2727220A2727272727270A121A
          140A272720241224121927111F232313151D272727272727271D0F2327210C1A
          27272727170F1B1D21210C20210B1B13272727271F0C27272727272727272715
          142727272727272727271C20272727240E27272727272727272717111D272727
          272727231B0B1D11191214272727272727272727182127272714272727272727
          272727271C090D1109090926262626261113121C272727272727272727271814
          27272727272727272724122727151227250A20272727272727261A13231D2727
          27272717101B2727272727272727231C27270A142727272727272727271F2715
          2427272727272727272727272727272727272727272727272727272727272727
          27002727272727272727270C140E20201020200C1112240A2727272727271C1A
          1527272727272727270E1E1E272727272709201E1A24121627211713140A2727
          0D240B2727220A272727272727131717171F27250C1A1A1C2226270D1F232323
          2627272727272727271C140A241E191212120E0E0E162609262624261A0A240A
          272727271F0C27272727272727272727142727272727272727271C1C2727270A
          0E272727272727272727220B2727272727272727272727272712142727272727
          27272727100D2727271427272727272727272711091727271723232521190909
          11210A1C272727272727272727271824272727272727272727241227271C1227
          0F0E202727272727272723131B1B27272727271710232727272727272727171C
          2709242727272727272727272727271427272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1C0E2020
          20202020260E0A0A272727272715121727272727272727270D11271B27272727
          27090C160A141C14271727270A0A27151E15272727160A272727272727272727
          272727141A1E141C2616270D0F230F230A27272727272727271C0D2727272727
          27272727272727272727272727272724272727271F1C27272727272727272727
          142727272727272727271C1A272727220E27272727272727270C272727272727
          2727272727272727270A24272727272727272727100D27272724272727272727
          27271419272727272727272727271B192127241C27272727272727272727101A
          2727272727272727270A22270E14272727272027272727272727272727272727
          2727271F101327272727272727271B120E24170F1B150D0B2727272727271427
          2727272727272727272727272727272727272727272727272727272727272727
          2700272727272727272727201C1E2020202020200E1E0A0A27271727160C2711
          2727272727272727272719272727272727090C1E0A140C0C111527270E0E241C
          1F27272727190A2727272727272727272727272012120C0C1E092311230F1F13
          1427272727272727271C14220E16111119211D150B0B231F0F0B25150B151224
          272727271F1C27272727272727272727142727272727272727271C0A2727270E
          1E27272727272727162327272727272727272727231527272724142727272727
          27272727182127272724272727272727272519272727272727272727271D090A
          09130A1C27272727272727272727181227272727272727272712140C1E211F27
          272720272727272727272727272727272727271F1013272727272727270B211D
          261B0B0D191E1E191D27272727240F2727272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1A0E2020
          202020201A220C180C20200C0E0F272727272727272719272713272727272727
          2719141E24140C0C160927271E0C0D271727272727190A272727272727272727
          272727101A12200C22192109230F1F131427272727272727270E2222220E0E0E
          22121A1A1A1A221E0E0E22121A121A0A272727271F2427272727272727272727
          142727272727272727271C0A2727270E1E272727272727131D1F272727272727
          27270B1121141D2717141427272727272727272710192727270A272727272727
          27262727272727272727271509261A0E1E191A1C272727272727272727270822
          2727272727272727270D272725231F0F231F2027272727272727272727272727
          2727271F201B27272727271F211E16111A261E121A0A121E21131F0F0A242727
          2727272727272727272727272727272727272727272727272727272727272727
          270027272727272727272720120E20101010202020241C202226162717132727
          27272727251D2723152727272727272727110A1E240A220E1E1E232627272727
          27272727270F0A272727272727272727272727101A0A200C1A0926260F0F0F15
          1427272727272727272727272727272727272727272727272727272727272727
          2727272717122727272727272727271F142727272727272727271C1A27272716
          1E2727272727130E27272727272727170B0D1121260C091D0914142727272727
          27272727101E2727271A27272727271F1A23272727272727270D09262616231E
          1A1A221C272727272727272727271822272727272727272727272727130D261E
          0E211A272727272727272727272727272727271F1C1527272727270B26121A0E
          0A0A0A1A241A12260D230F232719141027272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727272012221010
          2014241A221E1A24190A11272727272727272716270D22252727272727272727
          27110A22241A0E22151E271F112523272727272727131A272727272727272727
          272727201424200C240E0E26130F0F151C272727272727272727272727272727
          27272727272727272727272727272727272727271F12272727272727270F2525
          14272727272727272727141A272727090E272727271F1C27272727270F0B250B
          2525151D271C16160A0A2427272727272727272710122727271A272727272714
          15272727170B11091E16262626092026141C161C27272727272727272727081A
          27272727232509161E1E0E22221212121A091627272727272727272727272727
          2727271F14191F1D261E0E0A141414220E26112224141414142426130B27270E
          1A13272727272727272727272727272727272727272727272727272727272727
          27002727272727272727272012122020100C1C0A0A2414202220241F27272727
          2727170F1C1C1927272727272727272727110A1A0A120E22250E1F151B232116
          16110B2727130A2727272727272727272727270C0C0A0C0C0C12121123230F1D
          1427272727272727272727272727272727272727272727272727272727272727
          2727272717122727272727272723211D142727272727272727271C2427272711
          1E272727271C272727271713251525230F231B271614220A1C1A242727272727
          27272727101A2727271A272727271F1D2727271D0E0A0A221E162626221E1826
          0C1C091C2727272727272727272708242727270F0B1D16222212270B1E0A0A0A
          240919272727272727272727272727272727271F1C26271F0B2121111111240E
          2727272727272721220A1C1C090B2327191C2727272727272727272727272727
          2727272727272727272727272727272727002727272727272727272012122020
          20200C201A1C171C0C1422240E0A1E15172713130F0E0C182727272727272727
          270D0A0A240C20201214252619140C201A16092527250A272727272727272727
          2727271A2012200C201A1A261313131514272727272727272727272727272727
          2727272727272727272727272727272727272727171A272727272727271F1D15
          242727272727272727271C14272727150E272727190F1F272727231B25150B0F
          1F13270B121C0A1C1C1624272727272727272727101A27270F1A2727271F1C27
          2725161A2414141A1E1626160B23180E1C1C211C27272727272727272727181C
          27272717171F1B21191C1A26270B192224091E27272727272727272727272727
          2727271F142225150D1926091911241A171B0B21121621271B260E241C091B27
          27220C2727272727272727272727272727272727272727272727272727272727
          27002727272727272727270C121A1020101020201A1C1D14121C0C2020121116
          21172727131B0D0C1C27272727272727271D24240A202020120C160E190A1F20
          101216090D0D0A2727272727272727272727270E200E0C0C2014120E0B25151D
          1427272727272727272727272727272727272727272727272727272727272727
          272727271712171F132727270F1F0B2514272727272727272727141C2727270B
          1E272713090F0F0F230F0B1D0D211D1B232721271A140A0C1415242727272727
          27272727101A27270B1A272727242315211916221A0A0A12161619271B271812
          1C0C211C27272727272727272727180C131511191D251D19111C221E141E0E24
          1C090A272727272727272727272727272727271F1C1A2111260E120E16262414
          272727272727140A2719091A1C140B132727240A272727272727272727272727
          27272727272727272727272727272727270027272727272727272720220A1020
          1010200C121C261A2727271518101C191E260D1B0F2325250C0E272727272727
          270D2424240C202012201A1A262427270820161E16110A272727272727272727
          272727152016200C201C1A221921110D14272727272727272727272727272727
          27272727272727272727272727272727272727271712190919251B1D0D0B0B0D
          14272727272727272727140C2717171B1E271F14271B1B1B1B1519090909111D
          270B1F271224120C141514272727272727272727100A17271D1A272721212121
          0D2111260E1A1A12160927152727181A1C0C1D1C27272727272727272727180C
          21090E2216261E12161C0E270E0C12241C091427272727272727272727272727
          2727271F1C240926262214142424241C27272727272727202409160E1214250F
          270F0D0C27272727272727272727272727272727272727272727272727272727
          2700272727272727272727200E14102010102020121C0E1A272727272710100A
          091E1E161E152521141427272727272727112414141C20201A20140A1E242727
          112022161E111A27272727272727272727272727101A240C20201A1E22220E16
          141D27272727272727272727272727272727272727270B220E0E262727272727
          2727272717120A1A1A220E221E190D2614272727272727272727140C23151513
          1E270C27231B2511261E1E161626090B272527271A0A120C2425242727272727
          27272727100A0D1F211A27251E1511210D0D2126162212121E2321272727180A
          1C0C0B1427272727272727272727180C0E120A1A1E260E1A0E240E2727182412
          1C090C272727272727272727272727272727271F1414220E161E141C141C1214
          272727272727271F20262609260E260F1F171F21212727272727272727272727
          272727272727272727272727272727272700272727272727272727200E0C1020
          102020201214220A272727272727181C11221A0A2422190909141A2727272727
          2719241C1C140C201A201C241624272727180A0E0E091A272727210C0C202227
          27272727100C121C0C201A0E24140A1A141E2727272727272727272727272727
          2727272727270A1927211A27272727272727272717121C1C141414140A0E2622
          14272727272727272727140C190E26130E12271325090E1A0A1A220E0E1E2627
          25272727120A221C241B2427272727272727272718240E1D191A0F140F092609
          11212119260E22221B1117272727180A1C0C1B1427272727272727272727181C
          0A24240A1E092612220A0E2727241C1C14261C272727270C1C0C141F27272727
          2727271F141C0A121E1E24141C140E1A2727272727272727180E192616121613
          0F0D17231C272727272727272727272727272727272727272727272727272727
          270027272727272727272720220C10102020202012140E0A2727272727271420
          220A1C0C0C1C1414241A1C27272727272719241C0C240C0C0A200C1C260A2727
          27100C1A1A211A272727241527221A27272727271E0C0E240C201A241A1C1C24
          0A1C27272727272727272727272727272727272727270C272222242727272727
          27272727171A0C0C0C0C0C0C1C0A1E1A1427272727272727272714201A1A1A23
          0E271D1922241414241A22220E1E271127272727220A0E1C2413242727272727
          2727272718141A16161A0C271E22221E0911211109160E0B171B27272727180A
          1C0C1D1427272727272727272727181C1424240A1619091E2212222727230C0C
          141E0A27272727121B270C1F2727272727272717241C140A0E1E0A1414142622
          272727272727272718121116160E220D0F1227150C2727272727272727272711
          1C1615130D190A141F2727272727272727002727272727272727272012201010
          101020201A141E0A2727272727271D10141C2020202020202011242727272727
          2709240C200A1C200A0C200C192427272712201424150A272727102709141A27
          27272727270C0A0A140C0A200A240C1C1E0C2727272727272727272727272727
          272727272726191D1E122427272727272727272717240C1C0C0C1C1C1C140E0A
          1427272727272727272714201C1424231E0D12241C1C1C14241A12220E270F27
          272727270E0A22140A1D242727272727272727271814141A220A27120A0A0A22
          1E0911210916192725272727272718241C0C091427272727272727272727180C
          2424241A1611111612220E2727271814241E1A2727270F141426201F27272727
          2727271F141C140A0E161A241424160927272727272727271C0A11160E1A1216
          0B1A1F110C272727272727272727241609191119221A14161D0C272727272727
          2700272727272727272727201A0C101010100C201A1C16242727272727270B20
          241C202020200C2020241A132727272727260A1C200A14200A0C0C0C11242727
          27161C0A24130A27272710121C140A2727272727271420220A141420140A140C
          0914232727272727272727272727272727272727270C271E0E1A242727272727
          2727272717140C0C0C0C1C0C1C14222414272727272727272727240C1C1C1C26
          27141C1C1C1C1C14240A122227271B2727272727222412240A21142727272727
          27272727101C1C141A0F0A14141424120E1619190916270D2727272727271814
          1C0C1E1427272727272727272727180C240A0A1A162121160A0E222727270816
          140E222727270E2114220A1F272727272727271F140C14242216122424242419
          27272727272727272414091E120A120E250A211A0C2727272727272709221A15
          26161F27271F1E2319110E09272727272700272727272727272727200A0C1020
          202020200A1C1E242727272727271320140C202020202020201C1A2327272727
          2726240C0C0A1420240C200C0D2427272715140D260F242727260A140C122427
          27272727272718142414240C1A0C24140A241A27272727272727272727272727
          27272727112616120E122427272727272727272717140C0C1C0C1C0C1C1C1214
          14272727272727272727240C0C0C1C0F1C1C1C1C1C1C1C1C240A121727252727
          2727272712141A0A0A2624272727272727272727101C1C1C0A221C141414140A
          121E260926270F272727272727271814141C121C27272727272727272727180C
          0A1A0A1A1E1111160A22222727271023191D112727271426141A091F27272727
          2727271F1C0C142412260E0A240A14162727272727272727200C260E24241222
          0D241A24142727272727272212232123161B2727170D1A2723271D250E272727
          27002727272727272727272024201020200C2020241C0D242727272727271120
          0C0C202020200C2020141227272727272726240C0C241420141C0C20110A2727
          27270E161E122427272019140C2624272727272727271A20221C14121C0C0C14
          1C0E2427272727272727272727272727272727230C270A24220A242727272727
          27272727271C0C0C0C0C0C0C1C1C1A1414272727272727272727240C0C0C0C1C
          0C0C0C1C1C1C1C1C140A11271527272727272727121C0A1A0A0E142727272727
          27272727100C1C1C141C1C14141C1424120E1609271B1F27272727272727180C
          140C0A1C27272727272727272727180C0A0A1A121E111116240E122727272011
          1D252627271F201C140A0D1F272727272727271F1C0C14241A161E1A1A1A1C1A
          2727272727272727180C162214240A1A191A1414142727272727150A271D191D
          151D1D211127091E20232323161D272727002727272727272727271024202010
          20202020240C0D24272727272727142614202020202020201416122727272727
          2716140C0C141C201C0C2020090A272727271B131313132721241E0C0C220A27
          27272727272727180C240C1424240C0C1C091C24272727272727272727272727
          2727271A271A1C24222424272727272727272727271C0C20200C0C0C0C1C0A14
          14272727272727272727241C1C1C1C1C0C0C0C0C0C0C1C140A12271F27272727
          27272727120C241A0A2214272727272727272727200C1C1C1C1C14141424241A
          120E160F0F252727272727272727180C140C1A1C27272727272727272727180C
          0A1A1A120E091116242222272727270F0F0F0F27271D141C1424221F27272727
          2727271F0C0C14141A1616121A1A141C272727272727272718261A0A140A1A1A
          220A1A241D27272727271C2727271F150D0D152509242619160E1E0F1A242727
          2700272727272727272727201420201020102020141C0E0A2727272727170C0B
          122020102020202012272227272727272716140C0C141C0C0C0C2020160A2727
          272727272727270B200F240C20240A27272727272727272718140C0C0C0A140C
          0C0C092023272727272727272727272727270E251E1C1C2412140A2727272727
          272727271B0C0C20200C0C0C0C1C241C142727272727272727270A1C0C1C0C0C
          1C0C0C0C0C1C1C241A250F2727272727272727271A200A1224221C2727272727
          27272727201C1C141C1C1C1C1C24241A121E21271D272727272727272727100C
          141C0A0C27272727272727272727180C0A0A1A120E09191E2422122727272727
          272727271312122424240A1F2727272727272715200C14141A1E09221A1A240C
          27272727272727231C192414141A0A1A12141A24272727272720131F0E27270E
          1E16160F1F26272727271B27170B0A27270027272727272727272720140C1010
          10102020141C1A1A2727272709200D09202020202020201C2709272727272727
          2719200C200C0C1C0C1C0C200E0A2727272727131B151C0909240C0C0C140A27
          272727272727272727180C1A1C0C1C1C0C1C0C0D0C2427272727272727272727
          1524231A1C0C1C141A1C242727272727272727271B0C0C0C0C0C0C1C1C1C1414
          2427272727272727272724141C0C0C0C0C0C0C0C1C1C0A1A2709272727272727
          27272727101C1A12141E0C2727272727272727270C1C141C1C1C0C1C240A0A0A
          221F131527272727272727272723100A1C0C1A0C27272727272727272727180C
          0A1A1A1A1216090E0A0E12272727271B1B21142417141A241A240C0F27272727
          27272715101C14241A1E191E1A0A1610272727272727212226141414121A2424
          0A16111727272727171427122727141612160F1B0A130F27271A270C21171E27
          2700272727272727272727200A0C2020102020201C240A2627160E200C092620
          10101020200C0C2727152727272727272724141C201C1C1C20140C2022102020
          10200C0C1C1D09091C0C200C1C241A272727272727272727272710200E1C140C
          0C0C0C0C210C101D272727272727231E1C27141C1C1C1C142414242727272727
          2727272709140C0C0C0C0C1C0C1C1424140D27272727272727111C091C0C0C0C
          0C1C1C1C1C240A23231B27272727272727272725141A2222141C1C1C27272727
          2727172216241C1C1C0C1C14240A0A12092715272727272727272727271D1222
          1C0C0A0A20272727272727272727100C1A1A0A1A2226091E241614140C0C1C24
          1A2527121A1A0A1A14240A0F2727272727272719101C24241216191E121A1110
          1B1B1126140C091914140A1A0E24242422272527272727271023211A27271E1A
          241A0F14091E0D271127271F1A1D1D16270027272727091A1224202009201020
          101020200C0A1A0820141A26191410202020200C1C0A2727112727271E12120E
          1C20111C1C1C20202014200C200C1426161616260E0A1C0C200C1C1414161A27
          2727272727272727272727240C0E1C120C0C0C0C201A1E0C2010120A1C100C0B
          111A141C1C1C1C1424120A272727270E2222221A1C1E0C0C0C0C1C1C1C14141A
          12201C220E0C22121C1A151C1C0C0C0C0C0C0C140A141E27152727272727271A
          0E221C14271609220A24191C0C0C181E160C1C251E242414141414240A1A1A22
          270F2727272727271B1E12141C0D1E0A1C1C241D0A20140C1C220E221E141912
          0A1A0A1A1A120E1E160F0F130B151D21121A121A0A121E241414121F27270A22
          0E1E1C140E0A1A0E0911260E121A21252619090B1B260A121A0A121614141426
          27262727272727271409161A27271E2414141314240A1B271E27272714111F14
          27002727272710121A20201C1420201C1C0C2010100C200C2616141010200C1C
          0C20200C17230921272727270C0A220C201E221A240C201C0A1A24201C1C0C0C
          0C2020202020200C1C142424240F0A27272727272727272727272727220C141E
          1E1A1A1C0C0C0C0E1B231D0B1509190A0C1C142327270C0A0A220A2727272712
          0E111926091A0A0A0A0A0A0A1A121A0A220D15152624140B11191C1C0C0C0C0C
          0C140A141C142721272727272727271027171F132619090E1A0A242619211E0C
          0F0F1D0A1C141414140A1A120A1414271617272727272727130E271F131A241C
          1C141C1411152317140A231F170F0A14240A220E1E2609091119261E1A24141C
          1C1C1C0A2216161414141E0F27271C1E2727271D1E161E1E1E160926160E1911
          0916221A0A0E0909161A24140A1A27150D272727272727271424120927271E14
          14141F0A14142319272727270C21171A270027272727200A2010102020202020
          0C1C241C1C0A091A151512121A1A161E21231F1722220B27272727271C241C20
          200C1C1C201C201C200C090C20200C0C1C1C1C1C14141C1C0C20202020271A27
          272727272727272727272727272324141E09121A12121A1C0C2020200C0C0C0C
          14272721121C0A121A190A27272727120A141C0C1C1414141414140C1C1C1C14
          140A1A220E20201C0C0C1C1C14242424141C0C0C1C270E1B2727272727272710
          2422220E1609190916121A0A0A1A1C101C1C1C1C1C140A24141C1C1C1C1C0A16
          1B2727272727272713201A161E221A241414241A22161A0A0C100A0A0A0A1A12
          220E0E221E2611211D151D0D11092626161616161E120A1C14241D0F27271C14
          1A0E1E1E1E1E0E1626091111210D211926221A0A24141414141A160B271F1E0B
          272727272727272714242411272716141414150A141A0F27242727270C1B2726
          2700272727270C0A1020202010202020200C0C0C0C24120D2727251513231526
          1622240A1D1B2727272727271C240C202020200C0C241414140A151B27272727
          27272727272727272727272727270A272727272727272727272727272727270B
          0C241A2527231515210D211D151B2727271622190B1318260A0F0A2727272712
          1A0A22191D27272727272727272727272727272727151C0A0A1E252727272727
          2727272727221D2727272727272727202727272727272727272727271F230B20
          12191B272727272727272727272727252727272727272727131C272727272727
          2727170F23250B1F160C251F2727272727272727272727272727272727272727
          27271F0F1F13251B13271F1F27271C0C27272727272727272727272727272727
          272727271727172727171F270D15272727272727272727271C1A142627271624
          1414111A2709162727222727101D272427002727272722220A0A0A0A0A0A0A0A
          0A0A0A1A0A0A0A0A0A0A0A240A1A1A12261D25272727272727272727121E1212
          12222222222212121A1A1A1A0A0A0A240A1A120E0E2222121A1A0A2424241A27
          2727272727272727272727272727272727151A1C0A1222261B25150D0D1E0A1A
          261527272727081B272724272727272216220E0E160909090926160E22221222
          2222121A0A1422161E0E220E0E0E0E0E220E222222192727272727272727270A
          0E22222222220E0E0E0E0E0E1E0E2422260919111909161616161E0E0E222227
          2727272727272727131E162616161616162626090909091922261D1D0D211111
          191921210D21211111211111112111210D0D1D0D0D0D0D1D1D1D190F27271C25
          151D1D1D250B0B0B152515151D1D1D0D0D0D0D0D0D2119261119251B27272727
          27272727272727271412241C27272624141C210F140D261D272227271009270A
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          27272727230B11090E1E1E26161D252727272727272711111121112727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          27272727272727272727272727272727272727272727272710240A1227272624
          141C090F26092621271627272417171527002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727272711241A0A162724141414220F19112621231427121D1F2427
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272714220A22241214
          141C111222241A26160F271C15111A2727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727271212160D1224141424240A221609272527142219222727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          27272727272727272727272727272727272727272727272727271C250A1A120B
          151D151D0D112527270A1A19121D272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727121B24091419272727272727241E0A160E1E272727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272722272422
          1B110A14240E1124121A091E2727272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727272727272727270A0F1E240A121E262624242213132727272727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727271716
          272713251D13270B112727272727272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727152119112327272727272727272727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727272727272727272727272700}
        mmHeight = 2910
        mmLeft = 222780
        mmTop = 1852
        mmWidth = 16404
        BandType = 7
      end
      object ppLabel104: TppLabel
        UserName = 'Label24'
        Caption = 'Система "Арм-Склад" версия'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 4
        Font.Style = []
        Transparent = True
        mmHeight = 1588
        mmLeft = 239713
        mmTop = 1323
        mmWidth = 18785
        BandType = 7
      end
      object ppLabel105: TppLabel
        UserName = 'Label201'
        Caption = 'Бритвин Сергей beginner@inbox.ru'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 4
        Font.Style = []
        Transparent = True
        mmHeight = 1588
        mmLeft = 239978
        mmTop = 3175
        mmWidth = 22490
        BandType = 7
      end
      object PpRealizVers: TppLabel
        UserName = 'PpRemonVers'
        Caption = '3.1.01'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 4
        Font.Style = []
        Transparent = True
        mmHeight = 1588
        mmLeft = 261409
        mmTop = 1323
        mmWidth = 3704
        BandType = 7
      end
      object ppLabel107: TppLabel
        UserName = 'Label65'
        Caption = 'Итого :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 794
        mmWidth = 10054
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc1'
        Alignment = taRightJustify
        DataField = 'TW_SUMM'
        DataPipeline = PipRealiz
        DisplayFormat = '#0.00'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 130969
        mmTop = 1058
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc2'
        Alignment = taRightJustify
        DataField = 'TW_SUMMD'
        DataPipeline = PipRealiz
        DisplayFormat = '#0.00'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 148696
        mmTop = 1058
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc3'
        Alignment = taRightJustify
        DataField = 'TW_KOL'
        DataPipeline = PipRealiz
        DisplayFormat = '#0.0000'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 84931
        mmTop = 1058
        mmWidth = 17198
        BandType = 7
      end
    end
  end
  object PipRealiz: TppDBPipeline
    DataSource = DataModule2.DsQuery_Realiz
    UserName = 'PipRealiz'
    Left = 432
    Top = 311
    object PipRealizppField1: TppField
      FieldAlias = 'REAL_ID'
      FieldName = 'REAL_ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PipRealizppField2: TppField
      FieldAlias = 'REAL_NUM_FULL'
      FieldName = 'REAL_NUM_FULL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PipRealizppField3: TppField
      FieldAlias = 'REAL_DATE'
      FieldName = 'REAL_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PipRealizppField4: TppField
      FieldAlias = 'SKL_SHORT'
      FieldName = 'SKL_SHORT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PipRealizppField5: TppField
      FieldAlias = 'REAL_COLOR'
      FieldName = 'REAL_COLOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PipRealizppField6: TppField
      FieldAlias = 'US_FULL'
      FieldName = 'US_FULL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PipRealizppField7: TppField
      FieldAlias = 'REALVID_NAM'
      FieldName = 'REALVID_NAM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PipRealizppField8: TppField
      FieldAlias = 'KLN_ORG'
      FieldName = 'KLN_ORG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PipRealizppField9: TppField
      FieldAlias = 'REAL_KURS'
      FieldName = 'REAL_KURS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PipRealizppField10: TppField
      FieldAlias = 'KLN_PREFIX'
      FieldName = 'KLN_PREFIX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object PipRealizppField11: TppField
      FieldAlias = 'TW_KOL'
      FieldName = 'TW_KOL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object PipRealizppField12: TppField
      FieldAlias = 'TW_MONEY'
      FieldName = 'TW_MONEY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object PipRealizppField13: TppField
      FieldAlias = 'TW_SUMM'
      FieldName = 'TW_SUMM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object PipRealizppField14: TppField
      FieldAlias = 'REAL_OSN'
      FieldName = 'REAL_OSN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object PipRealizppField15: TppField
      FieldAlias = 'TW_MONEYD'
      FieldName = 'TW_MONEYD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object PipRealizppField16: TppField
      FieldAlias = 'TW_SUMMD'
      FieldName = 'TW_SUMMD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object PipRealizppField17: TppField
      FieldAlias = 'DOC_TYP'
      FieldName = 'DOC_TYP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
  end
  object PipMove: TppDBPipeline
    DataSource = DataModule2.DsQuery_MOVE
    UserName = 'PipMove'
    Left = 584
    Top = 311
    object PipMoveppField1: TppField
      FieldAlias = 'MOVE_ID'
      FieldName = 'MOVE_ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PipMoveppField2: TppField
      FieldAlias = 'MOVE_NUM_FULL'
      FieldName = 'MOVE_NUM_FULL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PipMoveppField3: TppField
      FieldAlias = 'MOVE_DATE'
      FieldName = 'MOVE_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PipMoveppField4: TppField
      FieldAlias = 'SKL_SHORT'
      FieldName = 'SKL_SHORT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PipMoveppField5: TppField
      FieldAlias = 'MOVE_COLOR'
      FieldName = 'MOVE_COLOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PipMoveppField6: TppField
      FieldAlias = 'US_FULL'
      FieldName = 'US_FULL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PipMoveppField7: TppField
      FieldAlias = 'MOVEVID_NAM'
      FieldName = 'MOVEVID_NAM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PipMoveppField8: TppField
      FieldAlias = 'KLN_ORG'
      FieldName = 'KLN_ORG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PipMoveppField9: TppField
      FieldAlias = 'MOVE_KURS'
      FieldName = 'MOVE_KURS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PipMoveppField10: TppField
      FieldAlias = 'POST_KOL'
      FieldName = 'POST_KOL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object PipMoveppField11: TppField
      FieldAlias = 'REAL_KOL'
      FieldName = 'REAL_KOL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object PipMoveppField12: TppField
      FieldAlias = 'TW_MONEY'
      FieldName = 'TW_MONEY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object PipMoveppField13: TppField
      FieldAlias = 'TW_SUMM'
      FieldName = 'TW_SUMM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object PipMoveppField14: TppField
      FieldAlias = 'MOVE_OSN'
      FieldName = 'MOVE_OSN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object PipMoveppField15: TppField
      FieldAlias = 'TW_MONEYD'
      FieldName = 'TW_MONEYD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object PipMoveppField16: TppField
      FieldAlias = 'TW_SUMMD'
      FieldName = 'TW_SUMMD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object PipMoveppField17: TppField
      FieldAlias = 'DOC_TYP'
      FieldName = 'DOC_TYP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
  end
  object PpMoveShort: TppReport
    AutoStop = False
    DataPipeline = PipMove
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Движение товара'
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    UserName = 'Report'
    DeviceType = 'Screen'
    OnPreviewFormCreate = PpMoveShortPreviewFormCreate
    Left = 616
    Top = 363
    Version = '5.0'
    mmColumnWidth = 0
    object ppTitleBand4: TppTitleBand
      BeforeGenerate = ppTitleBand4BeforeGenerate
      mmBottomOffset = 0
      mmHeight = 14023
      mmPrintPosition = 0
      object ppLabel106: TppLabel
        UserName = 'Label106'
        Caption = 'Дата/время :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 134409
        mmTop = 0
        mmWidth = 15081
        BandType = 1
      end
      object ppSystemVariable16: TppSystemVariable
        UserName = 'SystemVariable16'
        VarType = vtPrintDateTime
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 150813
        mmTop = 0
        mmWidth = 22490
        BandType = 1
      end
      object ppLabel108: TppLabel
        UserName = 'Label108'
        Caption = 'Страница :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 137319
        mmTop = 3175
        mmWidth = 12435
        BandType = 1
      end
      object ppSystemVariable17: TppSystemVariable
        UserName = 'SystemVariable17'
        VarType = vtPageNo
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 150813
        mmTop = 3440
        mmWidth = 1323
        BandType = 1
      end
      object ppLabel109: TppLabel
        UserName = 'Label6202'
        Caption = 'из'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 153988
        mmTop = 3440
        mmWidth = 2646
        BandType = 1
      end
      object ppSystemVariable18: TppSystemVariable
        UserName = 'SystemVariable18'
        VarType = vtPageCount
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 157692
        mmTop = 3440
        mmWidth = 1323
        BandType = 1
      end
      object PpMoveShortUser: TppLabel
        UserName = 'PpMoveShortUser'
        Caption = 'PpRnUser'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 150813
        mmTop = 6085
        mmWidth = 12171
        BandType = 1
      end
      object ppLabel111: TppLabel
        UserName = 'Label111'
        Caption = 'Пользователь :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 131763
        mmTop = 5821
        mmWidth = 17727
        BandType = 1
      end
      object ppImage8: TppImage
        UserName = 'Image8'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 7673
        mmLeft = 180446
        mmTop = 0
        mmWidth = 22754
        BandType = 1
      end
      object ppShape10: TppShape
        UserName = 'Shape10'
        Brush.Color = 14869218
        mmHeight = 4498
        mmLeft = 0
        mmTop = 9525
        mmWidth = 203200
        BandType = 1
      end
      object ppLabel122: TppLabel
        UserName = 'Label122'
        Caption = 'Дата'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 68263
        mmTop = 9790
        mmWidth = 6615
        BandType = 1
      end
      object ppLabel123: TppLabel
        UserName = 'Label123'
        Caption = 'Приход'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 97367
        mmTop = 9790
        mmWidth = 11113
        BandType = 1
      end
      object ppLabel124: TppLabel
        UserName = 'Label124'
        Caption = 'Расход'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 115094
        mmTop = 9790
        mmWidth = 10319
        BandType = 1
      end
      object ppLabel125: TppLabel
        UserName = 'Label1201'
        Caption = 'Вид документа'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 133350
        mmTop = 9790
        mmWidth = 21960
        BandType = 1
      end
      object ppLabel126: TppLabel
        UserName = 'Label126'
        Caption = 'Кто оформил'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 173832
        mmTop = 9790
        mmWidth = 19579
        BandType = 1
      end
      object ppLabel127: TppLabel
        UserName = 'Label127'
        Caption = 'Склад'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 35719
        mmTop = 9790
        mmWidth = 8996
        BandType = 1
      end
      object ppLabel128: TppLabel
        UserName = 'Label128'
        Caption = 'Документ'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 9790
        mmWidth = 14288
        BandType = 1
      end
      object MoveShortTitle1: TppMemo
        UserName = 'MoveShortTitle1'
        Caption = 'MoveShortTitle1'
        CharWrap = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 9260
        mmLeft = 0
        mmTop = 0
        mmWidth = 131498
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppHeaderBand4: TppHeaderBand
      PrintOnFirstPage = False
      mmBottomOffset = 0
      mmHeight = 13494
      mmPrintPosition = 0
      object ppLabel110: TppLabel
        UserName = 'Label110'
        Caption = 'Дата/время :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 154517
        mmTop = 0
        mmWidth = 15081
        BandType = 0
      end
      object ppSystemVariable19: TppSystemVariable
        UserName = 'SystemVariable19'
        VarType = vtPrintDateTime
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 170921
        mmTop = 0
        mmWidth = 22490
        BandType = 0
      end
      object ppLabel112: TppLabel
        UserName = 'Label112'
        Caption = 'Страница :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 157427
        mmTop = 3175
        mmWidth = 12435
        BandType = 0
      end
      object ppSystemVariable20: TppSystemVariable
        UserName = 'SystemVariable20'
        VarType = vtPageNo
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 170921
        mmTop = 3440
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel113: TppLabel
        UserName = 'Label113'
        Caption = 'из'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 174096
        mmTop = 3440
        mmWidth = 2646
        BandType = 0
      end
      object ppSystemVariable21: TppSystemVariable
        UserName = 'SystemVariable21'
        VarType = vtPageCount
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 177800
        mmTop = 3440
        mmWidth = 1323
        BandType = 0
      end
      object PpMoveShortUser2: TppLabel
        UserName = 'PpMoveShortUser1'
        Caption = 'PpRnUser'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 170921
        mmTop = 6085
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel115: TppLabel
        UserName = 'Label115'
        Caption = 'Пользователь :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 151871
        mmTop = 5821
        mmWidth = 17727
        BandType = 0
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        Brush.Color = 14869218
        mmHeight = 4498
        mmLeft = 0
        mmTop = 8996
        mmWidth = 203200
        BandType = 0
      end
      object ppLabel103: TppLabel
        UserName = 'Label103'
        Caption = 'Документ'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 9260
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel114: TppLabel
        UserName = 'Label114'
        Caption = 'Склад'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 35454
        mmTop = 9260
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel116: TppLabel
        UserName = 'Label116'
        Caption = 'Дата'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 67998
        mmTop = 9260
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel117: TppLabel
        UserName = 'Label117'
        Caption = 'Приход'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 97102
        mmTop = 9260
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel118: TppLabel
        UserName = 'Label118'
        Caption = 'Расход'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 114829
        mmTop = 9260
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel120: TppLabel
        UserName = 'Label120'
        Caption = 'Вид документа'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 133086
        mmTop = 9260
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel121: TppLabel
        UserName = 'Label121'
        Caption = 'Кто оформил'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 174625
        mmTop = 9260
        mmWidth = 19579
        BandType = 0
      end
      object MoveShortTitle2: TppMemo
        UserName = 'MoveShortTitle2'
        Caption = 'MoveShortTitle1'
        CharWrap = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 8996
        mmLeft = 0
        mmTop = 0
        mmWidth = 131498
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      BeforeGenerate = ppDetailBand4BeforeGenerate
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShape8: TppShape
        UserName = 'Shape8'
        Brush.Color = 16762566
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 115094
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        Brush.Color = 16762566
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 97367
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'MOVE_NUM_FULL'
        DataPipeline = PipMove
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 34925
        BandType = 4
      end
      object ppDBMemo12: TppDBMemo
        UserName = 'DBMemo12'
        CharWrap = False
        DataField = 'SKL_SHORT'
        DataPipeline = PipMove
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3704
        mmLeft = 35454
        mmTop = 0
        mmWidth = 32279
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'MOVE_DATE'
        DataPipeline = PipMove
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 68263
        mmTop = 0
        mmWidth = 28840
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        Alignment = taRightJustify
        DataField = 'POST_KOL'
        DataPipeline = PipMove
        DisplayFormat = '#0.0000'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 97631
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        Alignment = taRightJustify
        DataField = 'REAL_KOL'
        DataPipeline = PipMove
        DisplayFormat = '#0.0000'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 115094
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
      object ppDBMemo13: TppDBMemo
        UserName = 'DBMemo13'
        CharWrap = False
        DataField = 'MOVEVID_NAM'
        DataPipeline = PipMove
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3704
        mmLeft = 133615
        mmTop = 0
        mmWidth = 40481
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo14: TppDBMemo
        UserName = 'DBMemo14'
        CharWrap = False
        DataField = 'US_FULL'
        DataPipeline = PipMove
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3704
        mmLeft = 174890
        mmTop = 0
        mmWidth = 28046
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Pen.Color = clSilver
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 0
        mmWidth = 203200
        BandType = 4
      end
    end
    object ppSummaryBand4: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 202936
        BandType = 7
      end
      object ppImage7: TppImage
        UserName = 'Image7'
        MaintainAspectRatio = True
        Stretch = True
        Picture.Data = {
          07544269746D617066490000424D664900000000000036010000280000004F01
          0000370000000100080000000000304800000000000000000000400000004000
          0000000000000000800000800000008080008000000080008000808000008080
          8000040404008484840044444400C4C4C40024242400A4A4A40064646400E4E4
          E400141414009494940054545400D4D4D40034343400B4B4B40074747400F4F4
          F4000C0C0C008C8C8C004C4C4C00CCCCCC002C2C2C00ACACAC006C6C6C00ECEC
          EC001C1C1C009C9C9C005C5C5C00DCDCDC003C3C3C00BCBCBC007C7C7C00FCFC
          FC00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272723231F27132727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727270B0B250D272727272727272727272727272727272727272727
          272727272727272727272727272727271F250B15272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2700272727270A0A0A0A0A0A0A0A1A1A1A1A1A1A1A1A0A1A1A1A121A190E0D27
          232727272727272727272727261A1A1A1A1A1A1A1A1A121A121212121212121A
          1A1A1A1A1A1A1A0A1A0A0A0A0A0A1A1127272727272727272727272727272727
          272713220C20201C242414141C0C0C20101C272727272727272727272727271D
          1A1A1212121A1A1A1A1A1A1A1A1A0A24240A1A0A1A1C0A121212221222121212
          121212121A2627272727272727272727272727272727121A220E262727271B22
          121212121212121212121A1A1A12122727272727272727272727272727272727
          24161E1A272727272712121212122222222222221212121212121A1A1A1A1A0A
          1A1A1A1A1A1A1A0A141C0C2027270A0E22220E22222222121222121212121212
          1A1A0A0A0A0D27272727272714141C0C0C200C200C0C200C0C0C202727272727
          27272727272727272727272727272727270027272727201C1C0C1414141C1414
          14240A1A0A0A0A0A24141C1C240C0C0C2010182627272727272727271C1C1414
          1414141414242424240A24240A1216161626092626161E0E221212122222141E
          27272727272727272727272727272727120C2421230B1D090919261E0E1E2611
          0916140C1012172727272727272727261A122226110909090926161E0E0E1E16
          19212111191C241E1E220E19110D1D150D110926161427272727272727272727
          27272727270B261616222627272725221E26151B0B2515151D21191111211E27
          2727272727272727272727272727271419121A1A27272727270A21131B0B0B0B
          251D0D0D1D1D250B1B1B1B252525251515151D21210D1D15150B1B2027270C09
          1F1F0F231B1B1B1B0F1F17170F2313131B2525151419272727272727220D2121
          0D25231B1F0B0D1D151D0C272727272727272727272727272727272727272727
          2700272727270C1A2020202020202020202020200C0C1C140C0C201C1C0E1919
          1E1E141010101727272727271C2420202020200C0C0C0C1C241C0C0C14241414
          14141A1E11111111191622121A1A1A1A2727272727272727272727272727250C
          092624121121110D1D1525250D111119261622220D220C200E17272727272726
          140C0C1C1C140A221E0919260E2212221E2626161E0C1C0A222616160921160E
          220E12121E1427272727272727272727272727270F22261E1A221E2727271514
          0E1E1926121222121222221E2619122727272727272727272727272727271A09
          0E220A1A2727272727101212221E1E1E161609190D15150D111919191111191E
          121A0A1A0A0A0A1A1A1A110C15270C14122222221E2619191111211919262616
          161619252419272727272714122424240A0A161A221909161E250C2727272727
          272727272727272727272727272727272700272727270C240C0C202020202020
          202020202024141C242020200C1C2014221E1E111A0C201C272727270C140C0C
          202020200C0C1C0C0C0C0C14200C0A1E11111A1C14241A0E16221A0A0A0A2424
          272727272727272727272727271C1E0D12120916091527271B2327232527271B
          0909090D1D0D161D14140A2727272716140E192123190E1A0A1A1A121212220E
          0E26091612221C0A160916151B130F1F0F261626221C27272727272727272727
          272727271419190922120E2727270D0C12112127272727272727271B1B1D0927
          272727272727272727272727272316261A1C0A0A2727272727101E2621091725
          25250D110916160E22221E0911161E0E120E1E121A1A1A2222120D0C16270C1C
          19251125272727272727271F0D26221216261926091927272727261C24141C14
          14140A1A2209090E09260E272727272727272727272727272727272727272727
          2700272727272222241C0C1010101010101020200C0C0D0F09240C141420200C
          240A201C221624202427272712220A140C1020200C20200C0C140C1411221F27
          2727170F260A0D0B1E1C1C141412240A27272727272727272727270D121D1A22
          220C2221230E2727151E221A1A0A0E1A1A240A0A0A0E2125131A242727272726
          16221224141424260A0A1A122222221A0E270E1A1A141E221A240A0A220B1723
          26270D161E0A2727272727272727272727272724251909092212122727270D26
          161E1212110B1F1B25170D27111E0E27272727272727272727272727271E1626
          0A1C1A242727272727091D111526221B0E26111D25251D091611162727272727
          272709260E161511221A1A1414270C0B251B2727161F0B150D0D2111260E1211
          27172715261127272727120E241C1C140A241A0E110E22261F0D0E2727272727
          2727272727272727272727272727272727002727272727271327130810101010
          202020200C142427240C1C1020141C20200C190A0C22161E0C0C27271F131323
          1F20100C20200C200C0C141A112712240A0A0A14141C0C142127111A1A121A1A
          0F272727272727272727241E091624240C09151B09272626250F130F23261C18
          0A14241A0A0A0E11091A24272727271F2323230F1C141D1D12121A0A12091519
          1921270F0F1F2713131C2012241E1A0B251D1F0F0F0F27272727272727272727
          2727091D1922161E22121A2727272727231709201C2626262125221B1F1F1F27
          272727272727272727272727240E091612241A1427272727270F0F1F0F091024
          22220E1E0E120A0A1E220E1612121226221E0D172712241E0E0A0A1220272727
          2323131C1409220E1E0E12121211251419272317272727272724121424141C1C
          242422161E0A1D241D2727272727272727272727272727272727272727272727
          2700272727272727272727101C0C1020202020200C1C0A122727272518100C1C
          10200A2124240A1A220C2227272727272726201C200C0C0C0C0C0C1A0A222727
          2727272727231620200C271D1A141E0A0D272727272727272724261216141C0C
          121D231E270D1F272727272727270B0C210A24140A1A0A0A1612142727272727
          272727270F0C211522121A1A2219151E14272727272727272727080C0C1A241E
          1A272727272727272727272727272727271716260916121A0E120A2727272727
          27272721100A1A0A22191327272727272727272727272727272727140E161A12
          0E0E1A142727272727272727272718140E1E2609090E221E110A262727272727
          27270D14221B19140E0A0A1E2027272727272716201A121E26160E0E220D0D1C
          2727272727272727121C121E0A24141C240A0E16121E24272727272727272727
          272727272727272727272727272727272700272727272727272727201C0C1020
          101020200C0C1A24272727272718201C10202426120A1A0A0A12142727272727
          27191C142020200C1C0C0A240A0A2727272727272727272721182017151C0A24
          1E27272727272727241D220E140C0C0C1523242723272727272727272727250C
          13111A240A1A0A14242224272727272727272727270C1A26121A0A0A0A0A0A1A
          1427272727272727272720201C091A241E272727272727272727272727272727
          171A09272321222412120A27272727272727272710140A1A1E14272727272727
          27272727272727272727191E090A24241E260A1427272727272727272727180C
          2212220E0E1A24241E1416272727272727272727171C141214220A2220272727
          2727271D201A220E1E0E240A0A220D0C27272727272727271A0E26111A0A2412
          0A140E091A0E2527272727272727272727272727272727272727272727272727
          27002727272727272727271C140C1010202020201C1C0A14272727272727181C
          14201C161A14141A1A161C0A2727272727191C1C202020201C201A0A1A242727
          272727272727272727271820270E0A140A2727272727270E091A0E1C201A0C0A
          1309111927272727272727272727150C171D260E221A0A0A0A1E242727272727
          27272727170C0C0A2414240A0A1A0A121C2727272727272727270C200C260A24
          222727272727272727272727272727271C152727170B0D09161A0A2727272727
          27272727181C0E120E1C272727272727272727272727272727270E161E121A12
          16160A1C27272727272727272727180C14240A1222120A0A1A140E2727272727
          2727272727270C1A0E2422220C2727272727271510140E1E09090E0A0A1A120C
          272727272727272222110909120A0A220A1416121D1227272727272727272727
          2727272727272727272727272727272727002727272727272727271C1C0C1020
          101020201C0C2414272727272727201024200C24121414240A1A0A1427272727
          2719200C202020201C2014121A24272727271B1B1B1B15272727271812132624
          1427272727271516221E0A20140C1C0D1B1A1D2727272727272727272727150C
          170F2119091919190E0924272727272727272727170C1C0E141414240A1A1A0E
          1C2727272727272727270C0C0C21090A1E272727272727272727272727272712
          1B1B271F131313230F1A24272727272727272727180C1D09261C272727272727
          272727272727272727121E0B0D19091921090A1C27272727272727272727180C
          12221E191119221A0A14222727270F1B1B1B1B272727271C1A1D1A121C1B2727
          2727270F1014111111091119261E0A0C27272727272724142113150D220A121A
          1216240914272727272727272727272727272727272727272727272727272727
          27002727272727272727271C141C1010202020201C0C24142727272727271120
          242020140E1111090916220A152727272709201C0C100C200C201C0E1A242727
          27271C0A1214122727272716102717221427272727270C160E120C1A240C2123
          1B22262727272727272727272727152027170F0F1B1D11191911242727272727
          272727271F0C141E141C14240A1212121C2727272727272727270C20241F250A
          1E272727272727272727272727271311121D2111091919210B12242727272727
          2727272718142717261C27272727272727272727272727271C0E1B1B1B130F0F
          0F250A1C27272727272727272727080C150D1D1D150D21191E14122727271612
          191610272727271C0C1A2422140927272727270F100A2317170D0E0E1E260E0C
          27272727271F240D090E19111E1E120A161A121A232727272727272727272727
          2727272727272727272727272727272727002727272727272727270C14242020
          101020201C0C24242727272727271F201C0C1426132727272323122426272727
          2709100A1C20200C1C0C14090A24272727171C220E1C1A2727272727181F2709
          14272727270E120A1E1C24120C16230F1E221327272727272727272727271520
          272727272727271B1611242727272727272727271F0C0C0E1E261E1626092612
          142727272727272727270C0C19270F241E272727272727272727272727270E0E
          1521110909091919111A24272727272727272727182427270D1C272727272727
          27272727272727121E1E0926190D1B1727271A1C27272727272727272727180C
          2727272715190909151412272727141A241D10272727272710140B090A0A2727
          2727271F100E272727271E2412160E0C27272727270E0E1D15262222240A2212
          221A151E27272727272727272727272727272727272727272727272727272727
          27002727272727272727270C141A201010202020140C140A2727272727271320
          0A121D27272727272727091A1E2727272719201A0C1C0C0C24201A110A0A2727
          27211422260A1A272727272726260F0E2427272727200A1E121416190A0B2313
          261A272727272727272727272727152027272727272727272726142727272727
          272727271F0C1A21230F1B15151D1E1A142727272727272727270C200F272724
          0E27272727272727272727271714211D0D212121210D250B1B1A242727272727
          27272727181A27270F14272727272727272727272727131E1209190909191121
          15271A1C27272727272727272727181C2727272727252609191412272727200A
          111E1027272727270E0C0A1F110C27272727271710221727272727271D111A1C
          2727272724242121191116220A240A0922151427272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1C221020
          202020201A1C240A2727272727270F0C1E1E2727272727272727170B16272727
          27192022200A0A14220C11150A0A2727271A1215211A1A2727272727270C2722
          141D272722140A0E1A1226150B0F131B230A2727272727272727272727271D20
          27272727272727272719142727272727272727271F0C1B272727272727272722
          242727272727272727270C202727270A0E27272727272727272727271C1B111B
          0F171F1F0B1B1D0D0D1A14272727272727272727181E27272714272727272727
          2727272727271E220D0D0D250B0B0B1B1D21121C27272727272727272727080C
          2727272727272719261412272727181C0E1E1027272727272710222323202727
          27272717100E172727272727270D121C2727270D24161626262619190B1D0D1D
          09141F2727272727272727272727272727272727272727272727272727272727
          27002727272727272727270C1C0E20202020200C1624140A2727272727271524
          271D2727272727272727151D212727272709200E201C161E211C15231A0A2727
          271C0E2713220A2727272727270C12241C26272710241E1A0A1611220F17130F
          23262727272727272727272727271514272727272727272727211C2727272727
          272727271F0C27272727272727272719142727272727272727270C0C27272724
          0E27272727272727272727090B1D272723250D11090909092612142727272727
          2727272718192727271C272727272727272727271724161F0F0B250D21211921
          1325121C27272727272727272727181C272727272727271F1924122727270C1E
          09222027272727272720210A1D2427272727271710212727272727272727161C
          2727270E22150D0D1523130B1327272719112727272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1C222020
          2010200C090A140A2727272727270E0A27272727272727272727261E1B272727
          2709200E0C141E19270A13230A0A272727100E2727220A2727272727270A121A
          140A272720241224121927111F232313151D272727272727271D0F2327210C1A
          27272727170F1B1D21210C20210B1B13272727271F0C27272727272727272715
          142727272727272727271C20272727240E27272727272727272717111D272727
          272727231B0B1D11191214272727272727272727182127272714272727272727
          272727271C090D1109090926262626261113121C272727272727272727271814
          27272727272727272724122727151227250A20272727272727261A13231D2727
          27272717101B2727272727272727231C27270A142727272727272727271F2715
          2427272727272727272727272727272727272727272727272727272727272727
          27002727272727272727270C140E20201020200C1112240A2727272727271C1A
          1527272727272727270E1E1E272727272709201E1A24121627211713140A2727
          0D240B2727220A272727272727131717171F27250C1A1A1C2226270D1F232323
          2627272727272727271C140A241E191212120E0E0E162609262624261A0A240A
          272727271F0C27272727272727272727142727272727272727271C1C2727270A
          0E272727272727272727220B2727272727272727272727272712142727272727
          27272727100D2727271427272727272727272711091727271723232521190909
          11210A1C272727272727272727271824272727272727272727241227271C1227
          0F0E202727272727272723131B1B27272727271710232727272727272727171C
          2709242727272727272727272727271427272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1C0E2020
          20202020260E0A0A272727272715121727272727272727270D11271B27272727
          27090C160A141C14271727270A0A27151E15272727160A272727272727272727
          272727141A1E141C2616270D0F230F230A27272727272727271C0D2727272727
          27272727272727272727272727272724272727271F1C27272727272727272727
          142727272727272727271C1A272727220E27272727272727270C272727272727
          2727272727272727270A24272727272727272727100D27272724272727272727
          27271419272727272727272727271B192127241C27272727272727272727101A
          2727272727272727270A22270E14272727272027272727272727272727272727
          2727271F101327272727272727271B120E24170F1B150D0B2727272727271427
          2727272727272727272727272727272727272727272727272727272727272727
          2700272727272727272727201C1E2020202020200E1E0A0A27271727160C2711
          2727272727272727272719272727272727090C1E0A140C0C111527270E0E241C
          1F27272727190A2727272727272727272727272012120C0C1E092311230F1F13
          1427272727272727271C14220E16111119211D150B0B231F0F0B25150B151224
          272727271F1C27272727272727272727142727272727272727271C0A2727270E
          1E27272727272727162327272727272727272727231527272724142727272727
          27272727182127272724272727272727272519272727272727272727271D090A
          09130A1C27272727272727272727181227272727272727272712140C1E211F27
          272720272727272727272727272727272727271F1013272727272727270B211D
          261B0B0D191E1E191D27272727240F2727272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1A0E2020
          202020201A220C180C20200C0E0F272727272727272719272713272727272727
          2719141E24140C0C160927271E0C0D271727272727190A272727272727272727
          272727101A12200C22192109230F1F131427272727272727270E2222220E0E0E
          22121A1A1A1A221E0E0E22121A121A0A272727271F2427272727272727272727
          142727272727272727271C0A2727270E1E272727272727131D1F272727272727
          27270B1121141D2717141427272727272727272710192727270A272727272727
          27262727272727272727271509261A0E1E191A1C272727272727272727270822
          2727272727272727270D272725231F0F231F2027272727272727272727272727
          2727271F201B27272727271F211E16111A261E121A0A121E21131F0F0A242727
          2727272727272727272727272727272727272727272727272727272727272727
          270027272727272727272720120E20101010202020241C202226162717132727
          27272727251D2723152727272727272727110A1E240A220E1E1E232627272727
          27272727270F0A272727272727272727272727101A0A200C1A0926260F0F0F15
          1427272727272727272727272727272727272727272727272727272727272727
          2727272717122727272727272727271F142727272727272727271C1A27272716
          1E2727272727130E27272727272727170B0D1121260C091D0914142727272727
          27272727101E2727271A27272727271F1A23272727272727270D09262616231E
          1A1A221C272727272727272727271822272727272727272727272727130D261E
          0E211A272727272727272727272727272727271F1C1527272727270B26121A0E
          0A0A0A1A241A12260D230F232719141027272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727272012221010
          2014241A221E1A24190A11272727272727272716270D22252727272727272727
          27110A22241A0E22151E271F112523272727272727131A272727272727272727
          272727201424200C240E0E26130F0F151C272727272727272727272727272727
          27272727272727272727272727272727272727271F12272727272727270F2525
          14272727272727272727141A272727090E272727271F1C27272727270F0B250B
          2525151D271C16160A0A2427272727272727272710122727271A272727272714
          15272727170B11091E16262626092026141C161C27272727272727272727081A
          27272727232509161E1E0E22221212121A091627272727272727272727272727
          2727271F14191F1D261E0E0A141414220E26112224141414142426130B27270E
          1A13272727272727272727272727272727272727272727272727272727272727
          27002727272727272727272012122020100C1C0A0A2414202220241F27272727
          2727170F1C1C1927272727272727272727110A1A0A120E22250E1F151B232116
          16110B2727130A2727272727272727272727270C0C0A0C0C0C12121123230F1D
          1427272727272727272727272727272727272727272727272727272727272727
          2727272717122727272727272723211D142727272727272727271C2427272711
          1E272727271C272727271713251525230F231B271614220A1C1A242727272727
          27272727101A2727271A272727271F1D2727271D0E0A0A221E162626221E1826
          0C1C091C2727272727272727272708242727270F0B1D16222212270B1E0A0A0A
          240919272727272727272727272727272727271F1C26271F0B2121111111240E
          2727272727272721220A1C1C090B2327191C2727272727272727272727272727
          2727272727272727272727272727272727002727272727272727272012122020
          20200C201A1C171C0C1422240E0A1E15172713130F0E0C182727272727272727
          270D0A0A240C20201214252619140C201A16092527250A272727272727272727
          2727271A2012200C201A1A261313131514272727272727272727272727272727
          2727272727272727272727272727272727272727171A272727272727271F1D15
          242727272727272727271C14272727150E272727190F1F272727231B25150B0F
          1F13270B121C0A1C1C1624272727272727272727101A27270F1A2727271F1C27
          2725161A2414141A1E1626160B23180E1C1C211C27272727272727272727181C
          27272717171F1B21191C1A26270B192224091E27272727272727272727272727
          2727271F142225150D1926091911241A171B0B21121621271B260E241C091B27
          27220C2727272727272727272727272727272727272727272727272727272727
          27002727272727272727270C121A1020101020201A1C1D14121C0C2020121116
          21172727131B0D0C1C27272727272727271D24240A202020120C160E190A1F20
          101216090D0D0A2727272727272727272727270E200E0C0C2014120E0B25151D
          1427272727272727272727272727272727272727272727272727272727272727
          272727271712171F132727270F1F0B2514272727272727272727141C2727270B
          1E272713090F0F0F230F0B1D0D211D1B232721271A140A0C1415242727272727
          27272727101A27270B1A272727242315211916221A0A0A12161619271B271812
          1C0C211C27272727272727272727180C131511191D251D19111C221E141E0E24
          1C090A272727272727272727272727272727271F1C1A2111260E120E16262414
          272727272727140A2719091A1C140B132727240A272727272727272727272727
          27272727272727272727272727272727270027272727272727272720220A1020
          1010200C121C261A2727271518101C191E260D1B0F2325250C0E272727272727
          270D2424240C202012201A1A262427270820161E16110A272727272727272727
          272727152016200C201C1A221921110D14272727272727272727272727272727
          27272727272727272727272727272727272727271712190919251B1D0D0B0B0D
          14272727272727272727140C2717171B1E271F14271B1B1B1B1519090909111D
          270B1F271224120C141514272727272727272727100A17271D1A272721212121
          0D2111260E1A1A12160927152727181A1C0C1D1C27272727272727272727180C
          21090E2216261E12161C0E270E0C12241C091427272727272727272727272727
          2727271F1C240926262214142424241C27272727272727202409160E1214250F
          270F0D0C27272727272727272727272727272727272727272727272727272727
          2700272727272727272727200E14102010102020121C0E1A272727272710100A
          091E1E161E152521141427272727272727112414141C20201A20140A1E242727
          112022161E111A27272727272727272727272727101A240C20201A1E22220E16
          141D27272727272727272727272727272727272727270B220E0E262727272727
          2727272717120A1A1A220E221E190D2614272727272727272727140C23151513
          1E270C27231B2511261E1E161626090B272527271A0A120C2425242727272727
          27272727100A0D1F211A27251E1511210D0D2126162212121E2321272727180A
          1C0C0B1427272727272727272727180C0E120A1A1E260E1A0E240E2727182412
          1C090C272727272727272727272727272727271F1414220E161E141C141C1214
          272727272727271F20262609260E260F1F171F21212727272727272727272727
          272727272727272727272727272727272700272727272727272727200E0C1020
          102020201214220A272727272727181C11221A0A2422190909141A2727272727
          2719241C1C140C201A201C241624272727180A0E0E091A272727210C0C202227
          27272727100C121C0C201A0E24140A1A141E2727272727272727272727272727
          2727272727270A1927211A27272727272727272717121C1C141414140A0E2622
          14272727272727272727140C190E26130E12271325090E1A0A1A220E0E1E2627
          25272727120A221C241B2427272727272727272718240E1D191A0F140F092609
          11212119260E22221B1117272727180A1C0C1B1427272727272727272727181C
          0A24240A1E092612220A0E2727241C1C14261C272727270C1C0C141F27272727
          2727271F141C0A121E1E24141C140E1A2727272727272727180E192616121613
          0F0D17231C272727272727272727272727272727272727272727272727272727
          270027272727272727272720220C10102020202012140E0A2727272727271420
          220A1C0C0C1C1414241A1C27272727272719241C0C240C0C0A200C1C260A2727
          27100C1A1A211A272727241527221A27272727271E0C0E240C201A241A1C1C24
          0A1C27272727272727272727272727272727272727270C272222242727272727
          27272727171A0C0C0C0C0C0C1C0A1E1A1427272727272727272714201A1A1A23
          0E271D1922241414241A22220E1E271127272727220A0E1C2413242727272727
          2727272718141A16161A0C271E22221E0911211109160E0B171B27272727180A
          1C0C1D1427272727272727272727181C1424240A1619091E2212222727230C0C
          141E0A27272727121B270C1F2727272727272717241C140A0E1E0A1414142622
          272727272727272718121116160E220D0F1227150C2727272727272727272711
          1C1615130D190A141F2727272727272727002727272727272727272012201010
          101020201A141E0A2727272727271D10141C2020202020202011242727272727
          2709240C200A1C200A0C200C192427272712201424150A272727102709141A27
          27272727270C0A0A140C0A200A240C1C1E0C2727272727272727272727272727
          272727272726191D1E122427272727272727272717240C1C0C0C1C1C1C140E0A
          1427272727272727272714201C1424231E0D12241C1C1C14241A12220E270F27
          272727270E0A22140A1D242727272727272727271814141A220A27120A0A0A22
          1E0911210916192725272727272718241C0C091427272727272727272727180C
          2424241A1611111612220E2727271814241E1A2727270F141426201F27272727
          2727271F141C140A0E161A241424160927272727272727271C0A11160E1A1216
          0B1A1F110C272727272727272727241609191119221A14161D0C272727272727
          2700272727272727272727201A0C101010100C201A1C16242727272727270B20
          241C202020200C2020241A132727272727260A1C200A14200A0C0C0C11242727
          27161C0A24130A27272710121C140A2727272727271420220A141420140A140C
          0914232727272727272727272727272727272727270C271E0E1A242727272727
          2727272717140C0C0C0C1C0C1C14222414272727272727272727240C1C1C1C26
          27141C1C1C1C1C14240A122227271B2727272727222412240A21142727272727
          27272727101C1C141A0F0A14141424120E1619190916270D2727272727271814
          1C0C1E1427272727272727272727180C240A0A1A162121160A0E222727270816
          140E222727270E2114220A1F272727272727271F140C14242216122424242419
          27272727272727272414091E120A120E250A211A0C2727272727272709221A15
          26161F27271F1E2319110E09272727272700272727272727272727200A0C1020
          202020200A1C1E242727272727271320140C202020202020201C1A2327272727
          2726240C0C0A1420240C200C0D2427272715140D260F242727260A140C122427
          27272727272718142414240C1A0C24140A241A27272727272727272727272727
          27272727112616120E122427272727272727272717140C0C1C0C1C0C1C1C1214
          14272727272727272727240C0C0C1C0F1C1C1C1C1C1C1C1C240A121727252727
          2727272712141A0A0A2624272727272727272727101C1C1C0A221C141414140A
          121E260926270F272727272727271814141C121C27272727272727272727180C
          0A1A0A1A1E1111160A22222727271023191D112727271426141A091F27272727
          2727271F1C0C142412260E0A240A14162727272727272727200C260E24241222
          0D241A24142727272727272212232123161B2727170D1A2723271D250E272727
          27002727272727272727272024201020200C2020241C0D242727272727271120
          0C0C202020200C2020141227272727272726240C0C241420141C0C20110A2727
          27270E161E122427272019140C2624272727272727271A20221C14121C0C0C14
          1C0E2427272727272727272727272727272727230C270A24220A242727272727
          27272727271C0C0C0C0C0C0C1C1C1A1414272727272727272727240C0C0C0C1C
          0C0C0C1C1C1C1C1C140A11271527272727272727121C0A1A0A0E142727272727
          27272727100C1C1C141C1C14141C1424120E1609271B1F27272727272727180C
          140C0A1C27272727272727272727180C0A0A1A121E111116240E122727272011
          1D252627271F201C140A0D1F272727272727271F1C0C14241A161E1A1A1A1C1A
          2727272727272727180C162214240A1A191A1414142727272727150A271D191D
          151D1D211127091E20232323161D272727002727272727272727271024202010
          20202020240C0D24272727272727142614202020202020201416122727272727
          2716140C0C141C201C0C2020090A272727271B131313132721241E0C0C220A27
          27272727272727180C240C1424240C0C1C091C24272727272727272727272727
          2727271A271A1C24222424272727272727272727271C0C20200C0C0C0C1C0A14
          14272727272727272727241C1C1C1C1C0C0C0C0C0C0C1C140A12271F27272727
          27272727120C241A0A2214272727272727272727200C1C1C1C1C14141424241A
          120E160F0F252727272727272727180C140C1A1C27272727272727272727180C
          0A1A1A120E091116242222272727270F0F0F0F27271D141C1424221F27272727
          2727271F0C0C14141A1616121A1A141C272727272727272718261A0A140A1A1A
          220A1A241D27272727271C2727271F150D0D152509242619160E1E0F1A242727
          2700272727272727272727201420201020102020141C0E0A2727272727170C0B
          122020102020202012272227272727272716140C0C141C0C0C0C2020160A2727
          272727272727270B200F240C20240A27272727272727272718140C0C0C0A140C
          0C0C092023272727272727272727272727270E251E1C1C2412140A2727272727
          272727271B0C0C20200C0C0C0C1C241C142727272727272727270A1C0C1C0C0C
          1C0C0C0C0C1C1C241A250F2727272727272727271A200A1224221C2727272727
          27272727201C1C141C1C1C1C1C24241A121E21271D272727272727272727100C
          141C0A0C27272727272727272727180C0A0A1A120E09191E2422122727272727
          272727271312122424240A1F2727272727272715200C14141A1E09221A1A240C
          27272727272727231C192414141A0A1A12141A24272727272720131F0E27270E
          1E16160F1F26272727271B27170B0A27270027272727272727272720140C1010
          10102020141C1A1A2727272709200D09202020202020201C2709272727272727
          2719200C200C0C1C0C1C0C200E0A2727272727131B151C0909240C0C0C140A27
          272727272727272727180C1A1C0C1C1C0C1C0C0D0C2427272727272727272727
          1524231A1C0C1C141A1C242727272727272727271B0C0C0C0C0C0C1C1C1C1414
          2427272727272727272724141C0C0C0C0C0C0C0C1C1C0A1A2709272727272727
          27272727101C1A12141E0C2727272727272727270C1C141C1C1C0C1C240A0A0A
          221F131527272727272727272723100A1C0C1A0C27272727272727272727180C
          0A1A1A1A1216090E0A0E12272727271B1B21142417141A241A240C0F27272727
          27272715101C14241A1E191E1A0A1610272727272727212226141414121A2424
          0A16111727272727171427122727141612160F1B0A130F27271A270C21171E27
          2700272727272727272727200A0C2020102020201C240A2627160E200C092620
          10101020200C0C2727152727272727272724141C201C1C1C20140C2022102020
          10200C0C1C1D09091C0C200C1C241A272727272727272727272710200E1C140C
          0C0C0C0C210C101D272727272727231E1C27141C1C1C1C142414242727272727
          2727272709140C0C0C0C0C1C0C1C1424140D27272727272727111C091C0C0C0C
          0C1C1C1C1C240A23231B27272727272727272725141A2222141C1C1C27272727
          2727172216241C1C1C0C1C14240A0A12092715272727272727272727271D1222
          1C0C0A0A20272727272727272727100C1A1A0A1A2226091E241614140C0C1C24
          1A2527121A1A0A1A14240A0F2727272727272719101C24241216191E121A1110
          1B1B1126140C091914140A1A0E24242422272527272727271023211A27271E1A
          241A0F14091E0D271127271F1A1D1D16270027272727091A1224202009201020
          101020200C0A1A0820141A26191410202020200C1C0A2727112727271E12120E
          1C20111C1C1C20202014200C200C1426161616260E0A1C0C200C1C1414161A27
          2727272727272727272727240C0E1C120C0C0C0C201A1E0C2010120A1C100C0B
          111A141C1C1C1C1424120A272727270E2222221A1C1E0C0C0C0C1C1C1C14141A
          12201C220E0C22121C1A151C1C0C0C0C0C0C0C140A141E27152727272727271A
          0E221C14271609220A24191C0C0C181E160C1C251E242414141414240A1A1A22
          270F2727272727271B1E12141C0D1E0A1C1C241D0A20140C1C220E221E141912
          0A1A0A1A1A120E1E160F0F130B151D21121A121A0A121E241414121F27270A22
          0E1E1C140E0A1A0E0911260E121A21252619090B1B260A121A0A121614141426
          27262727272727271409161A27271E2414141314240A1B271E27272714111F14
          27002727272710121A20201C1420201C1C0C2010100C200C2616141010200C1C
          0C20200C17230921272727270C0A220C201E221A240C201C0A1A24201C1C0C0C
          0C2020202020200C1C142424240F0A27272727272727272727272727220C141E
          1E1A1A1C0C0C0C0E1B231D0B1509190A0C1C142327270C0A0A220A2727272712
          0E111926091A0A0A0A0A0A0A1A121A0A220D15152624140B11191C1C0C0C0C0C
          0C140A141C142721272727272727271027171F132619090E1A0A242619211E0C
          0F0F1D0A1C141414140A1A120A1414271617272727272727130E271F131A241C
          1C141C1411152317140A231F170F0A14240A220E1E2609091119261E1A24141C
          1C1C1C0A2216161414141E0F27271C1E2727271D1E161E1E1E160926160E1911
          0916221A0A0E0909161A24140A1A27150D272727272727271424120927271E14
          14141F0A14142319272727270C21171A270027272727200A2010102020202020
          0C1C241C1C0A091A151512121A1A161E21231F1722220B27272727271C241C20
          200C1C1C201C201C200C090C20200C0C1C1C1C1C14141C1C0C20202020271A27
          272727272727272727272727272324141E09121A12121A1C0C2020200C0C0C0C
          14272721121C0A121A190A27272727120A141C0C1C1414141414140C1C1C1C14
          140A1A220E20201C0C0C1C1C14242424141C0C0C1C270E1B2727272727272710
          2422220E1609190916121A0A0A1A1C101C1C1C1C1C140A24141C1C1C1C1C0A16
          1B2727272727272713201A161E221A241414241A22161A0A0C100A0A0A0A1A12
          220E0E221E2611211D151D0D11092626161616161E120A1C14241D0F27271C14
          1A0E1E1E1E1E0E1626091111210D211926221A0A24141414141A160B271F1E0B
          272727272727272714242411272716141414150A141A0F27242727270C1B2726
          2700272727270C0A1020202010202020200C0C0C0C24120D2727251513231526
          1622240A1D1B2727272727271C240C202020200C0C241414140A151B27272727
          27272727272727272727272727270A272727272727272727272727272727270B
          0C241A2527231515210D211D151B2727271622190B1318260A0F0A2727272712
          1A0A22191D27272727272727272727272727272727151C0A0A1E252727272727
          2727272727221D2727272727272727202727272727272727272727271F230B20
          12191B272727272727272727272727252727272727272727131C272727272727
          2727170F23250B1F160C251F2727272727272727272727272727272727272727
          27271F0F1F13251B13271F1F27271C0C27272727272727272727272727272727
          272727271727172727171F270D15272727272727272727271C1A142627271624
          1414111A2709162727222727101D272427002727272722220A0A0A0A0A0A0A0A
          0A0A0A1A0A0A0A0A0A0A0A240A1A1A12261D25272727272727272727121E1212
          12222222222212121A1A1A1A0A0A0A240A1A120E0E2222121A1A0A2424241A27
          2727272727272727272727272727272727151A1C0A1222261B25150D0D1E0A1A
          261527272727081B272724272727272216220E0E160909090926160E22221222
          2222121A0A1422161E0E220E0E0E0E0E220E222222192727272727272727270A
          0E22222222220E0E0E0E0E0E1E0E2422260919111909161616161E0E0E222227
          2727272727272727131E162616161616162626090909091922261D1D0D211111
          191921210D21211111211111112111210D0D1D0D0D0D0D1D1D1D190F27271C25
          151D1D1D250B0B0B152515151D1D1D0D0D0D0D0D0D2119261119251B27272727
          27272727272727271412241C27272624141C210F140D261D272227271009270A
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          27272727230B11090E1E1E26161D252727272727272711111121112727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          27272727272727272727272727272727272727272727272710240A1227272624
          141C090F26092621271627272417171527002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727272711241A0A162724141414220F19112621231427121D1F2427
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272714220A22241214
          141C111222241A26160F271C15111A2727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727271212160D1224141424240A221609272527142219222727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          27272727272727272727272727272727272727272727272727271C250A1A120B
          151D151D0D112527270A1A19121D272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727121B24091419272727272727241E0A160E1E272727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272722272422
          1B110A14240E1124121A091E2727272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727272727272727270A0F1E240A121E262624242213132727272727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727271716
          272713251D13270B112727272727272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727152119112327272727272727272727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727272727272727272727272700}
        mmHeight = 2910
        mmLeft = 160602
        mmTop = 2381
        mmWidth = 16404
        BandType = 7
      end
      object ppLabel89: TppLabel
        UserName = 'Label89'
        Caption = 'Система "Арм-Склад" версия'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 4
        Font.Style = []
        Transparent = True
        mmHeight = 1588
        mmLeft = 177536
        mmTop = 1852
        mmWidth = 18785
        BandType = 7
      end
      object ppLabel96: TppLabel
        UserName = 'Label96'
        Caption = 'Бритвин Сергей beginner@inbox.ru'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 4
        Font.Style = []
        Transparent = True
        mmHeight = 1588
        mmLeft = 177800
        mmTop = 3704
        mmWidth = 22490
        BandType = 7
      end
      object PpMoveShortVers: TppLabel
        UserName = 'PpRemonVers1'
        Caption = '3.1.01'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 4
        Font.Style = []
        Transparent = True
        mmHeight = 1588
        mmLeft = 199232
        mmTop = 1852
        mmWidth = 3704
        BandType = 7
      end
    end
  end
  object PpMoveFull: TppReport
    AutoStop = False
    DataPipeline = PipMove
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Движение товара'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    UserName = 'Report'
    DeviceType = 'Screen'
    OnPreviewFormCreate = PpMoveFullPreviewFormCreate
    Left = 548
    Top = 363
    Version = '5.0'
    mmColumnWidth = 0
    object ppTitleBand5: TppTitleBand
      BeforeGenerate = ppTitleBand5BeforeGenerate
      mmBottomOffset = 0
      mmHeight = 14023
      mmPrintPosition = 0
      object ppLabel80: TppLabel
        UserName = 'Label106'
        Caption = 'Дата/время :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 197115
        mmTop = 0
        mmWidth = 15081
        BandType = 1
      end
      object ppSystemVariable22: TppSystemVariable
        UserName = 'SystemVariable16'
        VarType = vtPrintDateTime
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 213519
        mmTop = 0
        mmWidth = 22490
        BandType = 1
      end
      object ppLabel129: TppLabel
        UserName = 'Label108'
        Caption = 'Страница :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 200025
        mmTop = 3175
        mmWidth = 12435
        BandType = 1
      end
      object ppSystemVariable23: TppSystemVariable
        UserName = 'SystemVariable17'
        VarType = vtPageNo
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 213519
        mmTop = 3440
        mmWidth = 1323
        BandType = 1
      end
      object ppLabel130: TppLabel
        UserName = 'Label6202'
        Caption = 'из'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 216694
        mmTop = 3440
        mmWidth = 2646
        BandType = 1
      end
      object ppSystemVariable24: TppSystemVariable
        UserName = 'SystemVariable18'
        VarType = vtPageCount
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 220398
        mmTop = 3440
        mmWidth = 1323
        BandType = 1
      end
      object PpMoveFullUser: TppLabel
        UserName = 'PpMoveShortUser'
        Caption = 'PpRnUser'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 213519
        mmTop = 6085
        mmWidth = 12171
        BandType = 1
      end
      object ppLabel132: TppLabel
        UserName = 'Label111'
        Caption = 'Пользователь :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 194469
        mmTop = 5821
        mmWidth = 17727
        BandType = 1
      end
      object ppImage9: TppImage
        UserName = 'Image8'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 7673
        mmLeft = 243153
        mmTop = 0
        mmWidth = 22754
        BandType = 1
      end
      object ppShape11: TppShape
        UserName = 'Shape10'
        Brush.Color = 14869218
        mmHeight = 4498
        mmLeft = 0
        mmTop = 9525
        mmWidth = 266171
        BandType = 1
      end
      object MoveFullTitle1: TppMemo
        UserName = 'MoveShortTitle1'
        Caption = 'MoveShortTitle1'
        CharWrap = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 9260
        mmLeft = 0
        mmTop = 0
        mmWidth = 193411
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel133: TppLabel
        UserName = 'Label133'
        Caption = 'Документ'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 10319
        mmWidth = 11113
        BandType = 1
      end
      object ppLabel134: TppLabel
        UserName = 'Label134'
        Caption = 'Клиент'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 24342
        mmTop = 10319
        mmWidth = 8467
        BandType = 1
      end
      object ppLabel135: TppLabel
        UserName = 'Label135'
        Caption = 'Склад'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 46567
        mmTop = 10319
        mmWidth = 7673
        BandType = 1
      end
      object ppLabel136: TppLabel
        UserName = 'Label136'
        Caption = 'Дата'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 61383
        mmTop = 10319
        mmWidth = 5292
        BandType = 1
      end
      object ppLabel137: TppLabel
        UserName = 'Label137'
        Caption = 'Приход'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 92604
        mmTop = 10319
        mmWidth = 9260
        BandType = 1
      end
      object ppLabel138: TppLabel
        UserName = 'Label138'
        Caption = 'Расход'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 106098
        mmTop = 10319
        mmWidth = 8731
        BandType = 1
      end
      object ppLabel139: TppLabel
        UserName = 'Label139'
        Caption = 'Цена, руб'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 117740
        mmTop = 10319
        mmWidth = 11906
        BandType = 1
      end
      object ppLabel159: TppLabel
        UserName = 'Label159'
        Caption = 'Цена, $'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 134673
        mmTop = 10319
        mmWidth = 8731
        BandType = 1
      end
      object ppLabel160: TppLabel
        UserName = 'Label160'
        Caption = 'Сумма, руб'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 144198
        mmTop = 10319
        mmWidth = 13758
        BandType = 1
      end
      object ppLabel161: TppLabel
        UserName = 'Label161'
        Caption = 'Сумма, $'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 160602
        mmTop = 10319
        mmWidth = 10583
        BandType = 1
      end
      object ppLabel162: TppLabel
        UserName = 'Label162'
        Caption = 'Курс'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 177271
        mmTop = 10319
        mmWidth = 5821
        BandType = 1
      end
      object ppLabel163: TppLabel
        UserName = 'Label1203'
        Caption = 'Вид документа'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 184150
        mmTop = 10319
        mmWidth = 18256
        BandType = 1
      end
      object ppLabel164: TppLabel
        UserName = 'Label164'
        Caption = 'Основание'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 203465
        mmTop = 10319
        mmWidth = 13229
        BandType = 1
      end
      object ppLabel165: TppLabel
        UserName = 'Label165'
        Caption = 'Кто оформил'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 239978
        mmTop = 10319
        mmWidth = 16669
        BandType = 1
      end
    end
    object ppHeaderBand5: TppHeaderBand
      PrintOnFirstPage = False
      mmBottomOffset = 0
      mmHeight = 13494
      mmPrintPosition = 0
      object ppLabel140: TppLabel
        UserName = 'Label110'
        Caption = 'Дата/время :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 197644
        mmTop = 0
        mmWidth = 15081
        BandType = 0
      end
      object ppSystemVariable25: TppSystemVariable
        UserName = 'SystemVariable19'
        VarType = vtPrintDateTime
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 214048
        mmTop = 0
        mmWidth = 22490
        BandType = 0
      end
      object ppLabel141: TppLabel
        UserName = 'Label112'
        Caption = 'Страница :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 200290
        mmTop = 2381
        mmWidth = 12435
        BandType = 0
      end
      object ppSystemVariable26: TppSystemVariable
        UserName = 'SystemVariable20'
        VarType = vtPageNo
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 213784
        mmTop = 2646
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel142: TppLabel
        UserName = 'Label113'
        Caption = 'из'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 216959
        mmTop = 2646
        mmWidth = 2646
        BandType = 0
      end
      object ppSystemVariable27: TppSystemVariable
        UserName = 'SystemVariable21'
        VarType = vtPageCount
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 220663
        mmTop = 2646
        mmWidth = 1323
        BandType = 0
      end
      object PpMoveFullUser2: TppLabel
        UserName = 'PpMoveShortUser1'
        Caption = 'PpRnUser'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 213784
        mmTop = 5292
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel144: TppLabel
        UserName = 'Label115'
        Caption = 'Пользователь :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 194734
        mmTop = 5027
        mmWidth = 17727
        BandType = 0
      end
      object ppShape12: TppShape
        UserName = 'Shape9'
        Brush.Color = 14869218
        mmHeight = 4498
        mmLeft = 0
        mmTop = 8996
        mmWidth = 266171
        BandType = 0
      end
      object ppLabel150: TppLabel
        UserName = 'Label120'
        Caption = 'Вид документа'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 184150
        mmTop = 9790
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel151: TppLabel
        UserName = 'Label121'
        Caption = 'Кто оформил'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 240507
        mmTop = 9790
        mmWidth = 16669
        BandType = 0
      end
      object MoveFullTitle2: TppMemo
        UserName = 'MoveShortTitle2'
        Caption = 'MoveShortTitle1'
        CharWrap = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 8996
        mmLeft = 0
        mmTop = 0
        mmWidth = 193675
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel131: TppLabel
        UserName = 'Label1202'
        Caption = 'Основание'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 203730
        mmTop = 9790
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel143: TppLabel
        UserName = 'Label143'
        Caption = 'Курс'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 177536
        mmTop = 9790
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel154: TppLabel
        UserName = 'Label154'
        Caption = 'Сумма, $'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 160602
        mmTop = 9790
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel155: TppLabel
        UserName = 'Label155'
        Caption = 'Сумма, руб'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 144198
        mmTop = 9790
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel156: TppLabel
        UserName = 'Label156'
        Caption = 'Цена, $'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 134673
        mmTop = 9790
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel145: TppLabel
        UserName = 'Label145'
        Caption = 'Цена, руб'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 117740
        mmTop = 9790
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel146: TppLabel
        UserName = 'Label146'
        Caption = 'Расход'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 106098
        mmTop = 9790
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel147: TppLabel
        UserName = 'Label147'
        Caption = 'Приход'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 92604
        mmTop = 9790
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel148: TppLabel
        UserName = 'Label148'
        Caption = 'Дата'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 61383
        mmTop = 9790
        mmWidth = 5292
        BandType = 0
      end
      object ppLabel149: TppLabel
        UserName = 'Label149'
        Caption = 'Склад'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 46831
        mmTop = 9790
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel157: TppLabel
        UserName = 'Label157'
        Caption = 'Клиент'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 25400
        mmTop = 10054
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel158: TppLabel
        UserName = 'Label158'
        Caption = 'Документ'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 1058
        mmTop = 10054
        mmWidth = 11113
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      BeforeGenerate = ppDetailBand5BeforeGenerate
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppShape13: TppShape
        UserName = 'Shape8'
        Brush.Color = 16762566
        Pen.Style = psClear
        mmHeight = 3440
        mmLeft = 101336
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
      object ppShape14: TppShape
        UserName = 'Shape7'
        Brush.Color = 16762566
        Pen.Style = psClear
        mmHeight = 3440
        mmLeft = 87048
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText20'
        DataField = 'MOVE_NUM_FULL'
        DataPipeline = PipMove
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBMemo15: TppDBMemo
        UserName = 'DBMemo12'
        CharWrap = False
        DataField = 'SKL_SHORT'
        DataPipeline = PipMove
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3175
        mmLeft = 46831
        mmTop = 0
        mmWidth = 14552
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText31: TppDBText
        UserName = 'DBText27'
        DataField = 'MOVE_DATE'
        DataPipeline = PipMove
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 61648
        mmTop = 0
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText28'
        Alignment = taRightJustify
        DataField = 'POST_KOL'
        DataPipeline = PipMove
        DisplayFormat = '#0.0000'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 87313
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText29'
        Alignment = taRightJustify
        DataField = 'REAL_KOL'
        DataPipeline = PipMove
        DisplayFormat = '#0.0000'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 101336
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object ppDBMemo16: TppDBMemo
        UserName = 'DBMemo13'
        CharWrap = False
        DataField = 'MOVEVID_NAM'
        DataPipeline = PipMove
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3175
        mmLeft = 184415
        mmTop = 0
        mmWidth = 17463
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo17: TppDBMemo
        UserName = 'DBMemo14'
        CharWrap = False
        DataField = 'US_FULL'
        DataPipeline = PipMove
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3175
        mmLeft = 240507
        mmTop = 0
        mmWidth = 25929
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine8: TppLine
        UserName = 'Line7'
        Pen.Color = clSilver
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 529
        mmTop = 0
        mmWidth = 266171
        BandType = 4
      end
      object ppDBMemo18: TppDBMemo
        UserName = 'DBMemo18'
        CharWrap = False
        DataField = 'MOVE_OSN'
        DataPipeline = PipMove
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3175
        mmLeft = 202407
        mmTop = 0
        mmWidth = 36777
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        Alignment = taRightJustify
        DataField = 'MOVE_KURS'
        DataPipeline = PipMove
        DisplayFormat = '#0.00'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 171715
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        Alignment = taRightJustify
        DataField = 'TW_SUMMD'
        DataPipeline = PipMove
        DisplayFormat = '#0.00'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 157692
        mmTop = 0
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'DBText36'
        Alignment = taRightJustify
        DataField = 'TW_SUMM'
        DataPipeline = PipMove
        DisplayFormat = '#0.00'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 143669
        mmTop = 0
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        Alignment = taRightJustify
        DataField = 'TW_MONEYD'
        DataPipeline = PipMove
        DisplayFormat = '#0.00'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 129911
        mmTop = 0
        mmWidth = 13494
        BandType = 4
      end
      object ppDBMemo19: TppDBMemo
        UserName = 'DBMemo19'
        CharWrap = False
        DataField = 'KLN_ORG'
        DataPipeline = PipMove
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3175
        mmLeft = 24342
        mmTop = 0
        mmWidth = 22225
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText38: TppDBText
        UserName = 'DBText38'
        Alignment = taRightJustify
        DataField = 'TW_MONEY'
        DataPipeline = PipMove
        DisplayFormat = '#0.00'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 116152
        mmTop = 0
        mmWidth = 13494
        BandType = 4
      end
    end
    object ppSummaryBand5: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLine9: TppLine
        UserName = 'Line6'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 266436
        BandType = 7
      end
      object ppImage10: TppImage
        UserName = 'Image7'
        MaintainAspectRatio = True
        Stretch = True
        Picture.Data = {
          07544269746D617066490000424D664900000000000036010000280000004F01
          0000370000000100080000000000304800000000000000000000400000004000
          0000000000000000800000800000008080008000000080008000808000008080
          8000040404008484840044444400C4C4C40024242400A4A4A40064646400E4E4
          E400141414009494940054545400D4D4D40034343400B4B4B40074747400F4F4
          F4000C0C0C008C8C8C004C4C4C00CCCCCC002C2C2C00ACACAC006C6C6C00ECEC
          EC001C1C1C009C9C9C005C5C5C00DCDCDC003C3C3C00BCBCBC007C7C7C00FCFC
          FC00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272723231F27132727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727270B0B250D272727272727272727272727272727272727272727
          272727272727272727272727272727271F250B15272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2700272727270A0A0A0A0A0A0A0A1A1A1A1A1A1A1A1A0A1A1A1A121A190E0D27
          232727272727272727272727261A1A1A1A1A1A1A1A1A121A121212121212121A
          1A1A1A1A1A1A1A0A1A0A0A0A0A0A1A1127272727272727272727272727272727
          272713220C20201C242414141C0C0C20101C272727272727272727272727271D
          1A1A1212121A1A1A1A1A1A1A1A1A0A24240A1A0A1A1C0A121212221222121212
          121212121A2627272727272727272727272727272727121A220E262727271B22
          121212121212121212121A1A1A12122727272727272727272727272727272727
          24161E1A272727272712121212122222222222221212121212121A1A1A1A1A0A
          1A1A1A1A1A1A1A0A141C0C2027270A0E22220E22222222121222121212121212
          1A1A0A0A0A0D27272727272714141C0C0C200C200C0C200C0C0C202727272727
          27272727272727272727272727272727270027272727201C1C0C1414141C1414
          14240A1A0A0A0A0A24141C1C240C0C0C2010182627272727272727271C1C1414
          1414141414242424240A24240A1216161626092626161E0E221212122222141E
          27272727272727272727272727272727120C2421230B1D090919261E0E1E2611
          0916140C1012172727272727272727261A122226110909090926161E0E0E1E16
          19212111191C241E1E220E19110D1D150D110926161427272727272727272727
          27272727270B261616222627272725221E26151B0B2515151D21191111211E27
          2727272727272727272727272727271419121A1A27272727270A21131B0B0B0B
          251D0D0D1D1D250B1B1B1B252525251515151D21210D1D15150B1B2027270C09
          1F1F0F231B1B1B1B0F1F17170F2313131B2525151419272727272727220D2121
          0D25231B1F0B0D1D151D0C272727272727272727272727272727272727272727
          2700272727270C1A2020202020202020202020200C0C1C140C0C201C1C0E1919
          1E1E141010101727272727271C2420202020200C0C0C0C1C241C0C0C14241414
          14141A1E11111111191622121A1A1A1A2727272727272727272727272727250C
          092624121121110D1D1525250D111119261622220D220C200E17272727272726
          140C0C1C1C140A221E0919260E2212221E2626161E0C1C0A222616160921160E
          220E12121E1427272727272727272727272727270F22261E1A221E2727271514
          0E1E1926121222121222221E2619122727272727272727272727272727271A09
          0E220A1A2727272727101212221E1E1E161609190D15150D111919191111191E
          121A0A1A0A0A0A1A1A1A110C15270C14122222221E2619191111211919262616
          161619252419272727272714122424240A0A161A221909161E250C2727272727
          272727272727272727272727272727272700272727270C240C0C202020202020
          202020202024141C242020200C1C2014221E1E111A0C201C272727270C140C0C
          202020200C0C1C0C0C0C0C14200C0A1E11111A1C14241A0E16221A0A0A0A2424
          272727272727272727272727271C1E0D12120916091527271B2327232527271B
          0909090D1D0D161D14140A2727272716140E192123190E1A0A1A1A121212220E
          0E26091612221C0A160916151B130F1F0F261626221C27272727272727272727
          272727271419190922120E2727270D0C12112127272727272727271B1B1D0927
          272727272727272727272727272316261A1C0A0A2727272727101E2621091725
          25250D110916160E22221E0911161E0E120E1E121A1A1A2222120D0C16270C1C
          19251125272727272727271F0D26221216261926091927272727261C24141C14
          14140A1A2209090E09260E272727272727272727272727272727272727272727
          2700272727272222241C0C1010101010101020200C0C0D0F09240C141420200C
          240A201C221624202427272712220A140C1020200C20200C0C140C1411221F27
          2727170F260A0D0B1E1C1C141412240A27272727272727272727270D121D1A22
          220C2221230E2727151E221A1A0A0E1A1A240A0A0A0E2125131A242727272726
          16221224141424260A0A1A122222221A0E270E1A1A141E221A240A0A220B1723
          26270D161E0A2727272727272727272727272724251909092212122727270D26
          161E1212110B1F1B25170D27111E0E27272727272727272727272727271E1626
          0A1C1A242727272727091D111526221B0E26111D25251D091611162727272727
          272709260E161511221A1A1414270C0B251B2727161F0B150D0D2111260E1211
          27172715261127272727120E241C1C140A241A0E110E22261F0D0E2727272727
          2727272727272727272727272727272727002727272727271327130810101010
          202020200C142427240C1C1020141C20200C190A0C22161E0C0C27271F131323
          1F20100C20200C200C0C141A112712240A0A0A14141C0C142127111A1A121A1A
          0F272727272727272727241E091624240C09151B09272626250F130F23261C18
          0A14241A0A0A0E11091A24272727271F2323230F1C141D1D12121A0A12091519
          1921270F0F1F2713131C2012241E1A0B251D1F0F0F0F27272727272727272727
          2727091D1922161E22121A2727272727231709201C2626262125221B1F1F1F27
          272727272727272727272727240E091612241A1427272727270F0F1F0F091024
          22220E1E0E120A0A1E220E1612121226221E0D172712241E0E0A0A1220272727
          2323131C1409220E1E0E12121211251419272317272727272724121424141C1C
          242422161E0A1D241D2727272727272727272727272727272727272727272727
          2700272727272727272727101C0C1020202020200C1C0A122727272518100C1C
          10200A2124240A1A220C2227272727272726201C200C0C0C0C0C0C1A0A222727
          2727272727231620200C271D1A141E0A0D272727272727272724261216141C0C
          121D231E270D1F272727272727270B0C210A24140A1A0A0A1612142727272727
          272727270F0C211522121A1A2219151E14272727272727272727080C0C1A241E
          1A272727272727272727272727272727271716260916121A0E120A2727272727
          27272721100A1A0A22191327272727272727272727272727272727140E161A12
          0E0E1A142727272727272727272718140E1E2609090E221E110A262727272727
          27270D14221B19140E0A0A1E2027272727272716201A121E26160E0E220D0D1C
          2727272727272727121C121E0A24141C240A0E16121E24272727272727272727
          272727272727272727272727272727272700272727272727272727201C0C1020
          101020200C0C1A24272727272718201C10202426120A1A0A0A12142727272727
          27191C142020200C1C0C0A240A0A2727272727272727272721182017151C0A24
          1E27272727272727241D220E140C0C0C1523242723272727272727272727250C
          13111A240A1A0A14242224272727272727272727270C1A26121A0A0A0A0A0A1A
          1427272727272727272720201C091A241E272727272727272727272727272727
          171A09272321222412120A27272727272727272710140A1A1E14272727272727
          27272727272727272727191E090A24241E260A1427272727272727272727180C
          2212220E0E1A24241E1416272727272727272727171C141214220A2220272727
          2727271D201A220E1E0E240A0A220D0C27272727272727271A0E26111A0A2412
          0A140E091A0E2527272727272727272727272727272727272727272727272727
          27002727272727272727271C140C1010202020201C1C0A14272727272727181C
          14201C161A14141A1A161C0A2727272727191C1C202020201C201A0A1A242727
          272727272727272727271820270E0A140A2727272727270E091A0E1C201A0C0A
          1309111927272727272727272727150C171D260E221A0A0A0A1E242727272727
          27272727170C0C0A2414240A0A1A0A121C2727272727272727270C200C260A24
          222727272727272727272727272727271C152727170B0D09161A0A2727272727
          27272727181C0E120E1C272727272727272727272727272727270E161E121A12
          16160A1C27272727272727272727180C14240A1222120A0A1A140E2727272727
          2727272727270C1A0E2422220C2727272727271510140E1E09090E0A0A1A120C
          272727272727272222110909120A0A220A1416121D1227272727272727272727
          2727272727272727272727272727272727002727272727272727271C1C0C1020
          101020201C0C2414272727272727201024200C24121414240A1A0A1427272727
          2719200C202020201C2014121A24272727271B1B1B1B15272727271812132624
          1427272727271516221E0A20140C1C0D1B1A1D2727272727272727272727150C
          170F2119091919190E0924272727272727272727170C1C0E141414240A1A1A0E
          1C2727272727272727270C0C0C21090A1E272727272727272727272727272712
          1B1B271F131313230F1A24272727272727272727180C1D09261C272727272727
          272727272727272727121E0B0D19091921090A1C27272727272727272727180C
          12221E191119221A0A14222727270F1B1B1B1B272727271C1A1D1A121C1B2727
          2727270F1014111111091119261E0A0C27272727272724142113150D220A121A
          1216240914272727272727272727272727272727272727272727272727272727
          27002727272727272727271C141C1010202020201C0C24142727272727271120
          242020140E1111090916220A152727272709201C0C100C200C201C0E1A242727
          27271C0A1214122727272716102717221427272727270C160E120C1A240C2123
          1B22262727272727272727272727152027170F0F1B1D11191911242727272727
          272727271F0C141E141C14240A1212121C2727272727272727270C20241F250A
          1E272727272727272727272727271311121D2111091919210B12242727272727
          2727272718142717261C27272727272727272727272727271C0E1B1B1B130F0F
          0F250A1C27272727272727272727080C150D1D1D150D21191E14122727271612
          191610272727271C0C1A2422140927272727270F100A2317170D0E0E1E260E0C
          27272727271F240D090E19111E1E120A161A121A232727272727272727272727
          2727272727272727272727272727272727002727272727272727270C14242020
          101020201C0C24242727272727271F201C0C1426132727272323122426272727
          2709100A1C20200C1C0C14090A24272727171C220E1C1A2727272727181F2709
          14272727270E120A1E1C24120C16230F1E221327272727272727272727271520
          272727272727271B1611242727272727272727271F0C0C0E1E261E1626092612
          142727272727272727270C0C19270F241E272727272727272727272727270E0E
          1521110909091919111A24272727272727272727182427270D1C272727272727
          27272727272727121E1E0926190D1B1727271A1C27272727272727272727180C
          2727272715190909151412272727141A241D10272727272710140B090A0A2727
          2727271F100E272727271E2412160E0C27272727270E0E1D15262222240A2212
          221A151E27272727272727272727272727272727272727272727272727272727
          27002727272727272727270C141A201010202020140C140A2727272727271320
          0A121D27272727272727091A1E2727272719201A0C1C0C0C24201A110A0A2727
          27211422260A1A272727272726260F0E2427272727200A1E121416190A0B2313
          261A272727272727272727272727152027272727272727272726142727272727
          272727271F0C1A21230F1B15151D1E1A142727272727272727270C200F272724
          0E27272727272727272727271714211D0D212121210D250B1B1A242727272727
          27272727181A27270F14272727272727272727272727131E1209190909191121
          15271A1C27272727272727272727181C2727272727252609191412272727200A
          111E1027272727270E0C0A1F110C27272727271710221727272727271D111A1C
          2727272724242121191116220A240A0922151427272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1C221020
          202020201A1C240A2727272727270F0C1E1E2727272727272727170B16272727
          27192022200A0A14220C11150A0A2727271A1215211A1A2727272727270C2722
          141D272722140A0E1A1226150B0F131B230A2727272727272727272727271D20
          27272727272727272719142727272727272727271F0C1B272727272727272722
          242727272727272727270C202727270A0E27272727272727272727271C1B111B
          0F171F1F0B1B1D0D0D1A14272727272727272727181E27272714272727272727
          2727272727271E220D0D0D250B0B0B1B1D21121C27272727272727272727080C
          2727272727272719261412272727181C0E1E1027272727272710222323202727
          27272717100E172727272727270D121C2727270D24161626262619190B1D0D1D
          09141F2727272727272727272727272727272727272727272727272727272727
          27002727272727272727270C1C0E20202020200C1624140A2727272727271524
          271D2727272727272727151D212727272709200E201C161E211C15231A0A2727
          271C0E2713220A2727272727270C12241C26272710241E1A0A1611220F17130F
          23262727272727272727272727271514272727272727272727211C2727272727
          272727271F0C27272727272727272719142727272727272727270C0C27272724
          0E27272727272727272727090B1D272723250D11090909092612142727272727
          2727272718192727271C272727272727272727271724161F0F0B250D21211921
          1325121C27272727272727272727181C272727272727271F1924122727270C1E
          09222027272727272720210A1D2427272727271710212727272727272727161C
          2727270E22150D0D1523130B1327272719112727272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1C222020
          2010200C090A140A2727272727270E0A27272727272727272727261E1B272727
          2709200E0C141E19270A13230A0A272727100E2727220A2727272727270A121A
          140A272720241224121927111F232313151D272727272727271D0F2327210C1A
          27272727170F1B1D21210C20210B1B13272727271F0C27272727272727272715
          142727272727272727271C20272727240E27272727272727272717111D272727
          272727231B0B1D11191214272727272727272727182127272714272727272727
          272727271C090D1109090926262626261113121C272727272727272727271814
          27272727272727272724122727151227250A20272727272727261A13231D2727
          27272717101B2727272727272727231C27270A142727272727272727271F2715
          2427272727272727272727272727272727272727272727272727272727272727
          27002727272727272727270C140E20201020200C1112240A2727272727271C1A
          1527272727272727270E1E1E272727272709201E1A24121627211713140A2727
          0D240B2727220A272727272727131717171F27250C1A1A1C2226270D1F232323
          2627272727272727271C140A241E191212120E0E0E162609262624261A0A240A
          272727271F0C27272727272727272727142727272727272727271C1C2727270A
          0E272727272727272727220B2727272727272727272727272712142727272727
          27272727100D2727271427272727272727272711091727271723232521190909
          11210A1C272727272727272727271824272727272727272727241227271C1227
          0F0E202727272727272723131B1B27272727271710232727272727272727171C
          2709242727272727272727272727271427272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1C0E2020
          20202020260E0A0A272727272715121727272727272727270D11271B27272727
          27090C160A141C14271727270A0A27151E15272727160A272727272727272727
          272727141A1E141C2616270D0F230F230A27272727272727271C0D2727272727
          27272727272727272727272727272724272727271F1C27272727272727272727
          142727272727272727271C1A272727220E27272727272727270C272727272727
          2727272727272727270A24272727272727272727100D27272724272727272727
          27271419272727272727272727271B192127241C27272727272727272727101A
          2727272727272727270A22270E14272727272027272727272727272727272727
          2727271F101327272727272727271B120E24170F1B150D0B2727272727271427
          2727272727272727272727272727272727272727272727272727272727272727
          2700272727272727272727201C1E2020202020200E1E0A0A27271727160C2711
          2727272727272727272719272727272727090C1E0A140C0C111527270E0E241C
          1F27272727190A2727272727272727272727272012120C0C1E092311230F1F13
          1427272727272727271C14220E16111119211D150B0B231F0F0B25150B151224
          272727271F1C27272727272727272727142727272727272727271C0A2727270E
          1E27272727272727162327272727272727272727231527272724142727272727
          27272727182127272724272727272727272519272727272727272727271D090A
          09130A1C27272727272727272727181227272727272727272712140C1E211F27
          272720272727272727272727272727272727271F1013272727272727270B211D
          261B0B0D191E1E191D27272727240F2727272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1A0E2020
          202020201A220C180C20200C0E0F272727272727272719272713272727272727
          2719141E24140C0C160927271E0C0D271727272727190A272727272727272727
          272727101A12200C22192109230F1F131427272727272727270E2222220E0E0E
          22121A1A1A1A221E0E0E22121A121A0A272727271F2427272727272727272727
          142727272727272727271C0A2727270E1E272727272727131D1F272727272727
          27270B1121141D2717141427272727272727272710192727270A272727272727
          27262727272727272727271509261A0E1E191A1C272727272727272727270822
          2727272727272727270D272725231F0F231F2027272727272727272727272727
          2727271F201B27272727271F211E16111A261E121A0A121E21131F0F0A242727
          2727272727272727272727272727272727272727272727272727272727272727
          270027272727272727272720120E20101010202020241C202226162717132727
          27272727251D2723152727272727272727110A1E240A220E1E1E232627272727
          27272727270F0A272727272727272727272727101A0A200C1A0926260F0F0F15
          1427272727272727272727272727272727272727272727272727272727272727
          2727272717122727272727272727271F142727272727272727271C1A27272716
          1E2727272727130E27272727272727170B0D1121260C091D0914142727272727
          27272727101E2727271A27272727271F1A23272727272727270D09262616231E
          1A1A221C272727272727272727271822272727272727272727272727130D261E
          0E211A272727272727272727272727272727271F1C1527272727270B26121A0E
          0A0A0A1A241A12260D230F232719141027272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727272012221010
          2014241A221E1A24190A11272727272727272716270D22252727272727272727
          27110A22241A0E22151E271F112523272727272727131A272727272727272727
          272727201424200C240E0E26130F0F151C272727272727272727272727272727
          27272727272727272727272727272727272727271F12272727272727270F2525
          14272727272727272727141A272727090E272727271F1C27272727270F0B250B
          2525151D271C16160A0A2427272727272727272710122727271A272727272714
          15272727170B11091E16262626092026141C161C27272727272727272727081A
          27272727232509161E1E0E22221212121A091627272727272727272727272727
          2727271F14191F1D261E0E0A141414220E26112224141414142426130B27270E
          1A13272727272727272727272727272727272727272727272727272727272727
          27002727272727272727272012122020100C1C0A0A2414202220241F27272727
          2727170F1C1C1927272727272727272727110A1A0A120E22250E1F151B232116
          16110B2727130A2727272727272727272727270C0C0A0C0C0C12121123230F1D
          1427272727272727272727272727272727272727272727272727272727272727
          2727272717122727272727272723211D142727272727272727271C2427272711
          1E272727271C272727271713251525230F231B271614220A1C1A242727272727
          27272727101A2727271A272727271F1D2727271D0E0A0A221E162626221E1826
          0C1C091C2727272727272727272708242727270F0B1D16222212270B1E0A0A0A
          240919272727272727272727272727272727271F1C26271F0B2121111111240E
          2727272727272721220A1C1C090B2327191C2727272727272727272727272727
          2727272727272727272727272727272727002727272727272727272012122020
          20200C201A1C171C0C1422240E0A1E15172713130F0E0C182727272727272727
          270D0A0A240C20201214252619140C201A16092527250A272727272727272727
          2727271A2012200C201A1A261313131514272727272727272727272727272727
          2727272727272727272727272727272727272727171A272727272727271F1D15
          242727272727272727271C14272727150E272727190F1F272727231B25150B0F
          1F13270B121C0A1C1C1624272727272727272727101A27270F1A2727271F1C27
          2725161A2414141A1E1626160B23180E1C1C211C27272727272727272727181C
          27272717171F1B21191C1A26270B192224091E27272727272727272727272727
          2727271F142225150D1926091911241A171B0B21121621271B260E241C091B27
          27220C2727272727272727272727272727272727272727272727272727272727
          27002727272727272727270C121A1020101020201A1C1D14121C0C2020121116
          21172727131B0D0C1C27272727272727271D24240A202020120C160E190A1F20
          101216090D0D0A2727272727272727272727270E200E0C0C2014120E0B25151D
          1427272727272727272727272727272727272727272727272727272727272727
          272727271712171F132727270F1F0B2514272727272727272727141C2727270B
          1E272713090F0F0F230F0B1D0D211D1B232721271A140A0C1415242727272727
          27272727101A27270B1A272727242315211916221A0A0A12161619271B271812
          1C0C211C27272727272727272727180C131511191D251D19111C221E141E0E24
          1C090A272727272727272727272727272727271F1C1A2111260E120E16262414
          272727272727140A2719091A1C140B132727240A272727272727272727272727
          27272727272727272727272727272727270027272727272727272720220A1020
          1010200C121C261A2727271518101C191E260D1B0F2325250C0E272727272727
          270D2424240C202012201A1A262427270820161E16110A272727272727272727
          272727152016200C201C1A221921110D14272727272727272727272727272727
          27272727272727272727272727272727272727271712190919251B1D0D0B0B0D
          14272727272727272727140C2717171B1E271F14271B1B1B1B1519090909111D
          270B1F271224120C141514272727272727272727100A17271D1A272721212121
          0D2111260E1A1A12160927152727181A1C0C1D1C27272727272727272727180C
          21090E2216261E12161C0E270E0C12241C091427272727272727272727272727
          2727271F1C240926262214142424241C27272727272727202409160E1214250F
          270F0D0C27272727272727272727272727272727272727272727272727272727
          2700272727272727272727200E14102010102020121C0E1A272727272710100A
          091E1E161E152521141427272727272727112414141C20201A20140A1E242727
          112022161E111A27272727272727272727272727101A240C20201A1E22220E16
          141D27272727272727272727272727272727272727270B220E0E262727272727
          2727272717120A1A1A220E221E190D2614272727272727272727140C23151513
          1E270C27231B2511261E1E161626090B272527271A0A120C2425242727272727
          27272727100A0D1F211A27251E1511210D0D2126162212121E2321272727180A
          1C0C0B1427272727272727272727180C0E120A1A1E260E1A0E240E2727182412
          1C090C272727272727272727272727272727271F1414220E161E141C141C1214
          272727272727271F20262609260E260F1F171F21212727272727272727272727
          272727272727272727272727272727272700272727272727272727200E0C1020
          102020201214220A272727272727181C11221A0A2422190909141A2727272727
          2719241C1C140C201A201C241624272727180A0E0E091A272727210C0C202227
          27272727100C121C0C201A0E24140A1A141E2727272727272727272727272727
          2727272727270A1927211A27272727272727272717121C1C141414140A0E2622
          14272727272727272727140C190E26130E12271325090E1A0A1A220E0E1E2627
          25272727120A221C241B2427272727272727272718240E1D191A0F140F092609
          11212119260E22221B1117272727180A1C0C1B1427272727272727272727181C
          0A24240A1E092612220A0E2727241C1C14261C272727270C1C0C141F27272727
          2727271F141C0A121E1E24141C140E1A2727272727272727180E192616121613
          0F0D17231C272727272727272727272727272727272727272727272727272727
          270027272727272727272720220C10102020202012140E0A2727272727271420
          220A1C0C0C1C1414241A1C27272727272719241C0C240C0C0A200C1C260A2727
          27100C1A1A211A272727241527221A27272727271E0C0E240C201A241A1C1C24
          0A1C27272727272727272727272727272727272727270C272222242727272727
          27272727171A0C0C0C0C0C0C1C0A1E1A1427272727272727272714201A1A1A23
          0E271D1922241414241A22220E1E271127272727220A0E1C2413242727272727
          2727272718141A16161A0C271E22221E0911211109160E0B171B27272727180A
          1C0C1D1427272727272727272727181C1424240A1619091E2212222727230C0C
          141E0A27272727121B270C1F2727272727272717241C140A0E1E0A1414142622
          272727272727272718121116160E220D0F1227150C2727272727272727272711
          1C1615130D190A141F2727272727272727002727272727272727272012201010
          101020201A141E0A2727272727271D10141C2020202020202011242727272727
          2709240C200A1C200A0C200C192427272712201424150A272727102709141A27
          27272727270C0A0A140C0A200A240C1C1E0C2727272727272727272727272727
          272727272726191D1E122427272727272727272717240C1C0C0C1C1C1C140E0A
          1427272727272727272714201C1424231E0D12241C1C1C14241A12220E270F27
          272727270E0A22140A1D242727272727272727271814141A220A27120A0A0A22
          1E0911210916192725272727272718241C0C091427272727272727272727180C
          2424241A1611111612220E2727271814241E1A2727270F141426201F27272727
          2727271F141C140A0E161A241424160927272727272727271C0A11160E1A1216
          0B1A1F110C272727272727272727241609191119221A14161D0C272727272727
          2700272727272727272727201A0C101010100C201A1C16242727272727270B20
          241C202020200C2020241A132727272727260A1C200A14200A0C0C0C11242727
          27161C0A24130A27272710121C140A2727272727271420220A141420140A140C
          0914232727272727272727272727272727272727270C271E0E1A242727272727
          2727272717140C0C0C0C1C0C1C14222414272727272727272727240C1C1C1C26
          27141C1C1C1C1C14240A122227271B2727272727222412240A21142727272727
          27272727101C1C141A0F0A14141424120E1619190916270D2727272727271814
          1C0C1E1427272727272727272727180C240A0A1A162121160A0E222727270816
          140E222727270E2114220A1F272727272727271F140C14242216122424242419
          27272727272727272414091E120A120E250A211A0C2727272727272709221A15
          26161F27271F1E2319110E09272727272700272727272727272727200A0C1020
          202020200A1C1E242727272727271320140C202020202020201C1A2327272727
          2726240C0C0A1420240C200C0D2427272715140D260F242727260A140C122427
          27272727272718142414240C1A0C24140A241A27272727272727272727272727
          27272727112616120E122427272727272727272717140C0C1C0C1C0C1C1C1214
          14272727272727272727240C0C0C1C0F1C1C1C1C1C1C1C1C240A121727252727
          2727272712141A0A0A2624272727272727272727101C1C1C0A221C141414140A
          121E260926270F272727272727271814141C121C27272727272727272727180C
          0A1A0A1A1E1111160A22222727271023191D112727271426141A091F27272727
          2727271F1C0C142412260E0A240A14162727272727272727200C260E24241222
          0D241A24142727272727272212232123161B2727170D1A2723271D250E272727
          27002727272727272727272024201020200C2020241C0D242727272727271120
          0C0C202020200C2020141227272727272726240C0C241420141C0C20110A2727
          27270E161E122427272019140C2624272727272727271A20221C14121C0C0C14
          1C0E2427272727272727272727272727272727230C270A24220A242727272727
          27272727271C0C0C0C0C0C0C1C1C1A1414272727272727272727240C0C0C0C1C
          0C0C0C1C1C1C1C1C140A11271527272727272727121C0A1A0A0E142727272727
          27272727100C1C1C141C1C14141C1424120E1609271B1F27272727272727180C
          140C0A1C27272727272727272727180C0A0A1A121E111116240E122727272011
          1D252627271F201C140A0D1F272727272727271F1C0C14241A161E1A1A1A1C1A
          2727272727272727180C162214240A1A191A1414142727272727150A271D191D
          151D1D211127091E20232323161D272727002727272727272727271024202010
          20202020240C0D24272727272727142614202020202020201416122727272727
          2716140C0C141C201C0C2020090A272727271B131313132721241E0C0C220A27
          27272727272727180C240C1424240C0C1C091C24272727272727272727272727
          2727271A271A1C24222424272727272727272727271C0C20200C0C0C0C1C0A14
          14272727272727272727241C1C1C1C1C0C0C0C0C0C0C1C140A12271F27272727
          27272727120C241A0A2214272727272727272727200C1C1C1C1C14141424241A
          120E160F0F252727272727272727180C140C1A1C27272727272727272727180C
          0A1A1A120E091116242222272727270F0F0F0F27271D141C1424221F27272727
          2727271F0C0C14141A1616121A1A141C272727272727272718261A0A140A1A1A
          220A1A241D27272727271C2727271F150D0D152509242619160E1E0F1A242727
          2700272727272727272727201420201020102020141C0E0A2727272727170C0B
          122020102020202012272227272727272716140C0C141C0C0C0C2020160A2727
          272727272727270B200F240C20240A27272727272727272718140C0C0C0A140C
          0C0C092023272727272727272727272727270E251E1C1C2412140A2727272727
          272727271B0C0C20200C0C0C0C1C241C142727272727272727270A1C0C1C0C0C
          1C0C0C0C0C1C1C241A250F2727272727272727271A200A1224221C2727272727
          27272727201C1C141C1C1C1C1C24241A121E21271D272727272727272727100C
          141C0A0C27272727272727272727180C0A0A1A120E09191E2422122727272727
          272727271312122424240A1F2727272727272715200C14141A1E09221A1A240C
          27272727272727231C192414141A0A1A12141A24272727272720131F0E27270E
          1E16160F1F26272727271B27170B0A27270027272727272727272720140C1010
          10102020141C1A1A2727272709200D09202020202020201C2709272727272727
          2719200C200C0C1C0C1C0C200E0A2727272727131B151C0909240C0C0C140A27
          272727272727272727180C1A1C0C1C1C0C1C0C0D0C2427272727272727272727
          1524231A1C0C1C141A1C242727272727272727271B0C0C0C0C0C0C1C1C1C1414
          2427272727272727272724141C0C0C0C0C0C0C0C1C1C0A1A2709272727272727
          27272727101C1A12141E0C2727272727272727270C1C141C1C1C0C1C240A0A0A
          221F131527272727272727272723100A1C0C1A0C27272727272727272727180C
          0A1A1A1A1216090E0A0E12272727271B1B21142417141A241A240C0F27272727
          27272715101C14241A1E191E1A0A1610272727272727212226141414121A2424
          0A16111727272727171427122727141612160F1B0A130F27271A270C21171E27
          2700272727272727272727200A0C2020102020201C240A2627160E200C092620
          10101020200C0C2727152727272727272724141C201C1C1C20140C2022102020
          10200C0C1C1D09091C0C200C1C241A272727272727272727272710200E1C140C
          0C0C0C0C210C101D272727272727231E1C27141C1C1C1C142414242727272727
          2727272709140C0C0C0C0C1C0C1C1424140D27272727272727111C091C0C0C0C
          0C1C1C1C1C240A23231B27272727272727272725141A2222141C1C1C27272727
          2727172216241C1C1C0C1C14240A0A12092715272727272727272727271D1222
          1C0C0A0A20272727272727272727100C1A1A0A1A2226091E241614140C0C1C24
          1A2527121A1A0A1A14240A0F2727272727272719101C24241216191E121A1110
          1B1B1126140C091914140A1A0E24242422272527272727271023211A27271E1A
          241A0F14091E0D271127271F1A1D1D16270027272727091A1224202009201020
          101020200C0A1A0820141A26191410202020200C1C0A2727112727271E12120E
          1C20111C1C1C20202014200C200C1426161616260E0A1C0C200C1C1414161A27
          2727272727272727272727240C0E1C120C0C0C0C201A1E0C2010120A1C100C0B
          111A141C1C1C1C1424120A272727270E2222221A1C1E0C0C0C0C1C1C1C14141A
          12201C220E0C22121C1A151C1C0C0C0C0C0C0C140A141E27152727272727271A
          0E221C14271609220A24191C0C0C181E160C1C251E242414141414240A1A1A22
          270F2727272727271B1E12141C0D1E0A1C1C241D0A20140C1C220E221E141912
          0A1A0A1A1A120E1E160F0F130B151D21121A121A0A121E241414121F27270A22
          0E1E1C140E0A1A0E0911260E121A21252619090B1B260A121A0A121614141426
          27262727272727271409161A27271E2414141314240A1B271E27272714111F14
          27002727272710121A20201C1420201C1C0C2010100C200C2616141010200C1C
          0C20200C17230921272727270C0A220C201E221A240C201C0A1A24201C1C0C0C
          0C2020202020200C1C142424240F0A27272727272727272727272727220C141E
          1E1A1A1C0C0C0C0E1B231D0B1509190A0C1C142327270C0A0A220A2727272712
          0E111926091A0A0A0A0A0A0A1A121A0A220D15152624140B11191C1C0C0C0C0C
          0C140A141C142721272727272727271027171F132619090E1A0A242619211E0C
          0F0F1D0A1C141414140A1A120A1414271617272727272727130E271F131A241C
          1C141C1411152317140A231F170F0A14240A220E1E2609091119261E1A24141C
          1C1C1C0A2216161414141E0F27271C1E2727271D1E161E1E1E160926160E1911
          0916221A0A0E0909161A24140A1A27150D272727272727271424120927271E14
          14141F0A14142319272727270C21171A270027272727200A2010102020202020
          0C1C241C1C0A091A151512121A1A161E21231F1722220B27272727271C241C20
          200C1C1C201C201C200C090C20200C0C1C1C1C1C14141C1C0C20202020271A27
          272727272727272727272727272324141E09121A12121A1C0C2020200C0C0C0C
          14272721121C0A121A190A27272727120A141C0C1C1414141414140C1C1C1C14
          140A1A220E20201C0C0C1C1C14242424141C0C0C1C270E1B2727272727272710
          2422220E1609190916121A0A0A1A1C101C1C1C1C1C140A24141C1C1C1C1C0A16
          1B2727272727272713201A161E221A241414241A22161A0A0C100A0A0A0A1A12
          220E0E221E2611211D151D0D11092626161616161E120A1C14241D0F27271C14
          1A0E1E1E1E1E0E1626091111210D211926221A0A24141414141A160B271F1E0B
          272727272727272714242411272716141414150A141A0F27242727270C1B2726
          2700272727270C0A1020202010202020200C0C0C0C24120D2727251513231526
          1622240A1D1B2727272727271C240C202020200C0C241414140A151B27272727
          27272727272727272727272727270A272727272727272727272727272727270B
          0C241A2527231515210D211D151B2727271622190B1318260A0F0A2727272712
          1A0A22191D27272727272727272727272727272727151C0A0A1E252727272727
          2727272727221D2727272727272727202727272727272727272727271F230B20
          12191B272727272727272727272727252727272727272727131C272727272727
          2727170F23250B1F160C251F2727272727272727272727272727272727272727
          27271F0F1F13251B13271F1F27271C0C27272727272727272727272727272727
          272727271727172727171F270D15272727272727272727271C1A142627271624
          1414111A2709162727222727101D272427002727272722220A0A0A0A0A0A0A0A
          0A0A0A1A0A0A0A0A0A0A0A240A1A1A12261D25272727272727272727121E1212
          12222222222212121A1A1A1A0A0A0A240A1A120E0E2222121A1A0A2424241A27
          2727272727272727272727272727272727151A1C0A1222261B25150D0D1E0A1A
          261527272727081B272724272727272216220E0E160909090926160E22221222
          2222121A0A1422161E0E220E0E0E0E0E220E222222192727272727272727270A
          0E22222222220E0E0E0E0E0E1E0E2422260919111909161616161E0E0E222227
          2727272727272727131E162616161616162626090909091922261D1D0D211111
          191921210D21211111211111112111210D0D1D0D0D0D0D1D1D1D190F27271C25
          151D1D1D250B0B0B152515151D1D1D0D0D0D0D0D0D2119261119251B27272727
          27272727272727271412241C27272624141C210F140D261D272227271009270A
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          27272727230B11090E1E1E26161D252727272727272711111121112727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          27272727272727272727272727272727272727272727272710240A1227272624
          141C090F26092621271627272417171527002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727272711241A0A162724141414220F19112621231427121D1F2427
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272714220A22241214
          141C111222241A26160F271C15111A2727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727271212160D1224141424240A221609272527142219222727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          27272727272727272727272727272727272727272727272727271C250A1A120B
          151D151D0D112527270A1A19121D272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727121B24091419272727272727241E0A160E1E272727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272722272422
          1B110A14240E1124121A091E2727272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727272727272727270A0F1E240A121E262624242213132727272727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727271716
          272713251D13270B112727272727272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727152119112327272727272727272727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727272727272727272727272700}
        mmHeight = 2910
        mmLeft = 223573
        mmTop = 2381
        mmWidth = 16404
        BandType = 7
      end
      object ppLabel152: TppLabel
        UserName = 'Label89'
        Caption = 'Система "Арм-Склад" версия'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 4
        Font.Style = []
        Transparent = True
        mmHeight = 1588
        mmLeft = 240507
        mmTop = 1852
        mmWidth = 18785
        BandType = 7
      end
      object ppLabel153: TppLabel
        UserName = 'Label96'
        Caption = 'Бритвин Сергей beginner@inbox.ru'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 4
        Font.Style = []
        Transparent = True
        mmHeight = 1588
        mmLeft = 240771
        mmTop = 3704
        mmWidth = 22490
        BandType = 7
      end
      object PpMoveFullVers: TppLabel
        UserName = 'PpRemonVers1'
        Caption = '3.1.01'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 4
        Font.Style = []
        Transparent = True
        mmHeight = 1588
        mmLeft = 262203
        mmTop = 1852
        mmWidth = 3704
        BandType = 7
      end
    end
  end
  object HTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 60
    Top = 264
  end
  object QueryH: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = HTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from history_tw(:tw_id)'
      'order by tm desc')
    Left = 132
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tw_id'
        ParamType = ptUnknown
      end>
    object QueryHSHOP_NAME: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SHOP_NAME'
      ReadOnly = True
      Size = 254
    end
    object QueryHUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 254
    end
    object QueryHTM: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TM'
      ReadOnly = True
    end
    object QueryHMESS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'MESS'
      ReadOnly = True
      Size = 1000
    end
  end
  object DsH: TDataSource
    DataSet = QueryH
    Left = 132
    Top = 316
  end
  object QueryH2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = HTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from history_tw2(:tw_id)'
      'order by tm desc')
    Left = 130
    Top = 150
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tw_id'
        ParamType = ptUnknown
      end>
    object IBStringField1: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SHOP_NAME'
      ReadOnly = True
      Size = 254
    end
    object IBStringField2: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 254
    end
    object DateTimeField1: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TM'
      ReadOnly = True
    end
    object IBStringField3: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'MESS'
      ReadOnly = True
      Size = 1000
    end
  end
  object DsH2: TDataSource
    DataSet = QueryH2
    Left = 130
    Top = 202
  end
  object QueryShop: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ShopTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from list_twmonshop(:tw_id)'
      'order by shop_name')
    Left = 312
    Top = 358
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tw_id'
        ParamType = ptUnknown
      end>
    object QueryShopTWMONSHOP_ID: TIntegerField
      FieldName = 'TWMONSHOP_ID'
    end
    object QueryShopSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
    end
    object QueryShopSHOP_NAME: TIBStringField
      FieldName = 'SHOP_NAME'
      Size = 254
    end
    object QueryShopTW_MONEY: TFloatField
      FieldName = 'TW_MONEY'
      DisplayFormat = '#0.00 руб'
    end
    object QueryShopTW_MONEY2: TFloatField
      FieldName = 'TW_MONEY2'
      DisplayFormat = '#0.0000'
    end
    object QueryShopSKID_PERCENT: TFloatField
      FieldName = 'SKID_PERCENT'
      DisplayFormat = '#0.0000%'
    end
  end
  object DsShop: TDataSource
    DataSet = QueryShop
    Left = 314
    Top = 302
  end
  object ShopTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 320
    Top = 248
  end
  object MemMove: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'MOVE_NUM_FULL'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'KLN_ORG'
        DataType = ftString
        Size = 252
      end
      item
        Name = 'SKL_SHORT'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'POST_KOL'
        DataType = ftFloat
      end
      item
        Name = 'REAL_KOL'
        DataType = ftFloat
      end
      item
        Name = 'TW_MONEY'
        DataType = ftFloat
      end
      item
        Name = 'TW_MONEYD'
        DataType = ftFloat
      end
      item
        Name = 'TW_SUMM'
        DataType = ftFloat
      end
      item
        Name = 'TW_SUMMD'
        DataType = ftFloat
      end
      item
        Name = 'MOVE_KURS'
        DataType = ftFloat
      end
      item
        Name = 'MOVEVID_NAM'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'MOVE_OSN'
        DataType = ftString
        Size = 252
      end
      item
        Name = 'US_FULL'
        DataType = ftString
        Size = 252
      end
      item
        Name = 'SALDO'
        DataType = ftFloat
      end
      item
        Name = 'move_color'
        DataType = ftInteger
      end
      item
        Name = 'doc_typ'
        DataType = ftInteger
      end
      item
        Name = 'move_id'
        DataType = ftInteger
      end
      item
        Name = 'MOVE_DATE'
        DataType = ftDateTime
      end>
    Left = 526
    Top = 175
    object MemMoveMOVE_NUM_FULL: TStringField
      FieldName = 'MOVE_NUM_FULL'
      Size = 64
    end
    object MemMoveKLN_ORG: TStringField
      FieldName = 'KLN_ORG'
      Size = 252
    end
    object MemMoveSKL_SHORT: TStringField
      FieldName = 'SKL_SHORT'
      Size = 128
    end
    object MemMovePOST_KOL: TFloatField
      FieldName = 'POST_KOL'
      DisplayFormat = '#0.0000'
    end
    object MemMoveREAL_KOL: TFloatField
      FieldName = 'REAL_KOL'
      DisplayFormat = '#0.0000'
    end
    object MemMoveTW_MONEY: TFloatField
      FieldName = 'TW_MONEY'
      DisplayFormat = '#0.00'
    end
    object MemMoveTW_MONEYD: TFloatField
      FieldName = 'TW_MONEYD'
      DisplayFormat = '#0.00'
    end
    object MemMoveTW_SUMM: TFloatField
      FieldName = 'TW_SUMM'
      DisplayFormat = '#0.00'
    end
    object MemMoveTW_SUMMD: TFloatField
      FieldName = 'TW_SUMMD'
      DisplayFormat = '#0.00'
    end
    object MemMoveMOVE_KURS: TFloatField
      FieldName = 'MOVE_KURS'
      DisplayFormat = '#0.00 руб/USD'
    end
    object MemMoveMOVEVID_NAM: TStringField
      FieldName = 'MOVEVID_NAM'
      Size = 128
    end
    object MemMoveMOVE_OSN: TStringField
      FieldName = 'MOVE_OSN'
      Size = 252
    end
    object MemMoveUS_FULL: TStringField
      FieldName = 'US_FULL'
      Size = 252
    end
    object MemMoveSALDO: TFloatField
      FieldName = 'SALDO'
      DisplayFormat = '#0.0000'
    end
    object MemMovemove_color: TIntegerField
      FieldName = 'move_color'
    end
    object MemMovedoc_typ: TIntegerField
      FieldName = 'doc_typ'
    end
    object MemMovemove_id: TIntegerField
      FieldName = 'move_id'
    end
    object MemMoveMOVE_DATE: TDateTimeField
      FieldName = 'MOVE_DATE'
    end
  end
  object DsMove2: TDataSource
    DataSet = MemMove
    Left = 524
    Top = 229
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 674
    Top = 177
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 674
    Top = 229
  end
  object PopupMenu1: TPopupMenu
    Left = 260
    Top = 157
    object MnDate: TMenuItem
      Caption = 'Изменить время документа...'
      OnClick = MnDateClick
    end
    object MnRe: TMenuItem
      Caption = 
        'Перезакрыть день по данному товару, начиная с выбранного докумен' +
        'та...'
      OnClick = MnReClick
    end
  end
  object DS_PRICE: TDataSource
    DataSet = PRICE
    Left = 380
    Top = 112
  end
  object PRICE: TRxMemoryData
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'twprice_oldmoney'
        DataType = ftFloat
      end
      item
        Name = 'twpricetyp_desc'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'twprice_money'
        DataType = ftFloat
      end
      item
        Name = 'twprice_typ'
        DataType = ftInteger
      end
      item
        Name = 'twprice_id'
        DataType = ftInteger
      end
      item
        Name = 'twprice_date'
        DataType = ftDate
      end
      item
        Name = 'twprice_money_origin'
        DataType = ftFloat
      end
      item
        Name = 'tm1'
        DataType = ftDate
      end>
    OnCalcFields = PRICECalcFields
    Left = 444
    Top = 112
    object PRICEtwprice_oldmoney: TFloatField
      FieldName = 'twprice_oldmoney'
      DisplayFormat = '0.00'
    end
    object PRICEtwpricetyp_desc: TStringField
      FieldName = 'twpricetyp_desc'
    end
    object PRICEtwprice_money: TFloatField
      FieldName = 'twprice_money'
      DisplayFormat = '0.00'
    end
    object PRICEtwprice_typ: TIntegerField
      FieldName = 'twprice_typ'
    end
    object PRICEtwprice_id: TIntegerField
      FieldName = 'twprice_id'
    end
    object PRICEtwprice_money_origin: TFloatField
      FieldName = 'twprice_origin_money'
    end
    object PRICEtm1: TDateField
      FieldName = 'tm'
    end
    object PRICETWPRICE_DATE: TDateTimeField
      DisplayLabel = 'Дата действия цены'
      FieldName = 'TWPRICE_DATE'
    end
    object PRICEdt_origin: TDateTimeField
      FieldName = 'TWPRICE_ORIGIN_DATE'
    end
    object PRICEnac_percent: TFloatField
      DisplayLabel = 'Наценка, %'
      FieldKind = fkCalculated
      FieldName = 'nac_percent'
      ReadOnly = True
      DisplayFormat = '0.00 %'
      Calculated = True
    end
    object PRICEtw_zak: TFloatField
      FieldName = 'tw_zak'
    end
  end
  object ds_tw_zone_distrib: TDataSource
    DataSet = q_tw_zone_distrib
    Left = 28
    Top = 119
  end
  object q_tw_zone_distrib: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TW_ZONE_DISTRIB(:tw_id)')
    Left = 28
    Top = 183
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tw_id'
        ParamType = ptUnknown
      end>
    object q_tw_zone_distribZONE_ID: TIntegerField
      FieldName = 'ZONE_ID'
      Origin = 'TW_ZONE_DISTRIB.ZONE_ID'
    end
    object q_tw_zone_distribZONE_NAME: TIBStringField
      FieldName = 'ZONE_NAME'
      Origin = 'TW_ZONE_DISTRIB.ZONE_NAME'
      Size = 254
    end
    object q_tw_zone_distribTW_OST: TFloatField
      FieldName = 'TW_OST'
      Origin = 'TW_ZONE_DISTRIB.TW_OST'
      DisplayFormat = '0.000'
    end
  end
end
