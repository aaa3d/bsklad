object TW_SHOW_OST_PRIH: TTW_SHOW_OST_PRIH
  Left = 366
  Top = 230
  BorderStyle = bsSingle
  Caption = 'Приходы товара с их остатками'
  ClientHeight = 279
  ClientWidth = 748
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
    Width = 748
    Height = 279
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
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TYP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PNTYP_ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHOP_ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SKL_ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MEN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POST'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_ID2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POST_KOL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_MEN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_POST'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_DT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEB$'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NDS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NDS$'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_SEB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_SEB$'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_NDS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_NDS$'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_TYP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_IDS'
        Visible = True
      end>
  end
  object QrTWPost: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = TWPostTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from a0_analiz_rashod_post_new2(:tw_id, 0, :dt1, :dt2 ,' +
        ':dt_rep)')
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
    object QrTWPostID: TIntegerField
      FieldName = 'ID'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.ID'
    end
    object QrTWPostIDS: TIntegerField
      FieldName = 'IDS'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.IDS'
    end
    object QrTWPostTYP: TIntegerField
      FieldName = 'TYP'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.TYP'
    end
    object QrTWPostPNTYP_ID: TIntegerField
      FieldName = 'PNTYP_ID'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.PNTYP_ID'
    end
    object QrTWPostSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.SHOP_ID'
    end
    object QrTWPostSKL_ID: TIntegerField
      FieldName = 'SKL_ID'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.SKL_ID'
    end
    object QrTWPostDT: TDateTimeField
      FieldName = 'DT'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.DT'
    end
    object QrTWPostMEN: TIntegerField
      FieldName = 'MEN'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.MEN'
    end
    object QrTWPostPOST: TIntegerField
      FieldName = 'POST'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.POST'
    end
    object QrTWPostTW_ID2: TIntegerField
      FieldName = 'TW_ID2'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.TW_ID2'
    end
    object QrTWPostPOST_KOL: TFloatField
      FieldName = 'POST_KOL'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.POST_KOL'
    end
    object QrTWPostBASE_MEN: TIntegerField
      FieldName = 'BASE_MEN'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.BASE_MEN'
    end
    object QrTWPostBASE_POST: TIntegerField
      FieldName = 'BASE_POST'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.BASE_POST'
    end
    object QrTWPostBASE_DT: TDateTimeField
      FieldName = 'BASE_DT'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.BASE_DT'
    end
    object QrTWPostSEB: TFloatField
      FieldName = 'SEB'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.SEB'
    end
    object QrTWPostSEB2: TFloatField
      FieldName = 'SEB$'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.SEB$'
    end
    object QrTWPostNDS: TFloatField
      FieldName = 'NDS'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.NDS'
    end
    object QrTWPostNDS2: TFloatField
      FieldName = 'NDS$'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.NDS$'
    end
    object QrTWPostBASE_SEB: TFloatField
      FieldName = 'BASE_SEB'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.BASE_SEB'
    end
    object QrTWPostBASE_SEB2: TFloatField
      FieldName = 'BASE_SEB$'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.BASE_SEB$'
    end
    object QrTWPostBASE_NDS: TFloatField
      FieldName = 'BASE_NDS'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.BASE_NDS'
    end
    object QrTWPostBASE_NDS2: TFloatField
      FieldName = 'BASE_NDS$'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.BASE_NDS$'
    end
    object QrTWPostBASE_TYP: TIntegerField
      FieldName = 'BASE_TYP'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.BASE_TYP'
    end
    object QrTWPostBASE_ID: TIntegerField
      FieldName = 'BASE_ID'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.BASE_ID'
    end
    object QrTWPostBASE_IDS: TIntegerField
      FieldName = 'BASE_IDS'
      Origin = 'A0_ANALIZ_RASHOD_POST_NEW2.BASE_IDS'
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
