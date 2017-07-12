object EXP_1C_REPORTS: TEXP_1C_REPORTS
  Left = 115
  Top = 168
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Справки по выгрузке в 1С'
  ClientHeight = 389
  ClientWidth = 737
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 737
    Height = 107
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object Label3: TLabel
      Left = 32
      Top = 8
      Width = 43
      Height = 13
      Caption = 'Фирма :'
    end
    object Label1: TLabel
      Left = 6
      Top = 30
      Width = 67
      Height = 13
      Caption = 'За период с :'
    end
    object Label2: TLabel
      Left = 202
      Top = 32
      Width = 18
      Height = 13
      Caption = 'по :'
    end
    object Label4: TLabel
      Left = 38
      Top = 54
      Width = 35
      Height = 13
      Caption = 'Отчет :'
    end
    object FRM: TRxDBLookupCombo
      Left = 76
      Top = 4
      Width = 269
      Height = 21
      DropDownCount = 8
      LookupField = 'FRM_ID'
      LookupDisplay = 'FRM_FULL'
      LookupSource = DsPnDicFrm
      TabOrder = 0
    end
    object DT1: TDateEdit
      Left = 76
      Top = 28
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object DT2: TDateEdit
      Left = 226
      Top = 26
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
    end
    object REP: TComboBox
      Left = 76
      Top = 50
      Width = 639
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Text = 'REP'
      Items.Strings = (
        
          'Сумма "Административных" накладных расходов по счетам-фактурам п' +
          'о контрагентам ИТОГО'
        
          'Сумма "Хозяйственных" накладных расходов по счетам-фактурам по к' +
          'онтрагентам ИТОГО'
        
          'Сумма "Административных" накладных расходов по ав.отчетам по сот' +
          'рудникам ИТОГО'
        
          'Сумма "Хозяйственных" накладных расходов по ав.отчетам по сотруд' +
          'никам ИТОГО'
        
          'Сумма "Административных" накладных расходов по счетам-фактурам п' +
          'о контрагентам ПО НАКЛАДНЫМ'
        
          'Сумма "Хозяйственных" накладных расходов по счетам-фактурам по к' +
          'онтрагентам ПО НАКЛАДНЫМ'
        
          'Сумма "Административных" накладных расходов по ав.отчетам по сот' +
          'рудникам ПО НАКЛАДНЫМ'
        
          'Сумма "Хозяйственных" накладных расходов по ав.отчетам по сотруд' +
          'никам ПО НАКЛАДНЫМ'
        ''
        ''
        '')
    end
    object Button1: TButton
      Left = 78
      Top = 76
      Width = 75
      Height = 25
      Caption = 'Построить'
      TabOrder = 4
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 156
      Top = 76
      Width = 75
      Height = 25
      Caption = 'Закрыть'
      TabOrder = 5
      OnClick = Button2Click
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 107
    Width = 737
    Height = 282
    Align = alClient
    DataSource = DsRep
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object RepTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 428
    Top = 188
  end
  object QueryRep: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = RepTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 428
    Top = 240
  end
  object DsRep: TDataSource
    DataSet = QueryRep
    Left = 428
    Top = 296
  end
  object PnDicFrm: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PnDicFrmTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from pn_dic_frm(:FRM_ID)')
    Left = 292
    Top = 207
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FRM_ID'
        ParamType = ptUnknown
      end>
    object PnDicFrmFRM_ID: TIntegerField
      FieldName = 'FRM_ID'
      Origin = 'PN_DIC_FRM.FRM_ID'
    end
    object PnDicFrmFRM_FULL: TIBStringField
      FieldName = 'FRM_FULL'
      Origin = 'PN_DIC_FRM.FRM_FULL'
      Size = 5000
    end
    object PnDicFrmFRM_REKW: TIBStringField
      FieldName = 'FRM_REKW'
      Origin = 'PN_DIC_FRM.FRM_REKW'
      Size = 5000
    end
  end
  object DsPnDicFrm: TDataSource
    DataSet = PnDicFrm
    Left = 214
    Top = 151
  end
  object PnDicFrmTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 200
    Top = 201
  end
end
