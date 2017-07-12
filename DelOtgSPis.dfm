object DEL_OTG_SPIS: TDEL_OTG_SPIS
  Left = 329
  Top = 218
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Перечень удаленных отгруженных актов списания'
  ClientHeight = 453
  ClientWidth = 733
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 733
    Height = 31
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object Label1: TLabel
      Left = 0
      Top = 2
      Width = 79
      Height = 24
      Caption = '  За период с :  '
      Layout = tlCenter
    end
    object DT1: TDateEdit
      Left = 79
      Top = 2
      Width = 121
      Height = 24
      NumGlyphs = 2
      TabOrder = 0
    end
    object Label2: TLabel
      Left = 200
      Top = 2
      Width = 30
      Height = 24
      Caption = '  по :  '
      Layout = tlCenter
    end
    object DT2: TDateEdit
      Left = 230
      Top = 2
      Width = 121
      Height = 24
      NumGlyphs = 2
      TabOrder = 1
    end
    object ToolButton1: TToolButton
      Left = 351
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object BtnRefresh: TToolButton
      Left = 359
      Top = 2
      Hint = 'Вывести перечень'
      Caption = 'BtnRefresh'
      ImageIndex = 44
      OnClick = BtnRefreshClick
    end
    object ToolButton3: TToolButton
      Left = 384
      Top = 2
      Width = 44
      Caption = 'ToolButton3'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object BtnHistory: TToolButton
      Left = 428
      Top = 2
      Hint = 'История расходной накладной'
      Caption = 'BtnHistory'
      ImageIndex = 3
      OnClick = BtnHistoryClick
    end
    object BtnFind: TToolButton
      Left = 453
      Top = 2
      Hint = 'Найти факт удаления'
      Caption = 'BtnFind'
      ImageIndex = 6
      OnClick = BtnFindClick
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 31
    Width = 733
    Height = 422
    Align = alClient
    DataSource = DsRep2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'MET'
        Title.Alignment = taCenter
        Title.Caption = ' '
        Width = 13
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOC_FULL_NUM'
        Title.Alignment = taCenter
        Title.Caption = 'Акты списания'
        Width = 441
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT'
        Title.Alignment = taCenter
        Title.Caption = 'Дата удаления'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'US_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Кто удалил'
        Width = 171
        Visible = True
      end>
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 118
    Top = 94
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 120
    Top = 144
  end
  object MemRep: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'MET'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DOC_FULL_NUM'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'DT'
        DataType = ftDate
      end
      item
        Name = 'US_FULL'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end>
    Left = 374
    Top = 92
    object MemRepMET: TStringField
      FieldName = 'MET'
      Size = 1
    end
    object MemRepDOC_FULL_NUM: TStringField
      FieldName = 'DOC_FULL_NUM'
      Size = 254
    end
    object MemRepDT: TDateField
      FieldName = 'DT'
    end
    object MemRepUS_FULL: TStringField
      FieldName = 'US_FULL'
      Size = 254
    end
    object MemRepID: TIntegerField
      FieldName = 'ID'
    end
  end
  object DsRep2: TDataSource
    DataSet = MemRep
    Left = 378
    Top = 156
  end
  object WorkTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase2
    AutoStopAction = saNone
    Left = 238
    Top = 92
  end
  object QueryWork2: TIBQuery
    Database = DataModule1.IBDatabase2
    Transaction = WorkTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    Left = 240
    Top = 142
  end
  object QueryWork3: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 122
    Top = 196
  end
  object QueryWork4: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 124
    Top = 244
  end
end
