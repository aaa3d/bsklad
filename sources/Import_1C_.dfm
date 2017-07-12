object IMP_1C: TIMP_1C
  Left = 355
  Top = 265
  BorderStyle = bsDialog
  Caption = 'Импорт данных из 1С'
  ClientHeight = 92
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 18
    Top = 8
    Width = 30
    Height = 13
    Caption = 'Путь :'
  end
  object PathFile: TEdit
    Left = 66
    Top = 4
    Width = 279
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'c:\---\test.txt'
  end
  object Button1: TButton
    Left = 270
    Top = 38
    Width = 75
    Height = 25
    Caption = 'Загрузить'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 22
    Top = 38
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 2
    OnClick = Button2Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 73
    Width = 381
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 120
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 28
    Top = 80
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 88
    Top = 80
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 144
    Top = 80
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 192
    Top = 80
  end
end
