object FRegister: TFRegister
  Left = 650
  Top = 242
  Width = 548
  Height = 365
  Caption = 'Регистрация пластиковой карты'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 66
    Top = 52
    Width = 88
    Height = 16
    Caption = 'Номер карты:'
  end
  object Label13: TLabel
    Left = 16
    Top = 260
    Width = 145
    Height = 16
    Caption = 'Кто зарегистрировал:'
  end
  object Label12: TLabel
    Left = 36
    Top = 81
    Width = 122
    Height = 16
    Caption = 'Дата регистрации:'
  end
  object Label9: TLabel
    Left = 92
    Top = 167
    Width = 65
    Height = 32
    Caption = 'Описание'#13#10'   скидок:'
  end
  object Label8: TLabel
    Left = 105
    Top = 140
    Width = 50
    Height = 16
    Caption = 'Скидки:'
  end
  object Label10: TLabel
    Left = 41
    Top = 231
    Width = 118
    Height = 16
    Caption = 'Текущий процент:'
  end
  object Label5: TLabel
    Left = 73
    Top = 111
    Width = 82
    Height = 16
    Caption = 'Сумма плюс:'
  end
  object CARD_NUM: TEdit
    Left = 158
    Top = 47
    Width = 148
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'CARD_NUM'
  end
  object REG_USER_FULL: TEdit
    Left = 158
    Top = 255
    Width = 326
    Height = 21
    Enabled = False
    TabOrder = 6
    Text = 'REG_USER_FULL'
  end
  object REG_DATE: TDateEdit
    Left = 158
    Top = 76
    Width = 148
    Height = 26
    Enabled = False
    ButtonWidth = 26
    NumGlyphs = 2
    TabOrder = 1
  end
  object SKID_OPIS: TMemo
    Left = 158
    Top = 164
    Width = 326
    Height = 60
    Enabled = False
    Lines.Strings = (
      'Описание скидки '
      'в две строки')
    TabOrder = 4
  end
  object CARD_SKID: TEdit
    Left = 158
    Top = 135
    Width = 324
    Height = 21
    Enabled = False
    TabOrder = 3
    Text = 'CARD_SKID'
    OnChange = CARD_SKIDChange
  end
  object SKID_PERCENT: TRxCalcEdit
    Left = 158
    Top = 226
    Width = 109
    Height = 26
    AutoSize = False
    DecimalPlaces = 5
    DisplayFormat = ',#0.00000%'
    Enabled = False
    ButtonWidth = 0
    NumGlyphs = 2
    TabOrder = 5
  end
  object CARD_ADDSUMM: TRxCalcEdit
    Left = 158
    Top = 106
    Width = 148
    Height = 26
    AutoSize = False
    DisplayFormat = ',#0.00 руб'
    ButtonWidth = 25
    NumGlyphs = 2
    TabOrder = 2
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 314
    Width = 540
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 540
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
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
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 33
      Top = 2
      Action = ActRegisterCard
    end
    object ToolButton3: TToolButton
      Left = 58
      Top = 2
      Action = ActRegAndDelivery
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 28
    Top = 116
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 284
    Top = 44
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 260
    Top = 100
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 248
    Top = 10
    object ActRegAndDelivery: TAction
      Caption = 'Зарегистрировать и выдать карту'
      Hint = 'Зарегистрировать и выдать карту'
      ImageIndex = 21
      ShortCut = 49165
      OnExecute = ActRegAndDeliveryExecute
    end
    object ActRegisterCard: TAction
      Caption = 'Зарегистрировать карту'
      Hint = 'Зарегистрировать карту'
      ImageIndex = 22
      ShortCut = 16397
      OnExecute = ActRegisterCardExecute
    end
  end
end
