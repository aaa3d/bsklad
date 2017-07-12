object StFakt_Error: TStFakt_Error
  Left = 73
  Top = 113
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Анализ ошибок при оформлении счета-фактуры'
  ClientHeight = 404
  ClientWidth = 489
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
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 8
    Width = 88
    Height = 13
    Caption = 'Счёт-фактура № :'
  end
  object STFAKT_NUM: TEdit
    Left = 96
    Top = 4
    Width = 313
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'STFAKT_NUM'
  end
  object Button1: TButton
    Left = 412
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 0
    Top = 34
    Width = 489
    Height = 370
    Align = alBottom
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    TabOrder = 2
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 272
    Top = 104
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 272
    Top = 156
  end
end
