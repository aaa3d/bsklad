object EDIT_EDK: TEDIT_EDK
  Left = 318
  Top = 212
  Width = 550
  Height = 175
  BorderIcons = [biSystemMenu]
  Caption = 'Другие единицы измерения'
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 4
    Width = 157
    Height = 13
    Caption = 'Базовые единицы измерения :'
  end
  object Label2: TLabel
    Left = 14
    Top = 38
    Width = 146
    Height = 13
    Caption = 'Новые единицы измерения :'
  end
  object Label3: TLabel
    Left = 16
    Top = 60
    Width = 145
    Height = 13
    Caption = 'Кол-во в базовых единицах :'
  end
  object Label4: TLabel
    Left = 102
    Top = 82
    Width = 61
    Height = 13
    Caption = 'Розн. цена :'
  end
  object Label5: TLabel
    Left = 110
    Top = 104
    Width = 53
    Height = 13
    Caption = 'Размеры :'
  end
  object Label6: TLabel
    Left = 106
    Top = 126
    Width = 56
    Height = 13
    Caption = 'Упаковка :'
  end
  object Bevel1: TBevel
    Left = 0
    Top = 26
    Width = 471
    Height = 19
    Shape = bsTopLine
  end
  object Edit1: TEdit
    Left = 166
    Top = 0
    Width = 235
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'Edit1'
  end
  object ED_ID: TRxDBLookupCombo
    Left = 166
    Top = 34
    Width = 101
    Height = 21
    DropDownCount = 8
    EscapeClear = False
    LookupField = 'ED_ID'
    LookupDisplay = 'ED_FULL'
    LookupSource = DsList
    TabOrder = 1
  end
  object EDK_KOL: TRxCalcEdit
    Left = 166
    Top = 56
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = ',0.0000##'
    NumGlyphs = 2
    TabOrder = 2
  end
  object TW_MONEY: TRxCalcEdit
    Left = 166
    Top = 78
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00 руб##'
    NumGlyphs = 2
    TabOrder = 3
  end
  object EDK_RAZM: TEdit
    Left = 166
    Top = 100
    Width = 373
    Height = 21
    MaxLength = 252
    TabOrder = 4
  end
  object EDK_UP: TEdit
    Left = 166
    Top = 122
    Width = 373
    Height = 21
    MaxLength = 252
    TabOrder = 5
  end
  object BtnOk: TButton
    Left = 466
    Top = 2
    Width = 75
    Height = 25
    Caption = 'Ок'
    TabOrder = 6
    OnClick = BtnOkClick
  end
  object Button2: TButton
    Left = 466
    Top = 28
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 7
    OnClick = Button2Click
  end
  object ListTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 358
    Top = 8
  end
  object QueryList: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ListTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from list_ed_for_edk(:tw_id,:edk_id)')
    Left = 290
    Top = 20
    ParamData = <
      item
        DataType = ftInteger
        Name = 'tw_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'edk_id'
        ParamType = ptInput
      end>
    object QueryListED_ID: TIntegerField
      FieldName = 'ED_ID'
    end
    object QueryListED_SHORT: TIBStringField
      FieldName = 'ED_SHORT'
      Size = 32
    end
    object QueryListED_FULL: TIBStringField
      FieldName = 'ED_FULL'
      Size = 254
    end
  end
  object DsList: TDataSource
    DataSet = QueryList
    Left = 420
    Top = 8
  end
end
