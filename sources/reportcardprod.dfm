object report_card_prod: Treport_card_prod
  Left = 466
  Top = 226
  Width = 434
  Height = 152
  Caption = 'Отчет по продажам по дисконтным картам - реферралам'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 260
    Top = 12
    Width = 18
    Height = 13
    Caption = 'по :'
  end
  object Label4: TLabel
    Left = 8
    Top = 12
    Width = 125
    Height = 13
    Caption = 'Расходные за период с :'
  end
  object Button1: TButton
    Left = 300
    Top = 54
    Width = 101
    Height = 25
    Caption = 'Построить'
    TabOrder = 0
    OnClick = Button1Click
  end
  object RDT2: TDateEdit
    Left = 280
    Top = 8
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
  end
  object RDT1: TDateEdit
    Left = 136
    Top = 8
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 40
    Width = 97
    Height = 17
    Caption = 'Группировать'
    TabOrder = 3
  end
  object QueryReport: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ReportTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from REPORT_CARD_SALES(:rdt1, :rdt2,:do_group)')
    Left = 30
    Top = 64
    ParamData = <
      item
        DataType = ftDate
        Name = 'rdt1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'rdt2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'do_group'
        ParamType = ptUnknown
      end>
  end
  object ReportTransaction: TIBTransaction
    Active = True
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 94
    Top = 64
  end
end
