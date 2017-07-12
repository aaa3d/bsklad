object LAST_DIAL: TLAST_DIAL
  Left = 304
  Top = 307
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Справка о последней синхронизации данных магазинами'
  ClientHeight = 213
  ClientWidth = 369
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 0
    Width = 369
    Height = 213
    Align = alClient
    DataSource = DsList
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = RxDBGrid1GetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'SHOP_NAME'
        Title.Alignment = taCenter
        Title.Caption = 'Магазин'
        Width = 222
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM'
        Title.Alignment = taCenter
        Title.Caption = 'Данные на...'
        Visible = True
      end>
  end
  object LastTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 152
    Top = 70
  end
  object QrList: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = LastTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from last_dial(:SHOP_ID)')
    Left = 230
    Top = 70
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SHOP_ID'
        ParamType = ptUnknown
      end>
    object QrListSHOP_NAME: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SHOP_NAME'
      ReadOnly = True
      Size = 254
    end
    object QrListTM: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TM'
      ReadOnly = True
    end
  end
  object DsList: TDataSource
    DataSet = QrList
    Left = 230
    Top = 120
  end
end
