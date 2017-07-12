object Set_NEW_TW: TSet_NEW_TW
  Left = 0
  Top = 111
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Определение нового товара'
  ClientHeight = 282
  ClientWidth = 536
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
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 76
    Height = 13
    Caption = 'Валюта товара'
  end
  object Label2: TLabel
    Left = 344
    Top = 12
    Width = 91
    Height = 13
    Caption = 'Категория товара'
  end
  object CheckBox1: TCheckBox
    Left = 12
    Top = 256
    Width = 377
    Height = 17
    Caption = 'Цена на товар не меняется при изменении курса ценообразования'
    TabOrder = 0
  end
  object RxDBGrid1: TRxDBGrid
    Left = 4
    Top = 28
    Width = 237
    Height = 221
    DataSource = DsVALUTA
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'VALUTA_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Валюта'
        Visible = True
      end>
  end
  object RxDBGrid2: TRxDBGrid
    Left = 244
    Top = 28
    Width = 289
    Height = 221
    DataSource = DsKTG
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = RxDBGrid2GetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'TWKTG_NAM'
        Title.Alignment = taCenter
        Title.Caption = 'Категория'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 452
    Top = 252
    Width = 75
    Height = 25
    Caption = 'Ок'
    TabOrder = 3
    OnClick = Button1Click
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 444
    Top = 84
  end
  object QueryKTG: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    CachedUpdates = False
    SQL.Strings = (
      'select * from twktg')
    Left = 364
    Top = 88
    object QueryKTGTWKTG_ID: TIntegerField
      FieldName = 'TWKTG_ID'
      Required = True
    end
    object QueryKTGTWKTG_NAM: TIBStringField
      FieldName = 'TWKTG_NAM'
      Required = True
      Size = 254
    end
    object QueryKTGTWKTG_PRIM: TIBStringField
      FieldName = 'TWKTG_PRIM'
      Size = 10000
    end
    object QueryKTGTWKTG_COLOR: TIntegerField
      FieldName = 'TWKTG_COLOR'
      Required = True
    end
  end
  object QueryVALUTA: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    CachedUpdates = False
    SQL.Strings = (
      'select * from valuta order by valuta_id')
    Left = 364
    Top = 140
    object QueryVALUTAVALUTA_ID: TIntegerField
      FieldName = 'VALUTA_ID'
      Required = True
    end
    object QueryVALUTAVALUTA_SHORT: TIBStringField
      FieldName = 'VALUTA_SHORT'
      Required = True
      Size = 32
    end
    object QueryVALUTAVALUTA_FULL: TIBStringField
      FieldName = 'VALUTA_FULL'
      Required = True
      Size = 254
    end
    object QueryVALUTAVALUTA_AUTO1: TIBStringField
      FieldName = 'VALUTA_AUTO1'
      Required = True
      Size = 254
    end
    object QueryVALUTAVALUTA_AUTO2: TIBStringField
      FieldName = 'VALUTA_AUTO2'
      Required = True
      Size = 254
    end
    object QueryVALUTAVALUTA_AUTO3: TIBStringField
      FieldName = 'VALUTA_AUTO3'
      Required = True
      Size = 254
    end
    object QueryVALUTAVALUTA_AUTO11: TIBStringField
      FieldName = 'VALUTA_AUTO11'
      Size = 254
    end
    object QueryVALUTAVALUTA_AUTO12: TIBStringField
      FieldName = 'VALUTA_AUTO12'
      Size = 254
    end
    object QueryVALUTAVALUTA_AUTO13: TIBStringField
      FieldName = 'VALUTA_AUTO13'
      Size = 254
    end
  end
  object DsKTG: TDataSource
    DataSet = QueryKTG
    Left = 276
    Top = 92
  end
  object DsVALUTA: TDataSource
    DataSet = QueryVALUTA
    Left = 276
    Top = 148
  end
end
