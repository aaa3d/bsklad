object ZP_STAT: TZP_STAT
  Left = 90
  Top = 144
  BorderStyle = bsSingle
  Caption = 'Зарплата. Штатное расписание'
  ClientHeight = 468
  ClientWidth = 796
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
    Width = 796
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton4: TToolButton
      Left = 0
      Top = 2
      Action = ActNewOtdel
    end
    object ToolButton5: TToolButton
      Left = 25
      Top = 2
      Action = ActOpenOtdel
    end
    object ToolButton6: TToolButton
      Left = 50
      Top = 2
      Action = ActDelOtdel
    end
    object ToolButton7: TToolButton
      Left = 75
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 160
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 83
      Top = 2
      Action = ActNewUser
    end
    object ToolButton2: TToolButton
      Left = 108
      Top = 2
      Action = ActOpenUser
    end
    object ToolButton3: TToolButton
      Left = 133
      Top = 2
      Action = ActDelUser
    end
    object ToolButton10: TToolButton
      Left = 158
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 166
      Top = 2
      Action = ActNewRulez
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 449
    Width = 796
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 796
    Height = 420
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 189
      Top = 0
      Width = 3
      Height = 420
      Cursor = crHSplit
    end
    object TreeView1: TTreeView
      Left = 0
      Top = 0
      Width = 189
      Height = 420
      Align = alLeft
      Images = DataModule1.ImageList1
      Indent = 21
      PopupMenu = PopupTree
      TabOrder = 0
      OnChange = TreeView1Change
      OnDblClick = TreeView1DblClick
    end
    object Panel2: TPanel
      Left = 192
      Top = 0
      Width = 604
      Height = 420
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Splitter2: TSplitter
        Left = 0
        Top = 266
        Width = 604
        Height = 3
        Cursor = crVSplit
        Align = alBottom
      end
      object Panel3: TPanel
        Left = 0
        Top = 269
        Width = 604
        Height = 151
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
      end
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 0
        Width = 604
        Height = 266
        Align = alClient
        DataSource = DsUS
        TabOrder = 1
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
            FieldName = 'DOL_NAME'
            Title.Alignment = taCenter
            Title.Caption = 'Должность'
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'US_FULL'
            Title.Alignment = taCenter
            Title.Caption = 'Сотрудник'
            Width = 153
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZPPR_FULLNUM'
            Title.Alignment = taCenter
            Title.Caption = 'Приказ №'
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZPPR_DATE'
            Title.Alignment = taCenter
            Title.Caption = 'От...'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZPPR_OSN'
            Title.Alignment = taCenter
            Title.Caption = 'Основание'
            Visible = True
          end>
      end
    end
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 290
    Top = 137
    object ActNewUser: TAction
      Caption = 'ActNewUser'
      Hint = 'Новая штатная единица...'
      ImageIndex = 154
      OnExecute = ActNewUserExecute
    end
    object ActOpenUser: TAction
      Caption = 'ActOpenUser'
      Hint = 'Изменить штатную единицу'
      ImageIndex = 155
      OnExecute = ActOpenUserExecute
    end
    object ActDelUser: TAction
      Caption = 'ActDelUser'
      Hint = 'Удалить штатную единицу'
      ImageIndex = 156
    end
    object ActNewOtdel: TAction
      Caption = 'Новый отдел...'
      Hint = 'Новый отдел...'
      ImageIndex = 157
      OnExecute = ActNewOtdelExecute
    end
    object ActOpenOtdel: TAction
      Caption = 'Изменить отдел...'
      Hint = 'Изменить отдел...'
      ImageIndex = 158
      OnExecute = ActOpenOtdelExecute
    end
    object ActDelOtdel: TAction
      Caption = 'Удалить отдел...'
      Hint = 'Удалить отдел...'
      ImageIndex = 159
      OnExecute = ActDelOtdelExecute
    end
    object ActNewRulez: TAction
      Caption = 'Правила расчета зарплаты по должности...'
      Hint = 'Правила расчета зарплаты по должности...'
      ImageIndex = 169
      OnExecute = ActNewRulezExecute
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 464
    Top = 141
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 464
    Top = 195
  end
  object PopupTree: TPopupMenu
    Images = DataModule1.ImageList1
    Left = 98
    Top = 119
    object N1: TMenuItem
      Action = ActNewOtdel
    end
    object N2: TMenuItem
      Action = ActOpenOtdel
    end
    object N3: TMenuItem
      Action = ActDelOtdel
    end
  end
  object UsTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 596
    Top = 139
  end
  object QueryUS: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = UsTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from list_stat(:otdel_id)')
    Left = 600
    Top = 195
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'otdel_id'
        ParamType = ptUnknown
      end>
    object QueryUSDOL_ID: TIntegerField
      FieldName = 'DOL_ID'
      Origin = 'LIST_STAT.DOL_ID'
    end
    object QueryUSDOL_NAME: TIBStringField
      FieldName = 'DOL_NAME'
      Origin = 'LIST_STAT.DOL_NAME'
      Size = 64
    end
    object QueryUSZPPR_ID: TIntegerField
      FieldName = 'ZPPR_ID'
      Origin = 'LIST_STAT.ZPPR_ID'
    end
    object QueryUSZPPR_TYP: TIntegerField
      FieldName = 'ZPPR_TYP'
      Origin = 'LIST_STAT.ZPPR_TYP'
    end
    object QueryUSZPPR_DATE: TDateTimeField
      FieldName = 'ZPPR_DATE'
      Origin = 'LIST_STAT.ZPPR_DATE'
    end
    object QueryUSZPPR_OSN: TIBStringField
      FieldName = 'ZPPR_OSN'
      Origin = 'LIST_STAT.ZPPR_OSN'
      Size = 254
    end
    object QueryUSUS_ID: TIntegerField
      FieldName = 'US_ID'
      Origin = 'LIST_STAT.US_ID'
    end
    object QueryUSUS_FULL: TIBStringField
      FieldName = 'US_FULL'
      Origin = 'LIST_STAT.US_FULL'
      Size = 254
    end
    object QueryUSZPPR_FULLNUM: TIBStringField
      FieldName = 'ZPPR_FULLNUM'
      Origin = 'LIST_STAT.ZPPR_FULLNUM'
      Size = 64
    end
  end
  object DsUS: TDataSource
    DataSet = QueryUS
    Left = 596
    Top = 249
  end
end
