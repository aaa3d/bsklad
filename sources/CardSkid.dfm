object CARD_SKID: TCARD_SKID
  Left = 72
  Top = 202
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Номерные скидки по пластиковым картам'
  ClientHeight = 532
  ClientWidth = 966
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 966
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
    Width = 966
    Height = 503
    Align = alClient
    DataSource = DsSkidSumm
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CARDSKID_NUM'
        Title.Alignment = taCenter
        Title.Caption = '№'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARDSKID_DT1'
        Title.Alignment = taCenter
        Title.Caption = 'Действительна с'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARDSKID_DT2'
        Title.Alignment = taCenter
        Title.Caption = 'по'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARDSKID_NAME'
        Title.Alignment = taCenter
        Title.Caption = 'Описание'
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARDSKID_PERCENT'
        Title.Alignment = taCenter
        Title.Caption = 'Скидка'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARDSKID_TYP'
        Title.Alignment = taCenter
        Title.Caption = 'Тип скидки'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'US_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Кто установил'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM'
        Title.Alignment = taCenter
        Title.Caption = 'Когда установил'
        Visible = True
      end>
  end
  object SkidTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 296
    Top = 60
  end
  object QrSKIDNUM: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SkidTransaction
    AfterOpen = QrSKIDNUMAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select cardskid.*,'
      'kln.kln_fam||" "||kln.kln_name||" "||kln_name2 as us_full'
      'from cardskid,kln'
      'where cardskid.us_id=kln.kln_id'
      'order by cardskid_name')
    Left = 216
    Top = 60
    object QrSKIDNUMCARDSKID_ID: TIntegerField
      FieldName = 'CARDSKID_ID'
      Required = True
    end
    object QrSKIDNUMCARDSKID_NUM: TIBStringField
      FieldName = 'CARDSKID_NUM'
      Required = True
      Size = 32
    end
    object QrSKIDNUMCARDSKID_DT1: TDateTimeField
      FieldName = 'CARDSKID_DT1'
      Required = True
    end
    object QrSKIDNUMCARDSKID_DT2: TDateTimeField
      FieldName = 'CARDSKID_DT2'
      Required = True
    end
    object QrSKIDNUMCARDSKID_NAME: TIBStringField
      FieldName = 'CARDSKID_NAME'
      Required = True
      Size = 254
    end
    object QrSKIDNUMCARDSKID_PERCENT: TFloatField
      FieldName = 'CARDSKID_PERCENT'
      Required = True
      DisplayFormat = '#0.0000%'
    end
    object QrSKIDNUMUS_ID: TIntegerField
      FieldName = 'US_ID'
      Required = True
    end
    object QrSKIDNUMCARDSKID_TYP: TIntegerField
      FieldName = 'CARDSKID_TYP'
      Required = True
    end
    object QrSKIDNUMTM: TDateTimeField
      FieldName = 'TM'
      Required = True
    end
    object QrSKIDNUMUS_FULL: TIBStringField
      FieldName = 'US_FULL'
      Size = 764
    end
  end
  object DsSkidSumm: TDataSource
    DataSet = QrSKIDNUM
    Left = 148
    Top = 60
  end
  object PopupMenu1: TPopupMenu
    Images = DataModule1.ImageList1
    Left = 216
    Top = 132
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
