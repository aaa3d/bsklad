object Analiz_PN: TAnaliz_PN
  Left = 316
  Top = 230
  Width = 795
  Height = 520
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Анализ приходной накладной'
  Color = clBtnFace
  Constraints.MinHeight = 520
  Constraints.MinWidth = 795
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
    Top = 467
    Width = 787
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 787
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Hint = 'Печать анализа приходной накладной...'
      Caption = 'ToolButton1'
      ImageIndex = 9
      Visible = False
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 33
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton3'
      ImageIndex = 110
      OnClick = ToolButton3Click
    end
    object chDeepAnaliz: TCheckBox
      Left = 58
      Top = 2
      Width = 235
      Height = 24
      Caption = 'Сквозной анализ'
      TabOrder = 0
      OnClick = chDeepAnalizClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 787
    Height = 180
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 4
      Top = 12
      Width = 76
      Height = 13
      Caption = 'Накладная № :'
    end
    object Label2: TLabel
      Left = 228
      Top = 12
      Width = 17
      Height = 13
      Caption = 'от :'
    end
    object Label3: TLabel
      Left = 360
      Top = 12
      Width = 72
      Height = 13
      Caption = 'Дата оплаты :'
    end
    object Label4: TLabel
      Left = 16
      Top = 36
      Width = 64
      Height = 13
      Caption = 'Поставщик :'
    end
    object Label5: TLabel
      Left = 624
      Top = 36
      Width = 30
      Height = 13
      Caption = 'Курс :'
    end
    object Label6: TLabel
      Left = 18
      Top = 60
      Width = 62
      Height = 13
      Caption = 'Основание :'
    end
    object Label7: TLabel
      Left = 543
      Top = 60
      Width = 54
      Height = 13
      Caption = 'Оформил :'
    end
    object Label8: TLabel
      Left = 542
      Top = 84
      Width = 55
      Height = 13
      Caption = 'Владелец :'
    end
    object Label10: TLabel
      Left = 16
      Top = 108
      Width = 64
      Height = 13
      Caption = 'Через кого :'
    end
    object Label11: TLabel
      Left = 572
      Top = 108
      Width = 25
      Height = 13
      Caption = 'Вид :'
    end
    object Label12: TLabel
      Left = 40
      Top = 132
      Width = 40
      Height = 13
      Caption = 'Сумма :'
    end
    object Label13: TLabel
      Left = 28
      Top = 156
      Width = 52
      Height = 13
      Caption = 'Прибыль :'
    end
    object Label14: TLabel
      Left = 428
      Top = 132
      Width = 101
      Height = 13
      Caption = 'Остаток в закупке :'
    end
    object PN_NUM: TEdit
      Left = 88
      Top = 8
      Width = 133
      Height = 21
      Enabled = False
      TabOrder = 0
      Text = 'PN_NUM'
    end
    object PN_DATE: TDateEdit
      Left = 252
      Top = 8
      Width = 101
      Height = 21
      Enabled = False
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 1
    end
    object PN_DATE_OPL: TDateEdit
      Left = 436
      Top = 8
      Width = 101
      Height = 21
      Enabled = False
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 2
    end
    object POST_NAME: TEdit
      Left = 88
      Top = 32
      Width = 449
      Height = 21
      Enabled = False
      TabOrder = 3
      Text = 'POST_NAME'
    end
    object PN_KURS: TRxCalcEdit
      Left = 660
      Top = 32
      Width = 121
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00 р/$##'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 4
    end
    object PN_OSN: TMemo
      Left = 88
      Top = 56
      Width = 449
      Height = 45
      Enabled = False
      Lines.Strings = (
        'PN_OSN')
      TabOrder = 5
    end
    object PN_US: TEdit
      Left = 604
      Top = 56
      Width = 177
      Height = 21
      Enabled = False
      TabOrder = 6
      Text = 'PN_US'
    end
    object PN_OWNER: TEdit
      Left = 604
      Top = 80
      Width = 177
      Height = 21
      Enabled = False
      TabOrder = 7
      Text = 'PN_OWNER'
    end
    object PN_WHO: TEdit
      Left = 88
      Top = 104
      Width = 449
      Height = 21
      Enabled = False
      TabOrder = 8
      Text = 'PN_WHO'
    end
    object PNVID_NAM: TEdit
      Left = 604
      Top = 104
      Width = 177
      Height = 21
      Enabled = False
      TabOrder = 9
      Text = 'PNVID_NAM'
    end
    object PN_SUMM: TRxCalcEdit
      Left = 88
      Top = 128
      Width = 121
      Height = 21
      AutoSize = False
      DecimalPlaces = 10
      DisplayFormat = ',#0.00 руб'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 10
    end
    object PN_SUMMD: TRxCalcEdit
      Left = 212
      Top = 128
      Width = 121
      Height = 21
      AutoSize = False
      DecimalPlaces = 10
      DisplayFormat = ',#0.00 $'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 11
      Visible = False
    end
    object PN_PRIBYL: TRxCalcEdit
      Left = 88
      Top = 152
      Width = 121
      Height = 21
      AutoSize = False
      DecimalPlaces = 10
      DisplayFormat = ',#0.00 руб'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 12
    end
    object PN_PRIBYLD: TRxCalcEdit
      Left = 212
      Top = 152
      Width = 121
      Height = 21
      AutoSize = False
      DecimalPlaces = 10
      DisplayFormat = ',#0.00 $'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 13
      Visible = False
    end
    object PN_OST: TRxCalcEdit
      Left = 536
      Top = 128
      Width = 121
      Height = 21
      AutoSize = False
      DecimalPlaces = 10
      DisplayFormat = ',#0.00 руб'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 14
    end
    object PN_OSTD: TRxCalcEdit
      Left = 660
      Top = 128
      Width = 121
      Height = 21
      AutoSize = False
      DecimalPlaces = 10
      DisplayFormat = ',#0.00 $'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 15
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 315
    Width = 787
    Height = 152
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object Label16: TLabel
      Left = 308
      Top = 4
      Width = 148
      Height = 13
      Caption = 'Продажи выбранного товара'
    end
    object RxDBGrid2: TRxDBGrid
      Left = 2
      Top = 20
      Width = 783
      Height = 130
      Align = alBottom
      DataSource = DsAnalizPNS
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
          Title.Caption = 'Вид документа'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FULL_NUM'
          Title.Alignment = taCenter
          Title.Caption = 'Номер накладной'
          Width = 134
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT'
          Title.Alignment = taCenter
          Title.Caption = 'Дата'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TW_MONEY'
          Title.Alignment = taCenter
          Title.Caption = 'Цена, руб'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TW_OKMONEY'
          Title.Alignment = taCenter
          Title.Caption = 'Итог цена'
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
          FieldName = 'TW_OKSUMM'
          Title.Alignment = taCenter
          Title.Caption = 'Сумма'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAC_SUMM'
          Title.Alignment = taCenter
          Title.Caption = 'Наценка'
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
          FieldName = 'KLN_FULL'
          Title.Alignment = taCenter
          Title.Caption = 'Клиент'
          Width = 165
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TW_SKIDDOLL'
          Title.Alignment = taCenter
          Title.Caption = 'Скидка на $'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TW_SKIDCARD'
          Title.Alignment = taCenter
          Title.Caption = 'Дисконт'
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
          FieldName = 'SKL_SHORT'
          Title.Alignment = taCenter
          Title.Caption = 'Склад'
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TW_OKSUMM$'
          Title.Alignment = taCenter
          Title.Caption = 'Сумма, $'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NAC_SUMM$'
          Title.Alignment = taCenter
          Title.Caption = 'Наценка, $'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PERCENT$'
          Title.Alignment = taCenter
          Title.Caption = '% наценки, $'
          Visible = False
        end>
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 209
    Width = 787
    Height = 106
    Align = alClient
    DataSource = DsAnalizPN
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
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEB'
        Title.Alignment = taCenter
        Title.Caption = 'Себест.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NDS'
        Title.Alignment = taCenter
        Title.Caption = 'НДС'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_MONEY'
        Title.Alignment = taCenter
        Title.Caption = 'Цена'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ED_SHORT'
        Title.Alignment = taCenter
        Title.Caption = 'Ед.'
        Width = 34
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
        FieldName = 'TW_SUMM'
        Title.Alignment = taCenter
        Title.Caption = 'Сумма'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OST'
        Title.Alignment = taCenter
        Title.Caption = 'Остаток'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAC_SUMM'
        Title.Alignment = taCenter
        Title.Caption = 'Сумма наценки'
        Width = 89
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
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TW_MONEY$'
        Title.Alignment = taCenter
        Title.Caption = 'Цена, $'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TW_SUMM$'
        Title.Alignment = taCenter
        Title.Caption = 'Сумма, $'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NAC_SUMM$'
        Title.Alignment = taCenter
        Title.Caption = 'Сумма наценки, $'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PERCENT$'
        Title.Caption = '% наценки, $'
        Visible = False
      end>
  end
  object AnalizTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 196
    Top = 232
  end
  object QrAnalizPNS: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = AnalizTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from analiz_prihods_fast(:pns$_id)'
      'order by dt')
    Left = 276
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pns$_id'
        ParamType = ptUnknown
      end>
    object QrAnalizPNSID: TIntegerField
      FieldName = 'ID'
      Origin = 'ANALIZ_PRIHODS_FAST.ID'
    end
    object QrAnalizPNSIDS: TIntegerField
      FieldName = 'IDS'
      Origin = 'ANALIZ_PRIHODS_FAST.IDS'
    end
    object QrAnalizPNSTYP: TIntegerField
      FieldName = 'TYP'
      Origin = 'ANALIZ_PRIHODS_FAST.TYP'
    end
    object QrAnalizPNSVID: TIBStringField
      FieldName = 'VID'
      Origin = 'ANALIZ_PRIHODS_FAST.VID'
      Size = 32
    end
    object QrAnalizPNSFULL_NUM: TIBStringField
      FieldName = 'FULL_NUM'
      Origin = 'ANALIZ_PRIHODS_FAST.FULL_NUM'
      Size = 64
    end
    object QrAnalizPNSKLN_ID: TIntegerField
      FieldName = 'KLN_ID'
      Origin = 'ANALIZ_PRIHODS_FAST.KLN_ID'
    end
    object QrAnalizPNSKLN_FULL: TIBStringField
      FieldName = 'KLN_FULL'
      Origin = 'ANALIZ_PRIHODS_FAST.KLN_FULL'
      Size = 254
    end
    object QrAnalizPNSTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      Origin = 'ANALIZ_PRIHODS_FAST.TW_KOL'
      DisplayFormat = '#0.0000'
    end
    object QrAnalizPNSTW_MONEY: TFloatField
      FieldName = 'TW_MONEY'
      Origin = 'ANALIZ_PRIHODS_FAST.TW_MONEY'
      DisplayFormat = '#0.00 р'
    end
    object QrAnalizPNSTW_SKID: TFloatField
      FieldName = 'TW_SKID'
      Origin = 'ANALIZ_PRIHODS_FAST.TW_SKID'
      DisplayFormat = '#0.00%'
    end
    object QrAnalizPNSTW_SKIDDOLL: TFloatField
      FieldName = 'TW_SKIDDOLL'
      Origin = 'ANALIZ_PRIHODS_FAST.TW_SKIDDOLL'
      DisplayFormat = '#0.00%'
    end
    object QrAnalizPNSTW_SKIDCARD: TFloatField
      FieldName = 'TW_SKIDCARD'
      Origin = 'ANALIZ_PRIHODS_FAST.TW_SKIDCARD'
      DisplayFormat = '#0.00%'
    end
    object QrAnalizPNSTW_OKMONEY: TFloatField
      FieldName = 'TW_OKMONEY'
      Origin = 'ANALIZ_PRIHODS_FAST.TW_OKMONEY'
      DisplayFormat = '#0.00 р'
    end
    object QrAnalizPNSTW_OKMONEY2: TFloatField
      FieldName = 'TW_OKMONEY$'
      Origin = 'ANALIZ_PRIHODS_FAST.TW_OKMONEY$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnalizPNSTW_OKSUMM: TFloatField
      FieldName = 'TW_OKSUMM'
      Origin = 'ANALIZ_PRIHODS_FAST.TW_OKSUMM'
      DisplayFormat = '#0.00 р'
    end
    object QrAnalizPNSTW_OKSUMM2: TFloatField
      FieldName = 'TW_OKSUMM$'
      Origin = 'ANALIZ_PRIHODS_FAST.TW_OKSUMM$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnalizPNSNAC_SUMM: TFloatField
      FieldName = 'NAC_SUMM'
      Origin = 'ANALIZ_PRIHODS_FAST.NAC_SUMM'
      DisplayFormat = '#0.00 р'
    end
    object QrAnalizPNSNAC_SUMM2: TFloatField
      FieldName = 'NAC_SUMM$'
      Origin = 'ANALIZ_PRIHODS_FAST.NAC_SUMM$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnalizPNSPERCENT: TFloatField
      FieldName = 'PERCENT'
      Origin = 'ANALIZ_PRIHODS_FAST.PERCENT'
      DisplayFormat = '#0.00 %'
    end
    object QrAnalizPNSPERCENT2: TFloatField
      FieldName = 'PERCENT$'
      Origin = 'ANALIZ_PRIHODS_FAST.PERCENT$'
      DisplayFormat = '#0.00 %'
    end
    object QrAnalizPNSSKID_TXT: TIBStringField
      FieldName = 'SKID_TXT'
      Origin = 'ANALIZ_PRIHODS_FAST.SKID_TXT'
      Size = 254
    end
    object QrAnalizPNSTW_NDS: TFloatField
      FieldName = 'TW_NDS'
      Origin = 'ANALIZ_PRIHODS_FAST.TW_NDS'
    end
    object QrAnalizPNSTW_NSP: TFloatField
      FieldName = 'TW_NSP'
      Origin = 'ANALIZ_PRIHODS_FAST.TW_NSP'
    end
    object QrAnalizPNSSHOP_COLOR: TIntegerField
      FieldName = 'SHOP_COLOR'
      Origin = 'ANALIZ_PRIHODS_FAST.SHOP_COLOR'
    end
    object QrAnalizPNSOSN: TIBStringField
      FieldName = 'OSN'
      Origin = 'ANALIZ_PRIHODS_FAST.OSN'
      Size = 254
    end
    object QrAnalizPNSSKL_SHORT: TIBStringField
      FieldName = 'SKL_SHORT'
      Origin = 'ANALIZ_PRIHODS_FAST.SKL_SHORT'
      Size = 64
    end
    object QrAnalizPNSSEB: TFloatField
      FieldName = 'SEB'
      Origin = 'ANALIZ_PRIHODS_FAST.SEB'
      DisplayFormat = '#0.00 р'
    end
    object QrAnalizPNSSEB2: TFloatField
      FieldName = 'SEB$'
      Origin = 'ANALIZ_PRIHODS_FAST.SEB$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnalizPNSNDS: TFloatField
      FieldName = 'NDS'
      Origin = 'ANALIZ_PRIHODS_FAST.NDS'
      DisplayFormat = '#0.00 р'
    end
    object QrAnalizPNSNDS2: TFloatField
      FieldName = 'NDS$'
      Origin = 'ANALIZ_PRIHODS_FAST.NDS$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnalizPNSDT: TDateTimeField
      FieldName = 'DT'
      Origin = 'ANALIZ_PRIHODS_FAST.DT'
    end
  end
  object DsAnalizPNS: TDataSource
    DataSet = QrAnalizPNS
    Left = 276
    Top = 280
  end
  object QrAnalizPN: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = AnalizTransaction
    AfterOpen = QrAnalizPNAfterOpen
    AfterScroll = QrAnalizPNAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from analiz_prihod_fast(:pn_id)'
      'order by pns$_id')
    Left = 352
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PN_ID'
        ParamType = ptInput
      end>
    object QrAnalizPNPNS_ID: TIntegerField
      FieldName = 'PNS$_ID'
      Origin = 'ANALIZ_PRIHOD_FAST.PNS$_ID'
    end
    object QrAnalizPNTW_ID: TIntegerField
      FieldName = 'TW_ID'
      Origin = 'ANALIZ_PRIHOD_FAST.TW_ID'
    end
    object QrAnalizPNTW_ART: TIntegerField
      FieldName = 'TW_ART'
      Origin = 'ANALIZ_PRIHOD_FAST.TW_ART'
    end
    object QrAnalizPNTW_NAM: TIBStringField
      FieldName = 'TW_NAM'
      Origin = 'ANALIZ_PRIHOD_FAST.TW_NAM'
      Size = 128
    end
    object QrAnalizPNED_SHORT: TIBStringField
      FieldName = 'ED_SHORT'
      Origin = 'ANALIZ_PRIHOD_FAST.ED_SHORT'
      Size = 6
    end
    object QrAnalizPNTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      Origin = 'ANALIZ_PRIHOD_FAST.TW_KOL'
      DisplayFormat = '#0.0000'
    end
    object QrAnalizPNTW_MONEY: TFloatField
      FieldName = 'TW_MONEY'
      Origin = 'ANALIZ_PRIHOD_FAST.TW_MONEY'
      DisplayFormat = '#0.00 р'
    end
    object QrAnalizPNSEB: TFloatField
      FieldName = 'SEB'
      Origin = 'ANALIZ_PRIHOD_FAST.SEB'
      DisplayFormat = '#0.00 р'
    end
    object QrAnalizPNNDS: TFloatField
      FieldName = 'NDS'
      Origin = 'ANALIZ_PRIHOD_FAST.NDS'
      DisplayFormat = '#0.00 р'
    end
    object QrAnalizPNTW_SUMM: TFloatField
      FieldName = 'TW_SUMM'
      Origin = 'ANALIZ_PRIHOD_FAST.TW_SUMM'
      DisplayFormat = '#0.00 р'
    end
    object QrAnalizPNTW_MONEY2: TFloatField
      FieldName = 'TW_MONEY$'
      Origin = 'ANALIZ_PRIHOD_FAST.TW_MONEY$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnalizPNSEB2: TFloatField
      FieldName = 'SEB$'
      Origin = 'ANALIZ_PRIHOD_FAST.SEB$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnalizPNNDS2: TFloatField
      FieldName = 'NDS$'
      Origin = 'ANALIZ_PRIHOD_FAST.NDS$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnalizPNTW_SUMM2: TFloatField
      FieldName = 'TW_SUMM$'
      Origin = 'ANALIZ_PRIHOD_FAST.TW_SUMM$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnalizPNOST: TFloatField
      FieldName = 'OST'
      Origin = 'ANALIZ_PRIHOD_FAST.OST'
      DisplayFormat = '#0.0000'
    end
    object QrAnalizPNNAC_SUMM: TFloatField
      FieldName = 'NAC_SUMM'
      Origin = 'ANALIZ_PRIHOD_FAST.NAC_SUMM'
      DisplayFormat = '#0.00 р'
    end
    object QrAnalizPNNAC_SUMM2: TFloatField
      FieldName = 'NAC_SUMM$'
      Origin = 'ANALIZ_PRIHOD_FAST.NAC_SUMM$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnalizPNPERCENT: TFloatField
      FieldName = 'PERCENT'
      Origin = 'ANALIZ_PRIHOD_FAST.PERCENT'
      DisplayFormat = '#0.00 %'
    end
    object QrAnalizPNPERCENT2: TFloatField
      FieldName = 'PERCENT$'
      Origin = 'ANALIZ_PRIHOD_FAST.PERCENT$'
      DisplayFormat = '#0.00 %'
    end
    object QrAnalizPNRASHOD: TFloatField
      FieldName = 'RASHOD'
      Origin = 'ANALIZ_PRIHOD_FAST.RASHOD'
      DisplayFormat = '#0.0000'
    end
  end
  object DsAnalizPN: TDataSource
    DataSet = QrAnalizPN
    Left = 352
    Top = 284
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
