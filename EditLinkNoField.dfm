object EDIT_LINKNOFIELD: TEDIT_LINKNOFIELD
  Left = 167
  Top = 193
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Поле, исключенное из синхронизации'
  ClientHeight = 344
  ClientWidth = 543
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
    Top = 38
    Width = 74
    Height = 13
    Caption = 'Имя таблицы :'
  end
  object Label2: TLabel
    Left = 28
    Top = 62
    Width = 55
    Height = 13
    Caption = 'Имя поля :'
  end
  object Label3: TLabel
    Left = 14
    Top = 84
    Width = 69
    Height = 13
    Caption = 'Примечания :'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 543
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object BtnSave: TToolButton
      Left = 0
      Top = 2
      Hint = 'Сохранить'
      Caption = 'BtnSave'
      ImageIndex = 39
      OnClick = BtnSaveClick
    end
  end
  object TABLE_NAME: TEdit
    Left = 86
    Top = 34
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object TABLE_FIELD: TEdit
    Left = 86
    Top = 58
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object PRIM: TMemo
    Left = 86
    Top = 82
    Width = 455
    Height = 259
    TabOrder = 3
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 272
    Top = 84
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 342
    Top = 86
  end
end
