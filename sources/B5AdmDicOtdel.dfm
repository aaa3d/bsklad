inherited B5Adm_DIC_Otdel: TB5Adm_DIC_Otdel
  Left = 110
  Top = 163
  Caption = 'Справочник отделов'
  ClientHeight = 427
  ClientWidth = 716
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 716
    object BtnNew: TToolButton
      Left = 0
      Top = 2
      Hint = 'Новый фонд'
      Caption = 'BtnNew'
      ImageIndex = 0
      OnClick = BtnNewClick
    end
    object BtnOpen: TToolButton
      Left = 23
      Top = 2
      Hint = 'Изменить фонд'
      Caption = 'BtnOpen'
      ImageIndex = 1
      OnClick = BtnOpenClick
    end
    object BtnDel: TToolButton
      Left = 46
      Top = 2
      Hint = 'Удалить фонд'
      Caption = 'BtnDel'
      ImageIndex = 2
      OnClick = BtnDelClick
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 408
    Width = 716
    Panels = <
      item
        Width = 50
      end>
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 29
    Width = 716
    Height = 379
    Align = alClient
    DataSource = DsOtdel
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
        FieldName = 'OTDEL_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Полное название отдела'
        Width = 675
        Visible = True
      end>
  end
  object OtdelTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 136
    Top = 70
  end
  object QueryOtdel: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = OtdelTransaction
    AfterOpen = QueryOtdelAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select otdel_id,otdel_full'
      'from otdel'
      'order by otdel_full')
    Left = 138
    Top = 126
    object QueryOtdelOTDEL_ID: TIntegerField
      FieldName = 'OTDEL_ID'
      Required = True
    end
    object QueryOtdelOTDEL_FULL: TIBStringField
      FieldName = 'OTDEL_FULL'
      Required = True
      Size = 128
    end
  end
  object DsOtdel: TDataSource
    DataSet = QueryOtdel
    Left = 138
    Top = 180
  end
end
