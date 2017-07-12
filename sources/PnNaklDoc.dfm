object PN_NAKL_DOC: TPN_NAKL_DOC
  Left = 164
  Top = 263
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Подчиненные документы'
  ClientHeight = 300
  ClientWidth = 675
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
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 0
    Width = 675
    Height = 300
    Align = alClient
    DataSource = DsWork
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawDataCell = RxDBGrid1DrawDataCell
    OnDrawColumnCell = RxDBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'PN$_PROW'
        Title.Alignment = taCenter
        Title.Caption = ' '
        Width = 16
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KLN_PREFIX'
        Title.Alignment = taCenter
        Title.Caption = 'Фирма'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PN$_NUM_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Номер'
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OWNER_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Владелец'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KLN_ORG'
        Title.Alignment = taCenter
        Title.Caption = 'Поставщик'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PN$_DATE'
        Title.Alignment = taCenter
        Title.Caption = 'Дата'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PN$_DATE_OPL'
        Title.Alignment = taCenter
        Title.Caption = 'Дата оплаты'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PN$_OST'
        Title.Alignment = taRightJustify
        Title.Caption = ' '
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PN$_SUMM'
        Title.Alignment = taCenter
        Title.Caption = 'Сумма'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PN$_NAKL_MET'
        Title.Alignment = taCenter
        Title.Caption = ' '
        Width = 22
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PN$_SUMM2'
        Title.Alignment = taCenter
        Title.Caption = 'Сумма расходов.'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SKL_SHORT'
        Title.Alignment = taCenter
        Title.Caption = 'Склад'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PN$_KURS'
        Title.Alignment = taCenter
        Title.Caption = 'Курс'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PNVID_NAM'
        Title.Alignment = taCenter
        Title.Caption = 'Вид накладной'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'US_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Кто оформил'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PN$_OSN'
        Title.Alignment = taCenter
        Title.Caption = 'Основание'
        Width = 200
        Visible = True
      end>
  end
  object WorkTransaction: TIBTransaction
    Active = True
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 166
    Top = 56
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from pn_nakl_doc(:pn_id)')
    Left = 166
    Top = 114
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pn_id'
        ParamType = ptUnknown
      end>
    object QueryWorkPN_ID: TIntegerField
      FieldName = 'PN$_ID'
      Origin = 'PN_NAKL_DOC.PN$_ID'
    end
    object QueryWorkPN_PROW: TIBStringField
      FieldName = 'PN$_PROW'
      Origin = 'PN_NAKL_DOC.PN$_PROW'
      FixedChar = True
      Size = 1
    end
    object QueryWorkPN_NUM_FULL: TIBStringField
      FieldName = 'PN$_NUM_FULL'
      Origin = 'PN_NAKL_DOC.PN$_NUM_FULL'
      Size = 74
    end
    object QueryWorkPN_DATE: TDateTimeField
      FieldName = 'PN$_DATE'
      Origin = 'PN_NAKL_DOC.PN$_DATE'
    end
    object QueryWorkPN_DATE_OPL: TDateTimeField
      FieldName = 'PN$_DATE_OPL'
      Origin = 'PN_NAKL_DOC.PN$_DATE_OPL'
    end
    object QueryWorkSKL_SHORT: TIBStringField
      FieldName = 'SKL_SHORT'
      Origin = 'PN_NAKL_DOC.SKL_SHORT'
      Size = 32
    end
    object QueryWorkPN_SUMM: TFloatField
      FieldName = 'PN$_SUMM'
      Origin = 'PN_NAKL_DOC.PN$_SUMM'
      DisplayFormat = '#0.00'
    end
    object QueryWorkPN_SUMM2: TFloatField
      FieldName = 'PN$_SUMM2'
      Origin = 'PN_NAKL_DOC.PN$_SUMM2'
      DisplayFormat = '#0.00'
    end
    object QueryWorkPN_COLOR: TIntegerField
      FieldName = 'PN$_COLOR'
      Origin = 'PN_NAKL_DOC.PN$_COLOR'
    end
    object QueryWorkUS_FULL: TIBStringField
      FieldName = 'US_FULL'
      Origin = 'PN_NAKL_DOC.US_FULL'
      Size = 32
    end
    object QueryWorkPNVID_NAM: TIBStringField
      FieldName = 'PNVID_NAM'
      Origin = 'PN_NAKL_DOC.PNVID_NAM'
      Size = 64
    end
    object QueryWorkOWNER_FULL: TIBStringField
      FieldName = 'OWNER_FULL'
      Origin = 'PN_NAKL_DOC.OWNER_FULL'
      Size = 32
    end
    object QueryWorkKLN_ORG: TIBStringField
      FieldName = 'KLN_ORG'
      Origin = 'PN_NAKL_DOC.KLN_ORG'
      Size = 64
    end
    object QueryWorkPN_KURS: TFloatField
      FieldName = 'PN$_KURS'
      Origin = 'PN_NAKL_DOC.PN$_KURS'
      DisplayFormat = '#0.00 р/$'
    end
    object QueryWorkKLN_PREFIX: TIBStringField
      FieldName = 'KLN_PREFIX'
      Origin = 'PN_NAKL_DOC.KLN_PREFIX'
      Size = 32
    end
    object QueryWorkPN_NUM: TIBStringField
      FieldName = 'PN$_NUM'
      Origin = 'PN_NAKL_DOC.PN$_NUM'
      Size = 32
    end
    object QueryWorkPN_OST: TFloatField
      FieldName = 'PN$_OST'
      Origin = 'PN_NAKL_DOC.PN$_OST'
    end
    object QueryWorkPN_OSN: TIBStringField
      FieldName = 'PN$_OSN'
      Origin = 'PN_NAKL_DOC.PN$_OSN'
      Size = 64
    end
    object QueryWorkPN_NAKL_MET: TIntegerField
      FieldName = 'PN$_NAKL_MET'
      Origin = 'PN_NAKL_DOC.PN$_NAKL_MET'
    end
  end
  object DsWork: TDataSource
    DataSet = QueryWork
    Left = 164
    Top = 166
  end
end
