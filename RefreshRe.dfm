object REFRESH_RE: TREFRESH_RE
  Left = 373
  Top = 351
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Закрытие периода'
  ClientHeight = 241
  ClientWidth = 362
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
  object Label1: TLabel
    Left = 6
    Top = 8
    Width = 67
    Height = 13
    Caption = 'За период с :'
  end
  object Label2: TLabel
    Left = 4
    Top = 104
    Width = 75
    Height = 26
    Alignment = taRightJustify
    Caption = 'Только товар: '#13#10'(Код)'
  end
  object dt1: TDateEdit
    Left = 78
    Top = 6
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 0
  end
  object Button1: TButton
    Left = 206
    Top = 6
    Width = 111
    Height = 25
    Caption = 'Перерасчитать'
    TabOrder = 1
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 4
    Top = 40
    Width = 137
    Height = 17
    Caption = 'Удалять реестр'
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 84
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object CheckBox2: TCheckBox
    Left = 4
    Top = 76
    Width = 257
    Height = 17
    Caption = 'Cоздать сводные накладные'
    TabOrder = 4
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 92
    Top = 110
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 38
    Top = 144
  end
end
