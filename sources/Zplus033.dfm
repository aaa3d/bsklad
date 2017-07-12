object ZPLUS_033: TZPLUS_033
  Left = 159
  Top = 152
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 
    '033. Сумма остатков товаров одного менеджера на всех складах, за' +
    'купленных за период'
  ClientHeight = 320
  ClientWidth = 631
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
  object Label2: TLabel
    Left = 60
    Top = 280
    Width = 62
    Height = 13
    Caption = 'Основание :'
  end
  object Label1: TLabel
    Left = 10
    Top = 212
    Width = 110
    Height = 13
    Caption = 'Менеджер владелец :'
  end
  object Label3: TLabel
    Left = 24
    Top = 256
    Width = 96
    Height = 13
    Caption = 'Для расчета взять'
  end
  object Label4: TLabel
    Left = 222
    Top = 256
    Width = 54
    Height = 13
    Caption = 'от остатка'
  end
  object Label5: TLabel
    Left = 60
    Top = 234
    Width = 62
    Height = 13
    Caption = 'Закуплены :'
  end
  object Label_Mes1: TLabel
    Left = 354
    Top = 236
    Width = 20
    Height = 13
    Caption = 'мес'
  end
  object Label_Mes2: TLabel
    Left = 448
    Top = 236
    Width = 20
    Height = 13
    Caption = 'мес'
  end
  object Tabel: TCheckBox
    Left = 196
    Top = 54
    Width = 139
    Height = 17
    Caption = 'Использовать табель'
    Enabled = False
    TabOrder = 0
    OnClick = TabelClick
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 631
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
  object KTU: TCheckBox
    Left = 196
    Top = 76
    Width = 305
    Height = 17
    Caption = 'Использовать Коэффициет Трудового Участия (К.Т.У.)'
    Enabled = False
    TabOrder = 2
    OnClick = KTUClick
  end
  object VALUTA: TRadioGroup
    Left = 2
    Top = 122
    Width = 185
    Height = 77
    Caption = ' Валюта расчета'
    ItemIndex = 0
    Items.Strings = (
      'Российские рубли'
      'Доллары США')
    TabOrder = 3
    OnClick = VALUTAClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 301
    Width = 631
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object KOEFF: TRadioGroup
    Left = 2
    Top = 34
    Width = 185
    Height = 77
    Caption = ' Вид '
    ItemIndex = 0
    Items.Strings = (
      'Начисление'
      'Удержание')
    TabOrder = 5
    OnClick = KOEFFClick
  end
  object OSN: TEdit
    Left = 126
    Top = 276
    Width = 413
    Height = 21
    TabOrder = 6
    Text = 'OSN'
    OnChange = OSNChange
  end
  object SET1: TRxDBLookupCombo
    Left = 126
    Top = 208
    Width = 317
    Height = 21
    DropDownCount = 8
    LookupField = 'OWNER_ID'
    LookupDisplay = 'OWNER_NAME'
    LookupSource = DsOwner
    TabOrder = 7
    OnChange = SET1Change
  end
  object SET2: TRadioGroup
    Left = 200
    Top = 122
    Width = 185
    Height = 77
    Caption = ' Валюта товара'
    ItemIndex = 0
    Items.Strings = (
      'Российские рубли'
      'Доллары США')
    TabOrder = 8
    OnClick = SET2Click
  end
  object SET3: TRxCalcEdit
    Left = 126
    Top = 252
    Width = 91
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00%##'
    NumGlyphs = 2
    TabOrder = 9
  end
  object Mes: TComboBox
    Left = 126
    Top = 230
    Width = 155
    Height = 21
    ItemHeight = 13
    TabOrder = 10
    Text = 'Mes'
    OnChange = MesChange
    Items.Strings = (
      'за последние'
      'более'
      'от')
  end
  object Mes1: TRxSpinEdit
    Left = 284
    Top = 230
    Width = 67
    Height = 21
    Alignment = taRightJustify
    TabOrder = 11
    OnChange = Mes1Change
  end
  object Mes2: TRxSpinEdit
    Left = 376
    Top = 230
    Width = 67
    Height = 21
    Alignment = taRightJustify
    TabOrder = 12
    OnChange = Mes2Change
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 452
    Top = 46
    object ActApply: TAction
      Caption = 'Применить'
      Hint = 'Применить'
      ImageIndex = 38
      ShortCut = 16467
      OnExecute = ActApplyExecute
    end
    object ActSave: TAction
      Caption = 'Сохранить'
      Hint = 'Сохранить'
      ImageIndex = 39
      ShortCut = 16397
      OnExecute = ActSaveExecute
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 254
    Top = 2
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 254
    Top = 50
  end
  object DicTransaction: TIBTransaction
    Active = True
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 114
    Top = 10
  end
  object DicOwner: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DicTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from list_owner order by owner_name')
    Left = 116
    Top = 64
  end
  object DsOwner: TDataSource
    DataSet = DicOwner
    Left = 182
    Top = 62
  end
end
