object IMP_1C: TIMP_1C
  Left = 597
  Top = 199
  BorderStyle = bsDialog
  Caption = 'Импорт данных из 1С'
  ClientHeight = 564
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Label3: TLabel
    Left = 27
    Top = 414
    Width = 50
    Height = 16
    Caption = 'Файлы :'
  end
  object Label1: TLabel
    Left = 30
    Top = 0
    Width = 222
    Height = 16
    Caption = 'Объединение данных по фирмам :'
  end
  object PathFile: TEdit
    Left = 86
    Top = 409
    Width = 353
    Height = 24
    Enabled = False
    TabOrder = 0
    Text = 'c:\---\test.txt'
  end
  object Button1: TButton
    Left = 347
    Top = 475
    Width = 92
    Height = 31
    Caption = 'Загрузить'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 22
    Top = 475
    Width = 92
    Height = 31
    Caption = 'Закрыть'
    TabOrder = 2
    OnClick = Button2Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 544
    Width = 491
    Height = 20
    Panels = <
      item
        Width = 50
      end
      item
        Width = 120
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object FIRMS: TRxCheckListBox
    Left = 30
    Top = 20
    Width = 414
    Height = 375
    ItemHeight = 16
    Style = lbOwnerDrawFixed
    TabOrder = 4
    OnClickCheck = FIRMSClickCheck
    InternalVersion = 202
  end
  object Button3: TButton
    Left = 134
    Top = 476
    Width = 196
    Height = 31
    Caption = 'Остановить загрузку'
    TabOrder = 5
    OnClick = Button3Click
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 580
    Top = 24
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 10
    CachedUpdates = False
    Left = 488
    Top = 32
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 440
    Top = 48
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 504
    Top = 80
  end
  object mem: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'inn'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'SALDO'
        DataType = ftCurrency
      end
      item
        Name = 'MONEY'
        DataType = ftCurrency
      end>
    Left = 584
    Top = 88
    object memID: TIntegerField
      FieldName = 'ID'
    end
    object meminn: TStringField
      FieldName = 'inn'
    end
    object memname: TStringField
      FieldName = 'name'
      Size = 255
    end
    object memSALDO: TCurrencyField
      FieldName = 'SALDO'
    end
    object memMONEY: TCurrencyField
      FieldName = 'MONEY'
    end
  end
  object DataSource1: TDataSource
    DataSet = mem
    Left = 448
    Top = 160
  end
end
