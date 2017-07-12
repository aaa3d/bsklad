object EDIT_DOL: TEDIT_DOL
  Left = 131
  Top = 141
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsSingle
  Caption = 'Зарплата. Штатная единица'
  ClientHeight = 91
  ClientWidth = 567
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
    Left = 6
    Top = 40
    Width = 140
    Height = 13
    Caption = 'Наименование должности :'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 567
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    EdgeBorders = [ebTop, ebBottom]
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
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 72
    Width = 567
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object DOL_NAME: TEdit
    Left = 152
    Top = 36
    Width = 403
    Height = 21
    MaxLength = 64
    TabOrder = 2
    Text = 'DOL_NAME'
    OnChange = DOL_NAMEChange
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 244
    Top = 24
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 316
    Top = 24
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 426
    Top = 18
    object ActSave: TAction
      Caption = 'Сохранить...'
      Hint = 'Сохранить...'
      ImageIndex = 39
      ShortCut = 16397
      OnExecute = ActSaveExecute
    end
    object ActApply: TAction
      Caption = 'Применить...'
      Hint = 'Применить...'
      ImageIndex = 38
      ShortCut = 16467
      OnExecute = ActApplyExecute
    end
  end
end
