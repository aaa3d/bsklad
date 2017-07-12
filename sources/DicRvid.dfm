object DIC_RVID: TDIC_RVID
  Left = 153
  Top = 217
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Справочник. Виды реализации'
  ClientHeight = 467
  ClientWidth = 764
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
    Top = 448
    Width = 764
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 764
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 1
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
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 764
    Height = 419
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object RxDBGrid1: TRxDBGrid
      Left = 0
      Top = 0
      Width = 425
      Height = 419
      Align = alLeft
      DataSource = DsDic
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = RxDBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'RVID_NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Название'
          Width = 202
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RVID_KLN'
          Title.Alignment = taCenter
          Title.Caption = 'Примечание'
          Width = 187
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 425
      Top = 0
      Width = 339
      Height = 419
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 339
        Height = 19
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'Доступность выбора'
        TabOrder = 0
      end
      object RxDBGrid2: TRxDBGrid
        Left = 0
        Top = 19
        Width = 339
        Height = 400
        Align = alClient
        DataSource = DsDost
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
            FieldName = 'SHOP_NAME'
            Title.Alignment = taCenter
            Title.Caption = 'Магазин'
            Width = 182
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DOSTUP_NAME'
            Title.Alignment = taCenter
            Title.Caption = 'Доступ'
            Width = 113
            Visible = True
          end>
      end
    end
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 443
    Top = 137
    object ActNew: TAction
      Caption = 'Новый...'
      Hint = 'Новый...'
      ImageIndex = 0
      ShortCut = 45
      OnExecute = ActNewExecute
    end
    object ActOpen: TAction
      Caption = 'Открыть (изменить)...'
      Hint = 'Открыть (изменить)...'
      ImageIndex = 1
      ShortCut = 13
      OnExecute = ActOpenExecute
    end
    object ActDel: TAction
      Caption = 'Удалить...'
      Hint = 'Удалить...'
      ImageIndex = 2
      ShortCut = 46
      OnExecute = ActDelExecute
    end
  end
  object DsDost: TDataSource
    DataSet = QueryDost
    Left = 489
    Top = 303
  end
  object DicTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 204
    Top = 87
  end
  object QueryDic: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DicTransaction
    AfterOpen = QueryDicAfterOpen
    AfterScroll = QueryDicAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from dic_rvid')
    Left = 204
    Top = 141
    object QueryDicRVID_ID: TIntegerField
      FieldName = 'RVID_ID'
      Origin = 'DIC_RVID.RVID_ID'
    end
    object QueryDicRVID_NAME: TIBStringField
      FieldName = 'RVID_NAME'
      Origin = 'DIC_RVID.RVID_NAME'
      Size = 64
    end
    object QueryDicRVID_KLN: TIBStringField
      FieldName = 'RVID_KLN'
      Origin = 'DIC_RVID.RVID_KLN'
      Size = 128
    end
  end
  object DsDic: TDataSource
    DataSet = QueryDic
    Left = 202
    Top = 195
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 671
    Top = 141
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 671
    Top = 195
  end
  object DostTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 489
    Top = 207
  end
  object QueryDost: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DostTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from dic_rvid_shop(:rvid_id)')
    Left = 489
    Top = 257
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rvid_id'
        ParamType = ptUnknown
      end>
    object QueryDostSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
      Origin = 'DIC_RVID_SHOP.SHOP_ID'
    end
    object QueryDostSHOP_NAME: TIBStringField
      FieldName = 'SHOP_NAME'
      Origin = 'DIC_RVID_SHOP.SHOP_NAME'
      Size = 64
    end
    object QueryDostCFG_ID: TIntegerField
      FieldName = 'CFG_ID'
      Origin = 'DIC_RVID_SHOP.CFG_ID'
    end
    object QueryDostCFG_VALUE: TIntegerField
      FieldName = 'CFG_VALUE'
      Origin = 'DIC_RVID_SHOP.CFG_VALUE'
    end
    object QueryDostDOSTUP_NAME: TIBStringField
      FieldName = 'DOSTUP_NAME'
      Origin = 'DIC_RVID_SHOP.DOSTUP_NAME'
      Size = 64
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 609
    Top = 285
    object MnDostOn: TMenuItem
      Caption = 'Разрешить доступ'
      OnClick = MnDostOnClick
    end
    object MnDostOff: TMenuItem
      Caption = 'Запретить доступ'
      OnClick = MnDostOffClick
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer1Timer
    Left = 312
    Top = 95
  end
end
