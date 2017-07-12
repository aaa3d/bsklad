object set_sklad_manager: Tset_sklad_manager
  Left = 553
  Top = 253
  Width = 440
  Height = 144
  Caption = 'Укажите заказчика товара(менеджера) и склад разгрузки'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 18
    Top = 12
    Width = 93
    Height = 13
    Caption = 'Владелец товара :'
  end
  object Label6: TLabel
    Left = 19
    Top = 35
    Width = 92
    Height = 13
    Caption = 'Склад разгрузки :'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object PN_OWNER: TRxDBLookupCombo
    Left = 114
    Top = 8
    Width = 255
    Height = 21
    DropDownCount = 8
    EscapeClear = False
    LookupField = 'KLN_ID'
    LookupDisplay = 'KLN_FIO'
    LookupSource = DataModule1.MainDsMen
    TabOrder = 0
  end
  object SKL: TRxDBLookupCombo
    Left = 114
    Top = 31
    Width = 151
    Height = 21
    DropDownCount = 8
    EscapeClear = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LookupField = 'SKL_ID'
    LookupDisplay = 'SKL_SHORT'
    LookupSource = DataModule1.MainDsSkl
    ParentFont = False
    TabOrder = 1
  end
  object Button1: TButton
    Left = 296
    Top = 72
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = Button1Click
  end
end
