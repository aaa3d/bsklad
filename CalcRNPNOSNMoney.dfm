object CalcRNPN_OSN_Money: TCalcRNPN_OSN_Money
  Left = 225
  Top = 226
  Width = 949
  Height = 702
  Caption = '–асчет стоимости товаров при продаже дополнительной фирме'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 941
    Height = 41
    Align = alTop
    TabOrder = 1
    object Button1: TButton
      Left = 12
      Top = 4
      Width = 75
      Height = 25
      Caption = '–ассчитать'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 941
    Height = 627
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'RNS_TD_ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PNS_TD_ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEB'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ROZN'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONEY'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERCENT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_KOL'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MET'
        Visible = True
      end>
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 240
    Top = 286
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CALC_RN_PN_MONEY')
    Left = 378
    Top = 260
    object QueryWorkRNS_TD_ID: TIntegerField
      FieldName = 'RNS_TD_ID'
      Origin = 'CALC_RN_PN_MONEY.RNS_TD_ID'
    end
    object QueryWorkPNS_TD_ID: TIntegerField
      FieldName = 'PNS_TD_ID'
      Origin = 'CALC_RN_PN_MONEY.PNS_TD_ID'
    end
    object QueryWorkSEB: TFloatField
      FieldName = 'SEB'
      Origin = 'CALC_RN_PN_MONEY.SEB'
    end
    object QueryWorkROZN: TFloatField
      FieldName = 'ROZN'
      Origin = 'CALC_RN_PN_MONEY.ROZN'
    end
    object QueryWorkMONEY: TFloatField
      FieldName = 'MONEY'
      Origin = 'CALC_RN_PN_MONEY.MONEY'
    end
    object QueryWorkPERCENT: TFloatField
      FieldName = 'PERCENT'
      Origin = 'CALC_RN_PN_MONEY.PERCENT'
    end
    object QueryWorkTW_ID: TIntegerField
      FieldName = 'TW_ID'
      Origin = 'CALC_RN_PN_MONEY.TW_ID'
    end
    object QueryWorkTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      Origin = 'CALC_RN_PN_MONEY.TW_KOL'
    end
    object QueryWorkMET: TIBStringField
      FieldName = 'MET'
      Origin = 'CALC_RN_PN_MONEY.MET'
      Size = 65
    end
  end
  object DataSource1: TDataSource
    DataSet = QueryWork
    Left = 448
    Top = 252
  end
end
