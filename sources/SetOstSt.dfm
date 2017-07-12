object Set_Ost_St: TSet_Ost_St
  Left = 358
  Top = 284
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Фильтр складов для отображения остатков в счете'
  ClientHeight = 453
  ClientWidth = 688
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
  OnKeyPress = FormKeyPress
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
      Action = ActNew
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 2
      Action = ActOpen
    end
    object ToolButton3: TToolButton
      Left = 50
      Top = 2
      Action = ActDel
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 434
    Width = 688
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 29
    Width = 688
    Height = 405
    Align = alClient
    DataSource = DsList
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CFG_VALUE'
        Title.Alignment = taCenter
        Title.Caption = 'Наименование'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SKL_LIST'
        Title.Alignment = taCenter
        Title.Caption = 'Перечень складов для вычисления остатков'
        Width = 532
        Visible = True
      end>
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 490
    Top = 86
    object ActNew: TAction
      Caption = 'Новый...'
      Hint = 'Новый...'
      ImageIndex = 0
      ShortCut = 45
      OnExecute = ActNewExecute
    end
    object ActOpen: TAction
      Caption = 'Изменить...'
      Hint = 'Изменить...'
      ImageIndex = 1
      ShortCut = 13
      OnExecute = ActOpenExecute
    end
    object ActDel: TAction
      Caption = 'Удалить'
      Hint = 'Удалить'
      ImageIndex = 2
      ShortCut = 46
      OnExecute = ActDelExecute
    end
  end
  object ListTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 324
    Top = 122
  end
  object QueryList: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ListTransaction
    AfterOpen = QueryListAfterOpen
    AfterScroll = QueryListAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from list_set_ost_st(:us_id)'
      'order by cfg_value')
    Left = 322
    Top = 174
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'us_id'
        ParamType = ptUnknown
      end>
    object QueryListCFG_ID: TIntegerField
      FieldName = 'CFG_ID'
      Origin = 'LIST_SET_OST_ST.CFG_ID'
    end
    object QueryListCFG_VALUE: TIBStringField
      FieldName = 'CFG_VALUE'
      Origin = 'LIST_SET_OST_ST.CFG_VALUE'
      Size = 254
    end
    object QueryListSKL_LIST: TIBStringField
      FieldName = 'SKL_LIST'
      Origin = 'LIST_SET_OST_ST.SKL_LIST'
      Size = 1000
    end
  end
  object DsList: TDataSource
    DataSet = QueryList
    Left = 324
    Top = 226
  end
end
