object MAIN_FORM: TMAIN_FORM
  Left = 84
  Top = 102
  BorderStyle = bsNone
  Caption = 'MAIN_FORM'
  ClientHeight = 827
  ClientWidth = 1083
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 0
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGradientActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object label_clock: TLabel
    Left = 556
    Top = 8
    Width = 9
    Height = 37
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clScrollBar
    Font.Height = -33
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 0
    Top = 16
    Width = 217
    Height = 20
    Caption = #1054#1090#1087#1088#1072#1074#1083#1077#1085#1099' '#1074' '#1085#1072#1073#1086#1088
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 220
    Top = 16
    Width = 213
    Height = 20
    Caption = #1055#1088#1080#1085#1103#1090#1099' '#1074' '#1085#1072#1073#1086#1088
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4227327
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 436
    Top = 16
    Width = 217
    Height = 20
    Caption = #1043#1086#1090#1086#1074#1099' '#1082' '#1086#1090#1075#1088#1091#1079#1082#1077' '#1082#1083#1080#1077#1085#1090#1091
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 96
    Width = 585
    Height = 597
    TabOrder = 4
    ControlData = {
      4C000000763C0000B43D00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object StringGrid1: TStringGrid
    Left = 672
    Top = 672
    Width = 353
    Height = 145
    BorderStyle = bsNone
    ColCount = 3
    DefaultColWidth = 300
    DefaultRowHeight = 68
    DefaultDrawing = False
    Enabled = False
    FixedCols = 0
    RowCount = 10
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLineWidth = 0
    Options = []
    ParentColor = True
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 2
    OnDrawCell = StringGrid1DrawCell
  end
  object Button1: TButton
    Left = 20
    Top = 672
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 84
    Top = 696
    Width = 75
    Height = 25
    Caption = 'connect'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Panel1: TPanel
    Left = 608
    Top = 44
    Width = 433
    Height = 221
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 3
    object WindowsMediaPlayer1: TWindowsMediaPlayer
      Left = 0
      Top = 0
      Width = 433
      Height = 221
      Align = alClient
      TabOrder = 0
      ControlData = {
        000300000800000000000500000000000000F03F030000000000050000000000
        0000000008000200000000000300010000000B00FFFF0300000000000B00FFFF
        08000200000000000300320000000B00000008000A000000660075006C006C00
        00000B0000000B0000000B00FFFF0B00FFFF0B00000008000200000000000800
        020000000000080002000000000008000200000000000B000000C02C0000D716
        0000}
    end
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = '192.168.0.1:bsklad2009'
    Params.Strings = (
      'user_name=beginner'
      'password=mayby'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 500
    Top = 104
  end
  object db_connect_timer: TTimer
    Interval = 60000
    OnTimer = db_connect_timerTimer
    Left = 344
    Top = 472
  end
  object timer_refresh: TTimer
    Interval = 5000
    OnTimer = timer_refreshTimer
    Left = 436
    Top = 468
  end
  object timer_1_sec: TTimer
    OnTimer = timer_1_secTimer
    Left = 428
    Top = 732
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 500
    Top = 164
  end
  object IBTransaction1: TIBTransaction
    Active = False
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 500
    Top = 216
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from list_doc_informer(:dt1, :dt2, 6, :shop_id)'
      'order by tm0 desc')
    Left = 556
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dt1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'shop_id'
        ParamType = ptUnknown
      end>
    object IBQuery2INFORMER_DATA_ID: TIntegerField
      FieldName = 'INFORMER_DATA_ID'
      Origin = 'LIST_DOC_INFORMER.INFORMER_DATA_ID'
    end
    object IBQuery2DOC_TEXT: TIBStringField
      FieldName = 'DOC_TEXT'
      Origin = 'LIST_DOC_INFORMER.DOC_TEXT'
      Size = 254
    end
    object IBQuery2TM0: TDateTimeField
      FieldName = 'TM0'
      Origin = 'LIST_DOC_INFORMER.TM0'
    end
    object IBQuery2TM1: TDateTimeField
      FieldName = 'TM1'
      Origin = 'LIST_DOC_INFORMER.TM1'
    end
    object IBQuery2TM2: TDateTimeField
      FieldName = 'TM2'
      Origin = 'LIST_DOC_INFORMER.TM2'
    end
    object IBQuery2US_FIO0: TIBStringField
      FieldName = 'US_FIO0'
      Origin = 'LIST_DOC_INFORMER.US_FIO0'
      Size = 254
    end
    object IBQuery2US_FIO1: TIBStringField
      FieldName = 'US_FIO1'
      Origin = 'LIST_DOC_INFORMER.US_FIO1'
      Size = 254
    end
    object IBQuery2US_FIO2: TIBStringField
      FieldName = 'US_FIO2'
      Origin = 'LIST_DOC_INFORMER.US_FIO2'
      Size = 254
    end
    object IBQuery2DOC_STATUS: TIntegerField
      FieldName = 'DOC_STATUS'
      Origin = 'LIST_DOC_INFORMER.DOC_STATUS'
    end
    object IBQuery2DOC_STATUS_DESC: TIBStringField
      FieldName = 'DOC_STATUS_DESC'
      Origin = 'LIST_DOC_INFORMER.DOC_STATUS_DESC'
      Size = 32
    end
    object IBQuery2SKL_SHORT: TIBStringField
      FieldName = 'SKL_SHORT'
      Origin = 'LIST_DOC_INFORMER.SKL_SHORT'
      Size = 32
    end
    object IBQuery2DOC_ID: TIntegerField
      FieldName = 'DOC_ID'
      Origin = 'LIST_DOC_INFORMER.DOC_ID'
    end
    object IBQuery2SHOP_COLOR: TIntegerField
      FieldName = 'SHOP_COLOR'
      Origin = 'LIST_DOC_INFORMER.SHOP_COLOR'
    end
    object IBQuery2STATUS_COLOR: TIntegerField
      FieldName = 'STATUS_COLOR'
      Origin = 'LIST_DOC_INFORMER.STATUS_COLOR'
    end
    object IBQuery2STATUS_TM: TDateTimeField
      FieldName = 'STATUS_TM'
      Origin = 'LIST_DOC_INFORMER.STATUS_TM'
    end
  end
end
