object edit_tw_sklad_params: Tedit_tw_sklad_params
  Left = 296
  Top = 207
  Width = 845
  Height = 639
  Caption = 'Редактор складских параметров товара'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 73
    Height = 24
    Caption = 'Артикул'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 168
    Top = 16
    Width = 401
    Height = 65
    AutoSize = False
    Caption = '()'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 88
    Width = 233
    Height = 497
    Caption = 'Параметры работы склада'
    TabOrder = 0
    object Label43: TLabel
      Left = 68
      Top = 304
      Width = 104
      Height = 13
      Caption = 'Объем паллеты, м3:'
    end
    object Label44: TLabel
      Left = 8
      Top = 16
      Width = 212
      Height = 13
      Caption = 'Габаритные размеры единицы товара, м:'
    end
    object Label35: TLabel
      Left = 12
      Top = 32
      Width = 12
      Height = 13
      Caption = 'Д:'
    end
    object Label36: TLabel
      Left = 86
      Top = 32
      Width = 12
      Height = 13
      Caption = 'Ш:'
    end
    object Label42: TLabel
      Left = 159
      Top = 32
      Width = 10
      Height = 13
      Caption = 'Т:'
    end
    object Label45: TLabel
      Left = 8
      Top = 88
      Width = 159
      Height = 13
      Caption = 'Количество товара в упаковке:'
    end
    object Label46: TLabel
      Left = 8
      Top = 104
      Width = 177
      Height = 13
      Caption = 'Габаритные размеры упаковки, м:'
    end
    object Label47: TLabel
      Left = 12
      Top = 120
      Width = 12
      Height = 13
      Caption = 'Д:'
    end
    object Label48: TLabel
      Left = 86
      Top = 120
      Width = 12
      Height = 13
      Caption = 'Ш:'
    end
    object Label49: TLabel
      Left = 159
      Top = 120
      Width = 10
      Height = 13
      Caption = 'Т:'
    end
    object Label50: TLabel
      Left = 8
      Top = 200
      Width = 153
      Height = 13
      Caption = 'Количество товара в паллете:'
    end
    object Label51: TLabel
      Left = 16
      Top = 240
      Width = 173
      Height = 13
      Caption = 'Габаритные размеры паллеты, м:'
      Visible = False
    end
    object Label52: TLabel
      Left = 12
      Top = 264
      Width = 12
      Height = 13
      Caption = 'Д:'
    end
    object Label53: TLabel
      Left = 86
      Top = 264
      Width = 12
      Height = 13
      Caption = 'Ш:'
    end
    object Label54: TLabel
      Left = 159
      Top = 264
      Width = 10
      Height = 13
      Caption = 'Т:'
    end
    object Label55: TLabel
      Left = 8
      Top = 176
      Width = 165
      Height = 13
      Caption = 'Количество упаковок в паллете:'
    end
    object Label41: TLabel
      Left = 68
      Top = 144
      Width = 108
      Height = 13
      Caption = 'Объем упаковки, м3:'
    end
    object Label56: TLabel
      Left = 68
      Top = 56
      Width = 105
      Height = 13
      Caption = 'Объем единицы, м3:'
    end
    object Label5: TLabel
      Left = 16
      Top = 384
      Width = 101
      Height = 13
      Caption = 'Срок хранения, мес'
    end
    object Label22: TLabel
      Left = 21
      Top = 416
      Width = 76
      Height = 13
      Caption = 'Масса (кг/ед) :'
    end
    object TW_PALET_KOL: TRxCalcEdit
      Left = 168
      Top = 196
      Width = 57
      Height = 21
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = '#0.00#'
      FormatOnEditing = True
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 0
      OnChange = tw_kol_in_upChange
    end
    object TW_PALET_UCHET: TCheckBox
      Left = 16
      Top = 336
      Width = 201
      Height = 17
      Caption = 'Погрузка-отгрузка в паллетах'
      TabOrder = 1
    end
    object Button2: TButton
      Left = 184
      Top = 336
      Width = 97
      Height = 25
      Caption = 'Рассчет паллеты'
      TabOrder = 2
      Visible = False
    end
    object TW_PALET_KUBATORA: TRxCalcEdit
      Left = 168
      Top = 300
      Width = 57
      Height = 21
      AutoSize = False
      DecimalPlaces = 5
      DisplayFormat = '#0.00000#'
      FormatOnEditing = True
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 3
      OnChange = tw_kol_in_upChange
    end
    object TW_LENGTH: TRxCalcEdit
      Left = 24
      Top = 28
      Width = 57
      Height = 21
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
      Left = 99
      Top = 28
      Width = 57
      Height = 21
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
      Left = 169
      Top = 28
      Width = 57
      Height = 21
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
      Left = 8
      Top = 72
      Width = 113
      Height = 17
      Caption = 'Собран в упаковки'
      TabOrder = 7
      OnClick = chk_stored_in_upClick
    end
    object tw_kol_in_up: TRxCalcEdit
      Left = 169
      Top = 84
      Width = 57
      Height = 21
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = '#0.00#'
      Enabled = False
      FormatOnEditing = True
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 8
      OnChange = tw_kol_in_upChange
    end
    object up_length: TRxCalcEdit
      Left = 24
      Top = 116
      Width = 57
      Height = 21
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
      Left = 99
      Top = 116
      Width = 57
      Height = 21
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
      Left = 169
      Top = 116
      Width = 57
      Height = 21
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
      Left = 16
      Top = 288
      Width = 137
      Height = 17
      Caption = 'Типовая паллета (1м3)'
      TabOrder = 12
      OnClick = chk_typical_paletClick
    end
    object palet_length: TRxCalcEdit
      Left = 24
      Top = 260
      Width = 57
      Height = 21
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
      Left = 99
      Top = 260
      Width = 57
      Height = 21
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
      Left = 169
      Top = 260
      Width = 57
      Height = 21
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
      Left = 168
      Top = 172
      Width = 58
      Height = 21
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = '#0.00#'
      Enabled = False
      FormatOnEditing = True
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 16
      OnChange = tw_kol_in_upChange
    end
    object checkNegabarit: TCheckBox
      Left = 17
      Top = 360
      Width = 112
      Height = 17
      Caption = 'Негабаритный'
      TabOrder = 17
    end
    object up_kubatura: TRxCalcEdit
      Left = 168
      Top = 140
      Width = 57
      Height = 21
      AutoSize = False
      DecimalPlaces = 5
      DisplayFormat = '#0.00000#'
      FormatOnEditing = True
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 18
      OnChange = tw_kol_in_upChange
    end
    object ed_kubatura: TRxCalcEdit
      Left = 168
      Top = 52
      Width = 57
      Height = 21
      AutoSize = False
      DecimalPlaces = 5
      DisplayFormat = '#0.00000#'
      FormatOnEditing = True
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 19
    end
    object btnSave1: TButton
      Left = 8
      Top = 464
      Width = 75
      Height = 25
      Caption = 'Сохранить'
      TabOrder = 20
      OnClick = btnSave1Click
    end
    object tw_srok: TRxSpinEdit
      Left = 120
      Top = 384
      Width = 89
      Height = 21
      Decimal = 0
      Value = 12
      TabOrder = 21
    end
    object TW_WEIGHT: TRxCalcEdit
      Left = 120
      Top = 412
      Width = 89
      Height = 21
      AutoSize = False
      NumGlyphs = 2
      TabOrder = 22
    end
  end
  object GroupBox2: TGroupBox
    Left = 280
    Top = 88
    Width = 497
    Height = 497
    Caption = 'Рапределение по зонам'
    TabOrder = 1
    object Label3: TLabel
      Left = 48
      Top = 24
      Width = 241
      Height = 13
      Caption = 'ИМЯ ЗОНЫ: СКЛАД-ЗОНА-ЯЧЕЙКА-УРОВЕНЬ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Button3: TButton
      Left = 8
      Top = 464
      Width = 75
      Height = 25
      Caption = 'Сохранить'
      TabOrder = 0
      OnClick = Button3Click
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 48
      Width = 481
      Height = 321
      DataSource = DataSource1
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'zone_name'
          Title.Caption = 'Имя зоны'
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tw_kol'
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'skl_short'
          Title.Caption = 'Склад'
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tw_date_proizv'
          Title.Caption = 'Дата производства'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tw_srok_ost'
          Title.Caption = 'Срок, мес'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tw_date_proizv00'
          Visible = True
        end>
    end
    object Button4: TButton
      Left = 8
      Top = 16
      Width = 33
      Height = 25
      Caption = '+'
      TabOrder = 2
      OnClick = Button4Click
    end
  end
  object MaskEdit1: TMaskEdit
    Left = 16
    Top = 40
    Width = 121
    Height = 32
    EditMask = '999999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 2
    OnChange = MaskEdit1Change
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 208
    Top = 8
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 272
    Top = 24
  end
  object RxMemoryData1: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'tw_kol'
        DataType = ftFloat
      end
      item
        Name = 'zone_name'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'zone_id'
        DataType = ftInteger
      end
      item
        Name = 'zone_reg_id'
        DataType = ftInteger
      end
      item
        Name = 'skl_id'
        DataType = ftInteger
      end
      item
        Name = 'skl_short'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'save'
        DataType = ftBoolean
      end
      item
        Name = 'tw_date_proizv00'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'tw_srok_ost'
        DataType = ftInteger
      end
      item
        Name = 'ZONE_OST_TW_SROK_ID'
        DataType = ftInteger
      end
      item
        Name = 'tw_date_proizv'
        DataType = ftDate
      end>
    Left = 432
    Top = 216
    object RxMemoryData1tw_kol: TFloatField
      DisplayLabel = 'Кол-во'
      DisplayWidth = 18
      FieldName = 'tw_kol'
    end
    object RxMemoryData1zone_name: TStringField
      DisplayLabel = 'Зона'
      DisplayWidth = 21
      FieldName = 'zone_name'
      EditMask = '0\-00\-00\-0;1;_'
    end
    object RxMemoryData1zone_id: TIntegerField
      DisplayLabel = 'код зоны'
      DisplayWidth = 18
      FieldName = 'zone_id'
      Visible = False
    end
    object RxMemoryData1id: TIntegerField
      DefaultExpression = '-1'
      DisplayWidth = 15
      FieldName = 'zone_reg_id'
      Visible = False
    end
    object RxMemoryData1skl_id: TIntegerField
      FieldName = 'skl_id'
    end
    object RxMemoryData1skl_short: TStringField
      DisplayWidth = 10
      FieldName = 'skl_short'
      Size = 250
    end
    object RxMemoryData1save: TBooleanField
      FieldName = 'save'
    end
    object tw_date_proizv00: TStringField
      DisplayWidth = 10
      FieldName = 'tw_date_proizv00'
      EditMask = '!99/99/0000;1;_'
      Size = 32
    end
    object RxMemoryData1tw_srok_ost: TIntegerField
      FieldName = 'tw_srok_ost'
    end
    object RxMemoryData1ZONE_OST_TW_SROK_ID: TIntegerField
      FieldName = 'ZONE_OST_TW_SROK_ID'
    end
    object RxMemoryData1tw_date_proizv1: TDateField
      FieldName = 'tw_date_proizv'
      EditMask = '!99/99/00;1;_'
    end
  end
  object DataSource1: TDataSource
    DataSet = RxMemoryData1
    Left = 384
    Top = 272
  end
  object IBQuery2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    Left = 472
    Top = 352
  end
end
