object report_prod: Treport_prod
  Left = 404
  Top = 246
  Width = 512
  Height = 235
  Caption = 'Отчет по реализации'
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
  object Label10: TLabel
    Left = 90
    Top = 14
    Width = 43
    Height = 13
    Caption = 'Фирма :'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 44
    Width = 126
    Height = 13
    Caption = 'Приходные за период с :'
  end
  object Label6: TLabel
    Left = 10
    Top = 108
    Width = 122
    Height = 13
    Caption = 'Приходные накладные :'
  end
  object Label2: TLabel
    Left = 260
    Top = 44
    Width = 18
    Height = 13
    Caption = 'по :'
  end
  object Label3: TLabel
    Left = 260
    Top = 76
    Width = 18
    Height = 13
    Caption = 'по :'
  end
  object Label4: TLabel
    Left = 8
    Top = 76
    Width = 125
    Height = 13
    Caption = 'Расходные за период с :'
  end
  object Label5: TLabel
    Left = 10
    Top = 140
    Width = 121
    Height = 13
    Caption = 'Расходные накладные :'
  end
  object FRM: TRxDBLookupCombo
    Left = 136
    Top = 10
    Width = 265
    Height = 20
    DropDownCount = 8
    EscapeClear = False
    LookupField = 'KLN_ID'
    LookupDisplay = 'KLN_FULL'
    LookupSource = DataModule1.MainDsAllFrm
    TabOrder = 0
  end
  object PDT1: TDateEdit
    Left = 136
    Top = 40
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
  end
  object PDT2: TDateEdit
    Left = 280
    Top = 40
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 136
    Top = 104
    Width = 329
    Height = 21
    TabOrder = 3
    Text = 'Edit1'
  end
  object BitBtn1: TBitBtn
    Left = 471
    Top = 104
    Width = 25
    Height = 21
    Hint = 'Выбрать из списка'
    TabOrder = 4
    OnClick = BitBtn1Click
    Glyph.Data = {
      42010000424D4201000000000000760000002800000011000000110000000100
      040000000000CC00000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777700000007777777777777777700000007777747474747477700000007777
      7477777777777000000077774447777774777000000077777477777777777000
      00007777777777777477700000007770000007700000000000007000FBFB0000
      FBFB0000000070F0000000F000000000000070FFFFF070FFFFF07000000070F8
      88F070F888F07000000070FFFFF070FFFFF07000000070F888F070F888F07000
      000070FFFFF070FFFFF070000000700000007000000070000000777777777777
      777770000000}
  end
  object Button1: TButton
    Left = 364
    Top = 166
    Width = 101
    Height = 25
    Caption = 'Построить'
    TabOrder = 5
    OnClick = Button1Click
  end
  object RDT2: TDateEdit
    Left = 280
    Top = 72
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 6
  end
  object RDT1: TDateEdit
    Left = 136
    Top = 72
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 7
  end
  object Edit2: TEdit
    Left = 136
    Top = 136
    Width = 329
    Height = 21
    TabOrder = 8
    Text = 'Edit2'
  end
  object BitBtn2: TBitBtn
    Left = 471
    Top = 136
    Width = 25
    Height = 21
    Hint = 'Выбрать из списка'
    TabOrder = 9
    OnClick = BitBtn2Click
    Glyph.Data = {
      42010000424D4201000000000000760000002800000011000000110000000100
      040000000000CC00000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777700000007777777777777777700000007777747474747477700000007777
      7477777777777000000077774447777774777000000077777477777777777000
      00007777777777777477700000007770000007700000000000007000FBFB0000
      FBFB0000000070F0000000F000000000000070FFFFF070FFFFF07000000070F8
      88F070F888F07000000070FFFFF070FFFFF07000000070F888F070F888F07000
      000070FFFFF070FFFFF070000000700000007000000070000000777777777777
      777770000000}
  end
  object Button2: TButton
    Left = 247
    Top = 166
    Width = 101
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 10
    OnClick = Button2Click
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 126
    Top = 208
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 46
    Top = 208
  end
  object DualListDialog1: TDualListDialog
    Sorted = False
    Label1Caption = '&Типы накладных'
    Label2Caption = '&Типы для расчёта'
    HelpContext = 0
    Left = 206
    Top = 208
  end
  object DualListDialog2: TDualListDialog
    Sorted = False
    Label1Caption = '&Типы накладных'
    Label2Caption = '&Типы для расчёта'
    HelpContext = 0
    Left = 206
    Top = 288
  end
  object QueryReport: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ReportTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from report_prod(:frm, :pdt1, :pdt2, :rdt1, :rdt2, :typ' +
        '_pn, :typ_rn)')
    Left = 126
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'frm'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pdt1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pdt2'
        ParamType = ptUnknown
      end
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
        DataType = ftInteger
        Name = 'typ_pn'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'typ_rn'
        ParamType = ptUnknown
      end>
  end
  object ReportTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 46
    Top = 288
  end
end
