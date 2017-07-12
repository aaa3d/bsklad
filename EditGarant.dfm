object Edit_Garant: TEdit_Garant
  Left = 124
  Top = 141
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Гарантийный талон'
  ClientHeight = 228
  ClientWidth = 653
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 40
    Width = 40
    Height = 13
    Caption = 'Номер :'
  end
  object Label2: TLabel
    Left = 200
    Top = 40
    Width = 19
    Height = 13
    Caption = 'От :'
  end
  object Label3: TLabel
    Left = 16
    Top = 68
    Width = 127
    Height = 13
    Caption = 'Наименование изделия :'
  end
  object Label4: TLabel
    Left = 44
    Top = 92
    Width = 96
    Height = 13
    Caption = 'Заводской номер :'
  end
  object Label5: TLabel
    Left = 36
    Top = 116
    Width = 106
    Height = 13
    Caption = 'Стоимость изделия :'
  end
  object Label6: TLabel
    Left = 16
    Top = 140
    Width = 128
    Height = 13
    Caption = 'Курс $ на день продажи :'
  end
  object Label7: TLabel
    Left = 92
    Top = 164
    Width = 53
    Height = 13
    Caption = 'Гарантия :'
  end
  object Label8: TLabel
    Left = 208
    Top = 164
    Width = 23
    Height = 13
    Caption = 'мес.'
  end
  object Label9: TLabel
    Left = 4
    Top = 188
    Width = 136
    Height = 13
    Caption = 'Магазин для рекламаций :'
  end
  object Label10: TLabel
    Left = 280
    Top = 140
    Width = 49
    Height = 13
    Caption = 'телефон :'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 653
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton1'
      ImageIndex = 110
      OnClick = ToolButton1Click
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object BtnSAVE: TToolButton
      Left = 33
      Top = 2
      Hint = 'Сохранить (Ctrl+Enter)'
      Caption = 'BtnSAVE'
      ImageIndex = 39
      OnClick = BtnSAVEClick
    end
    object BtnApply: TToolButton
      Left = 58
      Top = 2
      Hint = 'Применить'
      Caption = 'BtnApply'
      ImageIndex = 38
      OnClick = BtnApplyClick
    end
    object ToolButton3: TToolButton
      Left = 83
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object BtnDicTowar: TToolButton
      Left = 91
      Top = 2
      Hint = 'Товар по каталогу (F11)'
      Caption = 'BtnDicTowar'
      ImageIndex = 37
      OnClick = BtnDicTowarClick
    end
    object BtnPrint: TToolButton
      Left = 116
      Top = 2
      Hint = 'Напечатать гарантийный талон (F9)'
      Caption = 'BtnPrint'
      ImageIndex = 9
      OnClick = BtnPrintClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 209
    Width = 653
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object GARANT_NUM: TEdit
    Left = 64
    Top = 36
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 2
    Text = 'GARANT_NUM'
    OnChange = GARANT_NUMChange
  end
  object GARANT_DT: TDateEdit
    Left = 228
    Top = 36
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 3
    OnChange = GARANT_NUMChange
  end
  object TW_NAM: TEdit
    Left = 148
    Top = 64
    Width = 501
    Height = 21
    TabOrder = 4
    Text = 'TW_NAM'
    OnChange = GARANT_NUMChange
  end
  object TW_NUM: TEdit
    Left = 148
    Top = 88
    Width = 501
    Height = 21
    TabOrder = 5
    Text = 'TW_NUM'
    OnChange = GARANT_NUMChange
  end
  object TW_MONEY: TRxCalcEdit
    Left = 148
    Top = 112
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',#0.00 руб'
    NumGlyphs = 2
    TabOrder = 6
    OnChange = GARANT_NUMChange
  end
  object TW_KURS: TRxCalcEdit
    Left = 148
    Top = 136
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = ',#0.0000 руб/$'
    Enabled = False
    NumGlyphs = 2
    TabOrder = 7
    OnChange = GARANT_NUMChange
  end
  object GARANT_MES: TRxSpinEdit
    Left = 148
    Top = 160
    Width = 53
    Height = 21
    MaxValue = 1000
    Value = 6
    TabOrder = 8
    OnChange = GARANT_NUMChange
  end
  object GARANT_NAK: TCheckBox
    Left = 276
    Top = 164
    Width = 189
    Height = 17
    Caption = 'Наличие фирменной наклейки'
    TabOrder = 9
    OnClick = GARANT_NAKClick
  end
  object SKL_ID: TRxDBLookupCombo
    Left = 148
    Top = 184
    Width = 145
    Height = 21
    DropDownCount = 8
    LookupField = 'SKL_ID'
    LookupDisplay = 'SKL_FULL'
    LookupSource = DsSKL
    TabOrder = 10
    OnChange = GARANT_NUMChange
  end
  object DBEdit1: TDBEdit
    Left = 336
    Top = 136
    Width = 305
    Height = 21
    DataField = 'SKL_TEL'
    DataSource = DsSKL
    Enabled = False
    TabOrder = 11
  end
  object DBEdit2: TDBEdit
    Left = 296
    Top = 184
    Width = 345
    Height = 21
    DataField = 'SKL_ADR'
    DataSource = DsSKL
    Enabled = False
    TabOrder = 12
  end
  object GarantTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 496
    Top = 52
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 584
    Top = 52
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 588
    Top = 112
  end
  object QrSKL: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = GarantTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from skl where skl_speed>0'
      'order by skl_speed')
    Left = 500
    Top = 108
    object QrSKLSKL_ID: TIntegerField
      FieldName = 'SKL_ID'
      Required = True
    end
    object QrSKLSKL_SHORT: TIBStringField
      FieldName = 'SKL_SHORT'
      Required = True
      Size = 32
    end
    object QrSKLSKL_FULL: TIBStringField
      FieldName = 'SKL_FULL'
      Required = True
      Size = 254
    end
    object QrSKLSKL_ADR: TIBStringField
      FieldName = 'SKL_ADR'
      Size = 254
    end
    object QrSKLSKL_TEL: TIBStringField
      FieldName = 'SKL_TEL'
      Size = 254
    end
    object QrSKLSKL_TIME: TIBStringField
      FieldName = 'SKL_TIME'
      Size = 254
    end
    object QrSKLSKL_SPEED: TIntegerField
      FieldName = 'SKL_SPEED'
      Required = True
    end
  end
  object DsSKL: TDataSource
    DataSet = QrSKL
    Left = 500
    Top = 156
  end
  object PopupMenu1: TPopupMenu
    Left = 260
    Top = 80
    object CtrlEnter1: TMenuItem
      Caption = 'Сохранить (Ctrl+Enter)'
      OnClick = BtnSAVEClick
    end
    object N1: TMenuItem
      Caption = 'Применить'
      OnClick = BtnApplyClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = 'Выбрать товар из каталога'
      OnClick = BtnDicTowarClick
    end
    object N3: TMenuItem
      Caption = 'Напечатать гарантийный талон'
      ShortCut = 120
      OnClick = BtnPrintClick
    end
  end
end
