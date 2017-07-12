object EDIT_PROPTWKTG: TEDIT_PROPTWKTG
  Left = 167
  Top = 177
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Категория скидок'
  ClientHeight = 175
  ClientWidth = 555
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 30
    Width = 64
    Height = 13
    Caption = 'Вид скидки :'
  end
  object Label2: TLabel
    Left = 8
    Top = 54
    Width = 102
    Height = 13
    Caption = 'Для мелкого опта +'
  end
  object Label3: TLabel
    Left = 54
    Top = 76
    Width = 56
    Height = 13
    Caption = 'Для опта +'
  end
  object Label4: TLabel
    Left = 4
    Top = 98
    Width = 105
    Height = 13
    Caption = 'Для крупного опта +'
  end
  object Label5: TLabel
    Left = 476
    Top = 78
    Width = 32
    Height = 13
    Caption = 'Label5'
  end
  object Label6: TLabel
    Left = 476
    Top = 98
    Width = 32
    Height = 13
    Caption = 'Label6'
  end
  object Label7: TLabel
    Left = 30
    Top = 6
    Width = 82
    Height = 13
    Caption = 'Наименование :'
  end
  object Label8: TLabel
    Left = 218
    Top = 54
    Width = 8
    Height = 13
    Caption = '%'
  end
  object Label9: TLabel
    Left = 218
    Top = 76
    Width = 8
    Height = 13
    Caption = '%'
  end
  object Label10: TLabel
    Left = 218
    Top = 98
    Width = 8
    Height = 13
    Caption = '%'
  end
  object VID: TComboBox
    Left = 116
    Top = 26
    Width = 281
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = 'VID'
    OnChange = VIDChange
    Items.Strings = (
      'Скидка от количества'
      'Скидка от суммы покупки')
  end
  object SUM1: TRxCalcEdit
    Left = 228
    Top = 50
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00 руб##'
    NumGlyphs = 2
    TabOrder = 5
    OnChange = SUM1Change
  end
  object SUM2: TRxCalcEdit
    Left = 228
    Top = 72
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00 руб##'
    NumGlyphs = 2
    TabOrder = 6
    OnChange = SUM1Change
  end
  object SUM3: TRxCalcEdit
    Left = 228
    Top = 94
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00 руб##'
    NumGlyphs = 2
    TabOrder = 7
    OnChange = SUM1Change
  end
  object KOL1: TRxCalcEdit
    Left = 352
    Top = 50
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = ',0.0000'
    NumGlyphs = 2
    TabOrder = 8
    OnChange = KOL1Change
  end
  object KOL2: TRxCalcEdit
    Left = 352
    Top = 72
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = ',0.0000'
    NumGlyphs = 2
    TabOrder = 9
    OnChange = KOL1Change
  end
  object KOL3: TRxCalcEdit
    Left = 352
    Top = 94
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = ',0.0000'
    NumGlyphs = 2
    TabOrder = 10
    OnChange = KOL1Change
  end
  object ED: TRxDBLookupCombo
    Left = 476
    Top = 50
    Width = 71
    Height = 21
    DropDownCount = 8
    LookupField = 'ED_ID'
    LookupDisplay = 'ED_SHORT'
    LookupSource = DsEd
    TabOrder = 11
    OnChange = EDChange
  end
  object BtnSave: TButton
    Left = 476
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Ок'
    TabOrder = 12
    OnClick = BtnSaveClick
  end
  object Button2: TButton
    Left = 476
    Top = 146
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 13
    OnClick = Button2Click
  end
  object NAME: TEdit
    Left = 116
    Top = 2
    Width = 355
    Height = 21
    MaxLength = 250
    TabOrder = 0
    Text = 'NAME'
    OnChange = NAMEChange
  end
  object SKID1: TRxCalcEdit
    Left = 116
    Top = 50
    Width = 101
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = ',0.0000##'
    NumGlyphs = 2
    TabOrder = 2
    OnChange = SKID1Change
  end
  object SKID2: TRxCalcEdit
    Left = 116
    Top = 72
    Width = 101
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = ',0.0000##'
    NumGlyphs = 2
    TabOrder = 3
    OnChange = SKID1Change
  end
  object SKID3: TRxCalcEdit
    Left = 116
    Top = 94
    Width = 101
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = ',0.0000##'
    NumGlyphs = 2
    TabOrder = 4
    OnChange = SKID1Change
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 262
    Top = 6
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 262
    Top = 58
  end
  object EDTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 348
    Top = 6
  end
  object DicEd: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = EDTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from ed order by ed_short')
    Left = 346
    Top = 60
    object DicEdED_ID: TIntegerField
      FieldName = 'ED_ID'
      Required = True
    end
    object DicEdED_SHORT: TIBStringField
      FieldName = 'ED_SHORT'
      Required = True
      Size = 32
    end
    object DicEdED_FULL: TIBStringField
      FieldName = 'ED_FULL'
      Required = True
      Size = 254
    end
    object DicEdED_AUTO1: TIBStringField
      FieldName = 'ED_AUTO1'
      Required = True
      Size = 254
    end
    object DicEdED_AUTO2: TIBStringField
      FieldName = 'ED_AUTO2'
      Required = True
      Size = 254
    end
    object DicEdED_AUTO3: TIBStringField
      FieldName = 'ED_AUTO3'
      Required = True
      Size = 254
    end
    object DicEdTM: TDateTimeField
      FieldName = 'TM'
      Required = True
    end
  end
  object DsEd: TDataSource
    DataSet = DicEd
    Left = 394
    Top = 6
  end
end
