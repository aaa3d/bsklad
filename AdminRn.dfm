object Admin_RN: TAdmin_RN
  Left = 354
  Top = 275
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Администрирование расходной накладной'
  ClientHeight = 207
  ClientWidth = 393
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 164
    Height = 13
    Caption = 'Изменить номер накладной на :'
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 149
    Height = 13
    Caption = 'Изменить тип накладной на :'
  end
  object Label3: TLabel
    Left = 8
    Top = 56
    Width = 157
    Height = 13
    Caption = 'Изменить Вид реализации на: '
  end
  object TYP: TComboBox
    Left = 188
    Top = 28
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'TYP'
  end
  object BtnOK: TButton
    Left = 304
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Ок'
    TabOrder = 1
    OnClick = BtnOKClick
  end
  object BtnClose: TButton
    Left = 304
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 2
    OnClick = BtnCloseClick
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 100
    Width = 285
    Height = 17
    Caption = 'Провести накладную даже, если товара не хватает'
    TabOrder = 3
  end
  object NUM: TRxCalcEdit
    Left = 188
    Top = 4
    Width = 113
    Height = 21
    AutoSize = False
    DisplayFormat = '#0000000000'
    NumGlyphs = 2
    TabOrder = 4
  end
  object RVID: TRxDBLookupCombo
    Left = 8
    Top = 72
    Width = 365
    Height = 21
    DropDownCount = 8
    LookupField = 'RVID_ID'
    LookupDisplay = 'RVID_NAME'
    LookupSource = DataModule1.MainDsRvid
    TabOrder = 5
  end
  object RN_DOST: TCheckBox
    Left = 7
    Top = 124
    Width = 78
    Height = 17
    Caption = 'Доставка на :'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object DOST_DATE: TDateEdit
    Left = 86
    Top = 124
    Width = 91
    Height = 19
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 7
  end
end
