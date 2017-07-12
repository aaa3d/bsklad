object CARD_REG: TCARD_REG
  Left = 76
  Top = 113
  BorderStyle = bsSingle
  Caption = 'Регистрация пластиковых карт'
  ClientHeight = 473
  ClientWidth = 742
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 454
    Width = 742
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 742
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = ActNewCard
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 2
      Action = ActOpenCard
    end
    object ToolButton3: TToolButton
      Left = 50
      Top = 2
      Action = ActDelCard
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 29
    Width = 742
    Height = 425
    Align = alClient
    DataSource = DsCard
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    OnKeyPress = RxDBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'card_activ'
        Title.Alignment = taCenter
        Title.Caption = 'Активны'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'card_name'
        Title.Alignment = taCenter
        Title.Caption = 'Владелец'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'card_diap'
        Title.Alignment = taCenter
        Title.Caption = 'Диапазон номеров'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'card_usl'
        Title.Alignment = taCenter
        Title.Caption = 'Начальные условия'
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kln_full'
        Title.Alignment = taCenter
        Title.Caption = 'Клиент по умолчанию'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'card_uch'
        Title.Alignment = taCenter
        Title.Caption = 'Учет'
        Width = 86
        Visible = True
      end>
  end
  object MemCard: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'cfg_id'
        DataType = ftInteger
      end
      item
        Name = 'card_name'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'card_diap'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'card_usl'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'kln_full'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'card_uch'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'card_activ'
        DataType = ftString
        Size = 3
      end>
    Left = 178
    Top = 138
    object MemCardcfg_id: TIntegerField
      FieldName = 'cfg_id'
    end
    object MemCardcard_name: TStringField
      FieldName = 'card_name'
      Size = 64
    end
    object MemCardcard_diap: TStringField
      FieldName = 'card_diap'
      Size = 64
    end
    object MemCardcard_usl: TStringField
      FieldName = 'card_usl'
      Size = 64
    end
    object MemCardkln_full: TStringField
      FieldName = 'kln_full'
      Size = 254
    end
    object MemCardcard_uch: TStringField
      FieldName = 'card_uch'
      Size = 64
    end
    object MemCardcard_activ: TStringField
      FieldName = 'card_activ'
      Size = 3
    end
  end
  object DsCard: TDataSource
    DataSet = MemCard
    Left = 178
    Top = 190
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 246
    Top = 140
    object ActNewCard: TAction
      Caption = 'Новые пластиковые карты...'
      Hint = 'Новые пластиковые карты...'
      ImageIndex = 0
      OnExecute = ActNewCardExecute
    end
    object ActOpenCard: TAction
      Caption = 'Изменение пластиковых карт...'
      Hint = 'Изменение пластиковых карт...'
      ImageIndex = 1
      OnExecute = ActOpenCardExecute
    end
    object ActDelCard: TAction
      Caption = 'Удаление пластиковых карт...'
      Hint = 'Удаление пластиковых карт...'
      ImageIndex = 2
      OnExecute = ActDelCardExecute
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 316
    Top = 140
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 318
    Top = 192
  end
  object QueryWork2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 320
    Top = 244
  end
end
