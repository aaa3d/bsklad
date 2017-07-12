inherited Jou_CARD: TJou_CARD
  Left = 509
  Top = 258
  Caption = 'Журнал пластиковых дисконтных карт'
  ClientWidth = 990
  OldCreateOrder = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 990
    inherited BtnProw: TToolButton
      Visible = False
    end
    inherited BtnUnProw: TToolButton
      Visible = False
    end
    inherited ToolButton5: TToolButton
      Visible = False
    end
    inherited BtnNew: TToolButton
      Hint = 'Зарегистрировать дисконтную карту...(INS)'
      Caption = 'fj'
      OnClick = BtnNewClick
    end
    inherited BtnOpen: TToolButton
      Hint = 'Открыть карточку дисконтной карты...(Enter)'
      OnClick = BtnOpenClick
    end
    inherited btnOpenSale: TToolButton
      Visible = False
    end
    inherited BtnCopy: TToolButton
      Visible = False
    end
    inherited BtnDel: TToolButton
      Hint = 'Удалить дисконтную карту...(DEL)'
      OnClick = BtnDelClick
    end
    inherited ToolButton8: TToolButton
      Visible = False
    end
    inherited BtnPrint: TToolButton
      Visible = False
    end
    inherited BtnPropertis: TToolButton
      Visible = False
    end
    inherited BtnFind: TToolButton
      Visible = False
    end
    inherited ToolButton14: TToolButton
      Visible = False
    end
    inherited BtnAnaliz: TToolButton
      Enabled = False
      Visible = False
    end
    inherited BtnSubDoc: TToolButton
      Enabled = False
      Visible = False
    end
    inherited ToolButton16: TToolButton
      Enabled = False
      Visible = False
    end
    inherited BtnInterval: TToolButton
      Visible = False
    end
    inherited ToolButton2: TToolButton
      Visible = False
    end
    inherited BtnAdm: TToolButton
      Visible = False
    end
    object BtnDeliveryCARD: TToolButton
      Left = 452
      Top = 2
      Hint = 'Выдать дисконтную карту...(Enter)'
      Caption = 'BtnDeliveryCARD'
      ImageIndex = 21
      OnClick = BtnDeliveryCARDClick
    end
    object BtnExportToExcel: TToolButton
      Left = 477
      Top = 2
      Hint = 'Выгрузить список дисконтных карт в MS Excel'
      Caption = 'Выгрузить список дисконтных карт в MS Excel'
      ImageIndex = 141
      OnClick = BtnExportToExcelClick
    end
    object ToolButton6: TToolButton
      Left = 502
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 27
      Style = tbsSeparator
    end
    object BtnFilter: TToolButton
      Left = 510
      Top = 2
      Caption = 'BtnFilter'
      ImageIndex = 11
      OnClick = BtnFilterClick
    end
    object CBFilterEnabled: TCheckBox
      Left = 535
      Top = 2
      Width = 97
      Height = 24
      Alignment = taLeftJustify
      Caption = 'Фильтровать:'
      TabOrder = 0
      OnClick = CBFilterEnabledClick
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 990
    Panels = <
      item
        Width = 50
      end>
  end
  inherited Panel1: TPanel
    Top = 89
    Width = 990
    Height = 240
    inherited StatusBar2: TStatusBar
      Width = 990
      Panels = <
        item
          Width = 220
        end
        item
          Width = 50
        end>
    end
    inherited RxDBGrid1: TRxDBGrid
      Width = 990
      Height = 221
      DataSource = DsListCard
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OnDrawColumnCell = RxDBGrid1DrawColumnCell
      OnDblClick = RxDBGrid1DblClick
      OnKeyPress = RxDBGrid1KeyPress
      TitleButtons = True
      OnCheckButton = RxDBGrid1CheckButton
      OnGetCellParams = RxDBGrid1GetCellParams
      OnGetBtnParams = RxDBGrid1GetBtnParams
      OnTitleBtnClick = RxDBGrid1TitleBtnClick
    end
  end
  object PFilterInfo: TPanel
    Left = 0
    Top = 29
    Width = 990
    Height = 60
    Align = alTop
    TabOrder = 3
    object LFilterInfo: TLabel
      Left = 1
      Top = 1
      Width = 720
      Height = 58
      Align = alLeft
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object chkShowblocked: TCheckBox
      Left = 736
      Top = 2
      Width = 245
      Height = 24
      BiDiMode = bdLeftToRight
      Caption = 'Показывать блокированные и замененные'
      ParentBiDiMode = False
      TabOrder = 0
      OnClick = chkShowblockedClick
    end
    object chkShowAnaliz: TCheckBox
      Left = 736
      Top = 26
      Width = 245
      Height = 24
      BiDiMode = bdLeftToRight
      Caption = 'Выводить статистику (медленно)'
      ParentBiDiMode = False
      TabOrder = 1
      OnClick = chkShowblockedClick
    end
  end
  object ListCardTransaction: TIBTransaction
    Active = True
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 212
    Top = 109
  end
  object QrListCard: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ListCardTransaction
    AfterOpen = QrListCardAfterOpen
    AfterScroll = QrListCardAfterScroll
    BeforeOpen = QrListCardBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM LIST_CARD_FULL('
      ':REG_DATE_FROM, :REG_DATE_TO, '
      ':CARD_DATE_FROM, :CARD_DATE_TO, '
      ':CARD_SKID_FROM, :CARD_SKID_TO, '
      ':SALES_DATE_FROM, :SALES_DATE_TO, '
      ':SUMM_SKID_FROM, :SUMM_SKID_TO, '
      ':SUMM_SALES_FROM, :SUMM_SALES_TO, '
      ':COUNT_PURCHASE_FROM, :COUNT_PURCHASE_TO, '
      ':SALE_SHOP_ID,'
      ':KLN_BIRTHDAY_FROM, :KLN_BIRTHDAY_TO,'
      ':IN_US_ID,'
      ':IN_CARDSKID_ID,'
      ':IN_KLN_FIO,'
      ':IN_CARD_NUM,'
      ':KLN_BIRTHDAY_OF_YEAR_FROM,'
      ':KLN_BIRTHDAY_OF_YEAR_TO,'
      ':show_Blocked_changed,'
      ':in_sms,'
      ':in_pers,'
      ':in_sex,'
      ':in_rekl,'
      ':in_show_analiz'
      ')'
      ''
      ''
      'ORDER BY CARD_FULL_NUM')
    Left = 308
    Top = 129
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'REG_DATE_FROM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'REG_DATE_TO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'CARD_DATE_FROM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'CARD_DATE_TO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CARD_SKID_FROM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CARD_SKID_TO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'SALES_DATE_FROM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'SALES_DATE_TO'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'SUMM_SKID_FROM'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'SUMM_SKID_TO'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'SUMM_SALES_FROM'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'SUMM_SALES_TO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COUNT_PURCHASE_FROM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COUNT_PURCHASE_TO'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'SALE_SHOP_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'KLN_BIRTHDAY_FROM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'KLN_BIRTHDAY_TO'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'IN_US_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_CARDSKID_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_KLN_FIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_CARD_NUM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'KLN_BIRTHDAY_OF_YEAR_FROM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'KLN_BIRTHDAY_OF_YEAR_TO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'show_Blocked_changed'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'in_sms'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'in_pers'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'in_sex'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'in_rekl'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'in_show_analiz'
        ParamType = ptUnknown
      end>
    object QrListCardCARD_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'CARD_ID'
      ReadOnly = True
      Visible = False
    end
    object QrListCardCARD_FULL_NUM: TIBStringField
      DisplayLabel = 'Номер'
      DisplayWidth = 14
      FieldKind = fkInternalCalc
      FieldName = 'CARD_FULL_NUM'
      ReadOnly = True
      Size = 64
    end
    object QrListCardREG_DATE: TDateTimeField
      DisplayLabel = 'Дата регистрации'
      FieldName = 'REG_DATE'
      Origin = 'LIST_CARD.REG_DATE'
    end
    object QrListCardCARD_DATE: TDateTimeField
      DisplayLabel = 'Дата выдачи'
      FieldKind = fkInternalCalc
      FieldName = 'CARD_DATE'
      ReadOnly = True
    end
    object QrListCardREG_USER_FULL: TIBStringField
      DisplayLabel = 'Кто регистрировал'
      DisplayWidth = 18
      FieldName = 'REG_USER_FULL'
      Origin = 'LIST_CARD.REG_USER_FULL'
      Size = 254
    end
    object QrListCardUS_FULL: TIBStringField
      DisplayLabel = 'Кто выдал'
      DisplayWidth = 18
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 254
    end
    object QrListCardCARD_COLOR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'CARD_COLOR'
      ReadOnly = True
      Visible = False
    end
    object QrListCardCARD_OSN: TIBStringField
      DisplayLabel = 'Основание'
      DisplayWidth = 25
      FieldKind = fkInternalCalc
      FieldName = 'CARD_OSN'
      ReadOnly = True
      Size = 254
    end
    object QrListCardSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
      Origin = 'LIST_CARD.SHOP_ID'
      Visible = False
    end
    object QrListCardKLN_BIRTHDAY: TDateTimeField
      FieldName = 'KLN_BIRTHDAY'
      Origin = 'LIST_CARD.KLN_BIRTHDAY'
      Visible = False
    end
    object QrListCardREG_USER_ID: TIntegerField
      FieldName = 'REG_USER_ID'
      Origin = 'LIST_CARD.REG_USER_ID'
      Visible = False
    end
    object QrListCardCARD_NUM: TIntegerField
      FieldName = 'CARD_NUM'
      Origin = 'LIST_CARD_FULL.CARD_NUM'
      Visible = False
    end
    object QrListCardKLN_ID: TIntegerField
      FieldName = 'KLN_ID'
      Origin = 'LIST_CARD_FULL.KLN_ID'
      Visible = False
    end
    object QrListCardUS_ID: TIntegerField
      FieldName = 'US_ID'
      Origin = 'LIST_CARD_FULL.US_ID'
      Visible = False
    end
    object QrListCardRN_DATE: TDateTimeField
      FieldName = 'RN_DATE'
      Origin = 'LIST_CARD_FULL.RN_DATE'
      Visible = False
    end
    object QrListCardCARD_SKID: TFloatField
      DisplayLabel = '% скидки'
      DisplayWidth = 7
      FieldName = 'CARD_SKID'
      Origin = 'LIST_CARD_FULL.CARD_SKID'
    end
    object QrListCardSUMM_SKID: TFloatField
      DisplayLabel = 'Сумма скидок'
      FieldName = 'SUMM_SKID'
      Origin = 'LIST_CARD_FULL.SUMM_SKID'
      DisplayFormat = '0.00 руб.'
    end
    object QrListCardSUMM_SALES: TFloatField
      DisplayLabel = 'Сумма продаж'
      FieldName = 'SUMM_SALES'
      Origin = 'LIST_CARD_FULL.SUMM_SALES'
      DisplayFormat = '0.00 руб.'
    end
    object QrListCardCOUNT_PURCHASE: TIntegerField
      DisplayLabel = 'Кол-во продаж'
      FieldName = 'COUNT_PURCHASE'
      Origin = 'LIST_CARD_FULL.COUNT_PURCHASE'
    end
    object QrListCardKLN_FIO: TIBStringField
      DisplayLabel = 'ФИО клиента'
      DisplayWidth = 20
      FieldName = 'KLN_FIO'
      Origin = 'LIST_CARD_FULL.KLN_FIO'
      Size = 254
    end
    object QrListCardCARD_NUM_SKID: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Номер скидки'
      DisplayWidth = 5
      FieldName = 'CARD_NUM_SKID'
      Origin = 'LIST_CARD_FULL.CARD_NUM_SKID'
      Size = 254
    end
    object QrListCardKLN_ADDRESS: TIBStringField
      DisplayLabel = 'Адрес клиента'
      DisplayWidth = 20
      FieldName = 'KLN_ADDRESS'
      Origin = 'LIST_CARD_FULL.KLN_ADDRESS'
      Size = 254
    end
    object QrListCardKLN_ADD_INFO: TIBStringField
      DisplayLabel = 'Доп. информация'
      DisplayWidth = 20
      FieldName = 'KLN_ADD_INFO'
      Origin = 'LIST_CARD_FULL.KLN_ADD_INFO'
      Size = 10000
    end
    object QrListCardKLN_SEX: TIBStringField
      DisplayLabel = 'Пол'
      FieldName = 'KLN_SEX'
      Origin = 'LIST_CARD_FULL.KLN_SEX'
      Size = 10
    end
    object QrListCardKLN_SMS: TIBStringField
      DisplayLabel = 'Согласие на СМС'
      FieldName = 'KLN_SMS'
      Origin = 'LIST_CARD_FULL.KLN_SMS'
      Size = 10
    end
    object QrListCardKLN_PERS: TIBStringField
      DisplayLabel = 'Согласие на обработку данных'
      FieldName = 'KLN_PERS'
      Origin = 'LIST_CARD_FULL.KLN_PERS'
      Size = 10
    end
    object QrListCardKLN_REKL: TIBStringField
      DisplayLabel = 'Реклама'
      DisplayWidth = 50
      FieldName = 'KLN_REKL'
      Origin = 'LIST_CARD_FULL.KLN_REKL'
      Size = 1000
    end
    object QrListCardKLN_PHONE: TIBStringField
      DisplayLabel = 'Телефон'
      DisplayWidth = 10
      FieldName = 'KLN_PHONE'
      Origin = 'LIST_CARD_FULL.KLN_PHONE'
      Size = 254
    end
    object QrListCardKLN_VOZR: TIntegerField
      DisplayLabel = 'Возраст'
      FieldName = 'KLN_VOZR'
      Origin = 'LIST_CARD_FULL.KLN_VOZR'
    end
  end
  object DsListCard: TDataSource
    DataSet = QrListCard
    Left = 308
    Top = 173
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 400
    Top = 133
  end
  object Timer2: TTimer
    Enabled = False
    Left = 512
    Top = 137
  end
end
