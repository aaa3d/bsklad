object DEFAULT_SHOP: TDEFAULT_SHOP
  Left = 334
  Top = 200
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Настройки фирм и клиентов по умолчанию для магазинов'
  ClientHeight = 435
  ClientWidth = 783
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
    Width = 783
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object BtnOpen: TToolButton
      Left = 0
      Top = 2
      Caption = 'BtnOpen'
      ImageIndex = 1
      OnClick = BtnOpenClick
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object SHOP: TRxDBLookupCombo
      Left = 33
      Top = 2
      Width = 276
      Height = 24
      DropDownCount = 8
      LookupField = 'SHOP_ID'
      LookupDisplay = 'SHOP_NAME'
      LookupSource = DsShop
      TabOrder = 0
      OnChange = SHOPChange
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 416
    Width = 783
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 29
    Width = 783
    Height = 387
    Align = alClient
    DataSource = DsMemTyp
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'RNTYP_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Тип расходной накладной'
        Width = 166
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FRM_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Фирма по умолчанию'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KLN_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Клиент по умолчанию'
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RVID_NAME'
        Title.Alignment = taCenter
        Title.Caption = 'Вид реализации'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RVIDKLN_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Банк вида реализации'
        Width = 126
        Visible = True
      end>
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 356
    Top = 124
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 356
    Top = 176
  end
  object ShopTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 464
    Top = 128
  end
  object QuerySHOP: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ShopTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select shop_id,shop_name from SHOP order by SHOP_NAME')
    Left = 464
    Top = 180
    object QuerySHOPSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
      Required = True
    end
    object QuerySHOPSHOP_NAME: TIBStringField
      FieldName = 'SHOP_NAME'
      Required = True
      Size = 254
    end
  end
  object DsShop: TDataSource
    DataSet = QuerySHOP
    Left = 464
    Top = 228
  end
  object RxMemTYP: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RNTYP_ID'
        DataType = ftInteger
      end
      item
        Name = 'RNTYP_FULL'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'FRM_ID'
        DataType = ftInteger
      end
      item
        Name = 'FRM_FULL'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'KLN_ID'
        DataType = ftInteger
      end
      item
        Name = 'KLN_FULL'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'CFG_ID'
        DataType = ftInteger
      end
      item
        Name = 'CFG_ID2'
        DataType = ftInteger
      end
      item
        Name = 'CFG_ID3'
        DataType = ftInteger
      end
      item
        Name = 'CFG_ID4'
        DataType = ftInteger
      end
      item
        Name = 'RVID_ID'
        DataType = ftInteger
      end
      item
        Name = 'RVID_NAME'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RVIDKLN_ID'
        DataType = ftInteger
      end
      item
        Name = 'RVIDKLN_FULL'
        DataType = ftString
        Size = 252
      end>
    Left = 136
    Top = 116
    object RxMemTYPRNTYP_ID: TIntegerField
      FieldName = 'RNTYP_ID'
    end
    object RxMemTYPRNTYP_FULL: TStringField
      FieldName = 'RNTYP_FULL'
      Size = 254
    end
    object RxMemTYPFRM_ID: TIntegerField
      FieldName = 'FRM_ID'
    end
    object RxMemTYPFRM_FULL: TStringField
      FieldName = 'FRM_FULL'
      Size = 254
    end
    object RxMemTYPKLN_ID: TIntegerField
      FieldName = 'KLN_ID'
    end
    object RxMemTYPKLN_FULL: TStringField
      FieldName = 'KLN_FULL'
      Size = 254
    end
    object RxMemTYPCFG_ID: TIntegerField
      FieldName = 'CFG_ID'
    end
    object RxMemTYPCFG_ID2: TIntegerField
      FieldName = 'CFG_ID2'
    end
    object RxMemTYPCFG_ID3: TIntegerField
      FieldName = 'CFG_ID3'
    end
    object RxMemTYPCFG_ID4: TIntegerField
      FieldName = 'CFG_ID4'
    end
    object RxMemTYPRVID_ID: TIntegerField
      FieldName = 'RVID_ID'
    end
    object RxMemTYPRVID_NAME: TStringField
      FieldName = 'RVID_NAME'
      Size = 64
    end
    object RxMemTYPRVIDKLN_ID: TIntegerField
      FieldName = 'RVIDKLN_ID'
    end
    object RxMemTYPRVIDKLN_FULL: TStringField
      FieldName = 'RVIDKLN_FULL'
      Size = 252
    end
  end
  object DsMemTyp: TDataSource
    DataSet = RxMemTYP
    Left = 136
    Top = 168
  end
  object QueryWork2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 356
    Top = 228
  end
end
