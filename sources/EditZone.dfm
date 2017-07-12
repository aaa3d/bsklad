object EDIT_ZONE: TEDIT_ZONE
  Left = 717
  Top = 213
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Редактирование зоны'
  ClientHeight = 346
  ClientWidth = 251
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
    Left = 12
    Top = 40
    Width = 85
    Height = 13
    Caption = 'Название зоны :'
  end
  object Label2: TLabel
    Left = 12
    Top = 83
    Width = 37
    Height = 13
    Caption = 'Склад :'
  end
  object Label51: TLabel
    Left = 8
    Top = 176
    Width = 156
    Height = 13
    Caption = 'Габаритные размеры зоны, м:'
    Visible = False
  end
  object Label52: TLabel
    Left = 4
    Top = 200
    Width = 12
    Height = 13
    Caption = 'Д:'
  end
  object Label53: TLabel
    Left = 78
    Top = 200
    Width = 12
    Height = 13
    Caption = 'Ш:'
  end
  object Label54: TLabel
    Left = 151
    Top = 200
    Width = 10
    Height = 13
    Caption = 'Т:'
  end
  object Label43: TLabel
    Left = 60
    Top = 240
    Width = 87
    Height = 13
    Caption = 'Объем зоны, м3:'
  end
  object Label3: TLabel
    Left = 16
    Top = 264
    Width = 48
    Height = 13
    Caption = 'Тип зоны'
  end
  object Label4: TLabel
    Left = 12
    Top = 128
    Width = 75
    Height = 13
    Caption = 'комментарий :'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 327
    Width = 251
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 251
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Hint = 'Сохранить'
      Caption = 'Сохранить'
      ImageIndex = 39
      OnClick = ToolButton1Click
    end
    object btnApply: TToolButton
      Left = 25
      Top = 2
      Hint = 'Применить'
      Caption = 'Применить'
      ImageIndex = 38
      OnClick = btnApplyClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 160
    Top = 400
    Width = 233
    Height = 41
    Hint = 'Тип зоны может быть задан только один раз'
    Caption = 'Тип зоны'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    object ZoneType2: TRadioButton
      Left = 128
      Top = 16
      Width = 113
      Height = 17
      Hint = 'Зона торговли с НДС'
      Caption = 'Оптовая зона'
      TabOrder = 0
    end
    object ZoneType1: TRadioButton
      Left = 8
      Top = 16
      Width = 113
      Height = 17
      Hint = 'Зона торговли без НДС'
      Caption = 'Розничная зона'
      Checked = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = True
    end
  end
  object cbZoneClosed: TCheckBox
    Left = 160
    Top = 488
    Width = 97
    Height = 17
    Hint = 'С закрытой зоны запрещено внешнее перемещение'
    Caption = 'Закрытая зона'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object GroupBox2: TGroupBox
    Left = 160
    Top = 448
    Width = 233
    Height = 41
    Caption = 'Положение зоны'
    TabOrder = 4
    object ZonePlaceVist: TRadioButton
      Left = 8
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Выставка'
      TabOrder = 0
    end
    object ZonePlaceSkl: TRadioButton
      Left = 128
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Склад'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
  end
  object SKL: TRxDBLookupCombo
    Left = 8
    Top = 95
    Width = 236
    Height = 23
    DropDownCount = 8
    EscapeClear = False
    LookupField = 'SKL_ID'
    LookupDisplay = 'SKL_SHORT'
    LookupSource = DataModule1.MainDsSkl
    TabOrder = 5
  end
  object zone_length: TRxCalcEdit
    Left = 16
    Top = 196
    Width = 57
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = '#0.0000#'
    FormatOnEditing = True
    ButtonWidth = 0
    NumGlyphs = 2
    TabOrder = 6
    OnChange = zone_lengthChange
  end
  object zone_width: TRxCalcEdit
    Left = 91
    Top = 196
    Width = 57
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = '#0.0000#'
    FormatOnEditing = True
    ButtonWidth = 0
    NumGlyphs = 2
    TabOrder = 7
    OnChange = zone_lengthChange
  end
  object zone_height: TRxCalcEdit
    Left = 161
    Top = 196
    Width = 57
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = '#0.0000#'
    FormatOnEditing = True
    ButtonWidth = 0
    NumGlyphs = 2
    TabOrder = 8
    OnChange = zone_lengthChange
  end
  object ZONE_KUBATURA: TRxCalcEdit
    Left = 160
    Top = 236
    Width = 57
    Height = 21
    AutoSize = False
    DecimalPlaces = 5
    DisplayFormat = '#0.00000#'
    FormatOnEditing = True
    ButtonWidth = 0
    NumGlyphs = 2
    TabOrder = 9
  end
  object zone_type: TComboBox
    Left = 16
    Top = 280
    Width = 209
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 10
    Items.Strings = (
      'Стеллаж'
      'Пандус'
      '...')
  end
  object ZONE_DESCR: TEdit
    Left = 7
    Top = 140
    Width = 236
    Height = 21
    MaxLength = 32
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object ZONE_NAME: TMaskEdit
    Left = 8
    Top = 56
    Width = 233
    Height = 21
    EditMask = '0\-00\-00\-0;1;_'
    MaxLength = 9
    TabOrder = 12
    Text = ' -  -  - '
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 320
    Top = 104
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 312
    Top = 152
  end
end
