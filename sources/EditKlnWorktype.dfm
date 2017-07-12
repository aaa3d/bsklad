object EDIT_KLNWORKTYPE: TEDIT_KLNWORKTYPE
  Left = 259
  Top = 233
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Вид деятельности'
  ClientHeight = 94
  ClientWidth = 327
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
    Left = 6
    Top = 44
    Width = 95
    Height = 13
    Caption = 'Вид деятельности:'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 327
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
  object KLN_WORKTYPE: TEdit
    Left = 112
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'KLN_WORKTYPE'
    OnChange = KLN_WORKTYPEChange
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 186
    Top = 66
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
    Left = 306
    Top = 72
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 244
    Top = 70
  end
end
