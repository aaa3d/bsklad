object EDIT_LINKNOTABLE: TEDIT_LINKNOTABLE
  Left = 56
  Top = 148
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Таблица, исключенная из синхронизации'
  ClientHeight = 186
  ClientWidth = 518
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
    Left = 8
    Top = 40
    Width = 74
    Height = 13
    Caption = 'Имя таблицы :'
  end
  object Label2: TLabel
    Left = 12
    Top = 60
    Width = 69
    Height = 13
    Caption = 'Примечания :'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 518
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Hint = 'Сохранить'
      Caption = 'ToolButton1'
      ImageIndex = 39
      OnClick = ToolButton1Click
    end
  end
  object NAME: TEdit
    Left = 86
    Top = 36
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object PRIM: TMemo
    Left = 86
    Top = 58
    Width = 427
    Height = 123
    TabOrder = 2
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 342
    Top = 86
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 272
    Top = 84
  end
end
