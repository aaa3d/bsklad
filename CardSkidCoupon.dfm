object CARD_SKID_COUPON: TCARD_SKID_COUPON
  Left = 480
  Top = 223
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Купоны на скидку'
  ClientHeight = 432
  ClientWidth = 785
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 785
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object BtnNew: TToolButton
      Left = 0
      Top = 2
      Hint = 'Новая'
      Caption = 'BtnNew'
      ImageIndex = 0
      OnClick = BtnNewClick
    end
    object BtnOpen: TToolButton
      Left = 25
      Top = 2
      Hint = 'Изменить'
      Caption = 'BtnOpen'
      ImageIndex = 1
      OnClick = BtnOpenClick
    end
    object BtnDel: TToolButton
      Left = 50
      Top = 2
      Hint = 'Удалить'
      Caption = 'BtnDel'
      ImageIndex = 2
      OnClick = BtnDelClick
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 29
    Width = 785
    Height = 403
    Align = alClient
    DataSource = DsSkidSumm
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMBER'
        Title.Caption = 'номер'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMM'
        Title.Caption = 'Сумма скидки'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNT'
        Title.Caption = 'тираж'
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Ко-во использованых'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WORK_DT_START'
        Title.Caption = 'Дата начала акции'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WORK_DT_END'
        Title.Caption = 'Дата окончания акции'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCR'
        Title.Caption = 'Описание'
        Width = 200
        Visible = True
      end>
  end
  object SkidTransaction: TIBTransaction
    Active = True
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 296
    Top = 60
  end
  object QrCoupon: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SkidTransaction
    AfterOpen = QrCouponAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CARDSKID_COUPON'
      'ORDER BY WORK_DT_START DESC')
    Left = 184
    Top = 172
    object QrCouponCARDSKID_COUPON_ID: TIntegerField
      FieldName = 'CARDSKID_COUPON_ID'
      Origin = 'CARDSKID_COUPON.CARDSKID_COUPON_ID'
      Required = True
    end
    object QrCouponTM: TDateTimeField
      FieldName = 'TM'
      Origin = 'CARDSKID_COUPON.TM'
    end
    object QrCouponNUMBER: TIBStringField
      FieldName = 'NUMBER'
      Origin = 'CARDSKID_COUPON.NUMBER'
    end
    object QrCouponSUMM: TIntegerField
      FieldName = 'SUMM'
      Origin = 'CARDSKID_COUPON.SUMM'
    end
    object QrCouponCNT: TIntegerField
      FieldName = 'CNT'
      Origin = 'CARDSKID_COUPON.CNT'
    end
    object QrCouponWORK_DT_START: TDateTimeField
      FieldName = 'WORK_DT_START'
      Origin = 'CARDSKID_COUPON.WORK_DT_START'
    end
    object QrCouponWORK_DT_END: TDateTimeField
      FieldName = 'WORK_DT_END'
      Origin = 'CARDSKID_COUPON.WORK_DT_END'
    end
    object QrCouponWORK_DAYS: TIBStringField
      FieldName = 'WORK_DAYS'
      Origin = 'CARDSKID_COUPON.WORK_DAYS'
      Size = 7
    end
    object QrCouponTW_DYN_GROUP_ID: TIntegerField
      FieldName = 'TW_DYN_GROUP_ID'
      Origin = 'CARDSKID_COUPON.TW_DYN_GROUP_ID'
    end
    object QrCouponTW_DYN_GROUP_TYP: TIntegerField
      FieldName = 'TW_DYN_GROUP_TYP'
      Origin = 'CARDSKID_COUPON.TW_DYN_GROUP_TYP'
    end
    object QrCouponUS_ID: TIntegerField
      FieldName = 'US_ID'
      Origin = 'CARDSKID_COUPON.US_ID'
    end
    object QrCouponWORK_TM_START: TDateTimeField
      FieldName = 'WORK_TM_START'
      Origin = 'CARDSKID_COUPON.WORK_TM_START'
    end
    object QrCouponWORK_TM_END: TDateTimeField
      FieldName = 'WORK_TM_END'
      Origin = 'CARDSKID_COUPON.WORK_TM_END'
    end
    object QrCouponDESCR: TStringField
      FieldName = 'DESCR'
      Size = 254
    end
  end
  object DsSkidSumm: TDataSource
    DataSet = QrCoupon
    Left = 148
    Top = 60
  end
  object PopupMenu1: TPopupMenu
    Images = DataModule1.ImageList1
    Left = 400
    Top = 212
    object MnNew: TMenuItem
      Caption = 'Новая'
      ImageIndex = 0
      ShortCut = 45
      OnClick = BtnNewClick
    end
    object MnOpen: TMenuItem
      Caption = 'Изменить'
      ImageIndex = 1
      ShortCut = 13
      OnClick = BtnOpenClick
    end
    object MnDel: TMenuItem
      Caption = 'Удалить'
      ImageIndex = 2
      ShortCut = 46
      OnClick = BtnDelClick
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 448
    Top = 88
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 448
    Top = 140
  end
end
