object LIST_CONSTANT: TLIST_CONSTANT
  Left = 140
  Top = 153
  Width = 696
  Height = 480
  Caption = 'Свойства системы'
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
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 688
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = ActOpen
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 29
    Width = 688
    Height = 424
    Align = alClient
    DataSource = DsList
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CFG_BIG'
        Title.Alignment = taCenter
        Title.Caption = 'Назначение'
        Width = 432
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DISPLAY_VALUE'
        Title.Alignment = taCenter
        Title.Caption = 'Значение'
        Width = 219
        Visible = True
      end>
  end
  object ListTransaction: TIBTransaction
    Active = True
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 250
    Top = 48
  end
  object QueryList: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ListTransaction
    OnCalcFields = QueryListCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from cfg where cfg_name like "$CONST_%" order by cfg_se' +
        't2')
    Left = 156
    Top = 48
    object QueryListCFG_ID: TIntegerField
      FieldName = 'CFG_ID'
      Origin = 'CFG.CFG_ID'
      Required = True
    end
    object QueryListCFG_NAME: TIBStringField
      FieldName = 'CFG_NAME'
      Origin = 'CFG.CFG_NAME'
      Required = True
      Size = 250
    end
    object QueryListCFG_SET1: TIntegerField
      FieldName = 'CFG_SET1'
      Origin = 'CFG.CFG_SET1'
    end
    object QueryListCFG_SET2: TIntegerField
      FieldName = 'CFG_SET2'
      Origin = 'CFG.CFG_SET2'
    end
    object QueryListCFG_SET3: TIntegerField
      FieldName = 'CFG_SET3'
      Origin = 'CFG.CFG_SET3'
    end
    object QueryListCFG_VALUE: TIBStringField
      FieldName = 'CFG_VALUE'
      Origin = 'CFG.CFG_VALUE'
      Size = 254
    end
    object QueryListCFG_BIG: TIBStringField
      FieldName = 'CFG_BIG'
      Origin = 'CFG.CFG_BIG'
      Size = 20000
    end
    object QueryListDATE_VALUE: TDateTimeField
      FieldName = 'DATE_VALUE'
      Origin = 'CFG.DATE_VALUE'
    end
    object QueryListTM: TDateTimeField
      FieldName = 'TM'
      Origin = 'CFG.TM'
      Required = True
    end
    object QueryListDISPLAY_VALUE: TStringField
      FieldKind = fkCalculated
      FieldName = 'DISPLAY_VALUE'
      Size = 252
      Calculated = True
    end
  end
  object DsList: TDataSource
    DataSet = QueryList
    Left = 156
    Top = 100
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 400
    Top = 136
    object ActOpen: TAction
      Caption = 'Изменить...'
      Hint = 'Изменить...'
      ImageIndex = 1
      ShortCut = 13
      OnExecute = ActOpenExecute
    end
  end
end
