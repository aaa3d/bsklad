object Select_VALUTA: TSelect_VALUTA
  Left = 185
  Top = 179
  BorderStyle = bsToolWindow
  Caption = 'Выбор валюты товара'
  ClientHeight = 238
  ClientWidth = 308
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 0
    Width = 308
    Height = 238
    Align = alClient
    DataSource = DsValuta
    Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
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
        FieldName = 'VALUTA_FULL'
        Visible = True
      end>
  end
  object ValutaTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 116
    Top = 32
  end
  object QueryValuta: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ValutaTransaction
    AfterOpen = QueryValutaAfterOpen
    CachedUpdates = False
    SQL.Strings = (
      'select valuta_id,valuta_full,valuta_short from valuta'
      'order by valuta_id')
    Left = 192
    Top = 32
    object QueryValutaVALUTA_ID: TIntegerField
      FieldName = 'VALUTA_ID'
      Required = True
    end
    object QueryValutaVALUTA_FULL: TIBStringField
      FieldName = 'VALUTA_FULL'
      Required = True
      Size = 254
    end
    object QueryValutaVALUTA_SHORT: TIBStringField
      FieldName = 'VALUTA_SHORT'
      Required = True
      Size = 32
    end
  end
  object DsValuta: TDataSource
    DataSet = QueryValuta
    Left = 256
    Top = 32
  end
end
