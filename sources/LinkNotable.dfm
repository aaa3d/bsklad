object LINK_NOTABLE: TLINK_NOTABLE
  Left = 146
  Top = 167
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Таблицы, исключенные из синхронизации'
  ClientHeight = 420
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 618
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    EdgeBorders = []
    Images = DataModule1.ImageList1
    TabOrder = 0
    object BtnNew: TToolButton
      Left = 0
      Top = 2
      Caption = 'BtnNew'
      ImageIndex = 0
      OnClick = BtnNewClick
    end
    object BtnOpen: TToolButton
      Left = 25
      Top = 2
      Caption = 'BtnOpen'
      ImageIndex = 1
      OnClick = BtnOpenClick
    end
    object BtnDel: TToolButton
      Left = 50
      Top = 2
      Caption = 'BtnDel'
      ImageIndex = 2
      OnClick = BtnDelClick
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 29
    Width = 618
    Height = 391
    Align = alClient
    DataSource = DsList
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    OnKeyPress = DBGridEh1KeyPress
    RowHeight = 4
    RowSizingAllowed = True
    RowLines = 2
    DrawMemoText = True
    OptionsEh = [dghFixed3D, dghFrozen3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText]
    Columns = <
      item
        FieldName = 'CFG_VALUE'
        Title.Alignment = taCenter
        Title.Caption = 'Имя таблицы'
        Width = 131
      end
      item
        FieldName = 'CFG_BIG'
        Title.Alignment = taCenter
        Title.Caption = 'Примечания'
        Width = 393
      end>
  end
  object ListTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 194
    Top = 60
  end
  object QueryList: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ListTransaction
    AfterOpen = QueryListAfterOpen
    AfterScroll = QueryListAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select cfg_id,cfg_value,cfg_big,cfg_set1'
      'from cfg where cfg_name="LINK_NOTABLE"'
      'order by cfg_value')
    Left = 194
    Top = 112
    object QueryListCFG_ID: TIntegerField
      FieldName = 'CFG_ID'
      Required = True
    end
    object QueryListCFG_VALUE: TIBStringField
      FieldName = 'CFG_VALUE'
      Size = 254
    end
    object QueryListCFG_BIG: TIBStringField
      FieldName = 'CFG_BIG'
      Size = 20000
    end
    object QueryListCFG_SET1: TIntegerField
      FieldName = 'CFG_SET1'
    end
  end
  object DsList: TDataSource
    DataSet = QueryList
    Left = 194
    Top = 162
  end
end
