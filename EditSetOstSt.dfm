object Edit_SET_OST_ST: TEdit_SET_OST_ST
  Left = 178
  Top = 176
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Отображение остатков'
  ClientHeight = 410
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 537
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = ActSave
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 2
      Action = ActApply
    end
    object ToolButton3: TToolButton
      Left = 50
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 39
      Style = tbsSeparator
    end
    object Label1: TLabel
      Left = 58
      Top = 2
      Width = 418
      Height = 24
      Caption = 
        'Для изменения режима отображения сделайте двойной щелчок на имен' +
        'и склада'
      Layout = tlCenter
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 57
    Width = 537
    Height = 353
    Align = alClient
    DataSource = DsSKL
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'SKL_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Склад'
        Width = 414
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MET'
        Title.Alignment = taCenter
        Title.Caption = 'Отображать'
        Width = 73
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 537
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label2: TLabel
      Left = 6
      Top = 6
      Width = 121
      Height = 13
      Caption = 'Наименование набора :'
    end
    object NAME: TEdit
      Left = 132
      Top = 2
      Width = 395
      Height = 21
      TabOrder = 0
      OnChange = NAMEChange
    end
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 394
    Top = 70
    object ActSave: TAction
      Caption = 'Сохранить'
      Hint = 'Сохранить'
      ImageIndex = 39
      ShortCut = 16397
      OnExecute = ActSaveExecute
    end
    object ActApply: TAction
      Caption = 'Применить'
      Hint = 'Применить'
      ImageIndex = 38
      ShortCut = 16467
      OnExecute = ActApplyExecute
    end
  end
  object MemSKL: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'SKL_ID'
        DataType = ftInteger
      end
      item
        Name = 'SKL_FULL'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'MET'
        DataType = ftString
        Size = 3
      end>
    Left = 158
    Top = 132
    object MemSKLSKL_ID: TIntegerField
      FieldName = 'SKL_ID'
    end
    object MemSKLSKL_FULL: TStringField
      FieldName = 'SKL_FULL'
      Size = 254
    end
    object MemSKLMET: TStringField
      FieldName = 'MET'
      Size = 3
    end
  end
  object DsSKL: TDataSource
    DataSet = MemSKL
    Left = 158
    Top = 182
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 278
    Top = 134
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 278
    Top = 184
  end
end
