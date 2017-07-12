object DOC_PO_WOZW: TDOC_PO_WOZW
  Left = 391
  Top = 494
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Документ. Возврат Предоплаты'
  ClientHeight = 179
  ClientWidth = 554
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 40
    Width = 40
    Height = 13
    Caption = 'Номер :'
  end
  object Label2: TLabel
    Left = 206
    Top = 40
    Width = 32
    Height = 13
    Caption = 'Дата :'
  end
  object Label3: TLabel
    Left = 370
    Top = 40
    Width = 40
    Height = 13
    Caption = 'Сумма :'
  end
  object Label4: TLabel
    Left = 10
    Top = 90
    Width = 62
    Height = 13
    Caption = 'Основание :'
  end
  object Label5: TLabel
    Left = 30
    Top = 62
    Width = 42
    Height = 13
    Caption = 'Клиент :'
  end
  object Label6: TLabel
    Left = 24
    Top = 112
    Width = 48
    Height = 13
    Caption = 'Остаток :'
  end
  object Label7: TLabel
    Left = 8
    Top = 136
    Width = 63
    Height = 13
    Caption = 'Возврат по :'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 554
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
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
    object ToolButton3: TToolButton
      Left = 50
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 39
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 58
      Top = 2
      Action = ActKKM
    end
    object ToolButton5: TToolButton
      Left = 83
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 46
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 91
      Top = 2
      Action = ActHistory
    end
    object ToolButton7: TToolButton
      Left = 116
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 124
      Top = 2
      Action = ActSelect
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 160
    Width = 554
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object PO_NUM: TEdit
    Left = 76
    Top = 36
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 2
    Text = 'PO_NUM'
    OnChange = PO_NUMChange
  end
  object PO_DATE: TDateEdit
    Left = 240
    Top = 36
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 3
    OnAcceptDate = PO_DATEAcceptDate
  end
  object PO_SUMM: TRxCalcEdit
    Left = 414
    Top = 36
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00##'
    MaxValue = 1000000
    MinValue = 0.01
    NumGlyphs = 2
    TabOrder = 4
    Value = 0.01
    OnChange = PO_NUMChange
  end
  object PO_OSN: TEdit
    Left = 76
    Top = 84
    Width = 459
    Height = 21
    TabOrder = 5
    Text = 'PO_OSN'
    OnChange = PO_NUMChange
  end
  object KLN_NAME: TEdit
    Left = 76
    Top = 60
    Width = 459
    Height = 21
    Enabled = False
    TabOrder = 6
    Text = 'KLN_NAME'
  end
  object PO_OST: TRxCalcEdit
    Left = 76
    Top = 108
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00##'
    Enabled = False
    NumGlyphs = 2
    TabOrder = 7
  end
  object PO: TEdit
    Left = 76
    Top = 132
    Width = 459
    Height = 21
    Enabled = False
    TabOrder = 8
    Text = 'не указан'
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 432
    Top = 88
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
    object ActKKM: TAction
      Caption = 'Печать чека на ККМ'
      Hint = 'Печать чека на ККМ'
      ImageIndex = 45
      ShortCut = 118
      OnExecute = ActKKMExecute
    end
    object ActHistory: TAction
      Caption = 'История документа...'
      Hint = 'История документа...'
      ImageIndex = 3
      ShortCut = 123
      OnExecute = ActHistoryExecute
    end
    object ActSelect: TAction
      Caption = 'Выбрать предоплату для возврата...'
      Hint = 'Выбрать предоплату для возврата...'
      ImageIndex = 16
      OnExecute = ActSelectExecute
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    OnIdleTimer = PO_NUMChange
    Left = 352
    Top = 88
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 220
    Top = 80
  end
  object QueryWork2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 288
    Top = 82
  end
end
