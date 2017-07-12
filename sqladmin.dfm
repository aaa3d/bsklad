object sql_admin: Tsql_admin
  Left = 410
  Top = 247
  Width = 870
  Height = 640
  Caption = 'Скрипты, SQL'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 29
    Width = 862
    Height = 577
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'SQL'
      object sql: TRxRichEdit
        Left = 0
        Top = 0
        Width = 854
        Height = 549
        Align = alClient
        TabOrder = 0
        WordWrap = False
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Result'
      ImageIndex = 1
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 0
        Width = 854
        Height = 549
        Align = alClient
        DataSource = ds1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Messages'
      ImageIndex = 2
      object mess: TRxRichEdit
        Left = 0
        Top = 0
        Width = 854
        Height = 549
        Align = alClient
        TabOrder = 0
      end
    end
  end
  object SpeedBar1: TSpeedBar
    Left = 0
    Top = 0
    Width = 862
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    BtnOffsetHorz = 3
    BtnOffsetVert = 3
    BtnWidth = 24
    BtnHeight = 23
    Images = DataModule1.ImageList1
    TabOrder = 1
    InternalVer = 1
    object SpeedbarSection1: TSpeedbarSection
      Caption = 'Untitled (0)'
    end
    object btnRunSQL: TSpeedItem
      Caption = 'btnRunSQL'
      Hint = 'btnRunSQL|'
      ImageIndex = 204
      Spacing = 1
      Left = 83
      Top = 3
      Visible = True
      OnClick = btnRunSQLClick
      SectionName = 'Untitled (0)'
    end
    object bntOpen: TSpeedItem
      Caption = 'bntOpen'
      Hint = 'bntOpen|'
      ImageIndex = 1
      Spacing = 1
      Left = 3
      Top = 3
      Visible = True
      OnClick = bntOpenClick
      SectionName = 'Untitled (0)'
    end
    object btnPrepare: TSpeedItem
      Caption = 'btnPrepare'
      Hint = 'btnPrepare|'
      ImageIndex = 35
      Spacing = 1
      Left = 139
      Top = 3
      Visible = True
      OnClick = btnPrepareClick
      SectionName = 'Untitled (0)'
    end
    object btnSave: TSpeedItem
      Caption = 'btnSave'
      Hint = 'btnSave|'
      ImageIndex = 39
      Spacing = 1
      Left = 35
      Top = 3
      Visible = True
      OnClick = btnSaveClick
      SectionName = 'Untitled (0)'
    end
    object btnRunScript: TSpeedItem
      Caption = 'btnRunScript'
      Hint = 'btnRunScript|'
      ImageIndex = 205
      Spacing = 1
      Left = 107
      Top = 3
      Visible = True
      OnClick = btnRunScriptClick
      SectionName = 'Untitled (0)'
    end
    object btnCommit: TSpeedItem
      Caption = 'btnCommit'
      Hint = 'btnCommit|'
      ImageIndex = 203
      Spacing = 1
      Left = 195
      Top = 3
      Visible = True
      OnClick = btnCommitClick
      SectionName = 'Untitled (0)'
    end
    object btnRollback: TSpeedItem
      Caption = 'btnRollback'
      Hint = 'btnRollback|'
      ImageIndex = 2
      Spacing = 1
      Left = 227
      Top = 3
      Visible = True
      OnClick = btnRollbackClick
      SectionName = 'Untitled (0)'
    end
    object btnSetGens: TSpeedItem
      Caption = 'Set gens'
      Hint = 'Set gens|'
      ImageIndex = 44
      Spacing = 1
      Left = 427
      Top = 3
      Visible = True
      OnClick = btnSetGensClick
      SectionName = 'Untitled (0)'
    end
  end
  object od1: TOpenDialog
    Filter = 'SQL script|*.sql|Text files|*.txt|Any files|*.*'
    InitialDir = '.'
    Left = 176
    Top = 85
  end
  object sd1: TSaveDialog
    Filter = 'SQL script|*.sql|Text files|*.txt|Any files|*.*'
    InitialDir = '.'
    Left = 220
    Top = 89
  end
  object tr1: TIBTransaction
    Active = False
    DefaultDatabase = db1
    AutoStopAction = saNone
    Left = 324
    Top = 109
  end
  object ds1: TDataSource
    DataSet = qry
    Left = 204
    Top = 185
  end
  object qry: TIBQuery
    Database = db1
    Transaction = tr1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 132
    Top = 185
  end
  object IBSQLMonitor1: TIBSQLMonitor
    OnSQL = IBSQLMonitor1SQL
    TraceFlags = [tfQPrepare, tfQExecute, tfQFetch, tfError, tfStmt, tfConnect, tfTransact, tfBlob, tfService, tfMisc]
    Left = 480
    Top = 225
  end
  object db1: TIBDatabase
    Params.Strings = (
      'user_name=BEGINNER'
      'password=mayby'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = tr1
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = [tfQPrepare, tfQExecute, tfQFetch, tfError, tfStmt, tfConnect, tfTransact, tfBlob, tfService, tfMisc]
    AllowStreamedConnected = False
    Left = 96
    Top = 105
  end
  object scr: TIBScript
    Database = db1
    Transaction = tr1
    Terminator = ';'
    OnParseError = scrParseError
    OnExecuteError = scrExecuteError
    Left = 300
    Top = 181
  end
end
