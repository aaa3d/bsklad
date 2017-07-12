object TW_SHOW_OST_PRIH: TTW_SHOW_OST_PRIH
  Left = 391
  Top = 261
  BorderStyle = bsSingle
  Caption = 'Приходы товара с их остатками'
  ClientHeight = 310
  ClientWidth = 542
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 0
    Width = 542
    Height = 310
    Align = alClient
    BorderStyle = bsNone
    DataSource = DsTWPost
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PN_TYP'
        Title.Caption = 'Тип прихода'
        Width = 232
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_KOL'
        Title.Caption = 'Остаток'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PN_DATE'
        Title.Caption = 'Дата прихода'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_DT'
        Title.Caption = 'Дата осн. прихода'
        Visible = True
      end>
  end
  object QrTWPost: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = TWPostTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select case when dt <> base_dt then '#39'Приход от внутреннего поста' +
        'вщика'#39' else '#39'Приход от обычного поставщика'#39' end PN_TYP,'
      
        'dt PN_DATE, post_kol TW_KOL, base_dt  from a0_analiz_rashod_post' +
        '_new2(:tw_id, 0, :dt1, :dt2 ,:dt_rep, null)')
    Left = 156
    Top = 50
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TW_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_rep'
        ParamType = ptUnknown
      end>
    object QrTWPostPN_TYP: TIBStringField
      FieldName = 'PN_TYP'
      FixedChar = True
      Size = 32
    end
    object QrTWPostPN_DATE: TDateTimeField
      FieldName = 'PN_DATE'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.DT'
    end
    object QrTWPostTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.POST_KOL'
      DisplayFormat = '#0.00'
    end
    object QrTWPostBASE_DT: TDateTimeField
      FieldName = 'BASE_DT'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.BASE_DT'
    end
  end
  object DsTWPost: TDataSource
    DataSet = QrTWPost
    Left = 52
    Top = 74
  end
  object TWPostTransaction: TIBTransaction
    Active = True
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 160
    Top = 109
  end
end
