object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 65534
  Top = 103
  Height = 480
  Width = 696
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
    AllowStreamedConnected = False
    Left = 32
    Top = 16
  end
  object IBTransaction1: TIBTransaction
    Active = False
    AutoStopAction = saNone
    Left = 112
    Top = 16
  end
  object IBTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 200
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
  object IbSaveSQL: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    Left = 200
    Top = 112
  end
  object IbSaveSQL2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    Left = 286
    Top = 68
  end
  object IbSaveUSWORK: TIBQuery
    Database = IBDatabase1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 288
    Top = 112
  end
  object IbGetDefault: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 376
    Top = 112
  end
  object IbSaveSQL3: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    Left = 378
    Top = 68
  end
end
