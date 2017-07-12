object MAKE_COMPLEX_RN: TMAKE_COMPLEX_RN
  Left = 343
  Top = 219
  Width = 445
  Height = 590
  Anchors = [akLeft, akTop, akRight]
  Caption = 'Создание сводных расходных накладных'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 28
    Top = 8
    Width = 158
    Height = 13
    Caption = 'Создать накладные за период:'
  end
  object Label2: TLabel
    Left = 28
    Top = 60
    Width = 189
    Height = 13
    Caption = 'Исходный тип расходных накладных:'
  end
  object Label3: TLabel
    Left = 28
    Top = 114
    Width = 183
    Height = 13
    Caption = 'Тип сводных расходных накладных:'
  end
  object DateEdit1: TDateEdit
    Left = 28
    Top = 24
    Width = 125
    Height = 21
    DefaultToday = True
    NumGlyphs = 2
    TabOrder = 0
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 28
    Top = 76
    Width = 389
    Height = 21
    DropDownCount = 8
    LookupField = 'RNTYP_ID'
    LookupDisplay = 'RNTYP_FULL'
    LookupSource = DataModule1.MainDsRnTyp
    TabOrder = 1
  end
  object RxDBLookupCombo2: TRxDBLookupCombo
    Left = 28
    Top = 128
    Width = 389
    Height = 21
    DropDownCount = 8
    LookupField = 'RNTYP_ID'
    LookupDisplay = 'RNTYP_FULL'
    LookupSource = DataModule1.MainDsRnTyp
    TabOrder = 2
  end
  object Button1: TButton
    Left = 304
    Top = 160
    Width = 115
    Height = 25
    Caption = 'Создать накладные'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 28
    Top = 192
    Width = 389
    Height = 363
    Anchors = [akLeft, akTop, akBottom]
    ReadOnly = True
    TabOrder = 4
  end
  object DateEdit2: TDateEdit
    Left = 176
    Top = 24
    Width = 125
    Height = 21
    DefaultToday = True
    NumGlyphs = 2
    TabOrder = 5
  end
  object PROC_FRM: TComboBox
    Left = 304
    Top = 24
    Width = 117
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
    OnChange = PROC_FRMChange
    Items.Strings = (
      'Олимпия ОПТ'
      'Олимпия Розница'
      'ТК Олимпия')
  end
end
