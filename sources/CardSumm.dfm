object CARD_SUMM: TCARD_SUMM
  Left = 150
  Top = 130
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Скидки по накопительной сумме при использвании дисконтной карты'
  ClientHeight = 348
  ClientWidth = 599
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
    Width = 599
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
    Width = 599
    Height = 319
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
        FieldName = 'CARDSKIDSUMM_SUMM'
        Title.Alignment = taCenter
        Title.Caption = 'Сумма'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARDSKIDSUMM_PERCENT'
        Title.Alignment = taCenter
        Title.Caption = 'Скидка'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'US_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Кто установил'
        Width = 256
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
    Left = 296
    Top = 60
  end
  object QrSKIDSUMM: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SkidTransaction
    AfterOpen = QrSKIDSUMMAfterOpen
    CachedUpdates = False
    SQL.Strings = (
      'select cardskidsumm.*,'
      'kln.kln_fam||" "||kln.kln_name||" "||kln_name2 as us_full'
      'from cardskidsumm,kln'
      'where cardskidsumm.us_id=kln.kln_id'
      'order by cardskidsumm_summ')
    Left = 216
    Top = 60
    object QrSKIDSUMMCARDSKIDSUMM_ID: TIntegerField
      FieldName = 'CARDSKIDSUMM_ID'
      Required = True
    end
    object QrSKIDSUMMCARDSKIDSUMM_SUMM: TFloatField
      FieldName = 'CARDSKIDSUMM_SUMM'
      DisplayFormat = ',#0.00 руб'
    end
    object QrSKIDSUMMCARDSKIDSUMM_PERCENT: TFloatField
      FieldName = 'CARDSKIDSUMM_PERCENT'
      Required = True
      DisplayFormat = '#0.000%'
    end
    object QrSKIDSUMMUS_ID: TIntegerField
      FieldName = 'US_ID'
      Required = True
    end
    object QrSKIDSUMMTM: TDateTimeField
      FieldName = 'TM'
      Required = True
    end
    object QrSKIDSUMMUS_FULL: TIBStringField
      FieldName = 'US_FULL'
      Size = 764
    end
  end
  object DsSkidSumm: TDataSource
    DataSet = QrSKIDSUMM
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
end
