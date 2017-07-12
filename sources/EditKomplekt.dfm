object EDIT_KOMPLEKT: TEDIT_KOMPLEKT
  Left = 89
  Top = 235
  Width = 705
  Height = 417
  Caption = 'Комплект товаров'
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
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 371
    Width = 697
    Height = 19
    Panels = <
      item
        Text = 'Состояние :'
        Width = 200
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 697
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    EdgeBorders = [ebTop, ebBottom]
    Images = DataModule1.ImageList1
    TabOrder = 1
    object BtnSave: TToolButton
      Left = 0
      Top = 2
      Hint = 'Сохранить'
      Caption = 'BtnSave'
      ImageIndex = 39
      OnClick = BtnSaveClick
    end
    object BtnApply: TToolButton
      Left = 25
      Top = 2
      Hint = 'Применить'
      Caption = 'BtnApply'
      ImageIndex = 38
      OnClick = BtnApplyClick
    end
    object ToolButton1: TToolButton
      Left = 50
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 39
      Style = tbsSeparator
    end
    object BtnDel: TToolButton
      Left = 58
      Top = 2
      Hint = 'Удалить товар из комплекта'
      Caption = 'BtnDel'
      ImageIndex = 2
      OnClick = BtnDelClick
    end
    object ToolButton4: TToolButton
      Left = 83
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object BtnCalc: TToolButton
      Left = 91
      Top = 2
      Hint = 'Рассчитать цены по товарам в комплекте...'
      Caption = 'BtnCalc'
      ImageIndex = 124
      OnClick = BtnCalcClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 697
    Height = 148
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 4
      Top = 36
      Width = 140
      Height = 13
      Caption = 'Наименование комплекта :'
    end
    object Label2: TLabel
      Left = 118
      Top = 12
      Width = 25
      Height = 13
      Caption = 'Код :'
    end
    object Label3: TLabel
      Left = 98
      Top = 60
      Width = 45
      Height = 13
      Caption = 'Ед. изм.:'
    end
    object Label16: TLabel
      Left = 40
      Top = 128
      Width = 97
      Height = 13
      Caption = 'Категория товара :'
    end
    object Label6: TLabel
      Left = 60
      Top = 82
      Width = 82
      Height = 13
      Caption = 'Валюта товара :'
    end
    object Label12: TLabel
      Left = 58
      Top = 104
      Width = 87
      Height = 13
      Caption = 'Розничная цена :'
    end
    object Label4: TLabel
      Left = 540
      Top = 106
      Width = 39
      Height = 13
      Caption = 'Label4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label5: TLabel
      Left = 376
      Top = 104
      Width = 36
      Height = 13
      Caption = 'Итого :'
      Visible = False
    end
    object TW_ART: TEdit
      Left = 148
      Top = 8
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object TW_NAM: TEdit
      Left = 148
      Top = 32
      Width = 417
      Height = 21
      TabOrder = 1
      OnChange = TW_NAMChange
    end
    object ED_ID: TRxDBLookupCombo
      Left = 148
      Top = 56
      Width = 211
      Height = 21
      DropDownCount = 8
      EscapeClear = False
      LookupField = 'ED_ID'
      LookupDisplay = 'ED_FULL'
      LookupSource = DsEd
      TabOrder = 2
      OnChange = ED_IDChange
    end
    object TWKTG: TRxDBLookupCombo
      Left = 148
      Top = 124
      Width = 544
      Height = 21
      DropDownCount = 8
      LookupField = 'TWKTG_ID'
      LookupDisplay = 'TWKTG_NAM'
      LookupSource = DsQrTwKtg
      TabOrder = 3
      OnChange = TWKTGChange
    end
    object VALUTA_ID: TRxDBLookupCombo
      Left = 148
      Top = 78
      Width = 544
      Height = 21
      DropDownCount = 8
      Enabled = False
      LookupField = 'VALUTA_ID'
      LookupDisplay = 'VALUTA_FULL'
      LookupSource = DsQrValuta
      TabOrder = 4
    end
    object TW_MROZ: TRxCalcEdit
      Left = 148
      Top = 100
      Width = 121
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00 руб'
      NumGlyphs = 2
      TabOrder = 5
      OnChange = TW_MROZChange
    end
    object TW_MROZ2: TRxCalcEdit
      Left = 272
      Top = 100
      Width = 97
      Height = 21
      AutoSize = False
      DecimalPlaces = 10
      DisplayFormat = ',0.0000 $'
      Enabled = False
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 6
    end
    object MON2: TRxCalcEdit
      Left = 416
      Top = 100
      Width = 121
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00 руб'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 7
      Visible = False
      OnChange = TW_MROZChange
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 177
    Width = 697
    Height = 194
    Align = alClient
    DataSource = DsMemTW
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = RxDBGrid1GetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'TW_ART'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Код'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_NAME'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Наименование товара'
        Width = 225
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_KOL'
        Title.Alignment = taCenter
        Title.Caption = 'Кол-во'
        Width = 72
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ED_SHORT'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Ед.'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_MROZ'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Розн. цена'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_MROZ_NEW'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Цена в комплекте'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_SKID'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Скидка, %'
        Width = 81
        Visible = True
      end>
  end
  object DicTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 488
    Top = 58
  end
  object DicEd: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DicTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from ed order by ed_short')
    Left = 376
    Top = 58
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
    Left = 428
    Top = 58
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 574
    Top = 60
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 660
    Top = 60
  end
  object IbQrValuta: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DicTransaction
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
    Left = 580
    Top = 78
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
    Left = 632
    Top = 114
  end
  object IbQrTwKtg: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DicTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from twktg order by twktg_nam')
    Left = 486
    Top = 114
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
    Left = 692
    Top = 116
  end
  object MemTW: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'TW_ID'
        DataType = ftInteger
      end
      item
        Name = 'TW_ART'
        DataType = ftInteger
      end
      item
        Name = 'TW_NAME'
        DataType = ftString
        Size = 254
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
        Name = 'TW_MROZ'
        DataType = ftFloat
      end
      item
        Name = 'TW_MROZ_NEW'
        DataType = ftFloat
      end
      item
        Name = 'TWKOMPL_ID'
        DataType = ftInteger
      end
      item
        Name = 'TW_COLOR'
        DataType = ftInteger
      end>
    AfterPost = MemTWAfterPost
    OnCalcFields = MemTWCalcFields
    Left = 226
    Top = 250
    object MemTWTW_ID: TIntegerField
      FieldName = 'TW_ID'
    end
    object MemTWTW_ART: TIntegerField
      FieldName = 'TW_ART'
    end
    object MemTWTW_NAME: TStringField
      FieldName = 'TW_NAME'
      Size = 254
    end
    object MemTWTW_KOL: TFloatField
      FieldName = 'TW_KOL'
    end
    object MemTWED_SHORT: TStringField
      FieldName = 'ED_SHORT'
      Size = 32
    end
    object MemTWTW_MROZ: TFloatField
      FieldName = 'TW_MROZ'
      DisplayFormat = ',#0.00 руб'
    end
    object MemTWTW_MROZ_NEW: TFloatField
      FieldName = 'TW_MROZ_NEW'
      DisplayFormat = ',#0.00 руб'
    end
    object MemTWTW_SKID: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TW_SKID'
      DisplayFormat = '#0.0000000'
      Calculated = True
    end
    object MemTWTWKOMPL_ID: TIntegerField
      FieldName = 'TWKOMPL_ID'
    end
    object MemTWTW_COLOR: TIntegerField
      FieldName = 'TW_COLOR'
    end
  end
  object DsMemTW: TDataSource
    DataSet = MemTW
    OnDataChange = DsMemTWDataChange
    Left = 224
    Top = 300
  end
  object QueryWork2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    Left = 672
    Top = 258
  end
  object WorkTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 572
    Top = 254
  end
end
