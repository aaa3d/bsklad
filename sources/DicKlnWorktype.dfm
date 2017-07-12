object DIC_KLN_WORKTYPE: TDIC_KLN_WORKTYPE
  Left = 299
  Top = 208
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Справочник. Виды деятельности'
  ClientHeight = 350
  ClientWidth = 479
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
    Width = 479
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
    Width = 479
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 29
    Width = 479
    Height = 302
    Align = alClient
    DataSource = Dsklnworktype
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
        FieldName = 'KLN_WORKTYPE_NAME'
        Title.Caption = 'Вид деятельности'
        Width = 375
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
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 178
    Top = 92
  end
  object DicKLNWORKTYPE: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DicTransaction
    AfterOpen = DicKLNWORKTYPEAfterOpen
    AfterScroll = DicKLNWORKTYPEAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from KLN_WORKTYPE')
    Left = 174
    Top = 148
    object DicKLNWORKTYPEKLN_WORKTYPE_ID: TIntegerField
      FieldName = 'KLN_WORKTYPE_ID'
      Origin = 'KLN_WORKTYPE.KLN_WORKTYPE_ID'
      Required = True
    end
    object DicKLNWORKTYPEKLN_WORKTYPE_NAME: TIBStringField
      FieldName = 'KLN_WORKTYPE_NAME'
      Origin = 'KLN_WORKTYPE.KLN_WORKTYPE_NAME'
      Required = True
      Size = 32
    end
    object DicKLNWORKTYPETM: TDateTimeField
      FieldName = 'TM'
      Origin = 'KLN_WORKTYPE.TM'
    end
  end
  object Dsklnworktype: TDataSource
    DataSet = DicKLNWORKTYPE
    Left = 174
    Top = 204
  end
end
