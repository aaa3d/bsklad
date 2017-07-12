object DIC_USL: TDIC_USL
  Left = 95
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Справочник Услуг'
  ClientHeight = 440
  ClientWidth = 567
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
    Width = 567
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = BtnNew
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 2
      Action = BtnOpen
    end
    object ToolButton3: TToolButton
      Left = 50
      Top = 2
      Action = BtnDel
    end
    object ToolButton4: TToolButton
      Left = 75
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 83
      Top = 2
      Action = BtnSelect
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 421
    Width = 567
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 29
    Width = 567
    Height = 392
    Align = alClient
    DataSource = DsUsl
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyPress = RxDBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'USL_NAME'
        Title.Alignment = taCenter
        Title.Caption = 'Услуга'
        Width = 410
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEB'
        Title.Alignment = taCenter
        Title.Caption = 'Д'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CRED'
        Title.Alignment = taCenter
        Title.Caption = 'К'
        Width = 55
        Visible = True
      end>
  end
  object DicTransaction: TIBTransaction
    Active = True
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 278
    Top = 86
  end
  object DicUsl: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DicTransaction
    AfterOpen = DicUslAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select usl_id,usl_name,deb,cred from usl'
      'order by usl_name')
    Left = 276
    Top = 144
    object DicUslUSL_ID: TIntegerField
      FieldName = 'USL_ID'
      Origin = 'USL.USL_ID'
      Required = True
    end
    object DicUslUSL_NAME: TIBStringField
      FieldName = 'USL_NAME'
      Origin = 'USL.USL_NAME'
      Required = True
      Size = 252
    end
    object DicUslDEB: TIBStringField
      FieldName = 'DEB'
      Origin = 'USL.DEB'
      Required = True
      Size = 252
    end
    object DicUslCRED: TIBStringField
      FieldName = 'CRED'
      Origin = 'USL.CRED'
      Required = True
      Size = 252
    end
  end
  object DsUsl: TDataSource
    DataSet = DicUsl
    Left = 278
    Top = 198
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 358
    Top = 84
    object BtnNew: TAction
      Caption = 'Новая...'
      Hint = 'Новая...'
      ImageIndex = 0
      ShortCut = 45
      OnExecute = BtnNewExecute
    end
    object BtnOpen: TAction
      Caption = 'Править...'
      Hint = 'Править...'
      ImageIndex = 1
      OnExecute = BtnOpenExecute
    end
    object BtnDel: TAction
      Caption = 'Удалить...'
      Hint = 'Удалить...'
      ImageIndex = 2
      ShortCut = 46
      OnExecute = BtnDelExecute
    end
    object BtnSelect: TAction
      Caption = 'Выбрать...'
      Hint = 'Выбрать...'
      ImageIndex = 16
      OnExecute = BtnSelectExecute
    end
  end
end
