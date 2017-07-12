object EDIT_CARD_REG: TEDIT_CARD_REG
  Left = 425
  Top = 276
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Пластиковые карты.'
  ClientHeight = 266
  ClientWidth = 677
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 36
    Width = 55
    Height = 13
    Caption = 'Владелец :'
  end
  object Label2: TLabel
    Left = 14
    Top = 60
    Width = 66
    Height = 13
    Caption = 'Диапазон с :'
  end
  object Label3: TLabel
    Left = 208
    Top = 62
    Width = 18
    Height = 13
    Caption = 'по :'
  end
  object Label6: TLabel
    Left = 10
    Top = 158
    Width = 113
    Height = 13
    Caption = 'Клиент по умолчанию:'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 677
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = ActSave
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 2
      Action = ActApply
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 247
    Width = 677
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object GroupBox1: TGroupBox
    Left = 4
    Top = 84
    Width = 659
    Height = 65
    Caption = 'Начальные условия :'
    TabOrder = 2
    object Label4: TLabel
      Left = 412
      Top = 18
      Width = 12
      Height = 13
      Caption = 'c :'
    end
    object Label5: TLabel
      Left = 532
      Top = 18
      Width = 18
      Height = 13
      Caption = 'по :'
    end
    object Check_Usl1: TRadioButton
      Left = 12
      Top = 18
      Width = 161
      Height = 17
      Caption = 'Фиксированный процент :'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = Check_Usl1Click
    end
    object Percent_Combo: TRxDBLookupCombo
      Left = 168
      Top = 14
      Width = 175
      Height = 21
      DropDownCount = 8
      EscapeClear = False
      LookupField = 'CARDSKID_ID'
      LookupDisplay = 'CARDSKID_NAME'
      LookupSource = DsSkid
      TabOrder = 1
      OnChange = Percent_ComboChange
    end
    object DBEdit1: TDBEdit
      Left = 344
      Top = 14
      Width = 65
      Height = 21
      DataField = 'CARDSKID_PERCENT'
      DataSource = DsSkid
      Enabled = False
      TabOrder = 2
    end
    object Check_usl2: TRadioButton
      Left = 12
      Top = 40
      Width = 333
      Height = 17
      Caption = 'Скидки по накопительной сумме. На карту записать сумму :'
      TabOrder = 3
      OnClick = Check_Usl1Click
    end
    object USL2_SUMM: TRxCalcEdit
      Left = 344
      Top = 38
      Width = 121
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00 руб'
      NumGlyphs = 2
      TabOrder = 4
      OnChange = USL2_SUMMChange
    end
    object DBDateEdit1: TDBDateEdit
      Left = 426
      Top = 14
      Width = 101
      Height = 21
      DataField = 'CARDSKID_DT1'
      DataSource = DsSkid
      Enabled = False
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 5
    end
    object DBDateEdit2: TDBDateEdit
      Left = 554
      Top = 14
      Width = 101
      Height = 21
      DataField = 'CARDSKID_DT2'
      DataSource = DsSkid
      Enabled = False
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 6
    end
  end
  object CARD_NAME: TEdit
    Left = 82
    Top = 32
    Width = 581
    Height = 21
    MaxLength = 64
    TabOrder = 3
    Text = 'CARD_NAME'
    OnChange = CARD_NAMEChange
  end
  object DIAP1: TRxSpinEdit
    Left = 82
    Top = 56
    Width = 121
    Height = 21
    Alignment = taRightJustify
    MaxValue = 2147483646
    MinValue = 1
    Value = 1
    TabOrder = 4
    OnChange = DIAP1Change
  end
  object DIAP2: TRxSpinEdit
    Left = 230
    Top = 56
    Width = 121
    Height = 21
    Alignment = taRightJustify
    MaxValue = 2147483646
    MinValue = 1
    Value = 1
    TabOrder = 5
    OnChange = DIAP2Change
  end
  object KLN: TEdit
    Left = 128
    Top = 154
    Width = 513
    Height = 21
    Enabled = False
    TabOrder = 6
    Text = 'KLN'
  end
  object BTN_KLN: TBitBtn
    Left = 640
    Top = 154
    Width = 25
    Height = 21
    Hint = 'Поменять клиента (F10)'
    TabOrder = 7
    TabStop = False
    OnClick = BTN_KLNClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
      0555088888888888805508000000000088055080FFFFFF0508800000000000F0
      F0800FFFFFFFFF0F008050F00F00FFF0F08050FFFFFFFFF0F080000FFFFFFFFF
      00000900F00000F00090090FFFFFFFFF0090000FFFFFFFFF0F00550F000F00FF
      0F05550FFFFFFFFF0005550FFF00000005555550005555555555}
  end
  object GroupBox2: TGroupBox
    Left = 4
    Top = 178
    Width = 301
    Height = 67
    Caption = ' Учет карт '
    TabOrder = 8
    object Check_uch1: TRadioButton
      Left = 8
      Top = 20
      Width = 159
      Height = 17
      Caption = 'Каждую по отдельности'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = Check_uch1Click
    end
    object Check_uch2: TRadioButton
      Left = 8
      Top = 40
      Width = 285
      Height = 17
      Caption = 'Все покупки по всем картам суммировать на одну'
      TabOrder = 1
      OnClick = Check_uch1Click
    end
  end
  object Check_activ: TCheckBox
    Left = 312
    Top = 226
    Width = 117
    Height = 17
    Caption = 'Обслуживаются'
    Checked = True
    State = cbChecked
    TabOrder = 9
    OnClick = Check_activClick
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 600
    Top = 110
    object ActApply: TAction
      Caption = 'Применить...'
      Hint = 'Применить...'
      ImageIndex = 38
      ShortCut = 16467
      OnExecute = ActApplyExecute
    end
    object ActSave: TAction
      Caption = 'Сохранить...'
      Hint = 'Сохранить...'
      ImageIndex = 39
      ShortCut = 16397
      OnExecute = ActSaveExecute
    end
  end
  object CardTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 514
    Top = 14
  end
  object QuerySkid: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = CardTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select cardskid_id,cardskid_dt1,cardskid_dt2,cardskid_percent,ca' +
        'rdskid_typ,'
      'cardskid_name'
      'from cardskid'
      'order by cardskid_percent')
    Left = 514
    Top = 62
    object QuerySkidCARDSKID_ID: TIntegerField
      FieldName = 'CARDSKID_ID'
      Origin = 'CARDSKID.CARDSKID_ID'
      Required = True
    end
    object QuerySkidCARDSKID_DT1: TDateTimeField
      FieldName = 'CARDSKID_DT1'
      Origin = 'CARDSKID.CARDSKID_DT1'
      Required = True
    end
    object QuerySkidCARDSKID_DT2: TDateTimeField
      FieldName = 'CARDSKID_DT2'
      Origin = 'CARDSKID.CARDSKID_DT2'
      Required = True
    end
    object QuerySkidCARDSKID_PERCENT: TFloatField
      FieldName = 'CARDSKID_PERCENT'
      Origin = 'CARDSKID.CARDSKID_PERCENT'
      Required = True
      DisplayFormat = '#0.00%'
    end
    object QuerySkidCARDSKID_TYP: TIntegerField
      FieldName = 'CARDSKID_TYP'
      Origin = 'CARDSKID.CARDSKID_TYP'
      Required = True
    end
    object QuerySkidCARDSKID_NAME: TIBStringField
      FieldName = 'CARDSKID_NAME'
      Origin = 'CARDSKID.CARDSKID_NAME'
      Required = True
      Size = 254
    end
  end
  object DsSkid: TDataSource
    DataSet = QuerySkid
    Left = 522
    Top = 134
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 600
    Top = 16
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 598
    Top = 62
  end
end
