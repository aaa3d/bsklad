object Edit_TW: TEdit_TW
  Left = 144
  Top = 153
  Width = 1203
  Height = 699
  Caption = 'Карточка товара'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object StatusBar2: TStatusBar
    Left = 0
    Top = 0
    Width = 1195
    Height = 19
    Align = alTop
    Panels = <
      item
        Alignment = taRightJustify
        Text = 'Код товара:'
        Width = 80
      end
      item
        Width = 300
      end
      item
        Width = 200
      end
      item
        Width = 200
      end>
    SimplePanel = False
    SizeGrip = False
  end
  object Panel9: TPanel
    Left = 1097
    Top = 38
    Width = 98
    Height = 629
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object BtnApply: TButton
      Left = 2
      Top = 2
      Width = 93
      Height = 31
      Hint = 'Сохранить данные без закрытия'
      Caption = 'Применить'
      TabOrder = 0
      OnClick = BtnApplyClick
    end
    object BtnSave: TButton
      Left = 2
      Top = 37
      Width = 93
      Height = 31
      Hint = 'Сохранить и выйти (Ctrl+Enter)'
      Caption = 'Сохранить'
      TabOrder = 1
      OnClick = BtnSaveClick
    end
    object BtnClose: TButton
      Left = 2
      Top = 71
      Width = 93
      Height = 31
      Hint = 'Esc'
      Caption = 'Закрыть'
      TabOrder = 2
      OnClick = BtnCloseClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 38
    Width = 1097
    Height = 629
    ActivePage = TabSheet1
    Align = alClient
    MultiLine = True
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Карточка'
      object Label4: TLabel
        Left = 39
        Top = 98
        Width = 124
        Height = 16
        Caption = 'Базовые единицы :'
      end
      object Label6: TLabel
        Left = 59
        Top = 128
        Width = 106
        Height = 16
        Caption = 'Валюта товара :'
      end
      object Label7: TLabel
        Left = 64
        Top = 158
        Width = 102
        Height = 16
        Caption = 'Производство :'
      end
      object Label8: TLabel
        Left = 94
        Top = 187
        Width = 65
        Height = 16
        Caption = 'Размеры :'
      end
      object Label9: TLabel
        Left = 94
        Top = 217
        Width = 69
        Height = 16
        Caption = 'Упаковка :'
      end
      object Label10: TLabel
        Left = 79
        Top = 246
        Width = 88
        Height = 16
        Caption = 'Примечания :'
      end
      object Label11: TLabel
        Left = 54
        Top = 384
        Width = 102
        Height = 16
        Hint = 
          'Номер секции, по которой будет пробиваться товар'#13#10'через контроль' +
          'но-кассовую машину (кассу)'
        Caption = 'Секция по ККМ :'
      end
      object Label12: TLabel
        Left = 49
        Top = 414
        Width = 113
        Height = 16
        Caption = 'Розничная цена :'
      end
      object Label1: TLabel
        Left = 57
        Top = 10
        Width = 111
        Height = 16
        Caption = 'Группа товаров :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 167
        Top = 10
        Width = 41
        Height = 16
        Caption = 'Label2'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 79
        Top = 39
        Width = 80
        Height = 16
        Caption = 'Код товара :'
      end
      object Label3: TLabel
        Left = 10
        Top = 69
        Width = 155
        Height = 16
        Caption = 'Наименование товара :'
      end
      object Label16: TLabel
        Left = 39
        Top = 473
        Width = 124
        Height = 16
        Caption = 'Категория товара :'
      end
      object Label17: TLabel
        Left = 34
        Top = 354
        Width = 126
        Height = 16
        Caption = 'Условие поставки :'
      end
      object Label18: TLabel
        Left = 231
        Top = 384
        Width = 79
        Height = 16
        Hint = 
          'Номер секции, по которой будет пробиваться товар'#13#10'через контроль' +
          'но-кассовую машину (кассу)'
        Caption = 'Номер ККМ :'
      end
      object Label19: TLabel
        Left = 0
        Top = 443
        Width = 166
        Height = 16
        Caption = 'Розничная цена на брак :'
      end
      object Label21: TLabel
        Left = 192
        Top = 586
        Width = 151
        Height = 16
        Caption = 'Страна производства :'
        Visible = False
      end
      object Edit: TLabel
        Left = 5
        Top = 325
        Width = 157
        Height = 16
        Caption = '№ таможн. декларации :'
      end
      object Label20: TLabel
        Left = 354
        Top = 98
        Width = 195
        Height = 16
        Caption = 'Сокращенное наименование :'
      end
      object Label22: TLabel
        Left = 571
        Top = 217
        Width = 91
        Height = 16
        Caption = 'Масса (кг/ед) :'
      end
      object Label34: TLabel
        Left = 34
        Top = 502
        Width = 124
        Height = 16
        Caption = 'Фирма - продавец :'
      end
      object WarnLabel: TLabel
        Left = 433
        Top = 502
        Width = 349
        Height = 32
        Caption = 
          'Данный товар можно продать от лица любой фирмы!!!'#13#10'Контроль прод' +
          'авца для данного товара отключен'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label25: TLabel
        Left = 527
        Top = 379
        Width = 155
        Height = 16
        Hint = 'Номер товара по весам'
        Caption = 'Номер товара по весам'
      end
      object Label37: TLabel
        Left = 458
        Top = 414
        Width = 123
        Height = 16
        Caption = 'Розничная цена 2 :'
      end
      object Label38: TLabel
        Left = 478
        Top = 448
        Width = 96
        Height = 16
        Caption = 'Примечание 2:'
      end
      object Label39: TLabel
        Left = 10
        Top = 537
        Width = 222
        Height = 16
        Caption = 'Интернет Наименование товара :'
      end
      object Label57: TLabel
        Left = 325
        Top = 39
        Width = 104
        Height = 16
        Caption = 'Главный товар :'
      end
      object ED_ID: TRxDBLookupCombo
        Left = 167
        Top = 94
        Width = 169
        Height = 28
        DropDownCount = 8
        LookupField = 'ED_ID'
        LookupDisplay = 'ED_FULL'
        LookupSource = DsQrEd
        TabOrder = 3
        OnChange = ED_IDChange
      end
      object VALUTA_ID: TRxDBLookupCombo
        Left = 167
        Top = 123
        Width = 169
        Height = 28
        DropDownCount = 8
        Enabled = False
        LookupField = 'VALUTA_ID'
        LookupDisplay = 'VALUTA_FULL'
        LookupSource = DsQrValuta
        TabOrder = 4
        OnChange = VALUTA_IDChange
      end
      object TW_MADE: TEdit
        Left = 167
        Top = 153
        Width = 169
        Height = 24
        MaxLength = 254
        TabOrder = 5
        Text = 'TW_MADE'
        OnChange = TW_NAMEChange
      end
      object TW_RAZM: TEdit
        Left = 167
        Top = 182
        Width = 386
        Height = 24
        MaxLength = 254
        TabOrder = 6
        Text = 'TW_RAZM'
        OnChange = TW_NAMEChange
      end
      object TW_UP: TEdit
        Left = 167
        Top = 212
        Width = 386
        Height = 24
        MaxLength = 254
        TabOrder = 7
        Text = 'TW_UP'
        OnChange = TW_NAMEChange
      end
      object TW_PRIM: TMemo
        Left = 167
        Top = 239
        Width = 596
        Height = 49
        Lines.Strings = (
          'TW_PRIM')
        TabOrder = 8
        OnChange = TW_NAMEChange
      end
      object TW_SEK: TRxSpinEdit
        Left = 167
        Top = 379
        Width = 56
        Height = 21
        MaxValue = 7
        MinValue = 1
        Value = 1
        TabOrder = 12
        OnChange = TW_NAMEChange
      end
      object TW_RASPR: TCheckBox
        Left = 433
        Top = 473
        Width = 331
        Height = 21
        Caption = 'Не изменять цены при изменении курса валюты'
        TabOrder = 19
      end
      object TW_MROZ: TRxCalcEdit
        Left = 167
        Top = 409
        Width = 149
        Height = 25
        AutoSize = False
        DisplayFormat = ',0.00 руб'
        ButtonWidth = 25
        NumGlyphs = 2
        TabOrder = 14
        OnChange = TW_MROZChange
      end
      object TW_MROZ2: TRxCalcEdit
        Left = 320
        Top = 409
        Width = 119
        Height = 25
        AutoSize = False
        DecimalPlaces = 10
        DisplayFormat = ',0.0000 $'
        Enabled = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 15
        OnChange = TW_NAMEChange
      end
      object TW_ART: TEdit
        Left = 167
        Top = 34
        Width = 120
        Height = 24
        TabStop = False
        Enabled = False
        ReadOnly = True
        TabOrder = 0
        Text = 'TW_ART'
        OnChange = TW_NAMEChange
      end
      object TW_NAME: TEdit
        Left = 166
        Top = 64
        Width = 596
        Height = 24
        MaxLength = 128
        TabOrder = 1
        Text = 'TW_NAME'
        OnChange = TW_NAMEChange
      end
      object TWKTG: TRxDBLookupCombo
        Left = 167
        Top = 468
        Width = 248
        Height = 28
        DropDownCount = 8
        DropDownWidth = 200
        LookupField = 'TWKTG_ID'
        LookupDisplay = 'TWKTG_NAM'
        LookupSource = DsQrTwKtg
        TabOrder = 18
        OnChange = TWKTGChange
      end
      object TW_POST: TEdit
        Left = 167
        Top = 350
        Width = 596
        Height = 24
        MaxLength = 254
        TabOrder = 11
        Text = 'TW_POST'
        OnChange = TW_NAMEChange
      end
      object TW_KASSA: TRxSpinEdit
        Left = 320
        Top = 379
        Width = 55
        Height = 21
        MaxValue = 4
        MinValue = 1
        Value = 1
        TabOrder = 13
        OnChange = TW_NAMEChange
      end
      object TW_MROZ_BRAK: TRxCalcEdit
        Left = 167
        Top = 438
        Width = 149
        Height = 26
        AutoSize = False
        DisplayFormat = ',0.00 руб'
        ButtonWidth = 25
        NumGlyphs = 2
        TabOrder = 16
        OnChange = TW_MROZ_BRAKChange
      end
      object TW_MROZ2_BRAK: TRxCalcEdit
        Left = 320
        Top = 438
        Width = 119
        Height = 26
        AutoSize = False
        DecimalPlaces = 10
        DisplayFormat = ',0.0000 $'
        Enabled = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 17
        OnChange = TW_NAMEChange
      end
      object TW_LAND: TEdit
        Left = 345
        Top = 586
        Width = 50
        Height = 24
        MaxLength = 254
        TabOrder = 9
        Text = 'TW_LAND'
        Visible = False
        OnChange = TW_LANDChange
      end
      object TW_TAM: TEdit
        Left = 167
        Top = 320
        Width = 596
        Height = 24
        MaxLength = 254
        TabOrder = 10
        Text = 'TW_TAM'
        OnChange = TW_TAMChange
      end
      object TW_NDS_SMALL: TCheckBox
        Left = 389
        Top = 379
        Width = 90
        Height = 21
        Caption = 'НДС 10%'
        TabOrder = 20
      end
      object TW_SHORT_NAME: TEdit
        Left = 553
        Top = 92
        Width = 209
        Height = 24
        MaxLength = 28
        TabOrder = 2
        Text = 'TW_SHORT_NAME'
        OnChange = TW_NAMEChange
      end
      object TW_WEIGHT: TRxCalcEdit
        Left = 652
        Top = 212
        Width = 110
        Height = 26
        AutoSize = False
        ButtonWidth = 25
        NumGlyphs = 2
        TabOrder = 21
      end
      object TW_SALER: TRxDBLookupCombo
        Left = 167
        Top = 497
        Width = 248
        Height = 29
        DropDownCount = 8
        LookupField = 'SALER_ID'
        LookupDisplay = 'SALER_NAME'
        LookupSource = DataModule1.MainDsTwSaler
        TabOrder = 22
        OnChange = TW_SALERChange
      end
      object checkKWM_UCHET: TCheckBox
        Left = 561
        Top = 295
        Width = 198
        Height = 21
        Caption = 'Учет в квадратных метрах'
        TabOrder = 23
      end
      object TW_NUMBER: TRxSpinEdit
        Left = 679
        Top = 374
        Width = 80
        Height = 21
        Hint = 
          'Номер товара по весам.'#13#10'Не должен повторяться.'#13#10'Не должнен быть ' +
          'более 4000.'#13#10'Если у товара номер равен 0 - в весы он не загрузит' +
          'ся'
        MaxValue = 4000
        TabOrder = 24
        OnChange = TW_NAMEChange
      end
      object TW_MROZ_2: TRxCalcEdit
        Left = 576
        Top = 409
        Width = 183
        Height = 25
        AutoSize = False
        DisplayFormat = ',0.00 руб'
        ButtonWidth = 25
        NumGlyphs = 2
        TabOrder = 25
        OnChange = TW_MROZChange
      end
      object TW_PRIM_2: TEdit
        Left = 576
        Top = 443
        Width = 183
        Height = 24
        MaxLength = 32
        TabOrder = 26
        Text = 'TW_PRIM_2'
        OnChange = TW_NAMEChange
      end
      object TW_NAM_INT: TEdit
        Left = 222
        Top = 532
        Width = 540
        Height = 24
        MaxLength = 128
        TabOrder = 27
        Text = 'TW_NAM_INT'
        OnChange = TW_NAMEChange
      end
      object GroupBox1: TGroupBox
        Left = 768
        Top = 30
        Width = 287
        Height = 523
        Caption = 'Параметры работы склада'
        TabOrder = 28
        object Label43: TLabel
          Left = 84
          Top = 374
          Width = 128
          Height = 16
          Caption = 'Объем паллеты, м3:'
        end
        object Label44: TLabel
          Left = 10
          Top = 20
          Width = 268
          Height = 16
          Caption = 'Габаритные размеры единицы товара, м:'
        end
        object Label35: TLabel
          Left = 15
          Top = 39
          Width = 12
          Height = 16
          Caption = 'Д:'
        end
        object Label36: TLabel
          Left = 106
          Top = 39
          Width = 14
          Height = 16
          Caption = 'Ш:'
        end
        object Label42: TLabel
          Left = 196
          Top = 39
          Width = 12
          Height = 16
          Caption = 'Т:'
        end
        object Label45: TLabel
          Left = 10
          Top = 108
          Width = 207
          Height = 16
          Caption = 'Количество товара в упаковке:'
        end
        object Label46: TLabel
          Left = 10
          Top = 128
          Width = 223
          Height = 16
          Caption = 'Габаритные размеры упаковки, м:'
        end
        object Label47: TLabel
          Left = 15
          Top = 148
          Width = 12
          Height = 16
          Caption = 'Д:'
        end
        object Label48: TLabel
          Left = 106
          Top = 148
          Width = 14
          Height = 16
          Caption = 'Ш:'
        end
        object Label49: TLabel
          Left = 196
          Top = 148
          Width = 12
          Height = 16
          Caption = 'Т:'
        end
        object Label50: TLabel
          Left = 10
          Top = 246
          Width = 200
          Height = 16
          Caption = 'Количество товара в паллете:'
        end
        object Label51: TLabel
          Left = 20
          Top = 295
          Width = 217
          Height = 16
          Caption = 'Габаритные размеры паллеты, м:'
          Visible = False
        end
        object Label52: TLabel
          Left = 15
          Top = 325
          Width = 12
          Height = 16
          Caption = 'Д:'
        end
        object Label53: TLabel
          Left = 106
          Top = 325
          Width = 14
          Height = 16
          Caption = 'Ш:'
        end
        object Label54: TLabel
          Left = 196
          Top = 325
          Width = 12
          Height = 16
          Caption = 'Т:'
        end
        object Label55: TLabel
          Left = 10
          Top = 217
          Width = 215
          Height = 16
          Caption = 'Количество упаковок в паллете:'
        end
        object Label41: TLabel
          Left = 84
          Top = 177
          Width = 134
          Height = 16
          Caption = 'Объем упаковки, м3:'
        end
        object Label56: TLabel
          Left = 84
          Top = 69
          Width = 129
          Height = 16
          Caption = 'Объем единицы, м3:'
        end
        object TW_PALET_KOL: TRxCalcEdit
          Left = 207
          Top = 241
          Width = 70
          Height = 26
          AutoSize = False
          DecimalPlaces = 3
          DisplayFormat = '#0.00#'
          FormatOnEditing = True
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 0
          OnChange = TW_PALET_KUBATORAChange
        end
        object TW_PALET_UCHET: TCheckBox
          Left = 20
          Top = 453
          Width = 247
          Height = 21
          Caption = 'Погрузка-отгрузка в паллетах'
          TabOrder = 1
          OnClick = TW_PALET_UCHETClick
        end
        object Button2: TButton
          Left = 187
          Top = 482
          Width = 119
          Height = 31
          Caption = 'Рассчет паллеты'
          TabOrder = 2
          Visible = False
          OnClick = Button2Click
        end
        object TW_PALET_KUBATORA: TRxCalcEdit
          Left = 207
          Top = 369
          Width = 70
          Height = 26
          AutoSize = False
          DecimalPlaces = 5
          DisplayFormat = '#0.00000#'
          FormatOnEditing = True
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 3
          OnChange = TW_PALET_KUBATORAChange
        end
        object TW_LENGTH: TRxCalcEdit
          Left = 30
          Top = 34
          Width = 70
          Height = 26
          AutoSize = False
          DecimalPlaces = 4
          DisplayFormat = '#0.0000#'
          FormatOnEditing = True
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 4
          OnChange = TW_LENGTHChange
          OnKeyDown = TW_LENGTHKeyDown
        end
        object TW_WIDTH: TRxCalcEdit
          Left = 122
          Top = 34
          Width = 70
          Height = 26
          AutoSize = False
          DecimalPlaces = 4
          DisplayFormat = '#0.0000#'
          FormatOnEditing = True
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 5
          OnChange = TW_LENGTHChange
          OnKeyDown = TW_LENGTHKeyDown
        end
        object TW_HEIGHT: TRxCalcEdit
          Left = 208
          Top = 34
          Width = 70
          Height = 26
          AutoSize = False
          DecimalPlaces = 4
          DisplayFormat = '#0.0000#'
          FormatOnEditing = True
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 6
          OnChange = TW_LENGTHChange
          OnKeyDown = TW_LENGTHKeyDown
        end
        object chk_stored_in_up: TCheckBox
          Left = 10
          Top = 89
          Width = 139
          Height = 21
          Caption = 'Собран в упаковки'
          TabOrder = 7
          OnClick = chk_stored_in_upClick
        end
        object tw_kol_in_up: TRxCalcEdit
          Left = 208
          Top = 103
          Width = 70
          Height = 26
          AutoSize = False
          DecimalPlaces = 3
          DisplayFormat = '#0.00#'
          Enabled = False
          FormatOnEditing = True
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 8
          OnChange = TW_PALET_KUBATORAChange
        end
        object up_length: TRxCalcEdit
          Left = 30
          Top = 143
          Width = 70
          Height = 26
          AutoSize = False
          DecimalPlaces = 4
          DisplayFormat = '#0.0000#'
          Enabled = False
          FormatOnEditing = True
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 9
          OnChange = up_lengthChange
          OnKeyDown = up_lengthKeyDown
        end
        object up_width: TRxCalcEdit
          Left = 122
          Top = 143
          Width = 70
          Height = 26
          AutoSize = False
          DecimalPlaces = 4
          DisplayFormat = '#0.0000#'
          Enabled = False
          FormatOnEditing = True
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 10
          OnChange = up_lengthChange
          OnKeyDown = up_lengthKeyDown
        end
        object up_height: TRxCalcEdit
          Left = 208
          Top = 143
          Width = 70
          Height = 26
          AutoSize = False
          DecimalPlaces = 4
          DisplayFormat = '#0.0000#'
          Enabled = False
          FormatOnEditing = True
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 11
          OnChange = up_lengthChange
          OnKeyDown = up_lengthKeyDown
        end
        object chk_typical_palet: TCheckBox
          Left = 20
          Top = 354
          Width = 168
          Height = 21
          Caption = 'Типовая паллета (1м3)'
          TabOrder = 12
          OnClick = chk_typical_paletClick
        end
        object palet_length: TRxCalcEdit
          Left = 30
          Top = 320
          Width = 70
          Height = 26
          AutoSize = False
          DecimalPlaces = 4
          DisplayFormat = '#0.0000#'
          FormatOnEditing = True
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 13
          OnChange = palet_lengthChange
          OnKeyDown = palet_lengthKeyDown
        end
        object palet_width: TRxCalcEdit
          Left = 122
          Top = 320
          Width = 70
          Height = 26
          AutoSize = False
          DecimalPlaces = 4
          DisplayFormat = '#0.0000#'
          FormatOnEditing = True
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 14
          OnChange = palet_lengthChange
          OnKeyDown = palet_lengthKeyDown
        end
        object palet_height: TRxCalcEdit
          Left = 208
          Top = 320
          Width = 70
          Height = 26
          AutoSize = False
          DecimalPlaces = 4
          DisplayFormat = '#0.0000#'
          FormatOnEditing = True
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 15
          OnChange = palet_lengthChange
          OnKeyDown = palet_lengthKeyDown
        end
        object up_kol_in_pal: TRxCalcEdit
          Left = 207
          Top = 212
          Width = 71
          Height = 26
          AutoSize = False
          DecimalPlaces = 3
          DisplayFormat = '#0.00#'
          Enabled = False
          FormatOnEditing = True
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 16
          OnChange = TW_PALET_KUBATORAChange
        end
        object checkNegabarit: TCheckBox
          Left = 21
          Top = 482
          Width = 138
          Height = 21
          Caption = 'Негабаритный'
          TabOrder = 17
        end
        object up_kubatura: TRxCalcEdit
          Left = 207
          Top = 172
          Width = 70
          Height = 26
          AutoSize = False
          DecimalPlaces = 5
          DisplayFormat = '#0.00000#'
          FormatOnEditing = True
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 18
          OnChange = TW_PALET_KUBATORAChange
        end
        object ed_kubatura: TRxCalcEdit
          Left = 207
          Top = 64
          Width = 70
          Height = 26
          AutoSize = False
          DecimalPlaces = 5
          DisplayFormat = '#0.00000#'
          FormatOnEditing = True
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 19
        end
        object tw_report_ed: TComboBox
          Left = 16
          Top = 416
          Width = 193
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          TabOrder = 20
          Items.Strings = (
            'Учет в кг'
            'Учет в м3')
        end
      end
      object TW_MASTER_ART: TEdit
        Left = 433
        Top = 34
        Width = 110
        Height = 24
        TabStop = False
        TabOrder = 29
        Text = 'TW_MASTER_ART'
        OnChange = TW_NAMEChange
      end
      object chk_TW_IS_OPT: TCheckBox
        Left = 641
        Top = 33
        Width = 109
        Height = 26
        Caption = 'ОПТОВЫЙ'
        TabOrder = 30
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Сертификаты'
      ImageIndex = 3
      object ToolBar3: TToolBar
        Left = 0
        Top = 0
        Width = 848
        Height = 29
        ButtonHeight = 24
        ButtonWidth = 25
        Caption = 'ToolBar3'
        Images = DataModule1.ImageList1
        TabOrder = 0
        object TW_SERT_INS: TToolButton
          Left = 0
          Top = 2
          Hint = 'Новый сертификат'
          Caption = 'TW_SERT_INS'
          ImageIndex = 0
          OnClick = TW_SERT_INSClick
        end
        object TW_SERT_DEL: TToolButton
          Left = 25
          Top = 2
          Hint = 'Удалить сертификат'
          Caption = 'TW_SERT_DEL'
          ImageIndex = 2
          OnClick = TW_SERT_DELClick
        end
      end
      object RxDBGrid3: TRxDBGrid
        Left = 0
        Top = 29
        Width = 848
        Height = 455
        Align = alClient
        DataSource = DsSert
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'SERT_NUM'
            Title.Alignment = taCenter
            Title.Caption = 'Номер'
            Width = 175
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERT_DATE'
            Title.Alignment = taCenter
            Title.Caption = 'Дата'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERT_WHO'
            Title.Alignment = taCenter
            Title.Caption = 'Кем выдан'
            Width = 177
            Visible = True
          end>
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Свойства'
      ImageIndex = 4
      object RxDBGrid4: TRxDBGrid
        Left = 0
        Top = 0
        Width = 1089
        Height = 560
        Align = alClient
        DataSource = DsPropTw
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'PROPTWTYP_NAME'
            Title.Alignment = taCenter
            Title.Caption = 'Свойство'
            Width = 234
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PROPTW_VALUE'
            Title.Alignment = taCenter
            Title.Caption = 'Значение'
            Width = 265
            Visible = True
          end>
      end
      object Panel11: TPanel
        Left = 0
        Top = 560
        Width = 1089
        Height = 38
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 1
        object Label15: TLabel
          Left = 5
          Top = 10
          Width = 115
          Height = 16
          Caption = 'Новое значение :'
        end
        object PROP_INTEGER: TRxSpinEdit
          Left = 116
          Top = 7
          Width = 149
          Height = 24
          Alignment = taRightJustify
          TabOrder = 0
          OnChange = PROP_INTEGERChange
        end
        object PROP_COMBO: TRxDBLookupCombo
          Left = 116
          Top = 7
          Width = 274
          Height = 29
          DropDownCount = 8
          EscapeClear = False
          LookupField = 'ID'
          LookupDisplay = 'value'
          LookupSource = DsProperty
          TabOrder = 1
          OnChange = PROP_COMBOChange
        end
        object PROP_STRING: TEdit
          Left = 500
          Top = 7
          Width = 365
          Height = 21
          TabOrder = 2
          Text = 'PROP_STRING'
          OnChange = PROP_STRINGChange
        end
        object PROP_DOUBLE: TRxCalcEdit
          Left = 544
          Top = 7
          Width = 169
          Height = 26
          AutoSize = False
          DecimalPlaces = 10
          DisplayFormat = ',0.0000000000##'
          ButtonWidth = 25
          NumGlyphs = 2
          TabOrder = 3
          OnChange = PROP_DOUBLEChange
        end
        object PROP_DATE: TDateEdit
          Left = 391
          Top = 7
          Width = 149
          Height = 26
          ButtonWidth = 26
          NumGlyphs = 2
          TabOrder = 4
          OnChange = PROP_DATEChange
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Цены прайс листа'
      ImageIndex = 1
      object Label13: TLabel
        Left = 58
        Top = 401
        Width = 82
        Height = 16
        Caption = 'Мелкий опт :'
        Visible = False
      end
      object Label26: TLabel
        Left = 107
        Top = 426
        Width = 31
        Height = 16
        Caption = 'Опт :'
        Visible = False
      end
      object Label27: TLabel
        Left = 52
        Top = 453
        Width = 89
        Height = 16
        Caption = 'Крупный опт :'
        Visible = False
      end
      object Label28: TLabel
        Left = 601
        Top = 399
        Width = 15
        Height = 16
        Caption = 'от'
        Visible = False
      end
      object Label29: TLabel
        Left = 601
        Top = 423
        Width = 15
        Height = 16
        Caption = 'от'
        Visible = False
      end
      object Label30: TLabel
        Left = 601
        Top = 453
        Width = 15
        Height = 16
        Caption = 'от'
        Visible = False
      end
      object Label31: TLabel
        Left = 738
        Top = 399
        Width = 48
        Height = 16
        Caption = 'Label31'
        Visible = False
      end
      object Label32: TLabel
        Left = 738
        Top = 426
        Width = 48
        Height = 16
        Caption = 'Label31'
        Visible = False
      end
      object Label33: TLabel
        Left = 738
        Top = 453
        Width = 48
        Height = 16
        Caption = 'Label31'
        Visible = False
      end
      object Label40: TLabel
        Left = 364
        Top = 197
        Width = 97
        Height = 16
        Caption = 'Цена хранения'
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 216
        Width = 628
        Height = 29
        Align = alNone
        ButtonHeight = 24
        ButtonWidth = 25
        Caption = 'ToolBar1'
        Images = DataModule1.ImageList1
        TabOrder = 0
        Visible = False
        object TwMon_INS_BTN: TToolButton
          Left = 0
          Top = 2
          Caption = 'TwMon_INS_BTN'
          ImageIndex = 0
        end
        object TwMon_DEL_BTN: TToolButton
          Left = 25
          Top = 2
          Caption = 'TwMon_DEL_BTN'
          ImageIndex = 2
        end
        object ToolButton4: TToolButton
          Left = 50
          Top = 2
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object ToolButton5: TToolButton
          Left = 58
          Top = 2
          Caption = 'ToolButton5'
          Enabled = False
          ImageIndex = 3
        end
      end
      object Panel10: TPanel
        Left = 10
        Top = 311
        Width = 773
        Height = 35
        BevelOuter = bvNone
        TabOrder = 1
        Visible = False
        object Label14: TLabel
          Left = 143
          Top = 10
          Width = 113
          Height = 16
          Caption = 'Розничная цена :'
        end
        object MON1: TRxCalcEdit
          Left = 404
          Top = 5
          Width = 146
          Height = 26
          AutoSize = False
          DisplayFormat = ',0.00 руб'
          Enabled = False
          ButtonWidth = 25
          NumGlyphs = 2
          TabOrder = 0
        end
        object MON2: TRxCalcEdit
          Left = 254
          Top = 5
          Width = 146
          Height = 26
          AutoSize = False
          DisplayFormat = ',0.00 руб##'
          Enabled = False
          ButtonWidth = 25
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object OPTV1: TRxCalcEdit
        Left = 145
        Top = 394
        Width = 149
        Height = 26
        AutoSize = False
        DecimalPlaces = 6
        DisplayFormat = ',0.0000##'
        ButtonWidth = 25
        NumGlyphs = 2
        TabOrder = 2
        Visible = False
        OnChange = OPTV1Change
      end
      object OPT1: TRxCalcEdit
        Left = 295
        Top = 394
        Width = 149
        Height = 26
        AutoSize = False
        DisplayFormat = ',0.00 руб##'
        ButtonWidth = 25
        NumGlyphs = 2
        TabOrder = 3
        Visible = False
        OnChange = OPT1Change
      end
      object OPTSKID1: TRxCalcEdit
        Left = 446
        Top = 394
        Width = 148
        Height = 26
        AutoSize = False
        DecimalPlaces = 20
        DisplayFormat = '#0.000000%'
        ButtonWidth = 25
        NumGlyphs = 2
        TabOrder = 4
        Visible = False
        OnChange = OPTSKID1Change
      end
      object OPTSKID2: TRxCalcEdit
        Left = 446
        Top = 421
        Width = 148
        Height = 26
        AutoSize = False
        DecimalPlaces = 20
        DisplayFormat = '#0.000000%'
        ButtonWidth = 25
        NumGlyphs = 2
        TabOrder = 8
        Visible = False
        OnChange = OPTSKID2Change
      end
      object OPT2: TRxCalcEdit
        Left = 295
        Top = 421
        Width = 149
        Height = 26
        AutoSize = False
        DisplayFormat = ',0.00 руб##'
        ButtonWidth = 25
        NumGlyphs = 2
        TabOrder = 7
        Visible = False
        OnChange = OPT2Change
      end
      object OPTV2: TRxCalcEdit
        Left = 145
        Top = 421
        Width = 149
        Height = 26
        AutoSize = False
        DecimalPlaces = 6
        DisplayFormat = ',0.0000##'
        ButtonWidth = 25
        NumGlyphs = 2
        TabOrder = 6
        Visible = False
        OnChange = OPTV2Change
      end
      object OPTSKID3: TRxCalcEdit
        Left = 446
        Top = 448
        Width = 148
        Height = 26
        AutoSize = False
        DecimalPlaces = 20
        DisplayFormat = '#0.000000%'
        ButtonWidth = 25
        NumGlyphs = 2
        TabOrder = 12
        Visible = False
        OnChange = OPTSKID3Change
      end
      object OPT3: TRxCalcEdit
        Left = 295
        Top = 448
        Width = 149
        Height = 26
        AutoSize = False
        DisplayFormat = ',0.00 руб##'
        ButtonWidth = 25
        NumGlyphs = 2
        TabOrder = 11
        Visible = False
        OnChange = OPT3Change
      end
      object OPTV3: TRxCalcEdit
        Left = 145
        Top = 448
        Width = 149
        Height = 26
        AutoSize = False
        DecimalPlaces = 6
        DisplayFormat = ',0.0000##'
        ButtonWidth = 25
        NumGlyphs = 2
        TabOrder = 10
        Visible = False
        OnChange = OPTV3Change
      end
      object OPTKOL1: TRxCalcEdit
        Left = 620
        Top = 394
        Width = 115
        Height = 26
        AutoSize = False
        DecimalPlaces = 4
        DisplayFormat = '#0.0000'
        ButtonWidth = 25
        NumGlyphs = 2
        TabOrder = 5
        Visible = False
        OnChange = OPTKOL1Change
      end
      object OPTKOL2: TRxCalcEdit
        Left = 620
        Top = 421
        Width = 115
        Height = 26
        AutoSize = False
        DecimalPlaces = 4
        DisplayFormat = '#0.0000'
        ButtonWidth = 25
        NumGlyphs = 2
        TabOrder = 9
        Visible = False
        OnChange = OPTKOL1Change
      end
      object OPTKOL3: TRxCalcEdit
        Left = 620
        Top = 448
        Width = 115
        Height = 26
        AutoSize = False
        DecimalPlaces = 4
        DisplayFormat = '#0.0000'
        ButtonWidth = 25
        NumGlyphs = 2
        TabOrder = 13
        Visible = False
        OnChange = OPTKOL1Change
      end
      object PRICE_GRID: TRxDBGrid
        Left = 0
        Top = 10
        Width = 759
        Height = 168
        DataSource = DS_PRICE
        TabOrder = 14
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'twpricetyp_desc'
            ReadOnly = True
            Title.Caption = 'Тип цены'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'twprice_money'
            Title.Caption = 'Цена'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'twprice_oldmoney'
            ReadOnly = True
            Title.Caption = 'Старая цена'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tm'
            ReadOnly = True
            Title.Caption = 'Дата задания цены'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TWPRICE_DATE'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nac_percent'
            Title.Alignment = taRightJustify
            Width = 74
            Visible = True
          end>
      end
      object TW_NOSKID: TCheckBox
        Left = 0
        Top = 187
        Width = 247
        Height = 21
        Hint = 
          'Доступны только скидки по категориям клиента'#13#10'Дисконт и ручные с' +
          'кидки не действуют'
        Caption = 'Скидки не действуют'
        TabOrder = 15
        OnClick = TW_NOSKIDClick
      end
      object TW_PRICE_PRINT: TCheckBox
        Left = 0
        Top = 217
        Width = 218
        Height = 21
        Hint = 'Если включено, будет печататься в прайс-листе'
        Caption = 'Печать в прайс листе'
        Checked = True
        State = cbChecked
        TabOrder = 16
        OnClick = TW_PRICE_PRINTClick
      end
      object STORE_PRICE: TRxCalcEdit
        Left = 463
        Top = 187
        Width = 149
        Height = 26
        AutoSize = False
        DisplayFormat = ',0.00 руб##'
        ButtonWidth = 25
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 17
        OnChange = OPT1Change
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Цены от Ед. Изм.'
      ImageIndex = 2
      object ToolBar2: TToolBar
        Left = 0
        Top = 0
        Width = 1089
        Height = 29
        ButtonHeight = 24
        ButtonWidth = 25
        Caption = 'ToolBar1'
        Images = DataModule1.ImageList1
        TabOrder = 0
        object BtnNewEdk: TToolButton
          Left = 0
          Top = 2
          Caption = 'ToolButton1'
          ImageIndex = 0
          OnClick = BtnNewEdkClick
        end
        object BtnOpenEdk: TToolButton
          Left = 25
          Top = 2
          Caption = 'ToolButton2'
          Enabled = False
          ImageIndex = 1
          OnClick = BtnOpenEdkClick
        end
        object BtnDelEdk: TToolButton
          Left = 50
          Top = 2
          Caption = 'ToolButton3'
          Enabled = False
          ImageIndex = 2
          OnClick = BtnDelEdkClick
        end
        object ToolButton9: TToolButton
          Left = 75
          Top = 2
          Width = 8
          Caption = 'ToolButton4'
          Enabled = False
          ImageIndex = 3
          Style = tbsSeparator
        end
        object ToolButton10: TToolButton
          Left = 83
          Top = 2
          Caption = 'ToolButton5'
          Enabled = False
          ImageIndex = 3
        end
        object ToolButton1: TToolButton
          Left = 108
          Top = 2
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object Label23: TLabel
          Left = 116
          Top = 2
          Width = 179
          Height = 16
          Caption = 'Цена в базовых единицах :  '
          Layout = tlCenter
        end
        object EDK_MON: TRxCalcEdit
          Left = 295
          Top = 2
          Width = 121
          Height = 24
          AutoSize = False
          DisplayFormat = ',#0.00 руб'
          Enabled = False
          NumGlyphs = 2
          TabOrder = 0
        end
      end
      object RxDBGrid2: TRxDBGrid
        Left = 0
        Top = 29
        Width = 1089
        Height = 550
        Align = alClient
        DataSource = DsEdk
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = RxDBGrid2DblClick
        OnKeyPress = RxDBGrid2KeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'ED_SHORT'
            Title.Alignment = taCenter
            Title.Caption = 'Ед.изм.'
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_KOL'
            Title.Alignment = taCenter
            Title.Caption = 'Кол-во базовых единиц'
            Width = 129
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_MON'
            Title.Alignment = taCenter
            Title.Caption = 'Цена в валюте'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_MON2'
            Title.Alignment = taCenter
            Title.Caption = 'Цена в рублях'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ED_RAZM'
            Title.Alignment = taCenter
            Title.Caption = 'Размеры'
            Width = 148
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ED_UP'
            Title.Alignment = taCenter
            Title.Caption = 'Упаковка'
            Width = 168
            Visible = True
          end>
      end
      object StatusBar1: TStatusBar
        Left = 0
        Top = 579
        Width = 1089
        Height = 19
        Panels = <>
        SimplePanel = False
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Скидки от категорий'
      ImageIndex = 5
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 666
        Height = 609
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Panel1'
        TabOrder = 0
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 666
          Height = 609
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 666
            Height = 25
            Align = alTop
            Caption = 'Товар входит в категории'
            TabOrder = 0
          end
          object Panel8: TPanel
            Left = 0
            Top = 570
            Width = 666
            Height = 39
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 1
            object PROPTWKTG_DEL: TButton
              Left = 98
              Top = 5
              Width = 93
              Height = 31
              Caption = 'Удалить'
              Enabled = False
              TabOrder = 0
              OnClick = PROPTWKTG_DELClick
            end
            object Button1: TButton
              Left = 5
              Top = 5
              Width = 92
              Height = 31
              Caption = 'Добавить'
              TabOrder = 1
              OnClick = Button1Click
            end
          end
          object RxDBGrid6: TRxDBGrid
            Left = 0
            Top = 25
            Width = 666
            Height = 545
            TabStop = False
            Align = alClient
            DataSource = DsPropTwKtg
            DefaultDrawing = False
            ReadOnly = True
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -14
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawDataCell = RxDBGrid6DrawDataCell
            OnDrawColumnCell = RxDBGrid6DrawColumnCell
            OnDblClick = RxDBGrid6DblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'VID'
                Title.Alignment = taCenter
                Title.Caption = '  '
                Width = 17
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROPTWKTG_NAME'
                Title.Alignment = taCenter
                Title.Caption = 'Наименование'
                Width = 122
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OPIS'
                Title.Alignment = taCenter
                Title.Caption = 'Описание'
                Width = 360
                Visible = True
              end>
          end
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = '          Цены в магазинах          '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 6
      ParentFont = False
      object ToolBar4: TToolBar
        Left = 0
        Top = 0
        Width = 1089
        Height = 29
        ButtonHeight = 24
        ButtonWidth = 25
        Caption = 'ToolBar4'
        EdgeBorders = []
        Images = DataModule1.ImageList1
        TabOrder = 0
        object BtnShopNew: TToolButton
          Left = 0
          Top = 2
          Caption = 'BtnShopNew'
          ImageIndex = 0
          OnClick = BtnShopNewClick
        end
        object BtnShopOpen: TToolButton
          Left = 25
          Top = 2
          Caption = 'BtnShopOpen'
          ImageIndex = 1
          OnClick = BtnShopOpenClick
        end
        object BtnShopDel: TToolButton
          Left = 50
          Top = 2
          Caption = 'BtnShopDel'
          ImageIndex = 2
          OnClick = BtnShopDelClick
        end
        object ToolButton2: TToolButton
          Left = 75
          Top = 2
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object Label24: TLabel
          Left = 83
          Top = 2
          Width = 179
          Height = 16
          Caption = 'Цена в базовых единицах :  '
          Layout = tlCenter
        end
        object SHOP_MON: TRxCalcEdit
          Left = 262
          Top = 2
          Width = 121
          Height = 24
          AutoSize = False
          DisplayFormat = ',#0.00 руб'
          Enabled = False
          NumGlyphs = 2
          TabOrder = 0
        end
      end
      object RxDBGrid7: TRxDBGrid
        Left = 0
        Top = 29
        Width = 1089
        Height = 569
        Align = alClient
        DataSource = DsShop
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = RxDBGrid7DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'SHOP_NAME'
            Title.Alignment = taCenter
            Title.Caption = 'Магазин'
            Width = 201
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
    end
    object TabSheet8: TTabSheet
      Caption = 'Штрих-коды на упаковке'
      ImageIndex = 7
      object ToolBar5: TToolBar
        Left = 0
        Top = 0
        Width = 848
        Height = 29
        ButtonHeight = 24
        ButtonWidth = 25
        Caption = 'ToolBar5'
        EdgeBorders = []
        Images = DataModule1.ImageList1
        TabOrder = 0
        object BarCode_New: TToolButton
          Left = 0
          Top = 2
          Hint = 'Создать штрих код'
          Caption = 'BarCode_New'
          ImageIndex = 0
          Visible = False
          OnClick = BarCode_NewClick
        end
        object BarCode_Open: TToolButton
          Left = 25
          Top = 2
          Hint = 'Изменить штрих код'
          Caption = 'BarCode_Open'
          ImageIndex = 1
          Visible = False
          OnClick = BarCode_OpenClick
        end
        object BarCode_DEL: TToolButton
          Left = 50
          Top = 2
          Hint = 'Удалить штрих код'
          Caption = 'BarCode_DEL'
          ImageIndex = 2
          OnClick = BarCode_DELClick
        end
        object ToolButton8: TToolButton
          Left = 75
          Top = 2
          Width = 8
          Caption = 'ToolButton8'
          ImageIndex = 3
          Style = tbsSeparator
        end
      end
      object RxDBGrid8: TRxDBGrid
        Left = 0
        Top = 29
        Width = 848
        Height = 455
        Align = alClient
        DataSource = DS_BAR_CODE
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = RxDBGrid8DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'BAR_CODE_VALUE'
            Title.Caption = 'Код'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TM'
            Title.Caption = 'Добавлен'
            Visible = True
          end>
      end
    end
  end
  object StatusBar3: TStatusBar
    Left = 0
    Top = 19
    Width = 1195
    Height = 19
    Align = alTop
    Panels = <
      item
        Alignment = taRightJustify
        Width = 80
      end
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 200
      end
      item
        Width = 200
      end>
    SimplePanel = False
    SizeGrip = False
  end
  object IbQrED: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = EditTwTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select ed_id,ed_full, ED_SHORT from ed order by ed_full')
    Left = 508
    Top = 622
    object IbQrEDED_ID: TIntegerField
      FieldName = 'ED_ID'
      Required = True
    end
    object IbQrEDED_FULL: TIBStringField
      FieldName = 'ED_FULL'
      Required = True
      Size = 254
    end
    object IbQrEDED_SHORT: TIBStringField
      FieldName = 'ED_SHORT'
      Required = True
      Size = 32
    end
  end
  object DsQrEd: TDataSource
    DataSet = IbQrED
    Left = 536
    Top = 670
  end
  object IbQrValuta: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = EditTwTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select VALUTA_ID, VALUTA_FULL, VALUTA_SHORT,'
      '(select kurs.kurs_kurs from kurs where kurs.kurs_date='
      ' (select max(kurs_date) from kurs where '
      
        '   valuta.valuta_id=kurs.valuta_id and kurs.kurs_typ=0)) as kurs' +
        '_kurs,'
      '(select max(kurs_date) from kurs where '
      
        '   valuta.valuta_id=kurs.valuta_id and kurs.kurs_typ=0) as kurs_' +
        'date'
      'from VALUTA order by VALUTA_ID')
    Left = 690
    Top = 612
    object IbQrValutaVALUTA_ID: TIntegerField
      FieldName = 'VALUTA_ID'
      Required = True
    end
    object IbQrValutaVALUTA_FULL: TIBStringField
      FieldName = 'VALUTA_FULL'
      Required = True
      Size = 254
    end
    object IbQrValutaVALUTA_SHORT: TIBStringField
      FieldName = 'VALUTA_SHORT'
      Required = True
      Size = 32
    end
    object IbQrValutaKURS_KURS: TFloatField
      FieldName = 'KURS_KURS'
    end
    object IbQrValutaKURS_DATE: TDateTimeField
      FieldName = 'KURS_DATE'
    end
  end
  object DsQrValuta: TDataSource
    DataSet = IbQrValuta
    Left = 630
    Top = 608
  end
  object EditTwTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 180
    Top = 544
  end
  object IbQrTwKtg: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = EditTwTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from twktg order by twktg_nam')
    Left = 440
    Top = 622
    object IbQrTwKtgTWKTG_ID: TIntegerField
      FieldName = 'TWKTG_ID'
      Required = True
    end
    object IbQrTwKtgTWKTG_NAM: TIBStringField
      FieldName = 'TWKTG_NAM'
      Required = True
      Size = 254
    end
    object IbQrTwKtgTWKTG_PRIM: TIBStringField
      FieldName = 'TWKTG_PRIM'
      Size = 10000
    end
    object IbQrTwKtgTWKTG_COLOR: TIntegerField
      FieldName = 'TWKTG_COLOR'
      Required = True
    end
  end
  object DsQrTwKtg: TDataSource
    DataSet = IbQrTwKtg
    Left = 444
    Top = 670
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 670
    Top = 680
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 578
    Top = 592
  end
  object TwSert: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'SERT_ID'
        DataType = ftInteger
      end
      item
        Name = 'SERT_NUM'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'SERT_DATE'
        DataType = ftDate
      end
      item
        Name = 'SERT_WHO'
        DataType = ftString
        Size = 254
      end>
    Left = 739
    Top = 664
    object TwSertSERT_ID: TIntegerField
      FieldName = 'SERT_ID'
    end
    object TwSertSERT_NUM: TStringField
      FieldName = 'SERT_NUM'
      Size = 254
    end
    object TwSertSERT_DATE: TDateField
      FieldName = 'SERT_DATE'
      EditMask = '!99/99/0000;1;_'
    end
    object TwSertSERT_WHO: TStringField
      FieldName = 'SERT_WHO'
      Size = 254
    end
  end
  object DsSert: TDataSource
    DataSet = TwSert
    OnDataChange = DsSertDataChange
    Left = 709
    Top = 562
  end
  object PropTw: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'PROPTWTYP_ID'
        DataType = ftInteger
      end
      item
        Name = 'PROPTWTYP_NAME'
        DataType = ftString
        Size = 252
      end
      item
        Name = 'PROPTW_ID'
        DataType = ftInteger
      end
      item
        Name = 'PROPTW_VALUE'
        DataType = ftString
        Size = 252
      end
      item
        Name = 'PROPTWTYP_TYP'
        DataType = ftInteger
      end
      item
        Name = 'PROPTW_VALUEINT'
        DataType = ftInteger
      end
      item
        Name = 'PROPTW_VALUEDT'
        DataType = ftDate
      end
      item
        Name = 'PROPTW_VALUEDBL'
        DataType = ftFloat
      end>
    AfterPost = PropTwAfterPost
    AfterScroll = PropTwAfterScroll
    Left = 65
    Top = 708
    object PropTwPROPTWTYP_ID: TIntegerField
      FieldName = 'PROPTWTYP_ID'
    end
    object PropTwPROPTWTYP_NAME: TStringField
      FieldName = 'PROPTWTYP_NAME'
      Size = 252
    end
    object PropTwPROPTW_ID: TIntegerField
      FieldName = 'PROPTW_ID'
    end
    object PropTwPROPTW_VALUE: TStringField
      FieldName = 'PROPTW_VALUE'
      Size = 252
    end
    object PropTwPROPTWTYP_TYP: TIntegerField
      FieldName = 'PROPTWTYP_TYP'
    end
    object PropTwPROPTW_VALUEINT: TIntegerField
      FieldName = 'PROPTW_VALUEINT'
    end
    object PropTwPROPTW_VALUEDT: TDateField
      FieldName = 'PROPTW_VALUEDT'
    end
    object PropTwPROPTW_VALUEDBL: TFloatField
      FieldName = 'PROPTW_VALUEDBL'
    end
  end
  object DsPropTw: TDataSource
    DataSet = PropTw
    Left = 181
    Top = 664
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 610
    Top = 680
  end
  object MemProperty: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'value'
        DataType = ftString
        Size = 252
      end>
    Left = 53
    Top = 586
    object MemPropertyID: TIntegerField
      FieldName = 'ID'
    end
    object MemPropertyvalue: TStringField
      FieldName = 'value'
      Size = 252
    end
  end
  object DsProperty: TDataSource
    DataSet = MemProperty
    Left = 251
    Top = 660
  end
  object QueryWork2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 624
    Top = 536
  end
  object QueryWork3: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 574
    Top = 502
  end
  object DsShop: TDataSource
    DataSet = QueryShop
    Left = 310
    Top = 682
  end
  object ShopTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 512
    Top = 542
  end
  object QueryShop: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ShopTransaction
    AfterOpen = QueryShopAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from list_twmonshop(:tw_id)'
      'order by shop_name')
    Left = 360
    Top = 486
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
  object MemEdk: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'EDK_ID'
        DataType = ftInteger
      end
      item
        Name = 'ED_ID'
        DataType = ftInteger
      end
      item
        Name = 'ED_SHORT'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'TW_MON'
        DataType = ftFloat
      end
      item
        Name = 'ED_UP'
        DataType = ftString
        Size = 252
      end
      item
        Name = 'ED_RAZM'
        DataType = ftString
        Size = 252
      end
      item
        Name = 'TW_KOL'
        DataType = ftFloat
      end>
    AfterInsert = MemEdkAfterPost
    AfterPost = MemEdkAfterPost
    AfterDelete = MemEdkAfterPost
    OnCalcFields = MemEdkCalcFields
    Left = 276
    Top = 580
    object MemEdkEDK_ID: TIntegerField
      FieldName = 'EDK_ID'
    end
    object MemEdkED_ID: TIntegerField
      FieldName = 'ED_ID'
    end
    object MemEdkED_SHORT: TStringField
      FieldName = 'ED_SHORT'
      Size = 32
    end
    object MemEdkTW_MON: TFloatField
      FieldName = 'TW_MON'
      DisplayFormat = '#0.000'
    end
    object MemEdkTW_MON2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TW_MON2'
      DisplayFormat = '#0.00 руб'
      Calculated = True
    end
    object MemEdkTW_UP: TStringField
      FieldName = 'ED_UP'
      Size = 252
    end
    object MemEdkED_RAZM: TStringField
      FieldName = 'ED_RAZM'
      Size = 252
    end
    object MemEdkTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      DisplayFormat = '#0.0000'
    end
  end
  object DsEdk: TDataSource
    DataSet = MemEdk
    Left = 430
    Top = 484
  end
  object BarCodeTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 42
    Top = 351
  end
  object PropTwKtgTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 334
    Top = 562
  end
  object QueryPROPTWKTG: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PropTwKtgTransaction
    AfterOpen = QueryPROPTWKTGAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from tw_proptwktg(:tw_id)')
    Left = 426
    Top = 560
    ParamData = <
      item
        DataType = ftInteger
        Name = 'tw_id'
        ParamType = ptInput
      end>
    object QueryPROPTWKTGPROPTWKTG_ID: TIntegerField
      FieldName = 'PROPTWKTG_ID'
    end
    object QueryPROPTWKTGPROPTWKTG_NAME: TIBStringField
      FieldName = 'PROPTWKTG_NAME'
      Size = 254
    end
    object QueryPROPTWKTGOPIS: TIBStringField
      FieldName = 'OPIS'
      Size = 254
    end
    object QueryPROPTWKTGVID: TIntegerField
      FieldName = 'VID'
    end
    object QueryPROPTWKTGPROPTWKTGLINK_ID: TIntegerField
      FieldName = 'PROPTWKTGLINK_ID'
    end
  end
  object DsPropTwKtg: TDataSource
    DataSet = QueryPROPTWKTG
    Left = 354
    Top = 632
  end
  object Timer1: TTimer
    Interval = 50
    OnTimer = Timer1Timer
    Left = 92
    Top = 524
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
    Left = 540
    Top = 176
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
  object DS_PRICE: TDataSource
    DataSet = PRICE
    Left = 468
    Top = 160
  end
  object Q_BAR_CODE: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = BarCodeTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from BAR_CODE'
      'where tw_id=:tw_id'
      'order by bar_code_value')
    Left = 36
    Top = 244
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tw_id'
        ParamType = ptUnknown
      end>
    object Q_BAR_CODEBAR_CODE_ID: TIntegerField
      FieldName = 'BAR_CODE_ID'
      Origin = 'BAR_CODE.BAR_CODE_ID'
      Required = True
    end
    object Q_BAR_CODETW_ID: TIntegerField
      FieldName = 'TW_ID'
      Origin = 'BAR_CODE.TW_ID'
      Required = True
    end
    object Q_BAR_CODEBAR_CODE_VALUE: TIBStringField
      FieldName = 'BAR_CODE_VALUE'
      Origin = 'BAR_CODE.BAR_CODE_VALUE'
      Size = 32
    end
    object Q_BAR_CODEBAR_CODE_TYP: TIntegerField
      FieldName = 'BAR_CODE_TYP'
      Origin = 'BAR_CODE.BAR_CODE_TYP'
    end
    object Q_BAR_CODEUS_ID: TIntegerField
      FieldName = 'US_ID'
      Origin = 'BAR_CODE.US_ID'
      Required = True
    end
    object Q_BAR_CODETM: TDateTimeField
      FieldName = 'TM'
      Origin = 'BAR_CODE.TM'
      Required = True
    end
  end
  object DS_BAR_CODE: TDataSource
    DataSet = Q_BAR_CODE
    Left = 32
    Top = 188
  end
end
