object IMP_1C: TIMP_1C
  Left = 597
  Top = 199
  BorderStyle = bsDialog
  Caption = '������ ������ �� 1�'
  ClientHeight = 458
  ClientWidth = 399
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
  object Label3: TLabel
    Left = 22
    Top = 336
    Width = 43
    Height = 13
    Caption = '����� :'
  end
  object Label1: TLabel
    Left = 24
    Top = 0
    Width = 175
    Height = 13
    Caption = '����������� ������ �� ������ :'
  end
  object PathFile: TEdit
    Left = 70
    Top = 332
    Width = 287
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'c:\---\test.txt'
  end
  object Button1: TButton
    Left = 282
    Top = 386
    Width = 75
    Height = 25
    Caption = '���������'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 18
    Top = 386
    Width = 75
    Height = 25
    Caption = '�������'
    TabOrder = 2
    OnClick = Button2Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 438
    Width = 399
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
    Left = 24
    Top = 16
    Width = 337
    Height = 305
    ItemHeight = 16
    Style = lbOwnerDrawFixed
    TabOrder = 4
    OnClickCheck = FIRMSClickCheck
    InternalVersion = 202
  end
  object Button3: TButton
    Left = 109
    Top = 387
    Width = 159
    Height = 25
    Caption = '���������� ��������'
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
