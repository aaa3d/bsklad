object SET_DOSTUP: TSET_DOSTUP
  Left = 228
  Top = 175
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Доступ в системе'
  ClientHeight = 483
  ClientWidth = 678
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 464
    Width = 678
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 174
    Width = 678
    Height = 290
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 678
      Height = 22
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Пользуйтесь правой кнопкой мыши для определения доступа'
      TabOrder = 0
    end
    object RxDBGrid2: TRxDBGrid
      Left = 0
      Top = 22
      Width = 678
      Height = 268
      Align = alClient
      DataSource = DsSubDost
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'USGROUP_NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Категория доступа'
          Width = 543
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IS_FULL'
          Title.Alignment = taCenter
          Title.Caption = 'Доступ'
          Width = 144
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 678
    Height = 174
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object RxDBGrid1: TRxDBGrid
      Left = 0
      Top = 0
      Width = 678
      Height = 171
      Align = alClient
      DataSource = DsDost
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'FULL'
          Title.Alignment = taCenter
          Title.Caption = 'Наименование операции'
          Width = 680
          Visible = True
        end>
    end
    object RxSplitter1: TRxSplitter
      Left = 0
      Top = 171
      Width = 678
      Height = 3
      Align = alBottom
      BevelOuter = bvLowered
    end
    object Button1: TButton
      Left = 600
      Top = 24
      Width = 75
      Height = 25
      Hint = 'Выгрузить доступы в файл dostup.csv'
      Caption = 'Выгрузить'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object MemDost: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'SHORT'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'FULL'
        DataType = ftString
        Size = 254
      end>
    AfterScroll = MemDostAfterScroll
    Left = 196
    Top = 72
    object MemDostSHORT: TStringField
      DisplayWidth = 254
      FieldName = 'SHORT'
      Size = 254
    end
    object MemDostFULL: TStringField
      DisplayWidth = 254
      FieldName = 'FULL'
      Size = 254
    end
  end
  object MemSubdost: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'USDOSTUP_ID'
        DataType = ftInteger
      end
      item
        Name = 'USGROUP_ID'
        DataType = ftInteger
      end
      item
        Name = 'IS'
        DataType = ftInteger
      end
      item
        Name = 'USGROUP_NAME'
        DataType = ftString
        Size = 254
      end>
    OnCalcFields = MemSubdostCalcFields
    Left = 194
    Top = 286
    object MemSubdostUSDOSTUP_ID: TIntegerField
      FieldName = 'USDOSTUP_ID'
    end
    object MemSubdostUSGROUP_ID: TIntegerField
      FieldName = 'USGROUP_ID'
    end
    object MemSubdostIS: TIntegerField
      FieldName = 'IS'
    end
    object MemSubdostIS_FULL: TStringField
      FieldKind = fkCalculated
      FieldName = 'IS_FULL'
      Size = 254
      Calculated = True
    end
    object MemSubdostUSGROUP_NAME: TStringField
      FieldName = 'USGROUP_NAME'
      Size = 254
    end
  end
  object DsDost: TDataSource
    DataSet = MemDost
    OnDataChange = DsDostDataChange
    Left = 194
    Top = 120
  end
  object DsSubDost: TDataSource
    DataSet = MemSubdost
    OnDataChange = DsSubDostDataChange
    Left = 190
    Top = 338
  end
  object GroupTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 372
    Top = 68
  end
  object QueryUsgroup: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = GroupTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from usgroup order by usgroup_name')
    Left = 372
    Top = 122
    object QueryUsgroupUSGROUP_ID: TIntegerField
      FieldName = 'USGROUP_ID'
      Required = True
    end
    object QueryUsgroupUSGROUP_NAME: TIBStringField
      FieldName = 'USGROUP_NAME'
      Required = True
      Size = 254
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 280
    Top = 284
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 280
    Top = 336
  end
  object PopupMenu1: TPopupMenu
    Left = 374
    Top = 286
    object MnOn: TMenuItem
      Caption = 'Доступно'
      OnClick = MnOnClick
    end
    object MnOff: TMenuItem
      Caption = 'Нет'
      OnClick = MnOffClick
    end
  end
end
