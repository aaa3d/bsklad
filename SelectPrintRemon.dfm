object Select_Print_Remon: TSelect_Print_Remon
  Left = 58
  Top = 136
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Выбор печати акта переоценки'
  ClientHeight = 61
  ClientWidth = 548
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 95
    Height = 13
    Caption = 'Печать по складу :'
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 40
    Width = 261
    Height = 17
    Caption = 'Включать товары, имеющие нулевой остаток '
    TabOrder = 0
  end
  object Button1: TButton
    Left = 348
    Top = 4
    Width = 101
    Height = 25
    Caption = 'Печать акта'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 452
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 2
    OnClick = Button2Click
  end
  object SKL: TRxDBLookupCombo
    Left = 108
    Top = 4
    Width = 229
    Height = 21
    DropDownCount = 8
    LookupField = 'SKL_ID'
    LookupDisplay = 'SKL_FULL'
    LookupSource = DsSKL
    TabOrder = 3
  end
  object Button3: TButton
    Left = 348
    Top = 32
    Width = 101
    Height = 25
    Caption = 'Печать ценников'
    TabOrder = 4
    OnClick = Button3Click
  end
  object SKLTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 64
    Top = 12
  end
  object QuerySKL: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SKLTransaction
    CachedUpdates = False
    SQL.Strings = (
      'select skl_full,skl_id from skl'
      'where skl_speed>0 order by skl_speed')
    Left = 132
    Top = 12
  end
  object DsSKL: TDataSource
    DataSet = QuerySKL
    Left = 196
    Top = 12
  end
end
