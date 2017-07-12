object Edit_USL: TEdit_USL
  Left = 219
  Top = 258
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Услуга'
  ClientHeight = 132
  ClientWidth = 445
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
    Left = 10
    Top = 38
    Width = 82
    Height = 13
    Caption = 'Наименование :'
  end
  object Label2: TLabel
    Left = 30
    Top = 60
    Width = 61
    Height = 13
    Caption = 'Счет дебет :'
  end
  object Label3: TLabel
    Left = 26
    Top = 84
    Width = 67
    Height = 13
    Caption = 'Счет кредит :'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 445
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = Action1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 113
    Width = 445
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object NAME: TEdit
    Left = 96
    Top = 34
    Width = 339
    Height = 21
    MaxLength = 252
    TabOrder = 2
    OnChange = NAMEChange
  end
  object DEB: TEdit
    Left = 96
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 3
    OnChange = NAMEChange
  end
  object CRED: TEdit
    Left = 96
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 4
    OnChange = NAMEChange
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 168
    Top = 56
    object Action1: TAction
      Caption = 'Сохранить...'
      Hint = 'Сохранить...'
      ImageIndex = 39
      ShortCut = 16397
      OnExecute = Action1Execute
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 274
    Top = 64
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 360
    Top = 66
  end
end
