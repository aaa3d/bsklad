object Analiz_RN: TAnaliz_RN
  Left = 170
  Top = 145
  Width = 1026
  Height = 718
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Анализ расходной накладной'
  Color = clBtnFace
  Constraints.MinHeight = 505
  Constraints.MinWidth = 794
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 672
    Width = 1018
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1018
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 1
    object ToolButton3: TToolButton
      Left = 0
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton3'
      ImageIndex = 110
      OnClick = ToolButton3Click
    end
    object ToolButton4: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object Label1: TLabel
      Left = 33
      Top = 2
      Width = 76
      Height = 24
      Caption = 'Накладная № :'
      Layout = tlCenter
    end
    object RN_NUM: TEdit
      Left = 109
      Top = 2
      Width = 175
      Height = 24
      Enabled = False
      TabOrder = 0
      Text = 'RN_NUM'
    end
    object ToolButton2: TToolButton
      Left = 284
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object Label2: TLabel
      Left = 292
      Top = 2
      Width = 17
      Height = 24
      Caption = 'от :'
      Layout = tlCenter
    end
    object RN_DATE: TDateEdit
      Left = 309
      Top = 2
      Width = 101
      Height = 24
      Enabled = False
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 1
    end
    object ToolButton5: TToolButton
      Left = 410
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object Label5: TLabel
      Left = 418
      Top = 2
      Width = 30
      Height = 24
      Caption = 'Курс :'
      Layout = tlCenter
    end
    object RN_KURS: TRxCalcEdit
      Left = 448
      Top = 2
      Width = 121
      Height = 24
      AutoSize = False
      DisplayFormat = ',0.00 р/$##'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 1018
    Height = 142
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 2
    object Label4: TLabel
      Left = 33
      Top = 8
      Width = 42
      Height = 13
      Caption = 'Клиент :'
    end
    object Label6: TLabel
      Left = 13
      Top = 30
      Width = 62
      Height = 13
      Caption = 'Основание :'
    end
    object Label7: TLabel
      Left = 543
      Top = 30
      Width = 54
      Height = 13
      Caption = 'Оформил :'
    end
    object Label10: TLabel
      Left = 11
      Top = 76
      Width = 64
      Height = 13
      Caption = 'Через кого :'
    end
    object Label11: TLabel
      Left = 572
      Top = 52
      Width = 25
      Height = 13
      Caption = 'Вид :'
    end
    object Label12: TLabel
      Left = 35
      Top = 98
      Width = 40
      Height = 13
      Caption = 'Сумма :'
    end
    object Label13: TLabel
      Left = 20
      Top = 122
      Width = 50
      Height = 13
      Caption = 'Наценка :'
    end
    object Label3: TLabel
      Left = 548
      Top = 74
      Width = 50
      Height = 13
      Caption = 'Дисконт :'
    end
    object Label8: TLabel
      Left = 508
      Top = 96
      Width = 90
      Height = 13
      Caption = 'Скидка по карте :'
    end
    object Label9: TLabel
      Left = 542
      Top = 8
      Width = 58
      Height = 13
      Caption = 'Со склада :'
    end
    object Label14: TLabel
      Left = 208
      Top = 98
      Width = 30
      Height = 13
      Caption = 'НДС :'
    end
    object DOST_DATE_MET: TLabel
      Left = 584
      Top = 118
      Width = 18
      Height = 13
      Caption = 'на :'
    end
    object Label17: TLabel
      Left = 696
      Top = 96
      Width = 27
      Height = 13
      Caption = 'НДС:'
    end
    object Label15: TLabel
      Left = 216
      Top = 120
      Width = 9
      Height = 13
      Caption = '='
    end
    object Label18: TLabel
      Left = 368
      Top = 120
      Width = 6
      Height = 13
      Caption = '+'
    end
    object KLN_NAME: TEdit
      Left = 80
      Top = 4
      Width = 423
      Height = 21
      Enabled = False
      TabOrder = 0
      Text = 'KLN_NAME'
    end
    object RN_OSN: TMemo
      Left = 80
      Top = 26
      Width = 423
      Height = 45
      Enabled = False
      Lines.Strings = (
        'PN_OSN')
      TabOrder = 1
    end
    object RN_US: TEdit
      Left = 604
      Top = 26
      Width = 177
      Height = 21
      Enabled = False
      TabOrder = 2
      Text = 'RN_US'
    end
    object RN_WHO: TEdit
      Left = 80
      Top = 72
      Width = 423
      Height = 21
      Enabled = False
      TabOrder = 3
      Text = 'RN_WHO'
    end
    object RNVID_NAM: TEdit
      Left = 604
      Top = 48
      Width = 177
      Height = 21
      Enabled = False
      TabOrder = 4
      Text = 'RNVID_NAM'
    end
    object RN_SUMM: TRxCalcEdit
      Left = 80
      Top = 94
      Width = 121
      Height = 21
      AutoSize = False
      DecimalPlaces = 10
      DisplayFormat = ',#0.00 руб'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 5
    end
    object NAC_BEF_1: TRxCalcEdit
      Left = 241
      Top = 120
      Width = 117
      Height = 19
      Hint = 'Наценка до спеццены'
      AutoSize = False
      DecimalPlaces = 10
      DisplayFormat = ',#0.00'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 6
    end
    object RN_PRIBYL: TRxCalcEdit
      Left = 80
      Top = 118
      Width = 121
      Height = 21
      Hint = 'Полная'
      AutoSize = False
      DecimalPlaces = 10
      DisplayFormat = ',#0.00 руб'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 7
    end
    object NAC_AFT_1: TRxCalcEdit
      Left = 384
      Top = 118
      Width = 117
      Height = 21
      Hint = 'Наценка от спеццены'
      AutoSize = False
      DecimalPlaces = 10
      DisplayFormat = ',#0.00'
      Enabled = False
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
    end
    object CARD_NUM: TEdit
      Left = 604
      Top = 70
      Width = 177
      Height = 21
      Enabled = False
      TabOrder = 9
      Text = 'CARD_NUM'
    end
    object RN_SKID: TRxCalcEdit
      Left = 604
      Top = 92
      Width = 75
      Height = 21
      AutoSize = False
      DecimalPlaces = 20
      DisplayFormat = ',#0.00%'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 10
    end
    object SKL_NAME: TEdit
      Left = 604
      Top = 4
      Width = 179
      Height = 21
      TabOrder = 11
      Text = 'SKL_NAME'
    end
    object RN_NDS_SUMM: TRxCalcEdit
      Left = 242
      Top = 92
      Width = 114
      Height = 21
      AutoSize = False
      DecimalPlaces = 10
      DisplayFormat = ',#0.00'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 12
    end
    object DOST: TCheckBox
      Left = 508
      Top = 118
      Width = 75
      Height = 17
      Caption = 'Доставка'
      Enabled = False
      TabOrder = 13
    end
    object DOST_DATE: TDateEdit
      Left = 604
      Top = 114
      Width = 121
      Height = 21
      Enabled = False
      NumGlyphs = 2
      TabOrder = 14
    end
    object NDS2: TRxCalcEdit
      Left = 726
      Top = 92
      Width = 55
      Height = 21
      AutoSize = False
      DecimalPlaces = 20
      DisplayFormat = ',#0.00%'
      Enabled = False
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 15
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 499
    Width = 1018
    Height = 173
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object Label16: TLabel
      Left = 272
      Top = 8
      Width = 305
      Height = 13
      Caption = 'Приходные накладные, с которых продан выбранный товар'
    end
    object RxDBGrid2: TRxDBGrid
      Left = 2
      Top = 26
      Width = 1014
      Height = 145
      Align = alBottom
      DataSource = DsAnalizRNS
      TabOrder = 0
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
          FieldName = 'VID'
          Title.Alignment = taCenter
          Title.Caption = 'Вид прихода'
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FULL_NUM'
          Title.Alignment = taCenter
          Title.Caption = 'Номер накладной'
          Width = 114
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PP_DT'
          Title.Alignment = taCenter
          Title.Caption = 'Дата'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SEB'
          Title.Alignment = taCenter
          Title.Caption = 'Себестоимость'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NDS'
          Title.Alignment = taCenter
          Title.Caption = 'НДС'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CALC_KOL'
          Title.Alignment = taCenter
          Title.Caption = 'Кол-во в расходе'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAC'
          Title.Alignment = taCenter
          Title.Caption = 'Наценка, руб'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAC$'
          Title.Alignment = taCenter
          Title.Caption = 'Наценка, $'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PERCENT'
          Title.Alignment = taCenter
          Title.Caption = '% наценки'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PERCENT$'
          Title.Alignment = taCenter
          Title.Caption = '% наценки, $'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'KLN_FULL'
          Title.Alignment = taCenter
          Title.Caption = 'Поставщик'
          Width = 164
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEN_FULL'
          Title.Alignment = taCenter
          Title.Caption = 'Менеджер-владелец'
          Width = 142
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SKL_SHORT'
          Title.Alignment = taCenter
          Title.Caption = 'Склад'
          Width = 159
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SEB$'
          Title.Alignment = taCenter
          Title.Caption = 'Себестоимость, $'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NDS$'
          Title.Alignment = taCenter
          Title.Caption = 'НДС, $'
          Visible = True
        end>
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 171
    Width = 1018
    Height = 328
    Align = alClient
    DataSource = DsAnalizRN
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
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
        FieldName = 'TW_ART'
        Title.Alignment = taCenter
        Title.Caption = 'Код'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_NAM'
        Title.Alignment = taCenter
        Title.Caption = 'Наименование товара'
        Width = 136
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
        Alignment = taCenter
        Expanded = False
        FieldName = 'ED_SHORT'
        Title.Alignment = taCenter
        Title.Caption = 'Ед.'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_MONEY'
        Title.Alignment = taCenter
        Title.Caption = 'Цена'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_OKMONEY'
        Title.Alignment = taCenter
        Title.Caption = 'Итог. цена'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_OKMONEY$'
        Title.Alignment = taCenter
        Title.Caption = 'Итог. цена, $'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TW_OKSUMM'
        Title.Alignment = taCenter
        Title.Caption = 'Сумма итого'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAC_SUMM'
        Title.Alignment = taCenter
        Title.Caption = 'Сумма нац.'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAC_SUMM$'
        Title.Alignment = taCenter
        Title.Caption = 'Сумма нац., $'
        Visible = False
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'NAC_SUMM_BEF'
        Title.Caption = 'Наценка до спеццены'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAC_SUMM_AFT'
        Title.Caption = 'Наценка от спеццены'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERCENT'
        Title.Alignment = taCenter
        Title.Caption = '% наценки'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERCENT$'
        Title.Alignment = taCenter
        Title.Caption = '% наценки, $'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TW_NDS'
        Title.Alignment = taCenter
        Title.Caption = 'Сумма НДС'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_OKSUMM$'
        Title.Alignment = taCenter
        Title.Caption = 'Сумма итого, $'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TW_SKIDDOLL'
        Title.Alignment = taCenter
        Title.Caption = 'Скидка, $'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TW_SKIDCARD'
        Title.Alignment = taCenter
        Title.Caption = 'Дисконт'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_SKID'
        Title.Alignment = taCenter
        Title.Caption = 'Скидка, %'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SKID_TXT'
        Title.Alignment = taCenter
        Title.Caption = 'Обоснование скидки'
        Width = 100
        Visible = True
      end>
  end
  object AnalizTransaction: TIBTransaction
    Active = True
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 196
    Top = 232
  end
  object QrAnalizRNS: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = AnalizTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from analiz_rashods_fast(:rns_id)'
      'order by pp_dt')
    Left = 276
    Top = 234
    ParamData = <
      item
        DataType = ftInteger
        Name = 'rns_id'
        ParamType = ptInput
      end>
    object QrAnalizRNSPP_TYP: TIntegerField
      FieldName = 'PP_TYP'
      Origin = 'ANALIZ_RASHODS_FAST.PP_TYP'
    end
    object QrAnalizRNSPP_ID: TIntegerField
      FieldName = 'PP_ID'
      Origin = 'ANALIZ_RASHODS_FAST.PP_ID'
    end
    object QrAnalizRNSPP_IDS: TIntegerField
      FieldName = 'PP_IDS'
      Origin = 'ANALIZ_RASHODS_FAST.PP_IDS'
    end
    object QrAnalizRNSVID: TIBStringField
      FieldName = 'VID'
      Origin = 'ANALIZ_RASHODS_FAST.VID'
      Size = 32
    end
    object QrAnalizRNSFULL_NUM: TIBStringField
      FieldName = 'FULL_NUM'
      Origin = 'ANALIZ_RASHODS_FAST.FULL_NUM'
      Size = 64
    end
    object QrAnalizRNSKLN_ID: TIntegerField
      FieldName = 'KLN_ID'
      Origin = 'ANALIZ_RASHODS_FAST.KLN_ID'
    end
    object QrAnalizRNSKLN_FULL: TIBStringField
      FieldName = 'KLN_FULL'
      Origin = 'ANALIZ_RASHODS_FAST.KLN_FULL'
      Size = 254
    end
    object QrAnalizRNSPP_MEN: TIntegerField
      FieldName = 'PP_MEN'
      Origin = 'ANALIZ_RASHODS_FAST.PP_MEN'
    end
    object QrAnalizRNSMEN_FULL: TIBStringField
      FieldName = 'MEN_FULL'
      Origin = 'ANALIZ_RASHODS_FAST.MEN_FULL'
      Size = 254
    end
    object QrAnalizRNSCALC_KOL: TFloatField
      FieldName = 'CALC_KOL'
      Origin = 'ANALIZ_RASHODS_FAST.CALC_KOL'
      DisplayFormat = '#0.0000'
    end
    object QrAnalizRNSSEB: TFloatField
      FieldName = 'SEB'
      Origin = 'ANALIZ_RASHODS_FAST.SEB'
      DisplayFormat = '#0.00 р'
    end
    object QrAnalizRNSSEB2: TFloatField
      FieldName = 'SEB$'
      Origin = 'ANALIZ_RASHODS_FAST.SEB$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnalizRNSNDS: TFloatField
      FieldName = 'NDS'
      Origin = 'ANALIZ_RASHODS_FAST.NDS'
      DisplayFormat = '#0.00 р'
    end
    object QrAnalizRNSNDS2: TFloatField
      FieldName = 'NDS$'
      Origin = 'ANALIZ_RASHODS_FAST.NDS$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnalizRNSNAC: TFloatField
      FieldName = 'NAC'
      Origin = 'ANALIZ_RASHODS_FAST.NAC'
      DisplayFormat = '#0.00 р'
    end
    object QrAnalizRNSNAC2: TFloatField
      FieldName = 'NAC$'
      Origin = 'ANALIZ_RASHODS_FAST.NAC$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnalizRNSPERCENT: TFloatField
      FieldName = 'PERCENT'
      Origin = 'ANALIZ_RASHODS_FAST.PERCENT'
      DisplayFormat = '#0.00%'
    end
    object QrAnalizRNSPERCENT2: TFloatField
      FieldName = 'PERCENT$'
      Origin = 'ANALIZ_RASHODS_FAST.PERCENT$'
      DisplayFormat = '#0.00%'
    end
    object QrAnalizRNSSHOP_COLOR: TIntegerField
      FieldName = 'SHOP_COLOR'
      Origin = 'ANALIZ_RASHODS_FAST.SHOP_COLOR'
    end
    object QrAnalizRNSSKL_SHORT: TIBStringField
      FieldName = 'SKL_SHORT'
      Origin = 'ANALIZ_RASHODS_FAST.SKL_SHORT'
      Size = 64
    end
    object QrAnalizRNSPP_DT: TDateTimeField
      FieldName = 'PP_DT'
      Origin = 'ANALIZ_RASHODS_FAST.PP_DT'
    end
  end
  object DsAnalizRNS: TDataSource
    DataSet = QrAnalizRNS
    Left = 276
    Top = 296
  end
  object DsAnalizRN: TDataSource
    DataSet = QrAnalizRN
    Left = 352
    Top = 276
  end
  object QrAnalizRN: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = AnalizTransaction
    AfterOpen = QrAnalizRNAfterScroll
    AfterScroll = QrAnalizRNAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from analiz_rashod_fast(:RN_ID) order by rns_id')
    Left = 352
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RN_ID'
        ParamType = ptInput
      end>
    object QrAnalizRNRNS_ID: TIntegerField
      FieldName = 'RNS_ID'
      Origin = 'ANALIZ_RASHOD_FAST.RNS_ID'
    end
    object QrAnalizRNTW_ID: TIntegerField
      FieldName = 'TW_ID'
      Origin = 'ANALIZ_RASHOD_FAST.TW_ID'
    end
    object QrAnalizRNTW_ART: TIntegerField
      FieldName = 'TW_ART'
      Origin = 'ANALIZ_RASHOD_FAST.TW_ART'
    end
    object QrAnalizRNTW_NAM: TIBStringField
      FieldName = 'TW_NAM'
      Origin = 'ANALIZ_RASHOD_FAST.TW_NAM'
      Size = 128
    end
    object QrAnalizRNED_SHORT: TIBStringField
      FieldName = 'ED_SHORT'
      Origin = 'ANALIZ_RASHOD_FAST.ED_SHORT'
      Size = 6
    end
    object QrAnalizRNTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      Origin = 'ANALIZ_RASHOD_FAST.TW_KOL'
      DisplayFormat = '#0.0000'
    end
    object QrAnalizRNTW_MONEY: TFloatField
      FieldName = 'TW_MONEY'
      Origin = 'ANALIZ_RASHOD_FAST.TW_MONEY'
      DisplayFormat = '#0.00 р'
    end
    object QrAnalizRNTW_SKID: TFloatField
      FieldName = 'TW_SKID'
      Origin = 'ANALIZ_RASHOD_FAST.TW_SKID'
      DisplayFormat = '#0.000%'
    end
    object QrAnalizRNTW_SKIDDOLL: TFloatField
      FieldName = 'TW_SKIDDOLL'
      Origin = 'ANALIZ_RASHOD_FAST.TW_SKIDDOLL'
      DisplayFormat = '#0.000%'
    end
    object QrAnalizRNTW_SKIDCARD: TFloatField
      FieldName = 'TW_SKIDCARD'
      Origin = 'ANALIZ_RASHOD_FAST.TW_SKIDCARD'
      DisplayFormat = '#0.000%'
    end
    object QrAnalizRNTW_OKMONEY: TFloatField
      FieldName = 'TW_OKMONEY'
      Origin = 'ANALIZ_RASHOD_FAST.TW_OKMONEY'
      DisplayFormat = '#0.00р'
    end
    object QrAnalizRNTW_OKMONEY2: TFloatField
      FieldName = 'TW_OKMONEY$'
      Origin = 'ANALIZ_RASHOD_FAST.TW_OKMONEY$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnalizRNTW_OKSUMM: TFloatField
      FieldName = 'TW_OKSUMM'
      Origin = 'ANALIZ_RASHOD_FAST.TW_OKSUMM'
      DisplayFormat = '#0.00р'
    end
    object QrAnalizRNTW_OKSUMM2: TFloatField
      FieldName = 'TW_OKSUMM$'
      Origin = 'ANALIZ_RASHOD_FAST.TW_OKSUMM$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnalizRNNAC_SUMM: TFloatField
      FieldName = 'NAC_SUMM'
      Origin = 'ANALIZ_RASHOD_FAST.NAC_SUMM'
      DisplayFormat = '#0.00р'
    end
    object QrAnalizRNNAC_SUMM2: TFloatField
      FieldName = 'NAC_SUMM$'
      Origin = 'ANALIZ_RASHOD_FAST.NAC_SUMM$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnalizRNPERCENT: TFloatField
      FieldName = 'PERCENT'
      Origin = 'ANALIZ_RASHOD_FAST.PERCENT'
      DisplayFormat = '#0.00%'
    end
    object QrAnalizRNPERCENT2: TFloatField
      FieldName = 'PERCENT$'
      Origin = 'ANALIZ_RASHOD_FAST.PERCENT$'
      DisplayFormat = '#0.00%'
    end
    object QrAnalizRNSKID_TXT: TIBStringField
      FieldName = 'SKID_TXT'
      Origin = 'ANALIZ_RASHOD_FAST.SKID_TXT'
      Size = 254
    end
    object QrAnalizRNTW_NDS: TFloatField
      FieldName = 'TW_NDS'
      Origin = 'ANALIZ_RASHOD_FAST.TW_NDS'
      DisplayFormat = '#0.00 р'
    end
    object QrAnalizRNTW_NSP: TFloatField
      FieldName = 'TW_NSP'
      Origin = 'ANALIZ_RASHOD_FAST.TW_NSP'
      DisplayFormat = '#0.00 р'
    end
    object QrAnalizRNNAC_SUMM_BEF: TFloatField
      FieldName = 'NAC_SUMM_BEF'
      Origin = 'ANALIZ_RASHOD_FAST.NAC_SUMM_BEF'
      DisplayFormat = '#0.00 р'
    end
    object QrAnalizRNNAC_SUMM_AFT: TFloatField
      FieldName = 'NAC_SUMM_AFT'
      Origin = 'ANALIZ_RASHOD_FAST.NAC_SUMM_AFT'
      DisplayFormat = '#0.00 р'
    end
    object QrAnalizRNTW_MONEY_SPEC: TFloatField
      FieldName = 'TW_MONEY_SPEC'
      Origin = 'ANALIZ_RASHOD_FAST.TW_MONEY_SPEC'
    end
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = AnalizTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 424
    Top = 236
  end
end
