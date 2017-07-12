object Edit_PERIOD: TEdit_PERIOD
  Left = 126
  Top = 143
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Смена даты закрытия перода'
  ClientHeight = 143
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 40
    Width = 68
    Height = 13
    Caption = 'Вид доступа :'
  end
  object Label2: TLabel
    Left = 4
    Top = 64
    Width = 77
    Height = 13
    Caption = 'Текущая дата :'
  end
  object Label3: TLabel
    Left = 16
    Top = 88
    Width = 64
    Height = 13
    Caption = 'Новая дата :'
  end
  object Label4: TLabel
    Left = 28
    Top = 112
    Width = 49
    Height = 13
    Caption = 'Причина :'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 536
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object BtnSave: TToolButton
      Left = 0
      Top = 2
      Hint = 'Сохранить и выйти (Ctrl+Enter)'
      Caption = 'BtnSave'
      ImageIndex = 39
      OnClick = BtnSaveClick
    end
    object ToolButton1: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 40
      Style = tbsSeparator
    end
    object ToolButton2: TToolButton
      Left = 33
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton2'
      ImageIndex = 110
      OnClick = ToolButton2Click
    end
  end
  object USGROUP_NAME: TEdit
    Left = 88
    Top = 36
    Width = 445
    Height = 21
    Enabled = False
    TabOrder = 1
    Text = 'USGROUP_NAME'
  end
  object OLD_DATE: TDateEdit
    Left = 88
    Top = 60
    Width = 121
    Height = 21
    Enabled = False
    NumGlyphs = 2
    TabOrder = 2
  end
  object NEW_DATE: TDateEdit
    Left = 88
    Top = 84
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 3
  end
  object WHI: TEdit
    Left = 88
    Top = 108
    Width = 445
    Height = 21
    TabOrder = 4
  end
  object PopupMenu1: TPopupMenu
    Left = 236
    Top = 64
    object MnSave: TMenuItem
      Caption = 'Сохранить и выйти'
      ShortCut = 16397
      OnClick = BtnSaveClick
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 340
    Top = 64
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 424
    Top = 64
  end
end
