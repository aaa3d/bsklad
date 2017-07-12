object EDIT_KKM: TEDIT_KKM
  Left = 408
  Top = 289
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Карточка ККМ'
  ClientHeight = 221
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 72
    Width = 94
    Height = 13
    Alignment = taRightJustify
    Caption = 'Имя компьютера :'
  end
  object Label2: TLabel
    Left = 38
    Top = 120
    Width = 68
    Height = 13
    Alignment = taRightJustify
    Caption = 'Модель ККМ:'
  end
  object Label3: TLabel
    Left = 25
    Top = 144
    Width = 81
    Height = 13
    Alignment = taRightJustify
    Caption = 'Код активации :'
  end
  object Label4: TLabel
    Left = 50
    Top = 168
    Width = 56
    Height = 13
    Alignment = taRightJustify
    Caption = 'COM порт :'
  end
  object Label5: TLabel
    Left = 56
    Top = 40
    Width = 50
    Height = 13
    Alignment = taRightJustify
    Caption = 'Магазин :'
  end
  object Label8: TLabel
    Left = 13
    Top = 168
    Width = 93
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '               Фирма : '
    Visible = False
  end
  object Label6: TLabel
    Left = 17
    Top = 96
    Width = 89
    Height = 13
    Alignment = taRightJustify
    Caption = 'Кассовое место :'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 202
    Width = 336
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 336
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = ActSave
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 2
      Action = ActApply
    end
  end
  object COMP_NAME: TEdit
    Left = 112
    Top = 68
    Width = 181
    Height = 21
    TabOrder = 2
    Text = 'COMP_NAME'
    OnChange = COMP_NAMEChange
  end
  object MODEL: TComboBox
    Left = 112
    Top = 116
    Width = 181
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Text = 'MODEL'
    OnChange = MODELChange
    Items.Strings = (
      'АМС-100Ф'
      'ЭЛВЕС-ФР'
      'АМС-200Ф'
      'Штрих-ФР-К')
  end
  object COM: TComboBox
    Left = 112
    Top = 164
    Width = 181
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Text = 'COM1'
    OnChange = COMChange
    Items.Strings = (
      'COM1'
      'COM2'
      'COM3'
      'COM4')
  end
  object shop: TRxDBLookupCombo
    Left = 112
    Top = 40
    Width = 181
    Height = 21
    DropDownCount = 8
    LookupField = 'SHOP_ID'
    LookupDisplay = 'SHOP_NAME'
    LookupSource = DataSource1
    TabOrder = 5
  end
  object FRM: TRxDBLookupCombo
    Left = 112
    Top = 164
    Width = 181
    Height = 20
    DropDownCount = 8
    EscapeClear = False
    LookupField = 'KLN_ID'
    LookupDisplay = 'FRM_NAME'
    LookupSource = DsFrm
    TabOrder = 6
    Visible = False
  end
  object CODE: TEdit
    Left = 112
    Top = 140
    Width = 181
    Height = 21
    TabOrder = 7
    OnKeyPress = CODEKeyPress
  end
  object KKM_NAME: TEdit
    Left = 112
    Top = 92
    Width = 181
    Height = 21
    TabOrder = 8
    Text = 'COMP_NAME'
    OnChange = COMP_NAMEChange
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 128
    Top = 332
    object ActSave: TAction
      Caption = 'Сохранить'
      Hint = 'Сохранить'
      ImageIndex = 39
      ShortCut = 16397
      OnExecute = ActSaveExecute
    end
    object ActApply: TAction
      Caption = 'Применить'
      Hint = 'Применить'
      ImageIndex = 38
      ShortCut = 16467
      OnExecute = ActApplyExecute
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 204
    Top = 332
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 204
    Top = 380
  end
  object IBShop: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SHOPTrans
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from list_shop(0)')
    Left = 236
    Top = 220
    object IBShopSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
      Origin = 'LIST_SHOP.SHOP_ID'
    end
    object IBShopSHOP_NAME: TIBStringField
      FieldName = 'SHOP_NAME'
      Origin = 'LIST_SHOP.SHOP_NAME'
      Size = 32
    end
    object IBShopSHOP_LAST: TDateTimeField
      FieldName = 'SHOP_LAST'
      Origin = 'LIST_SHOP.SHOP_LAST'
    end
    object IBShopSHOP_OFFICE: TIBStringField
      FieldName = 'SHOP_OFFICE'
      Origin = 'LIST_SHOP.SHOP_OFFICE'
      FixedChar = True
      Size = 1
    end
    object IBShopSHOP_PREFIX: TIBStringField
      FieldName = 'SHOP_PREFIX'
      Origin = 'LIST_SHOP.SHOP_PREFIX'
      Size = 32
    end
    object IBShopSHOP_POSTFIX: TIBStringField
      FieldName = 'SHOP_POSTFIX'
      Origin = 'LIST_SHOP.SHOP_POSTFIX'
      Size = 32
    end
    object IBShopSHOP_COLOR: TIntegerField
      FieldName = 'SHOP_COLOR'
      Origin = 'LIST_SHOP.SHOP_COLOR'
    end
    object IBShopSHOP_TM: TDateTimeField
      FieldName = 'SHOP_TM'
      Origin = 'LIST_SHOP.SHOP_TM'
    end
    object IBShopSHOP_VISIBLE: TIBStringField
      FieldName = 'SHOP_VISIBLE'
      Origin = 'LIST_SHOP.SHOP_VISIBLE'
      FixedChar = True
      Size = 1
    end
  end
  object SHOPTrans: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 268
    Top = 316
  end
  object DataSource1: TDataSource
    DataSet = IBShop
    Left = 180
    Top = 260
  end
  object DsFrm: TDataSource
    DataSet = QryFrm
    Left = 360
    Top = 93
  end
  object QryFrm: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = FrmTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select kln.kln_id,  (select kln_data.kln_short from kln_data(kln' +
        '.kln_id)) FRM_NAME'
      ' from kln'
      'where kln.kln_frm >0')
    Left = 364
    Top = 140
  end
  object FrmTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 368
    Top = 192
  end
end
