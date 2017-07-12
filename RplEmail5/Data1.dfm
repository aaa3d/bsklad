object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 65534
  Top = 103
  Height = 480
  Width = 696
  object IbSaveSQL: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    Left = 200
    Top = 112
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = 'c:\'
    Params.Strings = (
      'user_name=BEGINNER'
      'password=mayby'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 28
    Top = 16
  end
  object IBTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 200
    Top = 16
  end
  object IBTransaction1: TIBTransaction
    Active = False
    AutoStopAction = saNone
    Left = 112
    Top = 16
  end
  object IbGetGen: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    Left = 112
    Top = 112
  end
end
