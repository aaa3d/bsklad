object DIC_NP: TDIC_NP
  Left = 194
  Top = 182
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Справочник. Ставка Налога с продаж'
  ClientHeight = 350
  ClientWidth = 604
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
    Width = 604
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton5: TToolButton
      Left = 0
      Top = 2
      Caption = 'ToolButton5'
      ImageIndex = 110
      OnClick = ToolButton5Click
    end
    object ToolButton4: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 33
      Top = 2
      Action = ActIns
    end
    object ToolButton2: TToolButton
      Left = 58
      Top = 2
      Action = ActOpen
    end
    object ToolButton3: TToolButton
      Left = 83
      Top = 2
      Action = ActDel
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 331
    Width = 604
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 29
    Width = 604
    Height = 302
    Align = alClient
    DataSource = DsNP
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
        FieldName = 'NP_DATE'
        Title.Alignment = taCenter
        Title.Caption = 'На дату'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP'
        Title.Alignment = taCenter
        Title.Caption = 'Ставка'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'US_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Кто внес данные'
        Width = 404
        Visible = True
      end>
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 302
    Top = 132
    object ActIns: TAction
      Caption = 'Добавить...'
      Hint = 'Добавить...'
      ImageIndex = 0
      ShortCut = 45
      OnExecute = ActInsExecute
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
  object DicTransaction: TIBTransaction
    Active = True
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 178
    Top = 92
  end
  object DicNP: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DicTransaction
    AfterOpen = DicNPAfterOpen
    AfterScroll = DicNPAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from dic_np(:rntyp_id)')
    Left = 174
    Top = 150
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rntyp_id'
        ParamType = ptUnknown
      end>
    object DicNPNP_ID: TIntegerField
      FieldName = 'NP_ID'
      Origin = 'DIC_NP.NP_ID'
    end
    object DicNPNP: TFloatField
      FieldName = 'NP'
      Origin = 'DIC_NP.NP'
      DisplayFormat = '#0.00%'
    end
    object DicNPNP_DATE: TDateTimeField
      FieldName = 'NP_DATE'
      Origin = 'DIC_NP.NP_DATE'
    end
    object DicNPUS_FULL: TIBStringField
      FieldName = 'US_FULL'
      Origin = 'DIC_NP.US_FULL'
      Size = 128
    end
  end
  object DsNP: TDataSource
    DataSet = DicNP
    Left = 174
    Top = 204
  end
end
