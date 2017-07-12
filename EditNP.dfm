object EDIT_NP: TEDIT_NP
  Left = 185
  Top = 181
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ставка НП'
  ClientHeight = 94
  ClientWidth = 206
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 14
    Top = 42
    Width = 58
    Height = 13
    Caption = 'Ставка НП:'
  end
  object Label2: TLabel
    Left = 32
    Top = 68
    Width = 42
    Height = 13
    Caption = 'На дату:'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 206
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton3: TToolButton
      Left = 0
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton3'
      ImageIndex = 110
      OnClick = ToolButton3Click
    end
    object ToolButton4: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 40
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 33
      Top = 2
      Action = ActSave
    end
    object ToolButton2: TToolButton
      Left = 58
      Top = 2
      Action = ActApply
    end
  end
  object NP: TRxCalcEdit
    Left = 78
    Top = 40
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = '#0.00 %'
    NumGlyphs = 2
    TabOrder = 1
    OnChange = NPChange
  end
  object NP_DATE: TDateEdit
    Left = 78
    Top = 66
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
    OnChange = NPChange
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 26
    Top = 42
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
    Left = 146
    Top = 48
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 84
    Top = 46
  end
end
