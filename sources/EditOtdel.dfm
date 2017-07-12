object EDIT_OTDEL: TEDIT_OTDEL
  Left = 290
  Top = 302
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Отдел'
  ClientHeight = 85
  ClientWidth = 482
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
    Left = 8
    Top = 40
    Width = 94
    Height = 13
    Caption = 'Название отдела :'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 482
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
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 66
    Width = 482
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object OTDEL_NAME: TEdit
    Left = 106
    Top = 38
    Width = 369
    Height = 21
    TabOrder = 2
    Text = 'OTDEL_NAME'
    OnChange = OTDEL_NAMEChange
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 242
    Top = 18
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
    Left = 312
    Top = 18
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 394
    Top = 18
  end
end
