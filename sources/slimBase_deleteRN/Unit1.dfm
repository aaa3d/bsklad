object Form1: TForm1
  Left = 480
  Top = 377
  Width = 727
  Height = 420
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object lbl1: TLabel
    Left = 40
    Top = 160
    Width = 21
    Height = 16
    Caption = 'lbl1'
  end
  object btn1: TButton
    Left = 248
    Top = 16
    Width = 177
    Height = 25
    Caption = 'connect'
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 248
    Top = 56
    Width = 177
    Height = 25
    Caption = 'Start 1'
    TabOrder = 1
    OnClick = btn2Click
  end
  object btn4: TButton
    Left = 248
    Top = 192
    Width = 185
    Height = 25
    Caption = 'Stop'
    TabOrder = 2
    OnClick = btn4Click
  end
  object edt1: TEdit
    Left = 48
    Top = 128
    Width = 121
    Height = 24
    TabOrder = 3
    Text = 'edt1'
  end
  object btn3: TButton
    Left = 248
    Top = 120
    Width = 177
    Height = 25
    Caption = 'Start 2'
    TabOrder = 4
    OnClick = btn3Click
  end
  object btn5: TButton
    Left = 496
    Top = 24
    Width = 217
    Height = 25
    Caption = 'connect to bsklad2009-test'
    TabOrder = 5
    OnClick = btn5Click
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = '127.0.0.1:D:\BSKLAD2005.FDB.SLIM_START'
    Params.Strings = (
      'user_name=beginner'
      'password=mayby')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 24
    Top = 64
  end
  object IBTransaction1: TIBTransaction
    Active = False
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version')
    AutoStopAction = saNone
    Left = 96
    Top = 64
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 152
    Top = 64
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    Left = 48
    Top = 216
  end
  object tmr1: TTimer
    OnTimer = tmr1Timer
    Left = 504
    Top = 24
  end
  object IBTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 40
    Top = 264
  end
end
