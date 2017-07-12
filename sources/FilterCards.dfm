object FFilter: TFFilter
  Left = 863
  Top = 74
  Width = 563
  Height = 923
  Caption = 'Отбор дисконтных карт по параметрам...'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 492
    Height = 16
    Caption = 'Настройте фильтр. Выберете требуемые параметры фильтрации:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 48
    Width = 189
    Height = 32
    Caption = 'Период даты и времени для '#13#10'момента регистрации карты:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Tag = 1
    Left = 285
    Top = 44
    Width = 9
    Height = 13
    Caption = 'с:'
    Visible = False
  end
  object Label4: TLabel
    Tag = 2
    Left = 285
    Top = 69
    Width = 9
    Height = 13
    Caption = 'с:'
    Visible = False
  end
  object Label7: TLabel
    Left = 222
    Top = 44
    Width = 82
    Height = 13
    Caption = 'Дата и время с:'
  end
  object Label8: TLabel
    Left = 216
    Top = 69
    Width = 88
    Height = 13
    Caption = 'Дата и время по:'
  end
  object Label9: TLabel
    Left = 24
    Top = 97
    Width = 185
    Height = 32
    Caption = 'Период даты и времени для '#13#10'момента выдачи карты:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Tag = 3
    Left = 285
    Top = 94
    Width = 9
    Height = 13
    Caption = 'с:'
    Visible = False
  end
  object Label11: TLabel
    Tag = 4
    Left = 285
    Top = 119
    Width = 9
    Height = 13
    Caption = 'с:'
    Visible = False
  end
  object Label16: TLabel
    Left = 24
    Top = 154
    Width = 165
    Height = 16
    Caption = 'Период продаж по карте:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label17: TLabel
    Tag = 5
    Left = 285
    Top = 144
    Width = 9
    Height = 13
    Caption = 'с:'
    Visible = False
  end
  object Label18: TLabel
    Tag = 6
    Left = 285
    Top = 169
    Width = 9
    Height = 13
    Caption = 'с:'
    Visible = False
  end
  object Label23: TLabel
    Left = 24
    Top = 193
    Width = 207
    Height = 16
    Caption = 'Интервал скидки (в процентах):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label24: TLabel
    Tag = 7
    Left = 328
    Top = 195
    Width = 14
    Height = 13
    Caption = 'от:'
    Visible = False
  end
  object Label25: TLabel
    Tag = 7
    Left = 431
    Top = 195
    Width = 15
    Height = 13
    Caption = 'до:'
    Visible = False
  end
  object Label26: TLabel
    Left = 24
    Top = 436
    Width = 242
    Height = 32
    Caption = 'Магазин, в котором осуществлялись '#13#10'операции по карте:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label27: TLabel
    Left = 24
    Top = 246
    Width = 239
    Height = 16
    Caption = 'Сумма скидок по карте в интервале:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label28: TLabel
    Left = 24
    Top = 271
    Width = 243
    Height = 16
    Caption = 'Сумма продаж по карте в интервале:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label29: TLabel
    Left = 24
    Top = 296
    Width = 278
    Height = 16
    Caption = 'Количество продаж по карте в интервале:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label30: TLabel
    Left = 24
    Top = 411
    Width = 121
    Height = 16
    Caption = 'Кем выдана карта:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label31: TLabel
    Left = 24
    Top = 322
    Width = 244
    Height = 16
    Caption = 'Дата рождения клиента в интервале:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label32: TLabel
    Tag = 13
    Left = 328
    Top = 324
    Width = 9
    Height = 13
    Caption = 'с:'
    Visible = False
  end
  object Label33: TLabel
    Tag = 13
    Left = 431
    Top = 324
    Width = 15
    Height = 13
    Caption = 'по:'
    Visible = False
  end
  object Label6: TLabel
    Left = 222
    Top = 94
    Width = 82
    Height = 13
    Caption = 'Дата и время с:'
  end
  object Label14: TLabel
    Left = 216
    Top = 119
    Width = 88
    Height = 13
    Caption = 'Дата и время по:'
  end
  object Label12: TLabel
    Left = 216
    Top = 169
    Width = 88
    Height = 13
    Caption = 'Дата и время по:'
  end
  object Label13: TLabel
    Left = 222
    Top = 144
    Width = 82
    Height = 13
    Caption = 'Дата и время с:'
  end
  object Label15: TLabel
    Tag = 9
    Left = 328
    Top = 248
    Width = 14
    Height = 13
    Caption = 'от:'
    Visible = False
  end
  object Label19: TLabel
    Tag = 9
    Left = 431
    Top = 248
    Width = 15
    Height = 13
    Caption = 'до:'
    Visible = False
  end
  object Label20: TLabel
    Tag = 10
    Left = 431
    Top = 273
    Width = 15
    Height = 13
    Caption = 'до:'
    Visible = False
  end
  object Label21: TLabel
    Tag = 11
    Left = 431
    Top = 298
    Width = 15
    Height = 13
    Caption = 'до:'
    Visible = False
  end
  object Label22: TLabel
    Tag = 10
    Left = 328
    Top = 273
    Width = 14
    Height = 13
    Caption = 'от:'
    Visible = False
  end
  object Label34: TLabel
    Tag = 11
    Left = 328
    Top = 298
    Width = 14
    Height = 13
    Caption = 'от:'
    Visible = False
  end
  object Label5: TLabel
    Left = 24
    Top = 387
    Width = 91
    Height = 16
    Caption = 'ФИО клиента:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label35: TLabel
    Left = 24
    Top = 223
    Width = 94
    Height = 16
    Caption = 'Номер скидки:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label36: TLabel
    Left = 24
    Top = 346
    Width = 175
    Height = 32
    Caption = 'Дата рождения клиента в интервале(по всем годам):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label37: TLabel
    Tag = 16
    Left = 431
    Top = 348
    Width = 15
    Height = 13
    Caption = 'по:'
    Visible = False
  end
  object Label38: TLabel
    Tag = 16
    Left = 328
    Top = 348
    Width = 9
    Height = 13
    Caption = 'с:'
    Visible = False
  end
  object Label39: TLabel
    Left = 24
    Top = 475
    Width = 178
    Height = 16
    Caption = 'Согласие на СМС рассылку'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label40: TLabel
    Left = 24
    Top = 499
    Width = 241
    Height = 16
    Caption = 'Согласие на обработку перс. данных'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label41: TLabel
    Left = 24
    Top = 523
    Width = 26
    Height = 16
    Caption = 'Пол'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label42: TLabel
    Left = 24
    Top = 547
    Width = 57
    Height = 16
    Caption = 'Реклама'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 462
    Top = 768
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 44
    Kind = bkCancel
  end
  object BtnSetFilter: TBitBtn
    Left = 280
    Top = 768
    Width = 137
    Height = 25
    Caption = 'Выбрать...'
    TabOrder = 43
    OnClick = BtnSetFilterClick
    Kind = bkOK
  end
  object CB1: TCheckBox
    Tag = 1
    Left = 313
    Top = 42
    Width = 16
    Height = 17
    TabOrder = 0
    OnClick = CB1Click
  end
  object CB2: TCheckBox
    Tag = 2
    Left = 313
    Top = 67
    Width = 16
    Height = 17
    TabOrder = 4
    OnClick = CB1Click
  end
  object DateEdit1: TDateEdit
    Tag = 1
    Left = 344
    Top = 40
    Width = 89
    Height = 21
    DefaultToday = True
    NumGlyphs = 2
    TabOrder = 1
    Visible = False
  end
  object RxSpinEdit1: TRxSpinEdit
    Tag = 1
    Left = 440
    Top = 40
    Width = 41
    Height = 21
    Hint = 'часы'
    MaxValue = 23
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Visible = False
  end
  object RxSpinEdit2: TRxSpinEdit
    Tag = 1
    Left = 488
    Top = 40
    Width = 41
    Height = 21
    Hint = 'минуты'
    MaxValue = 59
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Visible = False
  end
  object DateEdit2: TDateEdit
    Tag = 2
    Left = 344
    Top = 65
    Width = 89
    Height = 21
    DefaultToday = True
    NumGlyphs = 2
    TabOrder = 5
    Visible = False
  end
  object RxSpinEdit3: TRxSpinEdit
    Tag = 2
    Left = 440
    Top = 65
    Width = 41
    Height = 21
    Hint = 'часы'
    MaxValue = 23
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Visible = False
  end
  object RxSpinEdit4: TRxSpinEdit
    Tag = 2
    Left = 488
    Top = 65
    Width = 41
    Height = 21
    Hint = 'минуты'
    MaxValue = 59
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    Visible = False
  end
  object CB3: TCheckBox
    Tag = 3
    Left = 313
    Top = 92
    Width = 16
    Height = 17
    TabOrder = 8
    OnClick = CB1Click
  end
  object CB4: TCheckBox
    Tag = 4
    Left = 313
    Top = 117
    Width = 16
    Height = 17
    TabOrder = 12
    OnClick = CB1Click
  end
  object DateEdit3: TDateEdit
    Tag = 3
    Left = 344
    Top = 90
    Width = 89
    Height = 21
    DefaultToday = True
    NumGlyphs = 2
    TabOrder = 9
    Visible = False
  end
  object RxSpinEdit5: TRxSpinEdit
    Tag = 3
    Left = 440
    Top = 90
    Width = 41
    Height = 21
    Hint = 'часы'
    MaxValue = 23
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    Visible = False
  end
  object RxSpinEdit6: TRxSpinEdit
    Tag = 3
    Left = 488
    Top = 90
    Width = 41
    Height = 21
    Hint = 'минуты'
    MaxValue = 59
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    Visible = False
  end
  object DateEdit4: TDateEdit
    Tag = 4
    Left = 344
    Top = 115
    Width = 89
    Height = 21
    DefaultToday = True
    NumGlyphs = 2
    TabOrder = 13
    Visible = False
  end
  object RxSpinEdit7: TRxSpinEdit
    Tag = 4
    Left = 440
    Top = 115
    Width = 41
    Height = 21
    Hint = 'часы'
    MaxValue = 23
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    Visible = False
  end
  object RxSpinEdit8: TRxSpinEdit
    Tag = 4
    Left = 488
    Top = 115
    Width = 41
    Height = 21
    Hint = 'минуты'
    MaxValue = 59
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
    Visible = False
  end
  object CB5: TCheckBox
    Tag = 5
    Left = 313
    Top = 142
    Width = 16
    Height = 17
    TabOrder = 16
    OnClick = CB1Click
  end
  object CB6: TCheckBox
    Tag = 6
    Left = 313
    Top = 167
    Width = 16
    Height = 17
    TabOrder = 20
    OnClick = CB1Click
  end
  object DateEdit5: TDateEdit
    Tag = 5
    Left = 344
    Top = 140
    Width = 89
    Height = 21
    DefaultToday = True
    NumGlyphs = 2
    TabOrder = 17
    Visible = False
  end
  object RxSpinEdit9: TRxSpinEdit
    Tag = 5
    Left = 440
    Top = 140
    Width = 41
    Height = 21
    Hint = 'часы'
    MaxValue = 23
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
    Visible = False
  end
  object RxSpinEdit10: TRxSpinEdit
    Tag = 5
    Left = 488
    Top = 140
    Width = 41
    Height = 21
    Hint = 'минуты'
    MaxValue = 59
    ParentShowHint = False
    ShowHint = True
    TabOrder = 19
    Visible = False
  end
  object DateEdit6: TDateEdit
    Tag = 6
    Left = 344
    Top = 165
    Width = 89
    Height = 21
    DefaultToday = True
    NumGlyphs = 2
    TabOrder = 21
    Visible = False
  end
  object RxSpinEdit11: TRxSpinEdit
    Tag = 6
    Left = 440
    Top = 165
    Width = 41
    Height = 21
    Hint = 'часы'
    MaxValue = 23
    ParentShowHint = False
    ShowHint = True
    TabOrder = 22
    Visible = False
  end
  object RxSpinEdit12: TRxSpinEdit
    Tag = 6
    Left = 488
    Top = 165
    Width = 41
    Height = 21
    Hint = 'минуты'
    MaxValue = 59
    ParentShowHint = False
    ShowHint = True
    TabOrder = 23
    Visible = False
  end
  object CB7: TCheckBox
    Tag = 7
    Left = 313
    Top = 193
    Width = 16
    Height = 17
    TabOrder = 24
    OnClick = CB1Click
  end
  object RxSpinEdit13: TRxSpinEdit
    Tag = 7
    Left = 344
    Top = 191
    Width = 81
    Height = 21
    MaxValue = 100
    TabOrder = 25
    Visible = False
  end
  object RxSpinEdit14: TRxSpinEdit
    Tag = 7
    Left = 448
    Top = 191
    Width = 81
    Height = 21
    MaxValue = 100
    TabOrder = 26
    Visible = False
  end
  object CB8: TCheckBox
    Tag = 8
    Left = 312
    Top = 444
    Width = 16
    Height = 17
    TabOrder = 41
    OnClick = CB1Click
  end
  object CB9: TCheckBox
    Tag = 9
    Left = 312
    Top = 246
    Width = 16
    Height = 17
    TabOrder = 27
    OnClick = CB1Click
  end
  object CurrencyEdit1: TCurrencyEdit
    Tag = 9
    Left = 448
    Top = 244
    Width = 81
    Height = 21
    AutoSize = False
    TabOrder = 29
    Visible = False
    ZeroEmpty = False
  end
  object CB10: TCheckBox
    Tag = 10
    Left = 312
    Top = 271
    Width = 16
    Height = 17
    TabOrder = 30
    OnClick = CB1Click
  end
  object CurrencyEdit2: TCurrencyEdit
    Tag = 10
    Left = 448
    Top = 269
    Width = 81
    Height = 21
    AutoSize = False
    TabOrder = 32
    Visible = False
    ZeroEmpty = False
  end
  object CB11: TCheckBox
    Tag = 11
    Left = 312
    Top = 296
    Width = 16
    Height = 17
    TabOrder = 33
    OnClick = CB1Click
  end
  object RxSpinEdit15: TRxSpinEdit
    Tag = 11
    Left = 448
    Top = 294
    Width = 81
    Height = 21
    MaxValue = 100
    TabOrder = 35
    Visible = False
  end
  object CB12: TCheckBox
    Tag = 12
    Left = 312
    Top = 411
    Width = 16
    Height = 17
    TabOrder = 39
    OnClick = CB1Click
  end
  object CB13: TCheckBox
    Tag = 13
    Left = 312
    Top = 322
    Width = 16
    Height = 17
    TabOrder = 36
    OnClick = CB1Click
  end
  object DateEdit7: TDateEdit
    Tag = 13
    Left = 343
    Top = 320
    Width = 82
    Height = 21
    DefaultToday = True
    NumGlyphs = 2
    TabOrder = 37
    Visible = False
  end
  object DateEdit8: TDateEdit
    Tag = 13
    Left = 447
    Top = 320
    Width = 82
    Height = 21
    DefaultToday = True
    NumGlyphs = 2
    TabOrder = 38
    Visible = False
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Tag = 8
    Left = 344
    Top = 442
    Width = 185
    Height = 21
    KeyField = 'SHOP_ID'
    ListField = 'SHOP_NAME'
    ListSource = DsListShops
    TabOrder = 42
    Visible = False
    OnClick = DBLookupComboBox1Click
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Tag = 12
    Left = 344
    Top = 409
    Width = 185
    Height = 21
    KeyField = 'KLN_ID'
    ListField = 'KLN_FULL'
    ListSource = DSRegUsersList
    TabOrder = 40
    Visible = False
    OnClick = DBLookupComboBox2Click
  end
  object CurrencyEdit3: TCurrencyEdit
    Tag = 9
    Left = 344
    Top = 244
    Width = 81
    Height = 21
    AutoSize = False
    TabOrder = 28
    Visible = False
    ZeroEmpty = False
  end
  object CurrencyEdit4: TCurrencyEdit
    Tag = 10
    Left = 344
    Top = 269
    Width = 81
    Height = 21
    AutoSize = False
    TabOrder = 31
    Visible = False
    ZeroEmpty = False
  end
  object RxSpinEdit16: TRxSpinEdit
    Tag = 11
    Left = 344
    Top = 294
    Width = 81
    Height = 21
    MaxValue = 100
    TabOrder = 34
    Visible = False
  end
  object CB14: TCheckBox
    Tag = 14
    Left = 312
    Top = 388
    Width = 16
    Height = 17
    TabOrder = 45
    OnClick = CB1Click
  end
  object KLN_FIO: TEdit
    Tag = 14
    Left = 344
    Top = 388
    Width = 185
    Height = 21
    TabOrder = 46
    Visible = False
  end
  object CB15: TCheckBox
    Tag = 15
    Left = 313
    Top = 219
    Width = 16
    Height = 17
    TabOrder = 47
    OnClick = CB1Click
  end
  object DBLookupComboBox3: TDBLookupComboBox
    Tag = 15
    Left = 343
    Top = 217
    Width = 185
    Height = 21
    KeyField = 'CARDSKID_ID'
    ListField = 'NAME'
    ListSource = DSSkid
    TabOrder = 48
    Visible = False
    OnClick = DBLookupComboBox2Click
  end
  object cb16: TCheckBox
    Tag = 16
    Left = 312
    Top = 346
    Width = 16
    Height = 17
    TabOrder = 49
    OnClick = CB1Click
  end
  object KLN_BIRTHDAY_OF_YEAR_FROM: TMaskEdit
    Tag = 16
    Left = 344
    Top = 344
    Width = 49
    Height = 21
    TabOrder = 50
    Visible = False
  end
  object KLN_BIRTHDAY_OF_YEAR_TO: TMaskEdit
    Tag = 16
    Left = 448
    Top = 344
    Width = 49
    Height = 21
    TabOrder = 51
    Visible = False
  end
  object cb20: TCheckBox
    Tag = 20
    Left = 312
    Top = 476
    Width = 16
    Height = 17
    TabOrder = 52
    OnClick = CB1Click
  end
  object cb21: TCheckBox
    Tag = 21
    Left = 312
    Top = 499
    Width = 16
    Height = 17
    TabOrder = 53
    OnClick = CB1Click
  end
  object cb22: TCheckBox
    Tag = 22
    Left = 312
    Top = 523
    Width = 16
    Height = 17
    TabOrder = 54
    OnClick = CB1Click
  end
  object cb23: TCheckBox
    Tag = 23
    Left = 312
    Top = 547
    Width = 16
    Height = 17
    TabOrder = 55
    OnClick = CB1Click
  end
  object comboRekl: TComboBox
    Tag = 23
    Left = 344
    Top = 544
    Width = 185
    Height = 21
    Style = csDropDownList
    DropDownCount = 9
    ItemHeight = 13
    TabOrder = 56
    Visible = False
    Items.Strings = (
      'Постоянный клиент'
      'Рекомендации'
      'Сайт'
      'Телевидение'
      'Наружные щиты'
      'Радио'
      'Реклама на транспорте'
      'Реклама в лифтах'
      'Листовки')
  end
  object comboSMS: TComboBox
    Tag = 20
    Left = 344
    Top = 472
    Width = 185
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 57
    Visible = False
    Items.Strings = (
      'Несогласие'
      'Согласие')
  end
  object comboPers: TComboBox
    Tag = 21
    Left = 344
    Top = 496
    Width = 185
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 58
    Visible = False
    Items.Strings = (
      'Несогласие'
      'Согласие')
  end
  object comboSex: TComboBox
    Tag = 22
    Left = 344
    Top = 520
    Width = 185
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 59
    Visible = False
    Items.Strings = (
      '-----------'
      'Муж'
      'Жен')
  end
  object QListShops: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select shop_id, shop_name  from shop'
      'order by shop_name')
    Left = 243
    Top = 837
    object QListShopsSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
      Origin = 'SHOP.SHOP_ID'
      Required = True
    end
    object QListShopsSHOP_NAME: TIBStringField
      FieldName = 'SHOP_NAME'
      Origin = 'SHOP.SHOP_NAME'
      Required = True
      Size = 254
    end
  end
  object DsListShops: TDataSource
    DataSet = QListShops
    Left = 179
    Top = 854
  end
  object QRegUsersList: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select'
      
        ' KLN.kln_id, BG_LEFT( KLN.KLN_FAM || '#39' '#39' || BG_LEFT( KLN.KLN_NAM' +
        'E, 1)   || '#39'. '#39' || BG_LEFT ( KLN.KLN_NAME2, 1) || '#39'.'#39', 254) as K' +
        'LN_FULL'
      'from kln'
      'where kln_password<>""'
      'and (kln_close="0")'
      'order by kln_fam,kln_name,Kln_name2')
    Left = 107
    Top = 823
    object QRegUsersListKLN_ID: TIntegerField
      FieldName = 'KLN_ID'
      Origin = 'KLN.KLN_ID'
      Required = True
    end
    object QRegUsersListKLN_FULL: TIBStringField
      FieldName = 'KLN_FULL'
      Required = True
      FixedChar = True
      Size = 1024
    end
  end
  object DSRegUsersList: TDataSource
    DataSet = QRegUsersList
    Left = 51
    Top = 804
  end
  object QSkid: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select CARDSKID_ID, CAST (CARDSKID_NUM as varchar(2)) || " (" ||' +
        ' CARDSKID_NAME || ")" as NAME FROM CARDSKID'
      'order by CARDSKID_NUM')
    Left = 363
    Top = 801
    object QSkidCARDSKID_ID: TIntegerField
      FieldName = 'CARDSKID_ID'
      Origin = 'CARDSKID.CARDSKID_ID'
      Required = True
    end
    object QSkidNAME: TIBStringField
      FieldName = 'NAME'
      Required = True
      Size = 259
    end
  end
  object DSSkid: TDataSource
    DataSet = QSkid
    Left = 291
    Top = 802
  end
end
