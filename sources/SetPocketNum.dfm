object SET_POCKET_NUM: TSET_POCKET_NUM
  Left = 98
  Top = 178
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 
    'Установка номеров последних полученных пакетов от других магазин' +
    'ов'
  ClientHeight = 348
  ClientWidth = 536
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
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 536
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Hint = 'Сохранить'
      Caption = 'ToolButton1'
      ImageIndex = 39
      OnClick = ToolButton1Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 329
    Width = 536
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 29
    Width = 536
    Height = 300
    Align = alClient
    DataSource = DsCfg
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SHOP_FULL'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Получено от магазина'
        Width = 353
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POCKET_NUM'
        Title.Alignment = taCenter
        Title.Caption = '№ последнего пакета'
        Width = 137
        Visible = True
      end>
  end
  object MemCfg: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'CFG_ID'
        DataType = ftInteger
      end
      item
        Name = 'SHOP_ID'
        DataType = ftInteger
      end
      item
        Name = 'SHOP_FULL'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'POCKET_NUM'
        DataType = ftInteger
      end>
    Left = 134
    Top = 108
    object MemCfgCFG_ID: TIntegerField
      FieldName = 'CFG_ID'
    end
    object MemCfgSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
    end
    object MemCfgSHOP_FULL: TStringField
      FieldName = 'SHOP_FULL'
      Size = 254
    end
    object MemCfgPOCKET_NUM: TIntegerField
      FieldName = 'POCKET_NUM'
    end
  end
  object DsCfg: TDataSource
    DataSet = MemCfg
    OnDataChange = DsCfgDataChange
    Left = 136
    Top = 166
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 358
    Top = 60
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 356
    Top = 108
  end
  object QueryWork2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 356
    Top = 158
  end
end
