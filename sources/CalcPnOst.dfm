object Calc_PNOST: TCalc_PNOST
  Left = 476
  Top = 290
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Принудительный расчёт остатков на приходных накладных'
  ClientHeight = 180
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 4
    Width = 428
    Height = 13
    Caption = 
      'Внимание! Расчёт занимает значительное время и загружает сервер ' +
      'базы данных!'
  end
  object Label2: TLabel
    Left = 12
    Top = 124
    Width = 67
    Height = 13
    Caption = 'За период с :'
  end
  object Label3: TLabel
    Left = 344
    Top = 108
    Width = 86
    Height = 13
    Caption = 'Текущее время :'
  end
  object Label4: TLabel
    Left = 344
    Top = 128
    Width = 86
    Height = 13
    Caption = 'Начало расчёта :'
  end
  object Label_time: TLabel
    Left = 440
    Top = 128
    Width = 3
    Height = 13
  end
  object DT1: TDateEdit
    Left = 88
    Top = 120
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 0
  end
  object DT2: TDateEdit
    Left = 216
    Top = 120
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 12
    Top = 28
    Width = 433
    Height = 73
    Caption = ' Тип приходных накладных '
    TabOrder = 2
    object PN1: TRadioButton
      Left = 8
      Top = 20
      Width = 113
      Height = 17
      Caption = 'Все'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = PN2Click
    end
    object PN2: TRadioButton
      Left = 8
      Top = 44
      Width = 57
      Height = 17
      Caption = 'Один :'
      TabOrder = 1
      OnClick = PN2Click
    end
    object PNTYP: TRxDBLookupCombo
      Left = 64
      Top = 40
      Width = 361
      Height = 21
      DropDownCount = 8
      LookupField = 'PNTYP_ID'
      LookupDisplay = 'PNTYP_FULL'
      LookupSource = DsPNTYP
      TabOrder = 2
      Visible = False
    end
  end
  object BtnStartStop: TButton
    Left = 452
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Начать'
    TabOrder = 3
    OnClick = BtnStartStopClick
  end
  object BtnClose: TButton
    Left = 452
    Top = 60
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 4
    OnClick = BtnCloseClick
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 167
    Width = 533
    Height = 13
    Align = alBottom
    Min = 0
    Max = 100
    TabOrder = 5
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 148
    Width = 533
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object RxClock1: TRxClock
    Left = 436
    Top = 108
    Width = 53
    Height = 13
    BevelInner = bvNone
    BevelOuter = bvNone
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 152
    Top = 8
  end
  object PnTypTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 244
    Top = 8
  end
  object QrPNTYP: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PnTypTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PNTYP order by PNTYP_ID')
    Left = 320
    Top = 8
    object QrPNTYPPNTYP_ID: TIntegerField
      FieldName = 'PNTYP_ID'
      Required = True
    end
    object QrPNTYPPNTYP_SHORT: TIBStringField
      FieldName = 'PNTYP_SHORT'
      Required = True
      Size = 32
    end
    object QrPNTYPPNTYP_FULL: TIBStringField
      FieldName = 'PNTYP_FULL'
      Required = True
      Size = 254
    end
    object QrPNTYPNUM_TYP: TSmallintField
      FieldName = 'NUM_TYP'
      Required = True
    end
    object QrPNTYPPNTYP_CALC: TIntegerField
      FieldName = 'PNTYP_CALC'
      Required = True
    end
    object QrPNTYPPNTYP_POST_CALC: TIBStringField
      FieldName = 'PNTYP_POST_CALC'
      Required = True
      Size = 1
    end
  end
  object DsPNTYP: TDataSource
    DataSet = QrPNTYP
    Left = 388
    Top = 8
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 80
    Top = 8
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer1Timer
    Left = 208
    Top = 96
  end
end
